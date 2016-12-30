unit citDBGridLayout;

interface

uses
  citDBGridUtils,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Spin, ImgList, ActnList, Buttons,
  Menus, Grids, DBGrids, ToolWin;

type
  TDBGridLayoutDlg = class(TForm)
    TVMain: TTreeView;
    Panel1: TPanel;
    btnOK: TButton;
    btnCancel: TButton;
    GBFieldControl: TGroupBox;
    LabelMask: TLabel;
    EditMask: TEdit;
    Label1: TLabel;
    EditName: TEdit;
    SEWidth: TSpinEdit;
    SEHeight: TSpinEdit;
    Label2: TLabel;
    Label3: TLabel;
    CBxOrientation: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    EdTitleHeight: TEdit;
    ActionListMain: TActionList;
    ActionAddLevel: TAction;
    ActionDelLevel: TAction;
    ActionItemUp: TAction;
    ActionItemDown: TAction;
    ImageMain: TImageList;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    ImageListTVState: TImageList;
    ActionUniteItems: TAction;
    N5: TMenuItem;
    ChBxVisible: TCheckBox;
    N6: TMenuItem;
    ActionVisibility: TAction;
    ActionOrientHor: TAction;
    ActionOrientVer: TAction;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    ToolBar: TToolBar;
    TBUp: TToolButton;
    TBDown: TToolButton;
    TBVisAll: TToolButton;
    TBUnVisAll: TToolButton;
    TBLoadDefPr: TToolButton;
    ActionVisibleAll: TAction;
    ActionUnVisibleAll: TAction;
    ActionLoadDefaultProfile: TAction;
    Sep1: TToolButton;
    ActionFullUp: TAction;
    ActionFullDown: TAction;
    TBFullUp: TToolButton;
    TBFullDown: TToolButton;
    Sep2: TToolButton;
    procedure ActionAddLevelExecute(Sender: TObject);
    procedure ActionDelLevelExecute(Sender: TObject);
    procedure ActionItemUpExecute(Sender: TObject);
    procedure ActionItemDownExecute(Sender: TObject);
    procedure TVMainClick(Sender: TObject);
    procedure TVMainChange(Sender: TObject; Node: TTreeNode);
    procedure TVMainKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TVMainGetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure TVMainGetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure ChBxVisibleClick(Sender: TObject);
    procedure CBxOrientationChange(Sender: TObject);
    procedure SEHeightChange(Sender: TObject);
    procedure SEWidthChange(Sender: TObject);
    procedure EditMaskChange(Sender: TObject);
    procedure EditNameChange(Sender: TObject);
    procedure TVMainDblClick(Sender: TObject);
    procedure ActionVisibilityExecute(Sender: TObject);
    procedure ActionOrientHorExecute(Sender: TObject);
    procedure ActionOrientVerExecute(Sender: TObject);
    procedure TVMainDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure TVMainDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ActionUniteItemsExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ActionFullUpExecute(Sender: TObject);
    procedure ActionFullDownExecute(Sender: TObject);
    procedure ActionVisibleAllExecute(Sender: TObject);
    procedure ActionUnVisibleAllExecute(Sender: TObject);
    procedure ActionLoadDefaultProfileExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FOperChangeMode: boolean;
    FOwnerGrid: TDBGrid;
    FCanRenameColumns: boolean;
    FLoadOnlyFromDef: boolean;
    procedure ItemDataToCtrls;
    procedure RefreshCommonHeight;
    procedure ClearTreeData;
    function GetNodeHeight(pNode: TTreeNode): integer;
  public
    IsLoadedDef:Boolean;
    function CalcCommonHeight: integer;
    procedure SetCtrlsEnable;
    procedure Refresh;
    property OwnerGrid: TDBGrid read FOwnerGrid write FOwnerGrid;
  end;

  TFieldInfo = class
    DisplayLabel: string[255];
    FieldName: string[255];
    Mask: string[255];
    Orientation: TTextOrientation;
    Visible: boolean;
    DisplayWidth: integer;
    MinimalHeight: integer;
    constructor Create(AFieldName: string);
  end;

