
{******************************************}
{                                          }
{             FastScript v1.9              }
{        SDAC classes and functions        }
{                                          }
{          Created by: CoreLab             }
{         E-mail: sdac@crlab.com           }
{                                          }
{******************************************}

unit fs_isdacrtti;

interface

{$i fs.inc}

uses
  SysUtils, Classes, fs_iinterpreter, fs_itools, fs_idbrtti, fs_idacrtti, DB,
  OLEDBAccess, MSAccess;

type
  TfsSDACRTTI = class(TComponent); // fake component

implementation

type
  TfsMSConnectionInfoMessageEvent = class(TfsCustomEvent)
  public
    procedure DoEvent(Sender: TObject; E: EMSError);
    function GetMethod: Pointer; override;
  end;

  TFunctions = class(TfsRTTIModule)
  private
    function CallMethod(Instance: TObject; ClassType: TClass;
      const MethodName: String; Caller: TfsMethodHelper): Variant;
    function GetProp(Instance: TObject; ClassType: TClass;
      const PropName: String): Variant;
    procedure SetProp(Instance: TObject; ClassType: TClass;
      const PropName: String; Value: Variant);
  public
    constructor Create(AScript: TfsScript); override;
  end;

{ TfsMSConnectionInfoMessageEvent }
  
procedure TfsMSConnectionInfoMessageEvent.DoEvent(Sender: TObject; E: EMSError);
begin
  CallHandler([Sender, E]);
end;

function TfsMSConnectionInfoMessageEvent.GetMethod: Pointer;
begin
  Result := @TfsFieldGetTextEvent.DoEvent;
end;
  
{ TFunctions }

constructor TFunctions.Create(AScript: TfsScript);
begin
  inherited Create(AScript);
  
  with AScript do begin
    with AddClass(TMSConnection, 'TCustomDAConnection') do begin
      AddMethod('procedure ChangePassword(NewPassword: string)', CallMethod);
      AddProperty('ClientVersion', 'string', GetProp);
      AddProperty('ServerVersion', 'string', GetProp);
      AddEvent('OnInfoMessage', TfsMSConnectionInfoMessageEvent);
    end;
    AddEnum('TIsolationLevel', 'ilReadCommitted, ilReadUnCommitted, ilRepeatableRead, ilIsolated, ilSnapshot');
    AddEnum('TMSAuthentication', 'auWindows, auServer');

    AddClass(TMSConnectionOptions, 'TDAConnectionOptions');
    AddEnum('TOLEDBProvider', 'prAuto, prSQL, prNativeClient, prCompact');
    
    with AddClass(TCustomMSDataSet, 'TCustomDADataSet') do begin
      AddMethod('function OpenNext: boolean', CallMethod);
      AddMethod('procedure BreakExec', CallMethod);
      AddMethod('procedure RefreshQuick(const CheckDeleted: boolean)', CallMethod);

      AddProperty('CursorType', 'TMSCursorType', GetProp, SetProp);
      AddProperty('CommandTimeout', 'integer', GetProp, SetProp);
    end;
    AddEnum('TMSCursorType', 'ctDefaultResultSet, ctStatic, ctKeyset, ctDynamic');
    AddClass(TMSDataSetOptions, 'TDADataSetOptions');
    AddClass(TMSParams, 'TDAParams');
    AddClass(TMSQuery, 'TCustomMSDataSet');

    with AddClass(TMSTable, 'TCustomMSDataSet') do begin
      AddMethod('procedure PrepareSQL', CallMethod);
      AddProperty('TableName', 'string', GetProp, SetProp);
      AddProperty('OrderFields', 'string', GetProp, SetProp);
    end;
    
    with AddClass(TMSStoredProc, 'TCustomMSDataSet') do begin
      AddMethod('procedure ExecProc', CallMethod);
      AddMethod('procedure PrepareSQL', CallMethod);
      AddProperty('UpdatingTable', 'string', GetProp, SetProp);
      AddProperty('StoredProcName', 'string', GetProp, SetProp);
    end;
  end;
