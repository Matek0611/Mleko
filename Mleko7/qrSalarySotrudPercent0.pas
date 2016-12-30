unit qrSalarySotrudPercent0;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  ExtCtrls, Forms, Quickrpt, QRCtrls, Db, FR_DSet,
  FR_DBSet, FR_Class, MsAccess, MemDS, DBAccess;

type
  TqrSalarySotrudPercent = class(TQuickRep)
    quWork: TMSQuery;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    spSalarySotrudPlat: TMSStoredProc;
    spSalarySotrudPlatDatePlat: TDateTimeField;
    spSalarySotrudPlatSummaPlat: TFloatField;
    spSalarySotrudPlatName: TStringField;
    spSalarySotrudPlatNom: TIntegerField;
    spSalarySotrudPlatSummaToNakl: TFloatField;
    spSalarySotrudPlatGroupBy: TIntegerField;
    QRShape1: TQRShape;
    QRDBText1: TQRDBText;
    QRShape2: TQRShape;
    QRDBText2: TQRDBText;
    QRShape3: TQRShape;
    QRDBText3: TQRDBText;
    QRShape4: TQRShape;
    QRDBText4: TQRDBText;
    QRShape5: TQRShape;
    QRDBText5: TQRDBText;
    QRShape6: TQRShape;
    QRDBText6: TQRDBText;
    QRShape7: TQRShape;
    QRDBText7: TQRDBText;
    QRGroup1: TQRGroup;
    quPercentsSalary: TMSQuery;
    quPercentsSalaryPercentNo: TSmallintField;
    quPercentsSalaryNamePercent: TStringField;
    spSalarySotrudPlatNamePercent: TStringField;
    QRShape8: TQRShape;
    QRDBText8: TQRDBText;
    QRBand3: TQRBand;
    QRShape12: TQRShape;
    QRLabel3: TQRLabel;
    QRShape13: TQRShape;
    QRLabel4: TQRLabel;
    QRShape9: TQRShape;
    QRLabel1: TQRLabel;
    QRShape10: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape11: TQRShape;
    QRShape14: TQRShape;
    QRLabel6: TQRLabel;
    QRShape15: TQRShape;
    QRLabel7: TQRLabel;
    QRShape16: TQRShape;
    QRLabel8: TQRLabel;
    QRShape17: TQRShape;
    QRLabel9: TQRLabel;
    QRShape18: TQRShape;
    QRLabel10: TQRLabel;
    QRShape19: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRLabel13: TQRLabel;
    QRShape22: TQRShape;
    QRLabel14: TQRLabel;
    QRBand4: TQRBand;
    QRLabel15: TQRLabel;
    QRBand5: TQRBand;
    QRLabel17: TQRLabel;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRExpr2: TQRExpr;
    QRLabel16: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape29: TQRShape;
    QRLabel23: TQRLabel;
    spCountPercentSalaryForNakl: TMSStoredProc;
    spCountPercentSalaryForNaklPercentSalary: TFloatField;
    spSalarySotrudPlatNaklNo: TIntegerField;
    QRShape30: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRLabel28: TQRLabel;
    QRShape36: TQRShape;
    QRLabel29: TQRLabel;
    quPercentsSalaryValuePercent2: TFloatField;
    spSalarySotrudPlatValuePercent2: TFloatField;
    QRDBText11: TQRDBText;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    spSalarySotrudPlatDateNaklFirst: TDateTimeField;
    spSalarySotrudPlatKolDay: TFloatField;
    spSalarySotrudPlatColnPrice: TSmallintField;
    QRShape25: TQRShape;
    QRLabel18: TQRLabel;
    QRShape26: TQRShape;
    QRLabel19: TQRLabel;
    QRDBText9: TQRDBText;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    dsSalarySotrudPlat: TDataSource;
    spSalarySotrudPlatVip: TBooleanField;
    procedure QuickRepBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel18Print(sender: TObject; var Value: String);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel25Print(sender: TObject; var Value: String);
    procedure QRLabel30Print(sender: TObject; var Value: String);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel31Print(sender: TObject; var Value: String);
  private
    Summa,SummaSalary,SummaSalaryItog:double;
  public

  end;

