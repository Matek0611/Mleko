unit qrSotrudPlat0;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBAccess, MsAccess, MemDS;

type
  TqrSotrudPlat = class(TQuickRep)
    quPlatP: TMSQuery;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel9: TQRLabel;
    quWork: TMSQuery;
    quPlatPNom: TIntegerField;
    quPlatPDatePlat: TDateTimeField;
    quPlatPSumma: TFloatField;
    quPlatPSpravka: TStringField;
    quPlatPBuhName: TStringField;
    quPlatPNamePost: TStringField;
  private

  public

  end;

var
  qrSotrudPlat: TqrSotrudPlat;
  procedure SotrudPlat;

implementation

uses GetDate0, Sotrud0 , SelTip;

{$R *.DFM}
procedure SotrudPlat;
var
 Period:TPeriodDate;
 SotrudNo:integer;
 Tip:string;
begin
 SotrudNo:=Sotrud(True);
 if SotrudNo=0 then exit;

 Period:=ZapDate(4);
 if Period[1]=0 then Exit;

 Tip:=SelectTip;
 if Tip='' then exit;

 qrSotrudPlat:=TqrSotrudPlat.Create(Application);
 Screen.Cursor:=crHourGlass;
 try
 with qrSotrudPlat do
  begin
   if Period[1]=Period[2] then
    qrSotrudPlat.QRLabel1.Caption:=qrSotrudPlat.QRLabel1.Caption+' за '+DateToStr(Period[1])
   else
    qrSotrudPlat.QRLabel1.Caption:=qrSotrudPlat.QRLabel1.Caption+' c '+DateToStr(Period[1])+' по '+DateToStr(Period[2]);

   quWork.SQL.Clear;
   quWork.SQL.Add('select SotrudName from Sotrud where SotrudNo=:SotrudNo');
   quWork.ParamByName('SotrudNo').AsInteger:=SotrudNo;
   quWork.Open;
   QRLabel3.Caption:=quWork.FieldByName('SotrudName').AsString;
   quWork.Close;
  end;

 qrSotrudPlat.quPlatP.ParamByName('SotrudNo').AsInteger:=SotrudNo;
 qrSotrudPlat.quPlatP.ParamByName('DateBegin').AsDate:=Period[1];
 qrSotrudPlat.quPlatP.ParamByName('DateEnd').AsDate:=Period[2];
 qrSotrudPlat.quPlatP.MacroByName('Tip').Value:=Tip;
 qrSotrudPlat.quPlatP.Open;
 Screen.Cursor:=crDefault;
 qrSotrudPlat.Preview;
 finally
 Screen.Cursor:=crDefault;
 qrSotrudPlat.quPlatP.Close;
 qrSotrudPlat.Free;
 end;
end;


end.