end;

function TFunctions.CallMethod(Instance: TObject; ClassType: TClass;
  const MethodName: String; Caller: TfsMethodHelper): Variant;
begin
  Result := 0;

  if ClassType = TMSConnection then begin
    if MethodName = 'CHANGEPASSWORD' then
      TMSConnection(Instance).ChangePassword(Caller.Params[0]);
  end
  else
  if ClassType = TCustomMSDataSet then begin
    if MethodName = 'OPENNEXT' then
      Result := TCustomMSDataSet(Instance).OpenNext
    else
    if MethodName = 'BREAKEXEC' then
      TCustomMSDataSet(Instance).BreakExec
    else
    if MethodName = 'REFRESHQUICK' then
      TCustomMSDataSet(Instance).RefreshQuick(Caller.Params[0]);
  end
  else
  if ClassType = TMSTable then begin
    if MethodName = 'PREPARESQL' then
      TMSTable(Instance).PrepareSQL;
  end
  else
  if ClassType = TMSStoredProc then begin
    if MethodName = 'EXECPROC' then
      TMSStoredProc(Instance).ExecProc
    else
    if MethodName = 'PREPARESQL' then
      TMSStoredProc(Instance).PrepareSQL;
  end;
end;

function TFunctions.GetProp(Instance: TObject; ClassType: TClass;
  const PropName: String): Variant;
begin
  Result := 0;

  if ClassType = TMSConnection then begin
    if PropName = 'CLIENTVERSION' then
      Result := TMSConnection(Instance).ClientVersion
    else
    if PropName = 'SERVERVERSION' then
      Result := TMSConnection(Instance).ServerVersion
  end
  else
  if ClassType = TCustomMSDataSet then begin
    if PropName = 'CURSORTYPE' then
      Result := Integer(TCustomMSDataSet(Instance).CursorType)
    else
    if PropName = 'COMMANDTIMEOUT' then
      Result := TCustomMSDataSet(Instance).CommandTimeout;
  end
  else
  if ClassType = TMSTable then begin
    if PropName = 'TABLENAME' then
      Result := TMSTable(Instance).TableName
    else
    if PropName = 'ORDERFIELDS' then
      Result := TMSTable(Instance).OrderFields;
  end
  else
  if ClassType = TMSStoredProc then begin
    if PropName = 'UPDATINGTABLE' then
      Result := TMSStoredProc(Instance).UpdatingTable
    else
    if PropName = 'STOREDPROCNAME' then
      Result := TMSStoredProc(Instance).StoredProcName;
  end;
end;

procedure TFunctions.SetProp(Instance: TObject; ClassType: TClass;
  const PropName: String; Value: Variant);
begin
  if ClassType = TCustomMSDataSet then begin
    if PropName = 'CURSORTYPE' then
      TCustomMSDataSet(Instance).CursorType := TMSCursorType(Integer(Value))
    else
    if PropName = 'COMMANDTIMEOUT' then
      TCustomMSDataSet(Instance).CommandTimeout := Value;
  end
  else
  if ClassType = TMSTable then begin
    if PropName = 'TABLENAME' then
      TMSTable(Instance).TableName := Value
    else
    if PropName = 'ORDERFIELDS' then
      TMSTable(Instance).OrderFields := Value;
  end
  else
  if ClassType = TMSStoredProc then begin
    if PropName = 'UPDATINGTABLE' then
      TMSStoredProc(Instance).UpdatingTable := Value
    else
    if PropName = 'STOREDPROCNAME' then
      TMSStoredProc(Instance).StoredProcName := Value;
  end;
end;

initialization
  fsRTTIModules.Add(TFunctions);

finalization
  if fsRTTIModules <> nil then
    fsRTTIModules.Remove(TFunctions);

end.

