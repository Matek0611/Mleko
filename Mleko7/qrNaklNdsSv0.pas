unit qrNaklNdsSv0;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  ExtCtrls, Forms, Quickrpt, QRCtrls, Dialogs, Db, MemDS,
  DBAccess, MSAccess;

type
  TqrNaklRNdsSV = class(TQuickRep)
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRBand1: TQRBand;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel68: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRBand2: TQRBand;
    QRLabel182: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel97: TQRLabel;
    QRLabel98: TQRLabel;
    QRBand3: TQRBand;
    QRLabel99: TQRLabel;
    QRLabel100: TQRLabel;
    QRLabel101: TQRLabel;
    QRLabel102: TQRLabel;
    QRLabel103: TQRLabel;
    QRLabel104: TQRLabel;
    QRLabel105: TQRLabel;
    QRLabel106: TQRLabel;
    QRLabel107: TQRLabel;
    QRLabel108: TQRLabel;
    QRLabel109: TQRLabel;
    QRLabel110: TQRLabel;
    QRLabel111: TQRLabel;
    QRLabel112: TQRLabel;
    QRLabel113: TQRLabel;
    QRLabel114: TQRLabel;
    QRLabel115: TQRLabel;
    QRLabel116: TQRLabel;
    QRLabel117: TQRLabel;
    QRLabel118: TQRLabel;
    QRLabel119: TQRLabel;
    QRLabel120: TQRLabel;
    QRLabel121: TQRLabel;
    QRLabel122: TQRLabel;
    QRLabel123: TQRLabel;
    QRLabel124: TQRLabel;
    QRLabel125: TQRLabel;
    QRLabel126: TQRLabel;
    QRLabel127: TQRLabel;
    QRLabel128: TQRLabel;
    QRLabel129: TQRLabel;
    QRLabel130: TQRLabel;
    QRLabel131: TQRLabel;
    QRLabel132: TQRLabel;
    QRLabel133: TQRLabel;
    QRLabel134: TQRLabel;
    QRLabel135: TQRLabel;
    QRLabel136: TQRLabel;
    QRLabel137: TQRLabel;
    QRLabel138: TQRLabel;
    QRLabel139: TQRLabel;
    QRLabel140: TQRLabel;
    QRLabel141: TQRLabel;
    QRLabel142: TQRLabel;
    QRLabel143: TQRLabel;
    QRLabel144: TQRLabel;
    QRLabel145: TQRLabel;
    QRLabel146: TQRLabel;
    QRLabel147: TQRLabel;
    QRLabel148: TQRLabel;
    QRLabel149: TQRLabel;
    QRLabel150: TQRLabel;
    QRLabel151: TQRLabel;
    QRLabel152: TQRLabel;
    QRLabel153: TQRLabel;
    QRLabel154: TQRLabel;
    QRLabel155: TQRLabel;
    QRLabel156: TQRLabel;
    QRLabel157: TQRLabel;
    QRLabel158: TQRLabel;
    QRLabel159: TQRLabel;
    QRLabel160: TQRLabel;
    QRLabel161: TQRLabel;
    QRLabel162: TQRLabel;
    QRLabel163: TQRLabel;
    QRLabel164: TQRLabel;
    QRLabel165: TQRLabel;
    QRLabel166: TQRLabel;
    QRLabel167: TQRLabel;
    QRLabel168: TQRLabel;
    QRLabel169: TQRLabel;
    QRLabel170: TQRLabel;
    QRLabel171: TQRLabel;
    QRLabel172: TQRLabel;
    QRLabel173: TQRLabel;
    QRLabel174: TQRLabel;
    QRLabel175: TQRLabel;
    QRLabel176: TQRLabel;
    QRLabel177: TQRLabel;
    QRLabel178: TQRLabel;
    QRLabel179: TQRLabel;
    QRLabel180: TQRLabel;
    QRLabel181: TQRLabel;
    QRLabel193: TQRLabel;
    QRLabel194: TQRLabel;
    QRLabel196: TQRLabel;
    QRShape15: TQRShape;
    QRLabel197: TQRLabel;
    QRLabel198: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape16: TQRShape;
    QRLabel7: TQRLabel;
    quRashod: TMSQuery;
    quRashodNameTovar: TStringField;
    quRashodKol: TFloatField;
    quRashodPrice: TFloatField;
    quRashodEdIzm: TStringField;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel9: TQRLabel;
    quNaklR: TMSQuery;
    quNaklRDateNakl: TDateTimeField;
    quNaklRSumma: TFloatField;
    quNaklRNom: TIntegerField;
    quNaklRNameLong: TStringField;
    quNaklRCodeNDS: TStringField;
    quNaklRNoSvidNDS: TStringField;
    quNaklRAddress: TStringField;
    quNaklRPhone: TStringField;
    quNaklRDogovorNo: TStringField;
    quNaklRDateDogovor: TDateTimeField;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel93Print(sender: TObject; var Value: String);
    procedure QRLabel94Print(sender: TObject; var Value: String);
    procedure QRLabel104Print(sender: TObject; var Value: String);
    procedure QRLabel155Print(sender: TObject; var Value: String);
    procedure QRLabel159Print(sender: TObject; var Value: String);
    procedure QRLabel108Print(sender: TObject; var Value: String);
    procedure QRLabel165Print(sender: TObject; var Value: String);
    procedure qrNaklRNdsNewBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel169Print(sender: TObject; var Value: String);
    procedure QRLabel179Print(sender: TObject; var Value: String);
    procedure qrNaklRNdsNewStartPage(Sender: TQuickRep);
    procedure QRLabel114Print(sender: TObject; var Value: String);
    procedure QRLabel118Print(sender: TObject; var Value: String);
    procedure QRLabel128Print(sender: TObject; var Value: String);
    procedure QRLabel175Print(sender: TObject; var Value: String);
    procedure QRLabel149Print(sender: TObject; var Value: String);
    procedure QRLabel145Print(sender: TObject; var Value: String);
  private
    SumNds,SumNakl,SumTransport,SumTara,SumSkidka:double;
  public

  end;