var
  qrSalarySotrudPercent: TqrSalarySotrudPercent;
  procedure SalarySotrudPercent;

implementation

uses GetDate0, Sotrud0;

{$R *.DFM}
procedure SalarySotrudPercent;
var
 Period:TPeriodDate;
 SotrudNo:integer;
begin
 Period:=ZapDate(4);
 if Period[1]=0 then exit;

 SotrudNo:=Sotrud(True);
 if SotrudNo=0 then exit;

 Screen.Cursor:=crHourGlass;
 qrSalarySotrudPercent:=TqrSalarySotrudPercent.Create(Application);
 try
 with qrSalarySotrudPercent do
  begin
   quWork.SQL.Clear;
   quWork.SQL.Add('select SotrudName from Sotrud where SotrudNo=:SotrudNo');
   quWork.ParamByName('SotrudNo').AsInteger:=SotrudNo;
   quWork.Open;
   qrLabel22.Caption:=quWork.FieldByName('SotrudName').AsString+'  '+DateToStr(Period[1])+' - '+DateToStr(Period[2]);
   quWork.Close;
   quPercentsSalary.Open;
   spSalarySotrudPlat.ParamByName('DateBegin').AsDate:=Period[1];
   spSalarySotrudPlat.ParamByName('DateEnd').AsDate:=Period[2];
   spSalarySotrudPlat.ParamByName('SotrudNo').AsSmallInt:=SotrudNo;
   spSalarySotrudPlat.Open;
   Screen.Cursor:=crDefault;
  end;
 qrSalarySotrudPercent.Preview;
 finally
 qrSalarySotrudPercent.quPercentsSalary.Close;
 qrSalarySotrudPercent.spSalarySotrudPlat.Close;
 qrSalarySotrudPercent.Free;
 Screen.Cursor:=crDefault;
 end;
end;

procedure TqrSalarySotrudPercent.QuickRepBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
 Summa:=0; SummaSalary:=0; SummaSalaryItog:=0;
end;

procedure TqrSalarySotrudPercent.QRLabel18Print(sender: TObject;
  var Value: String);
begin
 Value:=format('%.2n',[Summa]);
end;

procedure TqrSalarySotrudPercent.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
 Percent:double;
begin
 spCountPercentSalaryForNakl.Close;
 spCountPercentSalaryForNakl.ParamByName('NaklNo').AsInteger:=spSalarySotrudPlatNaklNo.AsInteger;
 spCountPercentSalaryForNakl.Open;
 Percent:=spCountPercentSalaryForNaklPercentSalary.AsFloat;
 qrLabel23.Caption:=format('%.6n',[Percent]);
 qrLabel24.Caption:=format('%.2n',[(Percent/100)*spSalarySotrudPlatSummaToNakl.AsFloat]);
 SummaSalary:=SummaSalary+(Percent/100)*spSalarySotrudPlatSummaToNakl.AsFloat;
 spCountPercentSalaryForNakl.Close;

end;

procedure TqrSalarySotrudPercent.QRLabel25Print(sender: TObject;
  var Value: String);
begin
 Value:=format('%.2n',[SummaSalary]);
end;

procedure TqrSalarySotrudPercent.QRLabel30Print(sender: TObject;
  var Value: String);
var
 i:double;
begin
 i:=SummaSalary*(spSalarySotrudPlatValuePercent2.AsFloat/100);
 SummaSalaryItog:=SummaSalaryItog+i;
 Value:=format('%.2n',[i]);
end;

procedure TqrSalarySotrudPercent.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 SummaSalary:=0;
end;

procedure TqrSalarySotrudPercent.QRLabel31Print(sender: TObject;
  var Value: String);
begin
 Value:=format('%.2n',[SummaSalaryItog]);
end;





end.
