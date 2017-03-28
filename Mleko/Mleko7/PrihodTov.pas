unit PrihodTov;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Dialogs,
  StdCtrls, Forms, MlekoForm, DBCtrls, DB, DBGrids, Grids, Mask, ExtCtrls, Buttons,
  citCtrls, citmask, citDBComboEdit, DBAccess, MsAccess, CFLMLKCustom,
  MemDS, ActnList, cxGraphics, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxCalendar, cxDBEdit, DBCtrlsEh, DBGridEh, DBLookupEh;

type
  TfmPrihodTov = class(TCFLMLKCustomForm)
    ScrollBox: TScrollBox;
    Label1: TLabel;
    Label3: TLabel;
    EditDate: TCxDBDateEdit;
    Label4: TLabel;
    EditSumma: TDBEdit;
    Label5: TLabel;
    EditSummaDolg: TDBEdit;
    paTop: TPanel;
    paMiddle: TPanel;
    DBGrid1: TDBGrid;
    paBottom: TPanel;
    bbOK: TBitBtn;
    bbcancel: TBitBtn;
    bbPrint: TBitBtn;
    edNom: TDBEdit;
    lcBuh: TCXDBLookupComboBox;
    quNaklP: TMSQuery;
    dsNaklP: TDataSource;
    deNamePost: TDBEdit;
    Label2: TLabel;
    quBuh: TMSQuery;
    quVidNakl: TMSQuery;
    lcVidNakl: TCxDBLookupComboBox;
    Label6: TLabel;
    Label7: TLabel;
    dsPrihod: TDataSource;
    quWork: TMSQuery;
    cbPriceWithNDS: TCheckBox;
    ep_Prihod_id: TcitDBComboEdit;
    EditDatePrih: TCxDBDateEdit;
    Label8: TLabel;
    quDocType: TMSQuery;
    DBLookupComboBox1: TCXDBLookupComboBox;
    Label9: TLabel;
    bbPrihodDel: TBitBtn;
    bbPrihodInsert: TBitBtn;
    DsDocType: TDataSource;
    DSBuh: TDataSource;
    DSVid: TDataSource;
    BitBtn1: TBitBtn;
    ActionViewRefresh: TAction;
    quStatus: TMSQuery;
    DSStatus: TDataSource;
    DbLCbStatus: TcxDBLookupComboBox;
    Label10: TLabel;
    dsOtdel: TDataSource;
    quOtdel: TMSQuery;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    Label11: TLabel;
    quNaklPEntity: TMSQuery;
    quNaklPEntityid: TLargeintField;
    quNaklPEntityentityno: TIntegerField;
    quNaklPEntityentity_type: TStringField;
    quNaklPEntityentityno_plat: TIntegerField;
    quNaklPEntityentity_type_plat: TStringField;
    quNaklPEntitylink_summa: TFloatField;
    quNaklPEntitylink_date: TDateTimeField;
    quNaklPEntitylink_userno: TIntegerField;
    quNaklPEntityplat_sign: TSmallintField;
    quNaklPEntityfactor_direction: TSmallintField;
    quNaklPEntitydelta: TFloatField;
    quNaklPEntitypkey: TLargeintField;
    quNaklPEntityentity_type_1: TStringField;
    quNaklPEntityentity_type_name: TStringField;
    quNaklPEntitynom: TIntegerField;
    quNaklPEntitypostno: TSmallintField;
    quNaklPEntitypost_name: TStringField;
    quNaklPEntitydateentity: TDateTimeField;
    quNaklPEntitysumma: TFloatField;
    quNaklPEntitybuh: TSmallintField;
    quNaklPEntitybuh_type_name: TStringField;
    quNaklPEntityDESCRIPTION: TStringField;
    quNaklPEntitydoc_type_id: TIntegerField;
    quNaklPEntitydoc_type_name: TStringField;
    quNaklPEntityuserno: TSmallintField;
    quNaklPEntityusername: TStringField;
    quNaklPEntitysotrudno: TIntegerField;
    quNaklPEntitysotrudname: TStringField;
    quNaklPEntitybank_invoice_id: TIntegerField;
    quNaklPEntitybank_name: TStringField;
    quNaklPEntityactivity_type_id: TSmallintField;
    quNaklPEntityactivity_type_name: TStringField;
    quNaklPEntityanalyticaccno: TIntegerField;
    quNaklPEntityvidrashod_name: TStringField;
    quNaklPEntityotdelno: TIntegerField;
    quNaklPEntityotdel_name: TStringField;
    quNaklPEntityourfirmno: TIntegerField;
    quNaklPEntityourfirm_name: TStringField;
    quNaklPEntityis_econom: TIntegerField;
    quNaklPEntityentityno_1: TIntegerField;
    quNaklPEntitycolnprice: TSmallintField;
    quNaklPEntitycolnprice_name: TStringField;
    quNaklPEntityaddressno: TSmallintField;
    quNaklPEntityaddress: TStringField;
    quNaklPEntitypostnoreturn: TSmallintField;
    quNaklPEntitypostreturn_name: TStringField;
    quNaklPEntityid_1: TIntegerField;
    quNaklPEntitykoldaydelay: TIntegerField;
    quNaklPEntityreason_id: TIntegerField;
    quNaklPEntityvidtovgroup_id: TIntegerField;
    quNaklPEntityvidtovgroup_name: TStringField;
    quNaklPEntitycontract_id: TIntegerField;
    quNaklPEntitycontract_description: TStringField;
    quNaklPEntitypkey_1: TLargeintField;
    quNaklPEntityfreesumma: TFloatField;
    quNaklPEntityentity_type_id: TIntegerField;
    quNaklPnaklno: TIntegerField;
    quNaklPnom: TIntegerField;
    quNaklPdatenakl: TDateTimeField;
    quNaklPpostno: TSmallintField;
    quNaklPbuh: TSmallintField;
    quNaklPsumma: TFloatField;
    quNaklPsummadolg: TFloatField;
    quNaklPuserno: TSmallintField;
    quNaklPvidnaklno: TWordField;
    quNaklPname: TStringField;
    quNaklPotdelno: TSmallintField;
    quNaklPdateprih: TDateTimeField;
    quNaklPdoc_type: TIntegerField;
    quNaklPparent_naklno: TIntegerField;
    quNaklPourfirmno: TIntegerField;
    quNaklPpkey: TLargeintField;
    quNaklPedit_status_id: TSmallintField;
    lblSet: TLabel;
    QuSetArtGroup: TMSQuery;
    quNaklPDelay: TMSQuery;
    dsSetArtGroup: TMSDataSource;
    dsNaklPDelay: TMSDataSource;
    QuSetArtGroupPOSTNO: TLargeintField;
    QuSetArtGroupDAY_DELAY: TIntegerField;
    QuSetArtGroupDAY_DELAY_EXT: TIntegerField;
    QuSetArtGroupExtDelay: TIntegerField;
    QuSetArtGroupNAME: TStringField;
    QuSetArtGroupNamePost: TStringField;
    cbSetArticleGroup: TDBLookupComboBox;
    QuSetArtGroupFullName: TStringField;
    quNaklPDelayNaklNo: TLargeintField;
    quNaklPDelayDay_Delay: TIntegerField;
    quNaklPDelayDay_Delay_Ext: TIntegerField;
    quNaklPDelayFullName: TStringField;
    QuSetArtGroupBuh: TLargeintField;
    quNaklPDelayBuh: TIntegerField;
    QuSetArtGroupid: TStringField;
    QuSetArtGroupSET_ARTICLE_GROUP_ID: TLargeintField;
    quNaklPDelaySET_ARTICLE_GROUP_ID: TLargeintField;
    quNaklPDelayid: TStringField;
    quBuhbuh: TSmallintField;
    quBuhBuh_type_name: TStringField;
    quBuhIS_FRACTION: TBooleanField;
    quNaklPDateOfManufacture: TDateTimeField;
    Label12: TLabel;
    cxDBDateEdit1: TcxDBDateEdit;
    Button1: TButton;
    Button2: TButton;
    quNaklPCurrencyHead: TStringField;
    Label14: TLabel;
    DBText1: TDBText;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    dbedtCurrencyAccounting: TDBEditEh;
    Label13: TLabel;
    quNaklPCurrencyAccounting: TStringField;
    dbnedtRateCurrencyAccounting: TDBNumberEditEh;
    Label15: TLabel;
    quNaklPRateCurrencyAccounting: TFloatField;
    tbTovarInWarehouse: TMSTable;
    procedure ScrollBoxExit(Sender: TObject);
    procedure bbOKClick(Sender: TObject);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbPrihodDelClick(Sender: TObject);
    procedure bbPrihodInsertClick(Sender: TObject);
    procedure bbcancelClick(Sender: TObject);
    procedure quNaklPNewRecord(DataSet: TDataSet);
    procedure ChangePost;
    procedure deNamePostEnter(Sender: TObject);
    procedure deNamePostDblClick(Sender: TObject);
    procedure deNamePostKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure quNaklPBeforePost(DataSet: TDataSet);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    function ep_Prihod_idIsSelect(Sender: TObject): Boolean;
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure dsPrihodDataChange(Sender: TObject; Field: TField);
    procedure quNaklPAfterPost(DataSet: TDataSet);
    procedure ActionViewRefreshExecute(Sender: TObject);
    procedure dsPrihodUpdateData(Sender: TObject);
    procedure bbPrintClick(Sender: TObject);
    procedure cbSetArticleGroupExit(Sender: TObject);
    procedure cbSetArticleGroupCloseUp(Sender: TObject);
    procedure lcBuhPropertiesCloseUp(Sender: TObject);
    procedure lcBuhPropertiesChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    dhead_id: Int64;
    is_insert : boolean;
    procedure SelectWareHouse;
    function DeleteTovarInWarehouseItem: Boolean;
    function InsertTovarInWarehouseItem(pkey, TovarID: Int64;
      houseID: Integer): Boolean;
    function ChangeTovarInWarehouseItem(pkey, TovarID: Int64;
      houseID: Integer): Boolean;
  public
    { public declarations }
  end;