var
  DBGridLayoutDlg: TDBGridLayoutDlg;

const
  cMinHeight = 17;

implementation

{$R *.dfm}

uses
  DB, citDbGrid;

{ TFieldInfo }

constructor TFieldInfo.Create(AFieldName: string);
begin
  FieldName := AFieldName;
  DisplayLabel := '';
  Mask := '';
  Orientation := toHorizontal;
  Visible := False;
  DisplayWidth := 60;
  MinimalHeight := 17;
end;

{ TDBGridLayoutDlg }

procedure TDBGridLayoutDlg.FormCreate(Sender: TObject);
begin
  IsLoadedDef:=False;
  FOwnerGrid := nil;
  FOperChangeMode := True;
  FCanRenameColumns := True;
  FLoadOnlyFromDef := False;
end;

procedure TDBGridLayoutDlg.FormShow(Sender: TObject);
begin
  Refresh;
end;

procedure TDBGridLayoutDlg.FormDestroy(Sender: TObject);
begin
  ClearTreeData;
end;

procedure TDBGridLayoutDlg.SetCtrlsEnable;
var
  vNode: TTreeNode;
  vFI: TFieldInfo;
  vLevel: integer;
  UzshePora: boolean;
begin
  UzshePora := False;

  vNode := TVMain.Selected;
  if vNode = nil then Exit;
  vFI := TFieldInfo(vNode.Data);
  vLevel := vNode.Level;

  ActionAddLevel.Enabled := UzshePora and (vNode <> nil) and (not FLoadOnlyFromDef);
  ActionDelLevel.Enabled := UzshePora and (vNode <> nil) and (not FLoadOnlyFromDef) and (vLevel > 0);
  ActionUniteItems.Enabled := UzshePora and (vNode <> nil) and (not FLoadOnlyFromDef); // Romul: Multi Select of some hi level
  ActionItemUp.Enabled := (vNode <> nil) and (vNode.getPrevSibling <> nil) and
    ((vLevel <= 0) or not FLoadOnlyFromDef);
  ActionItemDown.Enabled := (vNode <> nil) and (vNode.getNextSibling <> nil) and
    ((vLevel <= 0) or not FLoadOnlyFromDef);
  ActionOrientHor.Enabled := (vFI <> nil);
  ActionOrientVer.Checked := (vFI <> nil);
  ActionVisibility.Checked := (vFI <> nil) and (vLevel = 0);

  EditName.ReadOnly := (not FCanRenameColumns) or FLoadOnlyFromDef;
  EditName.Enabled := FCanRenameColumns and (not FLoadOnlyFromDef);

  EditMask.ReadOnly := vLevel > 0;
  EditMask.Enabled := vLevel = 0;

  SEWidth.ReadOnly := vLevel > 0;
  SEWidth.Enabled := vLevel = 0;

  ChBxVisible.Enabled := vLevel = 0;

  ItemDataToCtrls;
end;

procedure TDBGridLayoutDlg.ActionItemUpExecute(Sender: TObject);
var
  vNode: TTreeNode;
begin
  vNode := TVMain.Selected; if vNode = nil then Exit;
  if vNode.getPrevSibling = nil then Exit;
  vNode.MoveTo(vNode.getPrevSibling, naInsert);
  TVMain.Invalidate;
  SetCtrlsEnable;
end;

procedure TDBGridLayoutDlg.ActionItemDownExecute(Sender: TObject);
var
  vNode: TTreeNode;
  vNodeDst: TTreeNode;
begin
  vNode := TVMain.Selected; if vNode = nil then Exit;
  vNodeDst := vNode.getNextSibling;
  if vNodeDst = nil then Exit;
  if vNodeDst.getNextSibling <> nil then
    vNode.MoveTo(vNodeDst.getNextSibling, naInsert)
  else vNode.MoveTo(vNodeDst, naAdd);

  TVMain.Invalidate;
  SetCtrlsEnable;
