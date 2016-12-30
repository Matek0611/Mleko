unit qrKart3;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrKartTovar3 = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    procedure QRLabel2Print(sender: TObject; var Value: String);
  private

  public
  end;

var
  qrKartTovar3: TqrKartTovar3;

implementation

uses Kart;
{$R *.DFM}

procedure TqrKartTovar3.QRLabel2Print(sender: TObject; var Value: String);
begin
 Value:=format('%.2f',[Kart.KolOstatok]);
end;

end.
