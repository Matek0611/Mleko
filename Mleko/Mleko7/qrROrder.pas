unit qrROrder;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  ExtCtrls, Forms, Quickrpt, QRCtrls, Db, MemDS, DBAccess,
  MSAccess;

type
  TqrRashOrder = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    QRShape4: TQRShape;
    QRLabel4: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRDBText4: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel35: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel37: TQRLabel;
    quPlatR: TMSQuery;
    quPlatRNom: TIntegerField;
    quPlatRDatePlat: TDateTimeField;
    quSelfPost: TMSQuery;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    quSelfPostOKPO: TStringField;
    quPlatRSumma: TFloatField;
    quPlatRSpravka: TStringField;
    quPlatRNameLong: TStringField;
    quSelfPostNameLong: TStringField;
    procedure QRLabel32Print(sender: TObject; var Value: String);
    procedure QRLabel7Print(sender: TObject; var Value: String);
    procedure QRLabel8Print(sender: TObject; var Value: String);
    procedure QRLabel37Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qrRashOrder: TqrRashOrder;
  procedure PrintRashOrder(PlatNo:integer);
implementation

uses UtilsDataConvert, data;
{$R *.DFM}
procedure PrintRashOrder(PlatNo:integer);
begin
 qrRashOrder:=TqrRashOrder.Create(Application);
 try
 with qrRashOrder do
  begin
   quPlatR.ParamByName('PlatNo').AsInteger:=PlatNo;
   quPlatR.Open;
   quSelfPost.ParamByName('PostNo').AsInteger:=dmDataModule.FirmNo;
   quSelfPost.Open;
  end;
 qrRashOrder.Preview;
 finally
 qrRashOrder.quPlatR.Close;
 qrRashOrder.quSelfPost.Close;
 qrRashOrder.Free;
 end;
end;

procedure TqrRashOrder.QRLabel32Print(sender: TObject; var Value: String);
var
 Year, Month, Day: Word;
begin
 DeCodeDate(quPlatRDatePlat.AsDateTime,Year, Month, Day);
 Value:=format('"%d" %s %d г.',[Day,MonthToString(Month,True),Year]);
end;

procedure TqrRashOrder.QRLabel7Print(sender: TObject; var Value: String);
var
 Year, Month, Day: Word;
begin
 DeCodeDate(quPlatRDatePlat.AsDateTime,Year, Month, Day);
 Value:=format('"%d" %s %d г.',[Day,MonthToString(Month,True),Year]);
end;

procedure TqrRashOrder.QRLabel8Print(sender: TObject; var Value: String);
begin
 Value:=IntToString(Trunc(quPlatRSumma.AsFloat))+
        format('грн. %.2d коп.',[Round(Frac(quPlatRSumma.AsFloat)*100)]);
end;

procedure TqrRashOrder.QRLabel37Print(sender: TObject; var Value: String);
begin
 Value:=FormatDateTime('dd.mm.yy',quPlatRDatePlat.AsDateTime);
end;

end.
