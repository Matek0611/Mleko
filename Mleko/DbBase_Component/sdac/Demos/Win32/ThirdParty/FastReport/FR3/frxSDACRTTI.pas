{******************************************}
{                                          }
{             FastReport v3.20             }
{          SDAC components RTTI            }
{                                          }

// Created by: CoreLab
// E-mail: sdac@crlab.com

{                                          }
{******************************************}

unit frxSDACRTTI;

interface

{$I frx.inc}

implementation

uses
  Windows, Classes, fs_iinterpreter, frxSDACComponents
{$IFDEF Delphi6}
, Variants
{$ENDIF};


type
  TFunctions = class(TfsRTTIModule)
  private
    function CallMethod(Instance: TObject; ClassType: TClass;
      const MethodName: String; Caller: TfsMethodHelper): Variant;
  public
    constructor Create(AScript: TfsScript); override;
  end;

{ TFunctions }

constructor TFunctions.Create(AScript: TfsScript);
begin
  inherited Create(AScript);
  with AScript do
  begin
    AddClass(TfrxSDACDatabase, 'TfrxCustomDatabase');
    AddClass(TfrxSDACTable, 'TfrxCustomTable');
    with AddClass(TfrxSDACQuery, 'TfrxCustomQuery') do
      AddMethod('procedure ExecSQL', CallMethod);
  end;
end;

function TFunctions.CallMethod(Instance: TObject; ClassType: TClass;
  const MethodName: String; Caller: TfsMethodHelper): Variant;
begin
  Result := 0;
  if ClassType = TfrxSDACQuery then
  begin
    if MethodName = 'EXECSQL' then
      TfrxSDACQuery(Instance).Query.Execute;
  end
end;

initialization
  fsRTTIModules.Add(TFunctions);

end.
