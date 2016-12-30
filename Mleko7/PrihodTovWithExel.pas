unit PrihodTovWithExel;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Dialogs,
  StdCtrls, Forms, MlekoForm, DBCtrls, DB, DBGrids, Grids, Mask, ExtCtrls, Buttons,
  citCtrls, citmask, citDBComboEdit, DBAccess, MsAccess, CFLMLKCustom,
  MemDS, ActnList, cxGraphics, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, ActiveX, Registry,
  cxDBLookupComboBox, cxCalendar, cxDBEdit, DBCtrlsEh, Excel2000, ComObj;

type
  TfmPrihodTovWithExel = class(TCFLMLKCustomForm)
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
    od_InputNaklPWithExcel: TOpenDialog;
    bbImportNaklP: TBitBtn;
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
    function IsOLEObjectInstalled(Name:string):boolean;
    procedure bbImportNaklPClick(Sender: TObject);
  private
    dhead_id: Int64;
    is_insert : boolean;
  public
    { public declarations }
  end;

var
  l_cont_type_code: string;
  l_direction: integer;
  fmPrihodTovWithExel: TfmPrihodTovWithExel;
  OtdelNoWork: integer;
  PostNo: integer;
procedure PrihodTovarWithExel(OtdelNo: integer; var Pkey: Int64);
implementation

uses data, PrintNaklP, TovarPrih, Post0, MlekoDbDsMSSQL, main,
  Variants, BCDbMSSQL,UtilsCommon, CFLMLKCustomRep;

{$R *.DFM}

function TfmPrihodTovWithExel.IsOLEObjectInstalled(Name:string):boolean;
var
  ClassID : TCLSID;
  Rez     : HRESULT;
begin
  // Ищем CLSID OLE-объекта
  Rez := CLSIDFromProgID(PWideChar(WideString(Name)),ClassID);
  if Rez=S_OK then
  // Объект найден
                Result := true
              else
                Result := false;
end;

procedure PrihodTovarWithExel(OtdelNo: integer; var Pkey: Int64);
var
  msg,msg1: string;

begin
  fmPrihodTovWithExel := TfmPrihodTovWithExel.Create(Application);
  fmPrihodTovWithExel.dhead_id := pkey;

  fmPrihodTovWithExel.quNaklPDelay.Close;
  fmPrihodTovWithExel.quNaklPDelay.ParamByName('NaklNo').Value := Pkey;
  fmPrihodTovWithExel.quNaklPDelay.Open;

//  fmPrihodTovWithExel.QuSetArtGroup.Open;

//  if fmPrihodTovWithExel.quNaklPDelay.RecordCount > 0 then begin
{
                                                     fmPrihodTovWithExel.quNaklP.Close;
                                                     fmPrihodTovWithExel.quNaklP.ParamByName('dhead_id').Value := Pkey;
                                                     fmPrihodTovWithExel.quNaklP.Open;
                                                     fmPrihodTovWithExel.QuSetArtGroup.Close;
                                                     fmPrihodTovWithExel.QuSetArtGroup.ParamByName('SET_ARTICLE_GROUP_ID').Value := fmPrihodTovWithExel.quNaklPDelaySET_ARTICLE_GROUP_ID.Value;
                                                     fmPrihodTovWithExel.QuSetArtGroup.ParamByName('NamePost').Value := fmPrihodTovWithExel.quNaklP.FieldByName('Name').AsString;
                                                     fmPrihodTovWithExel.QuSetArtGroup.Open;
                                                     fmPrihodTovWithExel.QuSetArtGroup.Refresh;
                                                     fmPrihodTovWithExel.quNaklP.Close;

                                                     fmPrihodTovWithExel.cbSetArticleGroup.KeyValue := fmPrihodTovWithExel.quNaklPDelaySET_ARTICLE_GROUP_ID.Value;
                                                     fmPrihodTovWithExel.cbSetArticleGroup.Enabled := True;
}

//                                                     fmPrihodTovWithExel.cbSetArticleGroup.KeyValue := quNaklPDelay.FieldByName('SET_ARTICLE_GROUP_ID').AsString + quNaklPDelayBuh.AsString ;

