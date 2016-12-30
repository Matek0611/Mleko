unit OthetBuh0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, DB, DBAccess, MsAccess, MemDS, FR_DSet, FR_DBSet, RxMemDS, DBTables,
  FR_Class, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, GridsEh, ActnList;

type
  TfmBuh_1 = class(TMlekoForm)
    Panel1: TPanel;
    bbExit: TBitBtn;
    BitBtn1: TBitBtn;
    DBGridEh1: TDBGridEh;
    dsCrossPostNaklR: TDataSource;
    frReport1: TfrReport;
    qListNakl: TMSQuery;
    mdBuh: TRxMemoryData;
    dsBuh: TDataSource;
    frDBDataSet2: TfrDBDataSet;
    BitBtn2: TBitBtn;
    qListPlatP: TMSQuery;
    qListPlatPPlatNo: TIntegerField;
    qListPlatPNom: TIntegerField;
    qListPlatPPostNo: TSmallintField;
    qListPlatPPostNoFirst: TSmallintField;
    qListPlatPDatePlat: TDateTimeField;
    qListPlatPSumma: TFloatField;
    qListPlatPSummaDolg: TFloatField;
    qListPlatPBuh: TSmallintField;
    qListPlatPSpravka: TStringField;
    qListPlatPTipPlat: TSmallintField;
    qListPlatPSummaPlat: TFloatField;
    qListPlatPDayDolg: TIntegerField;
    qListPlatPDateOpl: TDateTimeField;
    qListPlatPNaklNo: TIntegerField;
    qListNaklNaklNo: TIntegerField;
    qListNaklName: TStringField;
    qListNaklDateNakl: TDateTimeField;
    qListNaklNom: TIntegerField;
    qListNaklSumma: TFloatField;
    qListNaklDateOpl: TDateTimeField;
    qListNaklSummaDolg: TFloatField;
    qListNaklDayDolg: TIntegerField;
    qListNaklDateNaklFirst: TDateTimeField;
    procedure DBGridEh1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
type TPeriodBuh = array [1..2] of tDateTime;
var
  fmBuh_1: TfmBuh_1;
  ReportTitle: String;
  PeriodBuh: TPeriodBuh;
  procedure OthetBuh_1;

implementation
uses GetDate0, PlatNakl0, SelNakl0;

{$R *.dfm}
procedure OthetBuh_1;
var
 FindNameTovar: string;
 NakolNo,i: integer;
 RetSelNakl:TRetSelNakl;
begin
 RetSelNakl:=SelectNakl('-1',False);
 if RetSelNakl.PostNo=-1 then exit;
 if RetSelNakl.DateBegin=0 then exit;

 ReportTitle:='за период: '+DateToStr(RetSelNakl.DateBegin)+' - '+DateToStr(RetSelNakl.DateEnd);
 fmBuh_1:=TfmBuh_1.Create(Application);
 try
  fmBuh_1.qListNakl.Close;
  fmBuh_1.qListNakl.SQL.Clear;
  fmBuh_1.qListNakl.SQL.Add('SELECT NaklR.NaklNo, Post.Name, NaklR.DateNaklFirst, NaklR.DateNakl, NaklR.Nom, NaklR.Summa, NaklR.DateOpl, NaklR.SummaDolg, DATEDIFF(Day, NaklR.DateOpl, GETDATE()) AS DayDolg ');
  fmBuh_1.qListNakl.SQL.Append('FROM NaklR INNER JOIN Post ON NaklR.PostNoFirst = Post.PostNo ');
  fmBuh_1.qListNakl.SQL.Append('WHERE (NaklR.DateOpl>= :DateBegin) AND (NaklR.DateOpl<= :DateEnd)  AND (DATEDIFF([Day], NaklR.DateOpl, GETDATE()) >= 0) ');
  if RetSelNakl.PostNo>0 then
   fmBuh_1.qListNakl.SQL.Append('AND (NaklR.PostNo= :PostNo) ');
  fmBuh_1.qListNakl.SQL.Append('ORDER BY NaklR.NaklNo ');

  fmBuh_1.qListNakl.ParamByName('DateBegin').AsDate:=RetSelNakl.DateBegin;
  fmBuh_1.qListNakl.ParamByName('DateEnd').AsDate:=RetSelNakl.DateEnd;
  if RetSelNakl.PostNo>0 then
   fmBuh_1.qListNakl.ParamByName('PostNo').AsInteger:=RetSelNakl.PostNo;

  fmBuh_1.qListNakl.Open;

  if fmBuh_1.qListNakl.RecordCount=0 then exit;

  with fmBuh_1.mdBuh do begin
  Active := False;
  FieldDefs.Clear;
   with FieldDefs.AddFieldDef do
    begin
     Name := 'NaklNo';
     DataType := ftInteger;
