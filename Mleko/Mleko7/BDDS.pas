unit BDDS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, citCtrls, citmask, citDBComboEdit, ExtCtrls, ActnList,
  CFLMLKCustom, DB, GridsEh, DBGridEh, MemDS, DBAccess, MSAccess, StdCtrls,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, DBCtrls, EhLibBDE, Mask, DBCtrlsEh, DBLookupEh, DBGridEhImpExp;

type
  TBDDSForm = class(TCFLMLKCustomForm)
    Panel1: TPanel;
    Panel2: TPanel;
    p_bank_invoice_id: TcitDBComboEdit;
    quBankInvoice: TMSQuery;
    quBankInvoiceId: TIntegerField;
    quBankInvoiceInvoice_num: TFloatField;
    quBankInvoiceInvoice_Name: TStringField;
    quBankInvoiceDescription: TStringField;
    GroupBoxDates: TGroupBox;
    gBPeriod: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EdDateBeg: TcxDateEdit;
    EdDateEnd: TcxDateEdit;
    GroupBox1: TGroupBox;
    EdCurrentDate: TcxDateEdit;
    cbListMinusPostForBDDS: TCheckBox;
    GroupBox2: TGroupBox;
    cbKassa: TCheckBox;
    cbBank: TCheckBox;
    dsSaldo: TMSDataSource;
    quSaldo: TMSQuery;
    DBTextSaldo: TDBText;
    quSaldoSaldo: TFloatField;
    Label3: TLabel;
    Panel3: TPanel;
    DBGridEh1: TDBGridEh;
    dsDataQuery1: TMSDataSource;
    quDataQuery: TMSQuery;
    dsInvoice: TMSDataSource;
    quInvoice: TMSQuery;
    quDataQueryDayPayment: TDateTimeField;
    quDataQueryPostName: TStringField;
    quDataQueryDateNakl: TDateTimeField;
    quDataQueryDay_Delay: TIntegerField;
    quDataQueryDay_Delay_Ext: TIntegerField;
    quDataQueryGeneral_Day_Dalay: TIntegerField;
    quDataQuerySumma: TFloatField;
    quDataQuerySummaDolg: TFloatField;
    quDataQueryBuhType: TStringField;
    quDataQueryTransferDey: TIntegerField;
    quDataQueryInvoice_Id: TIntegerField;
    quInvoiceid: TIntegerField;
    quInvoiceInvoice: TStringField;
    quDataQueryInvoive: TStringField;
    quDataQuerypkey: TLargeintField;
    quDataQuerySummaPrihoda: TFloatField;
    Label4: TLabel;
    DBTextEndSaldo: TDBText;
    quSaldoEndSaldo: TFloatField;
    cbNaklR: TCheckBox;
    cbPlatRAndPlatR: TCheckBox;
    cbBDDS: TCheckBox;
    quDataQueryVidRashod: TStringField;
    quDataQueryEntity_Type: TStringField;
    quDataQueryPlatName: TStringField;
    cbSummaDolg: TCheckBox;
    Button1: TButton;
    quDataQuerySpravka: TStringField;
    quFilter: TMSQuery;
    dsFilter: TMSDataSource;
    quFilterPostName: TStringField;
    Label5: TLabel;
    quDataQueryAmountPrih_Rash: TFloatField;
    Button2: TButton;
    Button3: TButton;
    sdExportBDDSInExel: TSaveDialog;
    DBLookupComboboxEhFilter: TDBLookupComboboxEh;
    quDataQueryCurrencyHead: TStringField;
    procedure cbListMinusPostForBDDSClick(Sender: TObject);
    procedure p_bank_invoice_idSelectOk(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdDateBegPropertiesChange(Sender: TObject);
    procedure EdDateEndPropertiesChange(Sender: TObject);
    procedure GroupBox2Exit(Sender: TObject);
    procedure cbListMinusPostForBDDSExit(Sender: TObject);
    procedure cbKassaClick(Sender: TObject);
    procedure cbBankClick(Sender: TObject);
    procedure p_bank_invoice_idExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure quDataQueryAfterPost(DataSet: TDataSet);
    procedure dsDataQuery1UpdateData(Sender: TObject);
    procedure cbNaklRClick(Sender: TObject);
    procedure cbPlatRAndPlatRClick(Sender: TObject);
    procedure cbBDDSClick(Sender: TObject);
    procedure cbSummaDolgClick(Sender: TObject);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure Button1Click(Sender: TObject);
    procedure DBGridEh1ApplyFilter(Sender: TObject);
    procedure quDataQueryFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure DBLookupComboboxEhFilterChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
   private
    procedure SetColumnAmountOfLine;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  BDDSForm: TBDDSForm;
  IsRecalcAmountOfLine : boolean;

implementation

uses data, ListMinusPostForBDDS, UtilsCommon, CFLMLKCustomRep, main;

{$R *.dfm}

procedure TBDDSForm.FormShow(Sender: TObject);
var   Nom: string;
begin
  inherited;
  IsRecalcAmountOfLine := false;
  quBankInvoice.Open;
  quInvoice.Open;

  quDataQuery.Close;
  quDataQuery.ParamByName('IsPost').AsBoolean := cbListMinusPostForBDDS.Checked;
  quDataQuery.ParamByName('IsEnableNaklP').AsBoolean := cbNaklR.Checked;
  quDataQuery.ParamByName('IsEnablePlatPAndPlatR').AsBoolean := cbPlatRAndPlatR.Checked;
  quDataQuery.ParamByName('IsEnableBDDS').AsBoolean := cbBDDS.Checked;
  quDataQuery.ParamByName('IsSummaDolga').AsBoolean := cbSummaDolg.Checked;
  quDataQuery.Open;
  quDataQuery.Refresh;

  quSaldo.Close;
  quSaldo.ParamByName('IsPost').AsBoolean := cbListMinusPostForBDDS.Checked;
  quSaldo.ParamByName('IsEnableNaklP').AsBoolean := cbNaklR.Checked;
  quSaldo.ParamByName('IsEnablePlatPAndPlatR').AsBoolean := cbPlatRAndPlatR.Checked;
  quSaldo.ParamByName('IsEnableBDDS').AsBoolean := cbBDDS.Checked;
  quSaldo.ParamByName('IsSummaDolga').AsBoolean := cbSummaDolg.Checked;
  quSaldo.Open;
  quSaldo.Refresh;

  quFilter.Close;
  quFilter.ParamByName('IsPost').AsBoolean := cbListMinusPostForBDDS.Checked;
  quFilter.ParamByName('IsEnableNaklP').AsBoolean := cbNaklR.Checked;
  quFilter.ParamByName('IsEnablePlatPAndPlatR').AsBoolean := cbPlatRAndPlatR.Checked;
  quFilter.ParamByName('IsEnableBDDS').AsBoolean := cbBDDS.Checked;
  quFilter.ParamByName('IsSummaDolga').AsBoolean := cbSummaDolg.Checked;
  quFilter.Open;
  quFilter.Refresh;

  EdDateBeg.Date := Date();
  EdDateend.Date := Date();
end;

procedure TBDDSForm.SetColumnAmountOfLine;
var
  i: integer;                                     
  AmountPrih_RashPrev : Double;
begin

  if quSaldoSaldo.Value = 0 then raise Exception.Create(' Пересчет запрещен! '+#13#10+
                                                        'Не выбран ни один тип ДДС ');

  if quSaldoSaldo.Value <> 0 then IsRecalcAmountOfLine := true;
  quDataQuery.First;
  AmountPrih_RashPrev := quSaldoSaldo.Value;


  while not quDataQuery.Eof do
    begin
      quDataQuery.Edit;

      quDataQueryAmountPrih_Rash.Value := quDataQueryAmountPrih_Rash.Value + AmountPrih_RashPrev;

      AmountPrih_RashPrev := quDataQueryAmountPrih_Rash.Value;

      quDataQuery.Post;

      quDataQuery.Next;
    end;
  IsRecalcAmountOfLine := false;
end;

procedure TBDDSForm.cbListMinusPostForBDDSClick(Sender: TObject);
begin
  inherited;
  if cbListMinusPostForBDDS.Checked then begin
{
                                           with TListMinusPostForBDDSForm.Create(Application) do
                                            try
                                             quListMinusPostForBDDS.Open;
                                             ShowModal;
                                            finally
                                             quListMinusPostForBDDS.Close;
                                             Free;
                                            end;
}
                                           quSaldo.Close;
                                           quSaldo.ParamByName('IsPost').AsBoolean := cbListMinusPostForBDDS.Checked;
                                           quSaldo.Open;
                                           quSaldo.Refresh;

                                           quDataQuery.Close;
                                           quDataQuery.ParamByName('IsPost').AsBoolean := cbListMinusPostForBDDS.Checked;
                                           quDataQuery.Open;
                                           quDataQuery.Refresh;

                                           quFilter.Close;
                                           quFilter.ParamByName('IsPost').AsBoolean := cbListMinusPostForBDDS.Checked;
                                           quFilter.Open;
                                           quFilter.Refresh;
                                         end
                                    else begin
                                           quSaldo.Close;
                                           quSaldo.ParamByName('IsPost').Clear;
                                           quSaldo.Open;
                                           quSaldo.Refresh;

                                           quDataQuery.Close;
                                           quDataQuery.ParamByName('IsPost').Clear;
                                           quDataQuery.Open;
                                           quDataQuery.Refresh;

                                           quFilter.Close;
                                           quFilter.ParamByName('IsPost').Clear;
                                           quFilter.Open;
                                           quFilter.Refresh;
                                         end
end;

procedure TBDDSForm.p_bank_invoice_idSelectOk(Sender: TObject);
begin
  inherited;
  quSaldo.Close;
  quSaldo.ParamByName('Id').AsInteger := quBankInvoiceId.AsInteger;
  if quBankInvoiceId.IsNull then quSaldo.ParamByName('Id').Clear;
  quSaldo.Open;
  quSaldo.Refresh;

  quDataQuery.Close;
  quDataQuery.ParamByName('Id').Value := quBankInvoiceId.AsInteger;
  quDataQuery.Open;
  quDataQuery.Refresh;

  quFilter.Close;
  quFilter.ParamByName('Id').Value := quBankInvoiceId.AsInteger;
  quFilter.Open;
  quFilter.Refresh;

  if p_bank_invoice_id.Text = '' then begin
                                        quDataQuery.Close;
                                        quDataQuery.ParamByName('Id').Clear;
                                        quDataQuery.Open;
                                        quDataQuery.Refresh;

                                        quFilter.Close;
                                        quFilter.ParamByName('Id').Clear;
                                        quFilter.Open;
                                        quFilter.Refresh;
                                      end
end;

procedure TBDDSForm.EdDateBegPropertiesChange(Sender: TObject);
begin
  inherited;
  quSaldo.Close;
  quSaldo.ParamByName('DateBeg').AsDateTime := EdDateBeg.Date;
  quSaldo.Open;
  quSaldo.Refresh;

  quDataQuery.Close;
  quDataQuery.ParamByName('DateBeg').AsDateTime := EdDateBeg.Date;
  quDataQuery.Open;
  quDataQuery.Refresh;

  quFilter.Close;
  quFilter.ParamByName('DateBeg').AsDateTime := EdDateBeg.Date;
  quFilter.Open;
  quFilter.Refresh;

end;

procedure TBDDSForm.EdDateEndPropertiesChange(Sender: TObject);
begin
  inherited;
  quSaldo.Close;
  quSaldo.ParamByName('DateEnd').AsDateTime := EdDateEnd.Date;
  quSaldo.Open;
  quSaldo.Refresh;

  quDataQuery.Close;
  quDataQuery.ParamByName('DateEnd').AsDateTime := EdDateEnd.Date;
  quDataQuery.Open;
  quDataQuery.Refresh;

  quFilter.Close;
  quFilter.ParamByName('DateEnd').AsDateTime := EdDateEnd.Date;
  quFilter.Open;
  quFilter.Refresh;
end;

procedure TBDDSForm.GroupBox2Exit(Sender: TObject);
begin
  inherited;
{
  quDataQuery.Close;
  if ((cbKassa.Checked) and (not cbBank.Checked)) then begin
                                                         quDataQuery.MacroByName('_where').value := 'and np.Buh in (1,3) ';
                                                       end;
  if ((not cbKassa.Checked) and (cbBank.Checked)) then begin
                                                         quDataQuery.MacroByName('_where').value := 'and np.Buh = 2 ';
                                                       end;
  if ((cbKassa.Checked) and (cbBank.Checked)) then begin
                                                     quDataQuery.MacroByName('_where').value := 'and np.Buh in (1,2,3) ';
                                                   end;
  if ((not cbKassa.Checked) and (not cbBank.Checked)) then begin
                                                             quDataQuery.MacroByName('_where'').value := '';
                                                           end;
  quDataQuery.Open;
  quDataQuery.Refresh;
}
end;

procedure TBDDSForm.cbListMinusPostForBDDSExit(Sender: TObject);
begin
  inherited;
{
  quDataQuery.Close;
  quDataQuery.ParamByName('IsPost').AsBoolean := cbListMinusPostForBDDS.Checked;
  quDataQuery.Open;
  quDataQuery.Refresh;
}
end;

procedure TBDDSForm.cbKassaClick(Sender: TObject);
begin
  inherited;
  quSaldo.Close;
  quSaldo.ParamByName('IsKassa').AsBoolean := cbKassa.Checked;
  quSaldo.Open;
  quSaldo.Refresh;

  quDataQuery.Close;
  if ((cbKassa.Checked) and (not cbBank.Checked)) then begin
//                                                         quDataQuery.MacroByName('_where').value := 'and np.Buh in (1,3) ';
                                                         quDataQuery.Close;
                                                         quDataQuery.ParamByName('IsKassa').Value := 1;
                                                         quDataQuery.ParamByName('IsBank').Clear;
                                                         quDataQuery.Open;
                                                         quDataQuery.Refresh;

                                                         quFilter.Close;
                                                         quFilter.ParamByName('IsKassa').Value := 1;
                                                         quFilter.ParamByName('IsBank').Clear;
                                                         quFilter.Open;
                                                         quFilter.Refresh;
                                                       end;
  if ((not cbKassa.Checked) and (cbBank.Checked)) then begin
                                                         quDataQuery.Close;
                                                         quDataQuery.ParamByName('IsKassa').Clear;
                                                         quDataQuery.ParamByName('IsBank').Value := 1;
                                                         quDataQuery.Open;
                                                         quDataQuery.Refresh;

                                                         quFilter.Close;
                                                         quFilter.ParamByName('IsKassa').Clear;
                                                         quFilter.ParamByName('IsBank').Value := 1;
                                                         quFilter.Open;
                                                         quFilter.Refresh;
//                                                         quDataQuery.MacroByName('_where').value := 'and np.Buh = 2 ';
                                                       end;
  if ((cbKassa.Checked) and (cbBank.Checked)) then begin
                                                     quDataQuery.Close;
                                                     quDataQuery.ParamByName('IsKassa').Value := 1;
                                                     quDataQuery.ParamByName('IsBank').Value := 1;
                                                     quDataQuery.Open;
                                                     quDataQuery.Refresh;

                                                     quFilter.Close;
                                                     quFilter.ParamByName('IsKassa').Value := 1;
                                                     quFilter.ParamByName('IsBank').Value := 1;
                                                     quFilter.Open;
                                                     quFilter.Refresh;
//                                                     quDataQuery.MacroByName('_where').value := 'and np.Buh in (1,2,3) ';
                                                   end;
  if ((not cbKassa.Checked) and (not cbBank.Checked)) then begin
                                                             quDataQuery.Close;
                                                             quDataQuery.ParamByName('IsKassa').Clear;
                                                             quDataQuery.ParamByName('IsBank').Clear;
                                                             quDataQuery.Open;
                                                             quDataQuery.Refresh;

                                                             quFilter.Close;
                                                             quFilter.ParamByName('IsKassa').Clear;
                                                             quFilter.ParamByName('IsBank').Clear;
                                                             quFilter.Open;
                                                             quFilter.Refresh;
//                                                             quDataQuery.MacroByName('_where').value := '';
                                                           end;
  quDataQuery.Open;
  quDataQuery.Refresh;

end;

procedure TBDDSForm.cbBankClick(Sender: TObject);
begin
  inherited;
  quSaldo.Close;
  quSaldo.ParamByName('IsBank').AsBoolean := cbBank.Checked;
  quSaldo.Open;
  quSaldo.Refresh;

  quDataQuery.Close;
  if ((cbKassa.Checked) and (not cbBank.Checked)) then begin
//                                                         quDataQuery.MacroByName('_where').value := 'and np.Buh in (1,3) ';
                                                         quDataQuery.Close;
                                                         quDataQuery.ParamByName('IsKassa').Value := 1;
                                                         quDataQuery.ParamByName('IsBank').Clear;
                                                         quDataQuery.Open;
                                                         quDataQuery.Refresh;

                                                         quFilter.Close;
                                                         quFilter.ParamByName('IsKassa').Value := 1;
                                                         quFilter.ParamByName('IsBank').Clear;
                                                         quFilter.Open;
                                                         quFilter.Refresh;
                                                       end;
  if ((not cbKassa.Checked) and (cbBank.Checked)) then begin
                                                         quDataQuery.Close;
                                                         quDataQuery.ParamByName('IsKassa').Clear;
                                                         quDataQuery.ParamByName('IsBank').Value := 1;
                                                         quDataQuery.Open;
                                                         quDataQuery.Refresh;

                                                         quFilter.Close;
                                                         quFilter.ParamByName('IsKassa').Clear;
                                                         quFilter.ParamByName('IsBank').Value := 1;
                                                         quFilter.Open;
                                                         quFilter.Refresh;
//                                                         quDataQuery.MacroByName('_where').value := 'and np.Buh = 2 ';
                                                       end;
  if ((cbKassa.Checked) and (cbBank.Checked)) then begin
                                                     quDataQuery.Close;
                                                     quDataQuery.ParamByName('IsKassa').Value := 1;
                                                     quDataQuery.ParamByName('IsBank').Value := 1;
                                                     quDataQuery.Open;
                                                     quDataQuery.Refresh;

                                                     quFilter.Close;
                                                     quFilter.ParamByName('IsKassa').Value := 1;
                                                     quFilter.ParamByName('IsBank').Value := 1;
                                                     quFilter.Open;
                                                     quFilter.Refresh;
//                                                     quDataQuery.MacroByName('_where').value := 'and np.Buh in (1,2,3) ';
                                                   end;
  if ((not cbKassa.Checked) and (not cbBank.Checked)) then begin
                                                             quDataQuery.Close;
                                                             quDataQuery.ParamByName('IsKassa').Clear;
                                                             quDataQuery.ParamByName('IsBank').Clear;
                                                             quDataQuery.Open;
                                                             quDataQuery.Refresh;

                                                             quFilter.Close;
                                                             quFilter.ParamByName('IsKassa').Clear;
                                                             quFilter.ParamByName('IsBank').Clear;
                                                             quFilter.Open;
                                                             quFilter.Refresh;
//                                                             quDataQuery.MacroByName('_where').value := '';
                                                           end;
  quDataQuery.Open;
  quDataQuery.Refresh;
end;

procedure TBDDSForm.p_bank_invoice_idExit(Sender: TObject);
begin
  inherited;
  if p_bank_invoice_id.Text = '' then begin
                                        quSaldo.Close;
                                        quSaldo.ParamByName('Id').Clear;
                                        quSaldo.Open;
                                        quSaldo.Refresh;

                                        quDataQuery.Close;
                                        quDataQuery.ParamByName('Id').Clear;
                                        quDataQuery.Open;
                                        quDataQuery.Refresh;

                                        quFilter.Close;
                                        quFilter.ParamByName('Id').Clear;
                                        quFilter.Open;
                                        quFilter.Refresh;
                                      end;
end;

procedure TBDDSForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  quBankInvoice.Close;
  quInvoice.Close;
  quFilter.Close;
  quDataQuery.Close;
  quSaldo.Close;
end;

procedure TBDDSForm.quDataQueryAfterPost(DataSet: TDataSet);
begin
  inherited;
  if IsRecalcAmountOfLine = false then begin
                                         quDataQuery.Refresh;
                                         quSaldo.Refresh;
                                         quFilter.Refresh;
                                       end;
end;


procedure TBDDSForm.dsDataQuery1UpdateData(Sender: TObject);
begin
  inherited;
  if (quDataQuerypkey.Value = 0)
{  and (IsRecalcAmountOfLine = false))} then quDataQuery.Cancel;
end;


procedure TBDDSForm.cbNaklRClick(Sender: TObject);
begin
  inherited;
  quSaldo.Close;
  quSaldo.ParamByName('IsEnableNaklP').AsBoolean := cbNaklR.Checked;
  quSaldo.Open;
  quSaldo.Refresh;

  quDataQuery.Close;
  quDataQuery.ParamByName('IsEnableNaklP').AsBoolean := cbNaklR.Checked;
  quDataQuery.Open;
  quDataQuery.Refresh;

  quFilter.Close;
  quFilter.ParamByName('IsEnableNaklP').AsBoolean := cbNaklR.Checked;
  quFilter.Open;
  quFilter.Refresh;
end;

procedure TBDDSForm.cbPlatRAndPlatRClick(Sender: TObject);
begin
  inherited;
  quSaldo.Close;
  quSaldo.ParamByName('IsEnablePlatPAndPlatR').AsBoolean := cbPlatRAndPlatR.Checked;
  quSaldo.Open;
  quSaldo.Refresh;

  quDataQuery.Close;
  quDataQuery.ParamByName('IsEnablePlatPAndPlatR').AsBoolean := cbPlatRAndPlatR.Checked;
  quDataQuery.Open;
  quDataQuery.Refresh;

  quFilter.Close;
  quFilter.ParamByName('IsEnablePlatPAndPlatR').AsBoolean := cbPlatRAndPlatR.Checked;
  quFilter.Open;
  quFilter.Refresh;
end;

procedure TBDDSForm.cbBDDSClick(Sender: TObject);
begin
  inherited;
  quSaldo.Close;
  quSaldo.ParamByName('IsEnableBDDS').AsBoolean := cbBDDS.Checked;
  quSaldo.Open;
  quSaldo.Refresh;

  quDataQuery.Close;
  quDataQuery.ParamByName('IsEnableBDDS').AsBoolean := cbBDDS.Checked;
  quDataQuery.Open;
  quDataQuery.Refresh;

  quFilter.Close;
  quFilter.ParamByName('IsEnableBDDS').AsBoolean := cbBDDS.Checked;
  quFilter.Open;
  quFilter.Refresh;
end;

procedure TBDDSForm.cbSummaDolgClick(Sender: TObject);
begin
  inherited;
  quSaldo.Close;
  quSaldo.ParamByName('IsSummaDolga').AsBoolean := cbSummaDolg.Checked;
  quSaldo.Open;
  quSaldo.Refresh;

  quDataQuery.Close;
  quDataQuery.ParamByName('IsSummaDolga').AsBoolean := cbSummaDolg.Checked;
  quDataQuery.Open;
  quDataQuery.Refresh;

  quFilter.Close;
  quFilter.ParamByName('IsSummaDolga').AsBoolean := cbSummaDolg.Checked;
  quFilter.Open;
  quFilter.Refresh;
end;

procedure TBDDSForm.DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  inherited;
  quDataQuery.Close;
  case ACol of
    0: quDataQuery.MacroByName('_order').Value := 'DayPayment';
    1: quDataQuery.MacroByName('_order').Value := 'PostName';
    6: quDataQuery.MacroByName('_order').Value := 'Summa';
    7: quDataQuery.MacroByName('_order').Value := 'SummaDolg';
    8: quDataQuery.MacroByName('_order').Value := 'SummaPrihoda';
  end;
  quDataQuery.Open;
end;

procedure TBDDSForm.Button1Click(Sender: TObject);
var
  params: TParams;
  IsEnablePlatPAndPlatR, IsEnableNaklP, IsEnableBDDS, IsSummaDolga: boolean;
  IsKassa, IsBank, IsPost: boolean;
begin
  inherited;
  Params := TParams.Create;

  IsEnablePlatPAndPlatR := cbPlatRAndPlatR.Checked;
  IsEnableNaklP := cbNaklR.Checked;
  IsEnableBDDS := cbBDDS.Checked;
  IsSummaDolga := cbSummaDolg.Checked;
  IsKassa := cbKassa.Checked;
  IsBank := cbBank.Checked;
  IsPost := cbListMinusPostForBDDS.Checked;

  UtilsCommon.SetParamValue(Params, 'DateBeg', EdDateBeg.Date);
  UtilsCommon.SetParamValue(Params, 'DateEnd', EdDateEnd.Date);
  UtilsCommon.SetParamValue(Params, 'IsPost', IsPost);
  UtilsCommon.SetParamValue(Params, 'IsEnableNaklP', IsEnableNaklP);
  UtilsCommon.SetParamValue(Params, 'IsEnablePlatPAndPlatR', IsEnablePlatPAndPlatR);
  UtilsCommon.SetParamValue(Params, 'IsEnableBDDS', IsEnableBDDS);
  UtilsCommon.SetParamValue(Params, 'IsSummaDolga', IsSummaDolga);
  UtilsCommon.SetParamValue(Params, 'IsKassa', IsKassa);
  UtilsCommon.SetParamValue(Params, 'IsBank', IsBank);
  UtilsCommon.SetParamValue(Params, 'Id', quBankInvoiceId.AsInteger);
  TCFLMLKCustomRepDlg.ShowRep(117, Params);
end;

procedure TBDDSForm.DBGridEh1ApplyFilter(Sender: TObject);
begin
  inherited;
  ShowMessage(quDataQuery.Filter);
  ShowMessage(quDataQueryPostName.Value);
  ShowMessage(quFilterPostName.Value);

//  DBGridEh1.Columns.

//  quDataQuery.Filter


//  DBGridEh1.Style.FilterEditCloseUpApplyFilter := true;
//  DBGridEh1.DataSource.;
//  DBGridEhDefaultStyle.FilterEditCloseUpApplyFilter := True;
end;
procedure TBDDSForm.quDataQueryFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  //ShowMessage(quFilterPostName.Value);
end;



procedure TBDDSForm.DBLookupComboboxEhFilterChange(Sender: TObject);
begin
  inherited;
  if DBLookupComboboxEhFilter.Text = '' then begin
                                               quDataQuery.Close;
                                               quDataQuery.MacroByName('_where').Value := '';
                                               quDataQuery.Open;
                                             end
                                        else begin
                                               quDataQuery.Close;
                                               quDataQuery.MacroByName('_where').Value := ' and PostName = '+''''+DBLookupComboboxEhFilter.Text+'''';
                                               quDataQuery.Open;
                                             end;
end;

procedure TBDDSForm.Button2Click(Sender: TObject);
begin
  inherited;
  SetColumnAmountOfLine;
end;

procedure TBDDSForm.Button3Click(Sender: TObject);
begin
  inherited;

  sdExportBDDSInExel.DefaultExt := '.xls';   // Выбираем файл для импорта данных
  sdExportBDDSInExel.Filter := 'Excel (*.xls)|*.xls'; // Устанавливаем фильтер

  if sdExportBDDSInExel.Execute then SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,DBGridEh1,sdExportBDDSInExel.FileName,True);

  if FileExists(sdExportBDDSInExel.FileName) then ShowMessage('Создан файл: '+sdExportBDDSInExel.FileName)
                                             else ShowMessage('Файл '+sdExportBDDSInExel.FileName+' не создан!'+ #10#13 +
                                                              'Обратитесь к системному администратору!');

end;

initialization
DBGridEhDefaultStyle.FilterEditCloseUpApplyFilter := True;
end.

