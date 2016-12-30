unit MlekoSelectDhead;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKSelect, DBAccess, MsAccess, DB, COMPSQLBuilder, ActnList,
  citComponentProps, ExtCtrls, comp_TargetFilter_Panel, StdCtrls, ComCtrls,
  ToolWin, Grids, DBGrids, citDbGrid, comp_TargetFilter_CustomFilter,
  comp_TargetFilter_StringFilter, comp_TargetFilter_DateFilter, citCtrls,
  citDBComboEdit, citmask, MemDS, comp_TargetFilter_DictionaryFilter;

type
  TMlekoSelectDheadDlg = class(TCFLMLKSelectDlg)
    ftNom: TTargetFilter_StringFilter;
    ftDateNakl: TTargetFilter_DateFilter;
    Panel1: TPanel;
    ftTovar: TcitDBComboEdit;
    Panel4: TPanel;
    ftOtdel: TcitDBComboEdit;
    quDepts: TMSQuery;
    quDeptsOtdelNo: TSmallintField;
    quDeptsOtdelName: TStringField;
    FilterFirm: TTargetFilter_DictionaryFilter;
    Panel2: TPanel;
    DBEdType: TcitDBComboEdit;
    QuDocType: TMSQuery;
    QuDocTypename: TStringField;
    QuDocTypeID: TIntegerField;
    procedure SQLBuilderGetParams(Sender: TObject; var Params: TParams);
    function ftTovarIsSelect(Sender: TObject): Boolean;
    procedure FormShow(Sender: TObject);
    procedure ftOtdelSelectOk(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function FilterFirma_OnSelectValue(
      Sender: TTargetFilter_DictionaryFilter; BtnBoundsRect: TRect;
      ConditionType: TDictionaryConditionType;
      ConditionGroup: TDictionaryConditionGroup; var Rec_PK,
      Rec_Title: Variant): Boolean;
  private
    { Private declarations }
  public
    class function SelectRashod(var aFirmId: integer): boolean;
  end;

var
  MlekoSelectDheadDlg: TMlekoSelectDheadDlg;
  ln_dept_id: integer;

implementation

uses main, data, MlekoSelectTovar, MlekoSelectFIrm;

{$R *.dfm}

class function TMlekoSelectDheadDlg.SelectRashod(var aFirmId: integer): boolean;
var
  lv_firmId: string;
begin
  inherited;
  if OpenSelect(aFirmId, true) then
  begin
    result := true;
  end
  else
    result := false;
end;

procedure TMlekoSelectDheadDlg.SQLBuilderGetParams(Sender: TObject;
  var Params: TParams);
var
  otdel, tovar, is_show_all_tov: integer;
  doc_type_id, is_all_doc_type: Integer;
begin
  inherited;
  if ftOtdel.Text = '' then
    otdel := main.GlobalOtdelNo
  else
    otdel := StrTOInt(ftOtdel.KeyFieldValue);

  if DBEdType.Text = '' then
  begin
    is_all_doc_type := 1;
    doc_type_id := 0;
  end
  else
  begin
    is_all_doc_type := 0;
    doc_type_id := StrToInt(DBEdType.KeyFieldValue);    
  end;
  if ftTovar.Text = '' then
  begin
    is_show_all_tov := 1
  end
  else
  begin
    is_show_all_tov := 0;
    tovar := StrToInt(ftTovar.KeyFieldValue);
  end;

  with Params.CreateParam(ftInteger, 'P_OTDELNO', ptInput) do
    AsInteger := otdel;
  with Params.CreateParam(ftInteger, 'P_SHOW_ALL', ptInput) do
    AsInteger := otdel;
  with Params.CreateParam(ftInteger, 'p_tovarno', ptInput) do
    AsInteger := tovar;
  with Params.CreateParam(ftInteger, 'is_show_all_tov', ptInput) do
    AsInteger := is_show_all_tov;
  with Params.CreateParam(ftInteger, 'doc_type_id', ptInput) do
    AsInteger := doc_type_id;
  with Params.CreateParam(ftInteger, 'is_all_doc_type', ptInput) do
    AsInteger := is_all_doc_type;

end;

function TMlekoSelectDheadDlg.ftTovarIsSelect(Sender: TObject): Boolean;
var
  ID: Integer;
begin
  inherited;
  result := TMlekoSelectTovarDlg.SelectTovar(ID);
  if Result then
  begin
    dmDataModule.quWork.SQL.Clear;
    dmDataModule.quWork.SQL.Add('select NameTovar from Tovar where TovarNo=' + IntToStr(ID));
    dmDataModule.quWork.Open;
    (Sender as TcitCustomEdit).Text := dmDataModule.quWork.FieldByName('NameTovar').AsString;
    (Sender as TcitDBComboEdit).KeyFieldValue := IntToStr(ID);
  end;
end;

procedure TMlekoSelectDheadDlg.FormShow(Sender: TObject);
begin
  inherited;
  ftOtdel.LocateKey := true;
  ftOtdel.KeyFieldValue := IntToStr(main.GlobalOtdelNo);
  ftOtdel.GetLocateKey;
end;

procedure TMlekoSelectDheadDlg.ftOtdelSelectOk(Sender: TObject);
begin
  inherited;
  if ftOtdel.Text = '' then
    ln_dept_id := -1
  else
    ln_dept_id := StrToInt(ftOtdel.KeyFieldValue);
end;

procedure TMlekoSelectDheadDlg.FormCreate(Sender: TObject);
begin
  inherited;
  ftDateNakl.a_Minimum := Main.GlobalDateNakl;
  ftDateNakl.a_Maximum := Main.GlobalDateNakl;
end;

function TMlekoSelectDheadDlg.FilterFirma_OnSelectValue(
  Sender: TTargetFilter_DictionaryFilter; BtnBoundsRect: TRect;
  ConditionType: TDictionaryConditionType;
  ConditionGroup: TDictionaryConditionGroup; var Rec_PK,
  Rec_Title: Variant): Boolean;
var
  ID: integer;
begin
  inherited;
  if VarIsNull(Rec_PK) then
    ID := 0
  else
    ID := Rec_PK;
  Result := TMlekoSelectFirmDlg.SelectFirm(ID);
  if Result then
  begin
    Rec_PK := ID;
    dmDataModule.quWork.SQL.Clear;
    dmDataModule.quWork.SQL.Add('select NameLong from Post where PostNo=' + IntToStr(ID));
    dmDataModule.quWork.Open;
    Rec_Title := dmDataModule.quWork.FieldByName('NameLong').AsString;
  end;
end;

initialization
  RegisterClass(TMLEKOSELECTDHEADDLG);

finalization
  UnRegisterClass(TMLEKOSELECTDHEADDLG);

end.