//     Size := 20;
     Required := False;
    end;
   with FieldDefs.AddFieldDef do
    begin
     Name := 'PostName';
     DataType := ftString;
     Size := 60;
     Required := False;
    end;
   with FieldDefs.AddFieldDef do
    begin
     Name := 'NaklData';
     DataType := ftDate;
     Required := False;
    end;
   with FieldDefs.AddFieldDef do
    begin
     Name := 'NaklNom';
     DataType := ftString;
     Size := 20;
     Required := False;
    end;
   with FieldDefs.AddFieldDef do
    begin
     Name := 'NaklSumma';
     DataType := ftFloat;
     Required := False;
    end;
   with FieldDefs.AddFieldDef do
    begin
     Name := 'NaklDataOpl';
     DataType := ftDate;
     Required := False;
    end;
   with FieldDefs.AddFieldDef do
    begin
     Name := 'KolDay';
     DataType := ftInteger;
     Required := False;
    end;
   with FieldDefs.AddFieldDef do
    begin
     Name := 'NaklSummaDolg';
     DataType := ftFloat;
     Required := False;
    end;

   Active:=True;
   end;

//   NakolNo:=-1;
   fmBuh_1.qListNakl.First;
   While not fmBuh_1.qListNakl.Eof do
    begin
     if fmBuh_1.qListNaklSummaDolg.AsFloat>0 then
      begin
       fmBuh_1.mdBuh.Insert;
       fmBuh_1.mdBuh.FieldByName('NaklNo').AsInteger:=fmBuh_1.qListNaklNaklNo.AsInteger;
       fmBuh_1.mdBuh.FieldByName('PostName').AsString:=fmBuh_1.qListNaklName.AsString;
       fmBuh_1.mdBuh.FieldByName('NaklData').AsDateTime:=fmBuh_1.qListNaklDateNaklFirst.AsDateTime;
       fmBuh_1.mdBuh.FieldByName('NaklNom').AsString:=fmBuh_1.qListNaklNom.AsString;
       fmBuh_1.mdBuh.FieldByName('NaklSumma').AsFloat:=fmBuh_1.qListNaklSumma.AsFloat;
       fmBuh_1.mdBuh.FieldByName('NaklDataOpl').AsDateTime:=fmBuh_1.qListNaklDateOpl.AsDateTime;
       fmBuh_1.mdBuh.FieldByName('KolDay').AsInteger:=fmBuh_1.qListNaklDayDolg.AsInteger;
       fmBuh_1.mdBuh.FieldByName('NaklSummaDolg').AsFloat:=fmBuh_1.qListNaklSummaDolg.AsFloat;
      end
     else
      begin
       fmBuh_1.qListPlatP.Close;
       fmBuh_1.qListPlatP.ParamByName('NaklNo').AsInteger:=fmBuh_1.qListNaklNaklNo.AsInteger;
       fmBuh_1.qListPlatP.Open;
       fmBuh_1.qListPlatP.Last;
       if fmBuh_1.qListPlatPDatePlat.AsDateTime>=fmBuh_1.qListNaklDateOpl.AsDateTime then
        begin
         fmBuh_1.mdBuh.Insert;
         fmBuh_1.mdBuh.FieldByName('NaklNo').AsInteger:=fmBuh_1.qListNaklNaklNo.AsInteger;
         fmBuh_1.mdBuh.FieldByName('PostName').AsString:=fmBuh_1.qListNaklName.AsString;
         fmBuh_1.mdBuh.FieldByName('NaklData').AsDateTime:=fmBuh_1.qListNaklDateNaklFirst.AsDateTime;
         fmBuh_1.mdBuh.FieldByName('NaklNom').AsString:=fmBuh_1.qListNaklNom.AsString;
         fmBuh_1.mdBuh.FieldByName('NaklSumma').AsFloat:=fmBuh_1.qListNaklSumma.AsFloat;
         fmBuh_1.mdBuh.FieldByName('NaklDataOpl').AsDateTime:=fmBuh_1.qListNaklDateOpl.AsDateTime;
         fmBuh_1.mdBuh.FieldByName('KolDay').AsInteger:=fmBuh_1.qListPlatPDayDolg.AsInteger;
         fmBuh_1.mdBuh.FieldByName('NaklSummaDolg').AsFloat:=fmBuh_1.qListNaklSummaDolg.AsFloat;
        end;
      end;

     fmBuh_1.qListNakl.Next;
    end;

  fmBuh_1.mdBuh.SortOnFields('PostName',True,False);
  fmBuh_1.mdBuh.Active:=True;
  fmBuh_1.mdBuh.First;


  fmBuh_1.DBGridEh1.Columns[0].Title.Caption:='Код Накл.';
  fmBuh_1.DBGridEh1.Columns[0].Width:=50;
  fmBuh_1.DBGridEh1.Columns[1].Title.Caption:='Контрагенты';
  fmBuh_1.DBGridEh1.Columns[1].Width:=220;
