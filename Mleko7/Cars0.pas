unit Cars0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB,
  DBGridEh, ToolWin, ComCtrls, GridsEh, ActnList;

type
  TfmCars = class(TMlekoForm)
    paTop: TPanel;
    Panel3: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    CoolBar1: TCoolBar;
    SpeedButton3: TSpeedButton;
    SpeedButton2: TSpeedButton;
    sbInsert: TSpeedButton;
    DBGridEh1: TDBGridEh;
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    procedure bbCancelClick(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure bbInsertClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
    SearchString:string;
  public
    { Public declarations }
  end;

var
  fmCars: TfmCars;
  function Cars(Selected, Visible, Deleted: Boolean):integer;

implementation

uses data, EditCars0;

{$R *.dfm}

function Cars(Selected, Visible, Deleted: Boolean):integer;
var Where : String;
begin
 Result:=0;
 fmCars:=TfmCars.Create(Application);
 try
// fmCars.RxDBGrid1.Col:=2;
 if Selected then fmCars.bbOk.Default:=True
 else fmCars.bbOk.Default:=False;

 if Visible then Where := Where + 'AND (Visible=0) '
 else Where := Where;

 if Deleted then Where := Where + 'AND (CarsDelete=0) '
 else Where := Where;

 dmDataModule.quCars.MacroByName('_where').Value:= Where;
 dmDataModule.quCars.MacroByName('_order').Value:='CarsName';
 dmDataModule.quCars.Open;
 fmCars.ActiveControl:=fmCars.DBGridEh1;
 if fmCars.ShowModal=mrOk then
  Result:=dmDataModule.quCarsCarsNo.AsInteger
 finally
 dmDataModule.quCars.Close;
 fmCars.Free;
 end;
end;

procedure TfmCars.bbCancelClick(Sender: TObject);
begin
//
end;

procedure TfmCars.bbOkClick(Sender: TObject);
begin
//
end;

procedure TfmCars.bbInsertClick(Sender: TObject);
begin
 dmDataModule.quCars.Append;
 EditCars;
 ActiveControl:=DBGridEh1;
end;

procedure TfmCars.SpeedButton2Click(Sender: TObject);
begin
 if not dmDataModule.quCars.Eof then
  EditCars;
 dmDataModule.quCars.Refresh;
 ActiveControl:=DBGridEh1;
end;

procedure TfmCars.SpeedButton3Click(Sender: TObject);
begin
 if not dmDataModule.quCars.Eof then
  if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
   dmDataModule.quCars.Delete;
 ActiveControl:=DBGridEh1;
end;

procedure TfmCars.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if (Rect.Top = DBGridEh1.CellRect(DBGridEh1.Col,DBGridEh1.Row).Top) and (not (gdFocused in State) or not DBGridEh1.Focused) then
//  if (Rect.Top = RxDBGrid1.CellRect(RxDBGrid1.Col,RxDBGrid1.Row).Top) then
    DBGridEh1.Canvas.Brush.Color := $00E9E9E9;
  DBGridEh1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
  if dmDataModule.quCarsVisible.AsBoolean then
    DBGridEh1.Canvas.Font.Color := clRed;
  if dmDataModule.quCarsCarsDelete.AsBoolean then
    DBGridEh1.Canvas.Font.Color := clMaroon;
  DBGridEh1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TfmCars.DBGridEh1DblClick(Sender: TObject);
begin
// if not dmDataModule.quCars.Eof then
  SpeedButton2Click(Sender);
// ActiveControl:=RxDBGrid1;
end;

procedure TfmCars.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
  VK_ESCAPE: begin
              Key:=0;
              bbCancelClick(Sender);
             end;
  VK_RETURN: begin
              Key:=0;
              SpeedButton2Click(Sender);
             end;
  VK_INSERT: begin
              Key:=0;
              bbInsertClick(Sender);
             end;
  VK_DELETE: begin
              Key:=0;
              SpeedButton3Click(Sender);
             end;
  VK_DOWN,VK_UP:SearchString:='';
 end;
end;

procedure TfmCars.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
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

procedure TfmCars.DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
var
 CarsNo:integer;
begin
 CarsNo:=dmDataModule.quCarsCarsNo.AsInteger;
 dmDataModule.quCars.Close;
 case ACol of
  0:dmDataModule.quCars.MacroByName('_order').Value:='c.CarsNo';
  1:dmDataModule.quCars.MacroByName('_order').Value:='c.CarsName';
  2:dmDataModule.quCars.MacroByName('_order').Value:='c.CarsDriver';
 end;
 dmDataModule.quCars.Open;
 dmDataModule.quCars.Locate('CarsNo',CarsNo,[]);
end;

procedure TfmCars.SpeedButton1Click(Sender: TObject);
var
  CarsNo:integer;
begin
  CarsNo:=dmDataModule.quCarsCarsNo.AsInteger;

  dmDataModule.quWork.SQL.Clear;
  dmDataModule.quWork.SQL.Add('update Cars Set CarsDelete = 0 where CarsNo = ' + IntToStr(CarsNo));
  dmDataModule.quWork.Execute;

  dmDataModule.quCars.Refresh;
  DBGridEh1.Refresh;

end;

procedure TfmCars.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  dmDataModule.quCars.Close;
  dmDataModule.quCars.MacroByName('_where').Value:= '';
  dmDataModule.quCars.Open;

  DBGridEh1.Refresh;
end;

end.