var
  l_cont_type_code: string;
  l_direction: integer;
  fmPrihodTov: TfmPrihodTov;
  OtdelNoWork: integer;
  PostNo: integer;
procedure PrihodTovar(OtdelNo: integer; var Pkey: Int64);
implementation

uses data, PrintNaklP, TovarPrih, Post0, MlekoDbDsMSSQL, main,
  Variants, BCDbMSSQL,UtilsCommon, CFLMLKCustomRep,
  ListTovarDateOfManufaktureForNakl, UWarehouses;

{$R *.DFM}

procedure PrihodTovar(OtdelNo: integer; var Pkey: Int64);
var
  msg,msg1: string;
  CurrencyAccounting: string;
  RateCurrencyAccounting: real;
begin
  fmPrihodTov := TfmPrihodTov.Create(Application);
  fmPrihodTov.dhead_id := pkey;

  fmPrihodTov.quNaklPDelay.Close;
  fmPrihodTov.quNaklPDelay.ParamByName('NaklNo').Value := Pkey;
  fmPrihodTov.quNaklPDelay.Open;

//  fmPrihodTov.QuSetArtGroup.Open;

//  if fmPrihodTov.quNaklPDelay.RecordCount > 0 then begin
{
                                                     fmPrihodTov.quNaklP.Close;
                                                     fmPrihodTov.quNaklP.ParamByName('dhead_id').Value := Pkey;
                                                     fmPrihodTov.quNaklP.Open;
                                                     fmPrihodTov.QuSetArtGroup.Close;
                                                     fmPrihodTov.QuSetArtGroup.ParamByName('SET_ARTICLE_GROUP_ID').Value := fmPrihodTov.quNaklPDelaySET_ARTICLE_GROUP_ID.Value;
                                                     fmPrihodTov.QuSetArtGroup.ParamByName('NamePost').Value := fmPrihodTov.quNaklP.FieldByName('Name').AsString;
                                                     fmPrihodTov.QuSetArtGroup.Open;
                                                     fmPrihodTov.QuSetArtGroup.Refresh;
                                                     fmPrihodTov.quNaklP.Close;

                                                     fmPrihodTov.cbSetArticleGroup.KeyValue := fmPrihodTov.quNaklPDelaySET_ARTICLE_GROUP_ID.Value;
                                                     fmPrihodTov.cbSetArticleGroup.Enabled := True;
}

