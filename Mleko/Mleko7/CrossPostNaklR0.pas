unit CrossPostNaklR0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, Buttons, Db, DBGridEh, ExtCtrls, FR_Class,
  FR_DSet, FR_DBSet, GridsEh, MemDS, DBAccess, MsAccess, ActnList;

type
  TfmCrossPostNaklR = class(TMlekoForm)
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    spCrossPostNaklR: TMSStoredProc;
    dsCrossPostNaklR: TDataSource;
    bbExit: TBitBtn;
    bbPrint: TBitBtn;
    frDBDataSet1: TfrDBDataSet;
    frUserDataset1: TfrUserDataset;
    frReport1: TfrReport;
    procedure spCrossPostNaklRAfterOpen(DataSet: TDataSet);
    procedure frUserDataset1First(Sender: TObject);
    procedure frUserDataset1Next(Sender: TObject);
    procedure frUserDataset1CheckEOF(Sender: TObject; var EOF: Boolean);
    procedure bbPrintClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
  private
    { Private declarations }
    Coln:integer;
    function DateFromFieldName(FieldName:string):TDate;
  public
    { Public declarations }
  end;

var
  fmCrossPostNaklR: TfmCrossPostNaklR;
  procedure CrossPostNaklR;

implementation

uses GetDate0, PostForNaklRUnit;

{$R *.DFM}
procedure CrossPostNaklR;
var
 Period:TPeriodDate;
 RetPost:TRetPostForNaklR;
begin
 RetPost:=PostForNaklR(Date());
 if RetPost.PostNo=0 then exit;

 Period:=ZapDate(4);
 if Period[1]=0 then exit;

 Screen.Cursor:=crHourGlass;
 fmCrossPostNaklR:=TfmCrossPostNaklR.Create(Application);
 try
 fmCrossPostNaklR.Caption:=RetPost.NamePost+':'+RetPost.Address+' :'+DateToStr(Period[1])+'-'+DateToStr(Period[2]);
 fmCrossPostNaklR.spCrossPostNaklR.ParamByName('DateBegin').AsDate:=Period[1];
 fmCrossPostNaklR.spCrossPostNaklR.ParamByName('DateEnd').AsDate:=Period[2];
 fmCrossPostNaklR.spCrossPostNaklR.ParamByName('PostNo').AsInteger:=RetPost.PostNo;
 fmCrossPostNaklR.spCrossPostNaklR.ParamByName('AddressNo').AsInteger:=RetPost.AddressNo;
 fmCrossPostNaklR.spCrossPostNaklR.Open;
 Screen.Cursor:=crDefault;
 fmCrossPostNaklR.ShowModal;
 finally
 Screen.Cursor:=crDefault;
 fmCrossPostNaklR.spCrossPostNaklR.Close;
 fmCrossPostNaklR.Free;
 end;
end;

procedure TfmCrossPostNaklR.spCrossPostNaklRAfterOpen(DataSet: TDataSet);
var
 i:integer;
begin
 spCrossPostNaklR.DisableControls;
 for i:=0 to DBGridEh1.Columns.Count-1 do
  begin
   if DateFromFieldName(DBGridEh1.Columns[i].FieldName)>0 then
    begin
     DBGridEh1.Columns[i].Title.Caption:=FormatDateTime('dd.mm.yy',DateFromFieldName(DBGridEh1.Columns[i].FieldName))+'|';
     if Copy(DBGridEh1.Columns[i].FieldName,Length(DBGridEh1.Columns[i].FieldName),1)='_' then
      DBGridEh1.Columns[i].Title.Caption:=DBGridEh1.Columns[i].Title.Caption+'Возврат'
     else
      DBGridEh1.Columns[i].Title.Caption:=DBGridEh1.Columns[i].Title.Caption+'Расход';
    DBGridEh1.Columns[i].Width:=48;
    end
   else
    if DBGridEh1.Columns[i].FieldName='NameTovar' then
     begin
      DBGridEh1.Columns[i].Title.Caption:='Наименование';
      DBGridEh1.Columns[i].Width:=180;
     end
  end;
 if DBGridEh1.Columns.Count>1 then
  begin
   DBGridEh1.FrozenCols:=1;
   DBGridEh1.Col:=2;
  end;
 spCrossPostNaklR.EnableControls;
end;

function TfmCrossPostNaklR.DateFromFieldName(FieldName:string):TDate;
var
 TmpStr:string;
 Year,Month,Day:word;
 i:integer;
begin
 Result:=0;
 if Copy(FieldName,1,1)='D' then
  begin
   Year:=StrToInt(Copy(FieldName,2,4));
   TmpStr:=Copy(FieldName,7,255);
   i:=Pos('_',TmpStr);
   Month:=StrToInt(Copy(TmpStr,1,i-1));

   TmpStr:=Copy(TmpStr,i+1,255);
   i:=Pos('_',TmpStr);
   if i>0 then
    TmpStr:=Copy(TmpStr,1,i-1);
   Day:=StrToInt(TmpStr);
   Result:=EncodeDate(Year,Month,Day);
  end;
end;

procedure TfmCrossPostNaklR.frUserDataset1First(Sender: TObject);
begin
 Coln:=1;
end;

procedure TfmCrossPostNaklR.frUserDataset1Next(Sender: TObject);
begin
 Inc(Coln);
end;

procedure TfmCrossPostNaklR.frUserDataset1CheckEOF(Sender: TObject;
  var EOF: Boolean);
begin
 EOF:=(spCrossPostNaklR.FieldCount=Coln);
end;

procedure TfmCrossPostNaklR.bbPrintClick(Sender: TObject);
begin
 spCrossPostNaklR.DisableControls;
 try
 frReport1.LoadFromFile('CrossPostNaklR0.frf');
 frReport1.ShowReport;
 finally
 spCrossPostNaklR.EnableControls;
 end;
end;

procedure TfmCrossPostNaklR.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
 if ParName='Cell' then
  ParValue:=spCrossPostNaklR.Fields[Coln].AsCurrency;

 if ParName='ColName' then
  ParValue:=FormatDateTime('dd.mm.yy',DateFromFieldName(spCrossPostNaklR.Fields[Coln].FieldName));

 if ParName='RepTitle' then
  ParValue:=fmCrossPostNaklR.Caption;
end;

end.
