unit OtchetSale0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, DB, DBAccess, MsAccess, MemDS, FR_Class, FR_DSet,
  FR_DBSet, DBGridEh, StdCtrls, Buttons, ExtCtrls, ComObj, ComCtrls,
  RxMemDS, GridsEh, ActnList;

type
  TfmOtchetSale = class(TMlekoForm)
    Panel1: TPanel;
    bbExit: TBitBtn;
    BitBtn1: TBitBtn;
    DBGridEh1: TDBGridEh;
    quTovar: TMSQuery;
    mdOtchet: TRxMemoryData;
    quOtchet: TMSQuery;
    dsOtchet: TDataSource;
    quTovarTovarNo: TSmallintField;
    quTovarNameTovar: TStringField;
    quOtchetName: TStringField;
    quOtchetKol: TFloatField;
    quOtchetSumm: TFloatField;
    quOtchetTovarNo: TSmallintField;
    quTovarKol: TFloatField;
    Timer: TTimer;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    frUserDataset1: TfrUserDataset;
    dsTovar: TDataSource;
    BitBtn2: TBitBtn;
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TimerTimer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure frUserDataset1CheckEOF(Sender: TObject; var Eof: Boolean);
    procedure frUserDataset1First(Sender: TObject);
    procedure frUserDataset1Next(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmOtchetSale: TfmOtchetSale;
  Coln: Integer;
  SearchString: String;
  ReportTitle: String;
  SummCol: array of Extended;
  procedure OtchetSale(VidNo, VidName: string);

implementation

{$R *.dfm}
uses Data, GetDate0, Progress;

function CaptionTitleDBGrid(CaptionTitle: string):string;
var
 i: integer;
begin
 Result:='';
 if Length(CaptionTitle)<10 then Result:=CaptionTitle
 else
  for i:=1 to Length(CaptionTitle) do
   begin
    case i of
      9:Result:=Result+' '+copy(CaptionTitle,i,1);
     18:Result:=Result+' '+copy(CaptionTitle,i,1);
     27:Result:=Result+' '+copy(CaptionTitle,i,1);
     36:Result:=Result+' '+copy(CaptionTitle,i,1)
    else
     Result:=Result+copy(CaptionTitle,i,1);
    end;
   end;

end;

procedure OtchetSale(VidNo, VidName: string);
var
 Period: TPeriodDate;
 FindNameTovar: string;
 i: integer;
 SummaGRN: Extended;
begin
 Period:=ZapDate(4);
 if Period[1]=0 then exit;
// PeriodCrossReturne[1]:=Period[1];
// PeriodCrossReturne[2]:=Period[2];

 fmOtchetSale:=TfmOtchetSale.Create(Application);
 try
  fmOtchetSale.Timer.Enabled:=True;
  fmOtchetSale.quTovar.Close;
  fmOtchetSale.quTovar.ParamByName('DateBegin').AsDate:=Period[1];
  fmOtchetSale.quTovar.ParamByName('DateEnd').AsDate:=Period[2];
  fmOtchetSale.quTovar.ParamByName('VidNo').AsInteger:=StrToInt(VidNo);
  fmOtchetSale.quTovar.Open;

  fmOtchetSale.quOtchet.Close;
  fmOtchetSale.quOtchet.ParamByName('DateBegin').AsDate:=Period[1];
  fmOtchetSale.quOtchet.ParamByName('DateEnd').AsDate:=Period[2];
  fmOtchetSale.quOtchet.ParamByName('VidNo').AsInteger:=StrToInt(VidNo);
  fmOtchetSale.quOtchet.Open;
  {fmCrossReturne.qSummR.Close;
  fmCrossReturne.qSummR.ParamByName('DatePostB').AsDate:=Period[1];
  fmCrossReturne.qSummR.ParamByName('DatePostE').AsDate:=Period[2];
  fmCrossReturne.qSummR.Open;}

  if fmOtchetSale.quOtchet.RecordCount=0 then exit;

  with fmOtchetSale.mdOtchet do begin
  Active := False;
  FieldDefs.Clear;
   with FieldDefs.AddFieldDef do
    begin
     Name := 'PostName';
     DataType := ftString;
     Size := 40;
     Required := False;
    end;
   with FieldDefs.AddFieldDef do
    begin
     Name := 'Summ';
     DataType := ftFloat;
     Required := False;
    end;
   with FieldDefs.AddFieldDef do
    begin
     Name := 'Nakls';
     DataType := ftInteger;
     Required := False;
    end;
   fmOtchetSale.quTovar.First;
   while not fmOtchetSale.quTovar.Eof do
    begin
     with FieldDefs.AddFieldDef do
      begin
       Name := IntToStr(fmOtchetSale.quTovarTovarNo.AsInteger);
       DataType := ftFloat;
       Required := False;
       end;
    fmOtchetSale.quTovar.Next;
    end;
   Active:=True;
   end;

   fmOtchetSale.quOtchet.First;
   FindNameTovar:='';
   SummaGRN:=0;
   fmProgress:=TfmProgress.Create(nil);
   try
    with fmOtchetSale do
     begin
      While not fmOtchetSale.quOtchet.Eof do
       begin
        fmProgress.ProgressBar1.Min := 0;
        fmProgress.ProgressBar1.Max := fmOtchetSale.quOtchet.RecordCount+fmOtchetSale.quTovar.RecordCount;
        fmProgress.Show;
        fmProgress.Update;
        if FindNameTovar<>fmOtchetSale.quOtchetName.AsString then
         if not fmOtchetSale.mdOtchet.Locate('PostName',fmOtchetSale.quOtchetName.AsString,[]) then
          begin
           fmOtchetSale.mdOtchet.Insert;
           //fmPresidentOtchet.mdPresidentOtchet.FieldByName('VidTovar').AsString:=fmCrossReturne.qKolRVidName.AsString;
           fmOtchetSale.mdOtchet.FieldByName('PostName').AsString:=fmOtchetSale.quOtchetName.AsString;
           fmOtchetSale.mdOtchet.FieldByName('Nakls').AsInteger:=0;
           fmOtchetSale.mdOtchet.Post;
           fmOtchetSale.mdOtchet.Refresh;
          end;
        FindNameTovar:=fmOtchetSale.quOtchetName.AsString;
        fmOtchetSale.mdOtchet.Edit;
        fmOtchetSale.mdOtchet.FieldByName(IntToStr(fmOtchetSale.quOtchetTovarNo.AsInteger)).AsFloat:=fmOtchetSale.quOtchetKol.AsFloat;
        fmOtchetSale.mdOtchet.FieldByName('Nakls').AsInteger:=fmOtchetSale.mdOtchet.FieldByName('Nakls').AsInteger+1;
        fmOtchetSale.mdOtchet.FieldByName('Summ').AsFloat:=fmOtchetSale.mdOtchet.FieldByName('Summ').AsFloat+fmOtchetSale.quOtchetSumm.AsFloat;
        fmOtchetSale.mdOtchet.Post;
        fmOtchetSale.mdOtchet.Refresh;
        SummaGRN:=SummaGRN+fmOtchetSale.quOtchetSumm.AsFloat;
        fmOtchetSale.quOtchet.Next;
        fmProgress.ProgressBar1.StepBy(1);
       end;
     end;


  fmOtchetSale.mdOtchet.SortOnFields('PostName',True,False);
//  fmCrossReturne.mdCrossReturne.Active:=True;
  fmOtchetSale.mdOtchet.First;

  fmOtchetSale.quTovar.First;
  i:=3;
   while not fmOtchetSale.quTovar.Eof do
    begin
//     fmCrossReturne.DBGridEh1.Columns[i].Title.Caption:=CaptionTitleDBGrid(fmCrossReturne.qPostRName.AsString);
     fmOtchetSale.DBGridEh1.Columns[i].Title.Caption:=fmOtchetSale.quTovarNameTovar.AsString;
     fmOtchetSale.DBGridEh1.Columns[i].Title.Orientation:=tohVertical;
     fmOtchetSale.DBGridEh1.Columns[i].Width:=40;

     fmOtchetSale.DBGridEh1.Columns[i].Footer.ValueType:=fvtStaticText;
     fmOtchetSale.DBGridEh1.Columns[i].Footer.Value:=FloatToStr(fmOtchetSale.quTovarKol.AsFloat);


     i:=i+1;
     fmOtchetSale.quTovar.Next;
     fmProgress.ProgressBar1.StepBy(1);
    end;
   finally
    //fmOtchets.quExcelDanon.Close;
    fmProgress.Free;
    //Screen.Cursor:=crDefault;
   end;

//  fmPresidentOtchet.DBGridEh1.Columns[0].Title.Caption:='№';
//  fmPresidentOtchet.DBGridEh1.Columns[0].Width:=50;
  fmOtchetSale.DBGridEh1.Columns[0].Title.Caption:='Покупатель';
  fmOtchetSale.DBGridEh1.Columns[0].Width:=220;
//  fmCrossReturne.DBGridEh1.Columns[1].Color:=clSilver;
//  fmPresidentOtchet.DBGridEh1.Columns[2].Title.Caption:='Адрес';
//  fmPresidentOtchet.DBGridEh1.Columns[2].Width:=100;
  fmOtchetSale.DBGridEh1.Columns[1].Title.Caption:='Сумма';
  fmOtchetSale.DBGridEh1.Columns[1].Width:=60;
  fmOtchetSale.DBGridEh1.Columns[1].Color:=clBtnFace;
  fmOtchetSale.DBGridEh1.Columns[0].Footer.ValueType:=fvtStaticText;
  fmOtchetSale.DBGridEh1.Columns[0].Footer.Value:='Итого:';
  fmOtchetSale.DBGridEh1.Columns[0].Footer.Alignment:=taRightJustify;
  //fmPresidentOtchet.DBGridEh1.Columns[1].Footer.ValueType:=fvtSum;
  fmOtchetSale.DBGridEh1.Columns[1].Footer.ValueType:=fvtStaticText;
  fmOtchetSale.DBGridEh1.Columns[1].Footer.Value:=Format('%.2f',[SummaGRN]);
  if fmOtchetSale.DBGridEh1.FieldCount>1 then fmOtchetSale.DBGridEh1.FrozenCols:=2;
  ReportTitle:='Продажи за период: '+DateToStr(Period[1])+'-'+DateToStr(Period[2])+' по '+VidName;
  fmOtchetSale.Caption:='Продажи за период: '+DateToStr(Period[1])+'-'+DateToStr(Period[2])+' по '+VidName;
  fmOtchetSale.ShowModal;

 finally
  fmOtchetSale.quTovar.Close;
  fmOtchetSale.quOtchet.Close;
  fmOtchetSale.mdOtchet.Active:=False;
  fmOtchetSale.Timer.Enabled:=False;
  //fmCrossReturne.qSummR.Close;
  fmOtchetSale.Free;
 end;
//
end;

procedure TfmOtchetSale.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if (Rect.Top = DBGridEh1.CellRect(DBGridEh1.Col,DBGridEh1.Row).Top) and (not (gdFocused in State) or not DBGridEh1.Focused) then
    DBGridEh1.Canvas.Brush.Color := clSilver;
  DBGridEh1.DefaultDrawColumnCell(Rect,DataCol,Column,State );
end;

procedure TfmOtchetSale.DBGridEh1KeyPress(Sender: TObject;
  var Key: Char);
var
 Found:boolean;
begin
 if (Key in Data.SearchSet) then
  begin
   SearchString:=SearchString+Key;
   Key:=Chr(0);
   Found:=False;
   try
   Found:=DBGridEh1.DataSource.DataSet.Locate(DBGridEh1.Columns[0].FieldName,SearchString,[loPartialKey,loCaseInsensitive]);
   except
   SearchString:='';
   end;
   if (not Found) and (DBGridEh1.Columns[0].Field.DataType=ftString) then
    SearchString:=Copy(SearchString,1,length(SearchString)-1);
  end;
end;

procedure TfmOtchetSale.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 case Key of
  VK_DOWN,VK_UP, VK_RIGHT, VK_LEFT:SearchString:='';
 end;
end;

procedure TfmOtchetSale.TimerTimer(Sender: TObject);
begin
 SearchString:='';
end;

procedure TfmOtchetSale.BitBtn1Click(Sender: TObject);
var
 i: integer;
begin
 SetLength(SummCol, mdOtchet.FieldCount+3);
 for i:=1 to (mdOtchet.FieldCount+3) do SummCol[i]:=0;
 frReport1.LoadFromFile('OtchetSale0.frf');
 frReport1.ShowReport;
end;

procedure TfmOtchetSale.frUserDataset1CheckEOF(Sender: TObject;
  var Eof: Boolean);
begin
 EOF:=(mdOtchet.FieldCount=Coln);
end;

procedure TfmOtchetSale.frUserDataset1First(Sender: TObject);
begin
 Coln:=2;
end;

procedure TfmOtchetSale.frUserDataset1Next(Sender: TObject);
begin
 Inc(Coln);
end;

procedure TfmOtchetSale.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
var
 i: integer;
 SummaAll: Extended;
begin
 if ParName='RepTitle' then
  ParValue:=ReportTitle;

 if ParName='Cell' then
  begin
   if Coln<>0 then
   begin
   if mdOtchet.Fields[Coln].AsFloat<>0 then
    begin
     ParValue:=format('%.2n',[mdOtchet.Fields[Coln].AsFloat]);
     SummCol[Coln]:=SummCol[Coln]+mdOtchet.Fields[Coln].AsFloat;
    end
   else
    ParValue:='';
   end
   else ParValue:='';
  end;

 if ParName='CellHead' then
  begin
   ParValue:='';
   quTovar.Locate('TovarNo',mdOtchet.Fields[Coln].FieldName,[]);
   ParValue:=quTovarNameTovar.AsString;
  end;

 if ParName='Kol' then
  begin
   ParValue:=0.00;
   ParValue:=SummCol[Coln];
   {for i:=1 to mdOtchet.FieldCount-1 do
    begin
     ParValue:=SummCol[i];
    end;}
  end;

 if ParName='SummaRow' then
  begin
   ParValue:=0.00;
   for i:=1 to mdOtchet.FieldCount-1 do
    begin
     ParValue:=ParValue+mdOtchet.Fields[i].AsFloat;
    end;
  end;

 {if ParName='Summa' then
  begin
   quSaleSotrudSumm.Locate('SotrudName',mdSaleSotrudTipTovar.Fields[Coln].FieldName,[]);
   ParValue:=quSaleSotrudSummSumma.AsFloat;
  end;  }


 if ParName='SummaAll' then
  begin
   ParValue:=0;
  end;
{ if ParName='SummaDolgAll' then
  begin
   ParValue:=FloatToStr(DBSumList1.SumCollection.Items[1].SumValue);
  end;
 if ParName='SummaPercentAll' then
  begin
   ParValue:=FloatToStr(DBSumList1.SumCollection.Items[1].SumValue/(DBSumList1.SumCollection.Items[0].SumValue/100));
  end;}

end;

procedure TfmOtchetSale.BitBtn2Click(Sender: TObject);
var
 XLApp,Sheet,Colum:Variant;
 ColumnsCount, RowCount,i:Integer;
begin
 XLApp:= CreateOleObject('Excel.Application');
//   XLApp.Visible:=true;
 XLApp.Workbooks.Add(-4167);
 XLApp.Workbooks[1].WorkSheets[1].Name:='Отчёт';
 Colum:=XLApp.Workbooks[1].WorkSheets['Отчёт'].Columns;

 ColumnsCount:=fmOtchetSale.DBGridEh1.FieldCount;
 Colum.Columns[1].ColumnWidth:=50;
 Colum.Columns[2].ColumnWidth:=10;
 for i:=2 to ColumnsCount-1 do
  Colum.Columns[i].ColumnWidth:=8;

{
 fmOtchetSale.DBGridEh1.Columns[1].Title.Caption:='Сумма';
  fmOtchetSale.DBGridEh1.Columns[1].Width:=60;
  fmOtchetSale.DBGridEh1.Columns[1].Color:=clBtnFace;
  fmOtchetSale.DBGridEh1.Columns[0].Footer.ValueType:=fvtStaticText;
  fmOtchetSale.DBGridEh1.Columns[0].Footer.Value:='Итого:';
  fmOtchetSale.DBGridEh1.Columns[0].Footer.Alignment:=taRightJustify;
  fmOtchetSale.DBGridEh1.Columns[1].Footer.ValueType:=fvtStaticText;
  fmOtchetSale.DBGridEh1.Columns[1].Footer.Value:=Format('%.2f',[SummaGRN]);
  if fmOtchetSale.DBGridEh1.FieldCount>1 then fmOtchetSale.DBGridEh1.FrozenCols:=2;
}
 Colum:=XLApp.Workbooks[1].WorkSheets['Отчёт'].Rows;
 Colum.Rows[2].Font.Bold:=true;
 Colum.Rows[1].Font.Bold:=true;
 Colum.Rows[1].Font.Color:=clBlue;
 Colum.Rows[1].Font.Size:=14;

 Sheet:=XLApp.Workbooks[1].WorkSheets['Отчёт'];
 Sheet.Cells[1,1]:=fmOtchetSale.Caption;
 for i:=0 to ColumnsCount-1 do
  begin
   Sheet.Cells[2,i+1]:=DBGridEh1.Columns[i].Title.Caption;
  end;
 mdOtchet.First;
 RowCount:=3;
 while not mdOtchet.Eof do
  begin
   for i:=0 to ColumnsCount-1 do
    begin
     if i=0 then
      Sheet.Cells[RowCount,i+1]:=mdOtchet.Fields[i].AsString
     else
      Sheet.Cells[RowCount,i+1]:=mdOtchet.Fields[i].AsFloat;
    end;
   RowCount:=RowCount+1;
   mdOtchet.Next;
  end;
 mdOtchet.First;

{   fmOtchets.quExcelTara.ParamByName('DateB').AsDate:=Period[1];
   fmOtchets.quExcelTara.ParamByName('DateE').AsDate:=Period[2];
   fmOtchets.quExcelTara.Open;

   index:=3;
     ProgressBar1.Min := 0;
     ProgressBar1.Max := fmOtchets.quExcelTara.RecordCount;
     Show;
     Update;
     while not fmOtchets.quExcelTara.Eof do
      begin
       Sheet.Cells[index,1]:=fmOtchets.quExcelTaraNaklNo.AsInteger;
//       Sheet.Cells[index,2]:=fmOtchets.quExcelPresidentNameTovar.AsString;
//       Sheet.Cells[index,2]:=copy(DateToStr(fmOtchets.quExcelPresidentDateNakl.AsDateTime),7,4)+copy(DateToStr(fmOtchets.quExcelDanonDateNakl.AsDateTime),4,2)+copy(DateToStr(fmOtchets.quExcelDanonDateNakl.AsDateTime),1,2);
       Sheet.Cells[index,2]:=DateToStr(fmOtchets.quExcelTaraDateNakl.AsDateTime);
       Sheet.Cells[index,3]:=fmOtchets.quExcelTaraNameTovar.AsString;
       if fmOtchets.quExcelTaraRashod.AsInteger=0 then
        Sheet.Cells[index,4]:=fmOtchets.quExcelTaraKol.AsFloat
       else
        Sheet.Cells[index,5]:=fmOtchets.quExcelTaraKol.AsFloat;
       Sheet.Cells[index,6]:=fmOtchets.quExcelTaraPrice.AsFloat;
       Sheet.Cells[index,7]:=fmOtchets.quExcelTaraName.AsString;
       Inc(index);
       fmOtchets.quExcelTara.Next;
       ProgressBar1.StepBy(1);
      end;
  end;
 finally
  fmOtchets.quExcelTara.Close;}
  XLApp.Visible:=true;

end;

end.
