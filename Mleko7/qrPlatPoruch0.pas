unit qrPlatPoruch0;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  ExtCtrls, Forms, Quickrpt, QRCtrls, Db, MemDS, DBAccess,
  MSAccess;

type
  TqrPlatPoruch = class(TQuickRep)
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape10: TQRShape;
    QRLabel22: TQRLabel;
    QRDBText1: TQRDBText;
    QRLSumma: TQRLabel;
    QRLDate: TQRLabel;
    QRLSummaStr: TQRLabel;
    QRLMyKod: TQRLabel;
    QRLKod: TQRLabel;
    QRLMyMFO: TQRLabel;
    QRLMFO: TQRLabel;
    QRLBank: TQRLabel;
    QRLMyBank: TQRLabel;
    QRLMyRs: TQRLabel;
    QRLRS: TQRLabel;
    QRLMyName: TQRLabel;
    QRLName: TQRLabel;
    QRDBText3: TQRDBText;
    QRLAddrBank: TQRLabel;
    QRLMyAddrBank: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRShape21: TQRShape;
    QRLabel47: TQRLabel;
    QRDBText2: TQRDBText;
    QRLSumma2: TQRLabel;
    QRLDate2: TQRLabel;
    QRLSummaStr2: TQRLabel;
    QRLMyKod2: TQRLabel;
    QRLKod2: TQRLabel;
    QRLMyMFO2: TQRLabel;
    QRLMFO2: TQRLabel;
    QRLBank2: TQRLabel;
    QRLMyBank2: TQRLabel;
    QRLMyRs2: TQRLabel;
    QRLRS2: TQRLabel;
    QRLMyName2: TQRLabel;
    QRLName2: TQRLabel;
    QRDBText4: TQRDBText;
    QRLAddrBank2: TQRLabel;
    QRLMyAddrBank2: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRShape23: TQRShape;
    quPlatR: TMSQuery;
    quPlatRNom: TIntegerField;
    quPlatRDatePlat: TDateTimeField;
    quPlatRSumma: TFloatField;
    quPost: TMSQuery;
    quWork: TMSQuery;
    quPlatRPostNo: TSmallintField;
    QRShape9: TQRShape;
    QRShape11: TQRShape;
    QRShape20: TQRShape;
    QRShape22: TQRShape;
    quPlatRSpravka: TStringField;
    procedure qrPlatPoruchBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  qrPlatPoruch: TqrPlatPoruch;
  procedure PrintPlatPoruch(PlatNo:integer);
implementation

uses  UtilsDataConvert, data;

{$R *.DFM}
procedure PrintPlatPoruch(PlatNo:integer);
begin
 qrPlatPoruch:=TqrPlatPoruch.Create(Application);
 try
 with qrPlatPoruch do
  begin
   quPlatR.ParamByName('PlatNo').AsInteger:=PlatNo;
   quPlatR.Open;
  end;
 qrPlatPoruch.Preview;
 finally
 qrPlatPoruch.quPlatR.Close;
 qrPlatPoruch.Free;
 end;
end;

procedure TqrPlatPoruch.qrPlatPoruchBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
 Year, Month, Day: Word;
begin
   DeCodeDate(quPlatRDatePlat.AsDateTime,Year, Month, Day);
   QRLDate.Caption:=format('"%d " %s %d р.',[Day,MonthToStringUkr(Month,True),Year]);
   QRLDate2.Caption:=format('"%d " %s %d р.',[Day,MonthToStringUkr(Month,True),Year]);
   QRLSumma.Caption:=format('%d,%.2d',[Trunc(quPlatRSumma.AsFloat),Round((Frac(quPlatRSumma.AsFloat))*100)]);
   QRLSumma2.Caption:=format('%d,%.2d',[Trunc(quPlatRSumma.AsFloat),Round((Frac(quPlatRSumma.AsFloat))*100)]);
   QRLSummaStr.Caption:=IntToStringUkr(Trunc(quPlatRSumma.AsFloat))+' грн. '+
   format('%.2d',[Round(Frac(quPlatRSumma.AsFloat)*100)])+' коп.';
   QRLSummaStr2.Caption:=IntToStringUkr(Trunc(quPlatRSumma.AsFloat))+' грн. '+
   format('%.2d',[Round(Frac(quPlatRSumma.AsFloat)*100)])+' коп.';

   quPost.ParamByName('PostNo').AsInteger:=dmDataModule.FirmNo;
   quPost.Open;
   QRLMyName.Caption:=quPost.FieldByName('NameLong').AsString;
   QRLMyName2.Caption:=quPost.FieldByName('NameLong').AsString;
   QRLMyKod.Caption:=quPost.FieldByName('OKPO').AsString;
   QRLMyKod2.Caption:=quPost.FieldByName('OKPO').AsString;
   QRLMyBank.Caption:=quPost.FieldByName('NameBank').AsString;
   QRLMyBank2.Caption:=quPost.FieldByName('NameBank').AsString;
   QRLMyRs.Caption:=quPost.FieldByName('Rs').AsString;
   QRLMyRs2.Caption:=quPost.FieldByName('Rs').AsString;
   QRLMyAddrBank.Caption:=quPost.FieldByName('ADDRESSBANK').AsString;
   QRLMyAddrBank2.Caption:=quPost.FieldByName('ADDRESSBANK').AsString;
   QRLMyMFO.Caption:=quPost.FieldByName('MFO').AsString;
   QRLMyMFO2.Caption:=quPost.FieldByName('MFO').AsString;;
   quPost.Close;


   quPost.ParamByName('PostNo').AsInteger:=quPlatRPostNo.AsInteger;
   quPost.Open;
   QRLName.Caption:=quPost.FieldByName('NameLong').AsString;
   QRLName2.Caption:=quPost.FieldByName('NameLong').AsString;
   QRLKod.Caption:=quPost.FieldByName('OKPO').AsString;
   QRLKod2.Caption:=quPost.FieldByName('OKPO').AsString;
   QRLBank.Caption:=quPost.FieldByName('NameBank').AsString;
   QRLBank2.Caption:=quPost.FieldByName('NameBank').AsString;
   QRLMFO.Caption:=quPost.FieldByName('MFO').AsString;
   QRLMFO2.Caption:=quPost.FieldByName('MFO').AsString;
   QRLRs.Caption:=quPost.FieldByName('Rs').AsString;
   QRLRs2.Caption:=quPost.FieldByName('Rs').AsString;
   QRLAddrBank.Caption:=quPost.FieldByName('ADDRESSBANK').AsString;
   QRLAddrBank2.Caption:=quPost.FieldByName('ADDRESSBANK').AsString;
   quPost.Close;
end;


end.
