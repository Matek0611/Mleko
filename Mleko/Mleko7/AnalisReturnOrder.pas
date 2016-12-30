unit AnalisReturnOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CFLMLKCustom, ActnList, DB, MemDS, DBAccess, MSAccess, GridsEh,
  DBGridEh, StdCtrls, citCtrls, citmask, citDBComboEdit, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  ExtCtrls, DBGridEhImpExp, Mask, DBCtrlsEh;

type
  TAnalisReturnOrderForm = class(TCFLMLKCustomForm)
    Panel1: TPanel;
    Label3: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    EdDateBeg1: TcxDateEdit;
    EdDateEnd1: TcxDateEdit;
    EdDateBeg2: TcxDateEdit;
    cbIs_Ext_OtdelNo: TCheckBox;
    cbIs_Ext_VidNo: TCheckBox;
    cbIs_Ext_TipNo: TCheckBox;
    cbIs_Ext_TovarNo: TCheckBox;
    cbIs_Ext_SotrudNo: TCheckBox;
    cbIs_Ext_ColnPrice: TCheckBox;
    fltVidTov: TcitDBComboEdit;
    fltOtdel: TcitDBComboEdit;
    fltSotrud: TcitDBComboEdit;
    FltTipTovara: TcitDBComboEdit;
    FltTovar: TcitDBComboEdit;
    Panel2: TPanel;
    bRefrehs: TButton;
    Button1: TButton;
    Panel3: TPanel;
    DBGridEh1: TDBGridEh;
    dsAnalisReturnOrder: TMSDataSource;
    quAnalisReturnOrder: TMSQuery;
    EdDateEnd2: TcxDateEdit;
    Label1: TLabel;
    quAnalisReturnOrderOtdelNo: TIntegerField;
    quAnalisReturnOrderOtdelName: TStringField;
    quAnalisReturnOrderVidNo: TIntegerField;
    quAnalisReturnOrderVidName: TStringField;
    quAnalisReturnOrderTipNo: TIntegerField;
    quAnalisReturnOrderTipName: TStringField;
    quAnalisReturnOrderTovarNo: TIntegerField;
    quAnalisReturnOrderTovarName: TStringField;
    quAnalisReturnOrderSotrudNo: TIntegerField;
    quAnalisReturnOrderSotrudName: TStringField;
    quAnalisReturnOrderKol1: TFloatField;
    quAnalisReturnOrderSumma1: TFloatField;
    quAnalisReturnOrderKol2: TFloatField;
    quAnalisReturnOrderSumma2: TFloatField;
    quAnalisReturnOrderSumma1_Summa2: TFloatField;
    quAnalisReturnOrderColNPrice: TIntegerField;
    quAnalisReturnOrderColName: TStringField;
    sdExportAnalisInExel: TSaveDialog;
    FltPost: TcitDBComboEdit;
    cbIs_Ext_PostNo: TCheckBox;
    quAnalisReturnOrderPostNo: TIntegerField;
    quAnalisReturnOrderPostName: TStringField;
    Label4: TLabel;
    dbnehSumma1: TDBNumberEditEh;
    dbnehSumma1_Summa2: TDBNumberEditEh;
    Label6: TLabel;
    procedure bRefrehsClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
  private
    { Private declarations }
    SearchString:string;
  public
    { Public declarations }
  end;

var
  AnalisReturnOrderForm: TAnalisReturnOrderForm;

implementation
uses data;

{$R *.dfm}

