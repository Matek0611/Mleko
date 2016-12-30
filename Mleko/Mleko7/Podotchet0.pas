unit Podotchet0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, FR_Class, DB, Grids, DBGrids,
  RXDBCtrl, StdCtrls, DBCtrls, Mask, Buttons, ExtCtrls, rxCurrEdit,
  rxToolEdit, DBAccess, MsAccess, MemDS, ActnList;

type
  TfmPodotchet = class(TMlekoForm)
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    Panel2: TPanel;
    ScrollBox: TScrollBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lcSotrud: TDBLookupComboBox;
    RxDBGrid1: TRxDBGrid;
    quDolg: TMSQuery;
    quDolgNaklNo: TIntegerField;
    quDolgNom: TIntegerField;
    quDolgSumma: TFloatField;
    quDolgSummaDolg: TFloatField;
    quDolgDateNakl: TDateTimeField;
    quDolgSumOplat: TFloatField;
    quDolgSotrudNo: TSmallintField;
    dsDolg: TDataSource;
    quNaklR: TMSQuery;
    quNaklRNaklNo: TIntegerField;
    quNaklRPostNo: TSmallintField;
    quNaklRBuh: TSmallintField;
    quNaklRRealDateOpl: TDateTimeField;
    quNaklRDateNakl: TDateTimeField;
    quPlatP: TMSQuery;
    quPlatPPlatNo: TIntegerField;
    quPlatPDatePlat: TDateTimeField;
    quPlatPNom: TIntegerField;
    quPlatPPostNo: TSmallintField;
    quPlatPPostNoFirst: TSmallintField;
    quPlatPSumma: TFloatField;
    quPlatPBuh: TSmallintField;
    quPlatPSotrudNo: TSmallintField;
    quPlatPSpravka: TStringField;
    quPlatPUserNo: TSmallintField;
    quPlatPNamePost: TStringField;
    quPlatPNameSotrud: TStringField;
    quPost: TMSQuery;
    quPostPostNo: TSmallintField;
    quPostName: TStringField;
    UpdatePlatP: TMSUpdateSQL;
    quWork: TMSQuery;
    quSotrud: TMSQuery;
    quSotrudSotrudNo: TSmallintField;
    quSotrudSotrudName: TStringField;
    Label1: TLabel;
    EditSpravka: TEdit;
    dsPlatP: TDataSource;
    quPodotchetR: TMSQuery;
    frReportChek: TfrReport;
    quPodotchetRPrint: TMSQuery;
    quPodotchetRPrintPodotchetNom: TStringField;
    quPodotchetRPrintNameLong: TStringField;
    quPodotchetRPrintNaklNo: TIntegerField;
    quPodotchetRPrintDateNaklFirst: TDateTimeField;
    quPodotchetRPrintSumma: TFloatField;
    quPodotchetRPrintSotrudName: TStringField;
    EditSumma: TCurrencyEdit;
    EditDate: TDateEdit;
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure quDolgAfterScroll(DataSet: TDataSet);
    procedure bbOkClick(Sender: TObject);
    procedure frReportChekGetValue(const ParName: String;
      var ParValue: Variant);
  private
    { Private declarations }
    SummaDolg:double;
    Buh:boolean;
  public
    { Public declarations }
  end;

const
 Digits: array[1..25] of Char = ('А','Б','В','Г','Д','Е','Ж','З','К','Л',
 'М','Н','О','П','Р','С','Т','У','Ф','Х','Ц','Ч','Ш','Ю','Я');

var
  fmPodotchet: TfmPodotchet;
  procedure  PrihodPodotchet(Buh:boolean);

implementation

uses EditDebet, UtilsDataConvert;

{$R *.dfm}

function SerNom(Nom: string):String;
var
 i: integer;
begin
 if Length(Nom)=0 then
  Result:='А 0001'
 else
  begin
   if Copy(Nom,3,Length(Nom))='9999' then
    begin
     i:=1;
     while Copy(Nom,1,1)<>Digits[i] do inc(i);
     Result:=Digits[i+1]+' 0001'
    end
   else
    begin
     case Length(IntToStr(StrToInt(Copy(Nom,3,Length(Nom)))+1)) of
      1: Result:=Copy(Nom,1,5)+IntToStr(StrToInt(Copy(Nom,3,Length(Nom)))+1);
      2: Result:=Copy(Nom,1,4)+IntToStr(StrToInt(Copy(Nom,3,Length(Nom)))+1);
      3: Result:=Copy(Nom,1,3)+IntToStr(StrToInt(Copy(Nom,3,Length(Nom)))+1);
      4: Result:=Copy(Nom,1,2)+IntToStr(StrToInt(Copy(Nom,3,Length(Nom)))+1);
     end;
    end;
  end;
end;

