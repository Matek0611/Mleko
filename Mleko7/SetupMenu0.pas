unit SetupMenu0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, Buttons, ComCtrls, Menus, Db, 
  ImgList, citCtrls, citmask, citDBComboEdit, CFLMLKCustom,
  ActnList, MemDS, DBAccess, MSAccess;

type
  TfmSetupMenu = class(TCFLMLKCustomForm)
    tvMenu: TTreeView;
    bbOk: TBitBtn;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    bbWrite: TBitBtn;
    quMenu: TMSQuery;
    quWriteMenu: TMSQuery;
    quMenuItemName: TStringField;
    quMenuEnabled: TBooleanField;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    EdUser: TcitDBComboEdit;
    QuWriteAll: TMSQuery;
    procedure tvMenuMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure bbWriteClick(Sender: TObject);
    procedure tvMenuDblClick(Sender: TObject);
    procedure EdUserSelectOk(Sender: TObject);
    procedure quMenuBeforeOpen(DataSet: TDataSet);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    UserNoL:SmallInt;
    procedure ReadMenuToTree(Node:TTreeNode;MI:TMenuItem);
  public
    { Public declarations }
  end;

var
  fmSetupMenu: TfmSetupMenu;
  procedure SetupMenu(MI:TMenuItem;UserNo:SmallInt);
implementation



{$R *.DFM}
procedure SetupMenu(MI:TMenuItem;UserNo:SmallInt);
var
 i:integer;
begin
 fmSetupMenu:=TfmSetupMenu.Create(Application);
 try
 with fmSetupMenu do
  begin
   UserNoL:=UserNo;
   quMenu.Open;
   tvMenu.Items.BeginUpdate;
   tvMenu.Items.Clear;
   ReadMenuToTree(nil,MI);
   tvMenu.Items.EndUpdate;
  end;

 fmSetupMenu.ShowModal;
 finally
 fmSetupMenu.quMenu.Close;
 for i:=0 to fmSetupMenu.tvMenu.Items.Count-1 do
  begin
   if Assigned(fmSetupMenu.tvMenu.Items[i].Data) then
    StrDispose(PChar(fmSetupMenu.tvMenu.Items[i].Data));
  end;
 fmSetupMenu.Free;
 end;
end;

procedure TfmSetupMenu.ReadMenuToTree(Node:TTreeNode;MI:TMenuItem);
var
 NextNode:TTreeNode;
 i:integer;
begin
 for i:=0 to MI.Count-1 do
  begin
   NextNode:=tvMenu.Items.AddChild(Node,MI[i].Caption);
   if quMenu.Locate('ItemName',MI[i].Name,[]) and
      quMenuEnabled.AsBoolean then
    NextNode.StateIndex:=2
   else
    NextNode.StateIndex:=1;
   NextNode.Data:=StrNew(PChar(MI[i].Name));
   ReadMenuToTree(NextNode,MI[i]);
  end;
end;

procedure TfmSetupMenu.tvMenuMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 Point:TPoint;
begin
 Point.x:=X;
 Point.y:=Y;
 tvMenu.GetNodeAt(X,Y).Selected:=True;
 Point:=tvMenu.ClientToScreen(Point);
 if Button in [mbRight] then PopupMenu1.Popup(Point.X,Point.Y);
end;

procedure TfmSetupMenu.N1Click(Sender: TObject);
begin
 tvMenu.Items.BeginUpdate;
 tvMenu.Selected.StateIndex:=2;
 if Assigned(tvMenu.Selected.Parent) then
  tvMenu.Selected.Parent.StateIndex:=2;
 tvMenu.Items.EndUpdate;
end;

procedure TfmSetupMenu.N2Click(Sender: TObject);
var
 i:integer;
begin
 tvMenu.Items.BeginUpdate;
 tvMenu.Selected.StateIndex:=1;
 for i:=0 to tvMenu.Selected.Count-1 do
  tvMenu.Selected.Item[i].StateIndex:=1;
 tvMenu.Items.EndUpdate;
end;

procedure TfmSetupMenu.bbWriteClick(Sender: TObject);
var
 i:integer;
begin
 Screen.Cursor:=crHourGlass;
 for i:=0 to tvMenu.Items.Count-1 do
  begin
   if Assigned(tvMenu.Items[i].Data) then
    begin
     quWriteMenu.ParamByName('UserNo').AsInteger:=UserNoL;
     quWriteMenu.ParamByName('ItemName').AsString:=PChar(tvMenu.Items[i].Data);
     quWriteMenu.ParamByName('Enabled').AsBoolean:=tvMenu.Items[i].StateIndex=2;
     quWriteMenu.Execute;
    end;
  end;
 Screen.Cursor:=crDefault;
end;

procedure TfmSetupMenu.tvMenuDblClick(Sender: TObject);
begin
 if tvMenu.Selected.GetFirstChild=nil then
  begin
   case tvMenu.Selected.StateIndex of
    1:fmSetupMenu.N1Click(nil);
    2:fmSetupMenu.N2Click(nil);
   end;
  end;
end;

procedure TfmSetupMenu.EdUserSelectOk(Sender: TObject);
begin
  inherited;
  UserNoL:=StrToInt(EdUser.KeyFieldValue);
  quMenu.Close;
  quMenu.Open;  
end;

procedure TfmSetupMenu.quMenuBeforeOpen(DataSet: TDataSet);
begin
  inherited;
   quMenu.ParamByName('UserNo').AsInteger:=UserNoL;
end;

procedure TfmSetupMenu.BitBtn2Click(Sender: TObject);
begin
  inherited;
  QuWriteAll.Close;
  QuWriteAll.ParamByName('Enabled').AsInteger:=0;
  QuWriteAll.ParamByName('ItemName').AsString:=PChar(tvMenu.Selected.Data);
  QuWriteAll.Execute;
end;

procedure TfmSetupMenu.BitBtn1Click(Sender: TObject);
begin
  inherited;
  QuWriteAll.Close;
  QuWriteAll.ParamByName('Enabled').AsInteger:=1;
  QuWriteAll.ParamByName('ItemName').AsString:=PChar(tvMenu.Selected.Data);
  QuWriteAll.Execute;
end;

end.
