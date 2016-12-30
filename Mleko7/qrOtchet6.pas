unit qrOtchet6;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  ExtCtrls, Forms, Quickrpt, QRCtrls, Db, Dialogs, DBAccess,
  MsAccess, MemDS;

type
  TfmOtchet6 = class(TQuickRep)
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    quRashod: TMSQuery;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRBand3: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    quRashodNameTovar: TStringField;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText2: TQRDBText;
    QRBand4: TQRBand;
    UpdateSQL1: TMSUpdateSQL;
    quPrihod: TMSQuery;
    quPrihodTovarNo: TSmallintField;
    quRashodTovarNo: TSmallintField;
    QRDBText6: TQRDBText;
    quRashodPriceIn: TFloatField;
    quRashodSummaIn: TFloatField;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    quRashodTipPrice: TStringField;
    QRDBText5: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    quRashodNameCompany: TStringField;
    quRashodKol: TFloatField;
    quRashodSummaOut: TFloatField;
    quPrihodPrice: TFloatField;
    quPrihodDateNakl: TDateTimeField;
    quPrihodKol: TFloatField;
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure fmOtchet6BeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure quRashodCalcFields(DataSet: TDataSet);
    procedure QRLabel9Print(sender: TObject; var Value: String);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel10Print(sender: TObject; var Value: String);
  private
    Nac:double;
    DateBegin,DateEnd,DatePrihod:TDate;
  public

  end;

var
  fmOtchet6: TfmOtchet6;
  procedure OtchetNacenkaTovar;
implementation

uses GetDate0;

{$R *.DFM}
procedure OtchetNacenkaTovar;
var
 Period:TPeriodDate;
 AvgPrice,Summa,Kol:double;
 TipPrice:string;
begin
 Period:=ZapDate(2);
 if Period[1]=0 then exit;
 Screen.Cursor:=crHourGlass;
 fmOtchet6:=TfmOtchet6.Create(Application);
 try
 fmOtchet6.Nac:=0;
 if Period[1]=Period[2] then
  fmOtchet6.QRLabel8.Caption:='Отчет по прибыли за '+DateToStr(Period[1])
 else
  fmOtchet6.QRLabel8.Caption:='Отчет по прибыли c '+DateToStr(Period[1])+' по '+DateToStr(Period[2]);

 with fmOtchet6 do
  begin
   DateBegin:=Period[1];
   DateEnd:=Period[2];
   if DateBegin=DateEnd then
    DatePrihod:=DateBegin-10
   else
    DatePrihod:=DateBegin;
   quRashod.ParamByName('DateBegin').AsDate:=DateBegin;
   quRashod.ParamByName('DateEnd').AsDate:=DateEnd;
   quPrihod.ParamByName('DateEnd').AsDate:=DateEnd;
   quRashod.Open;
   quPrihod.Open;
   while not quRashod.EOF do
    begin
//     if fmOtchet6.quRashodTovarNo.AsInteger=338 then ShowMessage('+');
     quPrihod.Locate('TovarNo',fmOtchet6.quRashodTovarNo.AsInteger,[]);
     AvgPrice:=0; Summa:=0; Kol:=0;
     while (quPrihodTovarNo.AsInteger=quRashodTovarNo.AsInteger) and
           (not quPrihod.Eof)                                    and
           (quPrihodDateNakl.AsDateTime>DatePrihod) do
      begin
       //считаю ср цену
       Summa:=Summa+quPrihodKol.AsFloat*quPrihodPrice.AsFloat;
       Kol:=Kol+quPrihodKol.AsFloat;
       quPrihod.Next;
      end;
     if Kol>0 then
      begin
       AvgPrice:=Summa/Kol;
       TipPrice:='Ср.';
      end;
     if AvgPrice=0 then
      begin
       if quPrihodTovarNo.AsInteger<>quRashodTovarNo.AsInteger then
        quPrihod.Prior;
       if quPrihodTovarNo.AsInteger=quRashodTovarNo.AsInteger then
        AvgPrice:=quPrihodPrice.AsFloat;
       TipPrice:='Посл.';
      end;
     quRashod.Edit;
     quRashodPriceIn.AsFloat:=AvgPrice;
     quRashodTipPrice.AsString:=TipPrice;
     quRashod.Post;

     quRashod.Next;
    end;
  end;
 Screen.Cursor:=crDefault;
 fmOtchet6.Preview;
 finally
 fmOtchet6.quRashod.Close;
 fmOtchet6.quPrihod.Close;
 fmOtchet6.Free;
 Screen.Cursor:=crDefault;
 end;
end;

procedure TfmOtchet6.QRLabel1Print(sender: TObject; var Value: String);
begin
 Value:=format('%.2n',[fmOtchet6.Nac]);
end;

procedure TfmOtchet6.fmOtchet6BeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
 fmOtchet6.Nac:=0;
end;

procedure TfmOtchet6.QRDBText4Print(sender: TObject; var Value: String);
begin
 fmOtchet6.Nac:=fmOtchet6.Nac+(quRashodSummaOut.AsFloat-(quRashodPriceIn.AsFloat*quRashodKol.AsFloat));
end;

procedure TfmOtchet6.quRashodCalcFields(DataSet: TDataSet);
begin
 quRashodSummaIn.AsFloat:=quRashodKol.AsFloat*quRashodPriceIn.AsFloat;
end;

procedure TfmOtchet6.QRLabel9Print(sender: TObject; var Value: String);
begin
 Value:=format('%.2f',[quRashodKol.AsFloat*quRashodPriceIn.AsFloat]);
end;

procedure TfmOtchet6.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 if quRashodPriceIn.AsFloat*quRashodKol.AsFloat>quRashodSummaOut.AsFloat then
  QRLabel9.Font.Color:=clRed
 else
  QRLabel9.Font.Color:=clBlack;
end;

procedure TfmOtchet6.QRLabel10Print(sender: TObject; var Value: String);
begin
 if quRashodKol.AsFloat>0 then
  Value:=format('%.3f',[quRashodSummaOut.AsFloat/quRashodKol.AsFloat])
 else
  Value:='';
end;

end.
