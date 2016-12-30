unit WriteOffCosts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, DB, DBAccess, MSAccess, MemDS, StdCtrls, ExtCtrls,
  ActnList, GridsEh, DBGridEh, Buttons, DBCtrls, Mask, RxMemDS;

type
  TWriteOffCostsForm = class(TMlekoForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    quWriteOffCosts: TMSQuery;
    dsWriteOffCosts: TMSDataSource;
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    ScrollBox: TScrollBox;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    EditDate: TDBEdit;
    EditSumma: TDBEdit;
    EditSpravka: TDBEdit;
    deNom: TDBEdit;
    lcPost: TDBLookupComboBox;
    lcTipNakl: TDBLookupComboBox;
    lcSotrud: TDBLookupComboBox;
    dsPlatP: TDataSource;
    quPlatP: TMSQuery;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    DSBuh: TDataSource;
    QuBuh: TMSQuery;
    DSPost: TDataSource;
    quPost: TMSQuery;
    mdSpravka: TRxMemoryData;
    quWriteOffCostsNom: TIntegerField;
    quWriteOffCostsDatePlat: TDateTimeField;
    quWriteOffCostsOtdel: TStringField;
    quWriteOffCostsSumma: TFloatField;
    quWriteOffCostsSummaDolg: TFloatField;
    quWriteOffCostsSumOplat: TFloatField;
    quWriteOffCostsPlatNo: TIntegerField;
    mdSpravkaNom: TIntegerField;
    mdSpravkaSumma: TFloatField;
    quPlatPPlatNo: TIntegerField;
    quPlatPDatePlat: TDateTimeField;
    quPlatPNom: TIntegerField;
    quPlatPPostNo: TSmallintField;
    quPlatPPostNoFirst: TSmallintField;
    quPlatPSumma: TFloatField;
    quPlatPBuh: TSmallintField;
    quPlatPSotrudNo: TIntegerField;
    quPlatPSpravka: TStringField;
    quPlatPUserNo: TSmallintField;
    quPlatPSummaDolg: TFloatField;
    quPlatPFreeSumma: TFloatField;
    quPlatPOurFirmNo: TIntegerField;
    quPlatPPkey: TLargeintField;
    quWriteOffCostsSotrudNo: TIntegerField;
    quWriteOffCostsBuh: TSmallintField;
    quMaxNom: TMSQuery;
    quMaxNomNom: TIntegerField;
    spModify_Plat_Nakl_link: TMSStoredProc;
    quWriteOffCostsEntityTypeName: TStringField;
    quWriteOffCostsSpravka: TStringField;
    quWriteOffCostsBuhTypeName: TStringField;
    Label8: TLabel;
    quOtdel: TMSQuery;
    dsOtdel: TMSDataSource;
    quOtdelOtdelNo: TSmallintField;
    quOtdelOtdelName: TStringField;
    quOtdelmanager_team_id: TSmallintField;
    quOtdelOtdelPostNo: TIntegerField;
    quOtdelpkey: TLargeintField;
    quOtdelnew_otdel_no: TSmallintField;
    quOtdelarea_id: TLargeintField;
    quOtdelbrand_type_id: TLargeintField;
    lcOtdel: TDBLookupComboBox;
    quPlatPOtdelNo: TIntegerField;
    quPlatPactivity_type_id: TSmallintField;
    quPlatPRESPONSE_DEPT_ID: TIntegerField;
    stResponse_dept_id: TStaticText;
    stActivity_type_id: TStaticText;
    Label9: TLabel;
    Label10: TLabel;
    lcPlatType: TDBLookupComboBox;
    quPlatType: TMSQuery;
    quPlatTypeID: TSmallintField;
    quPlatTypeName: TStringField;
    dsPlatType: TMSDataSource;
    quPlatPTipPlat: TSmallintField;
    Label11: TLabel;
    quPlatPVidRashodNo: TIntegerField;
    procedure quWriteOffCostsAfterInsert(DataSet: TDataSet);
    procedure quWriteOffCostsAfterPost(DataSet: TDataSet);
    procedure quPlatPAfterPost(DataSet: TDataSet);
    procedure quPlatPAfterUpdateExecute(Sender: TCustomMSDataSet;
      StatementTypes: TStatementTypes; Params: TMSParams);
    procedure quPlatPBeforeUpdateExecute(Sender: TCustomMSDataSet;
      StatementTypes: TStatementTypes; Params: TMSParams);
    procedure quPlatPNewRecord(DataSet: TDataSet);
    procedure quWriteOffCostsBeforePost(DataSet: TDataSet);
    procedure bbOkClick(Sender: TObject);
    procedure EditDateExit(Sender: TObject);
    procedure dsOtdelDataChange(Sender: TObject; Field: TField);
    procedure DBGridEh1Enter(Sender: TObject);
    procedure DBGridEh1ColExit(Sender: TObject);
  private
    { Private declarations }
    l_PlatNo: integer;
    SummaDolg: double;
    Buh: boolean;
    PKeyPlat: Int64;
  public
    { Public declarations }
  end;

var
  WriteOffCostsForm: TWriteOffCostsForm;

implementation

uses data;

{$R *.dfm}

procedure TWriteOffCostsForm.quWriteOffCostsAfterInsert(DataSet: TDataSet);
begin
  inherited;
  quWriteOffCosts.Cancel;
end;

procedure TWriteOffCostsForm.quWriteOffCostsAfterPost(DataSet: TDataSet);
var
  Rec: TBookmarkStr;
  Summa: double;
  Spravka: string;
begin
  mdSpravka.First;
  if mdSpravka.Locate('Nom', quWriteOffCostsNom.AsInteger, []) then
  begin
    if quWriteOffCostsSumOplat.AsFloat = 0 then
    begin
      mdSpravka.Delete;
    end
    else
    begin
      mdSpravka.Edit;
      mdSpravkaSumma.AsFloat := quWriteOffCostsSumOplat.AsFloat;
      mdSpravka.Post;
      mdSpravka.Refresh;
    end;
  end
  else
  begin
    if quWriteOffCostsSumOplat.AsFloat <> 0 then
    begin
      mdSpravka.Insert;
      mdSpravkaNom.AsInteger := quWriteOffCostsNom.AsInteger;
      mdSpravkaSumma.AsFloat := quWriteOffCostsSumOplat.AsFloat;
      mdSpravka.Post;
      mdSpravka.Refresh;
    end;
  end;
  mdSpravka.First;
  mdSpravka.SortOnFields('Nom', True, False);
  if mdSpravka.RecordCount > 0 then
  begin
    mdSpravka.First;
    while not mdSpravka.Eof do
    begin
      format('; %s-%2f', [IntToStr(mdSpravkaNom.AsInteger), mdSpravkaSumma.AsFloat]);
      Spravka := Spravka + format('; %s-%2f', [IntToStr(mdSpravkaNom.AsInteger), mdSpravkaSumma.AsFloat]);
      mdSpravka.Next;
    end;
    Spravka := Copy(Spravka, 2, Length(Spravka));
    Spravka := 'Расход денег. № ' + Spravka;
  end
  else
    Spravka := '';

  quPlatP.FieldByName('Spravka').AsString := Spravka;
  Rec := quWriteOffCosts.Bookmark;
  quWriteOffCosts.DisableControls;
  quWriteOffCosts.First;
  Summa := 0;
  while not quWriteOffCosts.EOF do
  begin
    Summa := Summa + quWriteOffCostsSumOplat.AsFloat;
    quWriteOffCosts.Next;
  end;
  quPlatP.FieldByName('Summa').AsFloat := Summa;
  quWriteOffCosts.Bookmark := Rec;
  quWriteOffCosts.EnableControls;
end;


procedure TWriteOffCostsForm.quPlatPAfterPost(DataSet: TDataSet);
begin
  TMSQuery(DataSet).Close;
  TMSQuery(DataSet).ParamByName('pPkey').Value := PKeyPlat;
  TMSQuery(DataSet).Open;
end;

procedure TWriteOffCostsForm.quPlatPAfterUpdateExecute(
  Sender: TCustomMSDataSet; StatementTypes: TStatementTypes;
  Params: TMSParams);
begin
  inherited;
  if stInsert in StatementTypes then
  begin
    PKeyPlat := Params.ParamByName('Pkey').Value;
  end;
end;

procedure TWriteOffCostsForm.quPlatPBeforeUpdateExecute(
  Sender: TCustomMSDataSet; StatementTypes: TStatementTypes;
  Params: TMSParams);
begin
  inherited;
  if stInsert in StatementTypes then
  begin
    Params.ParamByName('Pkey').ParamType := ptOutput;
  end;
end;

procedure TWriteOffCostsForm.quPlatPNewRecord(DataSet: TDataSet);
begin
  quPlatP.FieldByName('DatePlat').AsDateTime := Date();
  quPlatP.FieldByName('Buh').AsInteger := 1;
  quPlatP.FieldByName('Summa').AsFloat := quWriteOffCostsSumOplat.AsFloat; //0;
  quPlatP.FieldByName('UserNo').AsInteger := Data.UserNo;
  quPlatP.FieldByName('OurFIrmNo').AsInteger := dmDataModule.FirmNo;
end;

procedure TWriteOffCostsForm.quWriteOffCostsBeforePost(DataSet: TDataSet);
begin
  inherited;
  if quWriteOffCosts.State in [dsInsert, dsEdit] then begin end;
end;

procedure TWriteOffCostsForm.bbOkClick(Sender: TObject);
begin
  inherited;
  quPlatP.Post;
  quWriteOffCosts.First;
  while not quWriteOffCosts.Eof do
   begin
     if quWriteOffCostsSumOplat.AsFloat > 0 then
      begin
        spModify_Plat_Nakl_link.Close;
        spModify_Plat_Nakl_link.Params.ParamByName('p_ID').Value := -1;
        spModify_Plat_Nakl_link.Params.ParamByName('p_entityNo_1').Value := quWriteOffCostsPlatNo.AsInteger;
        spModify_Plat_Nakl_link.Params.ParamByName('p_entityNo_2').Value := quPlatP.FieldByName('PlatNo').AsInteger;
        spModify_Plat_Nakl_link.Params.ParamByName('p_Entity_Type_1').Value := 'PLATR';
        spModify_Plat_Nakl_link.Params.ParamByName('p_Entity_Type_2').Value := 'PLATP';
        spModify_Plat_Nakl_link.Params.ParamByName('p_Link_Summa').Value := quWriteOffCostsSumOplat.AsFloat;
        spModify_Plat_Nakl_link.Params.ParamByName('p_UserNo').Value := data.UserNo;
        spModify_Plat_Nakl_link.ExecProc;
      end;
     quWriteOffCosts.Next;
   end;
end;

procedure TWriteOffCostsForm.EditDateExit(Sender: TObject);
begin
  dmDataModule.quSetup.Close;
  dmDataModule.quSetup.Open;
  if StrToDate(EditDate.Text) < dmDataModule.quSetupDateBlock.AsDateTime then
  begin
    MessageDlg('Период заблокирован!!!', mtError, [mbOk], 0);
    ActiveControl := EditDate;
  end;
  dmDataModule.quSetup.Close;
end;

procedure TWriteOffCostsForm.dsOtdelDataChange(Sender: TObject;
  Field: TField);
var
  D_RESPONSE_DEPT_ID, D_ACTIVITY_TYPE_ID : integer;
  D_RESPONSE_DEPT_IDSTR, D_ACTIVITY_TYPE_IDSTR : string;
begin
  inherited;

  if (lcOtdel.KeyValue > 0) then
   begin
     dmDataModule.OpenSQL('select D_RESPONSE_DEPT_ID, D_ACTIVITY_TYPE_ID from l_VidOtdelProp s where s.OtdelNo= :p1_OtdelNo', [lcOtdel.KeyValue]);
     D_RESPONSE_DEPT_ID := dmDataModule.qfo.FieldByName('D_RESPONSE_DEPT_ID').AsInteger;
     D_ACTIVITY_TYPE_ID := dmDataModule.qfo.FieldByName('D_ACTIVITY_TYPE_ID').AsInteger;

     quPlatP.FieldByName('RESPONSE_DEPT_ID').AsInteger := D_RESPONSE_DEPT_ID;
     quPlatP.FieldByName('activity_type_id').AsInteger := D_ACTIVITY_TYPE_ID;

     dmDataModule.OpenSQL('select (select Name from D_RESPONSE_DEPT where id = :p1_D_RESPONSE_DEPT_ID) as ResponseDeptName,(select Name from D_ACTIVITY_TYPE where id = :p2_D_ACTIVITY_TYPE_ID) as ActivityTypeName', [D_RESPONSE_DEPT_ID,D_ACTIVITY_TYPE_ID]);
     stResponse_dept_id.Caption := dmDataModule.qfo.FieldByName('ResponseDeptName').AsString;
     stActivity_type_id.Caption := dmDataModule.qfo.FieldByName('ActivityTypeName').AsString;
   end

end;


procedure TWriteOffCostsForm.DBGridEh1Enter(Sender: TObject);
begin
  inherited;
  if quWriteOffCosts.State in [dsInsert, dsEdit] then quWriteOffCosts.Post;
end;

procedure TWriteOffCostsForm.DBGridEh1ColExit(Sender: TObject);
begin
  inherited;
  if quWriteOffCosts.State in [dsInsert, dsEdit] then quWriteOffCosts.Post;
end;

end.


