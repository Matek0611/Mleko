unit UColumnFilterDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ImgList, StdCtrls, ExtCtrls, CheckLst, ToolWin;

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
    procedure clbFilterClickCheck(Sender: TObject);
    procedure cbxRootClick(Sender: TObject);
    procedure clbFilterClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btnSortUpClick(Sender: TObject);
    procedure SortDownClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnRefreshListClick(Sender: TObject);
  private
    Root, Data: TStrings;
    CheckedCount, DisableCount: Integer;
    XPos, YPos: Integer;
    TotalSum, SelSum: Integer;
    QtyList: TList;
    XYPosUsed: Boolean;
    FiltEvent: TNotifyEvent;
    procedure AcceptItems( Items: TStrings; Counts: TList;
                           RootName: string = ''; UseObjects: Boolean = False);
    procedure SetAllItemsState(IsChecked: Boolean);
    function GetCheckedState(i: Integer): Boolean;
    procedure SetGrayState;
    function ToggleCheckedState(i: Integer): Boolean;
    procedure ChangeItemState(i: Integer; DoToggle: Boolean = False);
    function UpdateItems(Items: TStrings): Integer;
    procedure ShowStatus;
    procedure UpdateRootState;
    function SetCheckedState(i: Integer; IsChecked: Boolean): Boolean;
    procedure UpdateFindButtons;
    procedure ClearItems;
    function GetItemCount: Integer;
    procedure AddItem(AText: String; AState, ACount: Integer;
      var IsChecked: Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

  function IsColumnFilterDlgVisible(): Boolean;
  procedure CloseColumnFilterDlg();
function ColumnFilterDlg( Owner: TComponent;
                          Items: TStrings; Counts: TList; RootName: string = '';
                          P: PPoint = nil;
                          UseObjects: Boolean = False;
                          FiltEvent: TNotifyEvent = nil;
                          AsModal: Boolean = True): Integer;

const
//ImageList.StateIndex=0 has some bugs, so we add one dummy image to position 0
  cFlatUnCheck = 1;
  cFlatChecked = 2;
  cFlatGray = 3;

  CheckedStates: array[Boolean] of Integer = (cFlatUnCheck, cFlatChecked);

var
  frmColumnFilter: TfrmColumnFilter;

implementation
uses MlekoUtils;

{$R *.dfm}

function IsColumnFilterDlgVisible(): Boolean;
begin
  Result:= (frmColumnFilter<>nil) and
           (frmColumnFilter.Visible);
end;

procedure CloseColumnFilterDlg();
begin
  if (frmColumnFilter<>nil) then
  begin
    frmColumnFilter.Close;
    Application.ProcessMessages;
  end;
end;

function ColumnFilterDlg( Owner: TComponent;
                          Items: TStrings; Counts: TList; RootName: string = '';
                          P: PPoint = nil;
                          UseObjects: Boolean = False;
                          FiltEvent: TNotifyEvent = nil;
                          AsModal: Boolean = True): Integer;
begin
  if (frmColumnFilter=nil) then
  begin
    if (Owner=nil) then Owner:= Application;
    frmColumnFilter:= TfrmColumnFilter.Create(Owner);
  end;
     if (P<>nil) then
     with P^ do
     begin
       if (X>0) then
       frmColumnFilter.XPos:= X;
       if (Y>0) then
       frmColumnFilter.YPos:= Y;
     end;
     frmColumnFilter.XYPosUsed:= False;
     frmColumnFilter.FiltEvent:= FiltEvent;
     //frmColumnFilter.Data:= Items;
     //frmColumnFilter.QtyList:= QtyList;
  frmColumnFilter.AcceptItems(Items, Counts, RootName, UseObjects);
  AsModal:= AsModal or (not Assigned(FiltEvent));
  if AsModal then
  begin
    frmColumnFilter.FormStyle:= fsNormal;
    Result:= frmColumnFilter.ShowModal;
  end
  else
  begin
    frmColumnFilter.Show;
    frmColumnFilter.FormStyle:= fsStayOnTop;
  end;
  if AsModal then
     begin
        frmColumnFilter.UpdateItems(Items);
        if Result = mrOk then
          Result := frmColumnFilter.CheckedCount else
          Result := -1;
     end;
  //FreeAndNil(frmColumnFilter);
end;

function TfrmColumnFilter.SetCheckedState(i: Integer; IsChecked: Boolean): Boolean;
begin
  Inc(DisableCount);
  if (i<0) then cbxRoot.Checked:= IsChecked else
  clbFilter.Checked[i]:= IsChecked;
  Dec(DisableCount);
  Result:= IsChecked;
end;

function TfrmColumnFilter.GetCheckedState(i: Integer): Boolean;
begin
  Inc(DisableCount);
  if (i<0) then Result:= (cbxRoot.State = cbChecked) else
  Result:= clbFilter.Checked[i];
  Dec(DisableCount);
end;

procedure TfrmColumnFilter.SetGrayState();
begin
  Inc(DisableCount);
  cbxRoot.State:= cbGrayed;
  Dec(DisableCount);
end;

procedure TfrmColumnFilter.UpdateRootState();
begin
  if (CheckedCount>0) then
     if (CheckedCount<>Root.Count) then
        SetGrayState() else
        SetCheckedState(-1, True) else
        SetCheckedState(-1, False);
end;

procedure TfrmColumnFilter.UpdateFindButtons();
var VarType: TVarType;
begin
  if Root.Count>0 then
     begin
       VarType:= DetectDataType(Root[0]);
       btnFindMore.Visible:= (VarType<>varString);
       btnFindLess.Visible:= (VarType<>varString);
       btnFindEqual.Visible:= (VarType<>varString);
       btnFindBeg.Visible:= (VarType=varString);
       btnFindEnd.Visible:= (VarType=varString);
       btnFindMid.Visible:= (VarType=varString);
     end;
end;

procedure TfrmColumnFilter.AddItem( AText: String; AState: Integer; ACount: Integer;
                                    var IsChecked: Boolean);
begin
  IsChecked:= Boolean(AState);
  clbFilter.Checked[Root.Add(Format('%s (%d)', [AText, ACount]))]:= IsChecked;
end;

procedure TfrmColumnFilter.ClearItems();
begin
  clbFilter.Clear;
  //Root.Clear;
end;

function TfrmColumnFilter.GetItemCount(): Integer;
begin
  Result:= Root.Count;
end;

procedure TfrmColumnFilter.AcceptItems(
          Items: TStrings; Counts: TList; RootName: string = '';
          UseObjects: Boolean = False);
var i, n: Integer; IsChecked: Boolean;
begin
  //clbFilter.Items.Assign(Items);
  Data:= Items;
  QtyList:= Counts;
  Root:= clbFilter.Items;
  Root.BeginUpdate;
  ClearItems;
  CheckedCount:= 0; TotalSum:= 0; SelSum:= 0;
  if (QtyList<>nil) and (QtyList.Count<>Items.Count) then
     raise Exception.Create('Invalid Count in QtyList');
  for i := 0 to Items.Count-1 do
  begin
    if (QtyList=nil) then n:= 1 else
                          n:= Integer(QtyList[i]);
    AddItem(Items[i], Integer((not UseObjects) or (Items.Objects[i]<>nil)),
                      n, IsChecked);
    Inc(TotalSum, n);
    if IsChecked then
    begin
      Inc(CheckedCount);
      Inc(SelSum, n);
    end;
  end;
  Root.EndUpdate;
  clbFilter.Refresh;
  //SetAllItemsState(True);
  if (RootName<>'') then cbxRoot.Caption:= RootName + Format(' (%d)', [TotalSum]);
  UpdateRootState;
  //UpdateFindButtons;
  btnOK.Enabled:= CheckedCount>0;
  if btnOK.Enabled then ActiveControl:= btnOK;
  ShowStatus();
end;

function TfrmColumnFilter.UpdateItems(Items: TStrings): Integer;
var i: Integer;
begin
  Result:= 0;
  if (Items=nil) then Items:= Data;
  if (Items<>nil) then
  for i := 0 to Items.Count-1 do
    begin
      if GetCheckedState(i) then
      begin
        Items.Objects[i]:= Pointer(1);
        Inc(Result);
      end else
        Items.Objects[i]:= nil;
    end;
end;

function TfrmColumnFilter.ToggleCheckedState(i: Integer): Boolean;
begin
  Result:= not GetCheckedState(i);
  SetCheckedState(i, Result);
end;

procedure TfrmColumnFilter.SetAllItemsState(IsChecked: Boolean);
var i: Integer;
begin
Inc(DisableCount);
for i := 0 to Root.Count-1 do
  SetCheckedState(i, IsChecked);
  if IsChecked then
  begin
    CheckedCount:= Root.Count;
    SelSum:= TotalSum;
  end
  else
  begin
   CheckedCount:= 0;
   SelSum:= 0;
  end;
Dec(DisableCount);
end;

procedure TfrmColumnFilter.ShowStatus();
begin
  sbStatus.SimpleText:= Format('Выбр.: %d; Всего: %d; Cумма: %d',
                        [CheckedCount, Root.Count, SelSum]);
end;

procedure TfrmColumnFilter.ChangeItemState(i: Integer; DoToggle: Boolean = False);
var n: Integer; NewState: Boolean;
begin
  if DoToggle then
     NewState:= ToggleCheckedState(i) else
     NewState:= GetCheckedState(i);
  if (i>=0) then
  begin
    if (QtyList=nil) then
       n:= 1 else
       n:= Integer(QtyList[i]);
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
  end else
  SetAllItemsState(NewState);
  btnOK.Enabled:= (CheckedCount>0);
  ShowStatus();
end;

procedure TfrmColumnFilter.clbFilterClickCheck(Sender: TObject);
begin
  if (DisableCount>0) then Exit;
  cbxRoot.AllowGrayed:= True;
  ChangeItemState(clbFilter.ItemIndex);
end;

procedure TfrmColumnFilter.cbxRootClick(Sender: TObject);
begin
  if (DisableCount>0) then Exit;
  cbxRoot.AllowGrayed:= False;
  ChangeItemState(-1, False);
end;

procedure TfrmColumnFilter.clbFilterClick(Sender: TObject);
begin
  if (DisableCount>0) then Exit;
  ChangeItemState(clbFilter.ItemIndex, True);
end;

procedure TfrmColumnFilter.FormShow(Sender: TObject);
begin
  if not XYPosUsed then
     begin
       if (XPos>0) then Left:= XPos;
       if (YPos>0) then Top:= YPos;
       XYPosUsed:= True;
       //sbStatus.SimpleText:= Format('%d, %d, %d, %d', [Left, Top, XPos, YPos]);
     end;
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
end;

procedure TfrmColumnFilter.SortDownClick(Sender: TObject);
begin
  if Assigned(FiltEvent) then
     FiltEvent(Pointer(ueSortDown));
end;

procedure TfrmColumnFilter.btnRefreshListClick(Sender: TObject);
begin
  if Assigned(FiltEvent) then
     FiltEvent(Pointer(ueRefreshList));
end;

procedure TfrmColumnFilter.btnOKClick(Sender: TObject);
begin
  if not (fsModal in FormState) then
     begin
     UpdateItems(nil);
     if Assigned(FiltEvent) then
       FiltEvent(Pointer(-CheckedCount));
       ModalResult:= mrOk;
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
       ModalResult:= mrCancel;
       Close;
     end;
end;


end.


