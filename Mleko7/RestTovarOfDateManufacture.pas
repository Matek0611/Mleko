unit RestTovarOfDateManufacture;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, DB, MemDS, DBAccess, MSAccess, GridsEh,
  DBGridEh, ExtCtrls, StdCtrls, Mask, DBCtrlsEh, DBLookupEh, DBGridEhImpExp;

type
  TRestTovarOfDateManufactureForm = class(TMlekoForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    dsTovarDateOfManufacture: TMSDataSource;
    quTovarDateOfManufacture: TMSQuery;
    quTovarDateOfManufactureTovarNo: TIntegerField;
    quTovarDateOfManufactureNameTovar: TStringField;
    quTovarDateOfManufactureSrokReal: TSmallintField;
    quTovarDateOfManufactureVidName: TStringField;
    quTovarDateOfManufactureKol: TFloatField;
    quTovarDateOfManufactureDateBeg: TDateTimeField;
    quTovarDateOfManufactureDateEnd: TDateTimeField;
    quTovarDateOfManufacturePercentReallizDay: TIntegerField;
    Label1: TLabel;
    Label2: TLabel;
    DBLookupComboboxEhFltVidTovara: TDBLookupComboboxEh;
    Label3: TLabel;
    bRefresh: TButton;
    quFltVidTovara: TMSQuery;
    dsFltVidTovara: TMSDataSource;
    quFltVidTovaraVidName: TStringField;
    quFltVidTovaraVidNo: TSmallintField;
    Is_NotZero: TCheckBox;
    bExportExel: TButton;
    sdExportRestTovar: TSaveDialog;
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure DBGridEh1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBLookupComboboxEhFltVidTovaraChange(Sender: TObject);
    procedure bRefreshClick(Sender: TObject);
    procedure quTovarDateOfManufactureBeforeOpen(DataSet: TDataSet);
    procedure bExportExelClick(Sender: TObject);
  private
    { Private declarations }
    SearchString: string;
  public
    { Public declarations }
  end;

var
  RestTovarOfDateManufactureForm: TRestTovarOfDateManufactureForm;

implementation

{$R *.dfm}

uses data;

procedure TRestTovarOfDateManufactureForm.DBGridEh1KeyPress(
  Sender: TObject; var Key: Char);
var
 Found:boolean;
begin
  inherited;
 if Key in data.SearchSet then
  begin
   Found:=False;
   SearchString:=SearchString+Key;
   try
   Found:=DBGridEh1.DataSource.DataSet.Locate(DBGridEh1.Columns[DBGridEh1.SelectedIndex].FieldName,AnsiUpperCase(SearchString),[loCaseInsensitive,loPartialKey]);
   except
   SearchString:='';
   end;
   if DBGridEh1.Columns[DBGridEh1.SelectedIndex].Field.DataType=ftString then
    if not Found then SearchString:=Copy(SearchString,1,Length(SearchString)-1);
   Key:=Chr(0);
  end;
end;

procedure TRestTovarOfDateManufactureForm.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_DOWN, VK_UP: SearchString := '';
  end;
end;

procedure TRestTovarOfDateManufactureForm.DBGridEh1TitleBtnClick(
  Sender: TObject; ACol: Integer; Column: TColumnEh);
begin
  inherited;
  quTovarDateOfManufacture.Close;
  case ACol of
    0:quTovarDateOfManufacture.MacroByName('_order').Value:='tdom.TovarNo';
    1:quTovarDateOfManufacture.MacroByName('_order').Value:='t.NameTovar';
    2:quTovarDateOfManufacture.MacroByName('_order').Value:='vt.VidName';
    3:quTovarDateOfManufacture.MacroByName('_order').Value:='tdom.Kol';
    4:quTovarDateOfManufacture.MacroByName('_order').Value:='tdom.DateBeg';
    5:quTovarDateOfManufacture.MacroByName('_order').Value:='tdom.DateEnd';
    6:quTovarDateOfManufacture.MacroByName('_order').Value:='t.SrokReal';
    7:quTovarDateOfManufacture.MacroByName('_order').Value:='PercentReallizDay';
  end;
  quTovarDateOfManufacture.Open;
end;

procedure TRestTovarOfDateManufactureForm.DBGridEh1DrawDataCell(
  Sender: TObject; const Rect: TRect; Field: TField;
  State: TGridDrawState);
begin
  inherited;
{
  if Field = nil then exit;
  if (Field.FieldName = 'PercentReallizDay')
    and (quTovarDateOfManufacture.FieldByName('PercentReallizDay').AsInteger > 75)
    and (quTovarDateOfManufacture.FieldByName('PercentReallizDay').AsInteger < 100)
    then DBGridEh1.Canvas.Brush.Color := clYellow;
  if (Field.FieldName = 'PercentReallizDay') and (quTovarDateOfManufacture.FieldByName('quTovarDateOfManufacture').AsInteger >= 100) then DBGridEh1.Canvas.Brush.Color := clRed;
//  DBGridEh1.DefaultDrawDataCell(Rect,Field,State);
  DBGridEh1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
}
end;

procedure TRestTovarOfDateManufactureForm.DBGridEh1DrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
  if  ((quTovarDateOfManufacture.FieldByName('PercentReallizDay').AsInteger >= 100)
   and (quTovarDateOfManufacture.FieldByName('Kol').AsInteger <> 0)) then DBGridEh1.Canvas.Font.Color := clRed;
  if  ((quTovarDateOfManufacture.FieldByName('PercentReallizDay').AsInteger > 75)
   and (quTovarDateOfManufacture.FieldByName('PercentReallizDay').AsInteger < 100)
   and (quTovarDateOfManufacture.FieldByName('Kol').AsInteger <> 0)) then DBGridEh1.Canvas.Brush.Color := clYellow;

  DBGridEh1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TRestTovarOfDateManufactureForm.DBLookupComboboxEhFltVidTovaraChange(
  Sender: TObject);
begin
  inherited;
  if DBLookupComboboxEhFltVidTovara.Text <> '' then begin
                                                      quTovarDateOfManufacture.Close;
                                                      quTovarDateOfManufacture.MacroByName('_where').Value:='and vt.VidNo = ' + IntToStr(DBLookupComboboxEhFltVidTovara.KeyValue);
                                                      quTovarDateOfManufacture.Open;
                                                    end
                                               else begin
                                                      quTovarDateOfManufacture.Close;
                                                      quTovarDateOfManufacture.MacroByName('_where').Value:='';
                                                      quTovarDateOfManufacture.Open;
                                                    end
end;

procedure TRestTovarOfDateManufactureForm.bRefreshClick(Sender: TObject);
begin
  inherited;
  quTovarDateOfManufacture.Close;
  quTovarDateOfManufacture.MacroByName('_where').Value:='';
  quTovarDateOfManufacture.Open;
end;

procedure TRestTovarOfDateManufactureForm.quTovarDateOfManufactureBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  if Is_NotZero.Checked then quTovarDateOfManufacture.MacroByName('_wherezero').Value:=' and tdom.Kol <> 0 '
                        else quTovarDateOfManufacture.MacroByName('_wherezero').Value:='';
end;

procedure TRestTovarOfDateManufactureForm.bExportExelClick(
  Sender: TObject);
begin
  inherited;
  sdExportRestTovar.DefaultExt := '.xls';   // Выбираем файл для импорта данных
  sdExportRestTovar.Filter := 'Excel (*.xls)|*.xls'; // Устанавливаем фильтер

  if sdExportRestTovar.Execute then SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,DBGridEh1,sdExportRestTovar.FileName,True);

  if FileExists(sdExportRestTovar.FileName) then ShowMessage('Создан файл: '+sdExportRestTovar.FileName)
                                            else ShowMessage('Файл '+sdExportRestTovar.FileName+' не создан!'+ #10#13 +
                                                             'Обратитесь к системному администратору!');
end;

end.
