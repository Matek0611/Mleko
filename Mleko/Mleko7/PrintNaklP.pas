unit PrintNaklP;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  ExtCtrls, Forms, MlekoForm, Quickrpt, QRCtrls, Db, MemDS, DBAccess,
  MsAccess, ActnList;

type
  TfmrNaklP = class(TMlekoForm)
    QuickRep1 : TQuickRep;
    ColumnHeaderBand1 : TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRBand1: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRBand2: TQRBand;
    QRLabel4: TQRLabel;
    qrSumma: TQRLabel;
    QRShape2: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRDBText8: TQRDBText;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    qrlPriceNoNDS: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape9: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape10: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    quPrihod: TMSQuery;
    quNaklP: TMSQuery;
    quNaklPDateNakl: TDateTimeField;
    quNaklPNom: TIntegerField;
    quNaklPSumma: TFloatField;
    quNaklPNameLong: TStringField;
    QRDBText3: TQRDBText;
    quPrihodNameTovar: TStringField;
    quPrihodVidName: TStringField;
    quPrihodPriceWithNDS: TBooleanField;
    quPrihodKol: TFloatField;
    quPrihodPrice: TFloatField;
    quNaklPDogovorNo: TStringField;
    quNaklPDateDogovor: TDateTimeField;
    quNaklPVidNaklNo: TSmallintField;
    quNaklPPostNameLong: TStringField;
    procedure qrlPriceNoNDSPrint(sender: TObject; var Value: String);
    procedure QRLabel15Print(sender: TObject; var Value: String);
    procedure QRLabel18Print(sender: TObject; var Value: String);
    procedure QRLabel19Print(sender: TObject; var Value: String);
    procedure QRLabel20Print(sender: TObject; var Value: String);
    procedure QRLabel21Print(sender: TObject; var Value: String);
    procedure QRLabel22Print(sender: TObject; var Value: String);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    SumNDS,SumNakl,Kol:double;
  end;

var
  fmrNaklP: TfmrNaklP;
  procedure PrintNaklPrih(NaklNo:integer);
implementation

uses data, UtilsDataConvert, GetSpravka3;

{$R *.DFM}
procedure PrintNaklPrih(NaklNo:integer);
begin
 Screen.Cursor:=crHourGlass;
 fmrNaklP:=TfmrNaklP.Create(Application);
 fmGetSpravka3:=TfmGetSpravka3.Create(Application);
 try
 with fmrNaklP do
  begin
   quNaklP.ParamByName('NaklNo').AsInteger:=NaklNo;
   quNaklP.ParamByName('FirmNo').AsInteger:=dmDataModule.FirmNo;
   quNaklP.Open;
   quPrihod.ParamByName('NaklNo').AsInteger:=NaklNo;
   quPrihod.Open;
   fmGetSpravka3.edDogovor.Text:='Договор купли-продажи №'+quNaklPDogovorNo.AsString+' от '+quNaklPDateDogovor.AsString;
  end;
 if fmGetSpravka3.ShowModal=mrOk then
  fmrNaklP.QRLabel29.Caption:=fmGetSpravka3.edDogovor.Text;
 if fmrNaklP.quNaklPVidNaklNo.AsInteger=3 then fmrNaklP.QRLabel1.Caption:='Возвратная накладная №';
 Screen.Cursor:=crDefault;
 fmrNaklP.QuickRep1.Preview;
 finally
 fmrNaklP.quNaklP.Close;
 fmrNaklP.quPrihod.Close;
 fmrNaklP.Free;
 fmGetSpravka3.Free;
 end;
end;

procedure TfmrNaklP.qrlPriceNoNDSPrint(sender: TObject; var Value: String);
begin
 if quPrihodPriceWithNDS.AsBoolean then
   Value:=Format('%.6f',[quPrihodPrice.AsFloat/1.2])
  else
   Value:=Format('%.6f',[quPrihodPrice.AsFloat]);
// fmrNaklP.SumNds:= fmrNaklP.SumNds+abs(StrToFloat(Value)*quPrihodKol.AsFloat);
 fmrNaklP.Kol:=fmrNaklP.Kol+quPrihodKol.AsFloat;
end;

procedure TfmrNaklP.QRLabel15Print(sender: TObject; var Value: String);
begin
 Value:=format('%.3f',[abs(fmrNaklP.SumNds)]);
end;

procedure TfmrNaklP.QRLabel18Print(sender: TObject; var Value: String);
begin
 Value:=format('%.3f',[abs(fmrNaklP.SumNakl-fmrNaklP.SumNds)])
end;

procedure TfmrNaklP.QRLabel19Print(sender: TObject; var Value: String);
begin
 Value:=format('%.2f',[abs(fmrNaklP.Kol)])
end;

procedure TfmrNaklP.QRLabel20Print(sender: TObject; var Value: String);
begin
 Value:=IntToString(Trunc(abs(fmrNaklP.SumNakl)))+' грн. '+
 format('%.2d коп.',[Round(Frac(abs(fmrNaklP.SumNakl))*100)])
end;

procedure TfmrNaklP.QRLabel21Print(sender: TObject; var Value: String);
begin
 Value:='('+IntToString(Trunc(fmrNaklP.Kol))+')';
end;

procedure TfmrNaklP.QRLabel22Print(sender: TObject; var Value: String);
begin
 if quPrihodPriceWithNDS.AsBoolean then
  Value:=format('%.6f',[(round((quPrihodPrice.AsFloat/1.2)*1000000)/1000000)*quPrihodKol.AsFloat])
  else
   Value:=format('%.6f',[quPrihodPrice.AsFloat*quPrihodKol.AsFloat]);
end;

procedure TfmrNaklP.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
 fmrNaklP.SumNds:=0;
 fmrNaklP.Kol:=0;
 fmrNaklP.SumNakl:=abs(quNaklPSumma.AsFloat);
 fmrNaklP.SumNds:=fmrNaklP.SumNakl/1.2;
 fmrNaklP.qrSumma.Caption:=Format('%.2f',[fmrNaklP.SumNakl]);


 dmDataModule.quPost.ParamByName('PostNo').AsInteger:=dmDataModule.FirmNo;
 dmDataModule.quPost.Open;
 if quNaklPVidNaklNo.AsInteger=3 then QRLabel10.Caption:=quNaklPPostNameLong.AsString else QRLabel10.Caption:=dmDataModule.quPost.FieldByName('NameLong').AsString;
 dmDataModule.quPost.Close;
end;

end.
