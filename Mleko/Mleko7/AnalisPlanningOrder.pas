unit AnalisPlanningOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CFLMLKCustom, GridsEh, DBGridEh, DB, MemDS, DBAccess, MSAccess,
  ExtCtrls, ActnList, StdCtrls, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, citCtrls, citmask,
  citDBComboEdit, DBGridEhImpExp;

type
  TAnalisPlanningOrderForm = class(TCFLMLKCustomForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    dsAnalisPlanningOrder: TMSDataSource;
    quAnalisPlanningOrder: TMSQuery;
    DBGridEh1: TDBGridEh;
    EdDatePlanningBeg: TcxDateEdit;
    EdDatePlanningEnd: TcxDateEdit;
    EdDatePlanningEndFact: TcxDateEdit;
    Label3: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    cbIs_Ext_OtdelNo: TCheckBox;
    cbIs_Ext_VidNo: TCheckBox;
    cbIs_Ext_TipNo: TCheckBox;
    cbIs_Ext_TovarNo: TCheckBox;
    cbIs_Ext_SotrudNo: TCheckBox;
    cbIs_Ext_ColnPrice: TCheckBox;
    fltVidTov: TcitDBComboEdit;
    fltOtdel: TcitDBComboEdit;
    fltSotrud: TcitDBComboEdit;
    bRefrehs: TButton;
    cbFactSumCorrection_SummaProdag: TCheckBox;
    quAnalisPlanningOrderOtdelNo: TIntegerField;
    quAnalisPlanningOrderOtdelName: TStringField;
    quAnalisPlanningOrderVidNo: TIntegerField;
    quAnalisPlanningOrderVidName: TStringField;
    quAnalisPlanningOrderTipNo: TIntegerField;
    quAnalisPlanningOrderTipName: TStringField;
    quAnalisPlanningOrderTovarNo: TIntegerField;
    quAnalisPlanningOrderTovarName: TStringField;
    quAnalisPlanningOrderSotrudNo: TIntegerField;
    quAnalisPlanningOrderSotrudName: TStringField;
    quAnalisPlanningOrderSummaPlanProdag: TFloatField;
    quAnalisPlanningOrderSummaProdag: TFloatField;
    quAnalisPlanningOrderPlanPrice: TFloatField;
    quAnalisPlanningOrderColnPrice: TIntegerField;
    quAnalisPlanningOrderColName: TStringField;
    quAnalisPlanningOrderQty: TFloatField;
    quAnalisPlanningOrderSumma: TFloatField;
    quAnalisPlanningOrderPlanKolFact: TFloatField;
    quAnalisPlanningOrderPlanSumFact: TFloatField;
    quAnalisPlanningOrderFactKolCorrection: TFloatField;
    quAnalisPlanningOrderFactSumCorrection: TFloatField;
    quAnalisPlanningOrderSumma_PlanSumFact: TFloatField;
    quAnalisPlanningOrderFactSumCorrection_SummaProdag: TFloatField;
    FltTipTovara: TcitDBComboEdit;
    FltTovar: TcitDBComboEdit;
    quAnalisPlanningOrderPriceInInst: TFloatField;
    quAnalisPlanningOrderSummaPlanProdagInInst: TFloatField;
    Button1: TButton;
    sdExportAnalisInExel: TSaveDialog;
    quAnalisPlanningOrderDatePlanBeg: TDateTimeField;
    procedure cbIs_Ext_OtdelNoClick(Sender: TObject);
    procedure cbIs_Ext_VidNoClick(Sender: TObject);
    procedure cbIs_Ext_TipNoClick(Sender: TObject);
    procedure cbIs_Ext_TovarNoClick(Sender: TObject);
    procedure cbIs_Ext_SotrudNoClick(Sender: TObject);
    procedure cbIs_Ext_ColnPriceClick(Sender: TObject);
    procedure EdDatePlanningBegPropertiesChange(Sender: TObject);
    procedure EdDatePlanningEndPropertiesChange(Sender: TObject);
    procedure EdDatePlanningEndFactPropertiesChange(Sender: TObject);
    procedure fltOtdelSelectOk(Sender: TObject);
    procedure fltSotrudSelectOk(Sender: TObject);
    procedure fltVidTovSelectOk(Sender: TObject);
    procedure bRefrehsClick(Sender: TObject);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    SearchString:string;
  public
    { Public declarations }
  end;

var
  AnalisPlanningOrderForm: TAnalisPlanningOrderForm;

implementation                                                
uses data;

{$R *.dfm}

procedure TAnalisPlanningOrderForm.cbIs_Ext_OtdelNoClick(Sender: TObject);
begin
  inherited;
  quAnalisPlanningOrder.Close;
  quAnalisPlanningOrder.ParamByName('Is_Ext_OtdelNo').Value := cbIs_Ext_OtdelNo.Checked;
  quAnalisPlanningOrder.Open;
end;

procedure TAnalisPlanningOrderForm.cbIs_Ext_VidNoClick(Sender: TObject);
begin
  inherited;
  quAnalisPlanningOrder.Close;
  quAnalisPlanningOrder.ParamByName('Is_Ext_VidNo').Value := cbIs_Ext_VidNo.Checked;
  quAnalisPlanningOrder.Open;
end;

procedure TAnalisPlanningOrderForm.cbIs_Ext_TipNoClick(Sender: TObject);
begin
  inherited;
  quAnalisPlanningOrder.Close;
  quAnalisPlanningOrder.ParamByName('Is_Ext_TipNo').Value := cbIs_Ext_TipNo.Checked;
  quAnalisPlanningOrder.Open;
end;

procedure TAnalisPlanningOrderForm.cbIs_Ext_TovarNoClick(Sender: TObject);
begin
  inherited;
  quAnalisPlanningOrder.Close;
  quAnalisPlanningOrder.ParamByName('Is_Ext_TovarNo').Value := cbIs_Ext_TovarNo.Checked;
  quAnalisPlanningOrder.Open;
end;

procedure TAnalisPlanningOrderForm.cbIs_Ext_SotrudNoClick(Sender: TObject);
begin
  inherited;
  quAnalisPlanningOrder.Close;
  quAnalisPlanningOrder.ParamByName('Is_Ext_SotrudNo').Value := cbIs_Ext_SotrudNo.Checked;
  quAnalisPlanningOrder.Open;
end;

procedure TAnalisPlanningOrderForm.cbIs_Ext_ColnPriceClick(Sender: TObject);
begin
  inherited;
  quAnalisPlanningOrder.Close;
  quAnalisPlanningOrder.ParamByName('Is_Ext_ColnPrice').Value := cbIs_Ext_ColnPrice.Checked;
  quAnalisPlanningOrder.Open;
end;

procedure TAnalisPlanningOrderForm.EdDatePlanningBegPropertiesChange(
  Sender: TObject);
begin
  inherited;
  quAnalisPlanningOrder.Close;
  quAnalisPlanningOrder.ParamByName('DatePlanBeg').Value := EdDatePlanningBeg.Date;
  quAnalisPlanningOrder.Open;
end;

procedure TAnalisPlanningOrderForm.EdDatePlanningEndPropertiesChange(
  Sender: TObject);
begin
  inherited;
  quAnalisPlanningOrder.Close;
  quAnalisPlanningOrder.ParamByName('DatePlanEnd').Value := EdDatePlanningEnd.Date;
  quAnalisPlanningOrder.Open;
end;

procedure TAnalisPlanningOrderForm.EdDatePlanningEndFactPropertiesChange(
  Sender: TObject);
begin
  inherited;
  quAnalisPlanningOrder.Close;
  quAnalisPlanningOrder.ParamByName('DateFactEnd').Value := EdDatePlanningEndFact.Date;
  quAnalisPlanningOrder.Open;
end;

procedure TAnalisPlanningOrderForm.fltOtdelSelectOk(
  Sender: TObject);
begin
  inherited;
  if fltOtdel.Text = '' then begin
                               quAnalisPlanningOrder.Close;
                               quAnalisPlanningOrder.ParamByName('IsSelectedOtdel').Value := 0;
                               quAnalisPlanningOrder.Open;
                             end
                        else begin
                               quAnalisPlanningOrder.Close;
                               quAnalisPlanningOrder.ParamByName('IsSelectedOtdel').Value := 1;
                               quAnalisPlanningOrder.ParamByName('UserNo').Value := Data.UserNo;
                               quAnalisPlanningOrder.ParamByName('SPID').Value := dmDataModule.SPID;
                               quAnalisPlanningOrder.Open;
                             end;

end;

procedure TAnalisPlanningOrderForm.fltSotrudSelectOk(Sender: TObject);
begin
  inherited;
  if fltSotrud.Text = '' then begin
                                quAnalisPlanningOrder.Close;
                                quAnalisPlanningOrder.ParamByName('IsSelectedSotrud').Value := 0;
                                quAnalisPlanningOrder.Open;
                              end
                         else begin
                                quAnalisPlanningOrder.Close;
                                quAnalisPlanningOrder.ParamByName('IsSelectedSotrud').Value := 1;
                                quAnalisPlanningOrder.ParamByName('UserNo').Value := Data.UserNo;
                                quAnalisPlanningOrder.ParamByName('SPID').Value := dmDataModule.SPID;
                                quAnalisPlanningOrder.Open;
                              end;
end;

procedure TAnalisPlanningOrderForm.fltVidTovSelectOk(Sender: TObject);
begin
  inherited;
  if fltVidTov.Text = '' then begin
                                quAnalisPlanningOrder.Close;
                                quAnalisPlanningOrder.ParamByName('IsSelectedVidTov').Value := 0;
                                quAnalisPlanningOrder.Open;
                              end
                         else begin
                                quAnalisPlanningOrder.Close;
                                quAnalisPlanningOrder.ParamByName('IsSelectedVidTov').Value := 1;
                                quAnalisPlanningOrder.ParamByName('UserNo').Value := Data.UserNo;
                                quAnalisPlanningOrder.ParamByName('SPID').Value := dmDataModule.SPID;
                                quAnalisPlanningOrder.Open;
                              end;
end;

procedure TAnalisPlanningOrderForm.bRefrehsClick(Sender: TObject);
begin
  inherited;
  quAnalisPlanningOrder.Close;
  if fltVidTov.Text = '' then begin
                                quAnalisPlanningOrder.ParamByName('IsSelectedVidTov').Value := 0;
                              end
                         else begin
                                quAnalisPlanningOrder.ParamByName('IsSelectedVidTov').Value := 1;
                                quAnalisPlanningOrder.ParamByName('UserNo').Value := Data.UserNo;
                                quAnalisPlanningOrder.ParamByName('SPID').Value := dmDataModule.SPID;
                              end;
  if fltSotrud.Text = '' then begin
                                quAnalisPlanningOrder.ParamByName('IsSelectedSotrud').Value := 0;
                              end
                         else begin
                                quAnalisPlanningOrder.ParamByName('IsSelectedSotrud').Value := 1;
                                quAnalisPlanningOrder.ParamByName('UserNo').Value := Data.UserNo;
                                quAnalisPlanningOrder.ParamByName('SPID').Value := dmDataModule.SPID;
                              end;
  if fltOtdel.Text = '' then begin
                               quAnalisPlanningOrder.ParamByName('IsSelectedOtdel').Value := 0;
                             end
                        else begin
                               quAnalisPlanningOrder.ParamByName('IsSelectedOtdel').Value := 1;
                               quAnalisPlanningOrder.ParamByName('UserNo').Value := Data.UserNo;
                               quAnalisPlanningOrder.ParamByName('SPID').Value := dmDataModule.SPID;
                             end;

  if FltTipTovara.Text = '' then begin
                                   quAnalisPlanningOrder.ParamByName('IsSelectedTipTovara').Value := 0;
                                 end
                            else begin
                                   quAnalisPlanningOrder.ParamByName('IsSelectedTipTovara').Value := 1;
                                   quAnalisPlanningOrder.ParamByName('UserNo').Value := Data.UserNo;
                                   quAnalisPlanningOrder.ParamByName('SPID').Value := dmDataModule.SPID;
                                 end;
  if FltTovar.Text = '' then begin
                               quAnalisPlanningOrder.ParamByName('IsSelectedTovar').Value := 0;
                             end
                        else begin
                               quAnalisPlanningOrder.ParamByName('IsSelectedTovar').Value := 1;
                               quAnalisPlanningOrder.ParamByName('UserNo').Value := Data.UserNo;
                               quAnalisPlanningOrder.ParamByName('SPID').Value := dmDataModule.SPID;
                             end;

  quAnalisPlanningOrder.ParamByName('DatePlanBeg').Value := EdDatePlanningBeg.Date;
  quAnalisPlanningOrder.ParamByName('DateFactEnd').Value := EdDatePlanningEndFact.Date;
  quAnalisPlanningOrder.ParamByName('DatePlanEnd').Value := EdDatePlanningEnd.Date;
  quAnalisPlanningOrder.ParamByName('Is_Ext_OtdelNo').Value := cbIs_Ext_OtdelNo.Checked;
  quAnalisPlanningOrder.ParamByName('Is_Ext_VidNo').Value := cbIs_Ext_VidNo.Checked;
  quAnalisPlanningOrder.ParamByName('Is_Ext_TipNo').Value := cbIs_Ext_TipNo.Checked;
  quAnalisPlanningOrder.ParamByName('Is_Ext_TovarNo').Value := cbIs_Ext_TovarNo.Checked;
  quAnalisPlanningOrder.ParamByName('Is_Ext_SotrudNo').Value := cbIs_Ext_SotrudNo.Checked;
  quAnalisPlanningOrder.ParamByName('Is_Ext_ColnPrice').Value := cbIs_Ext_ColnPrice.Checked;
  quAnalisPlanningOrder.ParamByName('IsFactSumCorrection_SummaProdag').Value := cbFactSumCorrection_SummaProdag.Checked;
  quAnalisPlanningOrder.Open;
end;


procedure TAnalisPlanningOrderForm.DBGridEh1TitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
var
  TovarNo : integer;
begin
  TovarNo := quAnalisPlanningOrderTovarNo.Value;
  quAnalisPlanningOrder.Close;
  case ACol of
    0: quAnalisPlanningOrder.MacroByName('_order').Value := 't.SotrudOtdel';
    1: quAnalisPlanningOrder.MacroByName('_order').Value := 'VidName';
    2: quAnalisPlanningOrder.MacroByName('_order').Value := 'TipName';
    3: quAnalisPlanningOrder.MacroByName('_order').Value := 'TovarName';
    4: quAnalisPlanningOrder.MacroByName('_order').Value := 't.SotrudName';
    8: quAnalisPlanningOrder.MacroByName('_order').Value := 'ColName';
    16: quAnalisPlanningOrder.MacroByName('_order').Value := 'FactSumCorrection_SummaProdag';
  end;

  quAnalisPlanningOrder.Open;
  quAnalisPlanningOrder.Locate('TovarNo', TovarNo, []);

end;

procedure TAnalisPlanningOrderForm.DBGridEh1KeyPress(Sender: TObject;
  var Key: Char);
var
 Found:boolean;
begin
  inherited;
  if (Key in Data.SearchSet) then
  begin
   SearchString:=SearchString+Key;
   Key:=Chr(0);
   Found:=False;
   try
   Found:=DBGridEh1.DataSource.DataSet.Locate(DBGridEh1.Columns[DBGridEh1.Col-1].FieldName,SearchString,[loPartialKey,loCaseInsensitive]);
   except
   SearchString:='';
   end;
   if (not Found) and (DBGridEh1.Columns[DBGridEh1.Col].Field.DataType=ftString) then
    SearchString:=Copy(SearchString,1,length(SearchString)-1);
  end;
end;

procedure TAnalisPlanningOrderForm.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
 case Key of
  VK_DOWN,VK_UP:SearchString:='';
 end;
end;

procedure TAnalisPlanningOrderForm.Button1Click(Sender: TObject);
begin
  inherited;

  sdExportAnalisInExel.DefaultExt := '.xls';   // Выбираем файл для импорта данных
  sdExportAnalisInExel.Filter := 'Excel (*.xls)|*.xls'; // Устанавливаем фильтер

  if sdExportAnalisInExel.Execute then SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,DBGridEh1,sdExportAnalisInExel.FileName,True);

  if FileExists(sdExportAnalisInExel.FileName) then ShowMessage('Создан файл: '+sdExportAnalisInExel.FileName)
                                               else ShowMessage('Файл '+sdExportAnalisInExel.FileName+' не создан!'+ #10#13 +
                                                                'Обратитесь к системному администратору!');

end;

end.