//                                                   end;

  fmPrihodTovWithExel.ActiveControl := fmPrihodTovWithExel.deNamePost;

  try
    with fmPrihodTovWithExel do
    begin
      QuSetArtGroup.Open;

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
    if fmPrihodTovWithExel.ShowModal= mrOk then
    begin
      If fmPrihodTovWithExel.quNaklP.State in [dsInsert,dsEdit] then fmPrihodTovWithExel.quNaklP.Post;
    end;
  finally
    if VarIsNull(fmPrihodTovWithExel.quNaklP.FieldByName('Pkey').Value) then
      Pkey := -1
    else
      Pkey := fmPrihodTovWithExel.quNaklP.FieldByName('Pkey').Value;

    fmPrihodTovWithExel.QuSetArtGroup.Close;
    fmPrihodTovWithExel.quNaklPDelay.Close;
    fmPrihodTovWithExel.Free;
  end;
end;

procedure TfmPrihodTovWithExel.ChangePost;
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

procedure TfmPrihodTovWithExel.ScrollBoxExit(Sender: TObject);
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

                                        //fmPrihodTovWithExel.ActiveControl := cbSetArticleGroup;
                                        ActiveControl := cbSetArticleGroup;
                                      end;

  if cxDBLookupComboBox1.Text = '' then begin
                                          ShowMessage('Не заполнено обязательное поле: ''Отдел''!');
                                          ActiveControl := cxDBLookupComboBox1;
                                        end;

  if lcBuh.Text = '' then begin
                            ShowMessage('Не заполнено обязательное поле: ''Тип''!');
                            ActiveControl := lcBuh;
                          end;

  if StrToDate(EditDate.Text) > dmDataModule.quSetupDateBlock.AsDateTime then
  begin
    if quNaklP.FieldByName('PostNo').AsInteger = 0 then
    begin
      fmPrihodTovWithExel.ActiveControl := deNamePost;
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

procedure TfmPrihodTovWithExel.bbOKClick(Sender: TObject);
begin
   if TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.State in [dsInsert, dsEdit] then
    TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.Post;

end;

procedure TfmPrihodTovWithExel.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);

begin

  if ((Key = VK_DOWN) or (Key = VK_INSERT)) and (DBGrid1.DataSource.DataSet.State in [dsInsert]) then
    fmPrihodTovWithExel.bbPrihodInsert.Click;

end;

procedure TfmPrihodTovWithExel.bbPrihodDelClick(Sender: TObject);
begin
  DBGrid1.DataSource.DataSet.Delete;
end;

procedure TfmPrihodTovWithExel.bbPrihodInsertClick(Sender: TObject);
var
  quInsInD_Control_PriceInInst : TMSQuery;
  Prih                         : TPrihRet;
  quPriceInInst                : TMSQuery;
  a,b,c,PriceInInst            : Currency;
  Delta                        : Boolean;
  l_str                        : string;
  is_Post                      : Boolean;

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
                                                                                           quInsInD_Control_PriceInInst:=TMSQuery.Create(nil);
                                                                                           quInsInD_Control_PriceInInst.Connection:=dmDataModule.DB;
                                                                                           quInsInD_Control_PriceInInst.SQL.Clear;
                                                                                           quInsInD_Control_PriceInInst.SQL.Text:= 'insert into D_Control_PriceInInst (UserNo,TovarNo,PriceInInst,Price_ECO,Date,PostNo,HostName,Dhead_id)'
                                                                                                                                  +'values (:UserNo,:TovarNo,:PriceInInst,:Price_ECO,GetDate(),:PostNo,HOST_NAME(),:Dhead_id)';
                                                                                           quInsInD_Control_PriceInInst.ParamByName('UserNo').Value := Data.UserNo;
                                                                                           quInsInD_Control_PriceInInst.ParamByName('TovarNo').Value := Prih.TovarNo;
                                                                                           quInsInD_Control_PriceInInst.ParamByName('PriceInInst').Value := quPriceInInst.FieldByName('PriceInInst').AsFloat;
                                                                                           quInsInD_Control_PriceInInst.ParamByName('Price_ECO').Value := c;
                                                                                           quInsInD_Control_PriceInInst.ParamByName('PostNo').Value := PostNo;
                                                                                           quInsInD_Control_PriceInInst.ParamByName('Dhead_id').Value := dhead_id;
                                                                                           quInsInD_Control_PriceInInst.Execute;
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
    DateOfManufacture := 0;
    is_insert := False;
  end;
  if TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.State = dsInsert then
     TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.Cancel;