end;

procedure TDBGridLayoutDlg.TVMainClick(Sender: TObject);
begin
  ItemDataToCtrls;
  SetCtrlsEnable;
end;

procedure TDBGridLayoutDlg.TVMainChange(Sender: TObject;
  Node: TTreeNode);
begin
  SetCtrlsEnable;
end;

procedure TDBGridLayoutDlg.TVMainKeyPress(Sender: TObject;
  var Key: Char);
begin
  SetCtrlsEnable;
end;

procedure TDBGridLayoutDlg.Refresh;
var
  TN: TTreeNode;
  i, j: integer;
  vFI: TFieldInfo;
  vName: string;
  vFldData: TFieldProfileData;
  vLev: TLevelData;
  vFIChild: TFieldInfo;
begin
  ClearTreeData;
  FCanRenameColumns := TcitDBGrid(FOwnerGrid).CanRenameColumns;
  FLoadOnlyFromDef := TcitDBGrid(FOwnerGrid).LoadOnlyFromDefault;
  TVMain.Items.Clear;
  with TDBGrid(FOwnerGrid).DataSource.DataSet do
    for i := 0 to FieldCount - 1 do
    begin
      vName := Fields[i].DisplayLabel;
      vFI := TFieldInfo.Create(Fields[i].FieldName);

      vFI.DisplayLabel := Fields[i].DisplayLabel;

      if (Fields[i] is TNumericField) then
        vFI.Mask := (Fields[i] as TNumericField).DisplayFormat
      else if (Fields[i] is TDateTimeField) then
        vFI.Mask := (Fields[i] as TDateTimeField).DisplayFormat
      else
        vFI.Mask := Fields[i].EditMask;

      vFI.Visible := Fields[i].Visible;
      vFI.DisplayWidth := Fields[i].DisplayWidth;

      vFldData := TcitDBGrid(FOwnerGrid).FldProfiles.ItemsByFieldName[vFI.FieldName];

      TN := TVMain.Items.AddObject(nil, vName, vFI);
      if vFldData <> nil then
      begin
        vFI.Orientation := vFldData.Orientation;
        vFI.MinimalHeight := vFldData.MinimalHeight;
        for j := 0 to vFldData.Items.Count - 1 do
        begin
          vLev := TLevelData(vFldData.Items[j]);
          vFIChild := TFieldInfo.Create(Fields[i].FieldName);
          vFIChild.DisplayLabel := vLev.DisplayLabel;
          vFIChild.Orientation := vLev.Orientation;
          vFIChild.MinimalHeight := vLev.MinimalHeight;
          vFIChild.Mask := vFI.Mask;
          vFIChild.Visible := vFI.Visible;
          vFIChild.DisplayWidth := vFI.DisplayWidth;
          TN := TVMain.Items.AddChildObject(TN, vLev.DisplayLabel, vFIChild);
        end;
      end;
    end;
  RefreshCommonHeight;
end;

procedure TDBGridLayoutDlg.TVMainGetImageIndex(Sender: TObject;
  Node: TTreeNode);
var
  vFI: TFieldInfo;
begin
  if Node.Data = nil then begin Node.ImageIndex := -1; Exit; end;
  vFI := TFieldInfo(Node.Data);
  Node.ImageIndex := Byte(vFI.Orientation = toVertical) * 2 + Byte(not vFI.Visible);
end;

procedure TDBGridLayoutDlg.TVMainGetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
var
  vFI: TFieldInfo;
begin
  if Node.Data = nil then begin Node.SelectedIndex := -1; Exit; end;
  vFI := TFieldInfo(Node.Data);
  Node.SelectedIndex := Byte(vFI.Orientation = toVertical) * 2 + Byte(not vFI.Visible);
