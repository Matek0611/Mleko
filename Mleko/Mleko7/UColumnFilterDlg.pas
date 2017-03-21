unit UColumnFilterDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ImgList, StdCtrls, ExtCtrls, CheckLst, ToolWin, Menus;

const
  ueResetFiltering = 1;
  ueSortUp = 2;
  ueSortDown = 3;
  ueRefreshList = 4;

type
  TfrmColumnFilter = class(TForm)
    ImageList1: TImageList;
    pnlBottom: TPanel;
    btnOK: TButton;
    btnCancel: TButton;
    clbFilter: TCheckListBox;
    cbxRoot: TCheckBox;
    sbStatus: TStatusBar;
    ToolBar: TToolBar;
    btnReset: TToolButton;
    ToolButton1: TToolButton;
    btnSortUp: TToolButton;
    ToolButton2: TToolButton;
    SortDown: TToolButton;
    btn1: TToolButton;
    btnFindBeg: TToolButton;
    btnFindEnd: TToolButton;
    btnFindMid: TToolButton;
    btnFindMore: TToolButton;
    btnFindLess: TToolButton;
    btnFindEqual: TToolButton;
    btnRefreshList: TToolButton;
    ToolButton3: TToolButton;
    pmFilter: TPopupMenu;
    mnuEnableAllUp: TMenuItem;
    mnuEnableAllDown: TMenuItem;
    mnuDisableAllUp: TMenuItem;
    mnuDisableAllDown: TMenuItem;
    mnuFindItem: TMenuItem;
    mnuReorderList: TMenuItem;
    procedure clbFilterClickCheck(Sender: TObject);
    procedure cbxRootClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btnSortUpClick(Sender: TObject);
    procedure SortDownClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnRefreshListClick(Sender: TObject);
    procedure mnuEnableAllUpClick(Sender: TObject);
    procedure mnuEnableAllDownClick(Sender: TObject);
    procedure mnuDisableAllUpClick(Sender: TObject);
    procedure mnuDisableAllDownClick(Sender: TObject);
    procedure mnuFindItemClick(Sender: TObject);
    procedure mnuReorderListClick(Sender: TObject);
  private
    LastSearchStr: string;
    Root, Data: TStrings;
    CheckedCount, DisableCount: Integer;
    XPos, YPos: Integer;
    TotalSum, SelSum: Integer;
    QtyList: TList;
    XYPosUsed: Boolean;
    FiltEvent: TNotifyEvent;
    DataVarType: TVarType;
    procedure AcceptItems(Items: TStrings; Counts: TList; RootName: string = '';
      UseObjects: Boolean = False);
    procedure SetAllItemsState(IsChecked: Boolean);
    function GetCheckedState(i: Integer): Boolean;
    function SetCheckedState(i: Integer; IsChecked: Boolean): Boolean;
    function GetCheckedValue(i: Integer): Boolean;
    function SetCheckedValue(i: Integer; IsChecked: Boolean): Boolean;
    procedure SetGrayState;
    function ToggleCheckedState(i: Integer): Boolean;
    procedure ChangeItemState(i: Integer; DoToggle: Boolean = False;
      ToggleIsNewState: Boolean = False);
    function UpdateItems(Items: TStrings): Integer;
    procedure ShowStatus;
    procedure UpdateRootState;
    procedure UpdateFindButtons(DoUpdate: Boolean);
    procedure ClearFilterItems;
    function GetItemCount: Integer;
    procedure AddItem(AText: string; AState, ACount: Integer; var IsChecked: Boolean);
    procedure EnableAllUpDown(Direction: Integer; Enable: Boolean);
    procedure FindItem;
    procedure RefreshRootItems(ItemIndex: Integer =-1; UseObjects: Boolean = True);
    function GetQtyValue(i: Integer): Integer;
    procedure SortListUpDown(Direction: Integer = 0; InverseDir: Boolean = True);
    procedure UpdateReorderListMenu;
    { Private declarations }
  public
    { Public declarations }
  end;

function IsColumnFilterDlgVisible(): Boolean;

procedure CloseColumnFilterDlg();
function EnteredSecretCode: Integer;

function ColumnFilterDlg(Owner: TComponent; Items: TStrings; Counts: TList;
  RootName: string = ''; P: PRect = nil; UseObjects: Boolean = False; FiltEvent:
  TNotifyEvent = nil; AsModal: Boolean = True): Integer;