end;

procedure TfmPrihodTovWithExel.bbCancelClick(Sender: TObject);
begin
  if TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.State in [dsEdit, dsInsert] then TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.Cancel;
  if quNaklP.State in [dsEdit, dsInsert] then quNaklP.Cancel;
  if quNaklPDelay.State in [dsEdit, dsInsert] then quNaklPDelay.Cancel;
end;

procedure TfmPrihodTovWithExel.quNaklPNewRecord(DataSet: TDataSet);
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

procedure TfmPrihodTovWithExel.deNamePostEnter(Sender: TObject);
begin
  if quNaklP.FieldByName('PostNo').AsInteger = 0 then
    ChangePost;
end;

procedure TfmPrihodTovWithExel.deNamePostDblClick(Sender: TObject);
begin
  ChangePost;
end;

procedure TfmPrihodTovWithExel.deNamePostKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    ChangePost;
end;

procedure TfmPrihodTovWithExel.quNaklPBeforePost(DataSet: TDataSet);
begin
  DataSet.FieldByName('OurFirmNo').AsInteger := dmDataModule.FirmNo;
  quWork.SQL.Clear;
  quWork.SQL.Add('select Max(NaklNo) from NaklP');
  quWork.Open;
  quNaklP.FieldByName('NaklNo').AsInteger := quWork.Fields[0].AsInteger + 1;
  quWork.Close;
end;

procedure TfmPrihodTovWithExel.DBLookupComboBox1Exit(Sender: TObject);
begin
  l_direction := quDocType.fieldbyname('art_dir').AsInteger;

//  showmessage(inttostr(quDocType.fieldbyname('id').AsInteger));

  quNaklP.FieldByName('vidnaklno').AsInteger := quDocType.fieldbyname('vidnaklno').AsInteger;

//  showmessage(inttostr(quDocType.fieldbyname('vidnaklno').AsInteger));

  ep_Prihod_id.Enabled := l_direction = -1;

//  ep_Prihod_id.Enabled := true;

end;

function TfmPrihodTovWithExel.ep_Prihod_idIsSelect(Sender: TObject): Boolean;
begin
  inherited;
  if ParamIsSelect(Sender) then
  begin
    quNaklP.FieldByName('parent_NaklNo').AsInteger := StrToInt(ep_prihod_id.KeyFieldValue);
  end;
end;

procedure TfmPrihodTovWithExel.DBLookupComboBox1Click(Sender: TObject);
begin
  inherited;
  l_direction := quDocType.fieldbyname('art_dir').AsInteger;
  quNaklP.FieldByName('vidnaklno').AsInteger := quDocType.fieldbyname('vidnaklno').AsInteger;
  ep_Prihod_id.Enabled := l_direction = -1;
end;

procedure TfmPrihodTovWithExel.DBGrid1TitleClick(Column: TColumn);
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

procedure TfmPrihodTovWithExel.dsPrihodDataChange(Sender: TObject; Field: TField);
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

procedure TfmPrihodTovWithExel.quNaklPAfterPost(DataSet: TDataSet);
begin
  inherited;
  quNaklP.Refresh;
end;

procedure TfmPrihodTovWithExel.ActionViewRefreshExecute(Sender: TObject);
begin
  inherited;
  TMlekoDbDsMSSQLDm(CustomDm).DSpecRefresh;
end;

procedure TfmPrihodTovWithExel.dsPrihodUpdateData(Sender: TObject);
begin
  inherited;
  quNaklP.Close;
  quNaklP.Open;
end;

procedure TfmPrihodTovWithExel.bbPrintClick(Sender: TObject);
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



procedure TfmPrihodTovWithExel.cbSetArticleGroupExit(Sender: TObject);
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

procedure TfmPrihodTovWithExel.cbSetArticleGroupCloseUp(Sender: TObject);
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

procedure TfmPrihodTovWithExel.lcBuhPropertiesCloseUp(Sender: TObject);
begin
  inherited;
{
  QuSetArtGroup.Close;
  QuSetArtGroup.ParamByName('Buh').AsInteger := quBuhbuh.AsInteger;
  QuSetArtGroup.Open;
}
end;

