unit AnalisCuttingMesh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, GridsEh, DBGridEh, ExtCtrls, StdCtrls, DB,
  DBAccess, MSAccess, MemDS, Mask, DBCtrlsEh, DBLookupEh, ComCtrls, ToolWin;

type
  TAnalisCuttingMeshForm = class(TMlekoForm)
    GroupBox1: TGroupBox;
    DBGridEh1: TDBGridEh;
    ToolBar: TToolBar;
    ToolBtnRefresh: TToolButton;
    ToolButton5: TToolButton;
    cbBrandFilter: TDBLookupComboboxEh;
    quAnalisCuttingMesh: TMSQuery;
    dsAnalisCuttingMesh: TMSDataSource;
    dsAnalisCuttingMeshBrandFilter: TMSDataSource;
    quAnalisCuttingMeshBrandFilter: TMSQuery;
    quAnalisCuttingMeshPostNo: TIntegerField;
    quAnalisCuttingMeshPostName: TStringField;
    quAnalisCuttingMeshTovarNo: TIntegerField;
    quAnalisCuttingMeshNameTovar: TStringField;
    quAnalisCuttingMeshKolFirst: TFloatField;
    quAnalisCuttingMeshKolOst: TFloatField;
    quAnalisCuttingMeshGroupCutting: TStringField;
    quAnalisCuttingMeshPercentGroupCutting: TIntegerField;
    quAnalisCuttingMeshPercentFact: TFloatField;
    Label1: TLabel;
    Label2: TLabel;
    DataFilter: TDBDateTimeEditEh;
    quAnalisCuttingMeshBrandFilterid: TIntegerField;
    quAnalisCuttingMeshBrandFilterVidName: TStringField;
    Label3: TLabel;
    quAnalisCuttingMeshTovarFilter: TMSQuery;
    dsAnalisCuttingMeshTovarFilter: TMSDataSource;
    cbTovarFilter: TDBLookupComboboxEh;
    quAnalisCuttingMeshTovarFilterid: TIntegerField;
    quAnalisCuttingMeshTovarFilterNameTovar: TStringField;
    Label4: TLabel;
    quAnalisCuttingMeshGroupFilter: TMSQuery;
    dsAnalisCuttingMeshGroupFilter: TMSDataSource;
    cbGroupFilter: TDBLookupComboboxEh;
    quAnalisCuttingMeshGroupFilterGroupCuttingId: TIntegerField;
    quAnalisCuttingMeshGroupFilterGroupCutting: TStringField;
    procedure ToolBtnRefreshClick(Sender: TObject);
    procedure DataFilterChange(Sender: TObject);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AnalisCuttingMeshForm: TAnalisCuttingMeshForm;

implementation

{$R *.dfm}

procedure TAnalisCuttingMeshForm.ToolBtnRefreshClick(Sender: TObject);
begin
  inherited;

  quAnalisCuttingMesh.Close;
  if cbBrandFilter.Text <> '' then quAnalisCuttingMesh.ParamByName('VidNo').Value := quAnalisCuttingMeshBrandFilterid.AsInteger
                              else quAnalisCuttingMesh.ParamByName('VidNo').Clear;
  if cbTovarFilter.Text <> '' then quAnalisCuttingMesh.ParamByName('TovarNo').Value := quAnalisCuttingMeshTovarFilterid.AsInteger
                              else quAnalisCuttingMesh.ParamByName('TovarNo').Clear;
  if cbGroupFilter.Text <> '' then quAnalisCuttingMesh.ParamByName('GroupCuttingId').Value := quAnalisCuttingMeshGroupFilterGroupCuttingId.AsInteger
                              else quAnalisCuttingMesh.ParamByName('GroupCuttingId').Clear;
  quAnalisCuttingMesh.Open;

end;

procedure TAnalisCuttingMeshForm.DataFilterChange(Sender: TObject);
begin
  inherited;
  quAnalisCuttingMesh.Close;
  quAnalisCuttingMesh.ParamByName('DateNakl').Value := DataFilter.Value;
  quAnalisCuttingMesh.Close;
end;

procedure TAnalisCuttingMeshForm.DBGridEh1TitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
begin
  inherited;
  quAnalisCuttingMesh.Close;
  case ACol of
    1: quAnalisCuttingMesh.MacroByName('_order').Value := ' k.PostName';
    3: quAnalisCuttingMesh.MacroByName('_order').Value := ' k.NameTovar';
    7: quAnalisCuttingMesh.MacroByName('_order').Value := ' k.GroupCutting';
  end;
  quAnalisCuttingMesh.Open;
end;

end.



