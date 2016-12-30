unit Regions0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  ExtCtrls, StdCtrls, Buttons, DB,  ToolWin, ComCtrls, DBGridEh,
  GridsEh, ActnList;

type
  TfmRegions = class(TMlekoForm)
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    RxDBGrid1: TDBGridEh;
    CoolBar1: TCoolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    procedure RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
    SearchString:string;
  public
    { Public declarations }
  end;

var
  fmRegions: TfmRegions;
  procedure Regions(Visible: Boolean);
implementation

uses data, EditRegion0;

{$R *.DFM}

procedure Regions(Visible: Boolean);
begin
 fmRegions:=TfmRegions.Create(Application);
 try
 if Visible then dmDataModule.quRegions.MacroByName('_where').Value:='where Visible=0 '
 else dmDataModule.quRegions.MacroByName('_where').Value:=' ';
 dmDataModule.quRegions.Open;
// fmRegions.RxDBGrid1.Col:=2;
 fmRegions.ShowModal;
 finally
 dmDataModule.quRegions.Close;
 fmRegions.Free;
 end;
end;

procedure TfmRegions.RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
  Field: TField);
var
 RegionNo:integer;
begin
 RegionNo:=dmDataModule.quRegionsRegionNo.AsInteger;
 dmDataModule.quRegions.Close;
 case ACol of
  0:dmDataModule.quRegions.MacroByName('_order').Value:='RegionNo';
  1:dmDataModule.quRegions.MacroByName('_order').Value:='RegionName';
 end;
 dmDataModule.quRegions.Open;
 dmDataModule.quRegions.Locate('RegionNo',RegionNo,[]);
end;

procedure TfmRegions.DBGridEh1DblClick(Sender: TObject);
begin
 EditRegion;
end;

procedure TfmRegions.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if (Rect.Top = RxDBGrid1.CellRect(RxDBGrid1.Col,RxDBGrid1.Row).Top) then
    RxDBGrid1.Canvas.Brush.Color := $00E9E9E9;
  RxDBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
  if dmDataModule.quRegionsVisible.AsBoolean then
    RxDBGrid1.Canvas.Font.Color := clRed;
  RxDBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TfmRegions.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
var
 Found:boolean;
begin
 if (Key in Data.SearchSet) then
  begin
   SearchString:=SearchString+Key;
   Key:=Chr(0);
   Found:=False;
   try
   Found:=RxDBGrid1.DataSource.DataSet.Locate(RxDBGrid1.Columns[RxDBGrid1.Col-1].FieldName,SearchString,[loPartialKey,loCaseInsensitive]);
   except
   SearchString:='';
   end;
   if (not Found) and (RxDBGrid1.Columns[RxDBGrid1.Col-1].Field.DataType=ftString) then
    SearchString:=Copy(SearchString,1,length(SearchString)-1);
  end;
end;

procedure TfmRegions.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
  VK_RETURN:EditRegion;
  VK_INSERT: begin
              Key:=0;
              dmDataModule.quRegions.Append;
              EditRegion;
             end;
  VK_DOWN,VK_UP:SearchString:='';
  VK_DELETE:if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
             dmDataModule.quRegions.Delete;
 end;
end;

procedure TfmRegions.SpeedButton4Click(Sender: TObject);
begin
 EditRegion;
end;

procedure TfmRegions.SpeedButton1Click(Sender: TObject);
begin
 dmDataModule.quRegions.Append;
 EditRegion;
end;

procedure TfmRegions.SpeedButton5Click(Sender: TObject);
begin
 if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
  dmDataModule.quRegions.Delete;
end;

end.