//  fmCrossReturne.DBGridEh1.Columns[1].Color:=clSilver;

  fmBuh_1.DBGridEh1.Columns[2].Title.Caption:='Дата Накл.';
  fmBuh_1.DBGridEh1.Columns[2].Width:=60;

  fmBuh_1.DBGridEh1.Columns[3].Title.Caption:='№ Накл.';
  fmBuh_1.DBGridEh1.Columns[3].Width:=70;

  fmBuh_1.DBGridEh1.Columns[4].Title.Caption:='Сумма';
  fmBuh_1.DBGridEh1.Columns[4].Width:=80;

  fmBuh_1.DBGridEh1.Columns[5].Title.Caption:='Дата погашения';
  fmBuh_1.DBGridEh1.Columns[5].Width:=60;

  fmBuh_1.DBGridEh1.Columns[6].Title.Caption:='Кол. дней';
  fmBuh_1.DBGridEh1.Columns[6].Width:=50;

  fmBuh_1.DBGridEh1.Columns[7].Title.Caption:='Сумма долга';
  fmBuh_1.DBGridEh1.Columns[7].Width:=80;

//  fmCrossReturne.DBGridEh1.Columns[2].Color:=clRed;
  if fmBuh_1.DBGridEh1.FieldCount>8 then fmBuh_1.DBGridEh1.FrozenCols:=8;
  fmBuh_1.Caption:='!!!Возврат товара: !!! '+DateToStr(RetSelNakl.DateBegin)+'-'+DateToStr(RetSelNakl.DateEnd);
  fmBuh_1.ShowModal;

 finally
  fmBuh_1.qListNakl.Close;
  fmBuh_1.qListPlatP.Close;
  fmBuh_1.Free;
 end;
//
end;
procedure TfmBuh_1.DBGridEh1DblClick(Sender: TObject);
begin
 PlatNakl(mdBuh.FieldByName('NaklNo').AsInteger);
end;

end.
