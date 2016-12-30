unit repDolgNam;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  ExtCtrls, Forms, MlekoForm, Quickrpt, QRCtrls, Db, MemDS, DBAccess,
  MSAccess;

type
  TqrDolgNam = class(TQuickRep)
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRBand3: TQRBand;
    QRShape1: TQRShape;
    QRExpr1: TQRExpr;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel9: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel11: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    quKassa: TMSQuery;
    quBank: TMSQuery;
    QRLabel3: TQRLabel;
    quKassaDolg: TBCDField;
    quBankDolg: TBCDField;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel11Print(sender: TObject; var Value: String);
    procedure qrDolgNamBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
    procedure qrDolgNamAfterPrint(Sender: TObject);
  private

  public

  end;

var
  qrDolgNam: TqrDolgNam;

implementation

uses DolgNam;

{$R *.DFM}

procedure TqrDolgNam.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var Srok:double;
begin
 QRDBText1.Font.Color:=clBlack;
 if fmDolgNam.quDolgDolg.AsFloat>0 then
 begin
  Srok:=Date-fmDolgNam.quDolgMinDate.AsDateTime;
  if Srok>0 then QRDBText1.Font.Color:=clBlue;
  if Srok>3 then QRDBText1.Font.Color:=clRed;
 end;
end;

procedure TqrDolgNam.QRLabel11Print(sender: TObject; var Value: String);
begin
 if fmDolgNam.quDolgDolg.AsFloat>0 then
  begin
   if fmDolgNam.quDolgPSrok.AsInteger>3 then Value:='! !'
   else
    if fmDolgNam.quDolgPSrok.AsInteger>0 then Value:='!';
  end;
end;

procedure TqrDolgNam.qrDolgNamBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
 quBank.Open;
 quKassa.Open;
end;

procedure TqrDolgNam.qrDolgNamAfterPrint(Sender: TObject);
begin
 quBank.Close;
 quKassa.Close;
end;

end.
