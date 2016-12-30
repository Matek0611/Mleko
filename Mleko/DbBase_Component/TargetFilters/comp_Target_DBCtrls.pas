
{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{                                                       }
{       Copyright (c) 1995,99 Inprise Corporation       }
{                                                       }
{*******************************************************}

unit comp_Target_DBCtrls;

{$R-,H+,X+}

interface

uses Variants, Windows, SysUtils, Messages, Controls, Forms, Classes,
     Graphics, Menus, StdCtrls, ExtCtrls, Mask, Buttons, ComCtrls, DB,
     dbctrls;

type
{ TODO 1 -cНа будущее : Исправить глюк с блокировкой клавиатуры при открытии списка }

{ TComp_Target_DBLookupControl }

  TComp_Target_DBLookupControl = class;

  TTarget_DataSourceLink = class(TDataLink)
  private
    FDBLookupControl: TComp_Target_DBLookupControl;
  protected
    procedure FocusControl(Field: TFieldRef); override;
    procedure ActiveChanged; override;
    procedure LayoutChanged; override;
    procedure RecordChanged(Field: TField); override;
  public
    constructor Create;
  end;

  TTarget_ListSourceLink = class(TDataLink)
  private
    FDBLookupControl: TComp_Target_DBLookupControl;
  protected
    procedure ActiveChanged; override;
    procedure DataSetChanged; override;
    procedure LayoutChanged; override;
  public
    constructor Create;
  end;

  TComp_Target_DBLookupControl = class(TCustomControl)
  private
    FLookupSource: TDataSource;
    FDataLink: TTarget_DataSourceLink;
    FListLink: TTarget_ListSourceLink;
    FDataFieldName: string;
    FKeyFieldName: string;
    FListFieldName: string;
    FListFieldIndex: Integer;
    FDataField: TField;
    FMasterField: TField;
    FKeyField: TField;
    FListField: TField;
    FListFields: TList;
    FKeyValue: Variant;
    FSearchText: string;
    FLookupMode: Boolean;
    FListActive: Boolean;
    FHasFocus: Boolean;
    FNullValueKey: TShortCut;
    FShowKeyColumn: boolean;
    Fa_FilterOnDropDown: string;
    Fa_SortOnDropDown: string;
    fa_NoFilterOnProcessSearchKey: boolean;
    Fa_AutoHint: boolean;
    procedure CheckNotCircular;
    procedure CheckNotLookup;
    procedure DataLinkRecordChanged(Field: TField);
    function GetDataSource: TDataSource;
    function GetKeyFieldName: string;
    function GetListSource: TDataSource;
    function GetReadOnly: Boolean;
    procedure SetDataFieldName(const Value: string);
    procedure SetDataSource(Value: TDataSource);
    procedure SetKeyFieldName(const Value: string);
    procedure SetKeyValue(const Value: Variant);
    procedure SetListFieldName(const Value: string);
    procedure SetListSource(Value: TDataSource);
    procedure SetLookupMode(Value: Boolean);
    procedure SetReadOnly(Value: Boolean);
    procedure WMGetDlgCode(var Message: TMessage); message WM_GETDLGCODE;
    procedure WMKeyDown(var Message: TWMKeyDown); message WM_KEYDOWN;
    procedure WMKillFocus(var Message: TMessage); message WM_KILLFOCUS;
    procedure WMSetFocus(var Message: TMessage); message WM_SETFOCUS;
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
    procedure SetShowKeyColumn(const Value: boolean); virtual;
  protected
    KeyColumnPosInList : integer;
    function CanModify: Boolean; virtual;
    function GetBorderSize: Integer; virtual;
    function GetTextHeight: Integer; virtual;
    procedure KeyValueChanged; virtual;
    procedure ListLinkDataChanged; virtual;
    function LocateKey: Boolean; virtual;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    function MergeWithPrevFilter(aPrevFilter:string; aPrevFiltered : boolean; s : string) : string;
    procedure ProcessSearchKey(Key: Char); virtual;
    procedure SelectKeyValue(const Value: Variant); virtual;
    procedure UpdateDataFields; virtual;
    procedure UpdateListFields; virtual;
    property DataField: string read FDataFieldName write SetDataFieldName;
    property DataLink: TTarget_DataSourceLink read FDataLink;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property HasFocus: Boolean read FHasFocus;
    property KeyField: string read GetKeyFieldName write SetKeyFieldName;
    property KeyValue: Variant read FKeyValue write SetKeyValue;
    property ListActive: Boolean read FListActive;
    property ListField: string read FListFieldName write SetListFieldName;
    property ListFieldIndex: Integer read FListFieldIndex write FListFieldIndex default 0;
    property ListFields: TList read FListFields;
    property ListLink: TTarget_ListSourceLink read FListLink;
    property ListSource: TDataSource read GetListSource write SetListSource;
    property NullValueKey: TShortCut read FNullValueKey write FNullValueKey default 0;    
    property ParentColor default False;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
    property SearchText: string read FSearchText write FSearchText;
    property TabStop default True;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ExecuteAction(Action: TBasicAction): Boolean; override;
    function UpdateAction(Action: TBasicAction): Boolean; override;
    property Field: TField read FDataField;
    procedure DoUpdateListFields;
  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key : Char); override;
  //!!!
  private
    VK_SubtractReceived : boolean;
    VK_DeleteReceived   : boolean;
    AC_CopyReceived    : boolean;
    PrevKeyValue   : Variant;
    PrevFilter     : string;
    PrevFiltered   : boolean;

    KeyValueStored : boolean;
    BlockRepaint : boolean;

    procedure StoreKeyValue;
    procedure RestoreKeyValue;
    procedure RestoreFilter;
  protected
    procedure WndProc (var Message : TMessage); override;
  published
    property a_ShowKeyColumn : boolean read FShowKeyColumn write SetShowKeyColumn default false;
    property a_FilterOnDropDown : string read Fa_FilterOnDropDown write Fa_FilterOnDropDown;
    property a_NoFilterOnProcessSearchKey : boolean read fa_NoFilterOnProcessSearchKey write fa_NoFilterOnProcessSearchKey;
    property a_AutoHint : boolean read Fa_AutoHint write Fa_AutoHint default false;
  end;

{ TTarget_DBLookupListBox }

  TOnProcessSearchKey = function (Sender : TObject; var KeyValue : Variant; Key : char) : boolean of object;

  TTarget_DBLookupListBox = class(TComp_Target_DBLookupControl)
  private
    FRecordIndex: Integer;
    FRecordCount: Integer;
    FRowCount: Integer;
    FBorderStyle: TBorderStyle;
    FPopup: Boolean;
    FKeySelected: Boolean;
    FTracking: Boolean;
    FTimerActive: Boolean;
    FLockPosition: Boolean;
    FMousePos: Integer;
    FSelectedItem: string;
    function GetKeyIndex: Integer;
    procedure SelectCurrent;
    procedure SelectItemAt(X, Y: Integer);
    procedure SetBorderStyle(Value: TBorderStyle);
    procedure SetRowCount(Value: Integer);
    procedure StopTimer;
    procedure StopTracking;
    procedure TimerScroll;
    procedure UpdateScrollBar;
    procedure CMCtl3DChanged(var Message: TMessage); message CM_CTL3DCHANGED;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure WMCancelMode(var Message: TMessage); message WM_CANCELMODE;
    procedure WMTimer(var Message: TMessage); message WM_TIMER;
    procedure WMVScroll(var Message: TWMVScroll); message WM_VSCROLL;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure KeyValueChanged; override;
    procedure ListLinkDataChanged; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure Paint; override;
    procedure UpdateListFields; override;
  public
    constructor Create(AOwner: TComponent); override;
    function ExecuteAction(Action: TBasicAction): Boolean; override;
    function UpdateAction(Action: TBasicAction): Boolean; override;
    function UseRightToLeftAlignment: Boolean; override;
    property KeyValue;
    property SelectedItem: string read FSelectedItem;
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
  private
    a_ShrinkFieldsInListWithOneSymbolDisplayWidth : boolean;
  published
    property Align;
    property Anchors;
    property BevelEdges;
    property BevelInner;
    property BevelOuter;
    property BevelKind;
    property BevelWidth;
    property BiDiMode;
    property BorderStyle: TBorderStyle read FBorderStyle write SetBorderStyle default bsSingle;
    property Color;
    property Constraints;
    property Ctl3D;
    property DataField;
    property DataSource;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property ImeMode;
    property ImeName;
    property KeyField;
    property ListField;
    property ListFieldIndex;
    property ListSource;
    property NullValueKey;
    property ParentBiDiMode;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly;
    property RowCount: Integer read FRowCount write SetRowCount stored False;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDock;
    property OnStartDrag;
  end;