const
//ImageList.StateIndex=0 has some bugs, so we add one dummy image to position 0
  cFlatUnCheck = 1;
  cFlatChecked = 2;
  cFlatGray = 3;
  CheckedStates: array[Boolean] of Integer = (cFlatUnCheck, cFlatChecked);

var
  frmColumnFilter: TfrmColumnFilter;

implementation

uses
  MlekoUtils, Types;

{$R *.dfm}

const

  idReorderList = 'Упорядочить ';
  ReorderListDirs: array[Boolean] of ShortString = ('вверх', 'вниз');

var
  SortListDirection: Integer = 1;
  SecretCode: Integer = 0;

function EnteredSecretCode: Integer;
begin
  Result:= SecretCode;
end;

function StringListCompareStringsDown(List: TStringList; Index1, Index2: Integer):
  Integer;
begin
  Result := AnsiCompareText(List[Index1], List[Index2]);
end;

function StringListCompareStringsUp(List: TStringList; Index1, Index2: Integer): Integer;
begin
  Result := AnsiCompareText(List[Index2], List[Index1]);
end;

function StringListCompareStrings(List: TStringList; Index1, Index2: Integer): Integer;
begin
  Result := AnsiCompareText(List[Index2], List[Index1])*SortListDirection;
end;

function StringListCompareIntegersDown(List: TStringList; Index1, Index2:
  Integer): Integer;
begin
  Result := StrToIntDef(List[Index1], 0) - StrToIntDef(List[Index2], 0);
end;

function StringListCompareIntegers(List: TStringList; Index1, Index2:
  Integer): Integer;
begin
  Result := (StrToIntDef(List[Index1], 0) - StrToIntDef(List[Index2], 0))*SortListDirection;
end;

function StringListCompareIntegersUp(List: TStringList; Index1, Index2: Integer): Integer;
begin
  Result := StrToIntDef(List[Index2], 0) - StrToIntDef(List[Index1], 0);
end;

procedure CustomSortStrings(Items: TStrings; Direction: Integer;
  AsInteger: Boolean = False);
var
  StrList: TStringList;
begin
  StrList := TStringList.Create;
  try
    StrList.Assign(Items);
    SortListDirection:= Direction;
    if AsInteger then
       StrList.CustomSort(StringListCompareIntegers) else
       StrList.CustomSort(StringListCompareStrings);
    Items.BeginUpdate;
    Items.Assign(StrList);
    Items.EndUpdate;
  finally
    StrList.Free;
  end;
end;

function IsColumnFilterDlgVisible(): Boolean;
begin
  Result := (frmColumnFilter <> nil) and (frmColumnFilter.Visible);
end;

procedure CloseColumnFilterDlg();
begin
  if (frmColumnFilter <> nil) then
  begin
    frmColumnFilter.Close;
    Application.ProcessMessages;
  end;
end;

function ColumnFilterDlg(Owner: TComponent; Items: TStrings; Counts: TList;
  RootName: string = ''; P: PRect = nil; UseObjects: Boolean = False; FiltEvent:
  TNotifyEvent = nil; AsModal: Boolean = True): Integer;
begin
  if (frmColumnFilter = nil) then
  begin
    if (Owner = nil) then
      Owner := Application;
    frmColumnFilter := TfrmColumnFilter.Create(Owner);
  end;
  if (P <> nil) then
    with P^ do
    begin
      frmColumnFilter.Top := Top;
      if (Right + frmColumnFilter.Width < Screen.Width) then
        frmColumnFilter.Left := Right
      else
        frmColumnFilter.Left := Left - frmColumnFilter.Width;
    end;
  frmColumnFilter.XYPosUsed := False;
  frmColumnFilter.FiltEvent := FiltEvent;
  frmColumnFilter.AcceptItems(Items, Counts, RootName, UseObjects);
  AsModal := AsModal or (not Assigned(FiltEvent));
  if AsModal then
     if not frmColumnFilter.Visible then
  begin
    frmColumnFilter.FormStyle := fsNormal;
    Result := frmColumnFilter.ShowModal;
  end
  else else
  begin
    frmColumnFilter.Show;
    frmColumnFilter.FormStyle := fsStayOnTop;
  end;
  if AsModal then
  begin
    {
    frmColumnFilter.UpdateItems(Items);
    if Result = mrOk then
      Result := frmColumnFilter.CheckedCount
    else
      Result := -1;
      }
  end;
  //FreeAndNil(frmColumnFilter);
