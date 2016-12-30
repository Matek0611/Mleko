
{******************************************}
{                                          }
{             FastReport v3.20             }
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
  MSAccess, OLEDBAccess, OLEDBC, SdacVcl, frxSDACComponents, frxDACEditor
{$IFDEF Delphi6}
, Variants
{$ENDIF};


type
  TfrxMSTableNameProperty = class(TfrxTableNameProperty)
  public
    procedure GetValues; override;
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
    TfrxDatabaseProperty);
  frxPropertyEditors.Register(TypeInfo(TfrxSDACDatabase), TfrxSDACQuery, 'Database',
    TfrxDatabaseProperty);
  frxPropertyEditors.Register(TypeInfo(String), TfrxSDACTable, 'TableName',
    TfrxMSTableNameProperty);

end.
