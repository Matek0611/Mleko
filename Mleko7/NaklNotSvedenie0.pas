unit NaklNotSvedenie0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, DB, DBAccess, MsAccess, MemDS, StdCtrls, Buttons, ExtCtrls,
  DBGridEh, ToolWin, ComCtrls, FR_Class, FR_DSet, FR_DBSet, GridsEh,
  comp_TargetFilter_CustomFilter, comp_TargetFilter_DateFilter, ActnList;

type
  TfmNaklNotSvedenie = class(TMlekoForm)
    CoolBar1: TToolBar;
    paBottom: TPanel;
    DBGridEh1: TDBGridEh;
    quNaklR: TMSQuery;
    dsNaklR: TDataSource;
    quNaklRTipName: TStringField;
    quNaklRName: TStringField;
    quNaklRCarsName: TStringField;
    quNaklRNaklNo: TIntegerField;
    quNaklRNom: TIntegerField;
    quNaklRDateNakl: TDateTimeField;
    quNaklRSumma: TFloatField;
    quNaklRBuh: TSmallintField;
    quNaklRExpeditionNo: TSmallintField;
    sbPrev: TSpeedButton;
    sbPrint: TSpeedButton;
    frDBdsOtchet: TfrDBDataSet;
    frReportOtchet: TfrReport;
    fltDateNakl: TTargetFilter_DateFilter;
    bbCancel: TBitBtn;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure sbPrevClick(Sender: TObject);
    procedure sbPrintClick(Sender: TObject);
    procedure quNaklRBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    SearchString: String;
  public
    { Public declarations }
  end;

var
  fmNaklNotSvedenie: TfmNaklNotSvedenie;
  procedure NaklNotSvedenie;

implementation

uses Data, main;

{$R *.dfm}

procedure NaklNotSvedenie;
begin
 fmNaklNotSvedenie:=TfmNaklNotSvedenie.Create(Application);
 try
  fmNaklNotSvedenie.fltDateNakl.a_Minimum := main.GlobalDateNakl - 1;
  fmNaklNotSvedenie.fltDateNakl.a_Maximum := main.GlobalDateNakl;
  fmNaklNotSvedenie.quNaklR.Open;  
  fmNaklNotSvedenie.ShowModal;
 finally
 fmNaklNotSvedenie.quNaklR.Close;
 fmNaklNotSvedenie.Free;
 end;
end;

procedure TfmNaklNotSvedenie.DBGridEh1TitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
var
 NaklNo:integer;
begin
 Screen.Cursor:=crHourGlass;
 NaklNo:=quNaklRNaklNo.AsInteger;
 quNaklR.Close;
 case ACol of
  0:quNaklR.MacroByName('_order').Value:='NaklR.Nom';
  1:quNaklR.MacroByName('_order').Value:='NaklR.DateNakl';
  2:quNaklR.MacroByName('_order').Value:='TipNakl.TipName, Post.Name';
  3:quNaklR.MacroByName('_order').Value:='Post.Name';
  4:quNaklR.MacroByName('_order').Value:='Cars.CarsName, Post.Name';
  5:quNaklR.MacroByName('_order').Value:='NaklR.Summa';
 end;
 quNaklR.Prepare;
 quNaklR.Open;
 quNaklR.Locate('NaklNo',NaklNo,[]);
 Screen.Cursor:=crDefault;
end;

procedure TfmNaklNotSvedenie.DBGridEh1KeyPress(Sender: TObject;
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
   Found:=DBGridEh1.DataSource.DataSet.Locate(DBGridEh1.Columns[DBGridEh1.Col].FieldName,SearchString,[loPartialKey,loCaseInsensitive]);
   except
   SearchString:='';
   end;
   if (not Found) and (DBGridEh1.Columns[DBGridEh1.Col].Field.DataType=ftString) then
    SearchString:=Copy(SearchString,1,length(SearchString)-1);
  end;
end;

procedure TfmNaklNotSvedenie.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 case Key of
{  VK_SPACE:RxDBGrid1.SelectedRows.CurrentRowSelected:=not RxDBGrid1.SelectedRows.CurrentRowSelected;
  VK_RETURN:begin
             Key:=0;
             if not quExpedition.Eof then
              begin
               sbEditClick(Sender);
              end;
            end;
  VK_INSERT:begin
             Key:=0;
             if Expidition_ then sbInsertClick(Sender);
            end;
  VK_DELETE:begin
             Key:=0;
             if Expidition_ then sbDelClick(Sender);
            end;}
  VK_DOWN,VK_UP,VK_RIGHT,VK_LEFT:SearchString:='';
  VK_F5:begin
         sbPrevClick(Sender);
        end;
  VK_F6:begin
         sbPrintClick(Sender);
        end;
 end;
end;

procedure TfmNaklNotSvedenie.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if (Rect.Top = DBGridEh1.CellRect(DBGridEh1.Col,DBGridEh1.Row).Top) and (not (gdFocused in State) or not DBGridEh1.Focused) then
    DBGridEh1.Canvas.Brush.Color := clSilver;
  DBGridEh1.DefaultDrawColumnCell(Rect,DataCol,Column,State );
end;

procedure TfmNaklNotSvedenie.sbPrevClick(Sender: TObject);
begin
// quNaklR.First;
// quNaklR.Eof;
 frReportOtchet.LoadFromFile('NaklNotSvedenie.frf');
 frReportOtchet.ShowReport;
end;

procedure TfmNaklNotSvedenie.sbPrintClick(Sender: TObject);
begin
 quNaklR.First;
 frReportOtchet.LoadFromFile('NaklNotSvedenie.frf');
 frReportOtchet.PrepareReport;
 frReportOtchet.PrintPreparedReport('', 1, True, frAll);
end;

procedure TfmNaklNotSvedenie.quNaklRBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  quNaklR.ParamByName('DateNaklBeg').AsDate := fltDateNakl.a_Minimum;
  quNaklR.ParamByName('DateNaklEnd').AsDate := fltDateNakl.a_Maximum;
end;

end.