{ TTarget_DBLookupComboBox }

  TTarget_PopupDataList = class(TTarget_DBLookupListBox)
  private
    procedure WMMouseActivate(var Message: TMessage); message WM_MOUSEACTIVATE;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  {TDropDownAlign = (daLeft, daRight, daCenter);}
  TOnGetText = function (Sender : TObject) : string of object;

  TTarget_DBLookupComboBox = class(TComp_Target_DBLookupControl)
  private
    FDataList: TTarget_PopupDataList;
    FButtonWidth: Integer;
    FText: string;
    FDropDownRows: Integer;
    FDropDownWidth: Integer;
    FDropDownAlign: TDropDownAlign;
    FListVisible: Boolean;
    FPressed: Boolean;
    FTracking: Boolean;
    FAlignment: TAlignment;
    FLookupMode: Boolean;
    FOnDropDown: TNotifyEvent;
    FOnCloseUp: TNotifyEvent;
    fOnProcessSearchKey: TOnProcessSearchKey;
    Fa_DoTabOnCloseAndSave: boolean;
    Fa_DisableDelete: boolean;
    fOnGetText: TOnGetText;
    Fa_ListFontSizeMoreThanThatOfCombo: integer;
    Fa_ShrinkFieldsInListWithOneSymbolDisplayWidth: boolean;
    fa_NullText: string;
    procedure ListMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure StopTracking;
    procedure TrackButton(X, Y: Integer);
    procedure CMDialogKey(var Message: TCMDialogKey); message CM_DIALOGKEY;
    procedure CMCancelMode(var Message: TCMCancelMode); message CM_CANCELMODE;
    procedure CMCtl3DChanged(var Message: TMessage); message CM_CTL3DCHANGED;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
    procedure WMCancelMode(var Message: TMessage); message WM_CANCELMODE;
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KILLFOCUS;
    procedure WMKeyDown(var Message: TWMKeyDown); message WM_KEYDOWN;
    procedure CMBiDiModeChanged(var Message: TMessage); message CM_BIDIMODECHANGED;
    procedure Seta_DisableDelete(const Value: boolean);
    procedure Seta_ListFontSizeMoreThanThatOfCombo(const Value: integer);
    procedure Seta_ShrinkFieldsInListWithOneSymbolDisplayWidth(
      const Value: boolean);
    procedure SetA_NullText(const Value: string);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure Paint; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyUp(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure KeyValueChanged; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure UpdateListFields; override;
    procedure SetShowKeyColumn(const Value: boolean); override;
    procedure DoEnter; override;
    procedure DoExit; override;
  protected
    AutoHintPos : TPoint;
    PrevListFields : TList;
    procedure DoAutoHint;
  public
    DisableNextTabOnCloseCall : boolean;
    DisableFunctionalKeys : boolean;
    NeedAutoHint : boolean;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure CloseUp(Accept: Boolean); virtual;
    procedure DropDown; virtual;
    function ExecuteAction(Action: TBasicAction): Boolean; override;
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
    function UpdateAction(Action: TBasicAction): Boolean; override;
    function UseRightToLeftAlignment: Boolean; override;
    property KeyValue;
    property ListVisible: Boolean read FListVisible;
    property Text: string read FText;
  published
    property Anchors;
    property BevelEdges;
    property BevelInner;
    property BevelOuter;
    property BevelKind;
    property BevelWidth;
    property BiDiMode;
    property Color;
    property Constraints;
    property Ctl3D;
    property DataField;
    property DataSource;
    property DragCursor;
    property DragKind;
    property DragMode;
    property DropDownAlign: TDropDownAlign read FDropDownAlign write FDropDownAlign default daLeft;
    property DropDownRows: Integer read FDropDownRows write FDropDownRows default 20;
    property DropDownWidth: Integer read FDropDownWidth write FDropDownWidth default 0;
    property Enabled;
    property Font;
    property ImeMode;
    property ImeName;
    property KeyField;
    property ListField;
    property ListFieldIndex;
    property ListSource;
    property NullValueKey;
    property ParentBiDiMode;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnClick;
    property OnCloseUp: TNotifyEvent read FOnCloseUp write FOnCloseUp;
    property OnContextPopup;
    property OnDragDrop;
    property OnDragOver;
    property OnDropDown: TNotifyEvent read FOnDropDown write FOnDropDown;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDock;
    property OnStartDrag;
  //!!!
  protected
    InCloseUp : boolean;
    //HintPause,HintHidePause: integer;
    DisableKeyPress : boolean;
    procedure ProcessSearchKey(Key: Char); override;
    procedure DoTabOnCloseAndSave;
  public
    FullFilterDropDown : boolean;
    procedure DoKeyValueChanged;
  published
    property a_OnProcessSearchKey : TOnProcessSearchKey read fOnProcessSearchKey write fOnProcessSearchKey;
    property a_DoTabOnCloseAndSave : boolean read Fa_DoTabOnCloseAndSave write Fa_DoTabOnCloseAndSave;
    property a_DisableDelete : boolean read Fa_DisableDelete write Seta_DisableDelete default true;
    property a_OnGetText : TOnGetText read fOnGetText write fOnGetText;
    property a_ListFontSizeMoreThanThatOfCombo : integer read Fa_ListFontSizeMoreThanThatOfCombo write Seta_ListFontSizeMoreThanThatOfCombo default 0;
    property a_ShrinkFieldsInListWithOneSymbolDisplayWidth : boolean read Fa_ShrinkFieldsInListWithOneSymbolDisplayWidth write Seta_ShrinkFieldsInListWithOneSymbolDisplayWidth default false;
    property a_NullText : string read fa_NullText write SetA_NullText;
  end;
var
  wm_target_tabNext,wm_target_AutoHint : integer;
function VarEquals(const V1, V2: Variant): Boolean;

procedure Register;

implementation

uses DBLogDlg, DBPWDlg, Clipbrd, DBConsts, VDBConsts, Dialogs, Math;

procedure Register;
  begin
    RegisterComponents('TargetDB', [TTarget_DBLookupComboBox]);
  end;

{ TTarget_DataSourceLink }

constructor TTarget_DataSourceLink.Create;
begin
  inherited Create;
  VisualControl := True;
end;

procedure TTarget_DataSourceLink.ActiveChanged;
begin
  if FDBLookupControl <> nil then FDBLookupControl.UpdateDataFields;
end;

procedure TTarget_DataSourceLink.FocusControl(Field: TFieldRef);
begin
  if (Field^ <> nil) and (Field^ = FDBLookupControl.Field) and
    (FDBLookupControl <> nil) and FDBLookupControl.CanFocus then
  begin
    Field^ := nil;
    FDBLookupControl.SetFocus;
  end;
end;

procedure TTarget_DataSourceLink.LayoutChanged;
begin
  if FDBLookupControl <> nil then FDBLookupControl.UpdateDataFields;
end;

procedure TTarget_DataSourceLink.RecordChanged(Field: TField);
begin
  if FDBLookupControl <> nil then FDBLookupControl.DataLinkRecordChanged(Field);
end;

{ TTarget_ListSourceLink }

constructor TTarget_ListSourceLink.Create;
begin
  inherited Create;
  VisualControl := True;
end;

procedure TTarget_ListSourceLink.ActiveChanged;
begin
  if FDBLookupControl <> nil then FDBLookupControl.UpdateListFields;
end;

procedure TTarget_ListSourceLink.DataSetChanged;
begin
  if FDBLookupControl <> nil then FDBLookupControl.ListLinkDataChanged;
end;

procedure TTarget_ListSourceLink.LayoutChanged;
begin
  if FDBLookupControl <> nil then FDBLookupControl.UpdateListFields;
end;

{ TComp_Target_DBLookupControl }

function VarEquals(const V1, V2: Variant): Boolean;
begin
  Result := False;
  try
    Result := V1 = V2;
  except
  end;
end;

var
  SearchTickCount: Integer = 0;

procedure TComp_Target_DBLookupControl.StoreKeyValue;
  begin
    //if fKeyField = nil then exit;
    if not KeyValueStored then begin
      if (ListSource <> nil) and (ListSource.DataSet <> nil) then begin
         PrevFilter   := ListSource.DataSet.Filter;
         PrevFiltered := ListSource.DataSet.Filtered;
      end;
      PrevKeyValue := KeyValue;
      KeyValueStored := true;
    end;
  end;

procedure TComp_Target_DBLookupControl.RestoreFilter;
  begin
    if (ListSource <> nil) and (ListSource.DataSet <> nil) then begin
       ListSource.DataSet.Filter   := PrevFilter;
       ListSource.DataSet.Filtered := PrevFiltered;
    end;
  end;

procedure TComp_Target_DBLookupControl.RestoreKeyValue;
  var
    PrevDataFieldOnChange : TFieldNotifyEvent;
  begin
    try
      if FDataLink.Editing and (FDataField <> nil) then begin
        PrevDataFieldOnChange := fDataField.OnChange;
        fDataField.OnChange   := nil;
        fDataField.Value := PrevKeyValue;
      end;
      SetKeyValue(PrevKeyValue);
    finally
      if FDataLink.Editing and (fDataField <> nil) then fDataField.OnChange := PrevDataFieldOnChange;
    end;
  end;

constructor TComp_Target_DBLookupControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  fShowKeyColumn := false;
  if NewStyleControls then
    ControlStyle := [csOpaque] else
    ControlStyle := [csOpaque, csFramed];
  ParentColor := False;
  TabStop := True;
  FLookupSource := TDataSource.Create(Self);
  FDataLink := TTarget_DataSourceLink.Create;
  FDataLink.FDBLookupControl := Self;
  FListLink := TTarget_ListSourceLink.Create;
  FListLink.FDBLookupControl := Self;
  FListFields := TList.Create;
  FKeyValue := Null;
end;

destructor TComp_Target_DBLookupControl.Destroy;
begin
  inherited Destroy;
  FreeAndNil(FListFields);
  if FListLink <> nil then
    FListLink.FDBLookupControl := nil;
  FreeAndNil(FListLink);
  if FDataLink <> nil then
    FDataLink.FDBLookupControl := nil;
  FreeAndNil(FDataLink);
end;

function TComp_Target_DBLookupControl.CanModify: Boolean;
begin
  Result := FListActive and not ReadOnly and ((FDataLink.DataSource = nil) or
    (FMasterField <> nil) and FMasterField.CanModify);
end;

procedure TComp_Target_DBLookupControl.CheckNotCircular;
begin
  if FListLink.Active and FListLink.DataSet.IsLinkedTo(DataSource) then
    DatabaseError(SCircularDataLink);
end;

procedure TComp_Target_DBLookupControl.CheckNotLookup;
begin
  if FLookupMode then DatabaseError(SPropDefByLookup);
  if FDataLink.DataSourceFixed then DatabaseError(SDataSourceFixed);
end;

procedure TComp_Target_DBLookupControl.UpdateDataFields;
begin
  FDataField := nil;
  FMasterField := nil;
  if FDataLink.Active and (FDataFieldName <> '') then
  begin
    CheckNotCircular;
    FDataField := GetFieldProperty(FDataLink.DataSet, Self, FDataFieldName);
    if FDataField.FieldKind = fkLookup then
      FMasterField := GetFieldProperty(FDataLink.DataSet, Self, FDataField.KeyFields)
    else
      FMasterField := FDataField;
  end;
  SetLookupMode((FDataField <> nil) and (FDataField.FieldKind = fkLookup));
  DataLinkRecordChanged(nil);
end;

procedure TComp_Target_DBLookupControl.DataLinkRecordChanged(Field: TField);
begin
  if (Field = nil) or (Field = FMasterField) then
    if FMasterField <> nil then
      SetKeyValue(FMasterField.Value) else
      SetKeyValue(Null);
end;

function TComp_Target_DBLookupControl.GetBorderSize: Integer;
var
  Params: TCreateParams;
  R: TRect;
begin
  CreateParams(Params);
  SetRect(R, 0, 0, 0, 0);
  AdjustWindowRectEx(R, Params.Style, False, Params.ExStyle);
  Result := R.Bottom - R.Top;
end;

function TComp_Target_DBLookupControl.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

function TComp_Target_DBLookupControl.GetKeyFieldName: string;
begin
  if FLookupMode then Result := '' else Result := FKeyFieldName;
end;

function TComp_Target_DBLookupControl.GetListSource: TDataSource;
begin
  if FLookupMode then Result := nil else Result := FListLink.DataSource;
end;

function TComp_Target_DBLookupControl.GetReadOnly: Boolean;
begin
  Result := FDataLink.ReadOnly;
end;

function TComp_Target_DBLookupControl.GetTextHeight: Integer;
var
  DC: HDC;
  SaveFont: HFont;
  Metrics: TTextMetric;
begin
  DC := GetDC(0);
  SaveFont := SelectObject(DC, Font.Handle);
  GetTextMetrics(DC, Metrics);
  SelectObject(DC, SaveFont);
  ReleaseDC(0, DC);
  Result := Metrics.tmHeight;
end;

procedure TComp_Target_DBLookupControl.KeyValueChanged;
begin
end;

procedure TComp_Target_DBLookupControl.DoUpdateListFields;
  begin
    UpdateListFields;
  end;

procedure TComp_Target_DBLookupControl.UpdateListFields;
var
  DataSet: TDataSet;
  ResultField: TField;
begin
  FListActive := False;
  FKeyField := nil;
  FListField := nil;
  FListFields.Clear;
  if FListLink.Active and (FKeyFieldName <> '') then
  begin
    CheckNotCircular;
    DataSet := FListLink.DataSet;
    FKeyField := GetFieldProperty(DataSet, Self, FKeyFieldName);
    try
      DataSet.GetFieldList(FListFields, FListFieldName);
    except
      DatabaseErrorFmt(SFieldNotFound, [Self.Name, FListFieldName]);
    end;
    if FLookupMode then
    begin
      ResultField := GetFieldProperty(DataSet, Self, FDataField.LookupResultField);
      if FListFields.IndexOf(ResultField) < 0 then
        FListFields.Insert(0, ResultField);
      FListField := ResultField;
    end else
    begin
      if FListFields.Count = 0 then FListFields.Add(FKeyField);
      if (FListFieldIndex >= 0) and (FListFieldIndex < FListFields.Count) then
        FListField := FListFields[FListFieldIndex] else
        FListField := FListFields[0];
    end;
    FListActive := True;
  end;
end;

procedure TComp_Target_DBLookupControl.ListLinkDataChanged;
begin
end;

function TComp_Target_DBLookupControl.LocateKey: Boolean;
var
  KeySave: Variant;
  CaptionStr : string;
begin
  Result := False;

  try
    KeySave := FKeyValue;
    if not VarIsNull(FKeyValue) and FListLink.DataSet.Active and
      FListLink.DataSet.Locate(FKeyFieldName, FKeyValue, []) then
    begin
      Result := True;
      FKeyValue := KeySave;
    end
    {else if not VarIsNull(FKeyValue) and FListLink.DataSet.Active then begin
      CaptionStr := 'Список выбора ';
      if FDataField <> nil
        then CaptionStr := CaptionStr + ' "'+FDataField.DisplayLabel+'"';
      Application.MessageBox(PChar('Обнаружена ошибка построения списка выбора'#13+
                             'Сейчас будет предпринята попытка восстановления списка выбора'#13+
                             'Проверьте работоспособность списка выбора и сообщите разработчикам об ошибке'),
                             PChar(CaptionStr),
                             MB_OK + MB_ICONWARNING
                             );
      TMyCustomADODataset(FListLink.DataSet).DoDestroyLookupCursor;
      if FListLink.DataSet.Locate(FKeyFieldName, FKeyValue, []) then
        begin
          Result := True;
          FKeyValue := KeySave;
        end;
    end;}
  except
  end;
end;

procedure TComp_Target_DBLookupControl.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Operation = opRemove then
  begin
    if (FDataLink <> nil) and (AComponent = DataSource) then DataSource := nil;
    if (FListLink <> nil) and (AComponent = ListSource) then ListSource := nil;
  end;
end;

function TComp_Target_DBLookupControl.MergeWithPrevFilter(aPrevFilter:string; aPrevFiltered : boolean; s : string) : string;
    var
      OrBlock,SOrBlock,PrevFilterS : string;

      function GetNextOrBlock(var S,Block : string) : boolean;
        var
          P,i : integer;
          ExtraBracket :  integer;
        begin
          S := AnsiUpperCase(S);
          P := Pos(' OR ',S);
          if P = 0 then P := Length(S)+1;

          ExtraBracket := 0;
          for i := 1 to P-1 do begin
            if S[i] = '(' then inc(ExtraBracket);
            if S[i] = ')' then dec(ExtraBracket);
          end;

          if ExtraBracket = 1 then begin
            i := Pos('(',S);
            S := Trim(Copy(S,i+1,P-1-(i+1)));
            i := Length(S);
            while i > 0 do begin
              if S[i] = ')' then begin
                S := Copy(S,1,i-1);
                break;
              end;
              dec(i);
            end;
          end;

          P := Pos(' OR ',S);
          if P = 0 then P := Length(S)+1;

          Block := Copy(S,1,P-1);
          S     := Copy(S,P+4,Length(S));

          Result := Block <> '';
        end;

    begin
      Result := s;
      S := AnsiUpperCase(S);
      if (aPrevFilter <> '') and aPrevFiltered then begin
        if S <> ''
           then begin
                  Result := '';
                  while GetNextOrBlock(S,SOrBlock) do begin
                    PrevFilterS := aPrevFilter;
                    while GetNextOrBlock(PrevFilterS,OrBlock) do begin
                      if Result <> '' then Result := Result + ' OR ';
                      Result := Result + '('+OrBlock + ' AND ' + SOrBlock+')';
                    end;
                  end;
                end
           else Result := aPrevFilter;
      end;
    end;

procedure TComp_Target_DBLookupControl.ProcessSearchKey(Key: Char);
  var
    TickCount: Integer;
    S: string;
    CharMsg: TMsg;


  function BuildFilterStr (S : string) : string;
    var
      P                 : integer;
      SBuf,CurF,CurFRes : string;
      ID                : Int64;
      i                 : integer;

    begin
      Result := '';
      while Pos('  ',S) <> 0 do S := StringReplace(S,'  ',' ',[rfReplaceAll]);
      S := StringReplace(Trim(S),'''','''''',[rfReplaceAll]);

      if (Length(S) > 0) and (ListSource <> nil) and (ListSource.DataSet <> nil) then
        if (S[1] = '=')
          then //Фильтр на код
            begin
              S := Copy(S,2,Length(S)-1);
              try
                ID := StrToInt(S);
              except
                exit;
              end;
              if fKeyField <> nil then begin
                Result := '['+fKeyField.FieldName + '] = ' + IntToStr(ID);
              end;
            end
          else //Фильтр на вхождение строки
            begin
              for i := 0 to ListFields.Count-1 do begin
                if fShowKeyColumn
                  then begin if not (i = FListFieldIndex) then continue; end
                  else begin if not (i = FListFieldIndex-1) then continue; end;

                if not (  (TField(ListFields[i]) is TStringField)
                           and
                           (TField(ListFields[i]).FieldKind = fkData)
                       ) then continue;
                 SBuf := S;
                 CurFRes := '';
                 while SBuf <> '' do begin
                   P := Pos(' ',SBuf);
                   if P = 0 then P := Length(SBuf)+1;
                   if CurFRes <> '' then CurFRes := CurFRes + ' AND ';
                   CurFRes := CurFRes + '['+TField(ListFields[i]).FieldName + '] like ''%' + Copy(SBuf,1,P-1) + '%''';
                   SBuf := Copy(SBuf,P+1,Length(SBuf));
                 end;
                 if CurFRes <> '' then begin
                   if Result <> '' then Result := Result + ' OR ';
                   Result := Result + '(' +  CurFRes + ')';
                 end;
              end;
            end;
   end;
var
  PrevID : Variant;

  function DecodeKey(Key : char) : char;
    begin
      if (Key = '-') and VK_SubtractReceived and (SearchText = '')
        then Result := '='
        else Result := Key;
    end;
var
  StartTime : extended;
  lpMsg: TMsg;
  ShiftState : TShiftState;
  GotCharToDo : boolean;
  KeyDelta : string;
  T : array [0..100] of Int64;
  CharCode : Char;
  ScanCode : integer;
begin
  if (FListField <> nil) and (FListField.FieldKind in [fkData, fkInternalCalc]) and
    (FListField.DataType in [ftString, ftWideString]) then
    case Key of
      //#27: SearchText := '';
      #8,#27,#32..#255:
      if CanModify then
        begin
          {TickCount := GetTickCount;
          if TickCount - SearchTickCount > 2000 then SearchText := '';
          SearchTickCount := TickCount;}
          {if SysLocale.FarEast and (Key in LeadBytes) then
            if PeekMessage(CharMsg, Handle, WM_CHAR, WM_CHAR, PM_REMOVE) then
            begin
              if CharMsg.Message = WM_Quit then
              begin
                PostQuitMessage(CharMsg.wparam);
                Exit;
              end;
              SearchText := SearchText + Key;
              Key := Char(CharMsg.wParam);
            end;}

          if Length(SearchText) < 32 then
          begin
            StoreKeyValue;

            T[0] := GetTickCount;
            T[1] := T[0];
            StartTime := Now;
            S := SearchText;
            KeyDelta := '';
            repeat
              GotCharToDo := false;
              if VK_DeleteReceived
                then S := '';
              VK_DeleteReceived := false;
              if Key <> #0
                then if Key = #8
                       then begin
                              S := Copy(S,1,Length(S)-1);
                              KeyDelta := Copy(KeyDelta,1,Length(KeyDelta)-1);
                            end
                       else begin
                              S := S + DecodeKey(Key);
                              KeyDelta := KeyDelta + DecodeKey(Key);
                            end;
              Key := #0;

              if PeekMessage(lpMsg,Handle,WM_Char,WM_Char,PM_NoREMOVE) then begin
                StartTime := Now;
                PeekMessage(lpMsg,Handle,WM_Char,WM_Char,PM_REMOVE);
                Key := Char(lo(lpMsg.wParam));
                GotCharToDo := true;
                continue;
              end;

              if PeekMessage(lpMsg,Handle,WM_KeyDown,WM_KeyDown,PM_NoREMOVE) then begin
                //KeyDelta := IntToStr(lpMsg.wparam);
                CharCode := char(lpMsg.WParam);
                ScanCode := (lpMsg.LParam and $FF0000) shr 16;
                VK_DeleteReceived := ScanCode = 83;
                StartTime := Now;
                if CharCode in [#0..#7,#9..#31]
                  then break;
                if not TranslateMessage(lpMsg)
                  then break;
                if not PeekMessage(lpMsg,Handle,WM_Char,WM_Char,PM_NoREMOVE)
                  then break;

                PeekMessage(lpMsg,Handle,WM_KeyDown,WM_KeyDown,PM_REMOVE);
                GotCharToDo := true;
                continue;
              end;

              {                TWMKey = packed record                    tagMSG = packed record
    Msg: Cardinal;                                         hwnd: HWND;
    CharCode: Word;                                        message: UINT;
    Unused: Word;                                          wParam: WPARAM;
    KeyData: Longint;                                      lParam: LPARAM;
    Result: Longint;                                       time: DWORD;
  end;                                                     pt: TPoint;
                                                         end;}
              {with lpMsg do
                begin
                  ShiftState := KeyDataToShiftState(lParam);
                  CharCode := lo(WParam);
                  if CharCode = 0
                    then break
                    else begin
                           Key := char(CharCode);
                           VK_DeleteReceived := CharCode = vk_Delete;
                           PeekMessage(lpMsg,Handle,WM_KeyFirst,WM_KeyLast,PM_REMOVE);
                         end;
                end;}
            until not GotCharToDo and ((Now - StartTime) > 0.03*1/24/60/60);
            T[2] := GetTickCount;
            T[3] := T[2] - T[1];
            T[1] := T[2];
            if Length(SearchText) = 0
              then SearchText := Trim(S)
              else SearchText := S;

            if a_NoFilterOnProcessSearchKey
              then begin
                     FListLink.DataSet.Locate(FListField.FieldName, SearchText,[loCaseInsensitive, loPartialKey]);
                   end
              else begin
                     if (ListSource <> nil) and (ListSource.DataSet <> nil) then begin

                       S := BuildFilterStr(S);
                       S := MergeWithPrevFilter(Fa_FilterOnDropDown,Fa_FilterOnDropDown <> '',
                                                MergeWithPrevFilter(PrevFilter,PrevFiltered,S));
                       try
                         PrevID := ListSource.DataSet.FieldByName(KeyField).AsVariant;
                         if S <> ''
                           then begin
                                  ListSource.DataSet.Filter := S;
                                  ListSource.DataSet.Filtered := true;
                                end
                           else ListSource.DataSet.Filtered := false;
                       finally
                         if not (varIsNull(PrevID) or varIsEmpty(PrevID)) then
                           ListSource.DataSet.Locate(keyField,PrevID,[]);
                       end;
                      end;
                    end;

            T[2] := GetTickCount;
            T[4] := T[2] - T[1];
            T[1] := T[2];

            T[5] := T[1] - T[0];

            {if Screen.ActiveForm <> nil
               then Screen.ActiveForm.Caption := IntToStr(T[3])+'<'+KeyDelta+'>'+
                                                 IntToStr(T[4])+' '+
                                                 Screen.ActiveForm.Caption;}

            try
              {if FListLink.DataSet.Locate(FListField.FieldName, SearchText
                [loCaseInsensitive, loPartialKey]) then
              begin
                try
                  BlockRepaint := true;
                  SelectKeyValue(FKeyField.Value);
                finally
                  BlockRepaint := false;
                end;
              end;}

            except
              { If you attempt to search for a string larger than what the field
                can hold, and exception will be raised.  Just trap it and
                reset the SearchText back to the old value. }
              //SearchText := S;
            end;
          end;
        end;
    end;
end;

procedure TComp_Target_DBLookupControl.SelectKeyValue(const Value: Variant);
begin
  if FMasterField <> nil then
  begin
    if FDataLink.Edit then
      FMasterField.Value := Value;
  end else
    SetKeyValue(Value);
  //!!!
  if not BlockRepaint then Repaint;
  Click;
end;

procedure TComp_Target_DBLookupControl.SetDataFieldName(const Value: string);
begin
  if FDataFieldName <> Value then
  begin
    FDataFieldName := Value;
    UpdateDataFields;
  end;
end;

procedure TComp_Target_DBLookupControl.SetDataSource(Value: TDataSource);
begin
  if not (FDataLink.DataSourceFixed and (csLoading in ComponentState)) then
    FDataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

procedure TComp_Target_DBLookupControl.SetKeyFieldName(const Value: string);
begin
  CheckNotLookup;
  if FKeyFieldName <> Value then
  begin
    FKeyFieldName := Value;
    UpdateListFields;
  end;
end;

procedure TComp_Target_DBLookupControl.SetKeyValue(const Value: Variant);
begin
  if not VarEquals(FKeyValue, Value) then
  begin
    FKeyValue := Value;
    KeyValueChanged;
  end;
end;

procedure TComp_Target_DBLookupControl.SetListFieldName(const Value: string);
begin
  if FListFieldName <> Value then
  begin
    FListFieldName := Value;
    UpdateListFields;
  end;
end;

procedure TComp_Target_DBLookupControl.SetListSource(Value: TDataSource);
begin
  CheckNotLookup;
  FListLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

procedure TComp_Target_DBLookupControl.SetLookupMode(Value: Boolean);
begin
  if FLookupMode <> Value then
    if Value then
    begin
      FMasterField := GetFieldProperty(FDataField.DataSet, Self, FDataField.KeyFields);
      FLookupSource.DataSet := FDataField.LookupDataSet;
      FKeyFieldName := FDataField.LookupKeyFields;
      FLookupMode := True;
      FListLink.DataSource := FLookupSource;
    end else
    begin
      FListLink.DataSource := nil;
      FLookupMode := False;
      FKeyFieldName := '';
      FLookupSource.DataSet := nil;
      FMasterField := FDataField;
    end;
end;

procedure TComp_Target_DBLookupControl.SetReadOnly(Value: Boolean);
begin
  FDataLink.ReadOnly := Value;
end;

procedure TComp_Target_DBLookupControl.WMGetDlgCode(var Message: TMessage);
begin
  Message.Result := DLGC_WANTARROWS or DLGC_WANTCHARS;
end;

procedure TComp_Target_DBLookupControl.WMKillFocus(var Message: TMessage);
begin
  FHasFocus := False;
  inherited;
  Invalidate;
end;

procedure TComp_Target_DBLookupControl.WMSetFocus(var Message: TMessage);
begin
  SearchText := '';
  FHasFocus := True;
  inherited;
  Invalidate;
end;

procedure TComp_Target_DBLookupControl.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  Invalidate;
end;

procedure TComp_Target_DBLookupControl.CMGetDataLink(var Message: TMessage);
begin
  Message.Result := Integer(FDataLink);
end;

function TComp_Target_DBLookupControl.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := inherited ExecuteAction(Action) or (FDataLink <> nil) and
    FDataLink.ExecuteAction(Action);
end;

function TComp_Target_DBLookupControl.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := inherited UpdateAction(Action) or (FDataLink <> nil) and
    FDataLink.UpdateAction(Action);
end;

procedure TComp_Target_DBLookupControl.WMKeyDown(var Message: TWMKeyDown);
begin
  if (Char(Message.CharCode) in ['л','Л','k','K'])
      and
     (KeyDataToShiftState(Message.KeyData) = [ssShift,ssCtrl]) then begin
    Message.CharCode := 0;
    a_ShowKeyColumn := not a_ShowKeyColumn;
    exit;
  end;

  if (FNullValueKey <> 0) and CanModify and (FNullValueKey = ShortCut(Message.CharCode,
     KeyDataToShiftState(Message.KeyData))) then
  begin
    FDataLink.Edit;
    Field.Clear;
    Message.CharCode := 0;
  end;
  inherited;
end;

procedure TComp_Target_DBLookupControl.SetShowKeyColumn(const Value: boolean);
  var
    i : integer;
  begin
    if FShowKeyColumn = Value then exit;
    FShowKeyColumn := Value;

    if not (csDesigning in ComponentState)
      then begin
             FShowKeyColumn := Value;

             {for i := 0 to ListFields.count-1 do
               if AnsiUpperCase(TField(ListFields[i]).FieldName) = AnsiUpperCase(KeyField) then
                 begin
                   if FListFieldIndex > i then
                     if Value
                       then ListFieldIndex := ListFieldIndex + 1
                       else ListFieldIndex := ListFieldIndex - 1;
                   break;
                 end;}

             UpdateListFields;
           end;
  end;



procedure TComp_Target_DBLookupControl.WndProc(var Message: TMessage);
  var
    M : TMessage;
    H : HWND;
    P : TPoint;
  begin
    if Message.Msg = wm_Target_AutoHint then begin
      P.X := Message.wParam;
      P.Y := Message.LParam;
      H := WindowFromPoint(P);
      TWMMouse(M).XPos := P.X;
      TWMMouse(M).YPos := P.Y;
      Application.HintMouseMessage(self,M);
      exit;
    end;

    Inherited WndProc(Message);
  end;

procedure TComp_Target_DBLookupControl.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  VK_SubtractReceived := (Key = vk_Subtract) and (Shift = []);
  VK_DeleteReceived   := (Key = vk_Delete)   and (Shift = []);
  AC_CopyReceived := (Shift = [ssCtrl]) and (Char(Key) in ['C','c','С','с']);
  if AC_CopyReceived then exit;
  inherited;
end;

procedure TComp_Target_DBLookupControl.KeyPress(var Key: Char);
begin
  inherited;
  VK_SubtractReceived := false;
  VK_DeleteReceived   := false;
  AC_CopyReceived := false;
end;

{ TTarget_DBLookupListBox }

constructor TTarget_DBLookupListBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csDoubleClicks];
  Width := 121;
  FBorderStyle := bsSingle;
  RowCount := 20;
end;

procedure TTarget_DBLookupListBox.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
    if FBorderStyle = bsSingle then
      if NewStyleControls and Ctl3D then
        ExStyle := ExStyle or WS_EX_CLIENTEDGE
      else
        Style := Style or WS_BORDER;
end;

procedure TTarget_DBLookupListBox.CreateWnd;
begin
  inherited CreateWnd;
  UpdateScrollBar;
end;

function TTarget_DBLookupListBox.GetKeyIndex: Integer;
var
  FieldValue: Variant;
begin
  if not VarIsNull(FKeyValue) then
    for Result := 0 to FRecordCount - 1 do
    begin
      ListLink.ActiveRecord := Result;
      FieldValue := FKeyField.Value;
      ListLink.ActiveRecord := FRecordIndex;
      if VarEquals(FieldValue, FKeyValue) then Exit;
    end;
  Result := -1;
end;

procedure TTarget_DBLookupListBox.KeyDown(var Key: Word; Shift: TShiftState);
var
  Delta, KeyIndex: Integer;
begin
  inherited KeyDown(Key, Shift);
  if CanModify then
  begin
    Delta := 0;
    case Key of
      VK_UP, VK_LEFT: Delta := -1;
      VK_DOWN, VK_RIGHT: Delta := 1;
      VK_PRIOR: Delta := 1 - FRowCount;
      VK_NEXT: Delta := FRowCount - 1;
      VK_HOME: Delta := -Maxint;
      VK_END: Delta := Maxint;
    end;
    if Delta <> 0 then
    begin
      SearchText := '';
      if Delta = -Maxint then ListLink.DataSet.First else
        if Delta = Maxint then ListLink.DataSet.Last else
        begin
          KeyIndex := GetKeyIndex;
          if KeyIndex >= 0 then
            ListLink.DataSet.MoveBy(KeyIndex - FRecordIndex)
          else
          begin
            KeyValueChanged;
            Delta := 0;
          end;
          ListLink.DataSet.MoveBy(Delta);
        end;
      SelectCurrent;
    end;
  end;
end;

procedure TTarget_DBLookupListBox.KeyPress(var Key: Char);
var
  PrevVk_DeleteReceived, PrevVK_SubtractReceived : boolean;
begin
  PrevVk_DeleteReceived   := Vk_DeleteReceived;
  PrevVk_SubtractReceived := Vk_SubtractReceived;
  inherited KeyPress(Key);
  Vk_DeleteReceived := PrevVk_DeleteReceived;
  Vk_SubtractReceived := PrevVk_SubtractReceived;
  ProcessSearchKey(Key);
  Vk_DeleteReceived := false;
  Vk_SubtractReceived := false;
end;

procedure TTarget_DBLookupListBox.KeyValueChanged;
begin
  if ListActive and not FLockPosition then
    if not LocateKey then ListLink.DataSet.First;
  if FListField <> nil then
    FSelectedItem := FListField.DisplayText else
    FSelectedItem := '';
end;

procedure TTarget_DBLookupListBox.UpdateListFields;
begin
  try
    inherited;
  finally
    if ListActive then KeyValueChanged else ListLinkDataChanged;
  end;
end;

procedure TTarget_DBLookupListBox.ListLinkDataChanged;
begin
  if ListActive then
  begin
    FRecordIndex := ListLink.ActiveRecord;
    FRecordCount := ListLink.RecordCount;
    FKeySelected := not VarIsNull(FKeyValue) or
      not ListLink.DataSet.BOF;
  end else
  begin
    FRecordIndex := 0;
    FRecordCount := 0;
    FKeySelected := False;
  end;
  if HandleAllocated then
  begin
    UpdateScrollBar;
    Invalidate;
  end;
end;

procedure TTarget_DBLookupListBox.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    SearchText := '';
    if not FPopup then
    begin
      SetFocus;
      if not HasFocus then Exit;
    end;
    if CanModify then
      if ssDouble in Shift then
      begin
        if FRecordIndex = Y div GetTextHeight then DblClick;
      end else
      begin
        MouseCapture := True;
        FTracking := True;
        SelectItemAt(X, Y);
      end;
  end;
  inherited MouseDown(Button, Shift, X, Y);
end;

procedure TTarget_DBLookupListBox.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  if FTracking then
  begin
    SelectItemAt(X, Y);
    FMousePos := Y;
    TimerScroll;
  end;
  inherited MouseMove(Shift, X, Y);
end;

procedure TTarget_DBLookupListBox.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  if FTracking then
  begin
    StopTracking;
    SelectItemAt(X, Y);
  end;
  inherited MouseUp(Button, Shift, X, Y);
end;

procedure TTarget_DBLookupListBox.Paint;
var
  I, J, W, X, TextWidth, TextHeight, LastFieldIndex: Integer;
  S: string;
  R: TRect;
  Selected: Boolean;
  Field: TField;
  AAlignment: TAlignment;

  function GetShowWidth (F : TField) : integer;
    begin
      if a_ShrinkFieldsInListWithOneSymbolDisplayWidth and (F.DisplayWidth = 1)
         then Result := 0
         else Result := Field.DisplayWidth * TextWidth + 4;
    end;

begin
  Canvas.Font := Font;
  TextWidth := Canvas.TextWidth('0');
  TextHeight := Canvas.TextHeight('0');
  LastFieldIndex := ListFields.Count - 1;
  if ColorToRGB(Color) <> ColorToRGB(clBtnFace) then
    Canvas.Pen.Color := clBtnFace else
    Canvas.Pen.Color := clBtnShadow;
  for I := 0 to FRowCount - 1 do
  begin
    if Enabled then
      Canvas.Font.Color := Font.Color else
      Canvas.Font.Color := clGrayText;
    Canvas.Brush.Color := Color;
    Selected := not FKeySelected and (I = 0);
    R.Top := I * TextHeight;
    R.Bottom := R.Top + TextHeight;
    if I < FRecordCount then
    begin
      ListLink.ActiveRecord := I;
      if not VarIsNull(FKeyValue) and
        VarEquals(FKeyField.Value, FKeyValue) then
      begin
        Canvas.Font.Color := clHighlightText;
        Canvas.Brush.Color := clHighlight;
        Selected := True;
      end;
      R.Right := 0;
      for J := 0 to LastFieldIndex do
      begin
        Field := ListFields[J];
        if J < LastFieldIndex then
          W := GetShowWidth(Field) else
          W := ClientWidth - R.Right;
        S := Field.DisplayText;
        X := 2;
        AAlignment := Field.Alignment;
        if UseRightToLeftAlignment then ChangeBiDiModeAlignment(AAlignment);
        case AAlignment of
          taRightJustify: X := W - Canvas.TextWidth(S) - 3;
          taCenter: X := (W - Canvas.TextWidth(S)) div 2;
        end;
        R.Left := R.Right;
        R.Right := R.Right + W;
        if SysLocale.MiddleEast then TControlCanvas(Canvas).UpdateTextFlags;
        Canvas.TextRect(R, R.Left + X, R.Top, S);
        if J < LastFieldIndex then
        begin
          Canvas.MoveTo(R.Right, R.Top);
          Canvas.LineTo(R.Right, R.Bottom);
          Inc(R.Right);
          if R.Right >= ClientWidth then Break;
        end;
      end;
    end;
    R.Left := 0;
    R.Right := ClientWidth;
    if I >= FRecordCount then Canvas.FillRect(R);
    if Selected and (HasFocus or FPopup) then
      Canvas.DrawFocusRect(R);
  end;
  if FRecordCount <> 0 then ListLink.ActiveRecord := FRecordIndex;
end;

procedure TTarget_DBLookupListBox.SelectCurrent;
begin
  FLockPosition := True;
  try
    SelectKeyValue(FKeyField.Value);
  finally
    FLockPosition := False;
  end;
end;

procedure TTarget_DBLookupListBox.SelectItemAt(X, Y: Integer);
var
  Delta: Integer;
begin
  if Y < 0 then Y := 0;
  if Y >= ClientHeight then Y := ClientHeight - 1;
  Delta := Y div GetTextHeight - FRecordIndex;
  ListLink.DataSet.MoveBy(Delta);
  SelectCurrent;
end;

procedure TTarget_DBLookupListBox.SetBorderStyle(Value: TBorderStyle);
begin
  if FBorderStyle <> Value then
  begin
    FBorderStyle := Value;
    RecreateWnd;
    RowCount := RowCount;
  end;
end;

procedure TTarget_DBLookupListBox.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
var
  BorderSize, TextHeight, Rows: Integer;
begin
  BorderSize := GetBorderSize;
  TextHeight := GetTextHeight;
  Rows := (AHeight - BorderSize) div TextHeight;
  if Rows < 1 then Rows := 1;
  FRowCount := Rows;
  if ListLink.BufferCount <> Rows then
  begin
    ListLink.BufferCount := Rows;
    ListLinkDataChanged;
  end;
  inherited SetBounds(ALeft, ATop, AWidth, Rows * TextHeight + BorderSize);
end;

function TTarget_DBLookupListBox.UseRightToLeftAlignment: Boolean;
begin
  Result := DBUseRightToLeftAlignment(Self, Field);
end;

procedure TTarget_DBLookupListBox.SetRowCount(Value: Integer);
begin
  if Value < 1 then Value := 1;
  if Value > 100 then Value := 100;
  Height := Value * GetTextHeight + GetBorderSize;
end;

procedure TTarget_DBLookupListBox.StopTimer;
begin
  if FTimerActive then
  begin
    KillTimer(Handle, 1);
    FTimerActive := False;
  end;
end;

procedure TTarget_DBLookupListBox.StopTracking;
begin
  if FTracking then
  begin
    StopTimer;
    FTracking := False;
    MouseCapture := False;
  end;
end;

procedure TTarget_DBLookupListBox.TimerScroll;
var
  Delta, Distance, Interval: Integer;
begin
  Delta := 0;
  Distance := 0;
  if FMousePos < 0 then
  begin
    Delta := -1;
    Distance := -FMousePos;
  end;
  if FMousePos >= ClientHeight then
  begin
    Delta := 1;
    Distance := FMousePos - ClientHeight + 1;
  end;
  if Delta = 0 then StopTimer else
  begin
    if ListLink.DataSet.MoveBy(Delta) <> 0 then SelectCurrent;
    Interval := 200 - Distance * 15;
    if Interval < 0 then Interval := 0;
    SetTimer(Handle, 1, Interval, nil);
    FTimerActive := True;
  end;
end;

procedure TTarget_DBLookupListBox.UpdateScrollBar;
var
  Pos, Max: Integer;
  ScrollInfo: TScrollInfo;
begin
  Pos := 0;
  Max := 0;
  if FRecordCount = FRowCount then
  begin
    Max := 4;
    if not ListLink.DataSet.BOF then
      if not ListLink.DataSet.EOF then Pos := 2 else Pos := 4;
  end;
  ScrollInfo.cbSize := SizeOf(TScrollInfo);
  ScrollInfo.fMask := SIF_POS or SIF_RANGE;
  if not GetScrollInfo(Handle, SB_VERT, ScrollInfo) or
    (ScrollInfo.nPos <> Pos) or (ScrollInfo.nMax <> Max) then
  begin
    ScrollInfo.nMin := 0;
    ScrollInfo.nMax := Max;
    ScrollInfo.nPos := Pos;
    SetScrollInfo(Handle, SB_VERT, ScrollInfo, True);
  end;
end;

procedure TTarget_DBLookupListBox.CMCtl3DChanged(var Message: TMessage);
begin
  if NewStyleControls and (FBorderStyle = bsSingle) then
  begin
    RecreateWnd;
    RowCount := RowCount;
  end;
  inherited;
end;

procedure TTarget_DBLookupListBox.CMFontChanged(var Message: TMessage);
begin
  inherited;
  Height := Height;
end;

procedure TTarget_DBLookupListBox.WMCancelMode(var Message: TMessage);
begin
  StopTracking;
  inherited;
end;

procedure TTarget_DBLookupListBox.WMTimer(var Message: TMessage);
begin
  TimerScroll;
end;

procedure TTarget_DBLookupListBox.WMVScroll(var Message: TWMVScroll);
begin
  SearchText := '';
  if ListLink.DataSet = nil then
    Exit;
  with Message, ListLink.DataSet do
    case ScrollCode of
      SB_LINEUP: MoveBy(-FRecordIndex - 1);
      SB_LINEDOWN: MoveBy(FRecordCount - FRecordIndex);
      SB_PAGEUP: MoveBy(-FRecordIndex - FRecordCount + 1);
      SB_PAGEDOWN: MoveBy(FRecordCount - FRecordIndex + FRecordCount - 2);
      SB_THUMBPOSITION:
        begin
          case Pos of
            0: First;
            1: MoveBy(-FRecordIndex - FRecordCount + 1);
            2: Exit;
            3: MoveBy(FRecordCount - FRecordIndex + FRecordCount - 2);
            4: Last;
          end;
        end;
      SB_BOTTOM: Last;
      SB_TOP: First;
    end;
end;

function TTarget_DBLookupListBox.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := inherited ExecuteAction(Action) or (FDataLink <> nil) and
    FDataLink.ExecuteAction(Action);
end;

function TTarget_DBLookupListBox.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := inherited UpdateAction(Action) or (FDataLink <> nil) and
    FDataLink.UpdateAction(Action);
end;


{ TTarget_PopupDataList }

constructor TTarget_PopupDataList.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csNoDesignVisible, csReplicatable];
  FPopup := True;
end;

procedure TTarget_PopupDataList.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style := WS_POPUP or WS_BORDER;
    ExStyle := WS_EX_TOOLWINDOW;
    AddBiDiModeExStyle(ExStyle);
    WindowClass.Style := CS_SAVEBITS;
  end;
end;

procedure TTarget_PopupDataList.WMMouseActivate(var Message: TMessage);
begin
  Message.Result := MA_NOACTIVATE;
end;

{ TTarget_DBLookupComboBox }

constructor TTarget_DBLookupComboBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csReplicatable];
  Width := 145;
  Height := 0;
  FDataList := TTarget_PopupDataList.Create(Self);
  FDataList.Visible := False;
  FDataList.Parent := Self;
  FDataList.OnMouseUp := ListMouseUp;
  FDataList.Font.Size := Font.Size + a_ListFontSizeMoreThanThatOfCombo;
  FButtonWidth := GetSystemMetrics(SM_CXVSCROLL);
  FDropDownRows := 20;
  Fa_DisableDelete := true;
  PrevListFields := TList.Create;
