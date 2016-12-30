unit PodotchetR0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, DB, DBAccess, MsAccess, MemDS, DBGridEh, StdCtrls, Buttons,
  ExtCtrls, SelectPodotchet0, FR_Class, GridsEh, ActnList;

type
  TfmPodotchetR = class(TMlekoForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    bbPriview: TBitBtn;
    DBGridEh1: TDBGridEh;
    quPodotchetR: TMSQuery;
    dsPodotchetR: TDataSource;
    quPodotchetRPodotchetNom: TStringField;
    quPodotchetRNaklNo: TIntegerField;
    quPodotchetRDateNaklFirst: TDateTimeField;
    quPodotchetRSumma: TFloatField;
    quPodotchetRSotrudName: TStringField;
    quPodotchetRSummaDolg: TFloatField;
    quPodotchetRDatePodotche: TDateTimeField;
    quPodotchetRName: TStringField;
    quPodotchetRPrint: TMSQuery;
    quPodotchetRPrintPodotchetNom: TStringField;
    quPodotchetRPrintNameLong: TStringField;
    quPodotchetRPrintNaklNo: TIntegerField;
    quPodotchetRPrintDateNaklFirst: TDateTimeField;
    quPodotchetRPrintSumma: TFloatField;
    quPodotchetRPrintSotrudName: TStringField;
    frReportChek: TfrReport;
    quPodotchetRPodotchetRNo: TSmallintField;
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure bbPriviewClick(Sender: TObject);
    procedure frReportChekGetValue(const ParName: String;
      var ParValue: Variant);
  private
    { Private declarations }
    SearchString: string;
  public
    { Public declarations }
  end;

var
  fmPodotchetR: TfmPodotchetR;
  procedure PodotchetR(SelectPodotchet:TRetSelectPodotchet);

implementation

uses Data, UtilsDataConvert;


{$R *.dfm}


procedure PodotchetR(SelectPodotchet:TRetSelectPodotchet);
var
 TmpSql:string;
begin
 Screen.Cursor:=crHourGlass;
 fmPodotchetR:=TfmPodotchetR.Create(Application);
 try
  TmpSQL:='';
  if SelectPodotchet.PostNo>0 then
   TmpSql:='(Post.PostNo='+IntToStr(SelectPodotchet.PostNo)+')';
  if (SelectPodotchet.SotrudNo>0) then
   begin
    if Length(TmpSql)>0 then
     TmpSql:=TmpSql+' and ';
    TmpSql:=TmpSql+' (Sotrud.SotrudNo='+IntToStr(SelectPodotchet.SotrudNo)+')';
   end;
  if (SelectPodotchet.DateBegin>0) then
   begin
    if Length(TmpSql)>0 then
     TmpSql:=TmpSql+' and ';
    TmpSql:=TmpSql+' (Podotchetr.DatePodotche>=:DateBegin) and (Podotchetr.DatePodotche<=:DateEnd) ';
   end;
  if Length(TmpSql)>0 then
  begin
  fmPodotchetR.quPodotchetR.MacroByName('_where').Value:=TmpSQL;
  fmPodotchetR.quPodotchetR.MacroByName('_order').Value:='PodotchetNom';
  fmPodotchetR.quPodotchetR.Prepare;
  if (SelectPodotchet.DateBegin>0) then
   begin
    fmPodotchetR.quPodotchetR.ParamByName('DateBegin').AsDate:=SelectPodotchet.DateBegin;
    fmPodotchetR.quPodotchetR.ParamByName('DateEnd').AsDate:=SelectPodotchet.DateEnd;
   end;
  end;
//  DateInsert:=StrToDate(DateToStr(SelExpedition.DateBegin));

 fmPodotchetR.quPodotchetR.Open;
 fmPodotchetR.ShowModal;


 finally
  fmPodotchetR.quPodotchetR.Close;
  Screen.Cursor:=crDefault;
  fmPodotchetR.Free;
 end;
end;

procedure TfmPodotchetR.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if (Rect.Top = DBGridEh1.CellRect(DBGridEh1.Col,DBGridEh1.Row).Top) and (not (gdFocused in State) or not DBGridEh1.Focused) then
    DBGridEh1.Canvas.Brush.Color := clSilver;
  DBGridEh1.DefaultDrawColumnCell(Rect,DataCol,Column,State );
end;

procedure TfmPodotchetR.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
//  VK_SPACE:DBGridEh1.SelectedRows.CurrentRowSelected:=not DBGridEh1.SelectedRows.CurrentRowSelected;
  VK_RETURN:begin
             Key:=0;
             SearchString:='';
             //EditNaklR;
            end;
{  VK_INSERT:begin
             Key:=0;
            end;
  VK_DELETE:begin
             Key:=0;
            end;}
  VK_DOWN,VK_UP,VK_LEFT,VK_RIGHT :SearchString:='';
{  VK_F5:begin
         bbPriviewClick(Sender);
        end;}

 end;
end;

procedure TfmPodotchetR.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
var
 Found:boolean;
begin
 if (Key in Data.SearchSet) then
  begin
   SearchString:=SearchString+Key;
   Key:=Chr(0);
   Found:=False;
   try
   Found:=DBGridEh1.DataSource.DataSet.Locate(DBGridEh1.Columns[DBGridEh1.Col].FieldName,SearchString,[loPartialKey,loCaseInsensitive]);
   except
   SearchString:='';
   end;
   if (not Found) and (DBGridEh1.Columns[DBGridEh1.Col].Field.DataType=ftString) then
    SearchString:=Copy(SearchString,1,length(SearchString)-1);
  end;
end;

procedure TfmPodotchetR.DBGridEh1TitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
var
 FindPodotchetRNo:integer;
begin
 Screen.Cursor:=crHourGlass;
 FindPodotchetRNo:=quPodotchetRNaklNo.AsInteger;
 quPodotchetR.Close;
 case ACol of
  0:quPodotchetR.MacroByName('_order').Value:='PodotchetNom';
  1:quPodotchetR.MacroByName('_order').Value:='DatePodotche, DateNaklFirst, Name, SotrudName';
  2:quPodotchetR.MacroByName('_order').Value:='DateNaklFirst, Name, SotrudName';
  3:quPodotchetR.MacroByName('_order').Value:='NaklR.NaklNo, DateNaklFirst, Name, SotrudName';
  4:quPodotchetR.MacroByName('_order').Value:='Post.Name, SotrudName';
  5:quPodotchetR.MacroByName('_order').Value:='SotrudName, Name';
  6:quPodotchetR.MacroByName('_order').Value:='PodotchetR.Summa';
  7:quPodotchetR.MacroByName('_order').Value:='SummaDolg';
 end;
 quPodotchetR.Prepare;
 quPodotchetR.Open;
 quPodotchetR.Locate('NaklNo',FindPodotchetRNo,[]);
 Screen.Cursor:=crDefault;
end;


procedure TfmPodotchetR.bbPriviewClick(Sender: TObject);
begin
 quPodotchetRPrint.Close;
 quPodotchetRPrint.ParamByName('PodotchetRNo').AsInteger:=quPodotchetRPodotchetRNo.AsInteger;
 quPodotchetRPrint.Open;

 frReportChek.LoadFromFile('Chek.frf');
 frReportChek.ShowReport;
 quPodotchetRPrint.Close;
end;

procedure TfmPodotchetR.frReportChekGetValue(const ParName: String;
  var ParValue: Variant);
begin
if ParName='SummaStr' then
  ParValue:=format('%s грн. %.2d коп.',[IntToString(Trunc(fmPodotchetR.quPodotchetRPrintSumma.AsFloat)),
                         Round(Frac(fmPodotchetR.quPodotchetRPrintSumma.AsFloat)*100)]);

end;

end.
