unit Ostatok;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, Mask,
  Db, DBAccess, MsAccess, MemDS, ActnList, rxToolEdit, rxCurrEdit,
  citDbGrid, GridsEh, DBGridEh;

type
  TOstRet = record
    TovarNo: Integer;
    Kol: Double;
    Price: Double;
    AvgPriceIn: Double;
    NameTovar: string;
  end;

type
  TfmOstatok = class(TMlekoForm)
    paBottom: TPanel;
    RxDBGrid1: TCitDBGrid;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    meKol: TCurrencyEdit;
    mePrice: TCurrencyEdit;
    quOstatok: TMSQuery;
    dsOstatok: TDataSource;
    ActionList1: TActionList;
    ActionFind: TAction;
    SpeedButton1: TSpeedButton;
    cbTovarPrihForDateOfManufacture: TCheckBox;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    quTovarDateOfManufacture: TMSQuery;
    dsTovarDateOfManufacture: TMSDataSource;
    quTovarDateOfManufactureTovarNo: TIntegerField;
    quTovarDateOfManufactureKol: TFloatField;
    quTovarDateOfManufactureDateBeg: TDateTimeField;
    quTovarDateOfManufactureDateEnd: TDateTimeField;
    quTovarDateOfManufactureDateBegStart: TDateTimeField;
    procedure RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure meKolEnter(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure ActionFindExecSQL(Sender: TObject);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RxDBGrid1CellClick(Column: TColumn);

  private
    { Private declarations }
    SearchString: string;
    vColnPrice: integer;
    VidNaklNo: integer;
    ReturnNakl: Boolean;
    new:string;
  public
    { Public declarations }
    OtdelNoWork: Integer;
    class function GetOstatok(pColnPrice, pVidNaklNo, pOtdelNo: integer; pReturn: Boolean; pNaklNo: integer): TOstRet;
  end;

var
  fmOstatok: TfmOstatok;
implementation

uses data, MlekoPropFindTov,OstatokFiltr, TovarPrih, TovarPrihForDateOfManufacture, main, EditNaklR0;

{$R *.DFM}

class function TfmOstatok.GetOstatok(pColnPrice, pVidNaklNo, pOtdelNo: integer; pReturn: Boolean; pNaklNo: integer): TOstRet;
var
  HeadRate, Rate : real;
  CurrencyHead : string;
begin
  fmOstatok := TfmOstatok.Create(Application);
  try
    fmOstatok.vColnPrice := pColnPrice;
    fmOstatok.VidNaklNo := pVidNaklNo;
    fmOstatok.OtdelNoWork := pOtdelNo;
    fmOstatok.ReturnNakl := pReturn;
    if pReturn then
    begin
      fmOstatok.Caption := 'Остаток товара';
      fmOstatok.quOstatok.MacroByName('_where').Value := ' (t.OtdelNo<>3)';
    end
    else
    begin
      if pOtdelNo = 3 then
      begin
        fmOstatok.Caption := 'Остаток тары';
        fmOstatok.quOstatok.MacroByName('_where').Value := ' (o.Kol<>0 or res.qty<>0) and (t.OtdelNo=3)';
      end
      else
      begin
        fmOstatok.Caption := 'Остаток товара';
        fmOstatok.quOstatok.MacroByName('_where').Value := ' (o.Kol<>0 or res.qty<>0) and (t.OtdelNo<>3)';
      end;
    end;
    fmOstatok.quOstatok.Prepare;
    fmOstatok.quOstatok.Open;

//    showmessage(inttostr(fmOstatok.quOstatok.RecordCount));

    fmOstatok.quTovarDateOfManufacture.Open;
    if not fmOstatok.quOstatok.Locate('TovarNo', dmDataModule.PrevTovarNo, []) then
      fmOstatok.quOstatok.Locate('TovarNo', dmDataModule.PrevTovarNo1, []);

    CurrencyHead := '';
    dmDataModule.OpenSQL('select CurrencyHead from NaklR where NaklNo = :p1_NaklNo',[pNaklNo]);
    CurrencyHead := dmDataModule.QFO.FieldByName('CurrencyHead').Value;

    HeadRate := 0;
    dmDataModule.OpenSQL('select Rate from d_currency dc left join CurrencyExchange ce on ce.CurrencyId = dc.ID and isActive = 1 where l_code = :p1_CurrencyHead',[CurrencyHead]);
    HeadRate := dmDataModule.QFO.FieldByName('Rate').Value;

    if fmOstatok.ShowModal = mrOk then
    begin
      Rate := fmOstatok.quOstatok.FieldByName('Rate').AsCurrency;
      Result.TovarNo := fmOstatok.quOstatok.FieldByName('TovarNo').AsInteger;
      Result.Kol := fmOstatok.meKol.Value;
      Result.Price := fmOstatok.mePrice.Value * Rate / HeadRate;
      Result.AvgPriceIn := fmOstatok.quOstatok.FieldByName('AvgPriceIn').AsFloat;
      Result.NameTovar := fmOstatok.quOstatok.FieldByName('NameTovar').AsString;
    end
    else
      Result.TovarNo := 0;
    dmDataModule.PrevTovarNo := fmOstatok.quOstatok.FieldByName('TovarNo').AsInteger;
    fmOstatok.quOstatok.Prior;
    dmDataModule.PrevTovarNo1 := fmOstatok.quOstatok.FieldByName('TovarNo').AsInteger;
    fmOstatok.quOstatok.Close;
  finally
    fmOstatok.Free;
  end;
end;

procedure TfmOstatok.RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of

    VK_RETURN:
      begin
        fmOstatok.ActiveControl := meKol;
        fmOstatok.SearchString := '';
        Key := 0;
      end;
    VK_DOWN, VK_UP: fmOstatok.SearchString := '';
{
    VK_UP:
      begin
        fmOstatok.quTovarDateOfManufacture.Close;
        fmOstatok.quTovarDateOfManufacture.MacroByName('where').Value := ' TovarNo = ' + fmOstatok.quOstatok.FieldByName('TovarNo').AsString;
        fmOstatok.quTovarDateOfManufacture.Open;
        fmOstatok.SearchString := '';
      end;
    VK_DOWN:
      begin
        fmOstatok.quTovarDateOfManufacture.Close;
        fmOstatok.quTovarDateOfManufacture.MacroByName('where').Value := ' TovarNo = ' + fmOstatok.quOstatok.FieldByName('TovarNo').AsString;
        fmOstatok.quTovarDateOfManufacture.Open;
        fmOstatok.SearchString := '';
      end;
 }
  end;
end;

procedure TfmOstatok.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ModalResult = mrOk then
  begin
    if mePrice.Value = 0 then
      ShowMessage('Отпуск по нулевой цене!');
    if not ReturnNakl then
    begin
      //     meKol.Value:=abs(meKol.Value);                                                                                     -
      //     if (abs(meKol.Value) > fmOstatok.quOstatokKol.AsFloat) and (Application.MessageBox(PChar('Остаток меньше !'+#10+ 'Идем на красное ?'),
      if (meKol.Value > fmOstatok.quOstatok.FieldByName('Kol').AsFloat) and (Application.MessageBox(PChar('Остаток меньше !' + #10 +
        'Идем на красное ?'),
        'Расход', MB_YESNO) <> IDYES) then Action := caNone;
    end
    else
    begin
      if meKol.Value > 0 then
        meKol.Value := -1 * meKol.Value
      else
        meKol.Value := meKol.Value;
      meKol.Value := meKol.Value;
    end;
    quOstatok.Filtered:=False;  
  end;
end;

procedure TfmOstatok.FormShow(Sender: TObject);
begin
   quOstatok.Filter:=quOstatok.Filter + OstatokFiltr.Filter.Memo1.Lines.Text;
   quOstatok.Filtered:=True;
  fmOstatok.SearchString := '';
  fmOstatok.ActiveControl := RxDbGrid1;
  meKol.Value := 0.00;
  mePrice.Value := 0.00;
end;

procedure TfmOstatok.meKolEnter(Sender: TObject);
begin
  if fmOstatok.VidNaklNo = 2 then //Списание бой
    mePrice.Value := fmOstatok.quOstatok.FieldByName('LastPriceIn').AsFloat
  else
  begin

    case fmOstatok.vColnPrice of
      1: mePrice.Value := fmOstatok.quOstatok.FieldByName('Price').AsFloat;
      2: mePrice.Value := fmOstatok.quOstatok.FieldByName('Price1').AsFloat;
      3: mePrice.Value := fmOstatok.quOstatok.FieldByName('Price2').AsFloat;
      4: mePrice.Value := fmOstatok.quOstatok.FieldByName('Price3').AsFloat;
      5: mePrice.Value := fmOstatok.quOstatok.FieldByName('Price4').AsFloat;
      6: mePrice.Value := fmOstatok.quOstatok.FieldByName('Price5').AsFloat;
      7: mePrice.Value := fmOstatok.quOstatok.FieldByName('Price6').AsFloat;
      8: mePrice.Value := fmOstatok.quOstatok.FieldByName('Price7').AsFloat;
      9: mePrice.Value := fmOstatok.quOstatok.FieldByName('LastPriceIn').AsFloat;
     14: mePrice.Value := fmOstatok.quOstatok.FieldByName('Price14').AsFloat;
     15: mePrice.Value := fmOstatok.quOstatok.FieldByName('Price15').AsFloat;
     13: mePrice.Value := fmOstatok.quOstatok.FieldByName('Price13').AsFloat;
     17: mePrice.Value := fmOstatok.quOstatok.FieldByName('PriceVeb').AsFloat;
     18: mePrice.Value := fmOstatok.quOstatok.FieldByName('PriceInInst').AsFloat;
    end;
  end;
end;

procedure TfmOstatok.bbOkClick(Sender: TObject);
begin
  if not cbTovarPrihForDateOfManufacture.Checked then begin
                                                        with TTovarPrihForDateOfManufactureForm.Create(Application) do
                                                         try             
                                                           eTovarName.Text := fmOstatok.quOstatok.FieldByName('nametovar').AsString;
                                                           eTovarNo.Text := fmOstatok.quOstatok.FieldByName('tovarno').AsString; 
                                                           ceKol.Value := fmOstatok.meKol.Value;
                                                           DateTimePicker1.Date := GlobalDateNakl-2;
                                                           ActiveControl := DateTimePicker1;
                                                           ShowModal;
                                                         finally
                                                           Free;
                                                         end;
                                                      end;

  fmOstatok.ModalResult := mrOk;
{
  fmOstatok.Close;
  fmOstatok.ModalResult := mrOk;
 }
end;

procedure TfmOstatok.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
var
 Found:boolean;
begin
 if Key in data.SearchSet then
  begin
   SearchString:=SearchString+Key;
   Key:=Chr(0);
   Found:=False;
   try
   Found:=RxDBGrid1.DataSource.DataSet.Locate(RxDBGrid1.Columns[RxDBGrid1.SelectedIndex].FieldName,AnsiUpperCase(SearchString),[loCaseInsensitive,loPartialKey]);
   except
   SearchString:='';
   end;
   if (not Found) and (RxDBGrid1.Columns[RxDBGrid1.SelectedIndex].Field.DataType=ftString) then
    SearchString:=Copy(SearchString,1,Length(SearchString)-1);
  end;
{
  if Key in ['A'..'Z', 'a'..'z', 'а'..'я', 'А'..'Я', '0'..'9'] then
  begin
    fmOstatok.SearchString := SearchString + Key;
    if not quOstatok.Locate('NameTovar', fmOstatok.SearchString, [loPartialKey, loCaseInsensitive]) then
    begin
      Beep;
      fmOstatok.SearchString := Copy(fmOstatok.SearchString, 1, length(Trim(fmOstatok.SearchString)) - 1);
    end
  end
  else
    fmOstatok.SearchString := '';
}
end;

procedure TfmOstatok.ActionFindExecSQL(Sender: TObject);
var
  tov, vid, str_flt: string;
begin
  if TMlekoPropFindTovDlg.GetFindTov(tov, vid) then
  begin
    str_flt := '';
    fmOstatok.quOstatok.Close;
    fmOstatok.quOstatok.MacroByName('_flt').Value := '';
    if vid <> '' then str_flt := str_flt + ' and Upper(V.VidName) like ''%' + UpperCase(vid) + '%'' ';
    if tov <> '' then str_flt := str_flt + ' and Upper(T.NameTovar) like ''%' + UpperCase(tov) + '%'' ';
    fmOstatok.quOstatok.MacroByName('_flt').Value := Str_flt;
    fmOstatok.quOstatok.Open;
  end;
end;

procedure TfmOstatok.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  with (sender as TCitDBGrid) do
  begin
    if (quOstatok.FieldByName('res_qty').AsFloat <> 0) and (Column.FieldName='res_qty') then
    begin
      Canvas.Brush.Color := clSkyBlue;
      Canvas.Font.Color := clBlack;
    end;
//    RxDBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
  end;
end;


procedure TfmOstatok.RxDBGrid1CellClick(Column: TColumn);
begin
  inherited;
  fmOstatok.quTovarDateOfManufacture.Close;
  fmOstatok.quTovarDateOfManufacture.MacroByName('where').Value := ' TovarNo = ' + fmOstatok.quOstatok.FieldByName('TovarNo').AsString;
  fmOstatok.quTovarDateOfManufacture.Open;
end;

end.

