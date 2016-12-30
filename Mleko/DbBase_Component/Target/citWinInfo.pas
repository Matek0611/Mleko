unit citWinInfo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, typinfo;


const
  PredefinedStrs : array[0..9] of string =
    ('CompanyName', 'FileDescription', 'FileVersion', 'InternalName', 'LegalCopyright',
     'LegalTrademarks', 'OriginalFilename', 'ProductName', 'ProductVersion', 'Comments');

type
  TcitVersion = class(TComponent)
  private
    FBuffer : Pointer;
    FHandle : DWORD;
    FLastSucceeded : boolean;
    FAllocSize : integer;
    FFixedFileInfo : TVSFixedFileInfo;
    FLocaleID : integer;
    FCharSet : integer;
    FTranslation : string;
    FFileName : string;

    function GetOSInfo : string;
    function GetMemTotal : integer;
    function GetKeyValue(Key : string) : string;
    function GetKeyValueByIndex(Index : integer) : string;
    procedure RetrieveVerInfo(AFileName : string);
    procedure SetFileName(Value : string);
  public
    property KeyValue[Key : string] : string read GetKeyValue;
    property CompanyName : string          index 0 read GetKeyValueByIndex;
    property FileDescription : string      index 1 read GetKeyValueByIndex;
    property FileVersion : string          index 2 read GetKeyValueByIndex;
    property InternalName : string         index 3 read GetKeyValueByIndex;
    property LegalCopyright : string       index 4 read GetKeyValueByIndex;
    property LegalTrademarks : string      index 5 read GetKeyValueByIndex;
    property OriginalFilename : string     index 6 read GetKeyValueByIndex;
    property ProductName : string          index 7 read GetKeyValueByIndex;
    property ProductVersion : string       index 8 read GetKeyValueByIndex;
    property Comments : string             index 9 read GetKeyValueByIndex;
    property FixedFileInfo : TVSFixedFileInfo read FFixedFileInfo;
    property LocaleID : integer read FLocaleID;
    property CharSet : integer read FCharSet;
    property OSInfo : string read GetOSInfo;
    property MemTotal : integer read GetMemTotal;
    property LastSucceeded : boolean read FLastSucceeded;

    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
  published
    property FileName : string read FFileName write SetFileName;
  end;



procedure Register;

implementation

constructor TcitVersion.Create(AOwner : TComponent);
begin
  inherited;
  if not(csDesigning in ComponentState) then FFileName := Application.ExeName;
  RetrieveVerInfo(Application.ExeName);
end;

destructor TcitVersion.Destroy;
begin
  if FAllocSize > 0 then FreeMem(FBuffer, FAllocSize);
  inherited;
end;

procedure TcitVersion.RetrieveVerInfo(AFileName : string);
var
  P : Pointer;
  Len : DWORD;//integer;
begin
  FLastSucceeded := False;
  FAllocSize := GetFileVersionInfoSize(PChar(AFileName), FHandle);
  if FAllocSize > 0 then
  try
    if FBuffer <> nil then ReallocMem(FBuffer, FAllocSize)
                      else GetMem(FBuffer, FAllocSize);
    FLastSucceeded := GetFileVersionInfo(PChar(AFileName), FHandle, FAllocSize, FBuffer);
  except
    FLastSucceeded := False;
    raise;
  end;
  if not FLastSucceeded then Exit;

  VerQueryValue(FBuffer, PChar('\VarFileInfo\Translation'), Pointer(P), Len);
  FLocaleID := LoWord(Longint(P^));
  FCharSet := HiWord(Longint(P^));
  FTranslation := IntToHex(MakeLong(FCharSet, FLocaleID), 8);
  VerQueryValue(FBuffer, '\', P, Len);
  FFixedFileInfo := PVSFixedFileInfo(P)^;
end;

function TcitVersion.GetKeyValue(Key : string) : string;
var
  CurName : array[0..255] of char;
  Len : DWORD;
  P : Pointer;
begin
  StrPCopy(CurName, '\StringFileInfo\' + FTranslation + '\' + Key);
  FLastSucceeded := VerQueryValue(FBuffer, CurName, P, Len);
  if FLastSucceeded then Result := StrPas(PChar(P))
                    else Result := ''
end;

procedure TcitVersion.SetFileName(Value : string);
begin
  if (FFileName = Value) or (Value = '') then Exit;
  FFileName := Value;
  RetrieveVerInfo(Value);
end;

function TcitVersion.GetKeyValueByIndex(Index : integer) : string;
begin
  Result := KeyValue[PredefinedStrs[Index]];
end;

function TcitVersion.GetOSInfo : string;
var
  Platform: string;
  BuildNumber: Integer;
begin
  Result := '';

  case Win32Platform of
    VER_PLATFORM_WIN32_WINDOWS:
      begin
        Platform := 'Windows 95';
        BuildNumber := Win32BuildNumber and $0000FFFF;
      end;
    VER_PLATFORM_WIN32_NT:
      begin
        Platform := 'Windows NT';
        BuildNumber := Win32BuildNumber;
      end;
      else
      begin
        Platform := 'Windows';
        BuildNumber := 0;
      end;
  end;

  if (Win32Platform = VER_PLATFORM_WIN32_WINDOWS) or
    (Win32Platform = VER_PLATFORM_WIN32_NT) then
  begin
    if Win32CSDVersion = '' then
      Result := Format('%s %d.%d (Build %d)', [Platform, Win32MajorVersion,
        Win32MinorVersion, BuildNumber])
    else
      Result := Format('%s %d.%d (Build %d: %s)', [Platform, Win32MajorVersion,
        Win32MinorVersion, BuildNumber, Win32CSDVersion]);
  end
  else
    Result := Format('%s %d.%d', [Platform, Win32MajorVersion,
      Win32MinorVersion])
end;

function TcitVersion.GetMemTotal : integer;
var
  MS: TMemoryStatus;
begin
  MS.dwLength := SizeOf(TMemoryStatus);
  GlobalMemoryStatus(MS);
  Result := MS.dwTotalPhys;
end;

procedure Register;
begin
  RegisterComponents('Target', [TcitVersion]);
end;

end.
 