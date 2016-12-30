{ QuickReport list template }

unit fmrOtchet1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, DB, ExtCtrls, DBAccess, MsAccess, MemDS;

type
  TfmOtchet1 = class(TQuickRep)
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    TitleBand1: TQRBand;
    quNaklR: TMSQuery;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRCompositeReport1: TQRCompositeReport;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    quNaklRDateNakl: TDateTimeField;
    quNaklRNom: TIntegerField;
    quNaklRSumma: TFloatField;
    quNaklRSummaDolg: TFloatField;
    quNaklRBuhName: TStringField;
    quNaklRNamePost: TStringField;
    procedure QRCompositeReport1AddReports(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmOtchet1: TfmOtchet1;
  procedure OtchetNaklR;
implementation

uses GetDate0, SelTip, fmrOtchet1_1;

{$R *.DFM}

procedure OtchetNaklR;
var
 Period:TPeriodDate;
 Tip:string;
begin
 Period:=ZapDate(2);
 if Period[1]=0 then exit;

 Tip:=SelectTip;
 if Tip='' then exit;

 Screen.Cursor:=crHourGlass;
 fmOtchet1:=TfmOtchet1.Create(Application);
 fmOtchet1_1:=TfmOtchet1_1.Create(Application);
 try
 if Period[1]=Period[2] then
  begin
   fmOtchet1.QRLabel3.Caption:='Отчет по накладным за '+DateToStr(Period[1]);
   fmOtchet1_1.QRLabel3.Caption:='Отчет по накладным за '+DateToStr(Period[1]);
  end
 else
  begin
   fmOtchet1.QRLabel3.Caption:='Отчет по накладным c '+DateToStr(Period[1])+' по '+DateToStr(Period[2]);
   fmOtchet1_1.QRLabel3.Caption:='Отчет по накладным c '+DateToStr(Period[1])+' по '+DateToStr(Period[2]);
  end;
 fmOtchet1.quNaklR.ParamByName('DateBegin').AsDate:=Period[1];
 fmOtchet1.quNaklR.ParamByName('DateEnd').AsDate:=Period[2];
 fmOtchet1.quNaklR.MacroByName('Tip').Value:=Tip;

 fmOtchet1_1.quNaklP.ParamByName('DateBegin').AsDate:=Period[1];
 fmOtchet1_1.quNaklP.ParamByName('DateEnd').AsDate:=Period[2];
 fmOtchet1_1.quNaklP.MacroByName('Tip').Value:=Tip;

 fmOtchet1.quNaklR.Open;
 fmOtchet1_1.quNaklP.Open;
 Screen.Cursor:=crDefault;
 fmOtchet1.QRCompositeReport1.Preview;
 finally
 Screen.Cursor:=crDefault;
 fmOtchet1.quNaklR.Close;
 fmOtchet1_1.quNaklP.Close;
 fmOtchet1_1.Free;
 fmOtchet1.Free;
 end;
end;

procedure TfmOtchet1.QRCompositeReport1AddReports(Sender: TObject);
begin
 with Sender as TQRCompositeReport do
  begin
   Reports.Add(fmOtchet1_1);
   Reports.Add(fmOtchet1);
  end;

end;

end.