procedure TAnalisReturnOrderForm.bRefrehsClick(Sender: TObject);
begin
  inherited;
  quAnalisReturnOrder.Close;
  if fltVidTov.Text = '' then begin
                                quAnalisReturnOrder.ParamByName('IsSelectedVidTov').Value := 0;
                              end
                         else begin
                                quAnalisReturnOrder.ParamByName('IsSelectedVidTov').Value := 1;
                                quAnalisReturnOrder.ParamByName('UserNo').Value := Data.UserNo;
                                quAnalisReturnOrder.ParamByName('SPID').Value := dmDataModule.SPID;
                              end;
  if fltSotrud.Text = '' then begin
                                quAnalisReturnOrder.ParamByName('IsSelectedSotrud').Value := 0;
                              end
                         else begin
                                quAnalisReturnOrder.ParamByName('IsSelectedSotrud').Value := 1;
                                quAnalisReturnOrder.ParamByName('UserNo').Value := Data.UserNo;
                                quAnalisReturnOrder.ParamByName('SPID').Value := dmDataModule.SPID;
                              end;
  if fltOtdel.Text = '' then begin
                               quAnalisReturnOrder.ParamByName('IsSelectedOtdel').Value := 0;
                             end
                        else begin
                               quAnalisReturnOrder.ParamByName('IsSelectedOtdel').Value := 1;
                               quAnalisReturnOrder.ParamByName('UserNo').Value := Data.UserNo;
                               quAnalisReturnOrder.ParamByName('SPID').Value := dmDataModule.SPID;
                             end;

  if FltTipTovara.Text = '' then begin
                                   quAnalisReturnOrder.ParamByName('IsSelectedTipTovara').Value := 0;
                                 end
                            else begin
                                   quAnalisReturnOrder.ParamByName('IsSelectedTipTovara').Value := 1;
                                   quAnalisReturnOrder.ParamByName('UserNo').Value := Data.UserNo;
                                   quAnalisReturnOrder.ParamByName('SPID').Value := dmDataModule.SPID;
                                 end;
  if FltTovar.Text = '' then begin
                               quAnalisReturnOrder.ParamByName('IsSelectedTovar').Value := 0;
                             end
                        else begin
                               quAnalisReturnOrder.ParamByName('IsSelectedTovar').Value := 1;
                               quAnalisReturnOrder.ParamByName('UserNo').Value := Data.UserNo;
                               quAnalisReturnOrder.ParamByName('SPID').Value := dmDataModule.SPID;
                             end;
  if FltPost.Text = '' then begin
                              quAnalisReturnOrder.ParamByName('IsSelectedPostNo').Value := 0;
                             end
                        else begin
                               quAnalisReturnOrder.ParamByName('IsSelectedPostNo').Value := 1;
                               quAnalisReturnOrder.ParamByName('UserNo').Value := Data.UserNo;
                               quAnalisReturnOrder.ParamByName('SPID').Value := dmDataModule.SPID;
                             end;

  quAnalisReturnOrder.ParamByName('DateBeg1').Value := EdDateBeg1.Date;
  quAnalisReturnOrder.ParamByName('DateEnd1').Value := EdDateEnd1.Date;
  quAnalisReturnOrder.ParamByName('DateBeg2').Value := EdDateBeg2.Date;
  quAnalisReturnOrder.ParamByName('DateEnd2').Value := EdDateEnd2.Date;
  quAnalisReturnOrder.ParamByName('Is_Ext_OtdelNo').Value := cbIs_Ext_OtdelNo.Checked;
  quAnalisReturnOrder.ParamByName('Is_Ext_VidNo').Value := cbIs_Ext_VidNo.Checked;
  quAnalisReturnOrder.ParamByName('Is_Ext_TipNo').Value := cbIs_Ext_TipNo.Checked;
  quAnalisReturnOrder.ParamByName('Is_Ext_TovarNo').Value := cbIs_Ext_TovarNo.Checked;
  quAnalisReturnOrder.ParamByName('Is_Ext_SotrudNo').Value := cbIs_Ext_SotrudNo.Checked;
  quAnalisReturnOrder.ParamByName('Is_Ext_ColnPrice').Value := cbIs_Ext_ColnPrice.Checked;
  quAnalisReturnOrder.ParamByName('Is_Ext_PostNo').Value := cbIs_Ext_PostNo.Checked;
  quAnalisReturnOrder.ParamByName('Summa1').Value :=  dbnehSumma1.Value;
  quAnalisReturnOrder.ParamByName('Summa1_Summa2').Value :=  dbnehSumma1_Summa2.Value;
  quAnalisReturnOrder.Open;
end;

procedure TAnalisReturnOrderForm.Button1Click(Sender: TObject);
begin
  inherited;
  sdExportAnalisInExel.DefaultExt := '.xls';   // Выбираем файл для импорта данных
  sdExportAnalisInExel.Filter := 'Excel (*.xls)|*.xls'; // Устанавливаем фильтер

  if sdExportAnalisInExel.Execute then SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,DBGridEh1,sdExportAnalisInExel.FileName,True);

  if FileExists(sdExportAnalisInExel.FileName) then ShowMessage('Создан файл: '+sdExportAnalisInExel.FileName)
                                               else ShowMessage('Файл '+sdExportAnalisInExel.FileName+' не создан!'+ #10#13 +
                                                                'Обратитесь к системному администратору!');
end;

procedure TAnalisReturnOrderForm.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
 case Key of
  VK_DOWN,VK_UP:SearchString:='';
 end;
end;

procedure TAnalisReturnOrderForm.DBGridEh1KeyPress(Sender: TObject;
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

procedure TAnalisReturnOrderForm.DBGridEh1TitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
  var
  TovarNo : integer;
begin
  TovarNo := quAnalisReturnOrderTovarNo.Value;
  quAnalisReturnOrder.Close;
  case ACol of
    0: quAnalisReturnOrder.MacroByName('_order').Value := 'OtdelName';
    1: quAnalisReturnOrder.MacroByName('_order').Value := 'VidName';
    2: quAnalisReturnOrder.MacroByName('_order').Value := 'TipName';
    3: quAnalisReturnOrder.MacroByName('_order').Value := 'TovarName';
    4: quAnalisReturnOrder.MacroByName('_order').Value := 't.SotrudName';
    5: quAnalisReturnOrder.MacroByName('_order').Value := 't.ColName';
    6: quAnalisReturnOrder.MacroByName('_order').Value := 't.PostName';
    8: quAnalisReturnOrder.MacroByName('_order').Value := 'Summa1';
   10: quAnalisReturnOrder.MacroByName('_order').Value := 'Summa2';
   11: quAnalisReturnOrder.MacroByName('_order').Value := 'Summa1_Summa2';
  end;

  quAnalisReturnOrder.Open;
  quAnalisReturnOrder.Locate('TovarNo', TovarNo, []);

end;

end.
