unit BlankOst0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, StdCtrls, DB, DBAccess, MsAccess, DBGridEh, Buttons,
  ExtCtrls, ToolWin, ComCtrls, MemDS, GridsEh, ActnList;

type
  TfmBlankOst = class(TMlekoForm)
    CoolBar1: TCoolBar;
    sbInsert: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Panel1: TPanel;
    bbOk: TBitBtn;
    dbgRealOst: TDBGridEh;
    dsRealOst: TDataSource;
    quExpedition: TMSQuery;
    quWork: TMSQuery;
    quRealOst: TMSQuery;
    CoolBar2: TCoolBar;
    Label1: TLabel;
    quExpeditionExpeditionNo: TSmallintField;
    quExpeditionCarsName: TStringField;
    quExpeditionShipping_AgentName: TStringField;
    quExpeditionExpeditionDateGo: TDateTimeField;
    quExpeditionTovarNo: TSmallintField;
    quRealOstNameTovar: TStringField;
    quRealOstNameTovarShort: TStringField;
    quRealOstVidName: TStringField;
    quRealOstExpeditionNo: TSmallintField;
    quRealOstKolCar: TFloatField;
    quRealOstKolChange: TFloatField;
    quRealOstTovarNo: TSmallintField;
    procedure dbgRealOstDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure dbgRealOstKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgRealOstKeyPress(Sender: TObject; var Key: Char);
    procedure dbgRealOstTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure SortColumnSql(ColumnNo, TovarNo: integer);
    procedure sbInsertClick(Sender: TObject);
  private
    { Private declarations }
    SearchString:string;
  public
    { Public declarations }
  end;

var
  fmBlankOst: TfmBlankOst;
  SortColumn, ExpeditionNoForm: Integer;
  procedure BlankOstatok(ExpeditionNo: Integer);

implementation

uses data, Progress, Tovar0;

{$R *.dfm}

procedure TfmBlankOst.SortColumnSql(ColumnNo, TovarNo: integer);
begin
 Screen.Cursor:=crHourGlass;
 quRealOst.Close;
 quRealOst.SQL.Clear;
 quRealOst.SQL.Add('SELECT Tovar.TovarNo, Tovar.NameTovar, Tovar.NameTovarShort, VidTov.VidName, OstatokExpedition.ExpeditionNo, OstatokExpedition.KolCar, OstatokExpedition.KolChange ');
 quRealOst.SQL.Append('FROM Tovar RIGHT OUTER JOIN ');
 quRealOst.SQL.Append('OstatokExpedition ON Tovar.TovarNo = OstatokExpedition.TovarNo LEFT OUTER JOIN ');
 quRealOst.SQL.Append('VidTov ON VidTov.VidNo = Tovar.VidNo ');
 quRealOst.SQL.Append('WHERE (OstatokExpedition.ExpeditionNo = :ExpeditionNo) ');
 case ColumnNo of
  0:quRealOst.SQL.Append('ORDER BY Tovar.NameTovarShort ');
  1:quRealOst.SQL.Append('ORDER BY Tovar.NameTovar ');
  2:quRealOst.SQL.Append('ORDER BY VidTov.VidName, Tovar.NameTovar ');
 end;
 quRealOst.Params.ParamValues['ExpeditionNo']:=ExpeditionNoForm;
 quRealOst.Open;
 quRealOst.Locate('TovarNo',TovarNo,[]);
 Screen.Cursor:=crDefault;
end;

