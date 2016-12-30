unit InputPlan0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  ExtCtrls, Db, Menus, FR_DSet,
  FR_DBSet, FR_Class, StdCtrls, Buttons, DBGridEh, GridsEh, DBAccess,
  MsAccess, MemDS, ActnList;

type
  TRetColnName=record
   CompanyNo  :SmallInt;
   CompanyName:string;
   TipNo      :SmallInt;
   TipName    :string;
end;

type
  TfmInputPlan = class(TMlekoForm)
    spInputPlan: TMSStoredProc;
    RxDBGrid1: TDBGridEh;
    dsInputPlan: TDataSource;
    Panel1: TPanel;
    quCompany: TMSQuery;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    quWork: TMSQuery;
    N2: TMenuItem;
    quUpdatePlanSotrudCompany: TMSQuery;
    UpdateSQL1: TMSUpdateSQL;
    bbPrint: TBitBtn;
    bbOk: TBitBtn;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    frUserDataset1: TfrUserDataset;
    frReport2: TfrReport;
    frUserDataset2: TfrUserDataset;
    quCompanyNameCompany: TStringField;
    procedure spInputPlanAfterOpen(DataSet: TDataSet);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure bbPrintClick(Sender: TObject);
    procedure frUserDataset1First(Sender: TObject);
    procedure frUserDataset1Next(Sender: TObject);
    procedure frUserDataset1CheckEOF(Sender: TObject; var EOF: Boolean);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure frReport2GetValue(const ParName: String;
      var ParValue: Variant);
    procedure frUserDataset2First(Sender: TObject);
    procedure frUserDataset2Next(Sender: TObject);
    procedure frUserDataset2CheckEOF(Sender: TObject; var EOF: Boolean);
  private
    { Private declarations }
    DatePlan:TDate;
    Coln:Integer;
    procedure SummaChange(Sender: TField);
    function GetColnName(FieldName:string):TRetColnName;
  public
    { Public declarations }
  end;

var
  fmInputPlan: TfmInputPlan;
  procedure InpuntPlan;
implementation

uses GetMonth0, GetDate0, Company0, UtilsDataConvert, SelectItem0;

{$R *.DFM}

procedure InpuntPlan;
var
 Period:TPeriodDate;
 Year,Month,Day:word;
begin
 Period:=GetMonth;
 if Period[1]=0 then exit;

 Screen.Cursor:=crHourGlass;
 fmInputPlan:=TfmInputPlan.Create(Application);
 try
 with fmInputPlan do
  begin
   DatePlan:=Period[1];
   DecodeDate(DatePlan,Year,Month,Day);
   fmInputPlan.Caption:=format('План на %s %d г.',[MonthToString(Month,False),Year]);
   spInputPlan.ParamByName('DatePlan').AsDate:=Period[1];
   spInputPlan.Open;
   Screen.Cursor:=crDefault;
   if not spInputPlan.IsEmpty then
    fmInputPlan.ShowModal;
  end
 finally
 fmInputPlan.spInputPlan.Close;
 fmInputPlan.Free;
 end;
end;

procedure TfmInputPlan.spInputPlanAfterOpen(DataSet: TDataSet);
var
 i:integer;
 Col:TColumnEh;
 ColnName:TRetColnName;
begin
 RxDBGrid1.FrozenCols:=0;
 RxDBGrid1.Columns.Clear;
 if spInputPlan.IsEmpty then
  begin
   if (Application.MessageBox(PChar('План не задан! Скопировать предыдущий месяц ?'),'План',MB_YESNO)=IDYES) then
    begin
     quWork.SQL.Clear;
     quWork.SQL.Add('insert into PlanSotrudCompany (DatePlan,SotrudNo,CompanyNo,Summa) '+
                    ' select :DatePlan,SotrudNo,CompanyNo,Summa '+
                    ' from PlanSotrudCompany '+
                    ' where DatePlan=DATEADD(mm,-1,:DatePlan)');
     quWork.ParamByName('DatePlan').AsDate:=DatePlan;
     quWork.Execute;
    end;
   exit;
  end;
 for i:=0  to spInputPlan.FieldCount-1 do
  begin
   if spInputPlan.Fields[i].FieldName='SotrudNo' then Continue;
   Col:=RxDBGrid1.Columns.Add;
   Col.Field:=spInputPlan.Fields[i];
   if Col.Field.FieldName='SotrudName' then
    begin
     Col.Width:=120;
     Col.Title.Caption:='Сотрудник';
    end
   else
    begin
     Col.Width:=60;
     ColnName:=GetColnName(Col.Field.FieldName);
     if ColnName.CompanyNo<>0 then
      begin
       TFloatField(Col.Field).DisplayFormat:='0.00';
       Col.Title.Caption:=ColnName.CompanyName+'|'+ColnName.TipName;
       if ColnName.TipNo=3 then
        begin
         Col.Field.OnChange:=SummaChange;
         Col.ReadOnly:=False;
        end
       else
        Col.ReadOnly:=True;
      end;
    end;
  end;
 RxDBGrid1.FrozenCols:=1;
