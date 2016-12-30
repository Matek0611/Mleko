unit qrPOrder;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  ExtCtrls, Forms, Quickrpt, QRCtrls, Db, MemDS, DBAccess,
  MSAccess;

type
  TqrPrihOrder = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel7: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText3: TQRDBText;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape9: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    quPlatP: TMSQuery;
    quPlatPNom: TIntegerField;
    quPlatPDatePlat: TDateTimeField;
    QRDBText2: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    quPlatPTipPlat: TSmallintField;
    quPlatPSumma: TFloatField;
    quPlatPSpravka: TStringField;
    quPlatPNameLong: TStringField;
    procedure QRLabel7Print(sender: TObject; var Value: String);
    procedure QRLabel36Print(sender: TObject; var Value: String);
    procedure QRLabel37Print(sender: TObject; var Value: String);
    procedure QRLabel38Print(sender: TObject; var Value: String);
    procedure QRLabel23Print(sender: TObject; var Value: String);
  private
                  
  public

  end;

var
  qrPrihOrder: TqrPrihOrder;
  procedure PrintPrihOrder(PlatNo:integer);
implementation

uses UtilsDataConvert, data;
{$R *.DFM}
procedure PrintPrihOrder(PlatNo:integer);
begin
 qrPrihOrder:=TqrPrihOrder.Create(Application);
 try
 with qrPrihOrder do
  begin
   quPlatP.ParamByName('PlatNo').AsInteger:=PlatNo;
   quPlatP.Open;
   dmDataModule.quPost.ParamByName('PostNo').AsInteger:=dmDataModule.FirmNo;
   dmDataModule.quPost.Open;
  end;
 qrPrihOrder.Preview;
 finally
 qrPrihOrder.quPlatP.Close;
 dmDataModule.quPost.Close;
 qrPrihOrder.Free;
 end;
end;

procedure TqrPrihOrder.QRLabel7Print(sender: TObject; var Value: String);
begin
 Value:=IntToString(Trunc(quPlatPSumma.AsFloat))+' грн. '+
 format('%.2d коп.',[Round(Frac(quPlatPSumma.AsFloat)*100)]);
end;

procedure TqrPrihOrder.QRLabel36Print(sender: TObject; var Value: String);
begin
 Value:=IntToString(Trunc(quPlatPSumma.AsFloat))+' грн. '+
 format('%.2d коп.',[Round(Frac(quPlatPSumma.AsFloat)*100)]);
end;

procedure TqrPrihOrder.QRLabel37Print(sender: TObject; var Value: String);
var
 Year, Month, Day: Word;
begin
 DeCodeDate(quPlatPDatePlat.AsDateTime,Year, Month, Day);
 Value:=format('"%d" %s %d г.',[Day,MonthToString(Month,True),Year]);
end;

procedure TqrPrihOrder.QRLabel38Print(sender: TObject; var Value: String);
begin
 Value:=quPlatPNameLong.AsString
end;

procedure TqrPrihOrder.QRLabel23Print(sender: TObject; var Value: String);
begin
 Value:=quPlatPSpravka.AsString;
end;

end.
