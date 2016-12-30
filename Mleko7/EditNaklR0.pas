unit EditNaklR0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  cxGraphics, frxClass, frxExportXLS, MsAccess, DB, MemDS,
  DBAccess, ComCtrls, ToolWin, Grids, DBGrids, RXDBCtrl, StdCtrls, Buttons,
  cxDropDownEdit, cxCalendar, cxDBEdit, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  DBCtrls, Mask, ExtCtrls, ActnList, cxCheckBox, Variants, DBGridEh,
  DBCtrlsEh, DBLookupEh;

type
  TfmEditNaklR = class(TMlekoForm)
    Panel1: TPanel;
    Panel2: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    dsRashod: TDataSource;
    ActionList1: TActionList;
    ActionSetReadOnly: TAction;
    DSColNPrice: TDataSource;
    quListPrice: TMSQuery;
    ActionSetColNPrice: TAction;
    quStatus: TMSQuery;
    spSetStatus: TMSStoredProc;
    frxXLSExport1: TfrxXLSExport;
    quNaklR: TMSQuery;
    DSNaklR: TDataSource;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ActionGenReturn: TAction;
    ActionViewRefresh: TAction;
    ActionPrint: TAction;
    ActionExcel: TAction;
    quBuhType: TMSQuery;
    DsBuhType: TDataSource;
    quVidNakl: TMSQuery;
    dsVidNakl: TDataSource;
    dsSotrud: TDataSource;
    SpGetNewNom: TMSStoredProc;
    ToolButton5: TToolButton;
    QuOtdel: TMSQuery;
    DsOtdel: TDataSource;
    DSStatus: TDataSource;
    DbLCbStatus: TcxDBLookupComboBox;
    dbCbSvedenie: TcxDBCheckBox;
    ToolButton6: TToolButton;
    ActionSvedenie: TAction;
    ActionAudit: TAction;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    QuSetArtGroup: TMSQuery;
    DsSetArtGroup: TDataSource;
    TTN_Query: TMSQuery;
    scrlbx: TScrollBox;
    dblkcbbVidNaklName: TDBLookupComboBox;
    dblkcbbBuhName: TDBLookupComboBox;
    lblSet: TLabel;
    lbl6: TLabel;
    lbl5: TLabel;
    lbl4: TLabel;
    lbl3: TLabel;
    lbl2: TLabel;
    lbl1: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    dbedtNom: TDBEdit;
    dbedtName: TDBEdit;
    dbedtAddress: TDBEdit;
    cbbDbLCbListPrice: TcxDBLookupComboBox;
    dbedtUserName: TDBEdit;
    dbedtSummaDolg: TDBEdit;
    dbedtSumma: TDBEdit;
    dbedtDateRealOpl: TDBEdit;
    dbedtDateOpl: TDBEdit;
    dbedt1: TDBEdit;
    dbedt2: TDBEdit;
    dbedt3: TDBEdit;
    cxdbdtdt1: TcxDBDateEdit;
    cbbSet: TcxDBLookupComboBox;
    btn1: TButton;
    ActionPrintTTN: TAction;
    dsDayDelay: TDataSource;
    quDayDelay: TMSQuery;
    quDayDelayPOSTNO: TLargeintField;
    quDayDelayDAY_DELAY: TIntegerField;
    quDayDelayDAY_DELAY_EXT: TIntegerField;
    quDayDelayExtDelay: TIntegerField;
    quDayDelayID: TLargeintField;
    quDayDelayNAME: TStringField;
    quDayDelayNamePost: TStringField;
    quNaklRNaklNo: TIntegerField;
    quNaklRNom: TIntegerField;
    quNaklRPostNo: TSmallintField;
    quNaklRDateNakl: TDateTimeField;
    quNaklRSumma: TFloatField;
    quNaklRSummaDolg: TFloatField;
    quNaklRVidNaklNo: TSmallintField;
    quNaklRName: TStringField;
    quNaklRColnPrice: TSmallintField;
    quNaklRBuh: TSmallintField;
    quNaklRSotrudNo: TSmallintField;
    quNaklRSotrudName: TStringField;
    quNaklRUserName: TStringField;
    quNaklRDateNaklFirst: TDateTimeField;
    quNaklRAsk: TBooleanField;
    quNaklRAddressNo: TSmallintField;
    quNaklRNameFirst: TStringField;
    quNaklRDateOpl: TDateTimeField;
    quNaklRRealDateOpl: TDateTimeField;
    quNaklRPostNoFirst: TSmallintField;
    quNaklRAddress: TStringField;
    quNaklRWeight: TFloatField;
    quNaklRKolPerPak: TFloatField;
    quNaklROtdelName: TStringField;
    quNaklROtdelNo: TSmallintField;
    quNaklRNameReturn: TStringField;
    quNaklRNomReturn: TLargeintField;
    quNaklRPrint3: TBooleanField;
    quNaklRInCar: TBooleanField;
    quNaklRExpeditionNo: TIntegerField;
    quNaklRNameAddress: TStringField;
    quNaklREdit_status_name: TStringField;
    quNaklREdit_Status_id: TSmallintField;
    quNaklRUserNo: TSmallintField;
    quNaklRask_1: TBooleanField;
    quNaklRViDNaklName: TStringField;
    quNaklRPkey: TLargeintField;
    quNaklRsvedenie: TBooleanField;
    quNaklRSET_ARTICLE_GROUP_NAME: TStringField;
    quNaklRSET_ARTICLE_GROUP_ID: TLargeintField;
    bRecalculation: TButton;
    sp_RecalculationNakl: TMSStoredProc;
    quNaklREntity: TMSQuery;
    quNaklREntityid: TLargeintField;
    quNaklREntityentityno: TIntegerField;
    quNaklREntityentity_type: TStringField;
    quNaklREntityentityno_plat: TIntegerField;
    quNaklREntityentity_type_plat: TStringField;
    quNaklREntitylink_summa: TFloatField;
    quNaklREntitylink_date: TDateTimeField;
    quNaklREntitylink_userno: TIntegerField;
    quNaklREntityplat_sign: TSmallintField;
    quNaklREntityfactor_direction: TSmallintField;
    quNaklREntitydelta: TFloatField;
    quNaklREntitypkey: TLargeintField;
    quNaklREntityentity_type_1: TStringField;
    quNaklREntityentity_type_name: TStringField;
    quNaklREntitynom: TIntegerField;
    quNaklREntitypostno: TSmallintField;
    quNaklREntitypost_name: TStringField;
    quNaklREntitydateentity: TDateTimeField;
    quNaklREntitysumma: TFloatField;
    quNaklREntitybuh: TSmallintField;
    quNaklREntitybuh_type_name: TStringField;
    quNaklREntityDESCRIPTION: TStringField;
    quNaklREntitydoc_type_id: TIntegerField;
    quNaklREntitydoc_type_name: TStringField;
    quNaklREntityuserno: TSmallintField;
    quNaklREntityusername: TStringField;
    quNaklREntitysotrudno: TIntegerField;
    quNaklREntitysotrudname: TStringField;
    quNaklREntitybank_invoice_id: TIntegerField;
    quNaklREntitybank_name: TStringField;
    quNaklREntityactivity_type_id: TSmallintField;
    quNaklREntityactivity_type_name: TStringField;
    quNaklREntityanalyticaccno: TIntegerField;
    quNaklREntityvidrashod_name: TStringField;
    quNaklREntityotdelno: TIntegerField;
    quNaklREntityotdel_name: TStringField;
    quNaklREntityourfirmno: TIntegerField;
    quNaklREntityourfirm_name: TStringField;
    quNaklREntityis_econom: TIntegerField;
    quNaklREntityentityno_1: TIntegerField;
    quNaklREntitycolnprice: TSmallintField;
    quNaklREntitycolnprice_name: TStringField;
    quNaklREntityaddressno: TSmallintField;
    quNaklREntityaddress: TStringField;
    quNaklREntitypostnoreturn: TSmallintField;
    quNaklREntitypostreturn_name: TStringField;
    quNaklREntityid_1: TIntegerField;
    quNaklREntitykoldaydelay: TIntegerField;
    quNaklREntityreason_id: TIntegerField;
    quNaklREntityvidtovgroup_id: TIntegerField;
    quNaklREntityvidtovgroup_name: TStringField;
    quNaklREntitycontract_id: TIntegerField;
    quNaklREntitycontract_description: TStringField;
    quNaklREntitypkey_1: TLargeintField;
    quNaklREntityfreesumma: TFloatField;
    quNaklREntityentity_type_id: TIntegerField;
    quNaklRTypeReturnNo: TIntegerField;
    quNaklRTypeReturnName: TStringField;
    quTypeReturn: TMSQuery;
    quTypeReturnTypeReturnNo: TIntegerField;
    quTypeReturnTypeReturnName: TStringField;
    quTypeReturnActive: TFloatField;
    dsTypeReturn: TMSDataSource;
    DBLookupComboboxEhTypeReturn: TDBLookupComboboxEh;
    Label3: TLabel;
    quVidNaklVidNaklNo: TSmallintField;
    quVidNaklVidNaklName: TStringField;
    Button1: TButton;
    spChackNaklR: TMSStoredProc;
    Button2: TButton;
    Label1: TLabel;
    quNaklRCurrencyHead: TStringField;
    quNaklRCurrencyAccounting: TStringField;
    quNaklRSummaCurrencyAccounting: TFloatField;
    quNaklRSummaDolgCurrencyAccounting: TFloatField;
    Label2: TLabel;
    dbedtSummaCurrencyAccounting: TDBEdit;
    dbedtSummaDolgCurrencyAccounting: TDBEdit;
    Label4: TLabel;
    dbnedtRateCurrencyAccounting: TDBNumberEditEh;
    quNaklRRateCurrencyAccounting: TFloatField;
    Label5: TLabel;
    Label6: TLabel;
    DBText1: TDBText;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    dbedtCurrencyAccounting: TDBEditEh;
    procedure ScrollBoxExit(Sender: TObject);
    procedure dbedtNameEnter(Sender: TObject);
    procedure dbedtNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ChangePost;
    procedure dbedtNameDblClick(Sender: TObject);
    procedure deNamePostFirstKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure Button3Click(Sender: TObject);
    procedure ActionViewRefreshExecute(Sender: TObject);
    procedure ActionGenReturnExecute(Sender: TObject);
    procedure ActionExcelExecute(Sender: TObject);
    procedure ActionPrintExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DSNaklRDataChange(Sender: TObject; Field: TField);
    procedure ActionSvedenieExecute(Sender: TObject);
    procedure ActionAuditExecute(Sender: TObject);
    procedure dsRashodDataChange(Sender: TObject; Field: TField);
    procedure quNaklRAfterPost(DataSet: TDataSet);
    procedure quNaklRBeforeOpen(DataSet: TDataSet);
    procedure dsRashodStateChange(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbbSetExit(Sender: TObject);
    procedure RxDBGrid1CellClick(Column: TColumn);
    procedure RxDBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbbSetPropertiesChange(Sender: TObject);
    procedure dbedtNameChange(Sender: TObject);
    procedure bRecalculationClick(Sender: TObject);
    procedure DBLookupComboboxEhTypeReturnExit(Sender: TObject);
    procedure dblkcbbVidNaklNameExit(Sender: TObject);
    procedure dblkcbbBuhNameClick(Sender: TObject);
    procedure dblkcbbBuhNameExit(Sender: TObject);
    procedure cbbSetFocusChanged(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure cbbDbLCbListPriceExit(Sender: TObject);
    procedure dblkcbbVidNaklNameCloseUp(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    function CheckNaklR(pPostno : Integer; pDateNakl: TDate; SET_ARTICLE_GROUP_ID: Int64; var err_message: string): Integer;
    procedure Button2Click(Sender: TObject);
    procedure dbtCurrencyAccountingDblClick(Sender: TObject);
    procedure dbnedtRateCurrencyAccountingChange(Sender: TObject);
    procedure dbnedtRateCurrencyAccountingExit(Sender: TObject);
  private
    isReturn: Boolean;
    isTara: Boolean;
    isRecalculation : Boolean;
    isSvedenie: Boolean;
    Dhead_ID: Int64;
    NoRashod: Integer;
    RashodFirst, RashodNow: Extended;
    BegDateNakl: string;
    Action: string;
    SArticleGroupDouble: Int64;
    PostNo: integer;
    is_insert: boolean;
  public
    class procedure EditNaklR(var Pkey: Int64; aAction: string; pIsReturn: Boolean; pIsTara: Boolean; pisSvedenie: Boolean = false);
  end;

implementation

uses Data, SelectItem0, Ostatok, TovarSvedenie0, main,
     qrNaklNdsNew, qrCheckSklad0, Otchets0, PostForNaklRUnit, CFLFrxReport,
     MlekoDbDsMSSQL, MlekoSelectFIrm, NaklR_Soravka,OstatokFiltr,Meko_Blanc_Price,
     ListTovarDateOfManufaktureForNakl,Currency;

{$R *.DFM}

class procedure TfmEditNaklR.EditNaklR(var Pkey: Int64; aAction: string; pIsReturn: Boolean; pIsTara: Boolean; pisSvedenie: Boolean = false);
var
  fmEditNaklR: TfmEditNaklR;
  DateNow, DateNakl: string;
  msg,msg1: string;
  CurrencyAccounting: string;
  RateCurrencyAccounting: real;
begin
  fmEditNaklR := TfmEditNaklR.Create(Application);
  with fmEditNaklR do
  begin
    try
      Dhead_ID := Pkey;

      isRecalculation := False;

      quBuhType.OPen;
      quVidNakl.Open;
      QuOtdel.Open;
//      QuSetArtGroup.Open;
      quListPrice.Open;
      quStatus.Open;
      quTypeReturn.Open;
      DBLookupComboboxEhTypeReturn.KeyValue := 0;


      Action := aAction;


      if aAction = 'EDIT' then
      begin

        quNaklR.Close;
        quNaklR.ParamByName('dhead_id').Value := Pkey;
        quNaklR.Open;

        quNaklR.Edit;

        CurrencyAccounting := '';
        dmDataModule.OpenSQL('select l_code from d_currency where isDefault = 1');
        CurrencyAccounting := dmDataModule.QFO.FieldByName('l_code').Value;

        if quNaklRCurrencyAccounting.IsNull then quNaklRCurrencyAccounting.AsString := CurrencyAccounting;

//        showmessage(quNaklRCurrencyAccounting.AsString);

        dbedtCurrencyAccounting.Text := CurrencyAccounting; //quNaklRCurrencyAccounting.AsString;

        RateCurrencyAccounting:= 0;
        dmDataModule.OpenSQL('select ce.Rate from D_CURRENCY c inner join CurrencyExchange ce on c.IsDefault = 1 and ce.IsActive = 1 and ce.CurrencyId = c.ID and c.isTrash = 0');
        RateCurrencyAccounting := dmDataModule.QFO.FieldByName('Rate').Value;

        if quNaklRRateCurrencyAccounting.IsNull then quNaklRRateCurrencyAccounting.Value := RateCurrencyAccounting;

        quNaklREntity.Close;
        quNaklREntity.ParamByName('p_PlatNo1').Value := quNaklRNaklNo.Value;
        quNaklREntity.ParamByName('p_LinkNaklType1').Value := 'NAKLR';
        quNaklREntity.ParamByName('p_PlatNo2').Value := quNaklRNaklNo.Value;
        quNaklREntity.ParamByName('p_LinkNaklType2').Value := 'NAKLR';
        quNaklREntity.Open;

        if ((dblkcbbVidNaklName.Text = 'Возврат') or (dblkcbbVidNaklName.Text = 'Возврат по акту') or (dblkcbbVidNaklName.Text = 'Списание')) Then begin
                                                                                                                                                     DBLookupComboboxEhTypeReturn.KeyValue := quNaklRTypeReturnNo.Value;
                                                                                                                                                     DBLookupComboboxEhTypeReturn.Enabled := True;
                                                                                                                                                     if (DBLookupComboboxEhTypeReturn.Text = '') then DBLookupComboboxEhTypeReturn.KeyValue := 0;
                                                                                                                                                     ActiveControl := DBLookupComboboxEhTypeReturn;
                                                                                                                                                   end
                                                                                                                                              Else DBLookupComboboxEhTypeReturn.Enabled := False;

        if (quNaklREntity.RecordCount > 0) then begin
                                                  quNaklREntity.First;
                                                  while not quNaklREntity.Eof do
                                                    begin
                                                      msg1:= msg1 + inttostr(quNaklREntityentityno_plat.Value) + ' ' + quNaklREntityentity_type_plat.Value + #10#13;
                                                      quNaklREntity.Next;
                                                    end;
                                                  msg:= 'Редактирование запрещено!' + #10#13 +
                                                        'Для возможности редактирования необходимо отвязать документы:' + #10#13 + msg1;
//                                                  quNaklR.Close;
                                                  quNaklREntity.Close;
                                                  raise Exception.Create(msg);
                                                end;

//        if quNaklR.State in [dsEdit, dsInsert] then quNaklR.Post;


        if (DBLookupComboboxEhTypeReturn.KeyValue = 0) or (DBLookupComboboxEhTypeReturn.Text = '') then quNaklRTypeReturnNo.Value := 0
                                                                                                   else quNaklRTypeReturnNo.Value := DBLookupComboboxEhTypeReturn.KeyValue;

        quNaklRDateOpl.AsDateTime := quNaklR.FieldByName('DateOpl').AsDateTime;
        QuSetArtGroup.Close;
        QuSetArtGroup.ParamByName('NamePost').AsString := quNaklR.FieldByName('Name').Value;
        QuSetArtGroup.Open;

        quDayDelay.Close;
        quDayDelay.ParamByName('NamePost').AsString := quNaklR.FieldByName('Name').Value;
        quDayDelay.ParamByName('NameGroup').AsString := cbbSet.Text;
        quDayDelay.Open;

        dbedtAddress.Text := quNaklRNameAddress.Value;

        isReturn := ((quNaklR.FieldByName('VidNaklNo').AsInteger = 3)or(quNaklR.FieldByName('VidNaklNo').AsInteger = 5));
        isTara := (quNaklR.FieldByName('OtdelNo').AsInteger = 3);

        isSvedenie := pisSvedenie;
        if pisSvedenie then quNaklR.FieldByName('Edit_Status_id').AsInteger := 2;
      end;


      if aAction = 'ADD' then
      begin
        isReturn := pisReturn;
        isTara := pisTara;

        quDayDelay.Close;
        quDayDelay.ParamByName('NamePost').AsString := dbedtName.Text;
        quDayDelay.ParamByName('NameGroup').AsString := cbbSet.Text;
        quDayDelay.Open;


        CurrencyAccounting := '';
        dmDataModule.OpenSQL('select l_code from d_currency where isDefault = 1');
        CurrencyAccounting := dmDataModule.QFO.FieldByName('l_code').Value;

        RateCurrencyAccounting:= 0;
        dmDataModule.OpenSQL('select ce.Rate from D_CURRENCY c inner join CurrencyExchange ce on c.IsDefault = 1 and ce.IsActive = 1 and ce.CurrencyId = c.ID and c.isTrash = 0');
        RateCurrencyAccounting := dmDataModule.QFO.FieldByName('Rate').Value;

        dmDataModule.OpenSQL('select -1*cast(cast(newid() as binary(16)) as bigint) as new_id ');
        dhead_id := dmDataModule.QFO.FieldByName('new_id').Value;
        quNaklR.ParamByName('dhead_id').Value := dhead_id;
        quNaklR.Open;
        quNaklR.Insert;
        quNaklR.FieldByName('pkey').Value := dhead_id;
        quNaklR.FieldByName('Edit_Status_id').AsInteger := 3;
        quNaklR.FieldByName('DateNakl').AsDateTime := Date();
        quNaklR.FieldByName('DateOpl').AsDateTime := Date() + quDayDelay.FieldByName('DAY_DELAY').AsInteger; // quDayDelay.FieldByName('ExtDelay').AsInteger;
        quNaklR.FieldByName('Buh').AsInteger := 1;
        quNaklR.FieldByName('PostNo').AsInteger := 0;
        quNaklR.FieldByName('ColnPrice').AsInteger := 1;
        quNaklR.FieldByName('ExpeditionNo').AsInteger := 0;
        quNaklR.FieldByName('UserNo').AsInteger := Data.UserNo;
        quNaklR.FieldByName('InCar').AsBoolean := True;
        quNaklR.FieldByName('Ask').AsBoolean := false;
        dmDataModule.OpenSQL('Select max(NaklNo)+1 as NaklNo from Naklr');
        quNaklR.FieldByName('NaklNo').AsInteger := dmDataModule.QFO.FieldByName('NaklNo').AsInteger;
        quNaklR.FieldByName('CurrencyAccounting').AsString := CurrencyAccounting;
        quNaklR.FieldByName('RateCurrencyAccounting').Value := RateCurrencyAccounting;

        if (DBLookupComboboxEhTypeReturn.Text = '') then quNaklR.FieldByName('TypeReturnNo').AsInteger := 0
                                                    else quNaklR.FieldByName('TypeReturnNo').AsInteger := DBLookupComboboxEhTypeReturn.KeyValue;


        if isReturn then begin
                           quNaklR.FieldByName('VidNaklNo').AsInteger := 3;
                           if (dblkcbbVidNaklName.Text = 'Возврат') then quNaklR.FieldByName('VidNaklNo').AsInteger := 3;
                           if (dblkcbbVidNaklName.Text = 'Возврат по акту') then quNaklR.FieldByName('VidNaklNo').AsInteger := 5;
                         end
        else
          quNaklR.FieldByName('VidNaklNo').AsInteger := 1;
        if isTara then
        begin
          quNaklR.FieldByName('VidNaklNo').AsInteger := 4;
          quNaklR.FieldByName('OtdelNo').AsInteger := 3;
        end
        else
          quNaklR.FieldByName('OtdelNo').AsInteger := 1;

        SpGetNewNom.ExecProc;
        quNaklR.FieldByName('Nom').AsInteger := SpGetNewNom.ParamByName('ID').AsInteger;
      end;
      DbLCbStatus.Enabled := (data.CodeAccess <= 1);
      cbbSet.Enabled:=(data.CodeAccess <= -2);
      dbCbSvedenie.Enabled := isSvedenie;
      IsReadOnly := (quNaklR.FieldByName('Edit_Status_id').AsInteger in [1, 2]) and (CodeAccess > 1) and not isSvedenie;
      isReturn := ((quNaklR.FieldByName('VidNaklNo').AsInteger = 3) or (quNaklR.FieldByName('VidNaklNo').AsInteger = 5));

      if isReturn then
      begin
        DBLookupComboboxEhTypeReturn.KeyValue := quNaklRTypeReturnNo.Value;
        DBLookupComboboxEhTypeReturn.Enabled := True;
        dblkcbbVidNaklName.Enabled := True;
        dblkcbbVidNaklName.ReadOnly := False;
        ActionGenReturn.Enabled := True;
        ActiveControl := DBLookupComboboxEhTypeReturn;
        dblkcbbVidNaklName.KeyValue := quNaklR.FieldByName('VidNaklNo').AsInteger;
      end;

      DateNow := DateToStr(Now);
      DateNakl := DateToStr(quNaklR.FieldByName('DateNakl').AsDateTime);

//      showmessage(floattostr(Dhead_ID));

      TMlekoDbDsMSSQLDm(CustomDm).quDspec.Close;
      TMlekoDbDsMSSQLDm(CustomDm).quDspec.ParamByName('dhead_id').Value := Dhead_ID;
      TMlekoDbDsMSSQLDm(CustomDm).quDspec.Open;

//      ActiveControl := RxDBGrid1;

      if ShowModal = mrOk then
      begin
        if quNaklR.State in [dsEdit, dsInsert] then begin
                                                      if (quNaklRDateOpl.AsDateTime > (quNaklR.FieldByName('DateNakl').AsDateTime + quDayDelay.FieldByName('ExtDelay').AsInteger)) then
                                                          quNaklRDateOpl.AsDateTime := quNaklR.FieldByName('DateNakl').AsDateTime + quDayDelay.FieldByName('ExtDelay').AsInteger;
                                                      quNaklR.Post;
                                                    end;
        if TMlekoDbDsMSSQLDm(CustomDm).quDspec.State in [dsEdit, dsInsert] then
           TMlekoDbDsMSSQLDm(CustomDm).quDspec.Post;
      end
      else
      begin
        if quNaklR.State in [dsEdit, dsInsert] then
           quNaklR.Cancel;
        if TMlekoDbDsMSSQLDm(CustomDm).quDspec.State in [dsEdit, dsInsert] then
           TMlekoDbDsMSSQLDm(CustomDm).quDspec.Cancel;
      end;
      if varIsNull(quNaklR.FieldByName('Pkey').Value) then
        Pkey := -1
      else
        Pkey := quNaklR.FieldByName('Pkey').Value;
    finally
      TMlekoDbDsMSSQLDm(CustomDm).quDspec.Close;
      quDayDelay.Close;
      quStatus.Close;
      quBuhType.Close;
      quVidNakl.Close;
      QuOtdel.Close;
      QuSetArtGroup.Close;
      quListPrice.Close;
      quNaklR.Close;
      quNaklREntity.Close;
      quTypeReturn.Close;
      Free;
    end;
  end;
end;

procedure TfmEditNaklR.ChangePost;
var
  // RetPostForNaklR:TRetPostForNaklR;
  RetPostForNaklR: TRetPostForNaklR;
  CaseRecalculation : word;
  isAction : boolean;
begin
  RetPostForNaklR := PostForNaklR(Date());
  // RetPost:=Post(True, True);
  isAction := True;
  if RetPostForNaklR.PostNo > 0 then
  begin
      QuSetArtGroup.Close;
      QuSetArtGroup.ParamByName('NamePost').AsString := RetPostForNaklR.NamePost;
      QuSetArtGroup.Open;

      if Action = 'EDIT' then
       begin
         CaseRecalculation := (Application.MessageBox(Pchar('Продолжить? '+#10#13+
                                                            'YES - Продолжить с последующим пересчетом '+#10#13+
                                                            'NO - Продолжить без пересчета '+#10#13+
                                                            'CANCEL - Отменить изменение '),
                                                            'Изменение получателя!', MB_YESNOCANCEL));
         case CaseRecalculation of
          idyes : isRecalculation := True;
          idno  : isRecalculation := False;
          idcancel : begin
                       quNaklR.Cancel;
                       isAction := False;
                     end;
         end;
       end;
    if isAction = True then
     begin
        if not (quNaklR.State in [dsInsert, dsEdit]) then quNaklR.Edit;
        quNaklR.FieldByName('PostNo').AsInteger := RetPostForNaklR.PostNo;
        PostNo := RetPostForNaklR.PostNo;
        quNaklR.FieldByName('Name').AsString := RetPostForNaklR.NamePost;
        quNaklR.FieldByName('SotrudNo').AsInteger := RetPostForNaklR.SotrudNo;
        quNaklR.FieldByName('AddressNo').AsInteger := RetPostForNaklR.AddressNo;
        quNaklR.FieldByName('Address').AsString := RetPostForNaklR.Address;
        if isTara then begin
                          quNaklR.FieldByName('OtdelNo').AsInteger := 3;
                          dmDataModule.OpenSQL('select OtdelName from VidOtdel where OtdelNo = :p1_id', [quNaklR.FieldByName('OtdelNo').AsInteger]);
                       end
                  else quNaklR.FieldByName('OtdelNo').AsInteger := RetPostForNaklR.OtdelNo;
                       dmDataModule.OpenSQL('select SotrudName from Sotrud where SotrudNo= :p1_id', [RetPostForNaklR.SotrudNo]);
                       quNaklR.FieldByName('SotrudName').AsString := dmDataModule.QFO.FieldByNAme('SotrudName').AsString;
                       quNaklR.FieldByName('OtdelName').AsString := RetPostForNaklR.NameOtdel;
     end;

  end;



//            TMlekoDbDsMSSQLDm(CustomDm).quDspec.Delete;
  if isRecalculation = True then
   begin
     cbbSet.Text := '';
     dblkcbbBuhName.KeyValue := 0;
     cbbDbLCbListPrice.Text := '';

     cbbSet.SetFocus;
     ActiveControl := cbbSet;
   end;

end;

procedure TfmEditNaklR.dbedtNameEnter(Sender: TObject);
begin
  if quNaklR.FieldByName('PostNo').AsInteger = 0 then
    ChangePost;
end;

procedure TfmEditNaklR.dbedtNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    ChangePost;
end;

procedure TfmEditNaklR.RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Ost: TOstRet;
  lvidNaklNo, lOtdelNo: Integer;
begin
  lvidNaklNo := quNaklR.FieldByName('VidNaklNo').AsInteger;
  lOtdelNo := quNaklR.FieldByName('OtdelNo').AsInteger;
  case Key of
    VK_DELETE:
      begin
        if not (TMlekoDbDsMSSQLDm(CustomDm).quDspec.State in [dsInsert, dsEdit]) then
        begin
          if (Application.MessageBox('Вы уверены ?', 'Удаление', MB_YESNO) = IDYES) then
            TMlekoDbDsMSSQLDm(CustomDm).quDspec.Delete;
          Key := 0;
        end;
      end;
    VK_INSERT:
      begin
        is_insert := True;
        Key := 0;
        if isReturn then
          Ost := TfmOstatok.GetOstatok(quNaklR.FieldByName('ColnPrice').AsInteger, lvidNaklNo, lOtdelNo, isReturn)
        else
          Ost := TfmOstatok.GetOstatok(quNaklR.FieldByName('ColnPrice').AsInteger, lvidNaklNo, lOtdelNo, isReturn);
        if (Ost.TovarNo <> 0) and (Ost.Kol <> 0) then
        begin
          if quNaklR.State in [dsInsert, dsEdit] then
            quNaklR.Post;
          TMlekoDbDsMSSQLDm(CustomDm).quDspec.Insert;
          TMlekoDbDsMSSQLDm(CustomDm).quDspec.FieldByName('article_id').AsInteger := Ost.TovarNo;
          TMlekoDbDsMSSQLDm(CustomDm).quDspec.FieldByName('article_name').AsString := Ost.NameTovar;
          TMlekoDbDsMSSQLDm(CustomDm).quDspec.FieldByName('qty').AsFloat := Ost.Kol;
          TMlekoDbDsMSSQLDm(CustomDm).quDspec.FieldByName('Price_eco').AsFloat := Ost.Price;
          TMlekoDbDsMSSQLDm(CustomDm).quDspec.FieldByName('dhead_id').Value := Dhead_ID;
          TMlekoDbDsMSSQLDm(CustomDm).quDspec.FieldByName('PRICE_ECO_IN').AsFloat := Ost.AvgPriceIn;
          TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.FieldByName('DateOfManufacture').Value := DateOfManufacture;
          
          TMlekoDbDsMSSQLDm(CustomDm).quDspec.Post;
          is_insert := false;
          DateOfManufacture := 0;
          quNaklR.Refresh;
        end;
      end;
  end;
end;

procedure TfmEditNaklR.dbedtNameDblClick(Sender: TObject);
begin
  ChangePost;
  if (Action = 'EDIT') and (isRecalculation = True)  then begin
                                                            cbbset.SetFocus;
                                                            ActiveControl := cbbSet;
                                                          end;
end;

procedure TfmEditNaklR.deNamePostFirstKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      begin
        Key := 0;
        ChangePost;
      end;
  end;
end;

procedure TfmEditNaklR.FormShow(Sender: TObject);
begin
  lbl4.Visible := False;
  DBEdt1.Visible := False;
  BegDateNakl := cxdbdtdt1.Text;

  if quNaklR.FieldByName('VidNaklNo').AsInteger = 2 then
  begin
    lbl4.Caption := 'Списание возврата код накладной: ' + IntToStr(quNaklR.FieldByName('NomReturn').AsInteger);
    lbl4.Visible := True;
    DBEdt1.Visible := True;
  end;
end;

procedure TfmEditNaklR.RxDBGrid1TitleBtnClick(Sender: TObject;
  ACol: Integer; Field: TField);
var
  id: Int64;
begin
  id := TMlekoDbDsMSSQLDm(CustomDm).quDspec.FieldByName('id').Value;
  TMlekoDbDsMSSQLDm(CustomDm).quDspec.Close;
  case ACol of
    0: TMlekoDbDsMSSQLDm(CustomDm).quDspec.MacroByName('_order').Value := 'order_num';
    1: TMlekoDbDsMSSQLDm(CustomDm).quDspec.MacroByName('_order').Value := 'Vid_Name,Article_Name';
    2: TMlekoDbDsMSSQLDm(CustomDm).quDspec.MacroByName('_order').Value := 'Article_Name';
    3: TMlekoDbDsMSSQLDm(CustomDm).quDspec.MacroByName('_order').Value := 'qty';
  end;
  TMlekoDbDsMSSQLDm(CustomDm).quDspec.Open;
  TMlekoDbDsMSSQLDm(CustomDm).quDspec.Locate('id', id, []);
end;

procedure TfmEditNaklR.Button3Click(Sender: TObject);
var
  Buh: Boolean;
  i: integer;
begin
  if quNaklR.FieldByName('Buh').AsInteger = 2 then
    Buh := True
  else
    Buh := False;
  PrintNaklDesign(quNaklR.FieldByName('NaklNo').AsInteger, False, True, Buh, quNaklR.FieldByName('Print3').AsBoolean);
end;

procedure TfmEditNaklR.ActionViewRefreshExecute(Sender: TObject);
begin
//  quNaklR.Close;
//  quNaklR.Open;
  quNaklR.Refresh;
  TMlekoDbDsMSSQLDm(CustomDm).DspecRefresh;
end;

procedure TfmEditNaklR.ActionGenReturnExecute(Sender: TObject);
var
  l_postNo: Integer;
begin
  if TMlekoSelectFIrmDlg.SelectFirm(l_postNo) then
  begin
    TDmDataModule(MainDM).QFO.Close;
    TDmDataModule(MainDM).QFO.SQL.Clear;
    TDmDataModule(MainDM).QFO.SQL.Add('EXEC pr_gen_anti_return :p1_id, :p2_id');
    TDmDataModule(MainDM).QFO.ParamByName('p1_id').AsString:=quNaklR.FieldByName('Pkey').AsString;
    TDmDataModule(MainDM).QFO.ParamByName('p2_id').AsInteger:=l_postNo;
    TDmDataModule(MainDM).QFO.Execute;
  end;
end;

procedure TfmEditNaklR.ActionExcelExecute(Sender: TObject);
var
  l_report: TCFLFrxReport;
  ExcelFlt: TfrxXLSExport;
begin
  try
    l_report := TCFLFrxReport.GetReport(nil, 48, 30);
    l_report.AddRepParam('p_NaklNo', quNaklR.FieldByName('NaklNo').AsInteger);
    l_report.PrepareReport;
    ExcelFlt := TfrxXLSExport.Create(nil);
    ExcelFlt.OpenExcelAfterExport := true;
    l_report.Export(ExcelFlt);
  finally
    l_report.Free;
    ExcelFlt.Free;
  end;
end;

procedure TfmEditNaklR.ActionPrintExecute(Sender: TObject);
var
  Buh: Boolean;
  i: integer;
begin
  TTN_Query.Close;
  TTN_Query.ParamByName('aa').AsString:=dbedtName.Text;
  TTN_Query.Open;
  if TTN_Query.FieldByName('TTN').AsBoolean  = true then
  i := SelectItem('Печать', ['Расходная', 'Налоговая', 'Счет фактура', 'Чек на склад', 'Список товара','Товарно-транспортная']) else
    i := SelectItem('Печать', ['Расходная', 'Налоговая', 'Счет фактура', 'Чек на склад', 'Список товара']);
  if quNaklR.FieldByName('Buh').AsInteger = 2 then
    Buh := True
  else
    Buh := False;
  case i of
    0: PrintNaklRasNew(quNaklR.FieldByName('NaklNo').AsInteger, False, True, Buh, quNaklR.FieldByName('Print3').AsBoolean);
    //  0:PrintNaklRas(1, quNaklR.FieldByName('NaklNo').AsInteger, True, True);
    1: PrintNaklNdsNew(quNaklR.FieldByName('NaklNo').AsInteger);
    2: PrintSchet(quNaklR.FieldByName('NaklNo').AsInteger, True);
    3: PrintCheckSklad(quNaklR.FieldByName('NaklNo').AsInteger);
    4: PrintNaklRShort(quNaklR.FieldByName('NaklNo').AsInteger, True);
    5: PrintNaklTransportRasNew(quNaklR.FieldByName('NaklNo').AsInteger,True,quNaklR.FieldByName('Print3').AsBoolean);
  end;
end;

procedure TfmEditNaklR.FormCreate(Sender: TObject);
begin
  inherited;
  MainDm := dmDataModule;
 end;

procedure TfmEditNaklR.DSNaklRDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if Assigned(Field) then
    if LowerCase(Field.FieldName) = 'edit_status_id' then
      IsReadOnly := (Field.AsInteger = 1);
end;

procedure TfmEditNaklR.ActionSvedenieExecute(Sender: TObject);
begin
  inherited;
  quNaklR.FieldByName('Svedenie').AsBoolean := not (quNaklR.FieldByName('Svedenie').AsBoolean);
end;

procedure TfmEditNaklR.ActionAuditExecute(Sender: TObject);
begin
  inherited;
  TfmTovarSvedenie.TovarSvedenie(quNaklR.FieldByName('DateNakl').AsDateTime, quNaklR.FieldByName('NaklNo').AsInteger);
end;

procedure TfmEditNaklR.dsRashodDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if Field <> nil then
  begin
{
    if (UpperCase(Field.FieldName) = 'QTY') and (is_insert = False) then begin
                                                                           TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.Cancel;
                                                                           if quNaklR.State in [dsEdit, dsInsert] then quNaklR.Post;
                                                                           raise Exception.Create(' Нельзя редактировать кол-во!'+ #10#13 +
                                                                                                  'Необходимо удалить, и заново создать запись в накладной!');
                                                                         end;
}                                                                         
    if (UpperCase(Field.FieldName) = 'QTY') or (UpperCase(Field.FieldName) = 'PRICE_ECO') then
    begin
      if quNaklR.State in [dsEdit, dsInsert] then quNaklR.Post;
    end;
  end;
end;

procedure TfmEditNaklR.quNaklRAfterPost(DataSet: TDataSet);
begin
  inherited;
  quNaklR.Refresh;
end;

procedure TfmEditNaklR.quNaklRBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  quNaklR.ParamByName('dhead_id').Value := Dhead_ID;
end;

procedure TfmEditNaklR.dsRashodStateChange(Sender: TObject);
begin
  inherited;
  if quNaklR.Active then quNaklR.Refresh;
end;

procedure TfmEditNaklR.btn1Click(Sender: TObject);
begin
  inherited;
Spravka.SpravkaQuery.Filter:='PostName='+ QuotedStr(dbedtName.Text);
 Spravka.SpravkaQuery.Active:=True;
  Spravka.Show;
end;

procedure TfmEditNaklR.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
if cbbSet.Text='' then
begin
if MessageDlg('      Заполните набор групп товара'+#10#13+
'При нажатии "YES" произойдет сохранение'+#10#13+
'      Вы действительно хотите выйти?',mtWarning,[mbYes,mbNo],0)=mrNo then
Action:=caNone;
end;
end;
procedure TfmEditNaklR.cbbSetExit(Sender: TObject);
var
i:Integer;
a:string;
CaseRecalculation : word;
begin
  inherited;
    OstatokFiltr.Filter.Memo1.Lines.Clear;
    OstatokFiltr.Filter.FilterLabel.Caption:=cbbSet.Text;
    a:=OstatokFiltr.Filter.FilterLabel.Caption;
    OstatokFiltr.Filter.MSQuery1.Active:=True;
    OstatokFiltr.Filter.MSQuery1.Refresh;
    OstatokFiltr.Filter.MSQuery1.Filter:='nabor=' + QuotedStr(a);
    OstatokFiltr.Filter.MSQuery1.Filtered:=True;
    OstatokFiltr.Filter.MSQuery1.First;
    for i:=0 to OstatokFiltr.Filter.MSQuery1.RecordCount -1   do
     begin
       OstatokFiltr.Filter.Memo1.Lines.Add(OstatokFiltr.Filter.MSQuery1.FieldByName('vidname').AsString);
       OstatokFiltr.Filter.MSQuery1.Next;
     end;

     SArticleGroupDouble := quNaklR.FieldByName('SET_ARTICLE_GROUP_ID').Value;

     if Action = 'EDIT' then begin
                                CaseRecalculation := (Application.MessageBox(Pchar('Продолжить? '+#10#13+
                                                                                   'YES - Продолжить с последующим пересчетом '+#10#13+
                                                                                   'NO - Продолжить без пересчета '+#10#13+
                                                                                   'CANCEL - Отменить изменение '),
                                                                                   'Изменение набора групп!', MB_YESNOCANCEL));
                               case CaseRecalculation of
                                 idyes : isRecalculation := True;
                                 idno  : isRecalculation := False;
                                 idcancel : begin
                                               quNaklR.Cancel;
                                             end;
                               end;

                               quBuhType.Close;
                               quBuhType.ParamByName('SET_ARTICLE_GROUP_ID').Value := quNaklR.FieldByName('SET_ARTICLE_GROUP_ID').Value;
                               quBuhType.Open;

                               SArticleGroupDouble := quNaklR.FieldByName('SET_ARTICLE_GROUP_ID').Value;

//                            dblkcbbBuhName.SetFocus;
                               ActiveControl := dblkcbbBuhName;
                             end;
end;
procedure TfmEditNaklR.RxDBGrid1CellClick(Column: TColumn); // Процедура обращается к справочнику на предмет изменения цен
begin
  inherited;
   Meko_Blanc_Price.BLANC_PRICE.Price_Change(dbedtName.Text);
    if Meko_Blanc_Price.BLANC_PRICE.PriceChangeLabel.Caption = 'N' then
    begin
  RxDBGrid1.Columns[6].ReadOnly:=True;
  RxDBGrid1.Columns[7].ReadOnly:=True;
  end;
end;

procedure TfmEditNaklR.RxDBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
     Meko_Blanc_Price.BLANC_PRICE.Price_Change(dbedtName.Text);
    if Meko_Blanc_Price.BLANC_PRICE.PriceChangeLabel.Caption = 'N' then
  begin
  RxDBGrid1.Columns[6].ReadOnly:=True;
  RxDBGrid1.Columns[7].ReadOnly:=True;
  end;
end;

procedure TfmEditNaklR.ScrollBoxExit(Sender: TObject);
var
  ErrMsg : String;
begin
  dmDataModule.quSetup.Close;
  dmDataModule.quSetup.Open;

  if CheckNaklR(PostNo, cxdbdtdt1.Date, SArticleGroupDouble, ErrMsg) >= 10 then
   begin
     //Не Успешно
     ActiveControl := dbedtName;
     raise Exception.Create(ErrMsg);
   end;

  if StrToDate(BegDateNakl) < dmDataModule.quSetupDateBlock.AsDateTime then
   begin
     MessageDlg('Период заблокирован!!!', mtError, [mbOk], 0);
     ActiveControl := cxdbdtdt1;
   end;

  cxdbdtdt1.Text := BegDateNakl;
  dmDataModule.quSetup.Close;
end;



procedure TfmEditNaklR.cbbSetPropertiesChange(Sender: TObject);
begin
  inherited;


  quDayDelay.Close;
  quDayDelay.ParamByName('NamePost').AsString := dbedtName.Text;
  quDayDelay.ParamByName('NameGroup').AsString := cbbSet.Text;
  quDayDelay.Open;


    quNaklR.Edit;

    dbedtAddress.Text := quNaklRNameAddress.Value;


  if Action = 'ADD' then begin
//                            quNaklR.Insert;
                            quNaklRDateOpl.AsDateTime := Date() + quDayDelay.FieldByName('DAY_DELAY').AsInteger; //quDayDelay.FieldByName('ExtDelay').AsInteger;
//                            quNaklR.FieldByName('DateOpl').AsDateTime := Date() + quDayDelay.FieldByName('DAY_DELAY').AsInteger;
//                            dbedtDateOpl.Field.AsDateTime := Date() + quDayDelay.FieldByName('DAY_DELAY').AsInteger;
                          end;
  if Action = 'EDIT' then begin
//                             quNaklR.Edit;
//                             dbedtDateOpl.Field.AsDateTime := Date() + quDayDelay.FieldByName('DAY_DELAY').AsInteger;
                            quNaklRDateOpl.AsDateTime := quNaklR.FieldByName('DateOpl').AsDateTime;

                           end;
  quDayDelay.Close;
end;



procedure TfmEditNaklR.dbedtNameChange(Sender: TObject);
begin
  inherited;
  quListPrice.Close;
  quListPrice.ParamByName('PostName').Value := quNaklR.FieldByName('Name').AsString;
  quListPrice.Open;

  QuSetArtGroup.Close;
  QuSetArtGroup.ParamByName('NamePost').Value := quNaklR.FieldByName('Name').AsString;
  QuSetArtGroup.Open;

  quBuhType.Close;
  quBuhType.ParamByName('PostName').Value := quNaklR.FieldByName('Name').AsString;
  quBuhType.Open;

end;

procedure TfmEditNaklR.bRecalculationClick(Sender: TObject);
var
  msg : string;
begin
  inherited;
  dmDataModule.quSetup.Close;
  dmDataModule.quSetup.Open;
  if StrToDate(BegDateNakl) < dmDataModule.quSetupDateBlock.AsDateTime then
   raise Exception.Create('Период заблокирован!'+#10#13+
                          'Пересчет не возможен!'+#10#13+
                          'Для открытия периода оращаться к начальнику операционного отдела!');

  if dbedtName.Text = '' then begin
                                msg := ' Пересчет не возможен!'+#10#13+
                                       'Необходимо выбрать получателя!';
                                ActiveControl := dbedtName;
                                raise Exception.Create(msg);
                              end;

  if cbbSet.Text = '' then begin
                             msg := ' Пересчет не возможен!'+#10#13+
                                    'Необходимо выбрать набор групп товаров!';
                             ActiveControl := cbbSet;
                             raise Exception.Create(msg);
                           end;

  if dblkcbbBuhName.KeyValue = 0 then begin
                                          msg := ' Пересчет не возможен!'+#10#13+
                                                 'Необходимо выбрать бухгалтерский тип!';
                                          ActiveControl := dblkcbbBuhName;
                                          raise Exception.Create(msg);
                                        end;

  if cbbDbLCbListPrice.Text = '' then begin
                                         msg := ' Пересчет не возможен!'+#10#13+
                                                'Необходимо выбрать тип цены!';
                                         ActiveControl := cbbDbLCbListPrice;
                                         raise Exception.Create(msg);
                                       end;

  if quNaklR.State in [dsEdit, dsInsert] then quNaklR.Post;
  sp_RecalculationNakl.ParamByName('p_key').Value := Dhead_ID;
  sp_RecalculationNakl.ParamByName('ColnPrice').AsInteger := cbbDbLCbListPrice.EditValue;
  sp_RecalculationNakl.Execute;
  quNaklR.Refresh;

  TMlekoDbDsMSSQLDm(CustomDm).DspecRefresh;


end;


procedure TfmEditNaklR.DBLookupComboboxEhTypeReturnExit(Sender: TObject);
begin
  inherited;
  if (dblkcbbVidNaklName.Text = 'Возврат') and (DBLookupComboboxEhTypeReturn.Text = '') then begin
                                                                                               ShowMessage('Не заполнено обязательное поле ''Тип возврата''!');
                                                                                               ActiveControl := DBLookupComboboxEhTypeReturn;
                                                                                             end
                                                                                        else begin
                                                                                               quNaklR.Edit;
                                                                                               quNaklRTypeReturnNo.Value := DBLookupComboboxEhTypeReturn.KeyValue;
///                                                                                              Showmessage(IntToStr(DBLookupComboboxEhTypeReturn.KeyValue));
                                                                                             end;
end;

procedure TfmEditNaklR.dblkcbbVidNaklNameExit(Sender: TObject);
begin
  inherited;
//  if ((isReturn = true) and ((dblkcbbVidNaklName.Text <> 'Возврат') or (dblkcbbVidNaklName.Text <> 'Возврат по акту'))) then quNaklR.FieldByName('VidNaklNo').AsInteger := 3;
  if (dblkcbbVidNaklName.Text = 'Возврат') or (dblkcbbVidNaklName.Text = 'Возврат по акту') then begin
                                                                                                   DBLookupComboboxEhTypeReturn.Enabled := True;
                                                                                                   ActiveControl := DBLookupComboboxEhTypeReturn;
                                                                                                 end;
end;

procedure TfmEditNaklR.dblkcbbBuhNameClick(Sender: TObject);
begin
  inherited;

  if Action = 'EDIT' then begin
                            isRecalculation := True;
                            ActiveControl := cbbDbLCbListPrice;
                          end;
                          
end;

procedure TfmEditNaklR.dblkcbbBuhNameExit(Sender: TObject);
var
  CaseRecalculation : word;
begin
  inherited;

  if Action = 'EDIT' then begin
                            CaseRecalculation := (Application.MessageBox(Pchar('Продолжить? '+#10#13+
                                                                               'YES - Продолжить с последующим пересчетом '+#10#13+
                                                                               'NO - Продолжить без пересчета '+#10#13+
                                                                               'CANCEL - Отменить изменение '),
                                                                               'Изменение бухгалтерского типа!', MB_YESNOCANCEL));
                            case CaseRecalculation of
                              idyes : isRecalculation := True;
                              idno  : isRecalculation := False;
                              idcancel : begin
                                           quNaklR.Cancel;
                                         end;
                            end;
                            ActiveControl := cbbDbLCbListPrice;
                          end;
                          
end;

procedure TfmEditNaklR.cbbSetFocusChanged(Sender: TObject);
begin
  inherited;
  if Action = 'EDIT' then begin
                            isRecalculation := True;

                            quBuhType.Close;
                            quBuhType.ParamByName('SET_ARTICLE_GROUP_ID').Value := quNaklR.FieldByName('SET_ARTICLE_GROUP_ID').Value;
                            quBuhType.Open;

//                            dblkcbbBuhName.SetFocus;
                            ActiveControl := dblkcbbBuhName;
                          end;
end;

procedure TfmEditNaklR.bbOkClick(Sender: TObject);
begin
  inherited;
  if (isRecalculation = True) and (Action = 'EDIT') then bRecalculation.Click;

end;

procedure TfmEditNaklR.cbbDbLCbListPriceExit(Sender: TObject);
var
  CaseRecalculation : word;
begin
  inherited;
  if Action = 'EDIT' then begin
                            CaseRecalculation := (Application.MessageBox(Pchar('Продолжить? '+#10#13+
                                                                               'YES - Продолжить с последующим пересчетом '+#10#13+
                                                                               'NO - Продолжить без пересчета '+#10#13+
                                                                               'CANCEL - Отменить изменение '),
                                                                               'Изменение типа цены!', MB_YESNOCANCEL));
                            case CaseRecalculation of
                              idyes : isRecalculation := True;
                              idno  : isRecalculation := False;
                              idcancel : begin
                                            quNaklR.Cancel;
                                         end;
                            end;
                          end;
end;

procedure TfmEditNaklR.dblkcbbVidNaklNameCloseUp(Sender: TObject);
begin
  inherited;
  if (isReturn = true) then begin
                              quNaklR.Edit;
                              if ((dblkcbbVidNaklName.KeyValue <> 3) and (dblkcbbVidNaklName.KeyValue <> 5)) then begin
                                                                                                                   dblkcbbVidNaklName.KeyValue := 3;
                                                                                                                 end
                            end;
end;

procedure TfmEditNaklR.Button1Click(Sender: TObject);
begin
  inherited;
  if TMlekoDbDsMSSQLDm(CustomDm).quDspec.State in [dsInsert, dsEdit] then
            TMlekoDbDsMSSQLDm(CustomDm).quDspec.Post;

end;

function TfmEditNaklR.CheckNaklR(pPostno : Integer; pDateNakl: TDate; SET_ARTICLE_GROUP_ID: Int64; var err_message: string): Integer;
begin
  inherited;
  spChackNaklR.Close;
  spChackNaklR.ParamByName('p_Postno').Value := pPostno;
  spChackNaklR.ParamByName('DateNakl').AsDate := pDateNakl;
  spChackNaklR.ParamByName('SET_ARTICLE_GROUP_ID').Value := SET_ARTICLE_GROUP_ID;
  spChackNaklR.ExecProc;
  result := spChackNaklR.ParamByName('err_level').AsInteger;
  err_message := spChackNaklR.ParamByName('err_message').AsString;
end;

procedure TfmEditNaklR.Button2Click(Sender: TObject);
begin
  inherited;
   with TListTovarDateOfManufaktureForNaklForm.Create(Application) do
     try
      qul_DspecForTovarDateOfManufacture.Close;
      qul_DspecForTovarDateOfManufacture.ParamByName('TovarNo').Value := TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.FieldByName('article_id').Value;
      qul_DspecForTovarDateOfManufacture.Open;

      ShowModal;
     finally

      qul_DspecForTovarDateOfManufacture.Close;
      Free;
   end;
end;

procedure TfmEditNaklR.dbtCurrencyAccountingDblClick(Sender: TObject);
var
 CurrencyId : integer;
begin
  inherited;
  CurrencyId := ShowCurrency(false);
end;

procedure TfmEditNaklR.dbnedtRateCurrencyAccountingChange(Sender: TObject);
begin
  inherited;
//  if quNaklR.State in [dsInsert,dsEdit] then quNaklR.Post;
end;

procedure TfmEditNaklR.dbnedtRateCurrencyAccountingExit(Sender: TObject);
begin
  inherited;
  if quNaklR.State in [dsInsert,dsEdit] then quNaklR.Post;
end;

end.

