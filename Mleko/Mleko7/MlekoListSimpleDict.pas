unit MlekoListSimpleDict;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MSAccess, Menus, citComponentProps, DB, MemDS,
  DBAccess, COMPSQLBuilder, ActnList, citDbGrid, ExtCtrls,
  comp_TargetFilter_Panel, ComCtrls, ToolWin, CFLMLKMDIChild, 
  cxGraphics, cxDataStorage, cxEdit,
  cxDBData, cxTextEdit, cxCalc, cxSpinEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, StdCtrls, MlekoListSimple,
  cxStyles, cxCustomData, cxFilter, cxData;

type
  TMlekoListSimpleDictForm = class(TMlekoListSimpleForm)
  private
    FTableName: String;
    procedure SetTableName(const Value: String);
  protected
    procedure OnSetKeyFieds; override;
    { Private declarations }
  public
    class procedure ShowForm(pTableName: String); overload;
    property TableName:String read FTableName write SetTableName;
  end;

var
  MlekoListSimpleDictForm: TMlekoListSimpleDictForm;

implementation

uses data;

{$R *.dfm}

procedure TMlekoListSimpleDictForm.OnSetKeyFieds;
begin
  inherited;
  KeyFields.Add('ID');
end;

procedure TMlekoListSimpleDictForm.SetTableName(const Value: String);
begin
  FTableName := Value;
  Query.MacroByName('TableName').Value:=Value;
end;

class procedure TMlekoListSimpleDictForm.ShowForm(pTableName: String);
begin
  With Create(Application) do
  begin
     TableName:=pTableName;
     ActionViewRefresh.Execute;
  end;
end;



end.