procedure TfmPrihodTovWithExel.lcBuhPropertiesChange(Sender: TObject);
begin
  inherited;
  QuSetArtGroup.Close;
  QuSetArtGroup.ParamByName('Buh').AsInteger := lcBuh.EditValue;
  QuSetArtGroup.Open;
end;

procedure TfmPrihodTovWithExel.Button1Click(Sender: TObject);
begin
  inherited;
   if TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.State in [dsInsert, dsEdit] then
    TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.Post;
end;

procedure TfmPrihodTovWithExel.bbImportNaklPClick(Sender: TObject);
const
  xlValues = -4163;
  xlWhole = 1;
var
  cls_ExcelObject: string;
  RegData: TRegistry;
  WorkSheet: Variant;
  Excel: Variant;
  ExURng: variant;
  i, index : Integer;
  ListFieldName: TMSQuery;
  PrepareTovarNo: TMSQuery;
  FindStr, l_str : String;
  Row, KodCol, NameCol, PriceNDSCol, PriceNoNDSCol, KolCol, DateOfManufactureCol: Integer;
  FindCell : Variant;
  Qty : Double;
  QtyS : string;
  a,b,c,PriceInInst,Price : Currency;
  PriceS : string;
  StavNds : Double;
  is_Post,Delta : Boolean;
  quPriceInInst : TMSQuery;
  quInsInD_Control_PriceInInst : TMSQuery;
  ListFieldError : String;
  isKodCol,isNameCol,isKolCol,isPriceNoNDSCol,isPriceNDSCol,isPrice, isDateOfManufacture : Boolean;
  DateOfManufacture : TDateTime;
begin
  inherited;
// Чтобы не применять локальные
// для каждой версии
// названия "Excel.Application.8", "Excel.Application.9".

  cls_ExcelObject := 'Excel.Application';
  RegData := TRegistry.Create;
  RegData.RootKey := HKEY_CLASSES_ROOT;
  try
    if RegData.OpenKey('\Excel.Application\CurVer', False) then
    begin
      cls_ExcelObject := regData.ReadString('');
      RegData.CloseKey;
    end
  finally
    regData.Free;
  end;

  if not IsOLEObjectInstalled(cls_ExcelObject) then
   begin
     ShowMessage('Excel не установлен.');
     exit;
   end;

  // Вот теперь откроем Excel
  Excel := CreateOleObject(cls_ExcelObject);

  // Отключаем реакцию Excel на события,
  // чтобы ускорить обработку информации информации
  // и делаем процесс невидимым

  Excel.Application.ScreenUpdating := False;
  Excel.Application.EnableEvents := false;
  Excel.Application.Interactive := False;
  Excel.Application.DisplayAlerts := False;
//  Excel.ActiveSheet.DisplayPageBreaks := False;
  Excel.Application.DisplayStatusBar := False;
  Excel.Visible := false;

  od_InputNaklPWithExcel.DefaultExt := '.xls';   // Выбираем файл для импорта данных
  od_InputNaklPWithExcel.Filter := 'Excel (*.xls)|*.xls'; // Устанавливаем фильтер

  if od_InputNaklPWithExcel.Execute then
   begin
     Excel.Workbooks.Open(od_InputNaklPWithExcel.FileName);
     WorkSheet := Excel.Workbooks[1].WorkSheets[1];
     WorkSheet.Columns.AutoFit;
     i := Excel.ActiveSheet.UsedRange.Rows.Count;
     ExURng := WorkSheet.UsedRange;

     ListFieldName := TMSQuery.Create(nil);
     ListFieldName.Connection:= dmDataModule.DB;
     ListFieldName.SQL.Clear;
     ListFieldName.SQL.Text := 'declare @PostNo int '
                              +' set @PostNo = :PostNo '
                              +' select  dviefnp.ID '
                              +'       , dviefnp.Name '
                              +'       , lviefnp.Column_Name_Post '
                              +'       , isnull(lviefnp.PostNo,@PostNo) as PostNo '
                              +'  from d_VidImportExelFileForNaklP dviefnp left join '
                              +'       L_VidImportExelFileForNaklP lviefnp on lviefnp.d_VidImportExelFileForNaklP_id = dviefnp.ID and lviefnp.PostNo = @PostNo ';