end;

function TfrmColumnFilter.SetCheckedState(i: Integer; IsChecked: Boolean): Boolean;
begin
  Inc(DisableCount);
  if (i < 0) then
    cbxRoot.Checked := IsChecked
  else
  begin
    clbFilter.Checked[i] := IsChecked;
    SetCheckedValue(i, IsChecked);
  end;
  Dec(DisableCount);
  Result := IsChecked;
end;

function TfrmColumnFilter.GetCheckedState(i: Integer): Boolean;
begin
  Inc(DisableCount);
  if (i < 0) then
    Result := (cbxRoot.State = cbChecked)
  else
    Result := clbFilter.Checked[i];
  Dec(DisableCount);
end;

procedure TfrmColumnFilter.SetGrayState();
begin
  Inc(DisableCount);
  cbxRoot.State := cbGrayed;
  Dec(DisableCount);
end;

procedure TfrmColumnFilter.UpdateRootState();
begin
  if (CheckedCount > 0) then
    if (CheckedCount <> Root.Count) then
      SetGrayState()
    else
      SetCheckedState(-1, True)
  else
    SetCheckedState(-1, False);
end;

procedure TfrmColumnFilter.UpdateFindButtons(DoUpdate: Boolean);
begin
  if Data.Count > 0 then
  begin
    DataVarType := DetectDataType(Data[0]);
    if not DoUpdate then
      Exit;
    btnFindMore.Visible := (DataVarType <> varString);
    btnFindLess.Visible := (DataVarType <> varString);
    btnFindEqual.Visible := (DataVarType <> varString);
    btnFindBeg.Visible := (DataVarType = varString);
    btnFindEnd.Visible := (DataVarType = varString);
    btnFindMid.Visible := (DataVarType = varString);
  end;
end;

procedure TfrmColumnFilter.AddItem(AText: string; AState: Integer; ACount:
  Integer; var IsChecked: Boolean);
begin
  IsChecked := Boolean(AState);
  clbFilter.Checked[Root.Add(Format('%s (%d)', [AText, ACount]))] := IsChecked;
end;

procedure TfrmColumnFilter.ClearFilterItems();
begin
  clbFilter.Clear;
  //Root.Clear;
end;

function TfrmColumnFilter.GetItemCount(): Integer;
begin
  Result := Root.Count;
end;

function TfrmColumnFilter.GetQtyValue(i: Integer): Integer;
begin
  Result:= 0;
  if (i<0) then Exit;
  Result:= Integer(QtyList[Abs(Integer(Data.Objects[i]))-1]);
end;

function TfrmColumnFilter.GetCheckedValue(i: Integer): Boolean;
begin
  Result:= False;
  if (i<0) then Exit;
  Result:= Integer(Integer(Data.Objects[i])) > 0;
end;

function TfrmColumnFilter.SetCheckedValue(i: Integer; IsChecked: Boolean): Boolean;
var k: Integer;
begin
  Result:= False;
  if (i<0) then Exit;
  k:= Abs(Integer(Data.Objects[i]));
  if IsChecked then
  Data.Objects[i] := Pointer(k) else
  Data.Objects[i] := Pointer(-k);
end;

procedure TfrmColumnFilter.UpdateReorderListMenu();
begin
  mnuReorderList.Caption:= idReorderList + ReorderListDirs[SortListDirection>0];
  //Упорядочить
end;


procedure TfrmColumnFilter.RefreshRootItems(
          ItemIndex: Integer =-1; UseObjects: Boolean = True);
var i, n: Integer; IsChecked: Boolean;
begin
  Root.BeginUpdate;
  ClearFilterItems;
  CheckedCount:= 0; TotalSum:= 0; SelSum:= 0;
  if (QtyList<>nil) and (QtyList.Count<>Data.Count) then
     raise Exception.Create('Invalid Count in QtyList');
  for i := 0 to Data.Count-1 do
  begin
    if (QtyList=nil) then n:= 1 else
                          n:= GetQtyValue(i);
    AddItem(Data[i], Integer((not UseObjects) or GetCheckedValue(i)),
                      n, IsChecked);
    Inc(TotalSum, n);
    if IsChecked then
    begin
      Inc(CheckedCount);
      Inc(SelSum, n);
    end;
  end;
  if (ItemIndex>=0) and (ItemIndex<Data.Count) then
      clbFilter.ItemIndex:= ItemIndex;
  UpdateReorderListMenu;
  Root.EndUpdate;
  clbFilter.Refresh;
