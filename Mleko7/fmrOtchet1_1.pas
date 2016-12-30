{ QuickReport list template }

unit fmrOtchet1_1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, DB, ExtCtrls, DBAccess, MsAccess, MemDS;

type
  TfmOtchet1_1 = class(TQuickRep)
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    TitleBand1: TQRBand;
    quNaklP: TMSQuery;
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
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    quNaklPNom: TIntegerField;
    quNaklPDateNakl: TDateTimeField;
    quNaklPSumma: TFloatField;
    quNaklPSummaDolg: TFloatField;
    quNaklPBuhName: TStringField;
    quNaklPName: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmOtchet1_1: TfmOtchet1_1;
implementation


{$R *.DFM}


end.