//                              +'   where lviefnp.Column_Name_Post is not null ';
     ListFieldName.ParamByName('PostNo').Value := PostNo;
     ListFieldName.Open;

     if ListFieldName.RecordCount = 0 then raise Exception.Create(' По этому контрагентуагенту не настроина таблица соответствия загрузки из екселя! '+ #10#13 +
                                                                  'Заполните таблицу и повторите попытку.');

     ListFieldName.First;


// Цикл проверки нахождения номеров столбцов в файле
     ListFieldError := '';
     while not ListFieldName.Eof do
      begin
        if ListFieldName.FieldByName('Name').Value = 'Код товара' then
         begin
           if (ListFieldName.FieldByName('Column_Name_Post').AsString = '') then FindStr := 'Не задано'
                                                                            else FindStr := ListFieldName.FieldByName('Column_Name_Post').Value;
           isKodCol := True;

           FindCell := ExURng.Find(What:=FindStr, LookIn:=xlValues, LookAt:=xlWhole, MatchCase:=False);

           if Pointer(IDispatch(FindCell))=nil then
            begin
              isKodCol := False;
              FindStr := ListFieldName.FieldByName('Name').Value +' --- '+FindStr;
              ListFieldError := ListFieldError + ' '+FindStr+' '+ #10#13;
            end;
         end;

        if ListFieldName.FieldByName('Name').Value = 'Наименование товара' then
         begin
           if (ListFieldName.FieldByName('Column_Name_Post').AsString = '') then FindStr := 'Не задано'
                                                                            else FindStr := ListFieldName.FieldByName('Column_Name_Post').Value;
           isNameCol := True;

           FindCell := ExURng.Find(What:=FindStr, LookIn:=xlValues, LookAt:=xlWhole, MatchCase:=False);

           if Pointer(IDispatch(FindCell))=nil then
            begin
              isNameCol := False;
              FindStr := ListFieldName.FieldByName('Name').Value +' --- '+FindStr;
              ListFieldError := ListFieldError + ' '+FindStr+' '+ #10#13;
            end;
         end;

        if ListFieldName.FieldByName('Name').Value = 'Количество' then
         begin
           if (ListFieldName.FieldByName('Column_Name_Post').AsString = '') then FindStr := 'Не задано'
                                                                            else FindStr := ListFieldName.FieldByName('Column_Name_Post').Value;
           isKolCol := True;

           FindCell := ExURng.Find(What:=FindStr, LookIn:=xlValues, LookAt:=xlWhole, MatchCase:=False);

           if Pointer(IDispatch(FindCell))=nil then
            begin
              isKolCol := False;
              FindStr := ListFieldName.FieldByName('Name').Value +' --- '+FindStr;
              ListFieldError := ListFieldError + ' '+FindStr+' '+ #10#13;
            end;
         end;

        if ListFieldName.FieldByName('Name').Value = 'Цена без НДС' then
         begin
           if (ListFieldName.FieldByName('Column_Name_Post').AsString = '') then FindStr := 'Не задано'
                                                                            else FindStr := ListFieldName.FieldByName('Column_Name_Post').Value;
           isPriceNoNDSCol := True;

           FindCell := ExURng.Find(What:=FindStr, LookIn:=xlValues, LookAt:=xlWhole, MatchCase:=False);

           if Pointer(IDispatch(FindCell))=nil then
            begin
              isPriceNoNDSCol := False;
              FindStr := ListFieldName.FieldByName('Name').Value +' --- '+FindStr;
              ListFieldError := ListFieldError + ' '+FindStr+' '+ #10#13;
            end;
         end;

        if ListFieldName.FieldByName('Name').Value = 'Цена с НДС' then
         begin
           if (ListFieldName.FieldByName('Column_Name_Post').AsString = '') then FindStr := 'Не задано'
                                                                            else FindStr := ListFieldName.FieldByName('Column_Name_Post').Value;
           isPriceNDSCol := True;

           FindCell := ExURng.Find(What:=FindStr, LookIn:=xlValues, LookAt:=xlWhole, MatchCase:=False);

           if Pointer(IDispatch(FindCell))=nil then
            begin
              isPriceNDSCol := False;
              FindStr := ListFieldName.FieldByName('Name').Value +' --- '+FindStr;
              ListFieldError := ListFieldError + ' '+FindStr+' '+ #10#13;
            end
         end;

         if ListFieldName.FieldByName('Name').Value = 'Дата производства' then
         begin
           if (ListFieldName.FieldByName('Column_Name_Post').AsString = '') then FindStr := 'Не задано'
                                                                            else FindStr := ListFieldName.FieldByName('Column_Name_Post').Value;
           isDateOfManufacture := True;

           FindCell := ExURng.Find(What:=FindStr, LookIn:=xlValues, LookAt:=xlWhole, MatchCase:=False);

           if Pointer(IDispatch(FindCell))=nil then
            begin
              isDateOfManufacture := False;
              FindStr := ListFieldName.FieldByName('Name').Value +' --- '+FindStr;
              ListFieldError := ListFieldError + ' '+FindStr+' '+ #10#13;
            end
         end;

        ListFieldName.Next;
      end;

     if ListFieldError <> '' then
      begin
