unit qrPrintOrder0;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, MlekoForm, Quickrpt, QRCtrls, Db, DBTables,
  MemDS, DBAccess, MSAccess;

type
  TqrPrintOrder = class(TQuickRep)
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel1: TQRLabel;
    quOstatok: TMSQuery;
    quOstatokPrice: TFloatField;
    quOstatokPrice1: TFloatField;
    quOstatokPrice2: TFloatField;
    quOstatokPrice3: TFloatField;
    quOstatokAvgPriceIn: TFloatField;
    quOstatokPrice4: TFloatField;
    QRBand3: TQRBand;
    QRLabel2: TQRLabel;
    QRBand4: TQRBand;
    QRLabel3: TQRLabel;
    QRShape8: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel17: TQRLabel;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure qrPrintOrderBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel2Print(sender: TObject; var Value: String);
  private
    SummaOut:Currency;
  public

  end;

var
  qrPrintOrder: TqrPrintOrder;

implementation

uses InputOrder0;

{$R *.DFM}

procedure TqrPrintOrder.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 PrintBand:=(fmInputOrder.spInputOrderKolOrd.AsCurrency<>0);
end;


procedure TqrPrintOrder.QRLabel1Print(sender: TObject; var Value: String);
var
 PriceOut:Currency;
begin
 PriceOut:=0;
 quOstatok.Close;
 quOstatok.ParamByName('TovarNo').AsInteger:=fmInputOrder.spInputOrderTovarNo.AsInteger;
 quOstatok.Open;
 case (fmInputOrder.cbColnPrice.ItemIndex+1) of
  1:PriceOut:=quOstatokPrice.AsFloat;
  2:PriceOut:=quOstatokPrice1.AsFloat;
  3:PriceOut:=quOstatokPrice2.AsFloat;
  4:PriceOut:=quOstatokPrice3.AsFloat;
  5:PriceOut:=quOstatokPrice4.AsFloat;
 end;
 quOstatok.Close;
 SummaOut:=SummaOut+fmInputOrder.spInputOrderKolOrd.AsCurrency*PriceOut;
 Value:=format('%.2n',[PriceOut]);
end;


procedure TqrPrintOrder.qrPrintOrderBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
 SummaOut:=0;
 QRLabel7.Caption:=fmInputOrder.RxDBGrid1.Columns[3].Title.Caption;
 QRLabel8.Caption:=fmInputOrder.RxDBGrid1.Columns[4].Title.Caption;
 QRLabel9.Caption:=fmInputOrder.RxDBGrid1.Columns[5].Title.Caption;
 QRLabel12.Caption:=fmInputOrder.edNamePost.Text;
 QRLabel14.Caption:=fmInputOrder.cbTip.Text;
 QRLabel16.Caption:=fmInputOrder.cbColnPrice.Text;
end;

procedure TqrPrintOrder.QRLabel2Print(sender: TObject; var Value: String);
begin
 Value:=format('%.2n',[SummaOut]);
end;


end.
