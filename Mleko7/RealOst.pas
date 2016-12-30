unit RealOst;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, DB, StdCtrls, Buttons, ExtCtrls, ToolWin,
  ComCtrls, DBGridEh, DBAccess, MsAccess, FR_Class, FR_DSet, FR_DBSet,
  MemDS, GridsEh, ActnList;

type
  TfmRealOst = class(TMlekoForm)
    CoolBar1: TCoolBar;
    sbInsert: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Panel1: TPanel;
    bbOk: TBitBtn;
    dsRealOst: TDataSource;
    quOstatok: TMSQuery;
    quOstatokTovarNo: TSmallintField;
    quOstatokNameTovar: TStringField;
    quOstatokNameTovarShort: TStringField;
    quWork: TMSQuery;
    quRealOst: TMSQuery;
    quRealOstTovarNo: TSmallintField;
    quRealOstKol: TFloatField;
    quRealOstNameTovar: TStringField;
    quRealOstNameTovarShort: TStringField;
    quRealOstVidName: TStringField;
    dbgRealOst: TDBGridEh;
    quOstatokcalc_qty: TFloatField;
    quOstatokkol: TFloatField;
    quRealOstkol_ost: TFloatField;
    quRealOstkol_calc: TFloatField;
    frReport8: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure SortColumnSql(ColumnNo, TovarNo: integer);
    procedure sbInsertClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);

  private
    { Private declarations }
    SearchString:string;
  public
    { Public declarations }
  end;

var
  fmRealOst: TfmRealOst;
  DateWorkForm: TDateTime;
  SortColumn: Integer;
  procedure RealOstatok(DateWork: tDateTime);

implementation

uses data, Progress, Tovar0;

{$R *.dfm}

procedure TfmRealOst.SortColumnSql(ColumnNo, TovarNo: integer);
begin
 Screen.Cursor:=crHourGlass;
 quRealOst.Close;
 quRealOst.SQL.Clear;
 quRealOst.SQL.Add('SELECT Tovar.TovarNo, Tovar.NameTovar, Tovar.NameTovarShort, VidTov.VidName, OstatokReal.Kol , OstatokReal.DateWork ');
 quRealOst.SQL.Append('FROM OstatokReal INNER JOIN ');
 quRealOst.SQL.Append('Tovar ON OstatokReal.TovarNo = Tovar.TovarNo INNER JOIN ');
 quRealOst.SQL.Append('VidTov ON Tovar.VidNo = VidTov.VidNo ');
 quRealOst.SQL.Append('WHERE (OstatokReal.DateWork = :DateWork) AND (Tovar.OtdelNo <> 3) ');
 case ColumnNo of
  0:quRealOst.SQL.Append('ORDER BY Tovar.NameTovarShort ');
  1:quRealOst.SQL.Append('ORDER BY Tovar.NameTovar ');
  2:quRealOst.SQL.Append('ORDER BY VidTov.VidName, Tovar.NameTovar ');
 end;
 quRealOst.Params.ParamValues['DateWork']:=DateToStr(DateWorkForm);
 quRealOst.Open;
 quRealOst.Locate('TovarNo',TovarNo,[]);
 Screen.Cursor:=crDefault;
end;

