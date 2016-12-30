unit qrNaklSvor0;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBAccess, MsAccess, MemDS;

type
  TqrNaklSvor = class(TQuickRep)
    quNaklR: TMSQuery;
    quNaklRName: TStringField;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRExpr3: TQRExpr;
    quNaklRPostNo: TSmallintField;
    quNaklRSumma: TFloatField;
  private

  public

  end;

var
  qrNaklSvor: TqrNaklSvor;
  procedure NaklRSvor;
implementation

uses GetDate0, SelTip;

{$R *.DFM}
procedure NaklRSvor;
var
 Period:TPeriodDate;
 Tip:string;
begin
 Period:=ZapDate(4);
 if Period[1]=0 then exit;
 Tip:=SelectTip;
 if Tip='' then exit;

 Screen.Cursor:=crHourGlass;
 qrNaklSvor:=TqrNaklSvor.Create(Application);
 try
 qrNaklSvor.QRLabel3.Caption:='Отчет по расходу за период с '+DateToStr(Period[1])+' по '+DateToStr(Period[2]);
 qrNaklSvor.quNaklR.MacroByName('_Buh').Value:=Tip;
 qrNaklSvor.quNaklR.ParamByName('DateBegin').AsDate:=Period[1];
 qrNaklSvor.quNaklR.ParamByName('DateEnd').AsDate:=Period[2];
 qrNaklSvor.quNaklR.Open;
 Screen.Cursor:=crDefault;
 qrNaklSvor.Preview;
 finally
 Screen.Cursor:=crDefault;
 qrNaklSvor.quNaklR.Close;
 qrNaklSvor.Free;
 end;
end;
end.
