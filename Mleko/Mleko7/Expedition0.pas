unit Expedition0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  MlekoForm, Dialogs, DB, DBAccess, MsAccess, MemDS, StdCtrls, Buttons,
  ExtCtrls, ImgList, ActnList, FR_DSet, RxMemDS, FR_DBSet, FR_Class, citCtrls,
  citmask, citDBComboEdit, GridsEh, DBGridEh, DBCtrls, SelExpedition0, cxPC,
  cxControls, cxGraphics, cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxStyles, cxCustomData, cxFilter, cxData, ADODB, frOLEExl, frRtfExp;

type
  TfmExpedition = class(TMlekoForm)
    Panel1: TPanel;
    bbCansel: TBitBtn;
    quExpedition: TMSQuery;
    dsExpedition: TDataSource;
    UpdateExpedition: TMSUpdateSQL;
    quWork: TMSQuery;
    quExpeditionExpeditionSumma: TFloatField;
    quExpeditionExpeditionNo: TSmallintField;
    quExpeditionExpeditionDateGo: TDateTimeField;
    quExpeditionExpeditionUserNo: TSmallintField;
    quExpeditionExpeditionCarsNo: TSmallintField;
    quExpeditionExpeditionShipping_AgentNo: TSmallintField;
    quExpeditionShipping_AgentName: TStringField;
    quExpeditionCarsName: TStringField;
    quNaklR: TMSQuery;
    quNaklRNaklNo: TIntegerField;
    quNaklRNom: TIntegerField;
    quNaklRDateNaklFirst: TDateTimeField;
    quNaklRSumma: TFloatField;
    quNaklRName: TStringField;
    quNaklRExpeditionNo: TSmallintField;
    quNaklRAddress: TStringField;
    quNaklRBuh: TSmallintField;
    quExpeditionExpeditionKolPerPak: TFloatField;
    quExpeditionExpeditionWeight: TFloatField;
    frReport: TfrReport;
    frDBDataSet: TfrDBDataSet;
    dsNaklR: TDataSource;
    DBGridEh1: TDBGridEh;
    quNaklRInCar: TBooleanField;
    frReportBlank: TfrReport;
    frDBdsBlank: TfrDBDataSet;
    quTara: TMSQuery;
    quTaraKol: TFloatField;
    quTaraKolPerPak: TSmallintField;
    quTaraNameTovar: TStringField;
    mdTara: TRxMemoryData;
    mdTaraNameTara: TStringField;
    mdTaraTara: TFloatField;
    frDBdsTara: TfrDBDataSet;
    frReportTara: TfrReport;
    dsTara: TDataSource;
    quVidTovExpedition: TMSQuery;
    dsVidTovExpedition: TDataSource;
    frDBDSVidTovExpedition: TfrDBDataSet;
    frReportVidTovExpedition: TfrReport;
    frUserDatasetVidTovExpedition: TfrUserDataset;
    quVidTovCar: TMSQuery;
    mdExpedition: TRxMemoryData;
    quVidTovCarExpeditionNo: TSmallintField;
    quVidTovCarCarsNo: TSmallintField;
    quVidTovCarCarsName: TStringField;
    quVidTovExpeditionExpeditionNo: TSmallintField;
    quVidTovExpeditionNameTovar: TStringField;
    quVidTovExpeditionKol: TFloatField;
    quVidTovExpeditionVidName: TStringField;
    quVidTovExpeditionTovarNo: TSmallintField;
    quVidTovExpeditionExpeditionDateGo: TDateTimeField;
    quExpeditionExpeditionLook: TBooleanField;
    quExpeditionExpeditionPrint: TBooleanField;
    quExpeditionExpeditionDateCreate: TDateTimeField;
    quVidTovSelect: TMSQuery;
    quVidTovSelectVidNo: TSmallintField;
    quVidTovSelectVidName: TStringField;
    quNaklLook: TMSQuery;
    SmallintField1: TSmallintField;
    StringField1: TStringField;
    quNaklPrihDate: TMSQuery;
    quNaklPrihDateDateNakl: TDateTimeField;
    quPrihTovar: TMSQuery;
    quPrihTovarTovarNo: TSmallintField;
    quPrihTovarKol: TFloatField;
    frDBdsOtchet: TfrDBDataSet;
    frReportOtchet: TfrReport;
    mdOtchet: TRxMemoryData;
    dsOtchet: TDataSource;
    mdOtchetExpeditionSumma: TFloatField;
    mdOtchetExpeditionDateGo: TDateField;
    mdOtchetShipping_AgentName: TStringField;
    mdOtchetCarsName: TStringField;
    mdOtchetExpeditionKolPerPak: TFloatField;
    mdOtchetExpeditionWeight: TFloatField;
    mdOtchetExpeditionNo: TIntegerField;
    mdOtchetPosts: TMemoField;
    Memo1: TMemo;
    quExpeditionPrint: TMSQuery;
    dsdExpeditionPrint: TfrDBDataSet;
    frReportExpeditionPrint: TfrReport;
    dsExpeditionPrint: TDataSource;
    quExpeditionPrintNaklNo: TIntegerField;
    quExpeditionPrintNom: TIntegerField;
    quExpeditionPrintSumma: TFloatField;
    quExpeditionPrintName: TStringField;
    quExpeditionPrintAddress: TStringField;
    quExpeditionPrintShipping_AgentName: TStringField;
    quExpeditionPrintCarsName: TStringField;
    quExpeditionPrintExpeditionNo: TSmallintField;
    quNaklRPrint3: TBooleanField;
    ActionList1: TActionList;
    ActionPayDriving: TAction;
    ActionPayForwarding: TAction;
    ImageList1: TImageList;
    quExpeditionPayDriving: TFloatField;
    quExpeditionPayForwarding: TFloatField;
    quExpeditionDistance: TIntegerField;
    quExpeditionMolPostNo: TSmallintField;
    sp_Modify_ExpeditionPay: TMSStoredProc;
    quExpeditionSumDriving: TFloatField;
    quExpeditionSumForwarding: TFloatField;
    quNaklRDateNakl: TDateTimeField;
    quNaklRDateOpl: TDateTimeField;
    quExpeditionTimeGo: TStringField;
    Panel2: TPanel;
    sbInsert: TSpeedButton;
    sbEdit: TSpeedButton;
    sbDel: TSpeedButton;
    sbSvedenie: TSpeedButton;
    sbBlankOst: TSpeedButton;
    sbPrev: TSpeedButton;
    sbPrint: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ftPost: TcitDBComboEdit;
    SpeedButton3: TSpeedButton;
    ActionViewRefresh: TAction;
    quExpeditionDatePlatRDriving: TStringField;
    quExpeditionDatePlatRForwarding: TStringField;
    SpeedButton4: TSpeedButton;
    ActionPayAll: TAction;
    quExpeditionPrinted: TBooleanField;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    DBText3: TDBText;
    Label2: TLabel;
    DBText1: TDBText;
    Label5: TLabel;
    Label3: TLabel;
    DBText2: TDBText;
    DBText4: TDBText;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    DBText5: TDBText;
    Label6: TLabel;
    Label7: TLabel;
    DBText6: TDBText;
    DBText7: TDBText;
    Label8: TLabel;
    Label9: TLabel;
    DBText8: TDBText;
    Label10: TLabel;
    DBText9: TDBText;
    quRoute: TMSQuery;
    DSRoute: TDataSource;
    quExpeditionroute_id: TSmallintField;
    quExpeditionroute_code: TStringField;
    QuFootRoute: TMSQuery;
    DSFootR: TDataSource;
    quExpeditionCarsNo: TSmallintField;
    PCExp: TcxPageControl;
    tsRoute: TcxTabSheet;
    tsFreeNakl: TcxTabSheet;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    quFreeNakl: TMSQuery;
    DSFreeNakl: TDataSource;
    cxGrid1DBTableView1NaklNo: TcxGridDBColumn;
    cxGrid1DBTableView1Nom: TcxGridDBColumn;
    cxGrid1DBTableView1DateNakl: TcxGridDBColumn;
    cxGrid1DBTableView1PostName: TcxGridDBColumn;
    cxGrid1DBTableView1buhName: TcxGridDBColumn;
    cxGrid1DBTableView1VidNaklName: TcxGridDBColumn;
    cxGrid1DBTableView1UserName: TcxGridDBColumn;
    cxGrid1DBTableView1Address: TcxGridDBColumn;
    cxGrid1DBTableView1OtdelName: TcxGridDBColumn;
    cxGrid1DBTableView1summa: TcxGridDBColumn;
    cxGrid1DBTableView1weight: TcxGridDBColumn;
    MSQuery_Expedition_response_id: TMSQuery;
    Otchet_TTN: TMSQuery;
    quNaklRPrintPost: TBooleanField;
    quExpeditionis_logistic: TBooleanField;
    frOLEExcelExport1: TfrOLEExcelExport;
    frRtfAdvExport1: TfrRtfAdvExport;
    Button1: TButton;
    quNaklRDAY_DELAY: TIntegerField;
    quNaklROrderInFlight: TIntegerField;
    quNaklRArrivalTime: TDateTimeField;
    quNaklRTimeBeg: TStringField;
    quNaklRTimeEnd: TStringField;
    quNaklRVidNaklNo: TSmallintField;
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
    procedure quExpeditionBeforeDelete(DataSet: TDataSet);
    procedure quExpeditionBeforePost(DataSet: TDataSet);
    procedure quExpeditionNewRecord(DataSet: TDataSet);
    procedure frReportGetValue(const ParName: string; var ParValue: Variant);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer; Column: TColumnEh);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure frUserDatasetVidTovExpeditionCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure frUserDatasetVidTovExpeditionFirst(Sender: TObject);
    procedure frUserDatasetVidTovExpeditionNext(Sender: TObject);
    procedure frReportVidTovExpeditionGetValue(const ParName: string; var ParValue: Variant);
    procedure VidTovToCar(VidTov: integer; PrintReport: Boolean);
    procedure frReportExpeditionPrintGetValue(const ParName: string; var ParValue: Variant);
    procedure sbInsertClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure sbPrevClick(Sender: TObject);
    procedure sbPrintClick(Sender: TObject);
    procedure sbSvedenieClick(Sender: TObject);
    procedure sbBlankOstClick(Sender: TObject);
    procedure ActionPayDrivingExecSQL(Sender: TObject);
    procedure ActionPayForwardingExecSQL(Sender: TObject);
    function ftPostIsSelect(Sender: TObject): Boolean;
    procedure quExpeditionBeforeOpen(DataSet: TDataSet);
    procedure ActionViewRefreshExecSQL(Sender: TObject);
    procedure ActionPayAllExecSQL(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1Columns10UpdateData(Sender: TObject; var Text: string; var Value: Variant; var UseText, Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    SearchString: string;
    Coln: integer;
  public
    { Public declarations }
  end;

var
  fmExpedition: TfmExpedition;
  DateB, DateE, DateInsert: TDate;
  Expidition_: Boolean;
  TmpSql_: string;

procedure Expedition(SelExpedition: TRetSelExpedition; Expidition: Boolean);

procedure ExpCashRashod;

implementation

uses
  data, EditExpedition0, Otchets0, SelectItem0, SvedenieNakl0, RecycleExpedition0,
  BlankOst0, uAccountCashRashod, MlekoSelectFIrm, main, GetDate0;

{$R *.dfm}

procedure TfmExpedition.VidTovToCar(VidTov: integer; PrintReport: Boolean);
begin
  quVidTovCar.Close;
  quVidTovCar.ParamByName('ExpeditionDateGo').AsDateTime := quExpeditionExpeditionDateGo.AsDateTime;
  quVidTovCar.Open;
  quVidTovExpedition.Close;
  quVidTovExpedition.ParamByName('ExpeditionDateGo').AsDateTime := quExpeditionExpeditionDateGo.AsDateTime;
  quVidTovExpedition.ParamByName('VidNo').AsInteger := VidTov;
  quVidTovExpedition.Open;
  quNaklPrihDate.Close;
  quNaklPrihDate.ParamByName('VidNo').AsInteger := VidTov;
  quNaklPrihDate.Open;

  quPrihTovar.Close;
  quPrihTovar.ParamByName('VidNo').AsInteger := VidTov;
  quPrihTovar.ParamByName('DateNakl').AsDateTime := quNaklPrihDateDateNakl.AsDateTime;
  quPrihTovar.Open;

  quNaklPrihDate.Close;

  if quVidTovExpedition.RecordCount = 0 then
    exit;

  with mdExpedition do
  begin
    Active := False;
    FieldDefs.Clear;
    with FieldDefs.AddFieldDef do
    begin
      Name := 'NameTovar';
      DataType := ftString;
      Size := 100;
      Required := False;
    end;
    with FieldDefs.AddFieldDef do
    begin
      Name := 'VidTovar';
      DataType := ftString;
      Size := 40;
      Required := False;
    end;
    with FieldDefs.AddFieldDef do
    begin
      Name := 'TovarNo';
      DataType := ftInteger;
      Required := False;
    end;
    with FieldDefs.AddFieldDef do
    begin
      Name := 'SumKolvo';
      DataType := ftFloat;
      Required := False;
    end;
    with FieldDefs.AddFieldDef do
    begin
      Name := 'LastKolvo';
      DataType := ftFloat;
      Required := False;
    end;
    quVidTovCar.First;
    while not quVidTovCar.Eof do
    begin
      with FieldDefs.AddFieldDef do
      begin
        Name := IntToStr(quVidTovCarExpeditionNo.AsInteger);
        DataType := ftFloat;
        Required := False;
      end;
      quVidTovCar.Next;
    end;

    Active := True;
  end;

  while not quVidTovExpedition.Eof do
  begin
    if mdExpedition.Locate('TovarNo', quVidTovExpeditionTovarNo.AsInteger, []) then
    begin
      mdExpedition.Edit;
      mdExpedition.FieldByName(IntToStr(quVidTovExpeditionExpeditionNo.AsInteger)).AsFloat := quVidTovExpeditionKol.AsFloat;
      mdExpedition.FieldByName('SumKolvo').AsFloat := mdExpedition.FieldByName('SumKolvo').AsFloat + quVidTovExpeditionKol.AsFloat;
    end
    else
    begin
      mdExpedition.Insert;
      mdExpedition.FieldByName('NameTovar').AsString := quVidTovExpeditionNameTovar.AsString;
      mdExpedition.FieldByName('VidTovar').AsString := quVidTovExpeditionVidName.AsString;
      mdExpedition.FieldByName('TovarNo').AsInteger := quVidTovExpeditionTovarNo.AsInteger;
      mdExpedition.FieldByName(IntToStr(quVidTovExpeditionExpeditionNo.AsInteger)).AsFloat := quVidTovExpeditionKol.AsFloat;
      mdExpedition.FieldByName('SumKolvo').AsFloat := quVidTovExpeditionKol.AsFloat;
    end;
    mdExpedition.Post;
    mdExpedition.Refresh;
    quVidTovExpedition.Next;
  end;

  while not quPrihTovar.Eof do
  begin
    if mdExpedition.Locate('TovarNo', quPrihTovarTovarNo.AsInteger, []) then
    begin
      mdExpedition.Edit;
      mdExpedition.FieldByName('LastKolvo').AsFloat := quPrihTovarKol.AsFloat;
      mdExpedition.Post;
      mdExpedition.Refresh;
    end;
    quPrihTovar.Next;
  end;

  frReportVidTovExpedition.LoadFromFile('VidTovExpeditio0.frf');
  if not PrintReport then
  begin
    frReportVidTovExpedition.ShowReport;
  end
  else
  begin
    frReportVidTovExpedition.PrepareReport;
    frReportVidTovExpedition.PrintPreparedReport('', 2, True, frAll);
  end;
  quVidTovCar.Close;
  quVidTovExpedition.Close;
  quPrihTovar.Close;
end;

procedure Expedition(SelExpedition: TRetSelExpedition; Expidition: Boolean);
var
  TmpSql: string;
begin
  Screen.Cursor := crHourGlass;
  fmExpedition := TfmExpedition.Create(Application);
  fmExpedition.SpeedButton1.Caption := '';
  fmExpedition.SpeedButton2.Caption := '';
  fmExpedition.SpeedButton3.Caption := '';
  fmExpedition.ActionPayDriving.Enabled := data.CodeAccess <= 1;
  fmExpedition.ActionPayForwarding.Enabled := data.CodeAccess <= 1;
  fmExpedition.ActionPayAll.Enabled := data.CodeAccess <= 1;
  fmExpedition.QuFreeNakl.ParamByName('DateNaklBeg').AsDate := Date();
  fmExpedition.QuFreeNakl.ParamByName('DateNaklEnd').AsDate := Date();

  try
    TmpSQL := '';
    TmpSQL_ := '';
    if SelExpedition.CarsNo > 0 then
    begin
      TmpSql := '(E.ExpeditionCarsNo=' + IntToStr(SelExpedition.CarsNo) + ')';
      TmpSql_ := '(E.ExpeditionCarsNo=' + IntToStr(SelExpedition.CarsNo) + ')';
    end;
    if (SelExpedition.Shipping_AgentNo > 0) then
    begin
      if Length(TmpSql) > 0 then
        TmpSql := TmpSql + ' and ';
      TmpSql := TmpSql + ' (E.ExpeditionShipping_AgentNo=' + IntToStr(SelExpedition.Shipping_AgentNo) + ')';
    end;
    if (SelExpedition.DateBegin > 0) then
    begin
      if Length(TmpSql) > 0 then
        TmpSql := TmpSql + ' and ';
      if Length(TmpSql_) > 0 then
        TmpSql_ := TmpSql_ + ' and ';
      TmpSql := TmpSql + ' (E.ExpeditionDateGo>=:DateBegin) and (E.ExpeditionDateGo<=:DateEnd) ';
      TmpSql_ := TmpSql_ + ' (E.ExpeditionDateGo>=:DateBegin) and (E.ExpeditionDateGo<=:DateEnd) ';
      fmExpedition.QuFreeNakl.ParamByName('DateNaklBeg').AsDate := SelExpedition.DateBegin;
      fmExpedition.QuFreeNakl.ParamByName('DateNaklEnd').AsDate := SelExpedition.DateEnd;
    end;
    if Length(TmpSql) > 0 then
    begin
      fmExpedition.quExpedition.MacroByName('_where').Value := TmpSQL;
      fmExpedition.quExpedition.MacroByName('_order').Value := 'e.ExpeditionNo';
      if (SelExpedition.DateBegin > 0) then
      begin
        fmExpedition.quExpedition.ParamByName('DateBegin').AsDate := SelExpedition.DateBegin;
        DateB := SelExpedition.DateBegin;
        fmExpedition.quExpedition.ParamByName('DateEnd').AsDate := SelExpedition.DateEnd;
        DateE := SelExpedition.DateEnd;
      end;
    end;
    DateInsert := StrToDate(DateToStr(SelExpedition.DateBegin));

    with fmExpedition do
    begin
      if Expidition then
      begin
        Expidition_ := Expidition;
        sbSvedenie.Enabled := False;
        sbSvedenie.Visible := False;
      end
      else
      begin
        Expidition_ := Expidition;
        Label1.Height := 14;
        sbInsert.Enabled := False;
        sbDel.Enabled := False;
        //     sbInsert.Visible:=False;
        //     sbDel.Visible:=False;
        Caption := Caption + ' (Сведение)';
      end;
    end;
    fmExpedition.PCExp.ActivePage := fmExpedition.tsRoute;
    fmExpedition.ActionViewRefresh.Execute;
    fmExpedition.ShowModal;
  finally
    Screen.Cursor := crDefault;
    fmExpedition.quExpedition.Close;
    { fmNaklR_.quNaklR.Close;
     fmNaklR_.quVidNakl.Close;
     fmNaklR_.quSotrud.Close;
     fmNaklR_.quTipNakl.Close;}
    fmExpedition.Free;
  end;
end;

procedure TfmExpedition.RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
var
  ExpeditionNo: integer;
begin
  Screen.Cursor := crHourGlass;
  ExpeditionNo := quExpeditionExpeditionNo.AsInteger;
  quExpedition.Close;
  case ACol of
    0:
      quExpedition.MacroByName('_order').Value := 'e.ExpeditionNo';
    1:
      quExpedition.MacroByName('_order').Value := 'ExpeditionDateGo,C.CarsName';
    2:
      quExpedition.MacroByName('_order').Value := 'CarsName';
    3:
      quExpedition.MacroByName('_order').Value := 'Shipping_AgentName,C.CarsName';
    4:
      quExpedition.MacroByName('_order').Value := 'ExpeditionSumma';

  end;
  quExpedition.Prepare;
  quExpedition.Open;
  quExpedition.Locate('ExpeditionNo', ExpeditionNo, []);
  Screen.Cursor := crDefault;
end;

procedure TfmExpedition.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
var
  Found: boolean;
begin
  if (Key in Data.SearchSet) then
  begin
    SearchString := SearchString + Key;
    Key := Chr(0);
    Found := False;
    try
      Found := DBGridEh1.DataSource.DataSet.Locate(DBGridEh1.Columns[DBGridEh1.Col].FieldName, SearchString, [loPartialKey, loCaseInsensitive]);
    except
      SearchString := '';
    end;
    if (not Found) and (DBGridEh1.Columns[DBGridEh1.Col].Field.DataType = ftString) then
      SearchString := Copy(SearchString, 1, length(SearchString) - 1);
  end;
end;

procedure TfmExpedition.quExpeditionBeforeDelete(DataSet: TDataSet);
begin
  dmDataModule.quWork.SQL.Clear;
  dmDataModule.quWork.SQL.Add('UPDATE NaklR ' + 'SET ExpeditionNo=0 ' + 'WHERE (ExpeditionNo = :ExpeditionNo)');
  dmDataModule.quWork.ParamByName('ExpeditionNo').AsInteger := quExpeditionExpeditionNo.AsInteger;
  dmDataModule.quWork.Execute;

  dmDataModule.quWork.SQL.Clear;
  dmDataModule.quWork.SQL.Add('UPDATE E_BLANK_HEAD ' + 'SET ExpeditionNo=0 ' + 'WHERE (ExpeditionNo = :ExpeditionNo)');
  dmDataModule.quWork.ParamByName('ExpeditionNo').AsInteger := quExpeditionExpeditionNo.AsInteger;
  dmDataModule.quWork.Execute;

  UpdateExpedition.Apply(ukDelete);
end;

procedure TfmExpedition.quExpeditionBeforePost(DataSet: TDataSet);
begin
  if quExpedition.State in [dsInsert] then
  begin
    dmDataModule.quWork.SQL.Clear;
    dmDataModule.quWork.SQL.Add('select Max(ExpeditionNo) ExpeditionNo from Expedition');
    dmDataModule.quWork.Open;
    quExpeditionExpeditionNo.AsInteger := dmDataModule.quWork.FieldByName('ExpeditionNo').AsInteger + 1;
    dmDataModule.quWork.Close;
    UpdateExpedition.Apply(ukInsert);
  end
  else
    UpdateExpedition.Apply(ukModify)
end;

procedure TfmExpedition.quExpeditionNewRecord(DataSet: TDataSet);
begin
  quExpeditionExpeditionDateCreate.AsDateTime := Date;
  quExpeditionExpeditionDateGo.AsDateTime := DateInsert;
  quExpeditionExpeditionCarsNo.AsInteger := 0;
  quExpeditionExpeditionShipping_AgentNo.AsInteger := 0;
  quExpeditionExpeditionSumma.AsFloat := 0;
  quExpeditionExpeditionUserNo.AsInteger := UserNo;
  quExpeditionExpeditionPrint.AsBoolean := False;
  quExpeditionExpeditionLook.AsBoolean := False;
end;

procedure TfmExpedition.frReportGetValue(const ParName: string; var ParValue: Variant);
begin
  if ParName = 'Date' then
    ParValue := quExpeditionExpeditionDateGo.AsDateTime;
  if ParName = 'Car' then
    ParValue := quExpeditionCarsName.AsString;
  if ParName = 'Shipping_Agent' then
    ParValue := quExpeditionShipping_AgentName.AsString;
  if ParName = 'TimeGo' then
    ParValue := quExpeditionTimeGo.AsString;
end;

procedure TfmExpedition.DBGridEh1DblClick(Sender: TObject);
begin
  sbEditClick(Sender)
end;

procedure TfmExpedition.DBGridEh1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    //  VK_SPACE:RxDBGrid1.SelectedRows.CurrentRowSelected:=not RxDBGrid1.SelectedRows.CurrentRowSelected;
    VK_RETURN:
      begin
        Key := 0;
        if not quExpedition.Eof then
        begin
          sbEditClick(Sender);
        end;
      end;
    VK_INSERT:
      begin
        Key := 0;
        if Expidition_ then
          sbInsertClick(Sender);
      end;
    VK_DELETE:
      begin
        Key := 0;
        if Expidition_ then
          sbDelClick(Sender);
      end;
    VK_DOWN, VK_UP, VK_RIGHT, VK_LEFT:
      SearchString := '';
    VK_F5:
      begin
        sbPrevClick(Sender);
      end;
    VK_F6:
      begin
        sbPrintClick(Sender);
      end;
  end;
end;

procedure TfmExpedition.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
var
  Found: boolean;
begin
  if DBGridEh1.Columns[DBGridEh1.Col].Field.DataType = ftString then
  begin
    if (Key in Data.SearchSet) then
    begin
      SearchString := SearchString + Key;
      Key := Chr(0);
      Found := False;
      try
        Found := DBGridEh1.DataSource.DataSet.Locate(DBGridEh1.Columns[DBGridEh1.Col].FieldName, SearchString, [loPartialKey, loCaseInsensitive]);
      except
        SearchString := '';
      end;
      if (not Found) and (DBGridEh1.Columns[DBGridEh1.Col].Field.DataType = ftString) then
        SearchString := Copy(SearchString, 1, length(SearchString) - 1);
    end;
  end;
end;

procedure TfmExpedition.DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer; Column: TColumnEh);
var
  ExpeditionNo: integer;
begin
  Screen.Cursor := crHourGlass;
  ExpeditionNo := quExpeditionExpeditionNo.AsInteger;
  quExpedition.Close;
  case ACol of
    0:
      quExpedition.MacroByName('_order').Value := 'e.ExpeditionNo';
    1:
      quExpedition.MacroByName('_order').Value := 'ExpeditionDateGo,C.CarsName';
    2:
      quExpedition.MacroByName('_order').Value := 'CarsName';
    3:
      quExpedition.MacroByName('_order').Value := 'Shipping_AgentName,C.CarsName';
    4:
      quExpedition.MacroByName('_order').Value := 'ExpeditionSumma';
  end;
  quExpedition.Prepare;
  quExpedition.Open;
  quExpedition.Locate('ExpeditionNo', ExpeditionNo, []);
  Screen.Cursor := crDefault;
end;

procedure TfmExpedition.DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if (quExpedition.FieldByName('PayDriving').AsFloat <> quExpedition.FieldByName('SumDriving').AsFloat) and (Column.Index = 7) then
    DbGridEh1.Canvas.Brush.Color := clRed
  else if (quExpedition.FieldByName('PayDriving').AsFloat = quExpedition.FieldByName('SumDriving').AsFloat) and (quExpedition.FieldByName('SumDriving').AsFloat <> 0) and (Column.Index = 7) then
    DbGridEh1.Canvas.Brush.Color := clMoneyGreen;

  if (quExpedition.FieldByName('PayForwarding').AsFloat <> quExpedition.FieldByName('SumForwarding').AsFloat) and (Column.Index = 8) then
    DbGridEh1.Canvas.Brush.Color := clRed
  else if (quExpedition.FieldByName('PayForwarding').AsFloat = quExpedition.FieldByName('SumForwarding').AsFloat) and (quExpedition.FieldByName('SumForwarding').AsFloat <> 0) and (Column.Index = 8) then
    DbGridEh1.Canvas.Brush.Color := clMoneyGreen;

  if (Rect.Top = DBGridEh1.CellRect(DBGridEh1.Col, DBGridEh1.Row).Top) and (not (gdFocused in State) or not DBGridEh1.Focused) then
    DBGridEh1.Canvas.Brush.Color := clSilver;
  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfmExpedition.frUserDatasetVidTovExpeditionCheckEOF(Sender: TObject; var Eof: Boolean);
begin
  EOF := (mdExpedition.FieldCount = Coln);
end;

procedure TfmExpedition.frUserDatasetVidTovExpeditionFirst(Sender: TObject);
begin
  Coln := 5;
end;

procedure TfmExpedition.frUserDatasetVidTovExpeditionNext(Sender: TObject);
begin
  Inc(Coln);
end;

procedure TfmExpedition.frReportVidTovExpeditionGetValue(const ParName: string; var ParValue: Variant);
begin
  if ParName = 'ReportDate' then
    ParValue := quVidTovExpeditionExpeditionDateGo.AsDateTime;
  if ParName = 'Cell' then
    ParValue := mdExpedition.Fields[Coln].AsFloat;
  if ParName = 'ColName' then
    if quVidTovCar.Locate('ExpeditionNo', mdExpedition.Fields[Coln].FieldName, []) then
      ParValue := quVidTovCarCarsName.AsString;
end;

procedure TfmExpedition.frReportExpeditionPrintGetValue(const ParName: string; var ParValue: Variant);
begin
  if ParName = 'Date' then
    ParValue := quExpeditionExpeditionDateGo.AsDateTime;
end;

procedure TfmExpedition.sbInsertClick(Sender: TObject);
begin
  quExpedition.Append;
  EditExpedition(quExpeditionExpeditionNo.AsInteger);
  ActiveControl := DBGridEh1;
end;

procedure TfmExpedition.sbEditClick(Sender: TObject);
var
  FindExpeditionNo: Integer;
begin
  if quExpedition.RecordCount > 0 then
  begin
    //   quExpedition.Edit;
    //
    FindExpeditionNo := quExpeditionExpeditionNo.AsInteger;
    if Expidition_ then
      EditExpedition(FindExpeditionNo)
    else
      SvedenieNakl(FindExpeditionNo);
    quExpedition.Close;
    quExpedition.Open;
    quExpedition.Locate('ExpeditionNo', FindExpeditionNo, []);
  end
  else
    ActiveControl := DBGridEh1;
end;

procedure TfmExpedition.sbDelClick(Sender: TObject);
var
  msg: string;
  DateBlock: tdatetime;
begin
  dmDataModule.quWork.SQL.Clear;
  dmDataModule.quWork.SQL.Add('select * from SetupForExpedition ');
  dmDataModule.quWork.Open;

  DateBlock := dmDataModule.quWork.FieldByName('DateBlock').AsDateTime;

  if DateBlock >= quExpeditionExpeditionDateGo.AsDateTime then
  begin
    msg := 'Удаление запрещено!' + #10#13 + 'Период заблокирован';
    raise Exception.Create(msg);
  end;

  if not quExpeditionroute_id.IsNull then
  begin
    msg := 'Удаление запрещено!' + #10#13 + 'Для возможности удаления необходимо отвязать маршрут';
    raise Exception.Create(msg);
  end;

  if quExpedition.RecordCount > 0 then
  begin
    if (Application.MessageBox('Вы уверены, что хотите удалить ходку?', 'Удаление', MB_YESNO) = IDYES) then
      quExpedition.Delete;
  end
  else
    ActiveControl := DBGridEh1;
end;

function Ctrl_Is_Down: Boolean;
var State:TKeyboardState;
begin
GetKeyboardState(State);
Result:=((State[VK_CONTROL] and 128)<>0);
end;

function Shift_Is_Down: Boolean;
var State:TKeyboardState;
begin
GetKeyboardState(State);
Result:=((State[VK_SHIFT] and 128)<>0);
end;

procedure TfmExpedition.sbPrevClick(Sender: TObject);
var
  ExpeditionNo, i, Tara: integer;
  S, S1: string;
  SelectPost: string;
  SecretKeyPressed: Boolean;
begin
  SecretKeyPressed:= Ctrl_Is_Down() and Shift_Is_Down();
  quNaklR.ParamByName('ExpeditionNo').AsInteger := quExpeditionExpeditionNo.AsInteger;
  quNaklR.Open;
  i := SelectItem( 'Печать',
                   ['Загрузка', 'Список магазинов', 'Тарная накладная',
                    'Загрузка по виду', 'Список накладных', 'Отчет по ходкам']);
  case i of
    0:
      begin
        S := '';
        S1 := '';
        quNaklR.First;
        while not quNaklR.Eof do
        begin
          if quNaklRInCar.AsBoolean then
            S := S + quNaklRNaklNo.AsString + ','
          else
            S1 := S1 + quNaklRName.AsString + ' № ' + IntToStr(quNaklRNom.AsInteger) + ', ';
          quNaklR.Next;
        end;
        if S1 <> '' then
        begin
          S1 := Copy(S1, 1, Length(S1) - 2);
          S1 := 'Без загрузки (' + S1 + ')';
        end;
        if S <> '' then
        begin
          S := Copy(S, 1, Length(S) - 1);
          S := '(' + S + ')';
          LoadCarNew(1, S, S1, False, True, 'Код:' + quExpeditionExpeditionNo.AsString + ' ' + quExpeditionCarsName.AsString, quExpeditionShipping_AgentName.AsString, quExpeditionExpeditionDateGo.AsDateTime);
          //LoadCar(1, S, S1, False, True, quExpeditionCarsName.AsString, quExpeditionShipping_AgentName.AsString, quExpeditionExpeditionDateGo.AsDateTime);
        end;
      end;
    1:
      begin
        quNaklR.First;
        S := '';
        S1 := '';
        frReport.LoadFromFile('BlankExpedition.frf');
        if SecretKeyPressed then
           frReport.DesignReport else
           frReport.ShowReport;
      end;
    2:
      begin
        quTara.Close;
        quTara.ParamByName('ExpeditionNo').AsInteger := quExpeditionExpeditionNo.AsInteger;
        quTara.Open;
        mdTara.Active := False;
        mdTara.Active := True;
        while not quTara.Eof do
        begin
          Tara := 0;
          Tara := quTaraKol.AsInteger div quTaraKolPerPak.AsInteger;
          if ((quTaraKol.AsInteger / quTaraKolPerPak.AsInteger) - Tara) >= 0.5 then
            Tara := Tara + 1;
          if Tara = 0 then
            Tara := 1;
          mdTara.Insert;
          mdTaraNameTara.AsString := quTaraNameTovar.AsString;
          mdTaraTara.AsFloat := Tara;
          mdTara.Post;
          mdTara.Refresh;
          quTara.Next;
        end;
        quTara.Close;
        if mdTara.RecordCount > 0 then
        begin
          frReportTara.LoadFromFile('NaklTaraExp.frf');
          frReportTara.ShowReport;
        end;
        mdTara.Active := False;
      end;
    3:
      begin
        quVidTovSelect.Close;
        quVidTovSelect.ParamByName('ExpeditionDateGo').AsDateTime := quExpeditionExpeditionDateGo.AsDateTime;
        quVidTovSelect.Open;
        while not quVidTovSelect.Eof do
        begin
          VidTovToCar(quVidTovSelectVidNo.AsInteger, False);
          quVidTovSelect.Next;
        end;
        quVidTovSelect.Close;
      end;
    4:
      begin
        quExpeditionPrint.Close;
        quExpeditionPrint.MacroByName('_where').Value := TmpSql_;
        quExpeditionPrint.MacroByName('_order').Value := 'E.ExpeditionNo';
        quExpeditionPrint.Prepare;
        if (DateB > 0) then
        begin
          quExpeditionPrint.ParamByName('DateBegin').AsDate := DateB;
          quExpeditionPrint.ParamByName('DateEnd').AsDate := DateE;
        end;
        quExpeditionPrint.Open;
        quNaklR.First;
        S := '';
        S1 := '';
        frReportExpeditionPrint.LoadFromFile('BlankExpeditionNakl.frf');
        frReportExpeditionPrint.ShowReport;
        quExpeditionPrint.Close;
      end;
    5:
      begin
        SelectPost := '';
        ExpeditionNo := quExpeditionExpeditionNo.AsInteger;
        mdOtchet.Active := False;
        mdOtchet.Active := True;
        quExpedition.First;
        while not quExpedition.Eof do
        begin
          quWork.Close;
          quWork.SQL.Clear;
          quWork.SQL.Add('SELECT Post.Name AS PostName ');
          quWork.SQL.Append('FROM Post INNER JOIN ');
          quWork.SQL.Append('NaklR ON Post.PostNo = NaklR.PostNoFirst ');
          quWork.SQL.Append('WHERE (NaklR.ExpeditionNo = :ExpeditionNo) ');
          quWork.SQL.Append('GROUP BY Post.Name ');
          quWork.SQL.Append('ORDER BY Post.Name');
          quWork.ParamByName('ExpeditionNo').AsInteger := quExpeditionExpeditionNo.AsInteger;
          quWork.Open;
          SelectPost := quWork.FieldByName('PostName').AsString;
          quWork.Next;
          while not quWork.Eof do
          begin
            SelectPost := SelectPost + ', ' + quWork.FieldByName('PostName').AsString;
            quWork.Next;
          end;
          Memo1.Clear;
          Memo1.Lines.Append(SelectPost);
          mdOtchet.Insert;
          mdOtchetCarsName.AsString := quExpeditionCarsName.AsString;
          mdOtchetExpeditionDateGo.AsDateTime := quExpeditionExpeditionDateGo.AsDateTime;
          mdOtchetExpeditionKolPerPak.AsFloat := quExpeditionExpeditionKolPerPak.AsFloat;
          mdOtchetExpeditionNo.AsInteger := quExpeditionExpeditionNo.AsInteger;
          mdOtchetExpeditionSumma.AsFloat := quExpeditionExpeditionSumma.AsFloat;
          mdOtchetExpeditionWeight.AsFloat := quExpeditionExpeditionWeight.AsFloat;
          mdOtchetPosts.Assign(Memo1.Lines);
          mdOtchetShipping_AgentName.AsString := quExpeditionShipping_AgentName.AsString;
          mdOtchet.Post;
          mdOtchet.Refresh;

          quExpedition.Next;
        end;

        quExpedition.Locate('ExpeditionNo', ExpeditionNo, []);
        frReportOtchet.LoadFromFile('LoadCarOtchet.frf');
        frReportOtchet.ShowReport;
        mdOtchet.Active := False;
        quWork.Close;
      end;
  end;
  quNaklR.Close;
  ActiveControl := DBGridEh1;
end;

procedure TfmExpedition.sbPrintClick(Sender: TObject);
var
  i, j, Tara: integer;
  S, S1, S2: string;
begin
  quNaklR.ParamByName('ExpeditionNo').AsInteger := quExpeditionExpeditionNo.AsInteger;
  quNaklR.Open;

  i := SelectItem('Печать', ['Полный комплект', 'Список магазинов', 'Загрузка', 'Загрузка без ТТ', 'Тарная накладная', 'Список накладных']);
  case i of
    0:
      begin

        isPrintTTNForNight := True;
        quNaklR.First;
        S := '';
        S2 := '';
        frReport.LoadFromFile('BlankExpedition.frf');
        //      frReport.ShowReport;
        frReport.PrepareReport;
        frReport.PrintPreparedReport('', 1, True, frAll);

        frReportBlank.LoadFromFile('BlankExpeditionReturne.frf');
        //      frReportBlank.ShowReport;
        frReportBlank.PrepareReport;
        frReportBlank.PrintPreparedReport('', 1, True, frAll);

        quNaklR.First;
        while not quNaklR.Eof do
        begin
          S2 := S2 + quNaklRNaklNo.AsString + ',';
          if quNaklRInCar.AsBoolean then
            S := S + quNaklRNaklNo.AsString + ','
          else
            S1 := S1 + quNaklRName.AsString + ' ' + quNaklRAddress.AsString + ', ';
          quNaklR.Next;
        end;
        if S1 <> '' then
        begin
          S1 := Copy(S1, 1, Length(S1) - 2);
          S1 := 'Без загрузки (' + S1 + ')';
        end;
        if S <> '' then
        begin
          S := Copy(S, 1, Length(S) - 1);
          S := '(' + S + ')';
          LoadCarNew(1, S, S1, False, False, quExpeditionCarsName.AsString, quExpeditionShipping_AgentName.AsString, quExpeditionExpeditionDateGo.AsDateTime);
        end;
        if S2 <> '' then
        begin
          S2 := Copy(S2, 1, Length(S2) - 1);
          S2 := '(' + S2 + ')';
        end;

        quNaklR.First;
        while not quNaklR.Eof do
        begin
          Otchet_TTN.Close;
          Otchet_TTN.ParamByName('bb').AsString := quNaklRName.AsString;
          Otchet_TTN.Open;
          if Otchet_TTN.FieldByName('TTN').AsBoolean = true then
          begin
            PrintNaklTransportRasNew(quNaklRNaklNo.AsInteger, False, quNaklRPrint3.AsBoolean);
//                for j := 1 to 3 do PrintNaklTransportRasNew(quNaklRNaklNo.AsInteger,False, quNaklRPrint3.AsBoolean);
          end;
          quNaklR.Next;
        end;

        quNaklR.First;
        while not quNaklR.Eof do
          if quNaklRPrintPost.AsBoolean = true then
          begin
            if quNaklRBuh.AsInteger = 2 then
            begin
              PrintNaklRasNew(quNaklRNaklNo.AsInteger, False, False, True, quNaklRPrint3.AsBoolean);
            //PrintNaklRas(2, quNaklRNaklNo.AsInteger,False,False);
            end
            else
            begin
              PrintNaklRasNew(quNaklRNaklNo.AsInteger, False, False, False, quNaklRPrint3.AsBoolean);
            //PrintNaklRas(1, quNaklRNaklNo.AsInteger,False,False);
            //PrintNaklRShort(quNaklRNaklNo.AsInteger, False);
            end;
            quNaklR.Next;
          end
          else
            quNaklR.Next;

        quTara.Close;
        quTara.ParamByName('ExpeditionNo').AsInteger := quExpeditionExpeditionNo.AsInteger;
        quTara.Open;
        mdTara.Active := False;
        mdTara.Active := True;
        while not quTara.Eof do
        begin
          Tara := 0;
          Tara := quTaraKol.AsInteger div quTaraKolPerPak.AsInteger;
          if ((quTaraKol.AsInteger / quTaraKolPerPak.AsInteger) - Tara) >= 0.5 then
            Tara := Tara + 1;
          if Tara = 0 then
            Tara := 1;
          mdTara.Insert;
          mdTaraNameTara.AsString := quTaraNameTovar.AsString;
          mdTaraTara.AsFloat := Tara;
          mdTara.Post;
          mdTara.Refresh;
          quTara.Next;
        end;
        quTara.Close;
        if mdTara.RecordCount > 0 then
        begin
          frReportTara.LoadFromFile('NaklTaraExp.frf');
          //        frReportTara.ShowReport;
          frReportTara.PrepareReport;
          frReportTara.PrintPreparedReport('', 1, True, frAll);
        end;
        mdTara.Active := False;

        quNaklLook.Close;
        quNaklLook.MacroByName('Nakl').Value := S2;
        quNaklLook.Execute;

        quWork.Close;
        quWork.SQL.Clear;
        quWork.SQL.Add('UPDATE Expedition ');
        quWork.SQL.Append('SET ExpeditionPrint = 1 ');
        quWork.SQL.Append('WHERE (ExpeditionNo = :ExpeditionNo)');
        quWork.ParamByName('ExpeditionNo').AsInteger := quExpeditionExpeditionNo.AsInteger;
        quWork.Execute;

        //Последняя ходка
        quWork.Close;
        quWork.SQL.Clear;
        quWork.SQL.Add('Select * ');
        quWork.SQL.Append('From Expedition ');
        quWork.SQL.Append('WHERE (ExpeditionPrint=0) and (ExpeditionDateGo = :ExpeditionDateGo)');
        quWork.ParamByName('ExpeditionDateGo').AsDateTime := quExpeditionExpeditionDateGo.AsDateTime;
        quWork.Open;

        if quWork.RecordCount = 0 then
        begin
          begin
            quVidTovSelect.Close;
            quVidTovSelect.ParamByName('ExpeditionDateGo').AsDateTime := quExpeditionExpeditionDateGo.AsDateTime;
            quVidTovSelect.Open;
            while not quVidTovSelect.Eof do
            begin
              VidTovToCar(quVidTovSelectVidNo.AsInteger, True);
              quVidTovSelect.Next;
            end;
            quVidTovSelect.Close;
          end;
 {
          //Печать списка накладных в самом конце всех ходок!!!
          quExpeditionPrint.Close;
          quExpeditionPrint.MacroByName('_where').Value := TmpSql_;
          quExpeditionPrint.MacroByName('_order').Value := 'E.ExpeditionNo';
          quExpeditionPrint.Prepare;
          if (DateB > 0) then
          begin
            quExpeditionPrint.ParamByName('DateBegin').AsDate := DateB;
            quExpeditionPrint.ParamByName('DateEnd').AsDate := DateE;
          end;
          quExpeditionPrint.Open;
          quNaklR.First;
          S := '';
          S1 := '';
          frReportExpeditionPrint.LoadFromFile('BlankExpeditionNakl.frf');
          //frReportExpeditionPrint.ShowReport;
          frReportExpeditionPrint.PrepareReport;
          frReportExpeditionPrint.PrintPreparedReport('', 1, True, frAll);
          quExpeditionPrint.Close;
  }
        end;

      end;

    1:
      begin
        quNaklR.First;
        S := '';
        frReport.LoadFromFile('BlankExpedition.frf');

//        frReport.ShowReport;
        frReport.PrepareReport;
        frReport.PrintPreparedReport('', 1, True, frAll);
      end;
    2:
      begin

        quNaklR.First;
        while not quNaklR.Eof do
        begin
          if quNaklRInCar.AsBoolean then
            S := S + quNaklRNaklNo.AsString + ','
          else
            S1 := S1 + quNaklRName.AsString + ' ' + quNaklRAddress.AsString + ',';
          quNaklR.Next;
        end;
        if S1 <> '' then
        begin
          S1 := Copy(S1, 1, Length(S1) - 2);
          S1 := 'Без загрузки (' + S1 + ')';
        end;
        if S <> '' then
        begin
          S := Copy(S, 1, Length(S) - 1);
          S := '(' + S + ')';
          LoadCarNew(1, S, S1, False, False, quExpeditionCarsName.AsString, quExpeditionShipping_AgentName.AsString, quExpeditionExpeditionDateGo.AsDateTime);
        end;
        quWork.Close;
        quWork.SQL.Clear;
        quWork.SQL.Add('UPDATE Expedition ');
        quWork.SQL.Append('SET ExpeditionPrint = 1 ');
        quWork.SQL.Append('WHERE (ExpeditionNo = :ExpeditionNo)');
        quWork.ParamByName('ExpeditionNo').AsInteger := quExpeditionExpeditionNo.AsInteger;
        quWork.Execute;
      end;
    3:
      begin

        quNaklR.First;
        while not quNaklR.Eof do
        begin
          if quNaklRInCar.AsBoolean then
            S := S + quNaklRNaklNo.AsString + ','
          else
            S1 := S1 + quNaklRName.AsString + ' ' + quNaklRAddress.AsString + ',';
          quNaklR.Next;
        end;
        if S1 <> '' then
        begin
          S1 := Copy(S1, 1, Length(S1) - 2);
          S1 := 'Без загрузки (' + S1 + ')';
        end;
        if S <> '' then
        begin
          S := Copy(S, 1, Length(S) - 1);
          S := '(' + S + ')';
          LoadCarNoTTNew(1, S, S1, False, False, quExpeditionCarsName.AsString, quExpeditionShipping_AgentName.AsString, quExpeditionExpeditionDateGo.AsDateTime);
        end;
        quWork.Close;
        quWork.SQL.Clear;
        quWork.SQL.Add('UPDATE Expedition ');
        quWork.SQL.Append('SET ExpeditionPrint = 1 ');
        quWork.SQL.Append('WHERE (ExpeditionNo = :ExpeditionNo)');
        quWork.ParamByName('ExpeditionNo').AsInteger := quExpeditionExpeditionNo.AsInteger;
        quWork.Execute;
      end;
    4:
      begin
        quTara.Close;
        quTara.ParamByName('ExpeditionNo').AsInteger := quExpeditionExpeditionNo.AsInteger;
        quTara.Open;
        mdTara.Active := False;
        mdTara.Active := True;
        while not quTara.Eof do
        begin
          Tara := 0;
          Tara := quTaraKol.AsInteger div quTaraKolPerPak.AsInteger;
          if ((quTaraKol.AsInteger / quTaraKolPerPak.AsInteger) - Tara) >= 0.5 then
            Tara := Tara + 1;
          if Tara = 0 then
            Tara := 1;
          mdTara.Insert;
          mdTaraNameTara.AsString := quTaraNameTovar.AsString;
          mdTaraTara.AsFloat := Tara;
          mdTara.Post;
          mdTara.Refresh;
          quTara.Next;
        end;
        quTara.Close;
        if mdTara.RecordCount > 0 then
        begin
          frReportTara.LoadFromFile('NaklTaraExp.frf');
          //frReportTara.ShowReport;
          frReportTara.PrepareReport;
          frReportTara.PrintPreparedReport('', 1, True, frAll);
        end;
        mdTara.Active := False;
      end;
    5:
      begin
        quExpeditionPrint.Close;
        quExpeditionPrint.MacroByName('_where').Value := TmpSql_;
        quExpeditionPrint.MacroByName('_order').Value := 'E.ExpeditionNo';
        quExpeditionPrint.Prepare;
        if (DateB > 0) then
        begin
          quExpeditionPrint.ParamByName('DateBegin').AsDate := DateB;
          quExpeditionPrint.ParamByName('DateEnd').AsDate := DateE;
        end;
        quExpeditionPrint.Open;
        quNaklR.First;
        S := '';
        S1 := '';
        frReportExpeditionPrint.LoadFromFile('BlankExpeditionNakl.frf');
        frReportExpeditionPrint.ShowReport;
        frReportExpeditionPrint.PrepareReport;
        frReportExpeditionPrint.PrintPreparedReport('', 1, True, frAll);
        quExpeditionPrint.Close;
      end;
  end;
  quNaklR.Close;
  isPrintTTNForNight := False;
  ActiveControl := DBGridEh1;
end;

procedure TfmExpedition.sbSvedenieClick(Sender: TObject);
begin
  RecycleExpedition(quExpeditionExpeditionNo.AsInteger);
end;

procedure TfmExpedition.sbBlankOstClick(Sender: TObject);
begin
  BlankOstatok(fmExpedition.quExpeditionExpeditionNo.AsInteger);
end;

procedure ExpCashRashod;
var
  l_PostNo: integer;
begin
  //Pozje
  l_PostNo := fmExpedition.quExpeditionMolPostNo.AsInteger;
  fmAccountCashRashod := TfmAccountCashRashod.Create(Application);
  try
    with fmAccountCashRashod do
    begin
      quDolg.ParamByName('PostNo').AsInteger := l_PostNo;
      EditDate.Text := DateToStr(Now);
      EditSumma.Text := '0,00';
      quDolg.Open;
      Caption := 'Расход на ' + quDolgName.AsString;
    end;
    fmAccountCashRashod.ShowModal;
  finally
    fmAccountCashRashod.quDolg.Close;
    fmAccountCashRashod.Free;
  end;
end;

procedure TfmExpedition.ActionPayDrivingExecSQL(Sender: TObject);
var
  old_id: integer;

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////

  Linking_Number_Plat: string;   // связывающий номер экспедицию и расходную накладную
  Expedition_Number: string;   // номер экспедиции
  Number_response_dept_id: string;   // номер response_dept_id

begin
  old_id := quExpedition.FieldByName('ExpeditionNo').AsInteger;
  Screen.Cursor := crHourGlass;
  sp_Modify_ExpeditionPay.Close;
  //sp_Modify_ExpeditionPay.Prepare;
  sp_Modify_ExpeditionPay.Params.ParamByName('p_ExpeditionNo').Value := quExpedition.FieldByName('ExpeditionNo').AsInteger;
  sp_Modify_ExpeditionPay.Params.ParamByName('p_link_type').Value := 'PAYDRIVING';
  sp_Modify_ExpeditionPay.Params.ParamByName('p_userNo').Value := Data.UserNo;
  sp_Modify_ExpeditionPay.Params.ParamByName('p_date_plat').Value := main.GlobalDateNakl;
  sp_Modify_ExpeditionPay.ExecProc;
  quExpedition.Close;
  quExpedition.Open;
  quExpedition.Locate('ExpeditionNo', Old_id, []);
  Screen.Cursor := crDefault;

  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //  START -->   авто дополнение
  try

    Expedition_Number := quExpedition.FieldByName('ExpeditionNo').AsString;
    MSQuery_Expedition_response_id.Close;
    MSQuery_Expedition_response_id.SQL.Clear;
    MSQuery_Expedition_response_id.SQL.Add('SELECT * FROM [work].[dbo].[PlatR] WHERE  platno IN (SELECT slave_id FROM   [work].[dbo].[E_ENTITY_LINK] WHERE  master_id = ' + Expedition_Number + ' AND link_type = ''PAYDRIVING'')');
    MSQuery_Expedition_response_id.Active := true;

    Linking_Number_Plat := MSQuery_Expedition_response_id.FieldByName('platno').Value;
    Expedition_Number := MSQuery_Expedition_response_id.FieldByName('activity_type_id').Value;

    if ((StrToInt(Expedition_Number) = 1) or (StrToInt(Expedition_Number) = 2) or (StrToInt(Expedition_Number) = 21) or (StrToInt(Expedition_Number) = 22) or (StrToInt(Expedition_Number) = 24) or (StrToInt(Expedition_Number) = 26)) then
    begin
      Number_response_dept_id := IntToStr(2);
    end
    else if ((StrToInt(Expedition_Number) >= 3) and (StrToInt(Expedition_Number) <= 10) or (StrToInt(Expedition_Number) = 23) or (StrToInt(Expedition_Number) = 25)) then
    begin
      Number_response_dept_id := IntToStr(4);
    end
    else if ((StrToInt(Expedition_Number) >= 11) and (StrToInt(Expedition_Number) <= 13)) then
    begin
      Number_response_dept_id := IntToStr(11);
    end
    else if ((StrToInt(Expedition_Number) >= 14) and (StrToInt(Expedition_Number) <= 16)) then
    begin
      Number_response_dept_id := IntToStr(14);

    end
    else if ((StrToInt(Expedition_Number) >= 17) and (StrToInt(Expedition_Number) <= 20)) then
    begin
      Number_response_dept_id := IntToStr(17);

    end
    else if ((StrToInt(Expedition_Number) >= 27) and (StrToInt(Expedition_Number) <= 29) or (StrToInt(Expedition_Number) = 31)) then
    begin
      Number_response_dept_id := IntToStr(20);
    end
    else if ((StrToInt(Expedition_Number) = 30)) then
    begin
      Number_response_dept_id := IntToStr(21);
    end
    else
    begin
      Number_response_dept_id := '';
    end;

    MSQuery_Expedition_response_id.Close;
    MSQuery_Expedition_response_id.SQL.Clear;
    MSQuery_Expedition_response_id.SQL.Add('UPDATE [work].[dbo].[PlatR] SET response_dept_id=' + Number_response_dept_id + ' WHERE platno =' + Linking_Number_Plat);
    MSQuery_Expedition_response_id.Execute;

  except
    on E: Exception do
      ShowMessage(E.ClassName + ' error raised, with message : ' + E.Message + #13#10 + 'Автозаполнение невозможно т.к. ключевые значения пусты!');
  end;
 //  END -->   авто дополнение
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

end;

procedure TfmExpedition.ActionPayForwardingExecSQL(Sender: TObject);
var
  old_id: integer;

    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////

  Linking_Number_Plat: string;   // связывающий номер экспедицию и расходную накладную
  Expedition_Number: string;   // номер экспедиции
  Number_response_dept_id: string;   // номер response_dept_id

begin
  old_id := quExpedition.FieldByName('ExpeditionNo').AsInteger;
  Screen.Cursor := crHourGlass;
  sp_Modify_ExpeditionPay.Close;
  //sp_Modify_ExpeditionPay.Prepare;
  sp_Modify_ExpeditionPay.Params.ParamByName('p_ExpeditionNo').Value := quExpedition.FieldByName('ExpeditionNo').AsInteger;
  sp_Modify_ExpeditionPay.Params.ParamByName('p_link_type').Value := 'PAYFORWARD';
  sp_Modify_ExpeditionPay.Params.ParamByName('p_userNo').Value := Data.UserNo;
  sp_Modify_ExpeditionPay.Params.ParamByName('p_date_plat').Value := main.GlobalDateNakl;
  sp_Modify_ExpeditionPay.ExecProc;
  quExpedition.Close;
  quExpedition.Open;
  quExpedition.Locate('ExpeditionNo', Old_id, []);
  Screen.Cursor := crDefault;



    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //  START -->   авто дополнение
  try

    Expedition_Number := quExpedition.FieldByName('ExpeditionNo').AsString;
    MSQuery_Expedition_response_id.Close;
    MSQuery_Expedition_response_id.SQL.Clear;
    MSQuery_Expedition_response_id.SQL.Add('SELECT * FROM [work].[dbo].[PlatR] WHERE  platno IN (SELECT slave_id FROM   [work].[dbo].[E_ENTITY_LINK] WHERE  master_id = ' + Expedition_Number + ' AND link_type = ''PAYFORWARD'')');
    MSQuery_Expedition_response_id.Active := true;

    Linking_Number_Plat := MSQuery_Expedition_response_id.FieldByName('platno').Value;
    Expedition_Number := MSQuery_Expedition_response_id.FieldByName('activity_type_id').Value;

    if ((StrToInt(Expedition_Number) = 1) or (StrToInt(Expedition_Number) = 2) or (StrToInt(Expedition_Number) = 21) or (StrToInt(Expedition_Number) = 22) or (StrToInt(Expedition_Number) = 24) or (StrToInt(Expedition_Number) = 26)) then
    begin
      Number_response_dept_id := IntToStr(2);
    end
    else if ((StrToInt(Expedition_Number) >= 3) and (StrToInt(Expedition_Number) <= 10) or (StrToInt(Expedition_Number) = 23) or (StrToInt(Expedition_Number) = 25)) then
    begin
      Number_response_dept_id := IntToStr(4);
    end
    else if ((StrToInt(Expedition_Number) >= 11) and (StrToInt(Expedition_Number) <= 13)) then
    begin
      Number_response_dept_id := IntToStr(11);
    end
    else if ((StrToInt(Expedition_Number) >= 14) and (StrToInt(Expedition_Number) <= 16)) then
    begin
      Number_response_dept_id := IntToStr(14);

    end
    else if ((StrToInt(Expedition_Number) >= 17) and (StrToInt(Expedition_Number) <= 20)) then
    begin
      Number_response_dept_id := IntToStr(17);

    end
    else if ((StrToInt(Expedition_Number) >= 27) and (StrToInt(Expedition_Number) <= 29) or (StrToInt(Expedition_Number) = 31)) then
    begin
      Number_response_dept_id := IntToStr(20);
    end
    else if ((StrToInt(Expedition_Number) = 30)) then
    begin
      Number_response_dept_id := IntToStr(21);
    end
    else
    begin
      Number_response_dept_id := '';
    end;

    MSQuery_Expedition_response_id.Close;
    MSQuery_Expedition_response_id.SQL.Clear;
    MSQuery_Expedition_response_id.SQL.Add('UPDATE [work].[dbo].[PlatR] SET response_dept_id=' + Number_response_dept_id + ' WHERE platno =' + Linking_Number_Plat);
    MSQuery_Expedition_response_id.Execute;

  except
    on E: Exception do
      ShowMessage(E.ClassName + ' error raised, with message : ' + E.Message + #13#10 + 'Автозаполнение невозможно т.к. ключевые значения пусты!');
  end;
 //  END -->   авто дополнение
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

end;

function TfmExpedition.ftPostIsSelect(Sender: TObject): Boolean;
var
  ID: integer;
begin
  Result := TMlekoSelectFirmDlg.SelectFirm(ID);
  if Result then
  begin
    dmDataModule.quWork.SQL.Clear;
    dmDataModule.quWork.SQL.Add('select NameLong from Post where PostNo=' + IntToStr(ID));
    dmDataModule.quWork.Open;
    (Sender as TcitCustomEdit).Text := dmDataModule.quWork.FieldByName('NameLong').AsString;
    (Sender as TcitDBComboEdit).KeyFieldValue := IntToStr(ID);
  end;
end;

procedure TfmExpedition.quExpeditionBeforeOpen(DataSet: TDataSet);
var
  s: string;
begin
  quRoute.Open;
  if ftPost.Text <> '' then
  begin
    s := ftPost.KeyFieldValue;
    fmExpedition.quExpedition.MacroByName('_firm').Value := ' and h.PostNo=' + s + ' ';
  end
  else
    fmExpedition.quExpedition.MacroByName('_firm').Value := '';

//  showmessage(fmExpedition.quExpedition.SQL.Text);
end;

procedure TfmExpedition.ActionViewRefreshExecSQL(Sender: TObject);
begin
  quExpedition.Close;
  quExpedition.Open;
  quFreeNakl.Close;
  quFreeNakl.Open;
  tsFreeNakl.Caption := 'Накладные не включенные в ходки (' + IntToStr(quFreeNakl.RecordCount) + ')';
  if quFreeNakl.RecordCount > 0 then
    tsFreeNakl.Color := clFuchsia
  else
    tsFreeNakl.Color := clBtnFace;
end;

procedure TfmExpedition.ActionPayAllExecSQL(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  quExpedition.First;
  while not quExpedition.Eof do
  begin
    if quExpeditionPayDriving.AsFloat <> 0 then
    begin
      sp_Modify_ExpeditionPay.Close;
      //    sp_Modify_ExpeditionPay.Prepare;
      sp_Modify_ExpeditionPay.Params.ParamByName('p_ExpeditionNo').Value := quExpedition.FieldByName('ExpeditionNo').AsInteger;
      sp_Modify_ExpeditionPay.Params.ParamByName('p_link_type').Value := 'PAYDRIVING';
      sp_Modify_ExpeditionPay.Params.ParamByName('p_userNo').Value := Data.UserNo;
      sp_Modify_ExpeditionPay.Params.ParamByName('p_date_plat').Value := main.GlobalDateNakl;
      sp_Modify_ExpeditionPay.ExecProc;
    end;

    if quExpeditionPayForwarding.AsFloat <> 0 then
    begin
      sp_Modify_ExpeditionPay.Close;
      sp_Modify_ExpeditionPay.Prepare;
      sp_Modify_ExpeditionPay.Params.ParamByName('p_ExpeditionNo').Value := quExpedition.FieldByName('ExpeditionNo').AsInteger;
      sp_Modify_ExpeditionPay.Params.ParamByName('p_link_type').Value := 'PAYFORWARD';
      sp_Modify_ExpeditionPay.Params.ParamByName('p_userNo').Value := Data.UserNo;
      sp_Modify_ExpeditionPay.Params.ParamByName('p_date_plat').Value := main.GlobalDateNakl;
      sp_Modify_ExpeditionPay.ExecProc;
    end;
    quExpedition.Next;
  end;

  quExpedition.Close;
  quExpedition.Open;
  Screen.Cursor := crDefault;
end;

procedure TfmExpedition.FormShow(Sender: TObject);
begin
  QuFootRoute.Open;
end;

procedure TfmExpedition.DBGridEh1Columns10UpdateData(Sender: TObject; var Text: string; var Value: Variant; var UseText, Handled: Boolean);
var
  without_expedition: boolean;
begin
  without_expedition := (quExpeditionShipping_AgentName.AsString = '+Водитель');
  dmDataModule.OpenSQL('select is_our from cars where CarsNo = :p1_id', [quExpeditionCarsNo.AsInteger]);

  quExpeditionPayDriving.AsFloat := quRoute.FieldByName('PayDriving').AsFloat;
  if without_expedition and not (dmDataModule.QFO.FieldByName('is_our').AsBoolean) then
    quExpeditionPayForwarding.AsFloat := quRoute.FieldByName('PayForwarding').AsFloat
  else
    quExpeditionPayForwarding.AsFloat := 0;
  quExpeditionDistance.AsInteger := quRoute.FieldByName('Distance').AsInteger;

end;

procedure TfmExpedition.FormCreate(Sender: TObject);
var
  i: integer;
begin
  if data.CodeAccess < 0 then
  begin
    for i := 0 to DBGridEh1.Columns.Count - 1 do
    begin
      if (UpperCase(DBGridEh1.Columns[i].FieldName) = 'PAYDRIVING') or (UpperCase(DBGridEh1.Columns[i].FieldName) = 'PAYFORWARDING') or (UpperCase(DBGridEh1.Columns[i].FieldName) = 'DISTANCE') then
        DBGridEh1.Columns[i].ReadOnly := false;
    end;
  end;
end;

procedure TfmExpedition.Button1Click(Sender: TObject);
var
  Period: TPeriodDate;
  CheckDeyExpedition, ListDeletedExpedition: TMSQuery;
  msg: string;
  DateBlock: TDateTime;
begin
  inherited;
  Period := ZapDate(1);
  DateB := Period[1];

  CheckDeyExpedition := TMSQuery.Create(nil);
  CheckDeyExpedition.Connection := dmDataModule.DB;
  CheckDeyExpedition.SQL.Clear;
  CheckDeyExpedition.SQL.Text := 'select isnull(count(route_id),0) as is_Route ' + ' from Expedition                             ' + '  where ExpeditionDateGo = :ExpeditionDateGo ';
  CheckDeyExpedition.ParamByName('ExpeditionDateGo').AsDate := DateB;
  CheckDeyExpedition.Prepare;
  CheckDeyExpedition.Open;

  dmDataModule.quWork.SQL.Clear;
  dmDataModule.quWork.SQL.Add('select * from SetupForExpedition ');
  dmDataModule.quWork.Open;

  DateBlock := dmDataModule.quWork.FieldByName('DateBlock').AsDateTime;

  if DateBlock >= DateB then
  begin
    msg := 'Удаление запрещено!' + #10#13 + 'Период заблокирован';
    raise Exception.Create(msg);
  end;

  if CheckDeyExpedition.FieldByName('is_Route').Value > 0 then
  begin
    msg := 'Удаление запрещено!' + #10#13 + 'Для возможности удаления необходимо отвязать маршруты от всех ходок';
    raise Exception.Create(msg);
  end;
  CheckDeyExpedition.Close;

  ListDeletedExpedition := TMSQuery.Create(nil);
  ListDeletedExpedition.Connection := dmDataModule.DB;
  ListDeletedExpedition.SQL.Clear;
  ListDeletedExpedition.SQL.Text := 'select * from Expedition                     ' + '  where ExpeditionDateGo = :ExpeditionDateGo ';
  ListDeletedExpedition.ParamByName('ExpeditionDateGo').AsDate := DateB;
  ListDeletedExpedition.Prepare;
  ListDeletedExpedition.Open;
  ListDeletedExpedition.First;

  while not ListDeletedExpedition.Eof do
  begin
    dmDataModule.quWork.SQL.Clear;
    dmDataModule.quWork.SQL.Add('if (select VidNaklNo from NaklR where ExpeditionNo = :ExpeditionNo1) = 3 ' + ' update NaklR                                                            ' + '  set ExpeditionNo = 0                                                   ' + '  set InCar = 0                                                          ' + ' where ExpeditionNo = :ExpeditionNo  ');
    dmDataModule.quWork.ParamByName('ExpeditionNo').Value := ListDeletedExpedition.FieldByName('ExpeditionNo').Value;
    dmDataModule.quWork.ParamByName('ExpeditionNo1').Value := ListDeletedExpedition.FieldByName('ExpeditionNo').Value;
    dmDataModule.quWork.Prepare;
    dmDataModule.quWork.Execute;

    dmDataModule.quWork.SQL.Clear;
    dmDataModule.quWork.SQL.Add('update NaklR                         ' + '  set ExpeditionNo = 0               ' + ' where ExpeditionNo = :ExpeditionNo  ');
    dmDataModule.quWork.ParamByName('ExpeditionNo').Value := ListDeletedExpedition.FieldByName('ExpeditionNo').Value;
    dmDataModule.quWork.Prepare;
    dmDataModule.quWork.Execute;

    dmDataModule.quWork.SQL.Clear;
    dmDataModule.quWork.SQL.Add('update e_blank_head                 ' + ' set ExpeditionNo = 0               ' + 'where (ExpeditionNo = :ExpeditionNo ');
    dmDataModule.quWork.ParamByName('ExpeditionNo').Value := ListDeletedExpedition.FieldByName('ExpeditionNo').Value;
    dmDataModule.quWork.Prepare;
    dmDataModule.quWork.Execute;

    dmDataModule.quWork.SQL.Clear;
    dmDataModule.quWork.SQL.Add('delete from L_ExpeditionWithLogistic ' + ' where ExpeditioinNo = :ExpeditionNo ');
    dmDataModule.quWork.ParamByName('ExpeditionNo').Value := ListDeletedExpedition.FieldByName('ExpeditionNo').Value;
    dmDataModule.quWork.Prepare;
    dmDataModule.quWork.Execute;

    dmDataModule.quWork.SQL.Clear;
    dmDataModule.quWork.SQL.Add('delete from Expedition                  ' + ' where ExpeditionNo = :OLD_ExpeditionNo ');
    dmDataModule.quWork.ParamByName('ExpeditionNo').Value := ListDeletedExpedition.FieldByName('ExpeditionNo').Value;
    dmDataModule.quWork.Prepare;
    dmDataModule.quWork.Execute;

    ListDeletedExpedition.Next;
  end;

end;

end.