//                                                     fmPrihodTov.cbSetArticleGroup.KeyValue := quNaklPDelay.FieldByName('SET_ARTICLE_GROUP_ID').AsString + quNaklPDelayBuh.AsString ;

//                                                   end;

  fmPrihodTov.ActiveControl := fmPrihodTov.deNamePost;

  try
    with fmPrihodTov do
    begin
      QuSetArtGroup.Open;

      dmDataModule.quCurrency.Open;

      quDocType.Open;
      quOtdel.Open;
      quBuh.Open;
      quStatus.Open;
      quVidNakl.Open;
      if dhead_id = -1 then
      begin
        dmDataModule.OpenSQL('select -1*cast(cast(newid() as binary(16)) as bigint) as new_id ');
        dhead_id := dmDataModule.QFO.FieldByName('new_id').Value;
        quNaklP.ParamByName('dhead_id').Value := dhead_id;
        quNaklP.Open;
        quNaklP.Insert;
        quNaklP.FieldByName('pkey').Value := dmDataModule.QFO.FieldByName('new_id').Value;
        quNaklP.FieldByName('edit_status_id').Value := 3;
        quNaklP.FieldByName('otdelNo').Value := OtdelNo;

        CurrencyAccounting := '';
        dmDataModule.OpenSQL('select l_code from d_currency where isDefault = 1');
        CurrencyAccounting := dmDataModule.QFO.FieldByName('l_code').Value;

        RateCurrencyAccounting:= 0;
        dmDataModule.OpenSQL('select ce.Rate from D_CURRENCY c inner join CurrencyExchange ce on c.IsDefault = 1 and ce.IsActive = 1 and ce.CurrencyId = c.ID and isnull(c.isTrash,0) = 0');
        RateCurrencyAccounting := dmDataModule.QFO.FieldByName('Rate').Value;

//        ShowMessage(dmDataModule.QFO.FieldByName('Rate').AsString);
        quNaklP.FieldByName('CurrencyAccounting').AsString := CurrencyAccounting;
        quNaklP.FieldByName('RateCurrencyAccounting').Value := RateCurrencyAccounting;
        
{
        quNaklPDelay.Open;
        dsNaklPDelay.Edit;
        quNaklPDelayNaklNo.Value := dhead_id;
        quNaklPDelaySET_ARTICLE_GROUP_ID.Value := QuSetArtGroupSET_ARTICLE_GROUP_ID.Value;
        quNaklPDelayDay_Delay.Value := QuSetArtGroupDAY_DELAY.Value;
        quNaklPDelayDay_Delay_Ext.Value := QuSetArtGroupDAY_DELAY_EXT.Value;
        quNaklPDelayBuh.Value := QuSetArtGroupBuh.Value;
 }

      end
      else
      begin

        ActiveControl := cbSetArticleGroup;

        dhead_id := pkey;
        quNaklP.Close;
        quNaklP.ParamByName('dhead_id').Value := pkey;
        quNaklP.Open;

        QuSetArtGroup.Close;
{
        if quNaklPDelaySET_ARTICLE_GROUP_ID.IsNull then QuSetArtGroup.ParamByName('SET_ARTICLE_GROUP_ID').Clear
                                                   else QuSetArtGroup.ParamByName('SET_ARTICLE_GROUP_ID').Value := quNaklPDelaySET_ARTICLE_GROUP_ID.Value;
}
        QuSetArtGroup.ParamByName('NamePost').Value := quNaklP.FieldByName('Name').AsString;
        QuSetArtGroup.ParamByName('Buh').Value := quNaklP.FieldByName('Buh').AsInteger;
        QuSetArtGroup.Open;
        QuSetArtGroup.Refresh;

        quNaklPDelay.Close;
        quNaklPDelay.ParamByName('NaklNo').Value := Pkey;
        quNaklPDelay.Open;

//        ShowMessage(QuSetArtGroup.ParamByName('SET_ARTICLE_GROUP_ID').AsString +'   '+ QuSetArtGroup.ParamByName('NamePost').AsString ) ;
//        ShowMessage(quNaklPDelayId.AsString);

        cbSetArticleGroup.KeyValue := quNaklPDelayId.Value;

//        ShowMessage(cbSetArticleGroup.KeyValue);

        cbSetArticleGroup.Enabled := True;

{
        QuSetArtGroup.Close;
        QuSetArtGroup.ParamByName('NamePost').Value := quNaklP.FieldByName('Name').AsString;
        QuSetArtGroup.Open;
}
//        cbSetArticleGroup.KeyValue := quNaklPDelay.FieldByName('SET_ARTICLE_GROUP_ID').AsString + quNaklPDelayBuh.AsString ;
//       cbSetArticleGroup.Enabled := True;

//        showmessage(inttostr(QuSetArtGroup.RecordCount));
//        showmessage(cbSetArticleGroup.KeyValue);