end;

procedure TfrmColumnFilter.SortListUpDown(Direction: Integer = 0; InverseDir: Boolean = True);
var i: Integer; s: string;
begin
  if (Direction=0) then Direction:= SortListDirection;
  if InverseDir then Direction:= -Direction;
  if (Direction=0) then
     if (DataVarType<>varString) then
         Direction:= -1 else Direction:= 1;
  i:= clbFilter.ItemIndex; s:= '';
  if (i>=0) then s:= Data[i];
  CustomSortStrings(Data, Direction, DataVarType<>varString);
  if (s<>'') then i:= Data.IndexOf(s);
  RefreshRootItems(i);
end;

procedure TfrmColumnFilter.AcceptItems(
          Items: TStrings; Counts: TList; RootName: string = '';
          UseObjects: Boolean = False);
begin
  //clbFilter.Items.Assign(Items);
  Data:= Items;
  QtyList:= Counts;
  Root:= clbFilter.Items;
  SortListDirection:= 0;
  UpdateFindButtons(False);
  //SortListUpDown();
  RefreshRootItems(0);
  if (RootName<>'') then cbxRoot.Caption:= RootName + Format(' (%d)', [TotalSum]);
  UpdateRootState;
  btnOK.Enabled:= CheckedCount>0;
  if btnOK.Enabled then ActiveControl:= btnOK;
  ShowStatus();
end;

function TfrmColumnFilter.UpdateItems(Items: TStrings): Integer;
var
  i, k: Integer;
begin
  Result := 0;
  if (Items = nil) then
    Items := Data;
  if (Items <> nil) then
    for i := 0 to Items.Count - 1 do
    SetCheckedValue(i, GetCheckedState(i));
end;

function TfrmColumnFilter.ToggleCheckedState(i: Integer): Boolean;
begin
  Result := not GetCheckedState(i);
  SetCheckedState(i, Result);
end;

procedure TfrmColumnFilter.SetAllItemsState(IsChecked: Boolean);
var
  i: Integer;
begin
  Inc(DisableCount);
  for i := 0 to Root.Count - 1 do
    SetCheckedState(i, IsChecked);
  if IsChecked then
  begin
    CheckedCount := Root.Count;
    SelSum := TotalSum;
  end
  else
  begin
    CheckedCount := 0;
    SelSum := 0;
  end;
  Dec(DisableCount);
end;

procedure TfrmColumnFilter.ShowStatus();
begin
  sbStatus.SimpleText := Format('Выбр.: %d; Всего: %d; Cумма: %d', [CheckedCount,
    Root.Count, SelSum]);
end;

procedure TfrmColumnFilter.ChangeItemState(i: Integer; DoToggle: Boolean = False;
  ToggleIsNewState: Boolean = False);
var
  n: Integer;
  NewState, OldState, StateChanged: Boolean;
begin
  if ToggleIsNewState then
  begin
    OldState := GetCheckedState(i);
    StateChanged := (OldState <> DoToggle);
    if StateChanged then
      NewState := SetCheckedState(i, DoToggle);
  end
  else
  begin
    StateChanged := True;
    if DoToggle then
      NewState := ToggleCheckedState(i)
    else
    begin
      NewState := GetCheckedState(i);
      SetCheckedValue(i, NewState);
    end;
  end;
  if StateChanged then
  if (i >= 0) then
  begin
    if (QtyList = nil) then
      n := 1
    else
      n := GetQtyValue(i);
    if not NewState then
    begin
      Dec(CheckedCount);
      Dec(SelSum, n);
    end
    else
    begin
      Inc(CheckedCount);
      Inc(SelSum, n);
    end;
    UpdateRootState;
  end
  else
    SetAllItemsState(NewState);
  btnOK.Enabled := (CheckedCount > 0);
  ShowStatus();
end;

