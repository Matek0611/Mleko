{ QuickReport list template }

unit fmrOtchet2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, DB, ExtCtrls, DBAccess, MsAccess, MemDS;

type
  TfmOtchet2 = class(TQuickRep)
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    quRashod: TMSQuery;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel8: TQRLabel;
    QRLabel1: TQRLabel;
    QRCompositeReport1: TQRCompositeReport;
    quRashodSumma: TFloatField;
    quRashodKol: TFloatField;
    quRashodNameTovar: TStringField;
    quRashodTovarNo: TSmallintField;
    procedure QRCompositeReport1AddReports(Sender: TObject);
    procedure QRLabel3Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
    SDate:string;
  end;

var
  fmOtchet2: TfmOtchet2;
  procedure OtchetRashod;
implementation

uses GetDate0, SelTip, fmrOtchet2_1;

{$R *.DFM}

procedure OtchetRashod;
var Period:TPeriodDate;
    Tip:string;
begin
 Period:=ZapDate(2);
 if Period[1]=0 then exit;

 Tip:=SelectTip;
 if Tip='' then exit;


 Screen.Cursor:=crHourGlass;
 fmOtchet2:=TfmOtchet2.Create(Application);
 fmOtchet2_1:=TfmOtchet2_1.Create(Application);
 try
 if Period[1]=Period[2] then
  fmOtchet2.SDate:='за '+DateToStr(Period[1])
 else
  fmOtchet2.SDate:='c '+DateToStr(Period[1])+' по '+DateToStr(Period[2]);

 fmOtchet2.quRashod.ParamByName('DateBegin').AsDate:=Period[1];
 fmOtchet2.quRashod.ParamByName('DateEnd').AsDate:=Period[2];
 fmOtchet2.quRashod.MacroByName('Tip').Value:=Tip;

 fmOtchet2_1.quPrihod.ParamByName('DateBegin').AsDate:=Period[1];
 fmOtchet2_1.quPrihod.ParamByName('DateEnd').AsDate:=Period[2];
 fmOtchet2_1.quPrihod.MacroByName('Tip').Value:=Tip;
 fmOtchet2.quRashod.Open;
 fmOtchet2_1.quPrihod.Open;
 Screen.Cursor:=crDefault;
 fmOtchet2.QRCompositeReport1.Preview;
 finally
 fmOtchet2.quRashod.Close;
 fmOtchet2_1.quPrihod.Close;
 fmOtchet2_1.Free;
 fmOtchet2.Free;
 end;
end;

procedure TfmOtchet2.QRCompositeReport1AddReports(Sender: TObject);
begin
 with Sender as TQRCompositeReport do
  begin
   Reports.Add(fmOtchet2_1);
   Reports.Add(fmOtchet2);
  end;
end;

procedure TfmOtchet2.QRLabel3Print(sender: TObject; var Value: String);
begin
 Value:=Value+' '+fmOtchet2.SDate;
end;

end.