{
        cbSetArticleGroup.KeyValue := quNaklPDelay.FieldByName('SET_ARTICLE_GROUP_ID').AsString;
        cbSetArticleGroup.Enabled := true;
        cbSetArticleGroup.Refresh;
}
        quNaklPEntity.Close;
        quNaklPEntity.ParamByName('p_PlatNo1').Value := quNaklPNaklNo.Value;
        quNaklPEntity.ParamByName('p_LinkNaklType1').Value := 'NAKLP';
        quNaklPEntity.ParamByName('p_PlatNo2').Value := quNaklPNaklNo.Value;
        quNaklPEntity.ParamByName('p_LinkNaklType2').Value := 'NAKLP';
        quNaklPEntity.Open;

        if (quNaklPEntity.RecordCount > 0) then begin
                                                  quNaklPEntity.First;
                                                  while not quNaklPEntity.Eof do
                                                    begin
                                                      msg1:= msg1 + inttostr(quNaklPEntityentityno_plat.Value) + ' ' + quNaklPEntityentity_type_plat.Value + #10#13;
                                                      quNaklPEntity.Next;
                                                    end;
                                                  msg:= 'Редактирование запрещено!' + #10#13 +
                                                        'Для возможности редактирования необходимо отвязать документы:' + #10#13 + msg1;
                                                  quNaklP.Close;
                                                  quNaklPEntity.Close;
                                                  raise Exception.Create(msg);
                                                end;
        quNaklP.Edit;

        CurrencyAccounting := '';
        dmDataModule.OpenSQL('select l_code from d_currency where isDefault = 1');
        CurrencyAccounting := dmDataModule.QFO.FieldByName('l_code').Value;

        if quNaklPCurrencyAccounting.IsNull then quNaklPCurrencyAccounting.AsString := CurrencyAccounting;

//        showmessage(quNaklRCurrencyAccounting.AsString);

        dbedtCurrencyAccounting.Text := CurrencyAccounting; //quNaklRCurrencyAccounting.AsString;

        RateCurrencyAccounting:= 0;
        dmDataModule.OpenSQL('select ce.Rate from D_CURRENCY c inner join CurrencyExchange ce on c.IsDefault = 1 and ce.IsActive = 1 and ce.CurrencyId = c.ID and isnull(c.isTrash,0) = 0');
        RateCurrencyAccounting := dmDataModule.QFO.FieldByName('Rate').Value;

        if quNaklPRateCurrencyAccounting.IsNull then quNaklPRateCurrencyAccounting.Value := RateCurrencyAccounting;

        if quNaklPCurrencyHead.IsNull then begin
                                             if not (quNaklP.State in [dsInsert,dsEdit]) then quNaklP.Edit;
                                             dmDataModule.OpenSQL('select c.l_code, c.Name from D_CURRENCY c inner join CurrencyExchange ce on c.IsDefault = 1 and ce.IsActive = 1 and ce.CurrencyId = c.ID and c.isTrash = 0');
                                             quNaklPCurrencyHead.Value := dmDataModule.QFO.FieldByName('l_code').Value;
                                           end;
                                           
      end;
      OtdelNoWork := OtdelNo;
      if OtdelNo = 3 then
      begin
        Caption := 'Приход тары';
        Label6.Visible := False;
        lcVidNakl.Visible := False;
        cbPriceWithNDS.Visible := False;
        if dhead_id = -1 then quNaklP.FieldByName('doc_type').Value := 2;
      end
      else
      begin
        Caption := 'Приход товара';
        if dhead_id = -1 then quNaklP.FieldByName('doc_type').Value := 1;
      end;
      TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.Close;
      TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.ParamByName('dhead_id').Value := dhead_id;
      TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.Open;


    end;
    if fmPrihodTov.ShowModal= mrOk then
    begin
      If fmPrihodTov.quNaklP.State in [dsInsert,dsEdit] then fmPrihodTov.quNaklP.Post;
    end;
  finally
    if VarIsNull(fmPrihodTov.quNaklP.FieldByName('Pkey').Value) then
      Pkey := -1
    else
      Pkey := fmPrihodTov.quNaklP.FieldByName('Pkey').Value;

    fmPrihodTov.QuSetArtGroup.Close;
    fmPrihodTov.quNaklPDelay.Close;
    dmDataModule.quCurrency.Open;
    fmPrihodTov.Free;
  end;
end;

procedure TfmPrihodTov.ChangePost;
var
  RetPost: TRetPost;
begin
  RetPost := Post(True, True);
  if RetPost.PostNo <> 0 then
  begin
    if not (quNaklP.State in [dsInsert, dsEdit]) then
      quNaklP.Edit;
    quNaklP.FieldByName('PostNo').AsInteger := RetPost.PostNo;
    quNaklP.FieldByName('Name').AsString := RetPost.NamePost;

    QuSetArtGroup.Close;
    QuSetArtGroup.ParamByName('NamePost').Value := RetPost.NamePost;
    QuSetArtGroup.ParamByName('SET_ARTICLE_GROUP_ID').Clear;
    QuSetArtGroup.ParamByName('Buh').Clear;
    QuSetArtGroup.Open;
    QuSetArtGroup.Refresh;

//    ShowMessage(QuSetArtGroup.ParamByName('SET_ARTICLE_GROUP_ID').AsString +'   '+ QuSetArtGroup.ParamByName('NamePost').AsString ) ;

    cbSetArticleGroup.Enabled := True;
    ActiveControl := cbSetArticleGroup;

    PostNo := RetPost.PostNo;
  end;
end;

procedure TfmPrihodTov.ScrollBoxExit(Sender: TObject);
begin
  dmDataModule.quSetup.Close;
  dmDataModule.quSetup.Open;

  if cbSetArticleGroup.Text = '' then begin
                                        ShowMessage('Не заполнено обязательное поле: ''Набор групп товаров''!');
                                        if quNaklP.FieldByName('PostNo').AsInteger = 0 then begin
                                                                                              ShowMessage('Выберите поставщика');
                                                                                              ChangePost;
                                                                                            end
                                                                                       else begin
                                                                                              QuSetArtGroup.Close;
//                                                                                              QuSetArtGroup.ParamByName('NamePost').Value := quNaklP.FieldByName('Name').AsString;
                                                                                              QuSetArtGroup.ParamByName('NamePost').Value := quNaklPname.AsString ;
                                                                                              QuSetArtGroup.Open;
                                                                                              cbSetArticleGroup.Enabled := True;
                                                                                            end;

                                        //fmPrihodTov.ActiveControl := cbSetArticleGroup;
                                        ActiveControl := cbSetArticleGroup;
                                      end;

  if cxDBLookupComboBox1.Text = '' then begin
                                          ShowMessage('Не заполнено обязательное поле: ''Отдел''!');
                                          ActiveControl := cxDBLookupComboBox1;
                                        end;

  if StrToDate(EditDate.Text) > dmDataModule.quSetupDateBlock.AsDateTime then
  begin
    if quNaklP.FieldByName('PostNo').AsInteger = 0 then
    begin
      fmPrihodTov.ActiveControl := deNamePost;
      exit;
    end;
    if quNaklP.FieldByName('Nom').AsInteger = 0 then
    begin
      dmDataModule.spGetNomNaklP.Open;
      if not (quNaklP.State in [dsEdit, dsInsert]) then
        quNaklP.Edit;
      quNaklP.FieldByName('Nom').AsInteger := dmDataModule.spGetNomNaklPNom.AsInteger;
      dmDataModule.spGetNomNaklP.Close;
    end;

  end
  else
  begin
    MessageDlg('Период заблокирован!!!', mtError, [mbOk], 0);
    ActiveControl := EditDate;
  end;
  dmDataModule.quSetup.Close;
