unit citDBGridLayoutDlg;

interface

uses
  citDBGridUtils,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ComCtrls, ExtCtrls, DBGrids, DB, Menus, math, ImgList,
  Spin;

type
  TMaskString = class
    Mask : string[255];
    constructor Create(AMask : String);
  end;

  TGridLayoutDlg = class(TForm)
    ListView: TListView;
    PanelListBtns: TPanel;
    btnIcon: TSpeedButton;
    btnSmallIcon: TSpeedButton;
    btnList: TSpeedButton;
    btnReport: TSpeedButton;
    PanelBtns: TPanel;
    btnCancel: TButton;
    btnOK: TButton;
    ImageList: TImageList;
    LargeImageList: TImageList;
    EditMask: TEdit;
    LabelMask: TLabel;
    pmTitle: TPopupMenu;
    miChangeTitle: TMenuItem;
    miVisible: TMenuItem;
    EditWidth: TEdit;
    LabelWidth: TLabel;
    btnDefaultParams: TSpeedButton;
    miOrientationHor: TMenuItem;
    miOrientationVer: TMenuItem;
    SETitleHeight: TSpinEdit;
    Label1: TLabel;
    procedure StyleBtnClick(Sender: TObject);
    procedure ListViewDblClick(Sender: TObject);
    procedure ListViewDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ListViewDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ListViewDeletion(Sender: TObject; Item: TListItem);
    procedure ListViewChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure EditMaskChange(Sender: TObject);
    procedure miChangeTitleClick(Sender: TObject);
    procedure miVisibleClick(Sender: TObject);
    procedure pmTitlePopup(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListViewEdited(Sender: TObject; Item: TListItem;
      var S: String);
    function ShowDlg(AGrid: TCustomDBGrid) : TModalResult;
    procedure EditWidthChange(Sender: TObject);
    procedure btnDefaultParamsClick(Sender: TObject);
    procedure miOrientationHorClick(Sender: TObject);
    procedure miOrientationVerClick(Sender: TObject);
    procedure ListViewGetSubItemImage(Sender: TObject; Item: TListItem;
      SubItem: Integer; var ImageIndex: Integer);
    procedure SpeedButton1Click(Sender: TObject);
  private
    procedure RefreshFields(AGrid: TCustomDBGrid);
  public
    BitMapVisible, BitMapUnvisible : TBitMap;
    FGrid: TCustomDBGrid;
    class function LayoutGrid(AGrid : TCustomDBGrid): boolean;
  end;

var
  GridLayoutDlg: TGridLayoutDlg;

implementation

{$R *.DFM}

uses
  citDbGrid, citDBGridLayout;

class function TGridLayoutDlg.LayoutGrid(AGrid : TCustomDBGrid): boolean;
var
  GridLayoutDlg	: TGridLayoutDlg;
  Field		: TField;
  i		: integer;
  vOrientation	: TTextOrientation;
begin
  Result := false;
  GridLayoutDlg := TGridLayoutDlg.Create(Application);
  GridLayoutDlg.FGrid := AGrid;
  try
    if GridLayoutDlg.ShowDlg(AGrid) = mrOK then
      with GridLayoutDlg.ListView, AGrid.DataSource.DataSet do
        for i:=0 to GridLayoutDlg.ListView.Items.Count - 1 do
        begin
          Field := FieldByName(Items[i].SubItems[0]);
          with Field do
          begin
            Index := i;
            DisplayLabel := Items[i].Caption;
            Visible      := Boolean(Items[i].ImageIndex);
            DisplayWidth := StrToInt(Items[i].SubItems[2]);
          end;
          if AGrid is TcitDBGrid then
          begin
            if integer(Items[i].SubItems.Objects[1]) = 1 then vOrientation := toVertical
            else vOrientation := toHorizontal;
            TcitDBGrid(AGrid).FldProfiles.ItemsByFieldName[Fields[i].FieldName].Orientation := vOrientation;
          end;
          with TMaskString(Items[i].Data) do
            if (Field is TNumericField) then
              (Field as TNumericField).DisplayFormat := Mask
            else
              if (Field is TDateTimeField) then
                (Field as TDateTimeField).DisplayFormat := Mask
              else Field.EditMask := Mask;
          Result := true;
        end;
  finally
    GridLayoutDlg.Free;
  end;
end;

constructor TMaskString.Create(AMask : String);
begin
  Mask := AMask;
end;

procedure TGridLayoutDlg.StyleBtnClick(Sender: TObject);
begin
  ListView.ViewStyle := TViewStyle((Sender as TComponent).Tag)
end;

function TGridLayoutDlg.ShowDlg(AGrid: TCustomDBGrid): TModalResult;
begin
  FGrid := AGrid;
  RefreshFields(AGrid);
  Result := ShowModal;
end;

procedure TGridLayoutDlg.RefreshFields(AGrid: TCustomDBGrid);
var
  i		: integer;
  Mask		: string;
  siID		: integer;
begin
  ListView.Items.Clear;
  with TDBGrid(AGrid).DataSource.DataSet do
    for i:=0 to FieldCount-1 do
      with ListView.Items.Add do
      begin
        Caption := Fields[i].DisplayLabel;
        SubItems.Add(Fields[i].FieldName);

        siID := SubItems.AddObject('', TObject(0));
        if (AGrid is TcitDBGrid)
          and (TcitDBGrid(AGrid).FldProfiles.ItemsByFieldName[Fields[i].FieldName].
            Orientation = toVertical)
        then SubItems.Objects[siID] := TObject(1);

        SubItems.Add(IntToStr(Fields[i].DisplayWidth));
        ImageIndex := ord(Fields[i].Visible);
        if (Fields[i] is TNumericField) then
          Mask := (Fields[i] as TNumericField).DisplayFormat
        else if (Fields[i] is TDateTimeField) then
          Mask := (Fields[i] as TDateTimeField).DisplayFormat
        else
          Mask := Fields[i].EditMask;
        Data := TMaskString.Create(Mask);
      end;
end;

{ Updated   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! }
procedure TGridLayoutDlg.ListViewDblClick(Sender: TObject);
begin
  if ListView.Selected <> nil then
    with ListView.Selected do ImageIndex := 1 - ImageIndex;
end;

procedure TGridLayoutDlg.ListViewDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  if Sender <> Source then Exit;

  with ListView do
    if (DropTarget <> nil) and (DropTarget <> Selected) then
    begin
      with Items.Insert(DropTarget.Index) do
      begin
        Assign(ListView.Selected);
        Data := TMaskString.Create(TMaskString(ListView.Selected.Data).Mask);
      end;
      Items.Delete(Selected.Index);
    end;
end;

procedure TGridLayoutDlg.ListViewDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := True;
end;

procedure TGridLayoutDlg.ListViewDeletion(Sender: TObject;
  Item: TListItem);
begin
  TMaskString(Item.Data).Free;
end;

procedure TGridLayoutDlg.ListViewChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  if Change = ctState then
  begin
    EditMask.OnChange := nil;
    EditMask.Text := TMaskString(Item.Data).Mask;
    EditMask.OnChange := EditMaskChange;
    LabelMask.Caption := Format('Маска для поля %s (%s)',[Item.Caption, Item.SubItems[0]]);
    EditWidth.OnChange := nil;
    if ListView.Selected <> nil then
         EditWidth.Text := Item.SubItems[2]
    else EditWidth.Text := '';
    EditWidth.OnChange := EditWidthChange;
  end;
  EditMask.Enabled := (ListView.Selected <> nil);
  LabelMask.Enabled := EditMask.Enabled;
  EditWidth.Enabled := (ListView.Selected <> nil);
  LabelWidth.Enabled := EditWidth.Enabled;
end;

procedure TGridLayoutDlg.EditMaskChange(Sender: TObject);
begin
  with ListView do
    if not ListView.Dragging then
      TMaskString(Selected.Data).Mask := EditMask.Text;
end;

procedure TGridLayoutDlg.miChangeTitleClick(Sender: TObject);
begin
  if not miChangeTitle.Enabled then Exit;
  ListView.Selected.EditCaption;
end;

procedure TGridLayoutDlg.miVisibleClick(Sender: TObject);
begin
  with ListView.Selected do ImageIndex := 1 - ImageIndex;
end;

{ Updated !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!}
procedure TGridLayoutDlg.pmTitlePopup(Sender: TObject);
var
  LVSel		: boolean; 
begin
  LVSel := ListView.Selected <> nil;
  miChangeTitle.Enabled := LVSel;
  miVisible.Enabled := LVSel;
  miOrientationHor.Enabled := LVSel;
  miOrientationVer.Enabled := LVSel;

  if LVSel then
  begin
    with pmTitle.Items[1] do Checked := Boolean(ListView.Selected.ImageIndex);
    if integer(ListView.Selected.SubItems.Objects[1]) = 1 then miOrientationVer.Checked := True
    else miOrientationHor.Checked := True;
  end;
end;

procedure TGridLayoutDlg.FormCreate(Sender: TObject);
begin
  FGrid := nil;
  BitMapVisible := TBitMap.Create;
  BitMapUnvisible := TBitMap.Create;
  ImageList.GetBitMap(4, BitMapUnvisible);
  ImageList.GetBitMap(5, BitMapVisible);
  SetMenuItemBitmaps(pmTitle.Handle, 1, MF_BYPOSITION,
                     BitMapUnvisible.Handle, BitMapVisible.Handle);
end;

procedure TGridLayoutDlg.FormDestroy(Sender: TObject);
begin
  BitMapVisible.Free;
  BitMapUnVisible.Free;
end;

procedure TGridLayoutDlg.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE : if ListView.IsEditing then ListView.Selected.CancelEdit
                                      else ModalResult := mrCancel;
    VK_RETURN : if ListView.IsEditing then Key := 0
                                      else ModalResult := mrOK;
  end;
end;

procedure TGridLayoutDlg.ListViewEdited(Sender: TObject; Item: TListItem;
  var S: String);
begin
  LabelMask.Caption := Format('Маска для поля %s (%s)',[S, Item.SubItems[0]]);
end;

procedure TGridLayoutDlg.EditWidthChange(Sender: TObject);
begin
    try
        if StrToInt(EditWidth.Text) > 0 then
            with ListView do
                if not ListView.Dragging then
                    Selected.SubItems[2] := EditWidth.Text
        else
            raise Exception.Create('Введено неверное число');
    except
        raise Exception.Create('Введено неверное число');
    end;
end;

procedure TGridLayoutDlg.btnDefaultParamsClick(Sender: TObject);
begin
  if FGrid is TcitDBGrid then
    TcitDBGrid(FGrid).RestoreFormatFromStorage;
  RefreshFields(FGrid);
end;

procedure TGridLayoutDlg.miOrientationHorClick(Sender: TObject);
begin
  miOrientationHor.Checked := True;
  if ListView.Selected = nil then Exit;
  ListView.Selected.SubItems.Objects[1] := TObject(0);
  ListView.Selected.Update;
end;

procedure TGridLayoutDlg.miOrientationVerClick(Sender: TObject);
begin
  miOrientationVer.Checked := True;
  if ListView.Selected = nil then Exit;
  ListView.Selected.SubItems.Objects[1] := TObject(1);
  ListView.Selected.Update;
end;

procedure TGridLayoutDlg.ListViewGetSubItemImage(Sender: TObject;
  Item: TListItem; SubItem: Integer; var ImageIndex: Integer);
begin
  if SubItem <> 1 then Exit;
  if Integer(Item.SubItems.Objects[1]) = 1 then ImageIndex := 2
  else ImageIndex := 3;
end;

procedure TGridLayoutDlg.SpeedButton1Click(Sender: TObject);
var
  Dlg	: TDBGridLayoutDlg;
begin
  Dlg := TDBGridLayoutDlg.Create(Self);
  Dlg.OwnerGrid := TDBGrid(FGrid);
  Dlg.ShowModal;
end;

end.
