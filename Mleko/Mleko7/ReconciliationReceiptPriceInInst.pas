unit ReconciliationReceiptPriceInInst;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CFLMLKCustom, ExtCtrls, ActnList, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, StdCtrls,
  citCtrls, citmask, citDBComboEdit, DB, MemDS, DBAccess, MSAccess,
  GridsEh, DBGridEh, DBGridEhImpExp;

type
  TReconciliationReceiptPriceInInstForm = class(TCFLMLKCustomForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    GroupBoxDates: TGroupBox;
    gBPeriod: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EdDateBeg: TcxDateEdit;
    EdDateEnd: TcxDateEdit;
    GroupBox1: TGroupBox;
    EdCurrentDate: TcxDateEdit;
    Flt_Post: TcitDBComboEdit;
    DBGridEh1: TDBGridEh;
    dsl_PriceInInstForNaklP: TMSDataSource;
    qul_PriceInInstForNaklP: TMSQuery;
    qul_PriceInInstForNaklPDOC_DATE: TDateTimeField;
    qul_PriceInInstForNaklPPostname: TStringField;
    qul_PriceInInstForNaklPNameTovar: TStringField;
    qul_PriceInInstForNaklPTovarNo: TSmallintField;
    qul_PriceInInstForNaklPqty: TFloatField;
    qul_PriceInInstForNaklPPriceInInst: TFloatField;
    qul_PriceInInstForNaklPSummaFact: TFloatField;
    qul_PriceInInstForNaklPSummaDelta: TFloatField;
    btRefresh: TButton;
    ExportExel: TButton;
    sdExportReconciliationReceiptPriceInInst: TSaveDialog;
    qul_PriceInInstForNaklPPriceFact: TFloatField;
    qul_PriceInInstForNaklPSummaPriceInInst: TFloatField;
    procedure btRefreshClick(Sender: TObject);
    procedure ExportExelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReconciliationReceiptPriceInInstForm: TReconciliationReceiptPriceInInstForm;

implementation

uses data;

{$R *.dfm}

procedure TReconciliationReceiptPriceInInstForm.btRefreshClick(
  Sender: TObject);
begin
  inherited;
  qul_PriceInInstForNaklP.Close;
  if Flt_Post.Text = '' then begin
                              qul_PriceInInstForNaklP.ParamByName('IsSelectedPostNo').Value := 0;
                             end
                        else begin
                               qul_PriceInInstForNaklP.ParamByName('IsSelectedPostNo').Value := 1;
                               qul_PriceInInstForNaklP.ParamByName('UserNo').Value := Data.UserNo;
                               qul_PriceInInstForNaklP.ParamByName('SPID').Value := dmDataModule.SPID;
                             end;
  qul_PriceInInstForNaklP.ParamByName('DateBeg').Value := EdDateBeg.Date;
  qul_PriceInInstForNaklP.ParamByName('DateEnd').Value := EdDateEnd.Date;
  qul_PriceInInstForNaklP.Open;
end;

procedure TReconciliationReceiptPriceInInstForm.ExportExelClick(
  Sender: TObject);
begin
  inherited;
  sdExportReconciliationReceiptPriceInInst.DefaultExt := '.xls';   // Выбираем файл для импорта данных
  sdExportReconciliationReceiptPriceInInst.Filter := 'Excel (*.xls)|*.xls'; // Устанавливаем фильтер

  if sdExportReconciliationReceiptPriceInInst.Execute then SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,DBGridEh1,sdExportReconciliationReceiptPriceInInst.FileName,True);

  if FileExists(sdExportReconciliationReceiptPriceInInst.FileName) then ShowMessage('Создан файл: '+sdExportReconciliationReceiptPriceInInst.FileName)
                                                                   else ShowMessage('Файл '+sdExportReconciliationReceiptPriceInInst.FileName+' не создан!'+ #10#13 +
                                                                                    'Обратитесь к системному администратору!');
end;

end.