//        delete (ListFieldError,Length(ListFieldError)-1,Length(ListFieldError));

        isPrice := (isPriceNDSCol or isPriceNoNDSCol);

        if (isPrice = false) or (isKolCol = false) or (isKodCol = false) then
         begin
           raise Exception.Create(' В файле: '+od_InputNaklPWithExcel.FileName+ #10#13+
                                  'Отсутствуют обязательные наименования столбцов: '+ #10#13 +ListFieldError+
                                  'Проверте нахождение этих столбцов в файле, или приведите в соответствие таблицу настройки!');
         end;
      end;

     ListFieldName.First;

     FindStr := '';

// Цикл по получению данных для номера первой строки и номеров столбцов столбцов
     while not ListFieldName.Eof do
      begin
        if ListFieldName.FieldByName('Name').Value = 'Код товара' then
         begin
           if isKodCol then
            begin
              FindStr := ListFieldName.FieldByName('Column_Name_Post').Value;
              FindCell := ExURng.Find(What:=FindStr, LookIn:=xlValues, LookAt:=xlWhole, MatchCase:=False);
              Row := FindCell.Row +1;
              KodCol := FindCell.Column;
            end;
         end;

        if ListFieldName.FieldByName('Name').Value = 'Наименование товара' then
         begin
           if isNameCol then
            begin
              FindStr := ListFieldName.FieldByName('Column_Name_Post').Value;
              FindCell := ExURng.Find(What:=FindStr, LookIn:=xlValues, LookAt:=xlWhole, MatchCase:=False);
              Row := FindCell.Row +1;
              NameCol := FindCell.Column;
            end;
         end;

        if ListFieldName.FieldByName('Name').Value = 'Количество' then
         begin
           if isKolCol then
            begin
              FindStr := ListFieldName.FieldByName('Column_Name_Post').Value;
              FindCell := ExURng.Find(What:=FindStr, LookIn:=xlValues, LookAt:=xlWhole, MatchCase:=False);
              Row := FindCell.Row +1;
              KolCol := FindCell.Column;
            end;
         end;

        if ListFieldName.FieldByName('Name').Value = 'Цена без НДС' then
         begin
           if isPriceNoNDSCol then
            begin
              FindStr := ListFieldName.FieldByName('Column_Name_Post').Value;
              FindCell := ExURng.Find(What:=FindStr, LookIn:=xlValues, LookAt:=xlWhole, MatchCase:=False);
              Row := FindCell.Row +1;
              PriceNoNDSCol := FindCell.Column;
              StavNds := 1.2;
            end;
         end;

        if ListFieldName.FieldByName('Name').Value = 'Цена с НДС' then
         begin
           if isPriceNDSCol then
            begin
              FindStr := ListFieldName.FieldByName('Column_Name_Post').Value;
              FindCell := ExURng.Find(What:=FindStr, LookIn:=xlValues, LookAt:=xlWhole, MatchCase:=False);
              Row := FindCell.Row +1;
              PriceNDSCol := FindCell.Column;
              StavNds := 1;
            end;
         end;

        if ListFieldName.FieldByName('Name').Value = 'Дата производства' then
         begin
           if isDateOfManufacture then
            begin
              FindStr := ListFieldName.FieldByName('Column_Name_Post').Value;
              FindCell := ExURng.Find(What:=FindStr, LookIn:=xlValues, LookAt:=xlWhole, MatchCase:=False);
              Row := FindCell.Row +1;
              DateOfManufactureCol := FindCell.Column;
            end;
         end;