procedure  PrihodPodotchet(Buh:boolean);
var
 PostNo:integer;
begin
 PostNo:=EditDebetors(True, Buh);
 if PostNo=0 then exit;

 fmPodotchet:=TfmPodotchet.Create(Application);
 try
 fmPodotchet.Buh:=Buh;
 with fmPodotchet do
  begin
   quDolg.ParamByName('PostNo').AsInteger:=PostNo;
   if Buh then
    begin
     quDolg.ParamByName('BuhB').AsInteger:=2;
     quDolg.ParamByName('BuhE').AsInteger:=3;
    end
   else
    begin
     quDolg.ParamByName('BuhB').AsInteger:=1;
     quDolg.ParamByName('BuhE').AsInteger:=1;
    end;
   quDolg.Open;
   fmPodotchet.SummaDolg:=0;
   while not(fmPodotchet.quDolg.EOF) do
    begin
     fmPodotchet.SummaDolg:=fmPodotchet.SummaDolg+fmPodotchet.quDolgSummaDolg.AsFloat;
     fmPodotchet.quDolg.Next;
    end;
   fmPodotchet.quDolg.First;
   //
  quPlatP.Open;
  quPlatP.Insert;

 //
   quPlatPSotrudNo.AsInteger:=fmPodotchet.quDolgSotrudNo.AsInteger;
   if Buh then quPlatPBuh.AsInteger:=2;
   quPlatPPostNo.AsInteger:=PostNo;
   quPlatPPostNoFirst.AsInteger:=PostNo;
   quPlatPSpravka.AsString:=format('Накладная № %d от %s',[fmPodotchet.quDolgNom.AsInteger,fmPodotchet.quDolgDateNakl.AsString]);

   fmPodotchet.Caption:=format('%s :сумма долга %2f',[quPlatPNamePost.AsString,fmPodotchet.SummaDolg]);
   fmPodotchet.RxDBGrid1.Col:=4
 end;
 fmPodotchet.ShowModal;
 finally
 fmPodotchet.quDolg.Close;
 fmPodotchet.quPlatP.Close;
 fmPodotchet.quPost.Close;
 fmPodotchet.Free;
 end;
end;

procedure TfmPodotchet.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
 if (quDolgSumOplat.AsFloat-quDolgSummaDolg.AsFloat)>0.01 then
  AFont.Color:=clRed;
end;

procedure TfmPodotchet.quDolgAfterScroll(DataSet: TDataSet);
begin
 EditDate.Text:=DateToStr(Now);
 EditSumma.Text:=FloatToStr(quDolgSummaDolg.AsFloat);
 EditSpravka.Text:=format('Накладная № %d от %s',[quDolgNom.AsInteger,quDolgDateNakl.AsString]);
end;

procedure TfmPodotchet.bbOkClick(Sender: TObject);
var
 PodotchetRNoNew: integer;
begin
 quWork.SQL.Clear;
 quWork.SQL.Add('select Max(PodotchetRNo) AS MaxPodotchetRNo, MAX(PodotchetNom) AS MaxPodotchetNom  from PodotchetR');
 quWork.Open;
 PodotchetRNoNew:=quWork.Fields[0].AsInteger+1;
 quPodotchetR.ParamByName('PodotchetRNo').AsInteger:=PodotchetRNoNew;
 quPodotchetR.ParamByName('PodotchetNom').AsString:=SerNom(quWork.Fields[1].AsString);
 quPodotchetR.ParamByName('SotrudNo').AsInteger:=quPlatPSotrudNo.AsInteger;
 quPodotchetR.ParamByName('NaklNo').AsInteger:=quDolgNaklNo.AsInteger;
 quPodotchetR.ParamByName('DatePodotche').AsDate:=StrToDate(EditDate.Text);
 quPodotchetR.ParamByName('Summa').AsFloat:=StrToFloat(EditSumma.Text);
 quPodotchetR.ParamByName('SummaPlat').AsFloat:=0;
 quPodotchetR.Execute;
 quWork.Close;

 quPodotchetRPrint.Close;
 quPodotchetRPrint.ParamByName('PodotchetRNo').AsInteger:=PodotchetRNoNew;
 quPodotchetRPrint.Open;

 frReportChek.LoadFromFile('Chek.frf');
 frReportChek.ShowReport;
 quPodotchetRPrint.Close;

 Close;
end;

procedure TfmPodotchet.frReportChekGetValue(const ParName: String;
  var ParValue: Variant);
begin
if ParName='SummaStr' then
  ParValue:=format('%s грн. %.2d коп.',[IntToString(Trunc(fmPodotchet.quPodotchetRPrintSumma.AsFloat)),
                         Round(Frac(fmPodotchet.quPodotchetRPrintSumma.AsFloat)*100)]);
end;

end.
