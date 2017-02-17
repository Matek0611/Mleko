unit MlekoUtils;

interface

uses
  Windows, Classes, SysUtils, SysProcs, Data, CFLMLKCustom, CFLMLKSelect;

type
  TTimeTracer = class
  private
    FTime: Int64;
    pCreationTime, pExitTime, pKernelTime, pUserTime: Int64;
    FProcessHandle: THandle;
    FIsSuccess: Boolean;
    FFreq, FStartCount, FStopCount: int64;
    FLastTime: TDateTime;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Start;
    procedure Stop;
    property IsSuccess: Boolean read FIsSuccess;
    property LastTime: TDateTime read FLastTime;
  end;

function EncodeSecretValue(Value, Secret: Integer): Integer;

function DecodeSecretValue(Code: Integer; var Secret: Integer): Integer;

function Ctrl_Is_Down(): Boolean;

function Shift_Is_Down(): Boolean;

function Alt_Is_Down(): Boolean;

function SelectMLKItemsByDialog(MLKForm: TCFLMLKCustomForm; Items: TStrings;
         OwnerName, ParamName, ParamCode: string; MultiSelect: Boolean = True): Integer;

implementation

constructor TTimeTracer.Create;
begin
  inherited Create;
  FProcessHandle := GetCurrentProcess;
  QueryPerformanceFrequency(FFreq);
  FIsSuccess := FFreq <> 0;
end;

destructor TTimeTracer.Destroy;
begin
  inherited Destroy;
end;

procedure TTimeTracer.Start;
begin
//  FIsSuccess:=GetProcessTimes(FProcessHandle, TFileTime(pCreationTime), TFileTime(pExitTime), TFileTime(pKernelTime), TFileTime(pUserTime));
  QueryPerformanceCounter(FStartCount);
end;

procedure TTimeTracer.Stop;
begin
//  FIsSuccess:=FIsSuccess and GetProcessTimes(FProcessHandle, TFileTime(pCreationTime), TFileTime(pExitTime), TFileTime(pKernelTime), TFileTime(pUserTime));
  QueryPerformanceCounter(FStopCount);
  if FIsSuccess then
    FLastTime := (FStopCount - FStartCount) / FFreq
  else
    FLastTime := -1;
end;

function EncodeSecretValue(Value, Secret: Integer): Integer;
asm
        test    EAX, EAX  // if (Code<0) then
        js      @Quit       // go to @Quit
        mov     AH, DL   // Result:= Secret * 256 + Value;

@Quit:
end;

function DecodeSecretValue(Code: Integer; var Secret: Integer): Integer;
asm
        mov     DWORD PTR[EDX], 0         // Secret = 0
        test    EAX, EAX                  // if (Code<0) then
        js      @Quit                       // go to @Quit
        movzx   ECX, AH                 // ECX = AH (32 bit <- 8 bit)
        mov     DWORD PTR[EDX], ECX    // Secret:= Code div 256;
        AND     EAX, $FF                // Result = Code mod 256;

@Quit:
end;

function Ctrl_Is_Down(): Boolean;
var
  State: TKeyboardState;
begin
  GetKeyboardState(State);
  Result := ((State[VK_CONTROL] and 128) <> 0);
end;

function Shift_Is_Down(): Boolean;
var
  State: TKeyboardState;
begin
  GetKeyboardState(State);
  Result := ((State[VK_SHIFT] and 128) <> 0);
end;

function Alt_Is_Down(): Boolean;
var
  State: TKeyboardState;
begin
  GetKeyboardState(State);
  Result := ((State[VK_MENU] and 128) <> 0);
end;

function SelectMLKItemsByDialog(MLKForm: TCFLMLKCustomForm; Items: TStrings;
  OwnerName, ParamName, ParamCode: string; MultiSelect: Boolean = True): Integer;
var
  Keys: TStrings;
  i, c, v: Integer;
  l_res_sql, l_param_code, l_query_filter, l_param_name, l_owner, lv_key_field,
    lv_txt_field, lv_table_name, lv_select_entity_class, l_style: string;
  is_multiselect: boolean;
begin
  Result := -1;
  l_owner := OwnerName;
  l_param_name := UpperCase(ParamName);
  l_param_code := ParamCode;
  l_query_filter := '';
  l_style := 'unknown';
  //l_query_filter := dmDataModule.parse_flt_sql(c.SqlFilter, l_owner, l_param_name);
  is_multiselect := MultiSelect;
  if TCFLMLKSelectDlg.OpenHoldSelect(l_Owner, l_param_name, l_param_code,
    is_multiselect, l_query_filter, l_style) then
  begin
    Keys := TStringList.Create;
    try
      Result := dmDataModule.get_selected_value(OwnerName, ParamName, ParamCode,
        Items, Keys);
      for i := 0 to Result - 1 do
      begin
        Val(Keys[i], v, c);
        if (c = 0) then
          Items.Objects[i] := Pointer(v)
        else
          Items[i] := Items[i] + '=' + Keys[i];
      end;
    finally
      Keys.Free;
    end;
  end;
end;

end.


