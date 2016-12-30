unit OtchetKassa0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  Db, FR_DSet, FR_DBSet, FR_Class, MemDS, DBAccess, MsAccess, ActnList;

type
  TfmOtchetKassa = class(TMlekoForm)
    quPlatP: TMSQuery;
    quPlatPSumma: TFloatField;
    quPlatPName: TStringField;
    quPlatPSpravka: TStringField;
    quPlatPDatePlat: TDateTimeField;
    quPlatPNom: TIntegerField;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    dsPlatP: TDataSource;
    quPlatR: TMSQuery;
    BCDField1: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    DateTimeField1: TDateTimeField;
    IntegerField1: TIntegerField;
    frDBDataSet2: TfrDBDataSet;
    dsPlatR: TDataSource;
    quSaleCash: TMSQuery;
    quPlatPNameBuh: TStringField;
    quSaleCashSumma: TFloatField;
    quPlatPSumm: TMSQuery;
    quPlatRSumm: TMSQuery;
    quPlatPSummSumm: TFloatField;
    quPlatRSummSumm: TFloatField;
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure quPlatPBeforeOpen(DataSet: TDataSet);
    procedure quPlatRBeforeOpen(DataSet: TDataSet);
    procedure quPlatPSummBeforeOpen(DataSet: TDataSet);
    procedure quPlatRSummBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    RepTitle:string;
  public
    { Public declarations }

  end;

var
  fmOtchetKassa: TfmOtchetKassa;
  BuhType: integer;
  procedure OtchetKassa(Buh:integer);
implementation

uses GetDate0, data;

{$R *.DFM}
procedure OtchetKassa(Buh:integer);
var
 Period:TPeriodDate;
begin
 Period:=ZapDate(2);
 if Period[1]=0 then exit;

 Screen.Cursor:=crHourGlass;
 fmOtchetKassa:=TfmOtchetKassa.Create(Application);
 try
 with fmOtchetKassa do
  begin
   BuhType:=Buh;
   Case Buh of
    1:RepTitle:='Отчет по Кассе за ';
    2:RepTitle:='Отчет по Банку за ';
    3:RepTitle:='Отчет по КассеБ за ';
   end;

   if Period[1]=Period[2] then
    RepTitle:=RepTitle+DateToStr(Period[1])
   else
    RepTitle:=RepTitle+'период с '+DateToStr(Period[1])+' по '+DateToStr(Period[2]);

   quPlatP.ParamByName('DateBegin').AsDate:=Period[1];
   quPlatP.ParamByName('DateEnd').AsDate:=Period[2];
   quPlatP.ParamByName('Buh').AsSmallInt:=Buh;
   quPlatP.Open;

   quPlatPSumm.ParamByName('DateBegin').AsDate:=Period[1];
   quPlatPSumm.ParamByName('DateEnd').AsDate:=Period[2];
   quPlatPSumm.ParamByName('Buh').AsSmallInt:=Buh;
   quPlatPSumm.Open;

   quPlatR.ParamByName('DateBegin').AsDate:=Period[1];
   quPlatR.ParamByName('DateEnd').AsDate:=Period[2];
   quPlatR.ParamByName('Buh').AsSmallInt:=Buh;
   quPlatR.Open;

   quPlatRSumm.ParamByName('DateBegin').AsDate:=Period[1];
   quPlatRSumm.ParamByName('DateEnd').AsDate:=Period[2];
   quPlatRSumm.ParamByName('Buh').AsSmallInt:=Buh;
   quPlatRSumm.Open;

   quSaleCash.ParamByName('DateBegin').AsDate:=Period[1];
   quSaleCash.ParamByName('DateEnd').AsDate:=Period[2]+1;
   if Buh=3 then
    quSaleCash.Open;

   frReport1.LoadFromFile('OtchetKassa0.frf');
   Screen.Cursor:=crDefault;
   frReport1.ShowReport;
  end
 finally
 Screen.Cursor:=crDefault;
 fmOtchetKassa.quPlatP.Close;
 fmOtchetKassa.quPlatR.Close;
 fmOtchetKassa.quSaleCash.Close;
 fmOtchetKassa.Free;
 end;
end;
procedure TfmOtchetKassa.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
 if ParName='RepTitle' then
  ParValue:=RepTitle;
 if ParName='Buh' then
  ParValue:=BuhType;
end;

procedure TfmOtchetKassa.quPlatPBeforeOpen(DataSet: TDataSet);
begin
  quPlatP.ParamByName('OurFirmNo').AsInteger:=dmDataModule.FirmNo;
end;

procedure TfmOtchetKassa.quPlatRBeforeOpen(DataSet: TDataSet);
begin
  quPlatR.ParamByName('OurFirmNo').AsInteger:=dmDataModule.FirmNo;
end;

procedure TfmOtchetKassa.quPlatPSummBeforeOpen(DataSet: TDataSet);
begin
  quPlatPSumm.ParamByName('OurFirmNo').AsInteger:=dmDataModule.FirmNo;
end;

procedure TfmOtchetKassa.quPlatRSummBeforeOpen(DataSet: TDataSet);
begin
  quPlatRSumm.ParamByName('OurFirmNo').AsInteger:=dmDataModule.FirmNo;
end;

end.
