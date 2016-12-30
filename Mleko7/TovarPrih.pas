unit TovarPrih;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  Grids, DBGrids, RXDBCtrl, ExtCtrls, DBCtrls, StdCtrls, Buttons, DB, Mask,
  rxToolEdit, rxCurrEdit, MemDS, DBAccess, MsAccess, ActnList;

type
  TfmTovarPrih = class(TMlekoForm)
    paBottom: TPanel;
    RxDBGrid1: TRxDBGrid;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    Bevel1: TBevel;
    ceKol: TCurrencyEdit;
    cePrice: TCurrencyEdit;
    Label1: TLabel;
    Label2: TLabel;
    quLastPrihod: TMSQuery;
    cbTovarPrihForDateOfManufacture: TCheckBox;
    procedure bbOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure RxDBGrid1Exit(Sender: TObject);
    procedure bbKartClick(Sender: TObject);
  private
    { Private declarations }
    SearchString:string;
  public
    { Public declarations }
  end;
type TPrihRet = record
   TovarNo  :Integer;
   Kol      :Double;
   PriceIn  :Double;
   NameTovar:string;
   DateOfManufacture:Tdate;
end;
var
  fmTovarPrih: TfmTovarPrih;
  OtdelNoWork: integer;
  function EditTovarPrih(PriceWithNDS:boolean; OtdelNo: integer):TPrihRet;

implementation

uses data,  Kart2, main, TovarPrihForDateOfManufacture;

{$R *.DFM}
function EditTovarPrih(PriceWithNDS:boolean; OtdelNo: integer):TPrihRet;
begin
 fmTovarPrih:=TfmTovarPrih.Create(Application);
 try
 OtdelNoWork:=OtdelNo;
 if OtdelNo=3 then
  begin
   fmTovarPrih.Caption:='Приход тары';
   dmDataModule.quTovar.MacroByName('_where').Value:='Where (t.OtdelNo='+IntToStr(OtdelNo)+') AND (t.Visible=0)';
  end
 else
  begin
   fmTovarPrih.Caption:='Приход товара';
   dmDataModule.quTovar.MacroByName('_where').Value:='Where (t.OtdelNo<>3) AND (t.Visible=0)';
  end;

 dmDataModule.quTovar.Open;
 Result.TovarNo:=0;
 if fmTovarPrih.ShowModal=mrOK then
  begin
   Result.TovarNo:=dmDataModule.quTovarTovarNo.AsInteger;
   Result.Kol:=fmTovarPrih.ceKol.Value;
   Result.DateOfManufacture := DateOfManufacture;
   if PriceWithNDS then
    Result.PriceIn:=fmTovarPrih.cePrice.Value
   else
    Result.PriceIn:=fmTovarPrih.cePrice.Value*1.2;
   Result.NameTovar:=dmDataModule.quTovarNameTovar.AsString;
  end;
 finally
 
 dmDataModule.quTovar.Close;
 fmTovarPrih.Free;
 end;
end;

procedure TfmTovarPrih.bbOkClick(Sender: TObject);
var
  quPriceInInst : TMSQuery;
begin
 {
  quPriceInInst:=TMSQuery.Create(nil);
  quPriceInInst.Connection:=dmDataModule.DB;
  quPriceInInst.SQL.Clear;
  quPriceInInst.SQL.Text:= 'select isnull(PriceInInst,0) as PriceInInst from PriceForVeb where TovarNo = :TovarNo';
  quPriceInInst.ParamByName('TovarNo').Value :=dmDataModule.quTovarTovarNo.AsInteger;
  quPriceInInst.Open;

  if (not(quPriceInInst.FieldByName('PriceInInst').AsFloat + DeltaPriceInInst >= fmTovarPrih.cePrice.Value)
   or not(quPriceInInst.FieldByName('PriceInInst').AsFloat - DeltaPriceInInst <= fmTovarPrih.cePrice.Value))
  then ShowMessage('Цена '+floattostr(fmTovarPrih.cePrice.Value)+ 'не входит в допустимый интервал цены.' + #10#13 +
                   'Допустимый интервал: с ' + floattostr(quPriceInInst.FieldByName('PriceInInst').AsFloat - DeltaPriceInInst) +
                   ' по ' + floattostr(quPriceInInst.FieldByName('PriceInInst').AsFloat + DeltaPriceInInst));

  quPriceInInst.Close;
 }
  if not cbTovarPrihForDateOfManufacture.Checked then begin
                                                        with TTovarPrihForDateOfManufactureForm.Create(Application) do
                                                         try
                                                           eTovarName.Text := dmDataModule.quTovarNameTovar.AsString;
                                                           eTovarNo.Text := dmDataModule.quTovarTovarNo.AsString;
                                                           ceKol.Value := fmTovarPrih.ceKol.Value;
                                                           DateTimePicker1.Date := GlobalDateNakl-2;
                                                           ActiveControl := DateTimePicker1;
                                                           ShowModal;
                                                         finally
                                                           Free;
                                                         end;
                                                      end;

  quPriceInInst:=TMSQuery.Create(nil);
  quPriceInInst.Connection:=dmDataModule.DB;
  quPriceInInst.SQL.Clear;
  quPriceInInst.SQL.Text:= 'select isnull(PriceInInst,0) as PriceInInst from PriceForVeb where TovarNo = :TovarNo';
  quPriceInInst.ParamByName('TovarNo').Value :=dmDataModule.quTovarTovarNo.AsInteger;
  quPriceInInst.Open;

  if quPriceInInst.FieldByName('PriceInInst').AsFloat = 0 Then begin
                                                                 fmTovarPrih.Close;
