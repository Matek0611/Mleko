unit PricingList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, GridsEh, DBGridEh, DB, DBAccess, MSAccess,
  MemDS, ExtCtrls, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, StdCtrls, Mask, DBCtrlsEh, DBLookupEh, DBGridEhImpExp;

type
  TPricingListForm = class(TMlekoForm)
    Panel1: TPanel;
    quHistoriPrice: TMSQuery;
    dsHistoriPrice: TMSDataSource;
    DBGridEh1: TDBGridEh;
    quHistoriPriceTovarNo: TIntegerField;
    quHistoriPriceNameTovar: TStringField;
    quHistoriPriceDateChangePrice: TDateTimeField;
    quHistoriPriceVidName: TStringField;
    quHistoriPricePrice: TFloatField;
    quHistoriPricePrice1: TFloatField;
    quHistoriPricePrice2: TFloatField;
    quHistoriPricePrice3: TFloatField;
    quHistoriPricePrice4: TFloatField;
    quHistoriPricePrice5: TFloatField;
    quHistoriPricePrice6: TFloatField;
    quHistoriPricePrice7: TFloatField;
    quHistoriPricePrice8: TFloatField;
    quHistoriPricePrice9: TFloatField;
    quHistoriPricePrice10: TFloatField;
    quHistoriPricePrice13: TFloatField;
    quHistoriPricePrice14: TFloatField;
    quHistoriPricePrice15: TFloatField;
    quHistoriPricePriceVeb: TFloatField;
    quHistoriPricePriceInInst: TFloatField;
    quHistoriPriceEdit_user: TStringField;
    quHistoriPriceEdit_host_name: TStringField;
    Panel2: TPanel;
    gBPeriod: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EdDateBeg: TcxDateEdit;
    EdDateEnd: TcxDateEdit;
    cbIsLastDateChangePrice: TCheckBox;
    quListVidTovName: TMSQuery;
    dsListVidTovName: TMSDataSource;
    DBLookupComboboxEhVidName: TDBLookupComboboxEh;
    quListVidTovNameVidName: TStringField;
    Button1: TButton;
    Button2: TButton;
    sdExportExelHistoryChangePrice: TSaveDialog;
    quHistoriPriceAvgPriceIn: TFloatField;
    quHistoriPriceLastPriceIn: TFloatField;
    Label3: TLabel;
    Panel3: TPanel;
    rbLastInPrice: TRadioButton;
    brAvgInPrice: TRadioButton;
    rbInInst: TRadioButton;
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure gBPeriodExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBLookupComboboxEhVidNameChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure rbInInstClick(Sender: TObject);
    procedure brAvgInPriceClick(Sender: TObject);
    procedure rbLastInPriceClick(Sender: TObject);
  private
    { Private declarations }
    SearchString:string;
    IsEnabledDAte : boolean;
  public
    { Public declarations }
  end;

var
  PricingListForm: TPricingListForm;

implementation

uses data;

{$R *.dfm}

procedure TPricingListForm.DBGridEh1KeyPress(Sender: TObject;
  var Key: Char);
var
 Found:boolean;
begin
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
   if (not Found) and (DBGridEh1.Columns[DBGridEh1.Col-1].Field.DataType=ftString) then
    SearchString:=Copy(SearchString,1,length(SearchString)-1);
  end;
end;

procedure TPricingListForm.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
 case Key of
  VK_DOWN,VK_UP:SearchString:='';
 end;
end;

procedure TPricingListForm.DBGridEh1TitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
var
  TovarNo : integer;
begin
  TovarNo := quHistoriPriceTovarNo.Value;
  quHistoriPrice.Close;
  case ACol of
    0: quHistoriPrice.MacroByName('_order').Value := 'hp.TovarNo';
    1: quHistoriPrice.MacroByName('_order').Value := 'hp.NameTovar';
    2: quHistoriPrice.MacroByName('_order').Value := 'DateChangePrice';
    3: quHistoriPrice.MacroByName('_order').Value := 'hp.VidName';
  end;

  quHistoriPrice.Open;
  quHistoriPrice.Locate('TovarNo', TovarNo, []);

end;

procedure TPricingListForm.gBPeriodExit(Sender: TObject);
begin
  inherited;
{
  quHistoriPrice.ParamByName('DateBeg').Value := EdDateBeg.Date;
  quHistoriPrice.ParamByName('DateEnd').Value := EdDateEnd.Date;
  if ((EdDateBeg.Text = '') or (EdDateEnd.Text = '')) then IsEnabledDAte := false else IsEnabledDAte := true;
  quHistoriPrice.ParamByName('IsEnabledDAte').Value := IsEnabledDAte;
}
end;