end;

procedure TfmPrihodTov.bbOKClick(Sender: TObject);
begin
   if TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.State in [dsInsert, dsEdit] then
    TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.Post;

end;

procedure TfmPrihodTov.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);

begin

  if ((Key = VK_DOWN) or (Key = VK_INSERT)) and (DBGrid1.DataSource.DataSet.State in [dsInsert]) then
    fmPrihodTov.bbPrihodInsert.Click;

end;

procedure TfmPrihodTov.bbPrihodDelClick(Sender: TObject);
begin
  DeleteTovarInWarehouseItem;
  DBGrid1.DataSource.DataSet.Delete;
end;

procedure TfmPrihodTov.bbPrihodInsertClick(Sender: TObject);
var
  quInsInD_Control_PriceInInst : TMSQuery;
  Prih                         : TPrihRet;
  quPriceInInst                : TMSQuery;
  a,b,c,PriceInInst            : Currency;
  Delta                        : Boolean;
  l_str                        : string;
  is_Post                      : Boolean;
  OldSeparator                 : Char;
begin
  is_insert := true;
  TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.Append;
  Prih := EditTovarPrih(cbPriceWithNDS.Checked, OtdelNoWork);
  if (Prih.TovarNo <> 0) then
  begin

    begin
      is_Post := True;
      quPriceInInst:=TMSQuery.Create(nil);
      quPriceInInst.Connection:=dmDataModule.DB;
      quPriceInInst.SQL.Clear;
      quPriceInInst.SQL.Text:= 'select isnull(PriceInInst,0) as PriceInInst from PriceForVeb where TovarNo = :TovarNo';
      quPriceInInst.ParamByName('TovarNo').Value := Prih.TovarNo;
      quPriceInInst.Open;

      a:=  quPriceInInst.FieldByName('PriceInInst').AsFloat - DeltaPriceInInst;
      b:=  quPriceInInst.FieldByName('PriceInInst').AsFloat + DeltaPriceInInst;
      c:=  Prih.PriceIn;

      PriceInInst:= quPriceInInst.FieldByName('PriceInInst').AsFloat;

      if ((a <= c) and (c <= b)) then Delta := True
                                 else Delta := False;

      if Delta = False
      then begin
{
             ShowMessage('Цена '+floattostr(TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.FieldByName('Price_eco').AsFloat)+ 'не входит в допустимый интервал цены.' + #10#13 +
                         'Допустимый интервал: с ' + floattostr(quPriceInInst.FieldByName('PriceInInst').AsFloat - DeltaPriceInInst) +
                         ' по ' + floattostr(quPriceInInst.FieldByName('PriceInInst').AsFloat + DeltaPriceInInst));
 }
             l_str := 'Цена '+floattostr(Prih.PriceIn)+ 'не входит в допустимый интервал цены.' + #10#13 +
                      'Допустимый интервал: с ' + floattostr(quPriceInInst.FieldByName('PriceInInst').AsFloat - DeltaPriceInInst) +
                      ' по ' + floattostr(quPriceInInst.FieldByName('PriceInInst').AsFloat + DeltaPriceInInst) + #10#13 +
                      'Продолжить (Да) отменить (Нет)?';
             if Application.MessageBox(PChar(l_str), 'Внимание!', MB_YESNO) = IDYES then begin

                                                                                           OldSeparator := SysUtils.DecimalSeparator;
                                                                                           SysUtils.DecimalSeparator := '.';

                                                                                           quInsInD_Control_PriceInInst:=TMSQuery.Create(nil);
                                                                                           quInsInD_Control_PriceInInst.Connection:=dmDataModule.DB;
                                                                                           quInsInD_Control_PriceInInst.SQL.Clear;
                                                                                           quInsInD_Control_PriceInInst.SQL.Text:= 'declare '
                                                                                                                                  +'    @PriceInInst decimal(18,2) '
                                                                                                                                  +'   ,@Price_ECO decimal(18,2) '
                                                                                                                                  +'set @PriceInInst = convert(float,:PriceInInst) '
                                                                                                                                  +'set @Price_ECO = convert(float,:Price_ECO) '
                                                                                                                                  +'insert into D_Control_PriceInInst (UserNo,TovarNo,PriceInInst,Price_ECO,Date,PostNo,HostName,Dhead_id)'
                                                                                                                                  +'values (:UserNo,:TovarNo,@PriceInInst,@Price_ECO,GetDate(),:PostNo,HOST_NAME(),:Dhead_id)';
                                                                                           quInsInD_Control_PriceInInst.ParamByName('UserNo').Value := Data.UserNo;
                                                                                           quInsInD_Control_PriceInInst.ParamByName('TovarNo').Value := Prih.TovarNo;
                                                                                           quInsInD_Control_PriceInInst.ParamByName('PriceInInst').Value := quPriceInInst.FieldByName('PriceInInst').AsFloat;
                                                                                           //ShowMessage(quPriceInInst.FieldByName('PriceInInst').AsString);
                                                                                           quInsInD_Control_PriceInInst.ParamByName('Price_ECO').Value := c;
                                                                                           quInsInD_Control_PriceInInst.ParamByName('PostNo').Value := PostNo;
                                                                                           quInsInD_Control_PriceInInst.ParamByName('Dhead_id').Value := dhead_id;
                                                                                           quInsInD_Control_PriceInInst.Execute;
                                                                                           SysUtils.DecimalSeparator := OldSeparator;
                                                                                           is_Post := True;
                                                                                         end
                                                                                    else begin
                                                                                           quNaklP.Cancel;
                                                                                           is_Post := False;
                                                                                           ShowMessage('Отменено пользователем');

                                                                                         end;

           end;

      quPriceInInst.Close;
    end;


    if quNaklP.State in [dsInsert, dsEdit] then quNaklP.Post;

    TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.FieldByName('article_id').AsInteger := Prih.TovarNo;
    TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.FieldByName('qty').AsFloat := Prih.Kol;
    TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.FieldByName('Price_eco').AsFloat := Prih.PriceIn;
    TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.FieldByName('article_name').AsString := Prih.NameTovar;
    TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.FieldByName('Dhead_ID').Value := dhead_id;
    TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.FieldByName('DateOfManufacture').Value := DateOfManufacture;

    if is_Post = True then begin