end;

function TfmInputPlan.GetColnName(FieldName:string):TRetColnName;
begin
 Result.CompanyNo:=0;
 Result.CompanyName:='';
 Result.TipName:='';
 if (Copy(FieldName,1,1)='C') then
  begin
   Result.CompanyNo:=StrToInt(Copy(FieldName,3,5));
   quCompany.ParamByName('CompanyNo').AsInteger:=Result.CompanyNo;
   quCompany.Open;
   Result.CompanyName:=quCompanyNameCompany.AsString;
   quCompany.Close;
   case FieldName[2] of
    'C':begin
         Result.TipNo:=1;
         Result.TipName:='Текущий|Сумма';
        end;
    'P':begin
         Result.TipNo:=2;
         Result.TipName:='Пред.|Сумма';
        end;
    '_':begin
         Result.TipNo:=3;
         Result.TipName:='План|Сумма';
        end;
   end;
  end;
end;

procedure TfmInputPlan.N1Click(Sender: TObject);
var
 RetCompany:TRetCompany;
begin
 RetCompany:=Company(True, True);
 if RetCompany.CompanyNo=0 then exit;

 quWork.SQL.Clear;
 quWork.SQL.Add('insert into PlanSotrudCompany '+
               ' (DatePlan,SotrudNo,CompanyNo,Summa) '+
               'select :DatePlan,max(SotrudNo),:CompanyNo,0 '+
               'from PlanSotrudCompany '+
               'where DatePlan=:DatePlan ');
 quWork.ParamByName('DatePlan').AsDate:=DatePlan;
 quWork.ParamByName('CompanyNo').AsInteger:=RetCompany.CompanyNo;
 quWork.Execute;

 spInputPlan.Close;
 spInputPlan.Open;

end;

procedure TfmInputPlan.N2Click(Sender: TObject);
var
 ColnName:TRetColnName;
begin
 ColnName:=GetColnName(RxDBGrid1.Columns[RxDBGrid1.Col-1].FieldName);
 if ColnName.CompanyNo=0 then exit;

 quWork.SQL.Clear;
 quWork.SQL.Add('delete from PlanSotrudCompany where DatePlan=:DatePlan and CompanyNo=:CompanyNo');
 quWork.ParamByName('DatePlan').AsDate:=DatePlan;
 quWork.ParamByName('CompanyNo').AsInteger:=ColnName.CompanyNo;
 quWork.Execute;

 spInputPlan.Close;
 spInputPlan.Open;
end;

procedure TfmInputPlan.SummaChange(Sender: TField);
var
 ColnName:TRetColnName;
begin
 ColnName:=GetColnName(Sender.FieldName);
 if (ColnName.CompanyNo<>0) and (ColnName.TipNo=3) then
  begin
   quUpdatePlanSotrudCompany.ParamByName('Summa').AsFloat:=Sender.AsCurrency;
   quUpdatePlanSotrudCompany.ParamByName('DatePlan').AsDate:=fmInputPlan.DatePlan;
   quUpdatePlanSotrudCompany.ParamByName('SotrudNo').AsInteger:=spInputPlan.FieldByName('SotrudNo').AsInteger;
   quUpdatePlanSotrudCompany.ParamByName('CompanyNo').AsInteger:=ColnName.CompanyNo;
   quUpdatePlanSotrudCompany.Execute;
  end;
end;

procedure TfmInputPlan.bbPrintClick(Sender: TObject);
var
 i:integer;