var
  qrNaklRNdsSV: TqrNaklRNdsSV;
  procedure PrintNaklNdsSvod(PostNo:integer);
implementation

uses data, GetSpravka, IniFiles, GetDate0;

{$R *.DFM}
procedure PrintNaklNdsSvod(PostNo:integer);
var
 Period:TPeriodDate;
begin
 Period:=ZapDate(4);
 if Period[1]=0 then exit;

 Screen.Cursor:=crHourGlass;
 qrNaklRNdsSV:=TqrNaklRNdsSV.Create(Application);
 fmGetSpravka:=TfmGetSpravka.Create(Application);
 try
 with qrNaklRNdsSv do
  begin
   QRLabel9.Caption:=DateToStr(Period[2]);
   QRLabel182.Caption:=DateToStr(Period[2]);
   quRashod.ParamByName('DateBegin').AsDate:=Period[1];
   quRashod.ParamByName('DateEnd').AsDate:=Period[2];
   quRashod.ParamByName('PostNo').Asinteger:=PostNo;
   quRashod.Open;

   fmGetSpravka.edDogovor.Text:=format('������� �����-������� � %s �� %s',[quNaklRDogovorNo.AsString,quNaklRDateDogovor.AsString]);
  end;
 fmGetSpravka.ShowModal;
 qrNaklRNdsSv.QRLabel64.Caption:=fmGetSpravka.edDogovor.Text;
 qrNaklRNdsSv.QRLabel66.Caption:=fmGetSpravka.cbForma.Text;
 Screen.Cursor:=crDefault;
 qrNaklRNdsSv.Preview;
 finally
 qrNaklRNdsSv.quRashod.Close;
 qrNaklRNdsSv.Free;
 fmGetSpravka.Free;
 end;
end;

procedure TqrNaklRNdsSV.QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
var
 KodNds:string [12];
begin
 KodNds:=quNaklRCodeNds.AsString;
 if length(Trim(KodNds))=0 then
  while Length(KodNds)<12 do KodNds:=' '+KodNds
 else
  while Length(KodNds)<12 do KodNds:='0'+KodNds;
 QRLabel196.Caption:=quNaklRNameLong.AsString;
 //��� ���
 QRLabel32.Caption:=KodNds[1];QRLabel33.Caption:=KodNds[2];QRLabel34.Caption:=KodNds[3];
 QRLabel35.Caption:=KodNds[4];QRLabel36.Caption:=KodNds[5];QRLabel37.Caption:=KodNds[6];
 QRLabel38.Caption:=KodNds[7];QRLabel39.Caption:=KodNds[8];QRLabel40.Caption:=KodNds[9];
 QRLabel41.Caption:=KodNds[10];QRLabel42.Caption:=KodNds[11];QRLabel43.Caption:=KodNds[12];
 //�����
 QRLabel51.Caption:=quNaklRAddress.AsString;
 QRLabel55.Caption:=quNaklRPhone.AsString;
 QRLabel59.Caption:=quNaklRNoSvidNds.AsString;

 dmDataModule.quPost.ParamByName('PostNo').AsInteger:=dmDataModule.FirmNo;
 dmDataModule.quPost.Open;
 KodNds:=dmDataModule.quPost.FieldByName('CodeNds').AsString;
 if length(Trim(KodNds))=0 then
  while Length(KodNds)<12 do KodNds:=' '+KodNds
 else
  while Length(KodNds)<12 do KodNds:='0'+KodNds;
 QRLabel15.Caption:=dmDataModule.quPost.FieldByName('NameLong').AsString;
 //��� ���
 QRLabel20.Caption:=KodNds[1];QRLabel21.Caption:=KodNds[2];QRLabel22.Caption:=KodNds[3];
 QRLabel23.Caption:=KodNds[4];QRLabel24.Caption:=KodNds[5];QRLabel25.Caption:=KodNds[6];
 QRLabel26.Caption:=KodNds[7];QRLabel27.Caption:=KodNds[8];QRLabel28.Caption:=KodNds[9];
 QRLabel29.Caption:=KodNds[10];QRLabel30.Caption:=KodNds[11];QRLabel31.Caption:=KodNds[12];
 //�����
 QRLabel50.Caption:=dmDataModule.quPost.FieldByName('Address').AsString;
 QRLabel54.Caption:=dmDataModule.quPost.FieldByName('Phone').AsString;
 QRLabel58.Caption:=dmDataModule.quPost.FieldByName('SvidNds').AsString;
 dmDataModule.quPost.Close;