end;

procedure TTarget_DBLookupComboBox.CloseUp(Accept: Boolean);
var
  ListValue: Variant;
  C : TWinControl;
  F : TForm;
  NewValue : boolean;
  in_Accept : boolean;
begin
  in_Accept := Accept;
    if VarIsNull(FDataList.KeyValue) then Accept := false;
    try
      if ListVisible then begin
        if KeyValueStored then begin
          if not Accept then RestoreKeyValue;
        end;
      end;

      if FListVisible then
        begin
          if GetCapture <> 0 then SendMessage(GetCapture, WM_CANCELMODE, 0, 0);
          if CanFocus
            then SetFocus;
          ListValue := FDataList.KeyValue;
          SetWindowPos(FDataList.Handle, 0, 0, 0, 0, 0, SWP_NOZORDER or
            SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE or SWP_HIDEWINDOW);
          FListVisible := False;
          FDataList.ListSource := nil;
          Invalidate;
          SearchText := '';

          NewValue := not KeyValueStored or (ListValue <> PrevKeyValue);

          if Accept and CanModify and NewValue then SelectKeyValue(ListValue);

          RestoreFilter;
          try
            if Assigned(FOnCloseUp) then FOnCloseUp(Self);

            KeyValueChanged;
          finally
            try
              if not DisableNextTabOnCloseCall
                 and in_Accept then DoTabOnCloseAndSave;
            finally
              DisableNextTabOnCloseCall := false;
            end;
          end;
        end;
    finally
      KeyValueStored := false;
    end;
