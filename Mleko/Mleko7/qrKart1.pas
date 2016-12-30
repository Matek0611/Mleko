unit qrKart1;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrKartTovar = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRBand3: TQRBand;
    QRLabel8: TQRLabel;
    crKart: TQRCompositeReport;
    QRExpr1: TQRExpr;
    procedure crKartAddReports(Sender: TObject);
  private

  public

  end;

var
  qrKartTovar: TqrKartTovar;

implementation

uses Kart, qrKart2, qrKart3;

{$R *.DFM}

procedure TqrKartTovar.crKartAddReports(Sender: TObject);
begin
  with Sender as TQRCompositeReport do
  begin
   Reports.Add(qrKartTovar);
   Reports.Add(qrKartTovar2);
   Reports.Add(qrKartTovar3);
  end;
end;

end.