procedure TPricingListForm.FormCreate(Sender: TObject);
begin
  inherited;
  IsEnabledDAte := false;

  quHistoriPrice.Close;
  quHistoriPrice.ParamByName('CheckedPriceInInst').Value := rbInInst.Checked;
  quHistoriPrice.ParamByName('CheckedPriceAvgInPrice').Value := brAvgInPrice.Checked;
  quHistoriPrice.ParamByName('CheckedPriceLastInPrice').Value := rbLastInPrice.Checked;
  quHistoriPrice.Open;

end;

procedure TPricingListForm.DBLookupComboboxEhVidNameChange(
  Sender: TObject);
begin
  inherited;
{
  quHistoriPrice.Close;
  quHistoriPrice.ParamByName('VidName').Value := DBLookupComboboxEhVidName.Text;
  quHistoriPrice.Open;
}
end;

procedure TPricingListForm.Button1Click(Sender: TObject);
begin
  inherited;
  quHistoriPrice.Close;
  quHistoriPrice.ParamByName('DateBeg').Value := EdDateBeg.Date;
  quHistoriPrice.ParamByName('DateEnd').Value := EdDateEnd.Date;
  if EdDateBeg.Text = '' then quHistoriPrice.ParamByName('DateBeg').Clear;
  if EdDateEnd.Text = '' then quHistoriPrice.ParamByName('DateEnd').Clear;
  if ((EdDateBeg.Text = '') or (EdDateEnd.Text = '')) then IsEnabledDAte := false else IsEnabledDAte := true;
  quHistoriPrice.ParamByName('IsEnabledDAte').Value := IsEnabledDAte;
  quHistoriPrice.ParamByName('VidName').Value := DBLookupComboboxEhVidName.Text;
  quHistoriPrice.ParamByName('IsLastDateChangePrice').Value := cbIsLastDateChangePrice.Checked;
  quHistoriPrice.Open
end;

procedure TPricingListForm.Button2Click(Sender: TObject);
begin
  inherited;
  inherited;
  sdExportExelHistoryChangePrice.DefaultExt := '.xls';   // Выбираем файл для импорта данных
  sdExportExelHistoryChangePrice.Filter := 'Excel (*.xls)|*.xls'; // Устанавливаем фильтер

  if sdExportExelHistoryChangePrice.Execute then SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,DBGridEh1,sdExportExelHistoryChangePrice.FileName,True);

  if FileExists(sdExportExelHistoryChangePrice.FileName) then ShowMessage('Создан файл: '+sdExportExelHistoryChangePrice.FileName)
                                                         else ShowMessage('Файл '+sdExportExelHistoryChangePrice.FileName+' не создан!'+ #10#13 +
                                                                          'Обратитесь к системному администратору!');
end;

procedure TPricingListForm.rbInInstClick(Sender: TObject);
begin
  inherited;
  quHistoriPrice.Close;
  quHistoriPrice.ParamByName('CheckedPriceInInst').Value := rbInInst.Checked;
  quHistoriPrice.ParamByName('CheckedPriceAvgInPrice').Value := brAvgInPrice.Checked;
  quHistoriPrice.ParamByName('CheckedPriceLastInPrice').Value := rbLastInPrice.Checked;
  quHistoriPrice.Open;
end;

procedure TPricingListForm.brAvgInPriceClick(Sender: TObject);
begin
  inherited;
  quHistoriPrice.Close;
  quHistoriPrice.ParamByName('CheckedPriceInInst').Value := rbInInst.Checked;
  quHistoriPrice.ParamByName('CheckedPriceAvgInPrice').Value := brAvgInPrice.Checked;
  quHistoriPrice.ParamByName('CheckedPriceLastInPrice').Value := rbLastInPrice.Checked;
  quHistoriPrice.Open;
end;

procedure TPricingListForm.rbLastInPriceClick(Sender: TObject);
begin
  inherited;
  quHistoriPrice.Close;
  quHistoriPrice.ParamByName('CheckedPriceInInst').Value := rbInInst.Checked;
  quHistoriPrice.ParamByName('CheckedPriceAvgInPrice').Value := brAvgInPrice.Checked;
  quHistoriPrice.ParamByName('CheckedPriceLastInPrice').Value := rbLastInPrice.Checked;
  quHistoriPrice.Open;
end;

end.
