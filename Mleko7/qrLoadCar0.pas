unit qrLoadCar0;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  ExtCtrls, Forms, Quickrpt, QRCtrls, Db, 
  DBAccess, MsAccess, MemDS;

type
  TqrLoadCar = class(TQuickRep)
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    quRashod: TMSQuery;
    quRashodNameTovar: TStringField;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    quRashodKolPerPak: TSmallintField;
    QRDBText3: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRBand3: TQRBand;
    QRShape1: TQRShape;
    QRLabel14: TQRLabel;
    QRGroup1: TQRGroup;
    quRashodVidName: TStringField;
    QRDBText4: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel6: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    quRashodKol: TFloatField;
    quRashodNameCompany: TStringField;
    quRashodWeight: TFloatField;
    quRashodSumma: TFloatField;
    quNaklR: TMSQuery;
    quNaklRNom: TIntegerField;
    QRMemo1: TQRMemo;
    QRLabel1: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    procedure QRLabel7Print(sender: TObject; var Value: String);
    procedure QRLabel14Print(sender: TObject; var Value: String);
    procedure qrLoadCarBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel12Print(sender: TObject; var Value: String);
  private
   KolPak:double;
  public

  end;

var
  qrLoadCar: TqrLoadCar;
  procedure LoadCar(Copies: Integer; Nakls, PostNoCar:string; DlgSpravkaShow, Preview: Boolean; Car, Expedition: String; DateBegin: TDate);
implementation

uses GetSpravka3;

{$R *.DFM}
procedure LoadCar(Copies: Integer; Nakls, PostNoCar:string; DlgSpravkaShow, Preview: Boolean; Car, Expedition: String; DateBegin: TDate);
var
 NaklNom:string;
begin
 qrLoadCar:=TqrLoadCar.Create(Application);
 fmGetSpravka3:=TfmGetSpravka3.Create(Application);
 try
 fmGetSpravka3.Label2.Caption:='Погрузка';
 if DlgSpravkaShow then
  begin
   fmGetSpravka3.edDogovor.Text:='Требование на погрузку от '+DateToStr(Date()+1);
   fmGetSpravka3.ShowModal;
  end;
 if DlgSpravkaShow then
  qrLoadCar.QRLabel3.Caption:=fmGetSpravka3.edDogovor.Text
 else
  qrLoadCar.QRLabel3.Caption:='Требование на погрузку от '+DateToStr(DateBegin);
 qrLoadCar.QRLabel16.Caption:=Car;
 qrLoadCar.QRLabel17.Caption:=Expedition;
 qrLoadCar.QRLabel18.Caption:=PostNoCar;
 Screen.Cursor:=crHourGlass;
 qrLoadCar.quRashod.MacroByName('Nakl').Value:=Nakls;
 qrLoadCar.quRashod.Open;
 qrLoadCar.quNaklR.MacroByName('Nakl').Value:=Nakls;
 qrLoadCar.quNaklR.Open;
 NaklNom:='';
 while not qrLoadCar.quNaklR.EOF do
  begin
   NaklNom:=NaklNom+qrLoadCar.quNaklRNom.AsString+', ';
   qrLoadCar.quNaklR.Next;
  end;
 qrLoadCar.QRMemo1.Lines.Text:=NaklNom;
 qrLoadCar.quNaklR.Close;
 Screen.Cursor:=crDefault;
 qrLoadCar.PrinterSettings.Copies:=Copies;
 if Preview then
  qrLoadCar.Preview
 else
  begin
   qrLoadCar.Print;
  end;

 finally
 qrLoadCar.quRashod.Close;
 qrLoadCar.quNaklR.Close;
 Screen.Cursor:=crDefault;
 qrLoadCar.Free;
 fmGetSpravka3.Free;
 end;
end;

procedure TqrLoadCar.QRLabel7Print(sender: TObject; var Value: String);
begin
 if quRashodKolPerPak.AsInteger>=1 then
  begin
   KolPak:=KolPak+quRashodKol.AsFloat/quRashodKolPerPak.AsInteger;
   Value:=IntToStr(quRashodKol.AsInteger div quRashodKolPerPak.AsInteger);
   if (quRashodKol.AsInteger mod quRashodKolPerPak.AsInteger)>0 then
    Value:=Value+'+('+IntToStr(quRashodKol.AsInteger mod qurashodKolPerPak.AsInteger)+')';
  end;

end;

procedure TqrLoadCar.QRLabel14Print(sender: TObject; var Value: String);
begin
 Value:=format('%.0f',[qrLoadCar.KolPak]);
end;

procedure TqrLoadCar.qrLoadCarBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
 KolPak:=0;
end;

procedure TqrLoadCar.QRLabel12Print(sender: TObject; var Value: String);
begin
 Value:=format('%.2f',[quRashodWeight.AsFloat/1000]);
end;


end.
