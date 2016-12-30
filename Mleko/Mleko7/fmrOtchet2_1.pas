{ QuickReport list template }

unit fmrOtchet2_1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, DB, ExtCtrls, DBAccess, MsAccess, MemDS;

type
  TfmOtchet2_1 = class(TQuickRep)
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    quPrihod: TMSQuery;
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
    quPrihodSumma: TFloatField;
    quPrihodKol: TFloatField;
    quPrihodTovarNo: TSmallintField;
    quPrihodNameTovar: TStringField;
    procedure QRLabel3Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmOtchet2_1: TfmOtchet2_1;
implementation

uses fmrOtchet2;


{$R *.DFM}


procedure TfmOtchet2_1.QRLabel3Print(sender: TObject; var Value: String);
begin
 Value:=Value+' '+fmOtchet2.SDate;
end;

end.