end;

procedure TDBGridLayoutDlg.ItemDataToCtrls;
var
  vNode: TTreeNode;
  vFI: TFieldInfo;
begin
  vNode := TVMain.Selected;
  if vNode = nil then Exit; if vNode.Data = nil then Exit;
  vFI := TFieldInfo(vNode.Data);
  FOperChangeMode := False;
  try
    GBFieldControl.Caption := 'Поле: ' + vFI.FieldName;
    EditMask.Text := vFI.Mask;
    EditName.Text := vFI.DisplayLabel;
    SEWidth.Value := vFI.DisplayWidth;
    SEHeight.Value := vFI.MinimalHeight;
    ChBxVisible.Checked := vFI.Visible;
    CBxOrientation.ItemIndex := Byte(vFI.Orientation = toVertical);

    if vFI.Orientation = toHorizontal then ActionOrientHor.Checked := True
    else ActionOrientVer.Checked := True;
    ActionVisibility.Checked := vFI.Visible;
  finally
    FOperChangeMode := True;
  end;
  RefreshCommonHeight;
end;

procedure TDBGridLayoutDlg.ChBxVisibleClick(Sender: TObject);
var
  vNode: TTreeNode;
  vFI: TFieldInfo;
begin
  if not FOperChangeMode then Exit;
  vNode := TVMain.Selected;
  if vNode = nil then Exit; if vNode.Data = nil then Exit;
  vFI := TFieldInfo(vNode.Data);
  vFI.Visible := ChBxVisible.Checked;
  ActionVisibility.Checked := ChBxVisible.Checked;
  TVMain.Invalidate;
end;

procedure TDBGridLayoutDlg.CBxOrientationChange(Sender: TObject);
var
  vNode: TTreeNode;
  vFI: TFieldInfo;
begin
  if not FOperChangeMode then Exit;
  vNode := TVMain.Selected;
  if vNode = nil then Exit; if vNode.Data = nil then Exit;
  vFI := TFieldInfo(vNode.Data);
  if CBxOrientation.ItemIndex = 0 then
  begin
    vFI.Orientation := toHorizontal;
    ActionOrientHor.Checked := True;
  end
  else begin
    vFI.Orientation := toVertical;
    ActionOrientVer.Checked := True;
  end;
  TVMain.Invalidate;
end;

procedure TDBGridLayoutDlg.SEHeightChange(Sender: TObject);
var
  vNode: TTreeNode;
  vFI: TFieldInfo;
begin
  if not FOperChangeMode then Exit;
  vNode := TVMain.Selected;
  if vNode = nil then Exit; if vNode.Data = nil then Exit;
  vFI := TFieldInfo(vNode.Data);
  vFI.MinimalHeight := SEHeight.Value;
  RefreshCommonHeight;
end;

procedure TDBGridLayoutDlg.SEWidthChange(Sender: TObject);
var
  vNode: TTreeNode;
  vFI: TFieldInfo;
begin
  if not FOperChangeMode then Exit;
  vNode := TVMain.Selected;
  if vNode = nil then Exit; if vNode.Data = nil then Exit;
  vFI := TFieldInfo(vNode.Data);
  vFI.Visible := ChBxVisible.Checked;
  vFI.DisplayWidth := SEWidth.Value;
end;

procedure TDBGridLayoutDlg.EditMaskChange(Sender: TObject);
var
  vNode: TTreeNode;
  vFI: TFieldInfo;
begin
  if not FOperChangeMode then Exit;
  vNode := TVMain.Selected;
  if vNode = nil then Exit; if vNode.Data = nil then Exit;
  vFI := TFieldInfo(vNode.Data);
  vFI.Visible := ChBxVisible.Checked;
  vFI.Mask := EditMask.Text;
end;

procedure TDBGridLayoutDlg.EditNameChange(Sender: TObject);
var
  vNode: TTreeNode;
  vFI: TFieldInfo;