//                                                                 fmTovarPrih.ModalResult:=mrChancel;
                                                                 raise Exception.Create('Запрещено приходовать товар!' +#13#10+
                                                                                        'Не выставлена "Входящая устновленная цена"!');
                                                               end;

  fmTovarPrih.Close;
  fmTovarPrih.ModalResult:=mrOK;
end;

procedure TfmTovarPrih.FormShow(Sender: TObject);
begin
 fmTovarPrih.SearchString:='';
 fmTovarPrih.ceKol.Value:=0.00;
 fmTovarPrih.cePrice.Value:=0.00;
 fmTovarPrih.ActiveControl:=RxDBGrid1;
 RxDBGrid1.Col:=3;
end;

procedure TfmTovarPrih.RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
  VK_RETURN: begin
              fmTovarPrih.ActiveControl:=ceKol;
              fmTovarPrih.SearchString:='';
              Key:=0;
             end;
  VK_DOWN,VK_UP:fmTovarPrih.SearchString:='';
 end;
end;

procedure TfmTovarPrih.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
var
 Found:boolean;
begin
 if (Key in Data.SearchSet) then
  begin
   SearchString:=SearchString+Key;
   Key:=Chr(0);
   Found:=False;
   try
   Found:=RxDBGrid1.DataSource.DataSet.Locate(RxDBGrid1.Columns[RxDBGrid1.Col-1].FieldName,SearchString,[loPartialKey,loCaseInsensitive]);
   except
   SearchString:='';
   end;
   if (not Found) and (RxDBGrid1.Columns[RxDBGrid1.Col-1].Field.DataType=ftString) then
    SearchString:=Copy(SearchString,1,length(SearchString)-1);
  end;
end;

procedure TfmTovarPrih.RxDBGrid1TitleBtnClick(Sender: TObject;
  ACol: Integer; Field: TField);
begin
 Screen.Cursor:=crHourGlass;
 dmDataModule.quTovar.Close;
 case ACol of
  0:dmDataModule.quTovar.MacroByName('_order').Value:='TovarNo';
  1:dmDataModule.quTovar.MacroByName('_order').Value:='VidName,NameTovar';
  2:dmDataModule.quTovar.MacroByName('_order').Value:='NameTovar';
  3:dmDataModule.quTovar.MacroByName('_order').Value:='EdIzm,NameTovar';
  4:dmDataModule.quTovar.MacroByName('_order').Value:='NameCompany,NameTovar';
 end;
 dmDataModule.quTovar.Open;
 Screen.Cursor:=crDefault;
end;

procedure TfmTovarPrih.RxDBGrid1Exit(Sender: TObject);
begin
 quLastPrihod.ParamByName('TovarNo').AsInteger:=dmDataModule.quTovarTovarNo.AsInteger;
 quLastPrihod.Open;
 cePrice.Value:=quLastPrihod.FieldByName('Price').AsFloat;
 quLastPrihod.Close;
end;

procedure TfmTovarPrih.bbKartClick(Sender: TObject);
begin
 KartTovar2(dmDataModule.quTovarTovarNo.AsInteger,0);
end;


end.
