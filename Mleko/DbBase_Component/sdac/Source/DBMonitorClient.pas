
{$IFNDEF CLR}

{$I Dac.inc}

unit DBMonitorClient;
{$ENDIF}
interface

uses
{$IFDEF MSWINDOWS}
  Windows, DBMonitorIntf,
{$ENDIF}
  Classes;

{$IFDEF MSWINDOWS}
  function GetDBMonitor: IDBMonitor;
  function GetDBMonitorVersion: string;
{$ENDIF}

  function HasMonitor: boolean;
  function WhereMonitor: string;

implementation

uses
  SysUtils
{$IFDEF CLR}
  ,System.IO
{$ENDIF}
{$IFDEF MSWINDOWS}
  ,ComObj, ActiveX, Registry
{$ENDIF};

{$IFDEF MSWINDOWS}
const
  sDBMonitorKey  = 'Software\CoreLab\DBMonitor';
{$ENDIF}

function WhereMonitor: string;
{$IFDEF MSWINDOWS}
var
  FRegIniFile: TRegIniFile;
{$ENDIF}
begin
{$IFDEF MSWINDOWS}
  FRegIniFile := TRegIniFile.Create(sDBMonitorKey);
  try
    Result := FRegIniFile.ReadString('', 'Self', '');
  finally
    FRegIniFile.Free;
  end;
{$ELSE}
  Result := '';
{$ENDIF}
end;

function HasMonitor: boolean;
begin
{$IFDEF MSWINDOWS}
  Result := FileExists(WhereMonitor);
{$ELSE}
  Result := False;
{$ENDIF}
end;

{$IFDEF MSWINDOWS}
function GetDBMonitor: IDBMonitor;
var
{$IFDEF CLR}
  Obj: TObject;
{$ELSE}
  Obj: IUnknown;
{$ENDIF}
begin
  with TRegistry.Create do
  try
    RootKey := HKEY_CLASSES_ROOT;
  {$IFDEF CLR}
    if OpenKeyReadOnly('CLSID\{' + GUIDToString(Class_DBMonitor) + '}\InprocServer32')
  {$ELSE}
    if OpenKeyReadOnly('CLSID\' + GUIDToString(Class_DBMonitor) + '\InprocServer32')  // cr-d 21517
  {$ENDIF}
    then begin
      if FileExists(ReadString('')) then begin
      {$IFDEF CLR}
        Obj := CreateComObject(Class_DBMonitor);
        Result := Obj as IDBMonitor;
      {$ELSE}
        Obj := CreateComObject(Class_DBMonitor);
        Obj.QueryInterface(IDBMonitor, Result);
      {$ENDIF}
      end;
//      else;
//      Check download
      CloseKey;
    end
    else
    begin
      Result := nil;
      if HasMonitor then
        raise Exception.Create('Current DBMonitor version is out of date. Please update.');
//      Check download
    end;
  finally
    Free;
  end;
end;

function GetDBMonitorVersion: string;
var
  DBMonitor: IDBMonitor;
{$IFDEF WIN32}
  pVersion: PChar;
{$ENDIF}
begin
  result := 'not available';
  try
    DBMonitor := GetDBMonitor;
    if DBMonitor <> nil then begin
    {$IFDEF CLR}
      DBMonitor.GetVersion(Result);
    {$ELSE}
      CoInitialize(nil);
      try
        DBMonitor.GetVersion(pVersion);
      finally
        CoUninitialize;
      end;
      Result := pVersion;
    {$ENDIF}
    end
  except
  end;
end;

{$ENDIF}

end.