begin
  if not FOperChangeMode then Exit;
  vNode := TVMain.Selected;
  if vNode = nil then Exit; if vNode.Data = nil then Exit;
  vFI := TFieldInfo(vNode.Data);
  vFI.DisplayLabel := EditName.Text;
  vNode.Text := EditName.Text;
  TVMain.Invalidate;
end;

function TDBGridLayoutDlg.GetNodeHeight(pNode: TTreeNode): integer;
var
  vHeightColumn: integer;
  vFI: TFieldInfo;
  vOwnHeight: integer;
  i: integer;
begin
  Result := 0; if pNode = nil then Exit;
  vFI := TFieldInfo(pNode.Data);
  vOwnHeight := 0;
  if vFI <> nil then
  begin
    Result := vFI.MinimalHeight;
    vOwnHeight := Result;
  end;
  for i := 0 to pNode.Count - 1 do
  begin
    vHeightColumn := GetNodeHeight(pNode[i]);
    if Result < (vOwnHeight + vHeightColumn) then
      Result := vOwnHeight + vHeightColumn;
  end;
end;

function TDBGridLayoutDlg.CalcCommonHeight: integer;
var
  vHeightColumn: integer;
  vNode: TTreeNode;
begin
  Result := cMinHeight;
  vNode := TVMain.Items.GetFirstNode;
  while vNode <> nil do
  begin
    vHeightColumn := GetNodeHeight(vNode);
    if Result < vHeightColumn then Result := vHeightColumn;
    vNode := vNode.getNextSibling;
  end;
end;

procedure TDBGridLayoutDlg.RefreshCommonHeight;
begin
  EdTitleHeight.Text := IntToStr(CalcCommonHeight);
end;

procedure TDBGridLayoutDlg.ClearTreeData;
var
  vNode: TTreeNode;
  vFI: TFieldInfo;
begin
  vNode := TVMain.Items.GetFirstNode;
  while vNode <> nil do
  begin
    if vNode.Data <> nil then
    begin
      vFI := TFieldInfo(vNode.Data);
      vFI.Free;
      vNode.Data := nil;
    end;
    vNode := vNode.getNext;
  end;
end;

procedure TDBGridLayoutDlg.TVMainDblClick(Sender: TObject);
begin
  if ActionVisibility.Enabled then
    ActionVisibilityExecute(Self);
end;

procedure TDBGridLayoutDlg.ActionVisibilityExecute(Sender: TObject);
var
  vNode: TTreeNode;
  vFI: TFieldInfo;
begin
  if not FOperChangeMode then Exit;
  vNode := TVMain.Selected;
  if vNode = nil then Exit; if vNode.Data = nil then Exit;
  vFI := TFieldInfo(vNode.Data);
  ActionVisibility.Checked := not ActionVisibility.Checked;
  vFI.Visible := ActionVisibility.Checked;
  ChBxVisible.Checked := ActionVisibility.Checked;
  TVMain.Invalidate;
end;

procedure TDBGridLayoutDlg.ActionOrientHorExecute(Sender: TObject);
var
  vNode: TTreeNode;
  vFI: TFieldInfo;
begin
  if not FOperChangeMode then Exit;
  vNode := TVMain.Selected;
  if vNode = nil then Exit; if vNode.Data = nil then Exit;
  if ActionOrientHor.Checked then Exit;
  vFI := TFieldInfo(vNode.Data);
  ActionOrientHor.Checked := True;
  vFI.Orientation := toHorizontal;
  CBxOrientation.ItemIndex := 0;
  TVMain.Invalidate;
end;

procedure TDBGridLayoutDlg.ActionOrientVerExecute(Sender: TObject);
var
  vNode: TTreeNode;
  vFI: TFieldInfo;