procedure BlankOstatok(ExpeditionNo: Integer);
begin
 fmBlankOst:=TfmBlankOst.Create(Application);
 try
   begin
    SortColumn:=2;
    ExpeditionNoForm:=ExpeditionNo;
    fmBlankOst.quExpedition.Close;
    fmBlankOst.quExpedition.Params.ParamValues['ExpeditionNo']:=ExpeditionNo;
    fmBlankOst.quExpedition.Open;
    if fmBlankOst.quExpedition.RecordCount=0 then exit;

    fmProgress:=TfmProgress.Create(nil);
    try
     with fmBlankOst do
      begin
       fmProgress.ProgressBar1.Min := 0;
       fmProgress.ProgressBar1.Max := fmBlankOst.quExpedition.RecordCount;
       While not fmBlankOst.quExpedition.Eof do
        begin
         fmProgress.Show;
         fmProgress.Update;
         quWork.Close;
         quWork.SQL.Clear;
         quWork.SQL.Add('SELECT ExpeditionNo, TovarNo ');
         quWork.SQL.Append('FROM OstatokExpedition ');
         quWork.SQL.Append('WHERE (ExpeditionNo = :ExpeditionNo) AND (TovarNo = :TovarNo)');
         quWork.Params.ParamValues['ExpeditionNo']:=quExpeditionExpeditionNo.AsInteger;
         quWork.Params.ParamValues['TovarNo']:=quExpeditionTovarNo.AsInteger;
         quWork.Open;
         if quWork.RecordCount=0 then
          begin
           quWork.Close;
           quWork.SQL.Clear;
           quWork.SQL.Add('INSERT INTO OstatokExpedition ');
           quWork.SQL.Append('(ExpeditionNo, TovarNo, KolCar, KolChange) ');
           quWork.SQL.Append('VALUES (:ExpeditionNo, :TovarNo, :KolCar, :KolChange)');
           quWork.Params.ParamValues['ExpeditionNo']:=quExpeditionExpeditionNo.AsInteger;
           quWork.Params.ParamValues['TovarNo']:=quExpeditionTovarNo.AsInteger;
           quWork.Params.ParamValues['KolCar']:=0;
           quWork.Params.ParamValues['KolChange']:=0;
           quWork.Execute;
          end;
         quWork.Close;
         fmBlankOst.quExpedition.Next;
         fmProgress.ProgressBar1.StepBy(1);
         fmProgress.Update;
        end;
      end;
    finally
     fmBlankOst.Label1.Caption:='Автомобиль: '+fmBlankOst.quExpeditionCarsName.AsString+'  Экспедитор: '+fmBlankOst.quExpeditionShipping_AgentName.AsString;
     fmBlankOst.Caption:='Бланк остатка - Ходка №:'+IntToStr(fmBlankOst.quExpeditionExpeditionNo.AsInteger);
     fmBlankOst.quExpedition.Close;
     fmProgress.Close;
    end;
   end;
  fmBlankOst.quRealOst.Close;
  fmBlankOst.quRealOst.Params.ParamValues['ExpeditionNo']:=ExpeditionNo;
  fmBlankOst.quRealOst.Open;
  if fmBlankOst.quRealOst.RecordCount=0 then exit;



  fmBlankOst.ShowModal;
 finally
  fmBlankOst.quRealOst.Close;
  fmBlankOst.Free;
 end;

end;
procedure TfmBlankOst.dbgRealOstDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if (Rect.Top = dbgRealOst.CellRect(dbgRealOst.Col,dbgRealOst.Row).Top) and (not (gdFocused in State) or not dbgRealOst.Focused) then
//  if (Rect.Top = RxDBGrid1.CellRect(RxDBGrid1.Col,RxDBGrid1.Row).Top) then
    dbgRealOst.Canvas.Brush.Color := $00E9E9E9;
  dbgRealOst.DefaultDrawColumnCell(Rect,DataCol,Column,State );
end;

procedure TfmBlankOst.dbgRealOstKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if not ((dbgRealOst.SelectedField.DisplayLabel='KolCar')
 or (dbgRealOst.SelectedField.DisplayLabel='KolChange')) then
  begin
   case Key of
    VK_INSERT: begin
                Key:=0;
                sbInsert.Click;
               end;
    VK_DOWN,VK_UP:SearchString:='';
   end;
  end;
end;

procedure TfmBlankOst.dbgRealOstKeyPress(Sender: TObject; var Key: Char);
var
 Found:boolean;
begin
 if not ((dbgRealOst.SelectedField.DisplayLabel='KolCar')
 or (dbgRealOst.SelectedField.DisplayLabel='KolChange')) then
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

procedure TfmBlankOst.dbgRealOstTitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
begin
 if ACol<>3 then
  begin
   SortColumnSql(ACol,quRealOstTovarNo.AsInteger);
   SortColumn:=ACol;
  end;
end;

procedure TfmBlankOst.sbInsertClick(Sender: TObject);
var
 RetTovar:TRetTovar;
begin
 RetTovar:=Tovar(True, True,0);
 if RetTovar.TovarNo=0 then Exit;
 if not quRealOst.Locate('TovarNo',RetTovar.TovarNo,[]) then
  begin
   quWork.Close;
   quWork.SQL.Clear;
   quWork.SQL.Add('INSERT INTO OstatokExpedition ');
   quWork.SQL.Append('(ExpeditionNo, TovarNo, KolCar, KolChange) ');
   quWork.SQL.Append('VALUES (:ExpeditionNo, :TovarNo, :KolCar, :KolChange)');
   quWork.Params.ParamValues['ExpeditionNo']:=ExpeditionNoForm;
   quWork.Params.ParamValues['TovarNo']:=RetTovar.TovarNo;
   quWork.Params.ParamValues['KolCar']:=0;
   quWork.Params.ParamValues['KolChange']:=0;
   quWork.Execute;

   SortColumnSql(SortColumn,RetTovar.TovarNo);
  end;
end;

end.
