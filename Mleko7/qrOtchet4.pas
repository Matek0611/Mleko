{ QuickReport list template }

unit qrOtchet4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, DB, ExtCtrls, DBAccess, MsAccess, MemDS;

type
  TfmOtchet4 = class(TQuickRep)
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    quNaklR: TMSQuery;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel8: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel9: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    quWork: TMSQuery;
    quNaklRDateNakl: TDateTimeField;
    quNaklRNom: TIntegerField;
    quNaklRSumma: TFloatField;
    quNaklRSummaDolg: TFloatField;
    quNaklRBuhName: TStringField;
    quNaklRDateOpl: TDateTimeField;
    quNaklRRealDateOpl: TDateTimeField;
    quNaklRName: TStringField;
    quNaklRDelta: TIntegerField;
    procedure quNaklRCalcFields(DataSet: TDataSet);
    procedure QRLabel3Print(sender: TObject; var Value: String);
  private
    { Private declarations }
    SDate:string;
  public
    { Public declarations }
  end;

var
  fmOtchet4: TfmOtchet4;
  procedure OtchetSotrud;
implementation

uses GetDate0, Sotrud0, SelTip;

{$R *.DFM}


procedure OtchetSotrud;
var Period:TPeriodDate;
    SotrudNo:Integer;
    Tip:string;
begin
 SotrudNo:=Sotrud(True);
 if SotrudNo=0 then exit;

 Period:=ZapDate(4);
 if Period[1]=0 then exit;

 Tip:=SelectTip;
 if Tip='' then exit;

 Screen.Cursor:=crHourGlass;
 fmOtchet4:=TfmOtchet4.Create(Application);
 try
 if Period[1]=Period[2] then
  fmOtchet4.SDate:='за '+DateToStr(Period[1])
 else
  fmOtchet4.SDate:='c '+DateToStr(Period[1])+' по '+DateToStr(Period[2]);
 with fmOtchet4 do
  begin
   quNaklR.ParamByName('SotrudNo').AsInteger:=SotrudNo;
   quNaklR.ParamByName('DateBegin').AsDate:=Period[1];
   quNaklR.ParamByName('DateEnd').AsDate:=Period[2];
   quNaklR.Open;

   quWork.SQL.Clear;
   quWork.SQL.Add('select SotrudName from Sotrud where SotrudNo=:SotrudNo');
   quWork.ParamByName('SotrudNo').AsInteger:=SotrudNo;
   quWork.Open;
   QRLabel11.Caption:=quWork.FieldByName('SotrudName').AsString;
   quWork.Close;
  end;
 Screen.Cursor:=crDefault;
 fmOtchet4.Preview;
 finally
 Screen.Cursor:=crDefault;
 fmOtchet4.quNaklR.Close;
 fmOtchet4.Free;
 end;
end;

procedure TfmOtchet4.quNaklRCalcFields(DataSet: TDataSet);
begin
 if quNaklRDateOpl.AsFloat>0 then
  if quNaklRRealDateOpl.AsFloat>0 then
   quNaklRDelta.AsInteger:=Trunc(quNaklRRealDateOpl.AsFloat-quNaklRDateOpl.AsFloat)
  else
   quNaklRDelta.AsInteger:=Trunc(Date-quNaklRDateOpl.AsFloat)
 else
  quNaklRDelta.AsInteger:=0;
 if quNaklRDelta.AsInteger<0 then quNaklRDelta.AsInteger:=0;
end;

procedure TfmOtchet4.QRLabel3Print(sender: TObject; var Value: String);
begin
 Value:=Value+' '+fmOtchet4.SDate;
end;

end.