begin
  if not FOperChangeMode then Exit;
  vNode := TVMain.Selected;
  if vNode = nil then Exit; if vNode.Data = nil then Exit;
  if ActionOrientVer.Checked then Exit;
  vFI := TFieldInfo(vNode.Data);
  ActionOrientVer.Checked := True;
  vFI.Orientation := toVertical;
  CBxOrientation.ItemIndex := 1;
  TVMain.Invalidate;
end;

procedure TDBGridLayoutDlg.TVMainDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  AnItem: TTreeNode;
  AttachMode: TNodeAttachMode;
  HT: THitTests;
  SelNode: TTreeNode;
begin
  SelNode := TVMain.Selected;
  if SelNode = nil then Exit;
  HT := TVMain.GetHitTestInfoAt(X, Y);
  AnItem := TVMain.GetNodeAt(X, Y);
  if (HT - [htOnItem, htOnIcon, htNowhere, htOnIndent] <> HT) then
  begin
    if (htOnItem in HT) or (htOnIcon in HT) then AttachMode := naInsert
    else if htNowhere in HT then AttachMode := naAdd
    else if htOnIndent in HT then AttachMode := naInsert
    else AttachMode := naAdd;
//    if SelNode = nil then SBDebug.Panels[0].Text := SelNode.Text + ' - ' + Ord(AttachMode);
    SelNode.MoveTo(AnItem, AttachMode);
  end;
end;

procedure TDBGridLayoutDlg.TVMainDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := (Source is TTreeView) and (Source = TVMain) {and (not FLoadOnlyFromDef)};
{  SBDebug.Panels[1].Text := 'TV=' + IntToStr(Byte(Source is TTreeView))
    + ' TVMn=' + IntToStr(Byte(Source = TVMain))
//    + ' ~Def=' + IntToStr(Byte(not FLoadOnlyFromDef))
    + ' == ' + IntToStr(Byte(Accept));}
end;

procedure TDBGridLayoutDlg.ActionAddLevelExecute(Sender: TObject);
var
  vNode: TTreeNode;
  vFI: TFieldInfo;
  vFIRoot: TFieldInfo;
  RootNode: TTreeNode;
begin
  vNode := TVMain.Selected; if vNode = nil then Exit;
  if (vNode.Level > 0) and FLoadOnlyFromDef then Exit;
  RootNode := vNode; while RootNode.Level > 0 do RootNode := RootNode.Parent;
  vFIRoot := TFieldInfo(RootNode.Data);
  while vNode.Count > 0 do vNode := vNode.getFirstChild;
  vFI := TFieldInfo.Create(vFIRoot.FieldName);
  vFI.DisplayLabel := vFIRoot.DisplayLabel;
  vFI.Mask := vFIRoot.Mask;
  vFI.Visible := vFIRoot.Visible;
  vFI.DisplayWidth := vFIRoot.DisplayWidth;
  vFI.Orientation := vFIRoot.Orientation;
  vFI.MinimalHeight := vFIRoot.MinimalHeight;
  TVMain.Items.AddChildObject(vNode, vFIRoot.DisplayLabel, vFI);
  RefreshCommonHeight;
end;

procedure TDBGridLayoutDlg.ActionDelLevelExecute(Sender: TObject);
var
  vNode: TTreeNode;
  vChildNode: TTreeNode;
  vFI: TFieldInfo;