//                             dmDataModule.ExecSQL('insert into l_PriceInInstForNaklP (Dhead_ID,TovarNo,PriceInInst) values (:p1_Dhead_ID,:p2_TovarNo,:p3_PriceInInst)',[TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.FieldByName('Dhead_ID').Value,Prih.TovarNo,PriceInInst]);
                             TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.Post;
                           end
                      else TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.Cancel;
    InsertTovarInWarehouseItem(dhead_id, Prih.TovarNo, -1);
    DateOfManufacture := 0;
    is_insert := False;
  end;
  if TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.State = dsInsert then
     TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.Cancel;
end;

procedure TfmPrihodTov.bbCancelClick(Sender: TObject);
begin
  if TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.State in [dsEdit, dsInsert] then TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.Cancel;
  if quNaklP.State in [dsEdit, dsInsert] then quNaklP.Cancel;
  if quNaklPDelay.State in [dsEdit, dsInsert] then quNaklPDelay.Cancel;
end;

procedure TfmPrihodTov.quNaklPNewRecord(DataSet: TDataSet);
begin
  quNaklP.FieldByName('DateNakl').AsDateTime := Date();
  quNaklP.FieldByName('DatePrih').AsDateTime := Date();
  quNaklP.FieldByName('Buh').AsInteger := 1;
  quNaklP.FieldByName('OtdelNo').AsInteger := OtdelNoWork;
  quNaklP.FieldByName('Doc_type').AsInteger := 1;

  quNaklP.FieldByName('UserNo').AsInteger := Data.UserNo;
  if OtdelNoWork = 3 then
  begin
    quNaklP.FieldByName('VidNaklNo').AsInteger := 4;
  end
  else
  begin
    quNaklP.FieldByName('VidNaklNo').AsInteger := 1;
  end;

end;

procedure TfmPrihodTov.deNamePostEnter(Sender: TObject);
begin
  if quNaklP.FieldByName('PostNo').AsInteger = 0 then
    ChangePost;
end;

procedure TfmPrihodTov.deNamePostDblClick(Sender: TObject);
begin
  ChangePost;
end;

procedure TfmPrihodTov.deNamePostKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    ChangePost;
end;

procedure TfmPrihodTov.quNaklPBeforePost(DataSet: TDataSet);
begin
  DataSet.FieldByName('OurFirmNo').AsInteger := dmDataModule.FirmNo;
  quWork.SQL.Clear;
  quWork.SQL.Add('select Max(NaklNo) from NaklP');
  quWork.Open;
  quNaklP.FieldByName('NaklNo').AsInteger := quWork.Fields[0].AsInteger + 1;
  quWork.Close;
end;

procedure TfmPrihodTov.DBLookupComboBox1Exit(Sender: TObject);
begin
  l_direction := quDocType.fieldbyname('art_dir').AsInteger;

//  showmessage(inttostr(quDocType.fieldbyname('id').AsInteger));

  quNaklP.FieldByName('vidnaklno').AsInteger := quDocType.fieldbyname('vidnaklno').AsInteger;

//  showmessage(inttostr(quDocType.fieldbyname('vidnaklno').AsInteger));

  ep_Prihod_id.Enabled := l_direction = -1;

//  ep_Prihod_id.Enabled := true;

end;

function TfmPrihodTov.ep_Prihod_idIsSelect(Sender: TObject): Boolean;
begin
  inherited;
  if ParamIsSelect(Sender) then
  begin
    quNaklP.FieldByName('parent_NaklNo').AsInteger := StrToInt(ep_prihod_id.KeyFieldValue);
  end;
end;

procedure TfmPrihodTov.DBLookupComboBox1Click(Sender: TObject);
begin
  inherited;
  l_direction := quDocType.fieldbyname('art_dir').AsInteger;
  quNaklP.FieldByName('vidnaklno').AsInteger := quDocType.fieldbyname('vidnaklno').AsInteger;
  ep_Prihod_id.Enabled := l_direction = -1;
end;

procedure TfmPrihodTov.DBGrid1TitleClick(Column: TColumn);
var
  PrihNo: Int64;
begin
  Screen.Cursor := crHourGlass;
  PrihNo := TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.FieldByName('id').Value;
  TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.Close;
  case Column.Index of
    0: TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.MacroByName('_order').Value := 'No_pp';
    1: TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.MacroByName('_order').Value := 'Order_num';
    2: TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.MacroByName('_order').Value := 'article_name';
    3: TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.MacroByName('_order').Value := 'qty';
    4: TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.MacroByName('_order').Value := 'Price_eco';
  end;
  TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.Open;
  TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.Locate('ID', PrihNo, []);
  Screen.Cursor := crDefault;
end;

procedure TfmPrihodTov.dsPrihodDataChange(Sender: TObject; Field: TField);
var
  quPriceInInst : TMSQuery;
  quInsInD_Control_PriceInInst : TMSQuery;
  a,b,c         : Currency;
  Delta         : Boolean;