end;

procedure TTarget_DBLookupComboBox.DoTabOnCloseAndSave;
  var
    F : TForm;
  begin
    if Fa_DoTabOnCloseAndSave then begin
      F := TForm(GetParentForm(self));
      if F <> nil
        then begin
               PostMessage(F.handle,wm_target_tabNext,0,0);
               {C := F.FindNextControl(self,true,true,false);
               if C <> nil then C.SetFocus;}
             end;
    end;
  end;

procedure TTarget_DBLookupComboBox.CMBiDiModeChanged(var Message: TMessage);
begin
  inherited;
  FDataList.BiDiMode := BiDiMode;
end;


procedure TTarget_DBLookupComboBox.CMDialogKey(var Message: TCMDialogKey);
begin
  if (Message.CharCode in [VK_RETURN, VK_ESCAPE]) and FListVisible then
  begin
    CloseUp(Message.CharCode = VK_RETURN);
    Message.Result := 1;
  end else
    inherited;
end;

procedure TTarget_DBLookupComboBox.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
    if NewStyleControls and Ctl3D then
      ExStyle := ExStyle or WS_EX_CLIENTEDGE
    else
      Style := Style or WS_BORDER;
end;

procedure TTarget_DBLookupComboBox.DropDown;
var
  P : TPoint;
  I, Y: Integer;
  S: string;
  ADropDownAlign: TDropDownAlign;
  F : TWinControl;

  {function ParentForm (C : TWinControl): TForm;
    begin
      if C is TForm
        then Result := TForm(C)
        else if (C = nil) then Result := nil
               else Result := ParentForm(C.Parent);
    end;}
