unit citPropDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, Math, citComponentProps, DesignIntf, TypInfo;

type
  TPropListEditorDlg = class(TForm)
    lbComponents: TListBox;
    lbProps: TListBox;
    btnAdd: TSpeedButton;
    lbStoredProps: TListBox;
    btnOK: TBitBtn;
    btnAddAll: TSpeedButton;
    btnDown: TSpeedButton;
    btnUp: TSpeedButton;
    btnDelete: TSpeedButton;
    btnDeleteAll: TSpeedButton;
    btnCancel: TBitBtn;
    GroupBox1: TGroupBox;
    cbSize: TCheckBox;
    cbPos: TCheckBox;
    cbState: TCheckBox;
    cbActiveControl: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure lbComponentsClick(Sender: TObject);
    procedure lbStoredPropsDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure lbStoredPropsDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure btnAddClick(Sender: TObject);
    procedure lbPropsEnter(Sender: TObject);
    procedure lbPropsExit(Sender: TObject);
    procedure btnAddAllClick(Sender: TObject);
    procedure lbStoredPropsExit(Sender: TObject);
    procedure lbStoredPropsClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnDeleteAllClick(Sender: TObject);
    procedure lbPropsDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lbPropsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure btnUpClick(Sender: TObject);
    procedure btnDownClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    procedure ReadLists;
    procedure UpdateLists;
    procedure UpdateButtons;
    procedure AddProp(DestIndex, ComponentIndex, PropIndex : integer);
    procedure AddStoredProps;
    procedure DeleteStoredProps(DeleteAll : Boolean);
  public
    PropList : TStringList;
    SourceForm : TComponent;
    Component : TComponent;
  end;

implementation
{$R *.DFM}

procedure TPropListEditorDlg.AddProp(DestIndex,ComponentIndex,
                                     PropIndex : integer);
begin
  lbStoredProps.Items.Insert(DestIndex,
         lbComponents.Items[ComponentIndex]+'.'+
         TStringList(lbComponents.Items.Objects[ComponentIndex])[PropIndex]);
  TStringList(lbComponents.Items.Objects[ComponentIndex]).Delete(PropIndex);
end;

procedure TPropListEditorDlg.FormShow(Sender: TObject);
var
   NameStr, Prop : string;
   i, PropIndex : integer;
begin
  lbComponents.Clear;
  ReadLists;
  lbComponents.ItemIndex := 0;
  lbComponentsClick(Self);
  with (Component as TcitComponentProps) do
  begin
    cbActiveControl.Checked := fpActiveControl in FormParams;
    cbState.Checked := fpState in FormParams;
    cbSize.Checked := fpSize in FormParams;
    cbPos.Checked := fpPos in FormParams;
    for i:=0 to Properties.Count-1 do
     begin
       ParseProp(Properties[i], '.', NameStr, Prop);
       ComponentIndex := lbComponents.Items.IndexOf(NameStr);
       PropIndex := TStringList(lbComponents.Items.Objects[ComponentIndex]).
                                IndexOf(Prop);
       if (ComponentIndex <> -1) and (PropIndex <> -1) then
                  AddProp(lbStoredProps.Items.Count, ComponentIndex, PropIndex);
     end;
  end;
  UpdateLists;
end;

procedure TPropListEditorDlg.ReadLists;
var
   i, j, Count, Size : integer;
   TmpList : PPropList;
   PropList : TStringList;
begin
  for i:=0 to SourceForm.ComponentCount-1 do
   if not(SourceForm.Components[i] is TcitComponentProps) then
   begin
     Count := GetPropList(SourceForm.Components[i].ClassInfo, tkProperties, nil);
     Size := Count * SizeOf(Pointer);
     GetMem(TmpList, Size);
     try
      GetPropList(SourceForm.Components[i].ClassInfo, tkProperties, TmpList);
      PropList := TStringList.Create;
      PropList.Sorted := True;
      for j:=0 to Count-1 do PropList.Add(TmpList^[j]^.Name);
      lbComponents.Items.AddObject(SourceForm.Components[i].Name, PropList);
     finally
      FreeMem(TmpList, Size)
     end
   end;
end;

procedure TPropListEditorDlg.UpdateLists;
var
   CurIndex : integer;
begin
  try
    with lbComponents do
    if (Items.Objects[ItemIndex] as TStringList).Count > 0 then
       lbProps.Items := (Items.Objects[ItemIndex] as TStringList)
    else
    begin
      CurIndex := ItemIndex;
      Items.Delete(ItemIndex);
      if CurIndex = Items.Count then ItemIndex := Items.Count-1
                                else ItemIndex := CurIndex;
      if Items.Count > 0 then lbProps.Items := TStringList(Items.Objects[ItemIndex])
                         else lbProps.Items.Clear;
    end;
  except
  end;

  try lbProps.Selected[0] := True;
  except end;
  UpdateButtons;
end;

procedure TPropListEditorDlg.lbComponentsClick(Sender: TObject);
begin
 with lbComponents do
  if ItemIndex >=0 then
    begin
     lbProps.Items := (Items.Objects[ItemIndex] as TStringList);
     try lbProps.Selected[0] := True except end;
    end;
 UpdateButtons;
end;

procedure TPropListEditorDlg.lbStoredPropsDragDrop(Sender, Source: TObject;
  X, Y: Integer);
