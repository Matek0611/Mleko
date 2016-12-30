unit CrossPostNaklP0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, Buttons, Db, DBGridEh, ExtCtrls, FR_Class,
  FR_DSet, FR_DBSet, FR_E_TXT, GridsEh, MemDS, DBAccess, MsAccess, ActnList;

type
  TfmCrossPostNaklP = class(TMlekoForm)
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    spCrossPostNaklP: TMSStoredProc;
    dsCrossPostNaklP: TDataSource;
    bbExit: TBitBtn;
    bbPrint: TBitBtn;
    frDBDataSet1: TfrDBDataSet;
    frUserDataset1: TfrUserDataset;
    frReport1: TfrReport;
    frTextExport1: TfrTextExport;
    procedure spCrossPostNaklPAfterOpen(DataSet: TDataSet);
    procedure frUserDataset1First(Sender: TObject);
    procedure frUserDataset1Next(Sender: TObject);
    procedure frUserDataset1CheckEOF(Sender: TObject; var EOF: Boolean);
    procedure bbPrintClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    Coln:integer;
    function DateFromFieldName(FieldName:string):TDate;
  public
    { Public declarations }
  end;

var
  fmCrossPostNaklP: TfmCrossPostNaklP;
  procedure CrossPostNaklP;

implementation

uses Post0, GetDate0;

{$R *.DFM}
procedure CrossPostNaklP;
var
 Period:TPeriodDate;
 RetPost:TRetPost;
begin
 RetPost:=Post(True, True);
 if RetPost.PostNo=0 then exit;

 Period:=ZapDate(4);
 if Period[1]=0 then exit;

 Screen.Cursor:=crHourGlass;
 fmCrossPostNaklP:=TfmCrossPostNaklP.Create(Application);
 try
 fmCrossPostNaklP.Caption:=RetPost.NamePost+' :'+DateToStr(Period[1])+'-'+DateToStr(Period[2]);
 fmCrossPostNaklP.spCrossPostNaklP.ParamByName('DateBegin').AsDate:=Period[1];
 fmCrossPostNaklP.spCrossPostNaklP.ParamByName('DateEnd').AsDate:=Period[2];
 fmCrossPostNaklP.spCrossPostNaklP.ParamByName('PostNo').AsInteger:=RetPost.PostNo;
 fmCrossPostNaklP.spCrossPostNaklP.Open;
 Screen.Cursor:=crDefault;
 fmCrossPostNaklP.ShowModal;
 finally
 Screen.Cursor:=crDefault;
 fmCrossPostNaklP.spCrossPostNaklP.Close;
 fmCrossPostNaklP.Free;
 end;
end;

procedure TfmCrossPostNaklP.spCrossPostNaklPAfterOpen(DataSet: TDataSet);
var
 i:integer;
begin
 spCrossPostNaklP.DisableControls;
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
 spCrossPostNaklP.EnableControls;
end;

function TfmCrossPostNaklP.DateFromFieldName(FieldName:string):TDate;
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

procedure TfmCrossPostNaklP.frUserDataset1First(Sender: TObject);
begin
 Coln:=1;
end;

procedure TfmCrossPostNaklP.frUserDataset1Next(Sender: TObject);
begin
 Inc(Coln);
end;

procedure TfmCrossPostNaklP.frUserDataset1CheckEOF(Sender: TObject;
  var EOF: Boolean);
begin
 EOF:=(spCrossPostNaklP.FieldCount=Coln);
end;

procedure TfmCrossPostNaklP.bbPrintClick(Sender: TObject);
begin
 spCrossPostNaklP.DisableControls;
 try
 frReport1.LoadFromFile('CrossPostNaklP0.frf');
 frReport1.ShowReport;
 finally
 spCrossPostNaklP.EnableControls;
 end;
end;

procedure TfmCrossPostNaklP.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
 if ParName='Cell' then
  ParValue:=spCrossPostNaklP.Fields[Coln].AsCurrency;

 if ParName='ColName' then
  ParValue:=FormatDateTime('dd.mm.yy',DateFromFieldName(spCrossPostNaklP.Fields[Coln].FieldName));

 if ParName='RepTitle' then
  ParValue:=fmCrossPostNaklP.Caption;
end;

procedure TfmCrossPostNaklP.FormResize(Sender: TObject);
begin
 bbExit.Left:=fmCrossPostNaklP.Width-112;
 bbPrint.Left:=fmCrossPostNaklP.Width-208;
end;



end.