begin
 i:=SelectItem('Печать',['Все','Один']);
 case i of
  0:begin
     spInputPlan.DisableControls;
     try
     frReport1.LoadFromFile('PlanSotrudCompany0.frf');
     frReport1.ShowReport;
     finally
     spInputPlan.EnableControls;
     end;
    end;
  1:begin
     spInputPlan.DisableControls;
     try
     frReport1.LoadFromFile('PlanSotrudCompany1.frf');
     frReport1.ShowReport;
     finally
     spInputPlan.EnableControls;
     end;
    end;
 end;
end;

procedure TfmInputPlan.frUserDataset1First(Sender: TObject);
begin
 Coln:=2;
end;

procedure TfmInputPlan.frUserDataset1Next(Sender: TObject);
begin
 Inc(Coln,3);
end;

procedure TfmInputPlan.frUserDataset1CheckEOF(Sender: TObject;
  var EOF: Boolean);
begin
 EOF:=(Coln=spInputPlan.FieldCount);
end;

procedure TfmInputPlan.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
var
 ColnName:TRetColnName;
 Rec:TBookmarkStr;
 Summa1,Summa2:Currency;
 i:integer;
begin
 if ParName='CellHeader' then
  begin
   ColnName:=GetColnName(spInputPlan.Fields[Coln].FieldName);
   ParValue:=ColnName.CompanyName;
  end;

 if ParName='CellCP' then
  begin
   ParValue:=format('%.2n',[spInputPlan.Fields[Coln].AsCurrency]);
  end;


 if ParName='CellC_' then
  begin
   ParValue:=format('%.2n',[spInputPlan.Fields[Coln+1].AsCurrency]);
  end;


 if ParName='CellCC' then
  begin
   ParValue:=format('%.2n',[spInputPlan.Fields[Coln+2].AsCurrency]);
  end;


 if ParName='CellPercent' then
  begin
   ParValue:='';
   if spInputPlan.Fields[Coln+1].AsCurrency>0 then
    ParValue:=format('%.2n',[(spInputPlan.Fields[Coln+2].AsCurrency/spInputPlan.Fields[Coln+1].AsCurrency)*100]);
  end;
{************************************}
 if ParName='ColCP' then
  begin
   Rec:=spInputPlan.Bookmark;
   ParValue:=0;
   spInputPlan.DisableControls;
   try
   spInputPlan.First;
   Summa1:=0;
   while not spInputPlan.Eof do
    begin
     Summa1:=Summa1+spInputPlan.Fields[Coln].AsCurrency;
     spInputPlan.Next;
    end;
    ParValue:=Summa1;
   finally
   spInputPlan.Bookmark:=Rec;
   spInputPlan.EnableControls;
   end;
  end;


 if ParName='ColC_' then
  begin
   Rec:=spInputPlan.Bookmark;
   ParValue:=0;
   spInputPlan.DisableControls;
   try
   spInputPlan.First;
   Summa1:=0;
   while not spInputPlan.Eof do
    begin
     Summa1:=Summa1+spInputPlan.Fields[Coln+1].AsCurrency;
     spInputPlan.Next;
    end;
    ParValue:=Summa1;
   finally
   spInputPlan.Bookmark:=Rec;
   spInputPlan.EnableControls;
   end;
  end;


 if ParName='ColCC' then
  begin
   Rec:=spInputPlan.Bookmark;
   ParValue:=0;
   spInputPlan.DisableControls;
   try
   spInputPlan.First;
   Summa1:=0;
   while not spInputPlan.Eof do
    begin
     Summa1:=Summa1+spInputPlan.Fields[Coln+2].AsCurrency;
     spInputPlan.Next;
    end;
    ParValue:=Summa1;
   finally
   spInputPlan.Bookmark:=Rec;
   spInputPlan.EnableControls;
   end;
  end;


 if ParName='ColPercent' then
  begin
   Rec:=spInputPlan.Bookmark;
   ParValue:=0;
   spInputPlan.DisableControls;
   try
   spInputPlan.First;
   Summa1:=0; Summa2:=0;
   while not spInputPlan.Eof do
    begin
     Summa1:=Summa1+spInputPlan.Fields[Coln+2].AsCurrency;
     Summa2:=Summa2+spInputPlan.Fields[Coln+1].AsCurrency;
     spInputPlan.Next;
    end;
   if Summa2>0 then
    ParValue:=(Summa1/Summa2)*100;
   finally
   spInputPlan.Bookmark:=Rec;
   spInputPlan.EnableControls;
   end;
  end;

 if ParName='RowCP' then
  begin
   i:=2;
   Summa1:=0;
   repeat
    Summa1:=Summa1+spInputPlan.Fields[i].AsCurrency;
    Inc(i,3)
   until i>=spInputPlan.FieldCount;
   ParValue:=Summa1;
  end;

 if ParName='RowC_' then
  begin
   i:=2;
   Summa1:=0;
   repeat
    Summa1:=Summa1+spInputPlan.Fields[i+1].AsCurrency;
    Inc(i,3)
   until i>=spInputPlan.FieldCount;
   ParValue:=Summa1;
  end;

 if ParName='RowCC' then
  begin
   i:=2;
   Summa1:=0;
   repeat
    Summa1:=Summa1+spInputPlan.Fields[i+2].AsCurrency;
    Inc(i,3)
   until i>=spInputPlan.FieldCount;
   ParValue:=Summa1;
  end;


 if ParName='RowPercent' then
  begin
   ParValue:=0;
   i:=2;
   Summa1:=0; Summa2:=0;
   repeat
    Summa1:=Summa1+spInputPlan.Fields[i+2].AsCurrency;
    Summa2:=Summa2+spInputPlan.Fields[i+1].AsCurrency;
    Inc(i,3)
   until i>=spInputPlan.FieldCount;
   if Summa2>0 then
    ParValue:=(Summa1/Summa2)*100;
  end;

 if ParName='AllCP' then
  begin
   Summa1:=0;
   spInputPlan.DisableControls;
   try
   spInputPlan.First;
   while not spInputPlan.Eof do
    begin
     i:=2;
     repeat
      Summa1:=Summa1+spInputPlan.Fields[i].AsCurrency;
      Inc(i,3)
     until i>=spInputPlan.FieldCount;
     spInputPlan.Next;
    end;
   finally
   spInputPlan.EnableControls;
   end;
   ParValue:=Summa1;
  end;

 if ParName='AllC_' then
  begin
   Summa1:=0;
   spInputPlan.DisableControls;
   try
   spInputPlan.First;
   while not spInputPlan.Eof do
    begin
     i:=2;
     repeat
      Summa1:=Summa1+spInputPlan.Fields[i+1].AsCurrency;
      Inc(i,3)
     until i>=spInputPlan.FieldCount;
     spInputPlan.Next;
    end;
   finally
   spInputPlan.EnableControls;
   end;
   ParValue:=Summa1;
  end;

 if ParName='AllCC' then
  begin
   Summa1:=0;
   spInputPlan.DisableControls;
   try
   spInputPlan.First;
   while not spInputPlan.Eof do
    begin
     i:=2;
     repeat
      Summa1:=Summa1+spInputPlan.Fields[i+2].AsCurrency;
      Inc(i,3)
     until i>=spInputPlan.FieldCount;
     spInputPlan.Next;
    end;
   finally
   spInputPlan.EnableControls;
   end;
  ParValue:=Summa1;
  end;

 if ParName='AllPercent' then
  begin
   Summa1:=0; Summa2:=0;
   ParValue:=0;
   spInputPlan.DisableControls;
   try
   spInputPlan.First;
   while not spInputPlan.Eof do
    begin
     i:=2;
     repeat
      Summa1:=Summa1+spInputPlan.Fields[i+2].AsCurrency;
      Summa2:=Summa2+spInputPlan.Fields[i+1].AsCurrency;
      Inc(i,3)
     until i>=spInputPlan.FieldCount;
     spInputPlan.Next;
    end;
   finally
   spInputPlan.EnableControls;
   end;
   if Summa2>0 then
    ParValue:=(Summa1/Summa2)*100;
  end;
end;

procedure TfmInputPlan.frReport2GetValue(const ParName: String;
  var ParValue: Variant);
var
 ColnName:TRetColnName;
begin
 if ParName='CompanyName' then
  begin
   ColnName:=GetColnName(spInputPlan.Fields[Coln].FieldName);
   ParValue:=ColnName.CompanyName;
  end;
end;

procedure TfmInputPlan.frUserDataset2First(Sender: TObject);
begin
 Coln:=2;
end;

procedure TfmInputPlan.frUserDataset2Next(Sender: TObject);
begin
 Inc(Coln,6);
end;

procedure TfmInputPlan.frUserDataset2CheckEOF(Sender: TObject;
  var EOF: Boolean);
begin
 EOF:=(Coln=spInputPlan.FieldCount);
end;

end.