procedure RealOstatok(DateWork: tDateTime);
begin
 fmRealOst:=TfmRealOst.Create(Application);
 try
  SortColumn:=2;
  DateWorkForm:=DateWork;
  if DateToStr(DateWork)=DateToStr(Now) then
   begin

    fmRealOst.quOstatok.Close;
    fmRealOst.quOstatok.Open;
    if fmRealOst.quOstatok.RecordCount=0 then exit;

    fmProgress:=TfmProgress.Create(nil);
    try
     with fmRealOst do
      begin
       fmProgress.ProgressBar1.Min := 0;
       fmProgress.ProgressBar1.Max := fmRealOst.quOstatok.RecordCount;
       While not fmRealOst.quOstatok.Eof do
        begin
         fmProgress.Show;
         fmProgress.Update;
         quWork.Close;
         quWork.SQL.Clear;
         quWork.SQL.Add('SELECT DateWork, TovarNo ');
         quWork.SQL.Append('FROM OstatokReal ');
         quWork.SQL.Append('WHERE (DateWork = :DateWork) AND (TovarNo = :TovarNo)');
         quWork.Params.ParamValues['DateWork']:=DateToStr(DateWork);
         quWork.Params.ParamValues['TovarNo']:=quOstatokTovarNo.AsInteger;
         quWork.Open;
         if quWork.RecordCount=0 then
          begin
           quWork.Close;
           quWork.SQL.Clear;
           quWork.SQL.Add('INSERT INTO OstatokReal ');
           quWork.SQL.Append('(DateWork, TovarNo, Kol,Kol_ost, Kol_calc) ');
           quWork.SQL.Append('VALUES (:DateWork, :TovarNo, :Kol,:Kol_ost,:Kol_calc)');
           quWork.Params.ParamValues['DateWork']:=DateToStr(DateWork);
           quWork.Params.ParamValues['TovarNo']:=quOstatokTovarNo.AsInteger;
           quWork.Params.ParamValues['Kol']:=0;
           quWork.Params.ParamValues['Kol_ost']:=quOstatokKol.AsInteger;
           quWork.Params.ParamValues['Kol_calc']:=quOstatokcalc_qty.AsInteger;
           quWork.Execute;
          end;
         quWork.Close;
         fmRealOst.quOstatok.Next;
         fmProgress.ProgressBar1.StepBy(1);
         fmProgress.Update;
        end;
      end;
    finally
     fmRealOst.quOstatok.Close;
     fmProgress.Close;
    end;
   end;
  fmRealOst.quRealOst.Close;
  fmRealOst.quRealOst.Params.ParamValues['DateWork']:=DateToStr(DateWork);
  fmRealOst.quRealOst.Open;
  if fmRealOst.quRealOst.RecordCount=0 then exit;


  fmRealOst.Caption:='Реальный остаток на '+DateToStr(DateWork);
  fmRealOst.ShowModal;
 finally
  fmRealOst.quRealOst.Close;
  fmRealOst.Free;
 end;

end;

procedure TfmRealOst.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if (Rect.Top = dbgRealOst.CellRect(dbgRealOst.Col,dbgRealOst.Row).Top) and (not (gdFocused in State) or not dbgRealOst.Focused) then
//  if (Rect.Top = RxDBGrid1.CellRect(RxDBGrid1.Col,RxDBGrid1.Row).Top) then
    dbgRealOst.Canvas.Brush.Color := $00E9E9E9;
  dbgRealOst.DefaultDrawColumnCell(Rect,DataCol,Column,State );
end;

procedure TfmRealOst.RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if dbgRealOst.SelectedField.DisplayLabel<>'Kol' then
  begin
   case Key of
    VK_INSERT: begin
                Key:=0;
                sbInsert.Click;
               end;
    VK_DOWN,VK_UP:SearchString:='';
   else
    exit
   end;
  end;
end;

procedure TfmRealOst.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
var
 Found:boolean;
begin
 if dbgRealOst.SelectedField.DisplayLabel<>'Kol' then
  begin
   if (Key in Data.SearchSet) then
    begin
     SearchString:=SearchString+Key;
     Key:=Chr(0);
     Found:=False;
     try
     Found:=dbgRealOst.DataSource.DataSet.Locate(dbgRealOst.Columns[dbgRealOst.Col].FieldName,SearchString,[loPartialKey,loCaseInsensitive]);
     except
     SearchString:='';
     end;
     if (not Found) and (dbgRealOst.Columns[dbgRealOst.Col].Field.DataType=ftString) then
      SearchString:=Copy(SearchString,1,length(SearchString)-1);
    end;
  end;
end;

procedure TfmRealOst.RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
 if ACol<>3 then
  begin
   SortColumnSql(ACol,quRealOstTovarNo.AsInteger);
   SortColumn:=ACol;
  end;
end;

procedure TfmRealOst.sbInsertClick(Sender: TObject);
var
 RetTovar:TRetTovar;
begin
 RetTovar:=Tovar(True, True,0);
 if RetTovar.TovarNo=0 then Exit;
 if not quRealOst.Locate('TovarNo',RetTovar.TovarNo,[]) then
  begin
   quWork.Close;
   quWork.SQL.Clear;
   quWork.SQL.Add('INSERT INTO OstatokReal ');
   quWork.SQL.Append('(DateWork, TovarNo, Kol) ');
   quWork.SQL.Append('VALUES (:DateWork, :TovarNo, :Kol)');
   quWork.Params.ParamValues['DateWork']:=DateToStr(DateWorkForm);
   quWork.Params.ParamValues['TovarNo']:=RetTovar.TovarNo;
   quWork.Params.ParamValues['Kol']:=0;
   quWork.Execute;

   SortColumnSql(SortColumn,RetTovar.TovarNo);
  end;
end;

procedure TfmRealOst.SpeedButton4Click(Sender: TObject);
begin
   frReport8.LoadFromFile('fr_real_ost.frf');
   frReport8.ShowReport;
end;

end.