var
  k : char;
  aWidth : integer;
begin
    if (fDataField <> nil) and fDatafield.ReadOnly then exit;
    if ReadOnly then exit;

    if Assigned(fOnProcessSearchKey) then begin
      k := #13;
      KeyPress(k);
      exit;
    end;

    if not FListVisible and ListActive then
    begin
      if Assigned(FOnDropDown) then FOnDropDown(Self);
      StoreKeyValue;

      if Fa_FilterOnDropDown <> '' then begin
        try
          ListLink.DataSet.Filter := MergeWithPrevFilter(Fa_FilterOnDropDown,true,ListLink.DataSet.Filter);
          ListLink.DataSet.Filtered := true;
        except
          On e : exception do begin
            ListLink.DataSet.Filter   := PrevFilter;
            ListLink.DataSet.Filtered := PrevFiltered;
            raise;
          end;
        end;
      end;

      FDataList.Color := Color;
      FDataList.Font := Font;
      FDataList.Font.Style := [];
      FDataList.Font.Size  := FDataList.Font.Size + Fa_ListFontSizeMoreThanThatOfCombo;
      FDataList.Font.Color := clWindowText;

      aWidth := max(FDropDownWidth,Width);
      {if FDropDownWidth > 0 then
        aWidth := FDropDownWidth else
        aWidth := Width;
      aWidth := round((FDataList.Font.Size + Fa_ListFontSizeMoreThanThatOfCombo)
                       /FDataList.Font.Size
                       *aWidth);}
      FDataList.Width := aWidth;
      FDataList.ReadOnly := not CanModify;
      //!!!
      if (ListLink.DataSet.RecordCount = 0)
        then FDataList.RowCount := 1
        else if (ListLink.DataSet.RecordCount > 0) and
                (FDropDownRows > (ListLink.DataSet.RecordCount+1))
                 then FDataList.RowCount := (ListLink.DataSet.RecordCount+1)
                 else FDataList.RowCount := FDropDownRows;

      FDataList.KeyField := FKeyFieldName;
      for I := 0 to ListFields.Count - 1 do
        S := S + TField(ListFields[I]).FieldName + ';';
      FDataList.ListField := S;
      FDataList.ListFieldIndex := ListFields.IndexOf(FListField);
      FDataList.ListSource := ListLink.DataSource;
      FDataList.KeyValue := KeyValue;

      //F := ParentForm(self);
      //if F = nil then F := Parent;

      //P := Parent.ClientToScreen(Point(Left, Top));
      if Parent <> nil then begin
        P := Parent.ClientToScreen(Point(left,Top));
      end;

      if P.Y + Height + FDataList.Height > Screen.WorkAreaTop + Screen.WorkAreaHeight
        then Y := P.Y - FDataList.Height
        else Y := P.Y + Height;
      ADropDownAlign := FDropDownAlign;
      { This alignment is for the ListField, not the control }
      if DBUseRightToLeftAlignment(Self, FListField) then
      begin
        if ADropDownAlign = daLeft then
          ADropDownAlign := daRight
        else if ADropDownAlign = daRight then
          ADropDownAlign := daLeft;
      end
      else if P.X  + FDataList.Width > Screen.WorkAreaLeft + Screen.WorkAreaWidth
             then ADropDownAlign := daRight;

      case ADropDownAlign of
        daRight: Dec(P.X, FDataList.Width - Width);
        daCenter: Dec(P.X, (FDataList.Width - Width) div 2);
      end;
      if (P.X + FDataList.Width) > Screen.WorkAreaLeft + Screen.WorkAreaWidth
        then P.X := Screen.WorkAreaLeft + Screen.WorkAreaWidth - FDataList.Width;
      if P.X < Screen.WorkAreaLeft then P.X := Screen.WorkAreaLeft;

      SetWindowPos(FDataList.Handle, HWND_TOP, P.X, Y, 0, 0,
        SWP_NOSIZE or SWP_NOACTIVATE or SWP_SHOWWINDOW);
      FListVisible := True;
      Repaint;
    end;