begin
  inherited;
  if Field <> nil then
  begin
 {
    if (UpperCase(Field.FieldName) = 'QTY') and (is_insert = False) then begin
                                                                           TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.Cancel;
                                                                           if quNaklP.State in [dsEdit, dsInsert] then quNaklP.Post;
                                                                           raise Exception.Create(' Нельзя редактировать кол-во!'+ #10#13 +
                                                                                                  'Необходимо удалить, и заново создать запись в накладной!');
                                                                         end;
}
    if (UpperCase(Field.FieldName) = 'PRICE_ECO') then
    begin
      quPriceInInst:=TMSQuery.Create(nil);
      quPriceInInst.Connection:=dmDataModule.DB;
      quPriceInInst.SQL.Clear;
      quPriceInInst.SQL.Text:= 'select isnull(PriceInInst,0) as PriceInInst from PriceForVeb where TovarNo = :TovarNo';
      quPriceInInst.ParamByName('TovarNo').Value := TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.FieldByName('article_id').AsInteger;
      quPriceInInst.Open;

      a:=  quPriceInInst.FieldByName('PriceInInst').AsFloat - DeltaPriceInInst;
      b:=  quPriceInInst.FieldByName('PriceInInst').AsFloat + DeltaPriceInInst;
      c:=  TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.FieldByName('Price_eco').AsFloat;

      if ((a <= c) and (c <= b)) then Delta := True
                                 else Delta := False;

      if Delta = False
      then begin
             ShowMessage('Цена '+floattostr(TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.FieldByName('Price_eco').AsFloat)+ 'не входит в допустимый интервал цены.' + #10#13 +
                         'Допустимый интервал: с ' + floattostr(quPriceInInst.FieldByName('PriceInInst').AsFloat - DeltaPriceInInst) +
                         ' по ' + floattostr(quPriceInInst.FieldByName('PriceInInst').AsFloat + DeltaPriceInInst) + #10#13 +
                         'Данные вносятся в отчет по контролю входящей установленной цены.' + #10#13 +
                         'Для того что бы убрать запись из отчета введите цену входящую в допустимый интервал цены.');
           end;
{
             quInsInD_Control_PriceInInst:=TMSQuery.Create(nil);
             quInsInD_Control_PriceInInst.Connection:=dmDataModule.DB;
             quInsInD_Control_PriceInInst.SQL.Clear;
             quInsInD_Control_PriceInInst.SQL.Text:= 'insert into D_Control_PriceInInst (UserNo,TovarNo,PriceInInst,Price_ECO,Date,PostNo,HostName)'
                                                    +'values (:UserNo,:TovarNo,:PriceInInst,:Price_ECO,GetDate(),:PostNo,HOST_NAME())';
             quInsInD_Control_PriceInInst.ParamByName('UserNo').Value := Data.UserNo;
             quInsInD_Control_PriceInInst.ParamByName('TovarNo').Value := TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.FieldByName('article_id').AsInteger;
             quInsInD_Control_PriceInInst.ParamByName('PriceInInst').Value := quPriceInInst.FieldByName('PriceInInst').AsFloat;
             quInsInD_Control_PriceInInst.ParamByName('Price_ECO').Value := c;
             quInsInD_Control_PriceInInst.ParamByName('PostNo').Value := PostNo;
             quInsInD_Control_PriceInInst.Execute;
           end;
}
      quPriceInInst.Close;
    end;

    if (UpperCase(Field.FieldName) = 'QTY') or (UpperCase(Field.FieldName) = 'PRICE_ECO') then
      begin
        if quNaklP.State in [dsEdit, dsInsert] then quNaklP.Post;
      end;

  end;
end;

procedure TfmPrihodTov.quNaklPAfterPost(DataSet: TDataSet);
begin
  inherited;
  quNaklP.Refresh;
end;

procedure TfmPrihodTov.ActionViewRefreshExecute(Sender: TObject);
begin
  inherited;
  TMlekoDbDsMSSQLDm(CustomDm).DSpecRefresh;
end;

procedure TfmPrihodTov.dsPrihodUpdateData(Sender: TObject);
begin
  inherited;

  quNaklP.Refresh;
end;

procedure TfmPrihodTov.bbPrintClick(Sender: TObject);
var
  params: TParams;
begin
  Params := TParams.Create;
  try
    UtilsCommon.SetParamValue(Params, 'p_NaklNo', quNaklP.FieldByName('NaklNo').AsString);
    TCFLMLKCustomRepDlg.ShowRep(83, Params);
  finally
    Params.Free;
  end;
end;



procedure TfmPrihodTov.cbSetArticleGroupExit(Sender: TObject);
begin
  inherited;

  quNaklPDelay.Open;
  dsNaklPDelay.Edit;
  quNaklPDelayNaklNo.Value := dhead_id;
  quNaklPDelaySET_ARTICLE_GROUP_ID.Value := QuSetArtGroupSET_ARTICLE_GROUP_ID.Value;
  quNaklPDelayDay_Delay.Value := QuSetArtGroupDAY_DELAY.Value;
  quNaklPDelayDay_Delay_Ext.Value := QuSetArtGroupDAY_DELAY_EXT.Value;
  quNaklPDelayBuh.Value := quNaklPBuh.Value;
  quNaklPDelay.Post;

  quNaklPDelay.Close;                                                  
  quNaklPDelay.ParamByName('NaklNo').Value := dhead_id;
  quNaklPDelay.Open;

  cbSetArticleGroup.KeyValue := quNaklPDelayId.Value;
end;

procedure TfmPrihodTov.cbSetArticleGroupCloseUp(Sender: TObject);
begin
  inherited;
  quNaklPDelay.Open;
  dsNaklPDelay.Edit;
  quNaklPDelayNaklNo.Value := dhead_id;
  quNaklPDelaySET_ARTICLE_GROUP_ID.Value := QuSetArtGroupSET_ARTICLE_GROUP_ID.Value;
  quNaklPDelayDay_Delay.Value := QuSetArtGroupDAY_DELAY.Value;
  quNaklPDelayDay_Delay_Ext.Value := QuSetArtGroupDAY_DELAY_EXT.Value;
  quNaklPDelayBuh.Value := quNaklPBuh.Value;
  quNaklPDelay.Post;

  quNaklPDelay.Close;
  quNaklPDelay.ParamByName('NaklNo').Value := dhead_id;
  quNaklPDelay.Open;

  cbSetArticleGroup.KeyValue := quNaklPDelayId.Value;

