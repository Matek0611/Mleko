
{******************************************}
{                                          }
{             FastReport v4.0              }
{      SDAC components design editors      }
{                                          }

// Created by: CoreLab
// E-mail: sdac@crlab.com

{                                          }
{******************************************}

unit frxSDACEditor;

interface

{$I frx.inc}

implementation

uses
  Windows, SysUtils, Classes, frxClass, frxDsgnIntf, frxCustomDB, DB,
  MSAccess, OLEDBAccess, OLEDBC, SdacVcl, frxRes, frxSDACComponents, frxDACEditor
{$IFDEF Delphi6}
, Variants
{$ENDIF};


type
  TfrxMSDatabaseProperty = class(TfrxComponentProperty)
  public
    function GetValue: String; override;
  end;

  TfrxMSTableNameProperty = class(TfrxTableNameProperty)
  public
    procedure GetValues; override;
  end;

{ TfrxMSDatabaseProperty }

function TfrxMSDatabaseProperty.GetValue: String;
var
  db: TfrxSDACDatabase;
begin
  db := TfrxSDACDatabase(GetOrdValue);
  if db = nil then
  begin
    if (SDACComponents <> nil) and (SDACComponents.DefaultDatabase <> nil) then
      Result := SDACComponents.DefaultDatabase.Name
    else
      Result := frxResources.Get('prNotAssigned');
  end
  else
    Result := inherited GetValue;
end;

{ TfrxMSTableNameProperty }

procedure TfrxMSTableNameProperty.GetValues;
begin
  inherited;
  with TfrxSDACTable(Component).Table do
    if Connection <> nil then
      Connection.GetTableNames(Values);
end;

initialization
  frxPropertyEditors.Register(TypeInfo(TfrxSDACDatabase), TfrxSDACTable, 'Database',
    TfrxMSDatabaseProperty);
  frxPropertyEditors.Register(TypeInfo(TfrxSDACDatabase), TfrxSDACQuery, 'Database',
    TfrxMSDatabaseProperty);
  frxPropertyEditors.Register(TypeInfo(String), TfrxSDACTable, 'TableName',
    TfrxMSTableNameProperty);

end.