begin
  vNode := TVMain.Selected; if vNode = nil then Exit;
  if (vNode.Level > 0) and FLoadOnlyFromDef then Exit;
  if vNode.Level < 1 then Exit;
  if MessageDlg('Действительно удалить уровень "' + vNode.Text + '"?',
    mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;
  vFI := TFieldInfo(vNode.Data);
  if vFI <> nil then
  begin
    vFI.Free;
    vNode.Data := nil;
  end;
  vChildNode := vNode.getFirstChild;
  while vChildNode <> nil do
  begin
    vChildNode.MoveTo(vNode.Parent, naAddChild);
    vChildNode := vNode.getFirstChild;
  end;
  vNode.Delete;
  RefreshCommonHeight;
end;

procedure TDBGridLayoutDlg.ActionUniteItemsExecute(Sender: TObject);
var
  vNode: TTreeNode;
begin
  vNode := TVMain.Selected; if vNode = nil then Exit; if FLoadOnlyFromDef then Exit;
  if vNode.Level <> 1 then Exit; //???
  ShowMessage('Функция "Объединить общим верхним уровенем" в разработке.');
end;

procedure TDBGridLayoutDlg.Button1Click(Sender: TObject);
{var
  vFldProfiles	: TFieldProfiles;
  vFldData	: TFieldProfileData;
  vLev		: TLevelData;
  i, j		: integer;
  vName		: string;}
begin
{  vFldProfiles := TDBGrid(FOwnerGrid).FldProfiles;
  for i := 0 to vFldProfiles.Count  -1 do
  begin
    vFldData := vFldProfiles.Items[i];
    if vFldData = nil then Count;
    for j := vFldData.Items.Count - 1 downto 0 do
    begin
      vLev := TLevelData(vFldData.Items[j]);
      vLev.DisplayLabel;
      vName := ;
    end;
  end;}
end;

procedure TDBGridLayoutDlg.ActionFullUpExecute(Sender: TObject);
var
  vNode: TTreeNode;
begin
  vNode := TVMain.Selected;
  if vNode = nil then Exit;
  vNode.MoveTo(TVMain.Items[0], naInsert);
  TVMain.Invalidate;
  SetCtrlsEnable;
end;

procedure TDBGridLayoutDlg.ActionFullDownExecute(Sender: TObject);
var
  vNode: TTreeNode;
begin
  vNode := TVMain.Selected;
  if vNode = nil then Exit;
  vNode.MoveTo(TVMain.Items[TVMain.Items.Count - 1], naAdd);
  TVMain.Invalidate;
  SetCtrlsEnable;
end;

procedure TDBGridLayoutDlg.ActionVisibleAllExecute(Sender: TObject);
var
  vNode: TTreeNode;
  vFI: TFieldInfo;
  i: Integer;
begin
  if not FOperChangeMode then Exit;
  for i := 0 to TVMain.Items.Count - 1 do
  begin
    vNode := TVMain.Items[i];
    if not ((vNode = nil) and (vNode.Data = nil)) then
    begin
      vFI := TFieldInfo(vNode.Data);
      vFI.Visible := true;
    end;
  end;
  TVMain.Invalidate;
end;

procedure TDBGridLayoutDlg.ActionUnVisibleAllExecute(Sender: TObject);
var
  vNode: TTreeNode;
  vFI: TFieldInfo;
  i: Integer;
begin
  if not FOperChangeMode then Exit;
  for i := 0 to TVMain.Items.Count - 1 do
  begin
    vNode := TVMain.Items[i];
    if not ((vNode = nil) and (vNode.Data = nil)) then
    begin
      vFI := TFieldInfo(vNode.Data);
      vFI.Visible := false;
    end;
  end;
  TVMain.Invalidate;
end;

procedure TDBGridLayoutDlg.ActionLoadDefaultProfileExecute(
  Sender: TObject);
var
  Grid:TcitDBGrid;
begin
  Grid:=TcitDBGrid(FOwnerGrid);
  IsLoadedDef:=True;
  Grid.RestoreDefaultFormat;
  Refresh;
end;



procedure TDBGridLayoutDlg.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var i,k: Integer;
    vFI: TFieldInfo;
begin
  k:=0;
  for i := 0 to TVMain.Items.Count - 1 do
  begin
    vFI := TFieldInfo(TVMain.Items[i].Data);
    if vFI.Visible then K:=k+1;
  end;
  if (k=0) and (ModalResult=MrOk) then
  begin
    CanClose:=False;
    MessageBox(0, 'Должен быть видим хотя бы один стобец', 'Ошибка', MB_ICONERROR or MB_OK);
  end;
end;

end.