end;

procedure TfmPrihodTov.lcBuhPropertiesCloseUp(Sender: TObject);
begin
  inherited;
{
  QuSetArtGroup.Close;
  QuSetArtGroup.ParamByName('Buh').AsInteger := quBuhbuh.AsInteger;
  QuSetArtGroup.Open;
}
end;

procedure TfmPrihodTov.lcBuhPropertiesChange(Sender: TObject);
begin
  inherited;
  QuSetArtGroup.Close;
  QuSetArtGroup.ParamByName('Buh').AsInteger := lcBuh.EditValue;
  QuSetArtGroup.Open;
end;

procedure TfmPrihodTov.Button1Click(Sender: TObject);
begin
  inherited;
   if TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.State in [dsInsert, dsEdit] then
    TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.Post;
end;

procedure TfmPrihodTov.Button2Click(Sender: TObject);
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

function TfmPrihodTov.ChangeTovarInWarehouseItem(pkey, TovarID: Int64; houseID: Integer): Boolean;
begin
  Result:= False;
  try
   tbTovarInWarehouse.Open;
   try
     if tbTovarInWarehouse.Locate('pkey;TovarID', VarArrayOf([pkey, TovarID]), []) then
     begin
       tbTovarInWarehouse.Edit;
       tbTovarInWarehouse.FieldByName('HouseID').Value:= houseID;
       tbTovarInWarehouse.Post;
       Result:= True;
     end
    except
      Result:= False;
    end;
   finally
    tbTovarInWarehouse.Close;
   end;
end;

function TfmPrihodTov.InsertTovarInWarehouseItem(pkey, TovarID: Int64; houseID: Integer): Boolean;
var VhouseID: Variant;
    Query, quMaxID: TMSQuery;
    MaxID: Integer;
begin
  Result:= False;
  try
    Query:= TMlekoDbDsMSSQLDm(CustomDm).quDSPEC;
    pkey:= Query.FieldByName('dhead_id').Value;
    TovarID:= Query.FieldByName('article_id').Value;
    tbTovarInWarehouse.Open;
    if not tbTovarInWarehouse.Locate('pkey;TovarID', VarArrayOf([pkey, TovarID]), []) then
    begin
      quMaxID:=TMSQuery.Create(nil);
      quMaxID.Connection:=dmDataModule.DB;
      quMaxID.SQL.Text:= 'select isnull((select max(id) from dbo.TovarInWarehouse), 0) as ID';
      quMaxID.Open;
      MaxID:= quMaxID.FieldByName('ID').Value;
      if (houseID<=0) then
         begin
          quMaxID.Close;
          quMaxID.SQL.Text:= 'select HouseID from dbo.L_Tovar_WareHouse where TovarID=' +
                             IntToStr(TovarID);
          quMaxID.Open;
          VhouseID:= quMaxID.FieldByName('HouseID').Value;
          if not VarIsNull(VhouseID) then
             houseID:= VhouseID;
         end;
        quMaxID.Close;
        quMaxID.Free;
      tbTovarInWarehouse.Edit;
      tbTovarInWarehouse.Append;
      if (houseID<=0) then
      tbTovarInWarehouse.FieldByName('HouseID').Value:= null else
      tbTovarInWarehouse.FieldByName('HouseID').Value:= houseID;
      tbTovarInWarehouse.FieldByName('pkey').Value:= pkey;
      tbTovarInWarehouse.FieldByName('TovarID').Value:= TovarID;
      tbTovarInWarehouse.FieldByName('ID').Value:= MaxID+1;
      tbTovarInWarehouse.Post;
      Result:= True;
    end;
    tbTovarInWarehouse.Close;
  except
    Result:= False;
  end;
end;

function TfmPrihodTov.DeleteTovarInWarehouseItem(): Boolean;
var houseID, MaxID: Integer;
    VhouseID: Variant;
    Query, quMaxID: TMSQuery;
    pkey: Int64; TovarID: Int64;
begin
  Result:= False;
  try
    Query:= TMlekoDbDsMSSQLDm(CustomDm).quDSPEC;
    pkey:= Query.FieldByName('dhead_id').Value;
    TovarID:= Query.FieldByName('article_id').Value;
    tbTovarInWarehouse.Open;
    if tbTovarInWarehouse.Locate('pkey;TovarID', VarArrayOf([pkey, TovarID]), []) then
    begin
     tbTovarInWarehouse.Edit;
     tbTovarInWarehouse.Delete;
     tbTovarInWarehouse.Post;
     Result:= True;
    end;
    tbTovarInWarehouse.Close;
  except
    Result:= False;
  end;
end;

procedure TfmPrihodTov.SelectWareHouse();
var houseID, MaxID: Integer;
    VhouseID: Variant;
    Query, quMaxID: TMSQuery;
    pkey: Int64; TovarID: Int64;
begin
  Query:= TMlekoDbDsMSSQLDm(CustomDm).quDSPEC;
  VhouseID:= Query.FieldByName('HouseID').Value;
  MaxID:= -1;
  if not VarIsNull(VhouseID) then
     MaxID:= Query.FieldByName('HouseID').AsInteger;
  houseID:= GetWarehouseIDByDlg(@MaxID);
  if (houseID>0) then
     begin
       pkey:= Query.FieldByName('dhead_id').Value;
       TovarID:= Query.FieldByName('article_id').Value;
       if not ChangeTovarInWarehouseItem(pkey, TovarID, houseID) then
         InsertTovarInWarehouseItem(pkey, TovarID, houseID);
       Query.Refresh;
       DBGrid1.Refresh;
     end;  
end;


procedure TfmPrihodTov.DBGrid1DblClick(Sender: TObject);
var Field: TField;
begin
  inherited;
  Field:= DBGrid1.SelectedField;
  if (Field<>nil) and (Field.FieldName='HouseName') then
     SelectWareHouse;
end;

end.