//        showmessage('Row -'+inttostr(Row)+' '+'KodCol -'+inttostr(KodCol)+' '+'NameCol -'+inttostr(NameCol)+' '+'KolCol -'+inttostr(KolCol)+' '+'PriceNDSCol -'+inttostr(PriceNDSCol)+' '+'PriceNoNDSCol -'+inttostr(PriceNoNDSCol) );

        ListFieldName.Next;
      end;

     if quNaklP.State in [dsInsert, dsEdit] then quNaklP.Post;

     for index := Row to i do
      begin
        if (WorkSheet.Cells[index,KodCol].Text <> '') then
         begin
           DecimalSeparator := '.';

           QtyS := StringReplace(WorkSheet.Cells[index,KolCol].Text, '''', '',[rfReplaceAll, rfIgnoreCase]);
           QtyS := StringReplace(WorkSheet.Cells[index,KolCol].Text, ' ', '',[rfReplaceAll, rfIgnoreCase]);
           QtyS := StringReplace(QtyS, ',', '.',[rfReplaceAll, rfIgnoreCase]);
           Qty := StrToFloat(QtyS);

           PrepareTovarNo := TMSQuery.Create(nil);
           PrepareTovarNo.Connection:= dmDataModule.DB;
           PrepareTovarNo.SQL.Clear;
           PrepareTovarNo.SQL.Text := 'declare @PostNo int '
                                     +' set @PostNo = :PostNo '
                                     +'select   PostNo '
                                     +'       , TovarNo '
                                     +'  	    , NameTovar '
                                     +' from TovarPost '
                                     +'  where PostNo = :PostNo '
                                     +'    and TovarNoPostText = :TovarNoPost ';
           PrepareTovarNo.ParamByName('PostNo').Value := PostNo;
           PrepareTovarNo.ParamByName('TovarNoPost').Value := WorkSheet.Cells[index,KodCol].Text;
           PrepareTovarNo.Open;

           if PrepareTovarNo.RecordCount = 0 then begin
                                                    bbImportNaklP.Enabled := False;
                                                    bbOK.Enabled := False;
                                                    ActiveControl := paBottom;
                                                    raise Exception.Create(' По этому контрагентуагенту нет привязки соответствия товара! '+ #10#13 +
                                                                           'Товар : '+ WorkSheet.Cells[index,KodCol].Text +' '+ WorkSheet.Cells[index,NameCol].Text + #10#13 +
                                                                           'Заполните таблицу и повторите попытку.');
                                                  end;

           if StavNds = 1 then
            begin
              PriceS := StringReplace(WorkSheet.Cells[index,PriceNDSCol].Text, '''', '',[rfReplaceAll, rfIgnoreCase]);
              PriceS := StringReplace(WorkSheet.Cells[index,PriceNDSCol].Text, ' ', '',[rfReplaceAll, rfIgnoreCase]);
              PriceS := StringReplace(PriceS, ',', '.',[rfReplaceAll, rfIgnoreCase]);
              Price := StrToFloat(PriceS);
              Price := Price * StavNds;
            end
           else
            begin
              PriceS := StringReplace(WorkSheet.Cells[index,PriceNoNDSCol].Text, '''', '',[rfReplaceAll, rfIgnoreCase]);
              PriceS := StringReplace(WorkSheet.Cells[index,PriceNoNDSCol].Text, ' ', '',[rfReplaceAll, rfIgnoreCase]);
              PriceS := StringReplace(PriceS, ',', '.',[rfReplaceAll, rfIgnoreCase]);
              Price := StrToFloat(PriceS);
              Price := Price * StavNds;
            end;

           begin
             is_Post := True;
             quPriceInInst:=TMSQuery.Create(nil);
             quPriceInInst.Connection:=dmDataModule.DB;
             quPriceInInst.SQL.Clear;
             quPriceInInst.SQL.Text:= 'select isnull(PriceInInst,0) as PriceInInst from PriceForVeb where TovarNo = :TovarNo';
             quPriceInInst.ParamByName('TovarNo').Value := PrepareTovarNo.FieldByName('TovarNo').AsInteger;
             quPriceInInst.Open;

             a:=  quPriceInInst.FieldByName('PriceInInst').AsFloat - DeltaPriceInInst;
             b:=  quPriceInInst.FieldByName('PriceInInst').AsFloat + DeltaPriceInInst;
             c:=  Price;

             PriceInInst:= quPriceInInst.FieldByName('PriceInInst').AsFloat;

             if ((a <= c) and (c <= b)) then Delta := True
                                        else Delta := False;

             if Delta = False
              then begin
                     l_str := 'Цена '+floattostr(Price)+ 'не входит в допустимый интервал цены.' + #10#13 +
                              'Допустимый интервал: с ' + floattostr(quPriceInInst.FieldByName('PriceInInst').AsFloat - DeltaPriceInInst) +
                              ' по ' + floattostr(quPriceInInst.FieldByName('PriceInInst').AsFloat + DeltaPriceInInst) + #10#13 +
                              'Продолжить (Да) отменить (Нет)?';
                     if Application.MessageBox(PChar(l_str), 'Внимание!', MB_YESNO) = IDYES then begin
                                                                                                   quInsInD_Control_PriceInInst:=TMSQuery.Create(nil);
                                                                                                   quInsInD_Control_PriceInInst.Connection:=dmDataModule.DB;
                                                                                                   quInsInD_Control_PriceInInst.SQL.Clear;
                                                                                                   quInsInD_Control_PriceInInst.SQL.Text:= 'insert into D_Control_PriceInInst (UserNo,TovarNo,PriceInInst,Price_ECO,Date,PostNo,HostName,Dhead_id)'
                                                                                                                                          +'values (:UserNo,:TovarNo,:PriceInInst,:Price_ECO,GetDate(),:PostNo,HOST_NAME(),:Dhead_id)';
                                                                                                   quInsInD_Control_PriceInInst.ParamByName('UserNo').Value := Data.UserNo;
                                                                                                   quInsInD_Control_PriceInInst.ParamByName('TovarNo').Value := PrepareTovarNo.FieldByName('TovarNo').AsInteger;
                                                                                                   quInsInD_Control_PriceInInst.ParamByName('PriceInInst').Value := quPriceInInst.FieldByName('PriceInInst').AsFloat;
                                                                                                   quInsInD_Control_PriceInInst.ParamByName('Price_ECO').Value := c;
                                                                                                   quInsInD_Control_PriceInInst.ParamByName('PostNo').Value := PostNo;
                                                                                                   quInsInD_Control_PriceInInst.ParamByName('Dhead_id').Value := dhead_id;
                                                                                                   quInsInD_Control_PriceInInst.Execute;
                                                                                                   is_Post := True;
                                                                                                 end
                                                                                            else begin
                                                                                                   dmDataModule.ExecSQL('delete dspec where dhead_id = :p1_dhead_id',[dhead_id]);
                                                                                                   quNaklP.Cancel;
                                                                                                   is_Post := False;
                                                                                                   ShowMessage('Отменено пользователем');
                                                                                                 end;

                   end;

             quPriceInInst.Close;
           end;

           if (dsPrihod.DataSet.State = dsInactive) then dsPrihod.DataSet.Open;

           if isDateOfManufacture then DateOfManufacture := StrToDateTime(WorkSheet.Cells[index,DateOfManufactureCol].Text);

           TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.Append;

           TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.FieldByName('article_id').AsInteger := PrepareTovarNo.FieldByName('TovarNo').AsInteger;
           TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.FieldByName('qty').AsFloat := Qty;
           TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.FieldByName('Price_eco').AsFloat := Price;
           TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.FieldByName('article_name').AsString := WorkSheet.Cells[index,NameCol].Text;
           TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.FieldByName('Dhead_ID').Value := dhead_id;

           if isDateOfManufacture then TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.FieldByName('DateOfManufacture').Value := DateOfManufacture;

           if is_Post = True then begin
                                    TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.Post;
                                  end
                             else TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.Cancel;

           PrepareTovarNo.Close;
         end
                                                 else begin
                                                        Break;
                                                      end;
      end;
   end;

   Excel.Quit;
   Excel := UnAssigned;
   Excel := Null;

  ShowMessage('Создана приходная накладная Код: '+quNaklPNaklNo.AsString+' Номер: '+ quNaklPNom.AsString);
  bbImportNaklP.Enabled := False;
end;

end.