procedure TfrmColumnFilter.clbFilterClickCheck(Sender: TObject);
begin
  if (DisableCount > 0) then
    Exit;
  cbxRoot.AllowGrayed := True;
  ChangeItemState(clbFilter.ItemIndex);
end;

procedure TfrmColumnFilter.cbxRootClick(Sender: TObject);
begin
  if (DisableCount > 0) then
    Exit;
  cbxRoot.AllowGrayed := False;
  ChangeItemState(-1, False);
end;

procedure TfrmColumnFilter.btnResetClick(Sender: TObject);
begin
  if Assigned(FiltEvent) then
  begin
    FiltEvent(Pointer(ueResetFiltering));
  end;
end;

procedure TfrmColumnFilter.btnSortUpClick(Sender: TObject);
begin
  if Assigned(FiltEvent) then
    FiltEvent(Pointer(ueSortUp));
  SortListUpDown(-1, True);
end;

procedure TfrmColumnFilter.SortDownClick(Sender: TObject);
begin
  if Assigned(FiltEvent) then
    FiltEvent(Pointer(ueSortDown));
  SortListUpDown(1, True);
end;

procedure TfrmColumnFilter.btnRefreshListClick(Sender: TObject);
begin
  if Assigned(FiltEvent) then
    FiltEvent(Pointer(ueRefreshList));
end;

procedure TfrmColumnFilter.btnOKClick(Sender: TObject);
var
  Ctrl_Down, Shift_Down: Boolean;
begin
  //if not (fsModal in FormState) then
  begin
    Ctrl_Down := Ctrl_Is_Down;
    Shift_Down:= Shift_Is_Down;
    SecretCode:= 0;
    if Ctrl_Down then SecretCode:= 100;
    UpdateItems(Data);
    if Assigned(FiltEvent) then
      FiltEvent(Pointer(-CheckedCount));
    ModalResult := mrOk;
    Close;
  end;
end;

procedure TfrmColumnFilter.btnCancelClick(Sender: TObject);
begin
  if not (fsModal in FormState) then
  begin
    UpdateItems(nil);
    if Assigned(FiltEvent) then
      FiltEvent(nil);
    ModalResult := mrCancel;
    Close;
  end;
end;

procedure TfrmColumnFilter.FindItem();
var
  Value: string;
  i, LookForPos: Integer;
begin
  i := clbFilter.ItemIndex;
  if LastSearchStr <> '' then
    Value := LastSearchStr
  else if (i >= 0) then
    Value := Data[i]
  else
    Value := '';
  if InputQuery('Поиск значения', 'Найти значение:', Value) then
  begin
    if (DataVarType = varString) then
      LookForPos := idSearchAllPos
    else
      LookForPos := idSearchFirstPos;
    LastSearchStr := Value;
    i := GetContainsPosIndex(Data, Value, LookForPos);
    if (i >= 0) then
      clbFilter.ItemIndex := i;
  end;
end;

procedure TfrmColumnFilter.EnableAllUpDown(Direction: Integer; Enable: Boolean);
var
  i, n: Integer;
begin
  if Abs(Direction) <> 1 then
    Exit;
  clbFilter.Items.BeginUpdate;
  try
    n := clbFilter.Items.Count;
    i := clbFilter.ItemIndex;
    while (i >= 0) and (i < n) do
    begin
      ChangeItemState(i, Enable, True);
      //clbFilter.Checked[i]:= Enable;
      Inc(i, Direction);
    end;
  finally
    clbFilter.Items.EndUpdate;
  end;
end;

procedure TfrmColumnFilter.mnuEnableAllUpClick(Sender: TObject);
begin
  EnableAllUpDown(-1, True);
end;

procedure TfrmColumnFilter.mnuEnableAllDownClick(Sender: TObject);
begin
  EnableAllUpDown(1, True);
end;

procedure TfrmColumnFilter.mnuDisableAllUpClick(Sender: TObject);
begin
  EnableAllUpDown(-1, False);
end;

procedure TfrmColumnFilter.mnuDisableAllDownClick(Sender: TObject);
begin
  EnableAllUpDown(1, False);
end;

procedure TfrmColumnFilter.mnuFindItemClick(Sender: TObject);
begin
  FindItem;
end;

procedure TfrmColumnFilter.mnuReorderListClick(Sender: TObject);
begin
  SortListUpDown();
end;

end.