end;

procedure TTarget_DBLookupComboBox.KeyDown(var Key: Word; Shift: TShiftState);
var
  Delta: Integer;
  Ch   : char;

    procedure DoDelete;
    begin
      if CanModify then SelectKeyValue(Null);
      SetKeyValue(Null);
      if Assigned(OnClick) then OnClick(self);
    end;

    procedure ShowInfo;
      var
        DatasetFilter : string;
      begin
        if (ListSource.DataSet <> nil)
          then DataSetfilter := #13'Фильтр массива данных:'#13+ListSource.DataSet.Filter
          else DataSetfilter := '';
        Application.MessageBox(PChar('Фильтр списка:'#13+a_FilterOnDropDown+DatasetFilter),
                               PChar(Name),
                               MB_OK + MB_ICONINFORMATION);
      end;

begin
  if (Shift = [ssShift,ssAlt,ssCtrl]) and
    (Key in [Ord('I'),ord('i'),ord('Ш'),ord('ш')])
    then begin
           Key := 0;
           if not DisableFunctionalKeys then ShowInfo;
           exit;
         end;

  if (Key = vk_Delete) and not Fa_DisableDelete and not ListVisible
      and ((fDataField = nil) or not fDatafield.ReadOnly) then begin
    if not DisableFunctionalKeys then DoDelete;
    exit;
  end;


  if (Key = VK_ADD) and (Shift = [ssAlt,ssCtrl]) then begin
    if not DisableFunctionalKeys then begin
      DisableKeyPress := true;
      a_AutoHint := true;
      DoEnter;
    end;
    Key := 0;
    exit;
  end;

  inherited KeyDown(Key, Shift);
  if ListActive and ((Key = VK_UP) or (Key = VK_DOWN)) then
    if ssAlt in Shift then
    begin
      if not DisableFunctionalKeys then begin
        if FListVisible then CloseUp(True) else DropDown;
      end;
      Key := 0;
    end else
      if not FListVisible then
      begin
        if not DisableFunctionalKeys then begin
          if not LocateKey then
            ListLink.DataSet.First
          else
          begin
            if Key = VK_UP then Delta := -1 else Delta := 1;
            ListLink.DataSet.MoveBy(Delta);
          end;
          SelectKeyValue(FKeyField.Value);
        end;
        Key := 0;
      end;

  if (Key <> 0) and (Key <> vk_Delete) and FListVisible then begin
    {FDataList.KeyValueStored := KeyValueStored;
    FDataList.PrevKeyValue   := PrevKeyValue;
    FDataList.PrevFilter     := PrevFilter;
    FDataList.PrevFiltered   := PrevFiltered;}
    FDataList.KeyDown(Key, Shift);
  end;

  if (Key = vk_Delete) and FListVisible then begin
    Ch := #8;
    KeyPress(Ch);
  end;
end;

procedure TTarget_DBLookupComboBox.KeyPress(var Key: Char);
var
  lKeyValue : Variant;
  PrevVk_DeleteReceived,
  PrevVk_SubtractReceived : boolean;
begin
  if AC_CopyReceived then begin
    Clipboard.AsText := Trim(Text);
    exit;
  end;
  if DisableKeyPress then begin
    DisableKeyPress := false;
    exit;
  end;
  if (fDataField <> nil) and fDatafield.ReadOnly then begin
    Key := #0;
    exit;
  end;

  if Assigned(fOnProcessSearchKey) then begin
    if Vk_SubtractReceived and (Key = '-') then Key := '=';
    if fOnProcessSearchKey(self,lKeyValue,Key) then begin
       SelectKeyValue(lKeyValue);
       DoTabOnCloseAndSave;
    end;
    exit;
  end;

  PrevVk_DeleteReceived   := Vk_DeleteReceived;
  PrevVk_SubtractReceived := Vk_SubtractReceived;
  inherited KeyPress(Key);
  Vk_DeleteReceived := PrevVk_DeleteReceived;
  Vk_SubtractReceived := PrevVk_SubtractReceived;


  (*!!!
  if FListVisible then

    if Key in [#13, #27] then
      CloseUp(Key = #13)
    else
      FDataList.KeyPress(Key)}
  else
    ProcessSearchKey(Key);
    *)


  if FListVisible then
      if Key in [#13, #27] then
        CloseUp(Key = #13)
      else if Word(Key) in [vk_up, vk_down]
             then FDataList.KeyPress(Key)
             else ProcessSearchKey(Key)
  else if not (Key in [#27]) then ProcessSearchKey(Key);
  Vk_DeleteReceived := false;
  Vk_SubtractReceived := false;

end;

procedure TTarget_DBLookupComboBox.KeyValueChanged;
begin
  if FLookupMode then
  begin
    if Assigned(fOnGetText)
      then FText := fOnGetText(self)
      else FText := FDataField.DisplayText;
    FAlignment := FDataField.Alignment;
  end else
  if ListActive and LocateKey then
  begin
    if Assigned(fOnGetText)
      then FText := fOnGetText(self)
      else FText := FListField.DisplayText;
    FAlignment := FListField.Alignment;
  end else
  begin
    if (FDataField <> nil) or VarIsNull(FText)
      then FText := fa_NullText
      else if Assigned(fOnGetText)
             then FText := fOnGetText(self)
             else if VarIsNull(KeyValue) or (VarIsEmpty(KeyValue))
                     then FText := fa_NullText
                     else FText := VarToStr(KeyValue);
    if FListField <> nil
      then FAlignment := FListField.Alignment
      else FAlignment := taLeftJustify;
  end;
  Invalidate;
end;

procedure TTarget_DBLookupComboBox.UpdateListFields;
var
  i : integer;
  fNeedListFieldIndex : integer;
  KeyColumnAlreadyVisible : boolean;
  //LFN : string;
  KeyValueChangedDone : boolean;
begin
  PrevListFields.Assign(ListFields);

  {if FListField <> nil
    then LFN := FListField.FieldName
    else LFN := '';}

  inherited;

  {if (LFN = '') and (FListField <> nil) then LFN := FListField.FieldName;}

  if not a_ShowKeyColumn
    then begin
           for i := 0 to ListFields.Count-1 do
             if TField(ListFields[i]) = fKeyField then begin
               ListFields.Delete(i);
               break;
             end;
         end;

  {if LFN <> '' then
    for i := 0 to ListFields.Count-1 do
      if TField(ListFields[i]).FieldName = LFN then begin
        //ListFieldIndex := i;
        break;
      end;}

  KeyValueChangedDone := false;
  if PrevListFields.Count <> ListFields.Count
    then begin
           KeyValueChanged;
           KeyValueChangedDone := true;
         end
    else for i := 0 to PrevListFields.Count-1 do
           if PrevListFields[i] <> ListFields[i]
             then begin
                    KeyValueChanged;
                    KeyValueChangedDone := true;
                    break;
                  end;

  if not KeyValueChangedDone then begin
    if FLookupMode then
    begin
      if FDataField <> nil then FAlignment := FDataField.Alignment;
    end else
    if ListActive then
    begin
      if FListField <> nil then FAlignment := FListField.Alignment;
    end else
    begin
      if FListField <> nil
        then FAlignment := FListField.Alignment
        else FAlignment := taLeftJustify;
    end;
  end;
end;

procedure TTarget_DBLookupComboBox.ListMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
    CloseUp(PtInRect(FDataList.ClientRect, Point(X, Y)));
end;

procedure TTarget_DBLookupComboBox.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    SetFocus;
    if not HasFocus then Exit;
    if FListVisible then CloseUp(False) else
      if ListActive then
      begin
        MouseCapture := True;
        FTracking := True;
        TrackButton(X, Y);
        try
          FullFilterDropDown := true;
          DropDown;
        finally
          FullFilterDropDown := false;
        end;
      end;
  end;
  inherited MouseDown(Button, Shift, X, Y);
end;

procedure TTarget_DBLookupComboBox.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  ListPos: TPoint;
  MousePos: TSmallPoint;
begin
  if FTracking then
  begin
    TrackButton(X, Y);
    if FListVisible then
    begin
      ListPos := FDataList.ScreenToClient(ClientToScreen(Point(X, Y)));
      if PtInRect(FDataList.ClientRect, ListPos) then
      begin
        StopTracking;
        MousePos := PointToSmallPoint(ListPos);
        SendMessage(FDataList.Handle, WM_LBUTTONDOWN, 0, Integer(MousePos));
        Exit;
      end;
    end;
  end;
  inherited MouseMove(Shift, X, Y);
end;

procedure TTarget_DBLookupComboBox.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  StopTracking;
  inherited MouseUp(Button, Shift, X, Y);
end;

procedure TTarget_DBLookupComboBox.Paint;
var
  W, X, Flags: Integer;
  Text: string;
  AAlignment: TAlignment;
  Selected: Boolean;
  R: TRect;
begin
  Canvas.Font := Font;
  Canvas.Brush.Color := Color;
  Selected := HasFocus and not FListVisible and
    not (csPaintCopy in ControlState);
  if Enabled then
    Canvas.Font.Color := Font.Color
  else
    Canvas.Font.Color := clGrayText;
  if Selected then
  begin
    Canvas.Font.Color := clHighlightText;
    Canvas.Brush.Color := clHighlight;
  end;
  if (csPaintCopy in ControlState) and (FDataField <> nil) and
    (FDataField.Lookup) then
  begin
    Text := FDataField.DisplayText;
    AAlignment := FDataField.Alignment;
  end else
  begin
    if (csDesigning in ComponentState) and (FDataField = nil) then
      Text := Name else
      Text := FText;
    AAlignment := FAlignment;
  end;
  if UseRightToLeftAlignment then ChangeBiDiModeAlignment(AAlignment);
  W := ClientWidth - FButtonWidth;
  X := 2;
  case AAlignment of
    taRightJustify: X := W - Canvas.TextWidth(Text) - 3;
    taCenter: X := (W - Canvas.TextWidth(Text)) div 2;
  end;
  SetRect(R, 1, 1, W - 1, ClientHeight - 1);
  if (SysLocale.MiddleEast) and (BiDiMode = bdRightToLeft) then
  begin
    Inc(X, FButtonWidth);
    Inc(R.Left, FButtonWidth);
    R.Right := ClientWidth;
  end;
  if SysLocale.MiddleEast then TControlCanvas(Canvas).UpdateTextFlags;
  Canvas.TextRect(R, X, 2, Text);
  if Selected then Canvas.DrawFocusRect(R);
  SetRect(R, W, 0, ClientWidth, ClientHeight);
  if (SysLocale.MiddleEast) and (BiDiMode = bdRightToLeft) then
  begin
    R.Left := 0;
    R.Right:= FButtonWidth;
  end;
  if not (ListActive and Enabled) then
    Flags := DFCS_SCROLLCOMBOBOX or DFCS_INACTIVE
  else if FPressed then
    Flags := DFCS_SCROLLCOMBOBOX or DFCS_FLAT or DFCS_PUSHED
  else
    Flags := DFCS_SCROLLCOMBOBOX;
  DrawFrameControl(Canvas.Handle, R, DFC_SCROLL, Flags);
end;

procedure TTarget_DBLookupComboBox.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited SetBounds(ALeft, ATop, AWidth, GetTextHeight + GetBorderSize + 4);
end;

function TTarget_DBLookupComboBox.UseRightToLeftAlignment: Boolean;
begin
  Result := DBUseRightToLeftAlignment(Self, Field);
end;

procedure TTarget_DBLookupComboBox.StopTracking;
begin
  if FTracking then
  begin
    TrackButton(-1, -1);
    FTracking := False;
    MouseCapture := False;
  end;
end;

procedure TTarget_DBLookupComboBox.TrackButton(X, Y: Integer);
var
  NewState: Boolean;
begin
  NewState := PtInRect(Rect(ClientWidth - FButtonWidth, 0, ClientWidth,
    ClientHeight), Point(X, Y));
  if FPressed <> NewState then
  begin
    FPressed := NewState;
    Repaint;
  end;
end;

procedure TTarget_DBLookupComboBox.CMCancelMode(var Message: TCMCancelMode);
begin
  if (Message.Sender <> Self) and (Message.Sender <> FDataList) then
    CloseUp(False);
end;

procedure TTarget_DBLookupComboBox.CMCtl3DChanged(var Message: TMessage);
begin
  if NewStyleControls then
  begin
    RecreateWnd;
    Height := 0;
  end;
  inherited;
end;

procedure TTarget_DBLookupComboBox.CMFontChanged(var Message: TMessage);
begin
  inherited;
  Height := 0;
end;

procedure TTarget_DBLookupComboBox.CMGetDataLink(var Message: TMessage);
begin
  Message.Result := Integer(FDataLink);
end;

procedure TTarget_DBLookupComboBox.WMCancelMode(var Message: TMessage);
begin
  StopTracking;
  inherited;
end;

procedure TTarget_DBLookupComboBox.WMKillFocus(var Message: TWMKillFocus);
begin
  inherited;
  CloseUp(False);
end;

function TTarget_DBLookupComboBox.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := inherited ExecuteAction(Action) or (FDataLink <> nil) and
    FDataLink.ExecuteAction(Action);
end;

function TTarget_DBLookupComboBox.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := inherited UpdateAction(Action) or (FDataLink <> nil) and
    FDataLink.UpdateAction(Action);
end;


procedure TTarget_DBLookupComboBox.ProcessSearchKey(Key: Char);
  var
    PrevDataFieldOnChange : TFieldNotifyEvent;
  begin
    try
      if fDataField <> nil then begin
        PrevDataFieldOnChange := fDataField.OnChange;
        fDataField.OnChange   := nil;
      end;
      if ListActive then begin
        try
          FullFilterDropDown := key = #13;
          DropDown;
        finally
          FullFilterDropDown := false;
        end;
      end;
      inherited;
      if not (a_NoFilterOnProcessSearchKey)
         and (FListField <> nil) and (FListField.FieldKind in [fkData, fkInternalCalc]) and
             (FListField.DataType in [ftString, ftWideString])
        then FText := SearchText;
      if ListActive then begin
        fDataList.Repaint;
        fDataList.KeyValue := fKeyField.Value;


        {if (ListLink.DataSet.RecordCount = 0)
          then FDataList.RowCount := 5
          else if (FDropDownRows > ListLink.DataSet.RecordCount)
                  then FDataList.RowCount := Max(5,ListLink.DataSet.RecordCount)
                  else FDataList.RowCount := FDropDownRows;}
      end;

      Repaint;
    finally
      if fDataField <> nil then begin
        fDataField.OnChange   := PrevDataFieldOnChange;
      end;
    end;
  end;

procedure TTarget_DBLookupComboBox.SetShowKeyColumn(const Value: boolean);
  var
    lListVisible : boolean;
  begin
    if ListVisible then exit;
    lListVisible := FListVisible;
    if lListVisible then begin
      CloseUp(false);
    end;
    inherited;
    if lListVisible then begin
      DropDown;
    end;
  end;
procedure TTarget_DBLookupComboBox.Seta_DisableDelete(const Value: boolean);
begin
  Fa_DisableDelete := Value;
end;

procedure TTarget_DBLookupComboBox.DoAutoHint;
  var
    M : TMessage;
    H : HWND;
    AutoHintPost : TPoint;
  begin
    if a_AutoHint then begin
      (*GetCursorPos(P);
      P := ScreenToClient(P);
      if not PtInRect(ClientRect,P) then begin
        P := ClientToScreen(Point(ClientWidth-1,ClientHeight-1));
        SetCursorPos(P.X,P.Y);
      end;
      //Application.ActivateHint(P);*)
      AutoHintPost := ClientToScreen(Point(ClientWidth-1,ClientHeight-1));
      SetCursorPos(AutoHintPost.X,AutoHintPost.Y);
      NeedAutoHint := true;
      //PostMessage(Handle,wm_Target_AutoHint,P.X,P.Y);
    end;
  end;

procedure TTarget_DBLookupComboBox.DoEnter;
  begin
    inherited;
    DoAutoHint;
  end;

procedure TTarget_DBLookupComboBox.DoExit;
begin
  inherited;
  if a_AutoHint then begin
    //Application.HintPause     := HintPause;
    //Application.HintHidePause := HintHidePause;
  end;
end;

procedure TTarget_DBLookupComboBox.WMKeyDown(var Message: TWMKeyDown);
  begin
    if (Char(Message.CharCode) in ['р','Р','h','H'])
        and
       (KeyDataToShiftState(Message.KeyData) = [ssShift,ssCtrl]) then begin
      DisableKeyPress := true;
      Message.CharCode := 0;
      DoAutoHint;
      exit;
    end;
    Inherited;
  end;

procedure TTarget_DBLookupComboBox.DoKeyValueChanged;
  begin
    KeyValueChanged;
  end;

procedure TTarget_DBLookupComboBox.KeyUp(var Key: Word;Shift: TShiftState);
  begin
    inherited;
    if NeedAutoHint then begin
      PostMessage(Handle,wm_Target_AutoHint,AutoHintPos.X,AutoHintPos.Y);
    end;
  end;

destructor TTarget_DBLookupComboBox.Destroy;
  begin
    PrevListFields.Free;
    inherited;
  end;

procedure TTarget_DBLookupComboBox.Seta_ListFontSizeMoreThanThatOfCombo(const Value: integer);
begin
  Fa_ListFontSizeMoreThanThatOfCombo := Value;
  if FDataList <> nil then begin
    FDataList.Font.Size := Font.Size + Fa_ListFontSizeMoreThanThatOfCombo;
  end;
end;

{procedure TTarget_DBLookupComboBox.SetFont(const aFont: TFont);
begin
  inherited;
  a_ListFontSizeMoreThanThatOfCombo := a_ListFontSizeMoreThanThatOfCombo;
end;}

procedure TTarget_DBLookupComboBox.Seta_ShrinkFieldsInListWithOneSymbolDisplayWidth(
  const Value: boolean);
begin
  Fa_ShrinkFieldsInListWithOneSymbolDisplayWidth := Value;
  FDataList.a_ShrinkFieldsInListWithOneSymbolDisplayWidth := Value;
end;

procedure TTarget_DBLookupComboBox.SetA_NullText(const Value: string);
  begin
    fa_NullText := Value;
    if VarIsNull(KeyValue)
      then KeyValueChanged;
  end;

initialization
  wm_target_tabNext  := RegisterWindowMessage('wm_target_tabNext');
  wm_target_AutoHint := RegisterWindowMessage('wm_target_AutoHint');
end.