begin
  if Source <> Sender then AddStoredProps;
end;

procedure TPropListEditorDlg.lbStoredPropsDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
var
   ItemNum : integer;
begin
  Accept := True;
  if Source <> lbStoredProps then Exit;
  ItemNum := lbStoredProps.ItemAtPos(Point(X, Y), True);
  if ItemNum <> -1 then
   if (State = dsDragMove) and (ItemNum <> lbStoredProps.ItemIndex) then
    begin
      lbStoredProps.Items.Exchange(lbStoredProps.ItemIndex, ItemNum);
      lbStoredProps.ItemIndex := ItemNum;
    end;
end;

procedure TPropListEditorDlg.AddStoredProps;
var
   i, Last : integer;
begin
  Last := lbStoredProps.Items.Count;
  for i:=lbProps.Items.Count-1 downto 0 do
    if lbProps.Selected[i] then AddProp(Last, lbComponents.ItemIndex, i);

  UpdateLists;
end;

procedure TPropListEditorDlg.DeleteStoredProps(DeleteAll : Boolean);
var
   i, Index : integer;
   NameStr, Prop : string;
begin
  for i:=lbStoredProps.Items.Count-1 downto 0 do
  if (lbStoredProps.Selected[i]) or DeleteAll then
   begin
     ParseProp(lbStoredProps.Items[i], '.', NameStr, Prop);
     Index := lbComponents.Items.IndexOf(NameStr);

     if Index > -1 then TStringList(lbComponents.Items.Objects[Index]).Add(Prop)
       else begin
              PropList := TStringList.Create;
              PropList.Sorted := True;
              PropList.Add(Prop);
              lbComponents.Items.AddObject(NameStr, PropList);
            end;
     lbStoredProps.Items.Delete(i);

     try
       lbStoredProps.ItemIndex := MinIntValue([i,lbStoredProps.Items.Count-1]);
       if not DeleteAll then break;
     except end;
   end;

  lbComponentsClick(Self);
  UpdateButtons;
end;

procedure TPropListEditorDlg.btnAddClick(Sender: TObject);
begin
  AddStoredProps;
end;

procedure TPropListEditorDlg.lbPropsEnter(Sender: TObject);
begin
  if lbProps.SelCount = -1 then lbProps.ItemIndex := 0;
  UpdateButtons;
end;

procedure TPropListEditorDlg.lbPropsExit(Sender: TObject);
begin
  UpdateButtons;
end;

procedure TPropListEditorDlg.UpdateButtons;
begin
  with lbProps do
   btnAdd.Enabled := (Items.Count > 0) and (ItemIndex > -1)
                     and ((SelCount > 0) or (Focused));
  btnAddAll.Enabled := lbProps.Items.Count <> 0;
  lbProps.DragMode := TDragMode(ord(btnAdd.Enabled));
  with lbStoredProps do
  begin
    btnDelete.Enabled := (Items.Count > 0) and Focused;
    btnDeleteAll.Enabled := Items.Count > 0;
    btnUp.Enabled := (Items.Count > 0) and Focused and (ItemIndex > 0);
    btnDown.Enabled := (Items.Count > 0)and Focused and(ItemIndex < Items.Count-1)
  end;
end;

procedure TPropListEditorDlg.btnAddAllClick(Sender: TObject);
var
   i : integer;
begin
  for i:=0 to lbProps.Items.Count-1 do lbProps.Selected[i] := True;
  AddStoredProps;
end;

procedure TPropListEditorDlg.lbStoredPropsExit(Sender: TObject);
begin
  UpdateButtons;
end;

procedure TPropListEditorDlg.lbStoredPropsClick(Sender: TObject);
begin
  UpdateButtons;
end;

procedure TPropListEditorDlg.btnDeleteClick(Sender: TObject);
begin
  DeleteStoredProps(False);
end;

procedure TPropListEditorDlg.btnDeleteAllClick(Sender: TObject);
begin
  DeleteStoredProps(True);
end;

procedure TPropListEditorDlg.lbPropsDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if Source <> Sender then Accept := True
                      else Accept := False;
end;

procedure TPropListEditorDlg.lbPropsDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  DeleteStoredProps(False);
end;

procedure TPropListEditorDlg.btnUpClick(Sender: TObject);
begin
  with lbStoredProps do begin
                          Items.Exchange(ItemIndex, ItemIndex-1);
                          ItemIndex := ItemIndex - 1;
                        end;
  UpdateButtons;
end;

procedure TPropListEditorDlg.btnDownClick(Sender: TObject);
begin
  with lbStoredProps do begin
                          Items.Exchange(ItemIndex, ItemIndex+1);
                          ItemIndex := ItemIndex + 1;
                        end;
  UpdateButtons;
end;

procedure TPropListEditorDlg.btnOKClick(Sender: TObject);
begin
 with (Component as TcitComponentProps) do
  begin
   FormParams := [];
   if cbActiveControl.Checked then FormParams := [fpActiveControl] + FormParams;
   if cbState.Checked then FormParams := [fpState] + FormParams;
   if cbSize.Checked then FormParams := [fpSize] + FormParams;
   if cbPos.Checked then FormParams := [fpPos] + FormParams;
   Properties.Assign(lbStoredProps.Items);
  end;
end;

end.