end;

procedure TqrNaklRNdsSV.QRLabel93Print(sender: TObject; var Value: String);
begin
 Value:=Format('%.6f',[quRashodPrice.AsFloat/1.2]);
 qrNaklRNdsSv.SumNds:=qrNaklRNdsSv.SumNds+StrToFloat(Value)*quRashodKol.AsFloat;
 qrNaklRNdsSv.SumNakl:=qrNaklRNdsSv.SumNakl+(quRashodPrice.AsFloat*quRashodKol.AsFloat);
end;

procedure TqrNaklRNdsSV.QRLabel94Print(sender: TObject; var Value: String);
begin
 Value:=format('%.6f',[(round((quRashodPrice.AsFloat/1.2)*1000000)/1000000)*quRashodKol.AsFloat]);
end;

procedure TqrNaklRNdsSV.QRLabel104Print(sender: TObject; var Value: String);
begin
 Value:=format('%.3f',[qrNaklRNdsSv.SumNds]);
end;

procedure TqrNaklRNdsSV.QRLabel155Print(sender: TObject; var Value: String);
begin
 Value:=format('%.3f',[qrNaklRNdsSv.SumNds+qrNaklRNdsSv.SumTransport/1.2-
                       qrNaklRNdsSv.SumSkidka/1.2]);
end;

procedure TqrNaklRNdsSV.QRLabel159Print(sender: TObject; var Value: String);
begin
 Value:=format('%.2f',[qrNaklRNdsSv.SumNds+qrNaklRNdsSv.SumTransport/1.2-
                       qrNaklRNdsSv.SumSkidka/1.2]);
end;

procedure TqrNaklRNdsSV.QRLabel108Print(sender: TObject; var Value: String);
begin
 Value:=format('%.2f',[qrNaklRNdsSv.SumNds]);
end;

procedure TqrNaklRNdsSV.QRLabel165Print(sender: TObject; var Value: String);
begin
 Value:=format('%.3f',[(qrNaklRNdsSv.SumNakl-qrNaklRNdsSv.SumNds-
                        qrNaklRNdsSv.SumTara-
                        qrNaklRNdsSv.SumTransport/1.2+
                        qrNaklRNdsSv.SumSkidka/1.2)])
end;

procedure TqrNaklRNdsSV.qrNaklRNdsNewBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
var
 Ini:TIniFile;
begin
 Ini:=TIniFile.Create(ExtractFilePath(ParamStr(0))+'setup.ini');
 QRLabel6.Caption:=Ini.ReadString('Options','FIO','');
 Ini.Free;
 SumNakl:=0;
 SumTransport:=0;
 SumSkidka:=0;
 SumNds:=0;
 SumTara:=0;
end;

procedure TqrNaklRNdsSV.QRLabel169Print(sender: TObject; var Value: String);
begin
 Value:=format('%.2f',[(qrNaklRNdsSv.SumNakl-qrNaklRNdsSv.SumNds-
                        qrNaklRNdsSv.SumTara-
                        qrNaklRNdsSv.SumTransport/1.2+
                        qrNaklRNdsSv.SumSkidka/1.2)])
end;

procedure TqrNaklRNdsSV.QRLabel179Print(sender: TObject; var Value: String);
begin
 Value:=format('%.2f',[(qrNaklRNdsSv.SumNakl)])
end;

procedure TqrNaklRNdsSV.qrNaklRNdsNewStartPage(Sender: TQuickRep);
begin
 //ShowMessage(IntToStr(Ord(qrNaklRNdsNew.State)));
end;

procedure TqrNaklRNdsSV.QRLabel114Print(sender: TObject; var Value: String);
begin
 Value:=format('%.3f',[(qrNaklRNdsSv.SumTransport/1.2)])
end;

procedure TqrNaklRNdsSV.QRLabel118Print(sender: TObject; var Value: String);
begin
 Value:=format('%.2',[(qrNaklRNdsSv.SumTransport/1.2)])
end;

procedure TqrNaklRNdsSV.QRLabel128Print(sender: TObject; var Value: String);
begin
 Value:=format('%.2f',[(qrNaklRNdsSv.SumTara)]);
end;

procedure TqrNaklRNdsSV.QRLabel175Print(sender: TObject; var Value: String);
begin
 Value:=format('%.2f',[(qrNaklRNdsSv.SumNakl-qrNaklRNdsSv.SumTara)])
end;

procedure TqrNaklRNdsSV.QRLabel149Print(sender: TObject;
  var Value: String);
begin
 Value:=format('%.2f',[(qrNaklRNdsSv.SumSkidka/1.2)])
end;

procedure TqrNaklRNdsSV.QRLabel145Print(sender: TObject;
  var Value: String);
begin
 Value:=format('%.3f',[(qrNaklRNdsSv.SumSkidka/1.2)])
end;

end.
