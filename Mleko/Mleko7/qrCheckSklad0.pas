unit qrCheckSklad0;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  ExtCtrls, Forms, Quickrpt, QRCtrls, Db, MemDS, DBAccess,
  MSAccess;

type
  TqrCheckSklad = class(TQuickRep)
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRSysData1: TQRSysData;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText5: TQRDBText;
    QRBand3: TQRBand;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel12: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel13: TQRLabel;
    QRShape1: TQRShape;
    QRLabel14: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText8: TQRDBText;
    quNaklR: TMSQuery;
    quRashod: TMSQuery;
    quNaklRNom: TIntegerField;
    quNaklRDateNakl: TDateTimeField;
    quNaklRSumma: TFloatField;
    quNaklRName: TStringField;
    quRashodNameTovar: TStringField;
    quRashodKolPerPak: TSmallintField;
    quRashodVidName: TStringField;
    quRashodNameCompany: TStringField;
    quRashodKol: TFloatField;
    quRashodPriceOut: TFloatField;
    QRDBText9: TQRDBText;
    procedure QRLabel2Print(sender: TObject; var Value: String);
    procedure qrCheckSkladBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel14Print(sender: TObject; var Value: String);
  private
    KolPak:double;
  public

  end;

var
  qrCheckSklad: TqrCheckSklad;
  procedure PrintCheckSklad(NaklNo:integer);
implementation


{$R *.DFM}
procedure PrintCheckSklad(NaklNo:integer);
begin
 qrCheckSklad:=TqrCheckSklad.Create(Application);
 try
 with qrCheckSklad do
  begin
   quNaklR.ParamByName('NaklNo').AsInteger:=NaklNo;
   quNaklR.Open;
   quRashod.ParamByName('NaklNo').AsInteger:=NaklNo;
   quRashod.Open;
  end;
 qrCheckSklad.Preview;
 finally
 qrCheckSklad.quNaklR.Close;
 qrCheckSklad.quRashod.Close;
 qrCheckSklad.Free;
 end;
end;

procedure TqrCheckSklad.QRLabel2Print(sender: TObject; var Value: String);
begin
 Value:='';
 if quRashodKolPerPak.AsInteger>0 then
  begin
   Value:=IntToStr(quRashodKol.AsInteger div quRashodKolPerPak.AsInteger);
   qrCheckSklad.KolPak:=qrCheckSklad.KolPak+quRashodKol.AsFloat/quRashodKolPerPak.AsInteger;
   if (quRashodKol.AsInteger mod quRashodKolPerPak.AsInteger)>0 then
    Value:=Value+'+('+IntToStr(quRashodKol.AsInteger mod quRashodKolPerPak.AsInteger)+')';
  end;
end;


procedure TqrCheckSklad.qrCheckSkladBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
 KolPak:=0;
end;

procedure TqrCheckSklad.QRLabel14Print(sender: TObject; var Value: String);
begin
 Value:=format('%.0f',[qrCheckSklad.KolPak]);
end;

end.
