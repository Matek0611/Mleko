unit OtchetKassa0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  Db, FR_DSet, FR_DBSet, FR_Class, MemDS, DBAccess, MsAccess, ActnList;

type
  TfmOtchetKassa = class(TMlekoForm)
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
    quSaleCashSumma: TFloatField;
    quPlatPSumm: TMSQuery;
    quPlatRSumm: TMSQuery;
    quPlatPSummSumm: TFloatField;
    quPlatRSummSumm: TFloatField;
    quPlatPUSD: TMSQuery;
    FloatField1: TFloatField;
    StringField3: TStringField;
    StringField4: TStringField;
    DateTimeField2: TDateTimeField;
    IntegerField2: TIntegerField;
    StringField5: TStringField;
    dsPlatPUSD: TDataSource;
    dsPlatRUSD: TDataSource;
    quPlatRUSD: TMSQuery;
    FloatField2: TFloatField;
    StringField6: TStringField;
    StringField7: TStringField;
    DateTimeField3: TDateTimeField;
    IntegerField3: TIntegerField;
    frDBDataSet3: TfrDBDataSet;
    frDBDataSet4: TfrDBDataSet;
    quPlatPSummUSD: TMSQuery;
    FloatField3: TFloatField;
    quPlatRSummUSD: TMSQuery;
    FloatField4: TFloatField;
    quPlatP: TMSQuery;
    FloatField5: TFloatField;
    StringField8: TStringField;
    StringField9: TStringField;
    DateTimeField4: TDateTimeField;
    IntegerField4: TIntegerField;
    StringField10: TStringField;
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure quPlatPBeforeOpen(DataSet: TDataSet);
    procedure quPlatRBeforeOpen(DataSet: TDataSet);
    procedure quPlatPSummBeforeOpen(DataSet: TDataSet);
    procedure quPlatRSummBeforeOpen(DataSet: TDataSet);
    procedure quPlatPUSDBeforeOpen(DataSet: TDataSet);
    procedure quPlatRUSDBeforeOpen(DataSet: TDataSet);
    procedure quPlatPSummUSDBeforeOpen(DataSet: TDataSet);
    procedure quPlatRSummUSDBeforeOpen(DataSet: TDataSet);
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

   quPlatPUSD.ParamByName('DateBegin').AsDate:=Period[1];
   quPlatPUSD.ParamByName('DateEnd').AsDate:=Period[2];
   quPlatPUSD.ParamByName('Buh').AsSmallInt:=Buh;
   quPlatPUSD.Open;

   quPlatPSumm.ParamByName('DateBegin').AsDate:=Period[1];
   quPlatPSumm.ParamByName('DateEnd').AsDate:=Period[2];
   quPlatPSumm.ParamByName('Buh').AsSmallInt:=Buh;
   quPlatPSumm.Open;

   quPlatPSummUSD.ParamByName('DateBegin').AsDate:=Period[1];
   quPlatPSummUSD.ParamByName('DateEnd').AsDate:=Period[2];
   quPlatPSummUSD.ParamByName('Buh').AsSmallInt:=Buh;
   quPlatPSummUSD.Open;

   quPlatR.ParamByName('DateBegin').AsDate:=Period[1];
   quPlatR.ParamByName('DateEnd').AsDate:=Period[2];
   quPlatR.ParamByName('Buh').AsSmallInt:=Buh;
   quPlatR.Open;

   quPlatRUSD.ParamByName('DateBegin').AsDate:=Period[1];
   quPlatRUSD.ParamByName('DateEnd').AsDate:=Period[2];
   quPlatRUSD.ParamByName('Buh').AsSmallInt:=Buh;
   quPlatRUSD.Open;

   quPlatRSumm.ParamByName('DateBegin').AsDate:=Period[1];
   quPlatRSumm.ParamByName('DateEnd').AsDate:=Period[2];
   quPlatRSumm.ParamByName('Buh').AsSmallInt:=Buh;
   quPlatRSumm.Open;

   quPlatRSummUSD.ParamByName('DateBegin').AsDate:=Period[1];
   quPlatRSummUSD.ParamByName('DateEnd').AsDate:=Period[2];
   quPlatRSummUSD.ParamByName('Buh').AsSmallInt:=Buh;
   quPlatRSummUSD.Open;

   quSaleCash.ParamByName('DateBegin').AsDate:=Period[1];
   quSaleCash.ParamByName('DateEnd').AsDate:=Period[2]+1;
   if Buh=3 then
    quSaleCash.Open;

   frReport1.LoadFromFile('OtchetKassa0.frf');
   Screen.Cursor:=crDefault;
   frReport1.DesignReport;
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

procedure TfmOtchetKassa.quPlatPUSDBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  quPlatPUSD.ParamByName('OurFirmNo').AsInteger:=dmDataModule.FirmNo;
end;

procedure TfmOtchetKassa.quPlatRUSDBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  quPlatRUSD.ParamByName('OurFirmNo').AsInteger:=dmDataModule.FirmNo;
end;

procedure TfmOtchetKassa.quPlatPSummUSDBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  quPlatPSummUSD.ParamByName('OurFirmNo').AsInteger:=dmDataModule.FirmNo;
end;

procedure TfmOtchetKassa.quPlatRSummUSDBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  quPlatRSummUSD.ParamByName('OurFirmNo').AsInteger:=dmDataModule.FirmNo;
end;

end.
