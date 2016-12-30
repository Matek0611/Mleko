unit Company0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  ExtCtrls, StdCtrls, Buttons, DB, ToolWin,
  ComCtrls, DBGridEh, GridsEh, ActnList;

type
  TfmCompany = class(TMlekoForm)
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    DBGridEh1: TDBGridEh;
    CoolBar1: TCoolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    { Private declarations }
    SearchString:string;
  public
    { Public declarations }
  end;

type TRetCompany=record
   CompanyNo  :SmallInt;
   NameCompany:string;
end;

var
  fmCompany: TfmCompany;
  function Company(Select, Visible:boolean):TRetCompany;
implementation

uses data, EditCompany0;

{$R *.DFM}

function Company(Select, Visible:boolean):TRetCompany;
begin
 Result.CompanyNo:=0;
 fmCompany:=TfmCompany.Create(Application);
 try
 if Visible then dmDataModule.quCompany.MacroByName('_where').Value:='where Visible=0 '
 else dmDataModule.quCompany.MacroByName('_where').Value:=' ';
 dmDataModule.quCompany.Open;
 fmCompany.DBGridEh1.Col:=1;
 if fmCompany.ShowModal=mrOk then
  begin
   Result.CompanyNo:=dmDataModule.quCompanyCompanyNo.AsInteger;
   Result.NameCompany:=dmDataModule.quCompanyNameCompany.AsString;
  end;
 finally
 dmDataModule.quCompany.Close;
 fmCompany.Free;
 end;
end;

procedure TfmCompany.DBGridEh1DblClick(Sender: TObject);
begin
 EditCompany;
end;

procedure TfmCompany.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
  VK_RETURN:EditCompany;
  VK_INSERT: begin
              Key:=0;
              dmDataModule.quCompany.Append;
              EditCompany;
             end;
  VK_DOWN,VK_UP:SearchString:='';
  VK_DELETE:if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
             dmDataModule.quCompany.Delete;
 end;
end;

procedure TfmCompany.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
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

procedure TfmCompany.DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
var
 CompanyNo:integer;
begin
 CompanyNo:=dmDataModule.quCompanyCompanyNo.AsInteger;
 dmDataModule.quCompany.Close;
 case ACol of
  0:dmDataModule.quCompany.MacroByName('_order').Value:='NameCompany';
  1:dmDataModule.quCompany.MacroByName('_order').Value:='PercentSalary,NameCompany';
 end;
 dmDataModule.quCompany.Open;
 dmDataModule.quCompany.Locate('CompanyNo',CompanyNo,[]);
end;

procedure TfmCompany.SpeedButton4Click(Sender: TObject);
begin
 EditCompany;
end;

procedure TfmCompany.SpeedButton1Click(Sender: TObject);
begin
 dmDataModule.quCompany.Append;
 EditCompany;
end;

procedure TfmCompany.SpeedButton5Click(Sender: TObject);
begin
 if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
    dmDataModule.quCompany.Delete;
end;

procedure TfmCompany.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if (Rect.Top = DBGridEh1.CellRect(DBGridEh1.Col,DBGridEh1.Row).Top) then
    DBGridEh1.Canvas.Brush.Color := $00E9E9E9;
  DBGridEh1.DefaultDrawColumnCell(Rect,DataCol,Column,State);

  if dmDataModule.quCompanyVisible.AsBoolean then
    DBGridEh1.Canvas.Font.Color := clRed;
  DBGridEh1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

end.
