unit citDBCtrls;

{$R-}

interface

uses Windows, SysUtils, Messages, Classes, Controls, Forms,
     Graphics, Menus, citCtrls, ExtCtrls, Buttons, ComCtrls, Db, citMask, Variants;

type

{ TFieldDataLink }

  TFieldDataLink = class(TDataLink)
  private
    FField: TField;
    FFieldName: string;
    FControl: TComponent;
    FEditing: Boolean;
    FModified: Boolean;
    FOnDataChange: TNotifyEvent;
    FOnEditingChange: TNotifyEvent;
    FOnUpdateData: TNotifyEvent;
    FOnActiveChange: TNotifyEvent;
    function GetCanModify: Boolean;
    procedure SetEditing(Value: Boolean);
    procedure SetField(Value: TField);
    procedure SetFieldName(const Value: string);
    procedure UpdateField;
  protected
    procedure ActiveChanged; override;
    procedure EditingChanged; override;
    procedure FocusControl(Field: TFieldRef); override;
    procedure LayoutChanged; override;
    procedure RecordChanged(Field: TField); override;
    procedure UpdateData; override;
  public
    function Edit: Boolean;
    procedure Modified;
    procedure Reset;
    property CanModify: Boolean read GetCanModify;
    property Control: TComponent read FControl write FControl;
    property Editing: Boolean read FEditing;
    property Field: TField read FField;
    property FieldName: string read FFieldName write SetFieldName;
    property OnDataChange: TNotifyEvent read FOnDataChange write FOnDataChange;
    property OnEditingChange: TNotifyEvent read FOnEditingChange write FOnEditingChange;
    property OnUpdateData: TNotifyEvent read FOnUpdateData write FOnUpdateData;
    property OnActiveChange: TNotifyEvent read FOnActiveChange write FOnActiveChange;
  end;

{ TPaintControl }

  TPaintControl = class
  private
    FOwner: TWinControl;
    FClassName: string;
    FHandle: HWnd;
    FObjectInstance: Pointer;
    FDefWindowProc: Pointer;
    FCtl3dButton: Boolean;
    function GetHandle: HWnd;
    procedure SetCtl3DButton(Value: Boolean);
    procedure WndProc(var Message: TMessage);
  public
    constructor Create(AOwner: TWinControl; const ClassName: string);
    destructor Destroy; override;
    procedure DestroyHandle;
    property Ctl3DButton: Boolean read FCtl3dButton write SetCtl3dButton;
    property Handle: HWnd read GetHandle;
  end;

{ TcitDBEdit }

  TcitDBEdit = class(TcitCustomMaskEdit)
  private
    FCanvas : TControlCanvas;
    FAlignment : TAlignment;
    FFocused : boolean;
    FDontPushIfDisabled : boolean;
    procedure DataChange(Sender: TObject);
    procedure EditingChange(Sender: TObject);
    function GetDataField: string;
    function GetDataSource: TDataSource;
    function GetField: TField;
    function GetReadOnly: Boolean;
    function GetTextMargins: TPoint;
    procedure SetDataField(const Value: string);
    procedure SetDataSource(Value: TDataSource);
    procedure SetFocused(Value: Boolean);
    procedure SetReadOnly(Value: Boolean);
    procedure UpdateData(Sender: TObject);
    procedure WMCut(var Message: TMessage); message WM_CUT;
    procedure WMPaste(var Message: TMessage); message WM_PASTE;
    procedure CMEnter(var Message: TCMEnter); message CM_ENTER;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
    procedure ButtonPushed(Sender : TObject); override;
  protected
    FDataLink: TFieldDataLink;
    procedure Change; override;
    function EditCanModify: Boolean; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    procedure Reset; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Field: TField read GetField;
  published
    property AutoSelect;
    property AutoSize;
    property BorderStyle;
    property CharCase;
    property Color;
    property Ctl3D;
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property DontPushIfDisabled : boolean read FDontPushIfDisabled
                                          write FDontPushIfDisabled;
    property DragCursor;
    property DragMode;
    property EditMask;
    property Enabled;
    property Font;
    property OwnesLButton;
    property OwnesLLabel;
    property HideSelection;
    property ImeMode;
    property ImeName;
    property LBtnAlignment;
    property LBtnFlat;
    property LBtnCaption;
    property LBtnDown;
    property LBtnGroupIndex;
    property LBtnAllowAllUp;
    property LBtnGlyph stored IsStored;
    property LBtnGlyphKind;
    property LBtnNumGlyphs;
    property LBtnShortCut1;
    property LBtnShortCut2;
    property LBtnWidth;
    property LLblAlignment;
    property LLblCaption;
    property LLblWidth;
    property LLblFont;
    property LLblRequiredFont;
    property Required;
    property MaxLength;
    property OEMConvert;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PasswordChar;
    property PopupMenu;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Text;
    property Visible;
    property OnChange;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnPushButton;
    property OnStartDrag;
    property Variant1;
    property Variant2;
  end;

{ TDBText }

  TDBText = class(TcitCustomLabel)
  private
    FDataLink: TFieldDataLink;
    procedure DataChange(Sender: TObject);
    function GetDataField: string;
    function GetDataSource: TDataSource;
    function GetField: TField;
    function GetFieldText: string;
    procedure SetDataField(const Value: string);
    procedure SetDataSource(Value: TDataSource);
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
  protected
    function GetLabelText: string; override;
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    procedure SetAutoSize(Value: Boolean); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Field: TField read GetField;
  published
    property Align;
    property Alignment;
    property AutoSize default False;
    property Color;
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property Transparent;
    property ShowHint;
    property Visible;
    property WordWrap;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
  end;

{ TDBCheckBox }

  TDBCheckBox = class(TcitCustomCheckBox)
  private
    FDataLink: TFieldDataLink;
    FValueCheck: string;
    FValueUncheck: string;
    FPaintControl: TPaintControl;
    procedure DataChange(Sender: TObject);
    function GetDataField: string;
    function GetDataSource: TDataSource;
    function GetField: TField;
    function GetFieldState: TCheckBoxState;
    function GetReadOnly: Boolean;
    procedure SetDataField(const Value: string);
    procedure SetDataSource(Value: TDataSource);
    procedure SetReadOnly(Value: Boolean);
    procedure SetValueCheck(const Value: string);
    procedure SetValueUncheck(const Value: string);
    procedure UpdateData(Sender: TObject);
    function ValueMatch(const ValueList, Value: string): Boolean;
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
  protected
    procedure Toggle; override;
    procedure KeyPress(var Key: Char); override;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    procedure WndProc(var Message: TMessage); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Checked;
    property Field: TField read GetField;
    property State;
  published
    property Alignment;
    property AllowGrayed;
    property Caption;
    property Color;
    property Ctl3D;
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property ValueChecked: string read FValueCheck write SetValueCheck;
    property ValueUnchecked: string read FValueUncheck write SetValueUncheck;
    property Visible;
    property OnClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
  end;

{ TDBComboBox }

  TDBComboBox = class(TcitCustomComboBox)
  private
    FDataLink: TFieldDataLink;
    FPaintControl: TPaintControl;
    procedure DataChange(Sender: TObject);
    procedure EditingChange(Sender: TObject);
    function GetComboText: string;
    function GetDataField: string;
    function GetDataSource: TDataSource;
    function GetField: TField;
    function GetReadOnly: Boolean;
    procedure SetComboText(const Value: string);
    procedure SetDataField(const Value: string);
    procedure SetDataSource(Value: TDataSource);
    procedure SetEditReadOnly;
    procedure SetItems(Value: TStrings);
    procedure SetReadOnly(Value: Boolean);
    procedure UpdateData(Sender: TObject);
    procedure CMEnter(var Message: TCMEnter); message CM_ENTER;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
  protected
    procedure Change; override;
    procedure Click; override;
    procedure ComboWndProc(var Message: TMessage; ComboWnd: HWnd;
      ComboProc: Pointer); override;
    procedure CreateWnd; override;
    procedure DropDown; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    procedure SetStyle(Value: TComboboxStyle); override;
    procedure WndProc(var Message: TMessage); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Field: TField read GetField;
    property Text;
  published
    property Style; {Must be published before Items}
    property Color;
    property Ctl3D;
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property DragMode;
    property DragCursor;
    property DropDownCount;
    property Enabled;
    property Font;
    property ImeMode;
    property ImeName;
    property ItemHeight;
    property Items write SetItems;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
    property ShowHint;
    property Sorted;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnChange;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnDrawItem;
    property OnDropDown;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMeasureItem;
    property OnStartDrag;
  end;

{ TDBListBox }

  TDBListBox = class(TcitCustomListBox)
  private
    FDataLink: TFieldDataLink;
    procedure DataChange(Sender: TObject);
    procedure UpdateData(Sender: TObject);
    function GetDataField: string;
    function GetDataSource: TDataSource;
    function GetField: TField;
    function GetReadOnly: Boolean;
    procedure SetDataField(const Value: string);
    procedure SetDataSource(Value: TDataSource);
    procedure SetReadOnly(Value: Boolean);
    procedure SetItems(Value: TStrings);
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
  protected
    procedure Click; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Field: TField read GetField;
  published
    property Align;
    property BorderStyle;
    property Color;
    property Ctl3D default True;
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property ImeMode;
    property ImeName;
    property IntegralHeight;
    property ItemHeight;
    property Items write SetItems;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
    property ShowHint;
    property Style;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnDrawItem;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMeasureItem;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
  end;

{ TDBRadioGroup }

  TDBRadioGroup = class(TCustomRadioGroup)
  private
    FDataLink: TFieldDataLink;
    FValue: string;
    FValues: TStrings;
    FInSetValue: Boolean;
    FOnChange: TNotifyEvent;
    procedure DataChange(Sender: TObject);
    procedure UpdateData(Sender: TObject);
    function GetDataField: string;
    function GetDataSource: TDataSource;
    function GetField: TField;
    function GetReadOnly: Boolean;
    function GetButtonValue(Index: Integer): string;
    procedure SetDataField(const Value: string);
    procedure SetDataSource(Value: TDataSource);
    procedure SetReadOnly(Value: Boolean);
    procedure SetValue(const Value: string);
    procedure SetItems(Value: TStrings);
    procedure SetValues(Value: TStrings);
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
  protected
    procedure Change; dynamic;
    procedure Click; override;
    procedure KeyPress(var Key: Char); override;
    function CanModify: Boolean; override;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    property DataLink: TFieldDataLink read FDataLink;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Field: TField read GetField;
    property ItemIndex;
    property Value: string read FValue write SetValue;
  published
    property Align;
    property Caption;
    property Color;
    property Columns;
    property Ctl3D;
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property Items write SetItems;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Values: TStrings read FValues write SetValues;
    property Visible;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnStartDrag;
  end;

{ TDBMemo }

  TDBMemo = class(TcitCustomMemo)
  private
    FDataLink: TFieldDataLink;
    FAutoDisplay: Boolean;
    FFocused: Boolean;
    FMemoLoaded: Boolean;
    FPaintControl: TPaintControl;
    procedure DataChange(Sender: TObject);
    procedure EditingChange(Sender: TObject);
    function GetDataField: string;
    function GetDataSource: TDataSource;
    function GetField: TField;
    function GetReadOnly: Boolean;
    procedure SetDataField(const Value: string);
    procedure SetDataSource(Value: TDataSource);
    procedure SetReadOnly(Value: Boolean);
    procedure SetAutoDisplay(Value: Boolean);
    procedure SetFocused(Value: Boolean);
    procedure UpdateData(Sender: TObject);
    procedure WMCut(var Message: TMessage); message WM_CUT;
    procedure WMPaste(var Message: TMessage); message WM_PASTE;
    procedure CMEnter(var Message: TCMEnter); message CM_ENTER;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
    procedure WMLButtonDblClk(var Message: TWMLButtonDblClk); message WM_LBUTTONDBLCLK;
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
  protected
    procedure Change; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    procedure WndProc(var Message: TMessage); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure LoadMemo;
    property Field: TField read GetField;
  published
    property Align;
    property Alignment;
    property AutoDisplay: Boolean read FAutoDisplay write SetAutoDisplay default True;
    property BorderStyle;
    property Color;
    property Ctl3D;
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property ImeMode;
    property ImeName;
    property MaxLength;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
    property ScrollBars;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property WantTabs;
    property WordWrap;
    property OnChange;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
  end;

{ TDBImage }

  TDBImage = class(TCustomControl)
  private
    FDataLink: TFieldDataLink;
    FPicture: TPicture;
    FBorderStyle: TBorderStyle;
    FAutoDisplay: Boolean;
    FStretch: Boolean;
    FCenter: Boolean;
    FPictureLoaded: Boolean;
    FQuickDraw: Boolean;
    procedure DataChange(Sender: TObject);
    function GetDataField: string;
    function GetDataSource: TDataSource;
    function GetField: TField;
    function GetReadOnly: Boolean;
    procedure PictureChanged(Sender: TObject);
    procedure SetAutoDisplay(Value: Boolean);
    procedure SetBorderStyle(Value: TBorderStyle);
    procedure SetCenter(Value: Boolean);
    procedure SetDataField(const Value: string);
    procedure SetDataSource(Value: TDataSource);
    procedure SetPicture(Value: TPicture);
    procedure SetReadOnly(Value: Boolean);
    procedure SetStretch(Value: Boolean);
    procedure UpdateData(Sender: TObject);
    procedure CMEnter(var Message: TCMEnter); message CM_ENTER;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure WMLButtonDblClk(var Message: TWMLButtonDblClk); message WM_LBUTTONDBLCLK;
    procedure WMCut(var Message: TMessage); message WM_CUT;
    procedure WMCopy(var Message: TMessage); message WM_COPY;
    procedure WMPaste(var Message: TMessage); message WM_PASTE;
    procedure WMSize(var Message: TMessage); message WM_SIZE;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    function GetPalette: HPALETTE; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure CopyToClipboard;
    procedure CutToClipboard;
    procedure LoadPicture;
    procedure PasteFromClipboard;
    property Field: TField read GetField;
    property Picture: TPicture read FPicture write SetPicture;
  published
    property Align;
    property AutoDisplay: Boolean read FAutoDisplay write SetAutoDisplay default True;
    property BorderStyle: TBorderStyle read FBorderStyle write SetBorderStyle default bsSingle;
    property Center: Boolean read FCenter write SetCenter default True;
    property Color;
    property Ctl3D;
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property ParentColor default False;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
    property QuickDraw: Boolean read FQuickDraw write FQuickDraw default True;
    property ShowHint;
    property Stretch: Boolean read FStretch write SetStretch default False;
    property TabOrder;
    property TabStop default True;
    property Visible;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
  end;

const
  InitRepeatPause = 400;  { pause before repeat timer (ms) }
  RepeatPause     = 100;  { pause before hint window displays (ms)}
  SpaceSize       =  5;   { size of space between special buttons }

type
//  TNavButton = class;
//  TNavDataLink = class;

  TNavGlyph = (ngEnabled, ngDisabled);
  TNavigateBtn = (nbFirst, nbPrior, nbNext, nbLast,
                  nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh);
  TButtonSet = set of TNavigateBtn;
//  TNavButtonStyle = set of (nsAllowTimer, nsFocusRect);

  ENavClick = procedure (Sender: TObject; Button: TNavigateBtn) of object;

{ TDBNavigator }

{  TDBNavigator = class (TCustomPanel)
  private
    FDataLink: TNavDataLink;
    FVisibleButtons: TButtonSet;
    FHints: TStrings;
    ButtonWidth: Integer;
    MinBtnSize: TPoint;
    FOnNavClick: ENavClick;
    FBeforeAction: ENavClick;
    FocusedButton: TNavigateBtn;
    FConfirmDelete: Boolean;
    FFlat: Boolean;
    procedure ClickHandler(Sender: TObject);
    function GetDataSource: TDataSource;
    procedure SetDataSource(Value: TDataSource);
    procedure InitButtons;
    procedure InitHints;
    procedure BtnMouseDown (Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SetVisible(Value: TButtonSet);
    procedure AdjustSize (var W: Integer; var H: Integer);
    procedure HintsChanged(Sender: TObject);
    procedure SetHints(Value: TStrings);
    procedure SetFlat(Value: Boolean);
    procedure WMSize(var Message: TWMSize);  message WM_SIZE;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KILLFOCUS;
    procedure WMGetDlgCode(var Message: TWMGetDlgCode); message WM_GETDLGCODE;
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
  protected
    Buttons: array[TNavigateBtn] of TNavButton;
    procedure DataChanged;
    procedure EditingChanged;
    procedure ActiveChanged;
    procedure Loaded; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
    procedure BtnClick(Index: TNavigateBtn);
  published
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property VisibleButtons: TButtonSet read FVisibleButtons write SetVisible
      default [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete,
        nbEdit, nbPost, nbCancel, nbRefresh];
    property Align;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Flat: Boolean read FFlat write SetFlat default False;
    property Ctl3D;
    property Hints: TStrings read FHints write SetHints;
    property ParentCtl3D;
    property ParentShowHint;
    property PopupMenu;
    property ConfirmDelete: Boolean read FConfirmDelete write FConfirmDelete default True;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property BeforeAction: ENavClick read FBeforeAction write FBeforeAction;
    property OnClick: ENavClick read FOnNavClick write FOnNavClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnResize;
    property OnStartDrag;
  end;
}
{ TNavButton }
(*
  TNavButton = class(TSpeedButton)
  private
    FIndex: TNavigateBtn;
    FNavStyle: TNavButtonStyle;
    FRepeatTimer: TTimer;
    procedure TimerExpired(Sender: TObject);
  protected
    procedure Paint; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
  public
    destructor Destroy; override;
    property NavStyle: TNavButtonStyle read FNavStyle write FNavStyle;
    property Index : TNavigateBtn read FIndex write FIndex;
  end;
*)
{ TNavDataLink }

{  TNavDataLink = class(TDataLink)
  private
    FNavigator: TDBNavigator;
  protected
    procedure EditingChanged; override;
    procedure DataSetChanged; override;
    procedure ActiveChanged; override;
  public
    constructor Create(ANav: TDBNavigator);
    destructor Destroy; override;
  end;
}
{ TDBLookupControl }

  TDBLookupControl = class;

  TDataSourceLink = class(TDataLink)
  private
    FDBLookupControl: TDBLookupControl;
  protected
    procedure FocusControl(Field: TFieldRef); override;
    procedure ActiveChanged; override;
    procedure RecordChanged(Field: TField); override;
  end;

  TListSourceLink = class(TDataLink)
  private
    FDBLookupControl: TDBLookupControl;
  protected
    procedure ActiveChanged; override;
    procedure DataSetChanged; override;
  end;

  TDBLookupControl = class(TCustomControl)
  private
    FLookupSource: TDataSource;
    FDataLink: TDataSourceLink;
    FListLink: TListSourceLink;
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
    FFocused: Boolean;
    function CanModify: Boolean;
    procedure CheckNotCircular;
    procedure CheckNotLookup;
    procedure DataLinkActiveChanged;
    procedure DataLinkRecordChanged(Field: TField);
    function GetBorderSize: Integer;
    function GetDataSource: TDataSource;
    function GetKeyFieldName: string;
    function GetListSource: TDataSource;
    function GetReadOnly: Boolean;
    function GetTextHeight: Integer;
    procedure KeyValueChanged; virtual;
    procedure ListLinkActiveChanged; virtual;
    procedure ListLinkDataChanged; virtual;
    function LocateKey: Boolean;
    procedure ProcessSearchKey(Key: Char);
    procedure SelectKeyValue(const Value: Variant);
    procedure SetDataFieldName(const Value: string);
    procedure SetDataSource(Value: TDataSource);
    procedure SetKeyFieldName(const Value: string);
    procedure SetKeyValue(const Value: Variant);
    procedure SetListFieldName(const Value: string);
    procedure SetListSource(Value: TDataSource);
    procedure SetLookupMode(Value: Boolean);
    procedure SetReadOnly(Value: Boolean);
    procedure WMGetDlgCode(var Message: TMessage); message WM_GETDLGCODE;
    procedure WMKillFocus(var Message: TMessage); message WM_KILLFOCUS;
    procedure WMSetFocus(var Message: TMessage); message WM_SETFOCUS;
  protected
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    property DataField: string read FDataFieldName write SetDataFieldName;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property KeyField: string read GetKeyFieldName write SetKeyFieldName;
    property KeyValue: Variant read FKeyValue write SetKeyValue;
    property ListField: string read FListFieldName write SetListFieldName;
    property ListFieldIndex: Integer read FListFieldIndex write FListFieldIndex default 0;
    property ListSource: TDataSource read GetListSource write SetListSource;
    property ParentColor default False;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
    property TabStop default True;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Field: TField read FDataField;
  end;

{ TDBLookupListBox }

  TDBLookupListBox = class(TDBLookupControl)
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
    procedure KeyValueChanged; override;
    procedure ListLinkActiveChanged; override;
    procedure ListLinkDataChanged; override;
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
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure Paint; override;
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
  public
    constructor Create(AOwner: TComponent); override;
    property KeyValue;
    property SelectedItem: string read FSelectedItem;
  published
    property Align;
    property BorderStyle: TBorderStyle read FBorderStyle write SetBorderStyle default bsSingle;
    property Color;
    property Ctl3D;
    property DataField;
    property DataSource;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property ImeMode;
    property ImeName;
    property KeyField;
    property ListField;
    property ListFieldIndex;
    property ListSource;
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
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
  end;

{ TDBLookupComboBox }

  TPopupDataList = class(TDBLookupListBox)
  private
    procedure WMMouseActivate(var Message: TMessage); message WM_MOUSEACTIVATE;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TDropDownAlign = (daLeft, daRight, daCenter);

  TDBLookupComboBox = class(TDBLookupControl)
  private
    FDataList: TPopupDataList;
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
    procedure KeyValueChanged; override;
    procedure ListLinkActiveChanged; override;
    procedure ListMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure StopTracking;
    procedure TrackButton(X, Y: Integer);
    procedure CMCancelMode(var Message: TCMCancelMode); message CM_CANCELMODE;
    procedure CMCtl3DChanged(var Message: TMessage); message CM_CTL3DCHANGED;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
    procedure WMCancelMode(var Message: TMessage); message WM_CANCELMODE;
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KILLFOCUS;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure Paint; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure CloseUp(Accept: Boolean);
    procedure DropDown;
    property KeyValue;
    property ListVisible: Boolean read FListVisible;
    property Text: string read FText;
  published
    property Color;
    property Ctl3D;
    property DataField;
    property DataSource;
    property DragCursor;
    property DragMode;
    property DropDownAlign: TDropDownAlign read FDropDownAlign write FDropDownAlign default daLeft;
    property DropDownRows: Integer read FDropDownRows write FDropDownRows default 7;
    property DropDownWidth: Integer read FDropDownWidth write FDropDownWidth default 0;
    property Enabled;
    property Font;
    property ImeMode;
    property ImeName;
    property KeyField;
    property ListField;
    property ListFieldIndex;
    property ListSource;
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
    property OnDragDrop;
    property OnDragOver;
    property OnDropDown: TNotifyEvent read FOnDropDown write FOnDropDown;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
  end;

{ TDBRichEdit }

  TDBRichEdit = class(TCustomRichEdit)
  private
    FDataLink: TFieldDataLink;
    FAutoDisplay: Boolean;
    FFocused: Boolean;
    FMemoLoaded: Boolean;
    FDataSave: string;
    procedure BeginEditing;
    procedure DataChange(Sender: TObject);
    procedure EditingChange(Sender: TObject);
    function GetDataField: string;
    function GetDataSource: TDataSource;
    function GetField: TField;
    function GetReadOnly: Boolean;
    procedure SetDataField(const Value: string);
    procedure SetDataSource(Value: TDataSource);
    procedure SetReadOnly(Value: Boolean);
    procedure SetAutoDisplay(Value: Boolean);
    procedure SetFocused(Value: Boolean);
    procedure UpdateData(Sender: TObject);
    procedure WMCut(var Message: TMessage); message WM_CUT;
    procedure WMPaste(var Message: TMessage); message WM_PASTE;
    procedure CMEnter(var Message: TCMEnter); message CM_ENTER;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
    procedure WMLButtonDblClk(var Message: TWMLButtonDblClk); message WM_LBUTTONDBLCLK;
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
  protected
    procedure Change; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure LoadMemo;
    property Field: TField read GetField;
  published
    property Align;
    property Alignment;
    property AutoDisplay: Boolean read FAutoDisplay write SetAutoDisplay default True;
    property BorderStyle;
    property Color;
    property Ctl3D;
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property HideSelection;
    property HideScrollBars;
    property ImeMode;
    property ImeName;
    property MaxLength;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PlainText;
    property PopupMenu;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
    property ScrollBars;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property WantReturns;
    property WantTabs;
    property WordWrap;
    property OnChange;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnResizeRequest;
    property OnSelectionChange;
    property OnProtectChange;
    property OnSaveClipboard;
    property OnStartDrag;
  end;

implementation

uses Clipbrd, DBConsts, Dialogs;

//{$R DBCTRLS}

{ TFieldDataLink }

procedure TFieldDataLink.SetEditing(Value: Boolean);
begin
  if FEditing <> Value then
  begin
    FEditing := Value;
    FModified := False;
    if Assigned(FOnEditingChange) then FOnEditingChange(Self);
  end;
end;

procedure TFieldDataLink.SetFieldName(const Value: string);
begin
  if FFieldName <> Value then
  begin
    FFieldName :=  Value;
    UpdateField;
  end;
end;

procedure TFieldDataLink.SetField(Value: TField);
begin
  if FField <> Value then
  begin
    FField := Value;
    EditingChanged;
    RecordChanged(nil);
  end;
end;

procedure TFieldDataLink.UpdateField;
begin
  SetField(nil);
  if Active and (FFieldName <> '') then
  begin
    if Assigned(FControl) then
      SetField(GetFieldProperty(DataSource.DataSet, FControl, FFieldName)) else
      SetField(DataSource.DataSet.FieldByName(FFieldName));
  end;
end;

function TFieldDataLink.Edit: Boolean;
begin
  if CanModify then inherited Edit;
  Result := FEditing;
end;

function TFieldDataLink.GetCanModify: Boolean;
begin
  Result := not ReadOnly and (Field <> nil) and Field.CanModify;
end;

procedure TFieldDataLink.Modified;
begin
  FModified := True;
end;

procedure TFieldDataLink.Reset;
begin
  RecordChanged(nil);
end;

procedure TFieldDataLink.ActiveChanged;
begin
  UpdateField;
  if Assigned(FOnActiveChange) then FOnActiveChange(Self);
end;

procedure TFieldDataLink.EditingChanged;
begin
  SetEditing(inherited Editing and CanModify);
end;

procedure TFieldDataLink.FocusControl(Field: TFieldRef);
begin
  if (Field^ <> nil) and (Field^ = FField) and (FControl is TWinControl) then
    if TWinControl(FControl).CanFocus then
    begin
      Field^ := nil;
      TWinControl(FControl).SetFocus;
    end;
end;

procedure TFieldDataLink.RecordChanged(Field: TField);
begin
  if (Field = nil) or (Field = FField) then
  begin
    if Assigned(FOnDataChange) then FOnDataChange(Self);
    FModified := False;
  end;
end;

procedure TFieldDataLink.LayoutChanged;
begin
  UpdateField;
end;

procedure TFieldDataLink.UpdateData;
begin
  if FModified then
  begin
    if (Field <> nil) and Assigned(FOnUpdateData) then FOnUpdateData(Self);
    FModified := False;
  end;
end;

{ TPaintControl }

type
  TWinControlAccess = class(TWinControl);

constructor TPaintControl.Create(AOwner: TWinControl; const ClassName: string);
begin
  FOwner := AOwner;
  FClassName := ClassName;
end;

destructor TPaintControl.Destroy;
begin
  DestroyHandle;
end;

procedure TPaintControl.DestroyHandle;
begin
  if FHandle <> 0 then DestroyWindow(FHandle);
  FreeObjectInstance(FObjectInstance);
  FHandle := 0;
  FObjectInstance := nil;
end;

function TPaintControl.GetHandle: HWnd;
var
  Params: TCreateParams;
begin
  if FHandle = 0 then
  begin
    FObjectInstance := MakeObjectInstance(WndProc);
    TWinControlAccess(FOwner).CreateParams(Params);
    Params.Style := Params.Style and not (WS_HSCROLL or WS_VSCROLL);
    with Params do
      FHandle := CreateWindowEx(ExStyle, PChar(FClassName),
        PChar(TWinControlAccess(FOwner).Text), Style or WS_VISIBLE,
        X, Y, Width, Height, Application.Handle, 0, HInstance, nil);
    if FCtl3DButton and TWinControlAccess(FOwner).Ctl3D
      and not NewStyleControls then
      Subclass3DWnd(FHandle);
    FDefWindowProc := Pointer(GetWindowLong(FHandle, GWL_WNDPROC));
    SetWindowLong(FHandle, GWL_WNDPROC, Integer(FObjectInstance));
    SendMessage(FHandle, WM_SETFONT,
      TWinControlAccess(FOwner).Font.Handle, 1);
  end;
  Result := FHandle;
end;

procedure TPaintControl.SetCtl3DButton(Value: Boolean);
begin
  if FHandle <> 0 then DestroyHandle;
  FCtl3DButton := Value;
end;

procedure TPaintControl.WndProc(var Message: TMessage);
begin
  with Message do
    if (Msg >= CN_CTLCOLORMSGBOX) and (Msg <= CN_CTLCOLORSTATIC) then
      Result := FOwner.Perform(Msg, WParam, LParam) else
      Result := CallWindowProc(FDefWindowProc, FHandle, Msg, WParam, LParam);
end;

{ TcitDBEdit }

constructor TcitDBEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  inherited ReadOnly := True;
  ControlStyle := ControlStyle + [csReplicatable];
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  FDataLink.OnDataChange := DataChange;
  FDataLink.OnEditingChange := EditingChange;
  FDataLink.OnUpdateData := UpdateData;
end;

destructor TcitDBEdit.Destroy;
begin
  FDataLink.Free;
  FDataLink := nil;
  FCanvas.Free;
  inherited Destroy;
end;

procedure TcitDBEdit.Loaded;
begin
  inherited Loaded;
  if (csDesigning in ComponentState) then DataChange(Self);
end;

procedure TcitDBEdit.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (FDataLink <> nil) and
    (AComponent = DataSource) then DataSource := nil;
end;

procedure TcitDBEdit.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key, Shift);
  if (Key = VK_DELETE) or ((Key = VK_INSERT) and (ssShift in Shift)) then
    FDataLink.Edit;
end;

procedure TcitDBEdit.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  if (FDataLink.Field <> nil) then
    if FDataLink.Field.InheritsFrom(TNumericField) and ((Key = '.') or (Key = ',')) and (Key <> DecimalSeparator) then
      Key := DecimalSeparator;
  if (Key in [#32..#255]) and (FDataLink.Field <> nil) and not FDataLink.Field.IsValidChar(Key) then
  begin
    MessageBeep(0);
    Key := #0;
  end;
  case Key of
    ^H, ^V, ^X, #32..#255:
      FDataLink.Edit;
    #27:
      begin
        FDataLink.Reset;
        SelectAll;
        Key := #0;
      end;
  end;
end;

function TcitDBEdit.EditCanModify: Boolean;
begin
  Result := FDataLink.Edit;
end;

procedure TcitDBEdit.Reset;
begin
  FDataLink.Reset;
  SelectAll;
end;

procedure TcitDBEdit.SetFocused(Value: Boolean);
begin
  if FFocused <> Value then
  begin
    FFocused := Value;
    if (FAlignment <> taLeftJustify) and not IsMasked then Invalidate;
    FDataLink.Reset;
  end;
end;

procedure TcitDBEdit.Change;
begin
  FDataLink.Modified;
  inherited Change;
end;

function TcitDBEdit.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TcitDBEdit.SetDataSource(Value: TDataSource);
begin
  FDataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

function TcitDBEdit.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

procedure TcitDBEdit.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

function TcitDBEdit.GetReadOnly: Boolean;
begin
  Result := FDataLink.ReadOnly;
end;

procedure TcitDBEdit.SetReadOnly(Value: Boolean);
begin
  FDataLink.ReadOnly := Value;
end;

function TcitDBEdit.GetField: TField;
begin
  Result := FDataLink.Field;
end;

procedure TcitDBEdit.DataChange(Sender: TObject);
begin
  if FDataLink.Field <> nil then
  begin
    if FAlignment <> FDataLink.Field.Alignment then
    begin
      EditText := '';  {forces update}
      FAlignment := FDataLink.Field.Alignment;
    end;
    EditMask := FDataLink.Field.EditMask;
    if FFocused and FDataLink.CanModify then
      Text := FDataLink.Field.Text
    else
    begin
      EditText := FDataLink.Field.DisplayText;
      if FDataLink.Editing and FDataLink.FModified then
        Modified := True;
    end;
  end else
  begin
    FAlignment := taLeftJustify;
    EditMask := '';
    if csDesigning in ComponentState then
      EditText := Name else
      EditText := '';
  end;
end;

procedure TcitDBEdit.EditingChange(Sender: TObject);
begin
  inherited ReadOnly := not FDataLink.Editing;
end;

procedure TcitDBEdit.UpdateData(Sender: TObject);
begin
  ValidateEdit;
  FDataLink.Field.Text := Text;
end;

procedure TcitDBEdit.WMPaste(var Message: TMessage);
begin
  FDataLink.Edit;
  inherited;
end;

procedure TcitDBEdit.WMCut(var Message: TMessage);
begin
  FDataLink.Edit;
  inherited;
end;

procedure TcitDBEdit.CMEnter(var Message: TCMEnter);
begin
  SetFocused(True);
  inherited;
  if SysLocale.FarEast and FDataLink.CanModify then
    inherited ReadOnly := False;
end;

procedure TcitDBEdit.CMExit(var Message: TCMExit);
begin
  try
    FDataLink.UpdateRecord;
  except
    SelectAll;
    SetFocus;
    raise;
  end;
  SetFocused(False);
  CheckCursor;
  DoExit;
end;

procedure TcitDBEdit.WMPaint(var Message: TWMPaint);
var
  Left: Integer;
  Margins: TPoint;
  R: TRect;
  DC: HDC;
  PS: TPaintStruct;
  S: string;
begin
  if ((FAlignment = taLeftJustify) or FFocused) and
    not (csPaintCopy in ControlState) then
  begin
    inherited;
    Exit;
  end;
{ Since edit controls do not handle justification unless multi-line (and
  then only poorly) we will draw right and center justify manually unless
  the edit has the focus. }
  if FCanvas = nil then
  begin
    FCanvas := TControlCanvas.Create;
    FCanvas.Control := Self;
  end;
  DC := Message.DC;
  if DC = 0 then DC := BeginPaint(Handle, PS);
  FCanvas.Handle := DC;
  try
    FCanvas.Font := Font;
    with FCanvas do
    begin
      R := ClientRect;
      if not (NewStyleControls and Ctl3D) and (BorderStyle = bsSingle) then
      begin
        Brush.Color := clWindowFrame;
        FrameRect(R);
        InflateRect(R, -1, -1);
      end;
      Brush.Color := Color;
      if (csPaintCopy in ControlState) and (FDataLink.Field <> nil) then
      begin
        S := FDataLink.Field.DisplayText;
        case CharCase of
          ecUpperCase: S := AnsiUpperCase(S);
          ecLowerCase: S := AnsiLowerCase(S);
        end;
      end else
        S := EditText;
      if PasswordChar <> #0 then FillChar(S[1], Length(S), PasswordChar);
      Margins := GetTextMargins;
      case FAlignment of
        taLeftJustify: Left := Margins.X;
        taRightJustify: Left := ClientWidth - TextWidth(S) - Margins.X - 1;
      else
        Left := (ClientWidth - TextWidth(S)) div 2;
      end;
      TextRect(R, Left, Margins.Y, S);
    end;
  finally
    FCanvas.Handle := 0;
    if Message.DC = 0 then EndPaint(Handle, PS);
  end;
end;

procedure TcitDBEdit.CMGetDataLink(var Message: TMessage);
begin
  Message.Result := Integer(FDataLink);
end;

function TcitDBEdit.GetTextMargins: TPoint;
var
  DC: HDC;
  SaveFont: HFont;
  I: Integer;
  SysMetrics, Metrics: TTextMetric;
begin
  if NewStyleControls then
  begin
    if BorderStyle = bsNone then I := 0 else
      if Ctl3D then I := 1 else I := 2;
    Result.X := SendMessage(Handle, EM_GETMARGINS, 0, 0) and $0000FFFF + I;
    Result.Y := I;
  end else
  begin
    if BorderStyle = bsNone then I := 0 else
    begin
      DC := GetDC(0);
      GetTextMetrics(DC, SysMetrics);
      SaveFont := SelectObject(DC, Font.Handle);
      GetTextMetrics(DC, Metrics);
      SelectObject(DC, SaveFont);
      ReleaseDC(0, DC);
      I := SysMetrics.tmHeight;
      if I > Metrics.tmHeight then I := Metrics.tmHeight;
      I := I div 4;
    end;
    Result.X := I;
    Result.Y := I;
  end;
end;

procedure TcitDBEdit.ButtonPushed(Sender : TObject);
begin
  if FDataLink.CanModify or not FDontPushIfDisabled then
   if Assigned(FOnPushButton) and FOwnesLButton then begin
                                                      FDataLink.Edit;
                                                      FOnPushButton(Self);
                                                      if not Focused then
                                                                     FDataLink.UpdateRecord;
                                                     end;
  SetFocus;
end;
{ TDBText }

constructor TDBText.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csReplicatable];
  AutoSize := False;
  ShowAccelChar := False;
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  FDataLink.OnDataChange := DataChange;
end;

destructor TDBText.Destroy;
begin
  FDataLink.Free;
  FDataLink := nil;
  inherited Destroy;
end;

procedure TDBText.Loaded;
begin
  inherited Loaded;
  if (csDesigning in ComponentState) then DataChange(Self);
end;

procedure TDBText.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (FDataLink <> nil) and
    (AComponent = DataSource) then DataSource := nil;
end;

procedure TDBText.SetAutoSize(Value: Boolean);
begin
  if AutoSize <> Value then
  begin
    if Value and FDataLink.DataSourceFixed then DatabaseError('Фиксированный Dataset');
    inherited SetAutoSize(Value);
  end;
end;

function TDBText.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TDBText.SetDataSource(Value: TDataSource);
begin
  FDataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

function TDBText.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

procedure TDBText.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

function TDBText.GetField: TField;
begin
  Result := FDataLink.Field;
end;

function TDBText.GetFieldText: string;
begin
  if FDataLink.Field <> nil then
    Result := FDataLink.Field.DisplayText
  else
    if csDesigning in ComponentState then Result := Name else Result := '';
end;

procedure TDBText.DataChange(Sender: TObject);
begin
  Caption := GetFieldText;
end;

function TDBText.GetLabelText: string;
begin
  if csPaintCopy in ControlState then
    Result := GetFieldText else
    Result := Caption;
end;

procedure TDBText.CMGetDataLink(var Message: TMessage);
begin
  Message.Result := Integer(FDataLink);
end;

{ TDBCheckBox }

constructor TDBCheckBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csReplicatable];
  State := cbUnchecked;
  FValueCheck := STextTrue;
  FValueUncheck := STextFalse;
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  FDataLink.OnDataChange := DataChange;
  FDataLink.OnUpdateData := UpdateData;
  FPaintControl := TPaintControl.Create(Self, 'BUTTON');
  FPaintControl.Ctl3DButton := True;
end;

destructor TDBCheckBox.Destroy;
begin
  FPaintControl.Free;
  FDataLink.Free;
  FDataLink := nil;
  inherited Destroy;
end;

procedure TDBCheckBox.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (FDataLink <> nil) and
    (AComponent = DataSource) then DataSource := nil;
end;

function TDBCheckBox.GetFieldState: TCheckBoxState;
var
  Text: string;
begin
  if FDatalink.Field <> nil then
    if FDataLink.Field.IsNull then
      Result := cbGrayed
    else if FDataLink.Field.DataType = ftBoolean then
      if FDataLink.Field.AsBoolean then
        Result := cbChecked
      else
        Result := cbUnchecked
    else
    begin
      Result := cbGrayed;
      Text := FDataLink.Field.Text;
      if ValueMatch(FValueCheck, Text) then Result := cbChecked else
        if ValueMatch(FValueUncheck, Text) then Result := cbUnchecked;
    end
  else
    Result := cbUnchecked;
end;

procedure TDBCheckBox.DataChange(Sender: TObject);
begin
  State := GetFieldState;
end;

procedure TDBCheckBox.UpdateData(Sender: TObject);
var
  Pos: Integer;
  S: string;
begin
  if State = cbGrayed then
    FDataLink.Field.Clear
  else
    if FDataLink.Field.DataType = ftBoolean then
      FDataLink.Field.AsBoolean := Checked
    else
    begin
      if Checked then S := FValueCheck else S := FValueUncheck;
      Pos := 1;
      FDataLink.Field.Text := ExtractFieldName(S, Pos);
    end;
end;

function TDBCheckBox.ValueMatch(const ValueList, Value: string): Boolean;
var
  Pos: Integer;
begin
  Result := False;
  Pos := 1;
  while Pos <= Length(ValueList) do
    if AnsiCompareText(ExtractFieldName(ValueList, Pos), Value) = 0 then
    begin
      Result := True;
      Break;
    end;
end;

procedure TDBCheckBox.Toggle;
begin
  if FDataLink.Edit then
  begin
    inherited Toggle;
    FDataLink.Modified;
  end;
end;

function TDBCheckBox.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TDBCheckBox.SetDataSource(Value: TDataSource);
begin
  FDataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

function TDBCheckBox.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

procedure TDBCheckBox.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

function TDBCheckBox.GetReadOnly: Boolean;
begin
  Result := FDataLink.ReadOnly;
end;

procedure TDBCheckBox.SetReadOnly(Value: Boolean);
begin
  FDataLink.ReadOnly := Value;
end;

function TDBCheckBox.GetField: TField;
begin
  Result := FDataLink.Field;
end;

procedure TDBCheckBox.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  case Key of
    #8, ' ':
      FDataLink.Edit;
    #27:
      FDataLink.Reset;
  end;
end;

procedure TDBCheckBox.SetValueCheck(const Value: string);
begin
  FValueCheck := Value;
  DataChange(Self);
end;

procedure TDBCheckBox.SetValueUncheck(const Value: string);
begin
  FValueUncheck := Value;
  DataChange(Self);
end;

procedure TDBCheckBox.WndProc(var Message: TMessage);
begin
  with Message do
    if (Msg = WM_CREATE) or (Msg = WM_WINDOWPOSCHANGED) or
      (Msg = CM_TEXTCHANGED) or (Msg = CM_FONTCHANGED) then
      FPaintControl.DestroyHandle;
  inherited;
end;

procedure TDBCheckBox.WMPaint(var Message: TWMPaint);
begin
  if not (csPaintCopy in ControlState) then inherited else
  begin
    SendMessage(FPaintControl.Handle, BM_SETCHECK, Ord(GetFieldState), 0);
    SendMessage(FPaintControl.Handle, WM_PAINT, Message.DC, 0);
  end;
end;

procedure TDBCheckBox.CMExit(var Message: TCMExit);
begin
  try
    FDataLink.UpdateRecord;
  except
    SetFocus;
    raise;
  end;
  inherited;
end;

procedure TDBCheckBox.CMGetDataLink(var Message: TMessage);
begin
  Message.Result := Integer(FDataLink);
end;

{ TDBComboBox }

constructor TDBComboBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csReplicatable];
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  FDataLink.OnDataChange := DataChange;
  FDataLink.OnUpdateData := UpdateData;
  FDataLink.OnEditingChange := EditingChange;
  FPaintControl := TPaintControl.Create(Self, 'COMBOBOX');
end;

destructor TDBComboBox.Destroy;
begin
  FPaintControl.Free;
  FDataLink.Free;
  FDataLink := nil;
  inherited Destroy;
end;

procedure TDBComboBox.Loaded;
begin
  inherited Loaded;
  if (csDesigning in ComponentState) then DataChange(Self);
end;

procedure TDBComboBox.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (FDataLink <> nil) and
    (AComponent = DataSource) then DataSource := nil;
end;

procedure TDBComboBox.CreateWnd;
begin
  inherited CreateWnd;
  SetEditReadOnly;
end;

procedure TDBComboBox.DataChange(Sender: TObject);
begin
  if DroppedDown then Exit;
  if FDataLink.Field <> nil then
    SetComboText(FDataLink.Field.Text)
  else
    if csDesigning in ComponentState then
      SetComboText(Name)
    else
      SetComboText('');
end;

procedure TDBComboBox.UpdateData(Sender: TObject);
begin
  FDataLink.Field.Text := GetComboText;
end;

procedure TDBComboBox.SetComboText(const Value: string);
var
  I: Integer;
  Redraw: Boolean;
begin
  if Value <> GetComboText then
  begin
    if Style <> csDropDown then
    begin
      Redraw := (Style <> csSimple) and HandleAllocated;
      if Redraw then SendMessage(Handle, WM_SETREDRAW, 0, 0);
      try
        if Value = '' then I := -1 else I := Items.IndexOf(Value);
        ItemIndex := I;
      finally
        if Redraw then
        begin
          SendMessage(Handle, WM_SETREDRAW, 1, 0);
          Invalidate;
        end;
      end;
      if I >= 0 then Exit;
    end;
    if Style in [csDropDown, csSimple] then Text := Value;
  end;
end;

function TDBComboBox.GetComboText: string;
var
  I: Integer;
begin
  if Style in [csDropDown, csSimple] then Result := Text else
  begin
    I := ItemIndex;
    if I < 0 then Result := '' else Result := Items[I];
  end;
end;

procedure TDBComboBox.Change;
begin
  FDataLink.Edit;
  inherited Change;
  FDataLink.Modified;
end;

procedure TDBComboBox.Click;
begin
  FDataLink.Edit;
  inherited Click;
  FDataLink.Modified;
end;

procedure TDBComboBox.DropDown;
begin
  inherited DropDown;
end;

function TDBComboBox.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TDBComboBox.SetDataSource(Value: TDataSource);
begin
  FDataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

function TDBComboBox.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

procedure TDBComboBox.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

function TDBComboBox.GetReadOnly: Boolean;
begin
  Result := FDataLink.ReadOnly;
end;

procedure TDBComboBox.SetReadOnly(Value: Boolean);
begin
  FDataLink.ReadOnly := Value;
end;

function TDBComboBox.GetField: TField;
begin
  Result := FDataLink.Field;
end;

procedure TDBComboBox.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key, Shift);
  if Key in [VK_BACK, VK_DELETE, VK_UP, VK_DOWN, 32..255] then
  begin
    if not FDataLink.Edit and (Key in [VK_UP, VK_DOWN]) then
      Key := 0;
  end;
end;

procedure TDBComboBox.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  if (Key in [#32..#255]) and (FDataLink.Field <> nil) and
    not FDataLink.Field.IsValidChar(Key) then
  begin
    MessageBeep(0);
    Key := #0;
  end;
  case Key of
    ^H, ^V, ^X, #32..#255:
      FDataLink.Edit;
    #27:
      begin
        FDataLink.Reset;
        SelectAll;
      end;
  end;
end;

procedure TDBComboBox.EditingChange(Sender: TObject);
begin
  SetEditReadOnly;
end;

procedure TDBComboBox.SetEditReadOnly;
begin
  if (Style in [csDropDown, csSimple]) and HandleAllocated then
    SendMessage(EditHandle, EM_SETREADONLY, Ord(not FDataLink.Editing), 0);
end;

procedure TDBComboBox.WndProc(var Message: TMessage);
begin
  if not (csDesigning in ComponentState) then
    case Message.Msg of
      WM_COMMAND:
        if TWMCommand(Message).NotifyCode = CBN_SELCHANGE then
          if not FDataLink.Edit then
          begin
            if Style <> csSimple then
              PostMessage(Handle, CB_SHOWDROPDOWN, 0, 0);
            Exit;
          end;
      CB_SHOWDROPDOWN:
        if Message.WParam <> 0 then FDataLink.Edit else
          if not FDataLink.Editing then DataChange(Self); {Restore text}
      WM_CREATE,
      WM_WINDOWPOSCHANGED,
      CM_FONTCHANGED:
        FPaintControl.DestroyHandle;
    end;
  inherited WndProc(Message);
end;

procedure TDBComboBox.ComboWndProc(var Message: TMessage; ComboWnd: HWnd;
  ComboProc: Pointer);
begin
  if not (csDesigning in ComponentState) then
    case Message.Msg of
      WM_LBUTTONDOWN:
        if (Style = csSimple) and (ComboWnd <> EditHandle) then
          if not FDataLink.Edit then Exit;
    end;
  inherited ComboWndProc(Message, ComboWnd, ComboProc);
end;

procedure TDBComboBox.CMEnter(var Message: TCMEnter);
begin
  inherited;
  if SysLocale.FarEast and FDataLink.CanModify then
    SendMessage(EditHandle, EM_SETREADONLY, Ord(False), 0);
end;

procedure TDBComboBox.CMExit(var Message: TCMExit);
begin
  try
    FDataLink.UpdateRecord;
  except
    SelectAll;
    SetFocus;
    raise;
  end;
  inherited;
end;

procedure TDBComboBox.WMPaint(var Message: TWMPaint);
var
  S: string;
  R: TRect;
  P: TPoint;
  Child: HWND;
begin
  if csPaintCopy in ControlState then
  begin
    if FDataLink.Field <> nil then S := FDataLink.Field.Text else S := '';
    if Style = csDropDown then
    begin
      SendMessage(FPaintControl.Handle, WM_SETTEXT, 0, Longint(PChar(S)));
      SendMessage(FPaintControl.Handle, WM_PAINT, Message.DC, 0);
      Child := GetWindow(FPaintControl.Handle, GW_CHILD);
      if Child <> 0 then
      begin
        Windows.GetClientRect(Child, R);
        Windows.MapWindowPoints(Child, FPaintControl.Handle, R.TopLeft, 2);
        GetWindowOrgEx(Message.DC, P);
        SetWindowOrgEx(Message.DC, P.X - R.Left, P.Y - R.Top, nil);
        IntersectClipRect(Message.DC, 0, 0, R.Right - R.Left, R.Bottom - R.Top);
        SendMessage(Child, WM_PAINT, Message.DC, 0);
      end;
    end else
    begin
      SendMessage(FPaintControl.Handle, CB_RESETCONTENT, 0, 0);
      if Items.IndexOf(S) <> -1 then
      begin
        SendMessage(FPaintControl.Handle, CB_ADDSTRING, 0, Longint(PChar(S)));
        SendMessage(FPaintControl.Handle, CB_SETCURSEL, 0, 0);
      end;
      SendMessage(FPaintControl.Handle, WM_PAINT, Message.DC, 0);
    end;
  end else
    inherited;
end;

procedure TDBComboBox.SetItems(Value: TStrings);
begin
  Items.Assign(Value);
  DataChange(Self);
end;

procedure TDBCombobox.SetStyle(Value: TComboboxStyle);
begin
  if (Value = csSimple) and Assigned(FDatalink) and FDatalink.DatasourceFixed then
    DatabaseError('Не применимо');
  inherited SetStyle(Value);
end;

procedure TDBCombobox.CMGetDatalink(var Message: TMessage);
begin
  Message.Result := Integer(FDataLink);
end;


{ TDBListBox }

constructor TDBListBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  FDataLink.OnDataChange := DataChange;
  FDataLink.OnUpdateData := UpdateData;
end;

destructor TDBListBox.Destroy;
begin
  FDataLink.Free;
  FDataLink := nil;
  inherited Destroy;
end;

procedure TDBListBox.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (FDataLink <> nil) and
    (AComponent = DataSource) then DataSource := nil;
end;

procedure TDBListBox.DataChange(Sender: TObject);
begin
  if FDataLink.Field <> nil then
    ItemIndex := Items.IndexOf(FDataLink.Field.Text) else
    ItemIndex := -1;
end;

procedure TDBListBox.UpdateData(Sender: TObject);
begin
  if ItemIndex >= 0 then
    FDataLink.Field.Text := Items[ItemIndex] else
    FDataLink.Field.Text := '';
end;

procedure TDBListBox.Click;
begin
  if FDataLink.Edit then
  begin
    inherited Click;
    FDataLink.Modified;
  end;
end;

function TDBListBox.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TDBListBox.SetDataSource(Value: TDataSource);
begin
  FDataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

function TDBListBox.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

procedure TDBListBox.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

function TDBListBox.GetReadOnly: Boolean;
begin
  Result := FDataLink.ReadOnly;
end;

procedure TDBListBox.SetReadOnly(Value: Boolean);
begin
  FDataLink.ReadOnly := Value;
end;

function TDBListBox.GetField: TField;
begin
  Result := FDataLink.Field;
end;

procedure TDBListBox.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key, Shift);
  if Key in [VK_PRIOR, VK_NEXT, VK_END, VK_HOME, VK_LEFT, VK_UP,
    VK_RIGHT, VK_DOWN] then
    if not FDataLink.Edit then Key := 0;
end;

procedure TDBListBox.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  case Key of
    #32..#255:
      if not FDataLink.Edit then Key := #0;
    #27:
      FDataLink.Reset;
  end;
end;

procedure TDBListBox.WMLButtonDown(var Message: TWMLButtonDown);
begin
  if FDataLink.Edit then inherited
  else
  begin
    SetFocus;
    with Message do
      MouseDown(mbLeft, KeysToShiftState(Keys), XPos, YPos);
  end;
end;

procedure TDBListBox.CMExit(var Message: TCMExit);
begin
  try
    FDataLink.UpdateRecord;
  except
    SetFocus;
    raise;
  end;
  inherited;
end;

procedure TDBListBox.SetItems(Value: TStrings);
begin
  Items.Assign(Value);
  DataChange(Self);
end;

{ TDBRadioGroup }

constructor TDBRadioGroup.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  FDataLink.OnDataChange := DataChange;
  FDataLink.OnUpdateData := UpdateData;
  FValues := TStringList.Create;
end;

destructor TDBRadioGroup.Destroy;
begin
  FDataLink.Free;
  FDataLink := nil;
  FValues.Free;
  inherited Destroy;
end;

procedure TDBRadioGroup.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (FDataLink <> nil) and
    (AComponent = DataSource) then DataSource := nil;
end;

procedure TDBRadioGroup.DataChange(Sender: TObject);
begin
  if FDataLink.Field <> nil then
    Value := FDataLink.Field.Text else
    Value := '';
end;

procedure TDBRadioGroup.UpdateData(Sender: TObject);
begin
  if FDataLink.Field <> nil then FDataLink.Field.Text := Value;
end;

function TDBRadioGroup.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TDBRadioGroup.SetDataSource(Value: TDataSource);
begin
  FDataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

function TDBRadioGroup.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

procedure TDBRadioGroup.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

function TDBRadioGroup.GetReadOnly: Boolean;
begin
  Result := FDataLink.ReadOnly;
end;

procedure TDBRadioGroup.SetReadOnly(Value: Boolean);
begin
  FDataLink.ReadOnly := Value;
end;

function TDBRadioGroup.GetField: TField;
begin
  Result := FDataLink.Field;
end;

function TDBRadioGroup.GetButtonValue(Index: Integer): string;
begin
  if (Index < FValues.Count) and (FValues[Index] <> '') then
    Result := FValues[Index]
  else if Index < Items.Count then
    Result := Items[Index]
  else
    Result := '';
end;

procedure TDBRadioGroup.SetValue(const Value: string);
var
  I, Index: Integer;
begin
  if FValue <> Value then
  begin
    FInSetValue := True;
    try
      Index := -1;
      for I := 0 to Items.Count - 1 do
        if Value = GetButtonValue(I) then
        begin
          Index := I;
          Break;
        end;
      ItemIndex := Index;
    finally
      FInSetValue := False;
    end;
    FValue := Value;
    Change;
  end;
end;

procedure TDBRadioGroup.CMExit(var Message: TCMExit);
begin
  try
    FDataLink.UpdateRecord;
  except
    if ItemIndex >= 0 then
      TcitRadioButton(Controls[ItemIndex]).SetFocus else
      TcitRadioButton(Controls[0]).SetFocus;
    raise;
  end;
  inherited;
end;

procedure TDBRadioGroup.Click;
begin
  if not FInSetValue then
  begin
    inherited Click;
    if ItemIndex >= 0 then Value := GetButtonValue(ItemIndex);
    if FDataLink.Editing then FDataLink.Modified;
  end;
end;

procedure TDBRadioGroup.SetItems(Value: TStrings);
begin
  Items.Assign(Value);
  DataChange(Self);
end;

procedure TDBRadioGroup.SetValues(Value: TStrings);
begin
  FValues.Assign(Value);
  DataChange(Self);
end;

procedure TDBRadioGroup.Change;
begin
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TDBRadioGroup.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  case Key of
    #8, ' ': FDataLink.Edit;
    #27: FDataLink.Reset;
  end;
end;

function TDBRadioGroup.CanModify: Boolean;
begin
  Result := FDataLink.Edit;
end;

{ TDBMemo }

constructor TDBMemo.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  inherited ReadOnly := True;
  ControlStyle := ControlStyle + [csReplicatable];
  FAutoDisplay := True;
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  FDataLink.OnDataChange := DataChange;
  FDataLink.OnEditingChange := EditingChange;
  FDataLink.OnUpdateData := UpdateData;
  FPaintControl := TPaintControl.Create(Self, 'EDIT');
end;

destructor TDBMemo.Destroy;
begin
  FPaintControl.Free;
  FDataLink.Free;
  FDataLink := nil;
  inherited Destroy;
end;

procedure TDBMemo.Loaded;
begin
  inherited Loaded;
  if (csDesigning in ComponentState) then DataChange(Self);
end;

procedure TDBMemo.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (FDataLink <> nil) and
    (AComponent = DataSource) then DataSource := nil;
end;

procedure TDBMemo.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key, Shift);
  if FMemoLoaded then
  begin
    if (Key = VK_DELETE) or ((Key = VK_INSERT) and (ssShift in Shift)) then
      FDataLink.Edit;
  end;
end;

procedure TDBMemo.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  if FMemoLoaded then
  begin
    if (Key in [#32..#255]) and (FDataLink.Field <> nil) and
      not FDataLink.Field.IsValidChar(Key) then
    begin
      MessageBeep(0);
      Key := #0;
    end;
    case Key of
      ^H, ^I, ^J, ^M, ^V, ^X, #32..#255:
        FDataLink.Edit;
      #27:
        FDataLink.Reset;
    end;
  end else
  begin
    if Key = #13 then LoadMemo;
    Key := #0;
  end;
end;

procedure TDBMemo.Change;
begin
  if FMemoLoaded then FDataLink.Modified;
  FMemoLoaded := True;
  inherited Change;
end;

function TDBMemo.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TDBMemo.SetDataSource(Value: TDataSource);
begin
  FDataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

function TDBMemo.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

procedure TDBMemo.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

function TDBMemo.GetReadOnly: Boolean;
begin
  Result := FDataLink.ReadOnly;
end;

procedure TDBMemo.SetReadOnly(Value: Boolean);
begin
  FDataLink.ReadOnly := Value;
end;

function TDBMemo.GetField: TField;
begin
  Result := FDataLink.Field;
end;

procedure TDBMemo.LoadMemo;
begin
  if not FMemoLoaded and Assigned(FDataLink.Field) and FDataLink.Field.IsBlob then
  begin
    try
      Lines.Text := FDataLink.Field.AsString;
      FMemoLoaded := True;
    except
      { Memo too large }
      on E:EInvalidOperation do
        Lines.Text := Format('(%s)', [E.Message]);
    end;
    EditingChange(Self);
  end;
end;

procedure TDBMemo.DataChange(Sender: TObject);
begin
  if FDataLink.Field <> nil then
    if FDataLink.Field.IsBlob then
    begin
      if FAutoDisplay or (FDataLink.Editing and FMemoLoaded) then
      begin
        FMemoLoaded := False;
        LoadMemo;
      end else
      begin
        Text := Format('(%s)', [FDataLink.Field.DisplayLabel]);
        FMemoLoaded := False;
      end;
    end else
    begin
      if FFocused and FDataLink.CanModify then
        Text := FDataLink.Field.Text
      else
        Text := FDataLink.Field.DisplayText;
      FMemoLoaded := True;
    end
  else
  begin
    if csDesigning in ComponentState then Text := Name else Text := '';
    FMemoLoaded := False;
  end;
  if HandleAllocated then
    RedrawWindow(Handle, nil, 0, RDW_INVALIDATE or RDW_ERASE or RDW_FRAME);
end;

procedure TDBMemo.EditingChange(Sender: TObject);
begin
  inherited ReadOnly := not (FDataLink.Editing and FMemoLoaded);
end;

procedure TDBMemo.UpdateData(Sender: TObject);
begin
  FDataLink.Field.AsString := Text;
end;

procedure TDBMemo.SetFocused(Value: Boolean);
begin
  if FFocused <> Value then
  begin
    FFocused := Value;
    if not Assigned(FDataLink.Field) or not FDataLink.Field.IsBlob then
      FDataLink.Reset;
  end;
end;

procedure TDBMemo.WndProc(var Message: TMessage);
begin
  with Message do
    if (Msg = WM_CREATE) or (Msg = WM_WINDOWPOSCHANGED) or
      (Msg = CM_FONTCHANGED) then FPaintControl.DestroyHandle;
  inherited;
end;

procedure TDBMemo.CMEnter(var Message: TCMEnter);
begin
  SetFocused(True);
  inherited;
  if SysLocale.FarEast and FDataLink.CanModify then
    inherited ReadOnly := False;
end;

procedure TDBMemo.CMExit(var Message: TCMExit);
begin
  try
    FDataLink.UpdateRecord;
  except
    SetFocus;
    raise;
  end;
  SetFocused(False);
  inherited;
end;

procedure TDBMemo.SetAutoDisplay(Value: Boolean);
begin
  if FAutoDisplay <> Value then
  begin
    FAutoDisplay := Value;
    if Value then LoadMemo;
  end;
end;

procedure TDBMemo.WMLButtonDblClk(var Message: TWMLButtonDblClk);
begin
  if not FMemoLoaded then LoadMemo else inherited;
end;

procedure TDBMemo.WMCut(var Message: TMessage);
begin
  FDataLink.Edit;
  inherited;
end;

procedure TDBMemo.WMPaste(var Message: TMessage);
begin
  FDataLink.Edit;
  inherited;
end;

procedure TDBMemo.CMGetDataLink(var Message: TMessage);
begin
  Message.Result := Integer(FDataLink);
end;

procedure TDBMemo.WMPaint(var Message: TWMPaint);
var
  S: string;
begin
  if not (csPaintCopy in ControlState) then inherited else
  begin
    if FDataLink.Field <> nil then
      if FDataLink.Field.IsBlob then
      begin
        if FAutoDisplay then
          S := AdjustLineBreaks(FDataLink.Field.AsString) else
          S := Format('(%s)', [FDataLink.Field.DisplayLabel]);
      end else
        S := FDataLink.Field.DisplayText;
    SendMessage(FPaintControl.Handle, WM_SETTEXT, 0, Integer(PChar(S)));
    SendMessage(FPaintControl.Handle, WM_ERASEBKGND, Message.DC, 0);
    SendMessage(FPaintControl.Handle, WM_PAINT, Message.DC, 0);
  end;
end;

{ TDBImage }

constructor TDBImage.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csOpaque, csReplicatable];
  if not NewStyleControls then ControlStyle := ControlStyle + [csFramed];
  Width := 105;
  Height := 105;
  TabStop := True;
  ParentColor := False;
  FPicture := TPicture.Create;
  FPicture.OnChange := PictureChanged;
  FBorderStyle := bsSingle;
  FAutoDisplay := True;
  FCenter := True;
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  FDataLink.OnDataChange := DataChange;
  FDataLink.OnUpdateData := UpdateData;
  FQuickDraw := True;
end;

destructor TDBImage.Destroy;
begin
  FPicture.Free;
  FDataLink.Free;
  FDataLink := nil;
  inherited Destroy;
end;

function TDBImage.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TDBImage.SetDataSource(Value: TDataSource);
begin
  FDataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

function TDBImage.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

procedure TDBImage.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

function TDBImage.GetReadOnly: Boolean;
begin
  Result := FDataLink.ReadOnly;
end;

procedure TDBImage.SetReadOnly(Value: Boolean);
begin
  FDataLink.ReadOnly := Value;
end;

function TDBImage.GetField: TField;
begin
  Result := FDataLink.Field;
end;

function TDBImage.GetPalette: HPALETTE;
begin
  Result := 0;
  if FPicture.Graphic is TBitmap then
    Result := TBitmap(FPicture.Graphic).Palette;
end;

procedure TDBImage.SetAutoDisplay(Value: Boolean);
begin
  if FAutoDisplay <> Value then
  begin
    FAutoDisplay := Value;
    if Value then LoadPicture;
  end;
end;

procedure TDBImage.SetBorderStyle(Value: TBorderStyle);
begin
  if FBorderStyle <> Value then
  begin
    FBorderStyle := Value;
    RecreateWnd;
  end;
end;

procedure TDBImage.SetCenter(Value: Boolean);
begin
  if FCenter <> Value then
  begin
    FCenter := Value;
    Invalidate;
  end;
end;

procedure TDBImage.SetPicture(Value: TPicture);
begin
  FPicture.Assign(Value);
end;

procedure TDBImage.SetStretch(Value: Boolean);
begin
  if FStretch <> Value then
  begin
    FStretch := Value;
    Invalidate;
  end;
end;

procedure TDBImage.Paint;
var
  Size: TSize;
  R: TRect;
  S: string;
  DrawPict: TPicture;
  Form: TCustomForm;
  Pal: HPalette;
begin
  with Canvas do
  begin
    Brush.Style := bsSolid;
    Brush.Color := Color;
    if FPictureLoaded or (csPaintCopy in ControlState) then
    begin
      DrawPict := TPicture.Create;
      Pal := 0;
      try
        if (csPaintCopy in ControlState) and
          Assigned(FDataLink.Field) and FDataLink.Field.IsBlob then
        begin
          DrawPict.Assign(FDataLink.Field);
          if DrawPict.Graphic is TBitmap then
            DrawPict.Bitmap.IgnorePalette := QuickDraw;
        end
        else
        begin
          DrawPict.Assign(Picture);
          if Focused and (DrawPict.Graphic <> nil) and (DrawPict.Graphic.Palette <> 0) then
          begin { Control has focus, so realize the bitmap palette in foreground }
            Pal := SelectPalette(Handle, DrawPict.Graphic.Palette, False);
            RealizePalette(Handle);
          end;
        end;
        if Stretch then
          if (DrawPict.Graphic = nil) or DrawPict.Graphic.Empty then
            FillRect(ClientRect)
          else
            StretchDraw(ClientRect, DrawPict.Graphic)
        else
        begin
          SetRect(R, 0, 0, DrawPict.Width, DrawPict.Height);
          if Center then OffsetRect(R, (ClientWidth - DrawPict.Width) div 2,
            (ClientHeight - DrawPict.Height) div 2);
          StretchDraw(R, DrawPict.Graphic);
          ExcludeClipRect(Handle, R.Left, R.Top, R.Right, R.Bottom);
          FillRect(ClientRect);
          SelectClipRgn(Handle, 0);
        end;
      finally
        if Pal <> 0 then SelectPalette(Handle, Pal, True);
        DrawPict.Free;
      end;
    end
    else begin
      Font := Self.Font;
      if FDataLink.Field <> nil then
        S := FDataLink.Field.DisplayLabel
      else S := Name;
      S := '(' + S + ')';
      Size := TextExtent(S);
      R := ClientRect;
      TextRect(R, (R.Right - Size.cx) div 2, (R.Bottom - Size.cy) div 2, S);
    end;
    Form := GetParentForm(Self);
    if (Form <> nil) and (Form.ActiveControl = Self) and
      not (csDesigning in ComponentState) and
      not (csPaintCopy in ControlState) then
    begin
      Brush.Color := clWindowFrame;
      FrameRect(ClientRect);
    end;
  end;
end;

procedure TDBImage.PictureChanged(Sender: TObject);
begin
  if FPictureLoaded then FDataLink.Modified;
  FPictureLoaded := True;
  Invalidate;
end;

procedure TDBImage.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (FDataLink <> nil) and
    (AComponent = DataSource) then DataSource := nil;
end;

procedure TDBImage.LoadPicture;
begin
  if not FPictureLoaded and (not Assigned(FDataLink.Field) or
    FDataLink.Field.IsBlob) then
    Picture.Assign(FDataLink.Field);
end;

procedure TDBImage.DataChange(Sender: TObject);
begin
  Picture.Graphic := nil;
  FPictureLoaded := False;
  if FAutoDisplay then LoadPicture;
end;

procedure TDBImage.UpdateData(Sender: TObject);
begin
  if Picture.Graphic is TBitmap then
     FDataLink.Field.Assign(Picture.Graphic) else
     FDataLink.Field.Clear;
end;

procedure TDBImage.CopyToClipboard;
begin
  if Picture.Graphic <> nil then Clipboard.Assign(Picture);
end;

procedure TDBImage.CutToClipboard;
begin
  if Picture.Graphic <> nil then
    if FDataLink.Edit then
    begin
      CopyToClipboard;
      Picture.Graphic := nil;
    end;
end;

procedure TDBImage.PasteFromClipboard;
begin
  if Clipboard.HasFormat(CF_BITMAP) and FDataLink.Edit then
    Picture.Bitmap.Assign(Clipboard);
end;

procedure TDBImage.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    if FBorderStyle = bsSingle then
      if NewStyleControls and Ctl3D then
        ExStyle := ExStyle or WS_EX_CLIENTEDGE
      else
        Style := Style or WS_BORDER;
    WindowClass.style := WindowClass.style and not (CS_HREDRAW or CS_VREDRAW);
  end;
end;

procedure TDBImage.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key, Shift);
  case Key of
    VK_INSERT:
      if ssShift in Shift then PasteFromClipBoard else
        if ssCtrl in Shift then CopyToClipBoard;
    VK_DELETE:
      if ssShift in Shift then CutToClipBoard;
  end;
end;

procedure TDBImage.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  case Key of
    ^X: CutToClipBoard;
    ^C: CopyToClipBoard;
    ^V: PasteFromClipBoard;
    #13: LoadPicture;
    #27: FDataLink.Reset;
  end;
end;

procedure TDBImage.CMEnter(var Message: TCMEnter);
begin
  Invalidate; { Draw the focus marker }
  inherited;
end;

procedure TDBImage.CMExit(var Message: TCMExit);
begin
  try
    FDataLink.UpdateRecord;
  except
    SetFocus;
    raise;
  end;
  Invalidate; { Erase the focus marker }
  inherited;
end;

procedure TDBImage.CMTextChanged(var Message: TMessage);
begin
  inherited;
  if not FPictureLoaded then Invalidate;
end;

procedure TDBImage.WMLButtonDown(var Message: TWMLButtonDown);
begin
  if TabStop and CanFocus then SetFocus;
  inherited;
end;

procedure TDBImage.WMLButtonDblClk(var Message: TWMLButtonDblClk);
begin
  LoadPicture;
  inherited;
end;

procedure TDBImage.WMCut(var Message: TMessage);
begin
  CutToClipboard;
end;

procedure TDBImage.WMCopy(var Message: TMessage);
begin
  CopyToClipboard;
end;

procedure TDBImage.WMPaste(var Message: TMessage);
begin
  PasteFromClipboard;
end;

procedure TDBImage.WMSize(var Message: TMessage);
begin
  inherited;
  Invalidate;
end;

{ TDBNavigator }

{var
  BtnTypeName: array[TNavigateBtn] of PChar = ('FIRST', 'PRIOR', 'NEXT',
    'LAST', 'INSERT', 'DELETE', 'EDIT', 'POST', 'CANCEL', 'REFRESH');
  BtnHintId: array[TNavigateBtn] of Pointer = (@SFirstRecord, @SPriorRecord,
    @SNextRecord, @SLastRecord, @SInsertRecord, @SDeleteRecord, @SEditRecord,
    @SPostEdit, @SCancelEdit, @SRefreshRecord);

constructor TDBNavigator.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csAcceptsControls, csSetCaption] + [csOpaque];
  if not NewStyleControls then ControlStyle := ControlStyle + [csFramed];
  FDataLink := TNavDataLink.Create(Self);
  FVisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbInsert,
    nbDelete, nbEdit, nbPost, nbCancel, nbRefresh];
  FHints := TStringList.Create;
  TStringList(FHints).OnChange := HintsChanged;
  InitButtons;
  BevelOuter := bvNone;
  BevelInner := bvNone;
  Width := 241;
  Height := 25;
  ButtonWidth := 0;
  FocusedButton := nbFirst;
  FConfirmDelete := True;
  FullRepaint := False;
end;

destructor TDBNavigator.Destroy;
begin
  FDataLink.Free;
  FHints.Free;
  FDataLink := nil;
  inherited Destroy;
end;

procedure TDBNavigator.InitButtons;
var
  I: TNavigateBtn;
  Btn: TNavButton;
  X: Integer;
  ResName: string;
begin
  MinBtnSize := Point(20, 18);
  X := 0;
  for I := Low(Buttons) to High(Buttons) do
  begin
    Btn := TNavButton.Create (Self);
    Btn.Flat := Flat;
    Btn.Index := I;
    Btn.Visible := I in FVisibleButtons;
    Btn.Enabled := True;
    Btn.SetBounds (X, 0, MinBtnSize.X, MinBtnSize.Y);
    FmtStr(ResName, 'dbn_%s', [BtnTypeName[I]]);
    Btn.Glyph.LoadFromResourceName(HInstance, ResName);
    Btn.NumGlyphs := 2;
    Btn.Enabled := False;
    Btn.Enabled := True;
    Btn.OnClick := ClickHandler;
    Btn.OnMouseDown := BtnMouseDown;
    Btn.Parent := Self;
    Buttons[I] := Btn;
    X := X + MinBtnSize.X;
  end;
  InitHints;
  Buttons[nbPrior].NavStyle := Buttons[nbPrior].NavStyle + [nsAllowTimer];
  Buttons[nbNext].NavStyle  := Buttons[nbNext].NavStyle + [nsAllowTimer];
end;

procedure TDBNavigator.InitHints;
var
  I: Integer;
  J: TNavigateBtn;
begin
  for J := Low(Buttons) to High(Buttons) do
    Buttons[J].Hint := LoadResString(BtnHintId[J]);
  J := Low(Buttons);
  for I := 0 to (FHints.Count - 1) do
  begin
    if FHints.Strings[I] <> '' then Buttons[J].Hint := FHints.Strings[I];
    if J = High(Buttons) then Exit;
    Inc(J);
  end;
end;

procedure TDBNavigator.HintsChanged(Sender: TObject);
begin
  InitHints;
end;

procedure TDBNavigator.SetFlat(Value: Boolean);
var
  I: TNavigateBtn;
begin
  if FFlat <> Value then
  begin
    FFlat := Value;
    for I := Low(Buttons) to High(Buttons) do
      Buttons[I].Flat := Value;
  end;
end;

procedure TDBNavigator.SetHints(Value: TStrings);
begin
  FHints.Assign(Value);
end;

procedure TDBNavigator.GetChildren(Proc: TGetChildProc; Root: TComponent);
begin
end;

procedure TDBNavigator.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (FDataLink <> nil) and
    (AComponent = DataSource) then DataSource := nil;
end;

procedure TDBNavigator.SetVisible(Value: TButtonSet);
var
  I: TNavigateBtn;
  W, H: Integer;
begin
  W := Width;
  H := Height;
  FVisibleButtons := Value;
  for I := Low(Buttons) to High(Buttons) do
    Buttons[I].Visible := I in FVisibleButtons;
  AdjustSize (W, H);
  if (W <> Width) or (H <> Height) then
    inherited SetBounds (Left, Top, W, H);
  Invalidate;
end;

procedure TDBNavigator.AdjustSize (var W: Integer; var H: Integer);
var
  Count: Integer;
  MinW: Integer;
  I: TNavigateBtn;
  Space, Temp, Remain: Integer;
  X: Integer;
begin
  if (csLoading in ComponentState) then Exit;
  if Buttons[nbFirst] = nil then Exit;

  Count := 0;
  for I := Low(Buttons) to High(Buttons) do
  begin
    if Buttons[I].Visible then
    begin
      Inc(Count);
    end;
  end;
  if Count = 0 then Inc(Count);

  MinW := Count * MinBtnSize.X;
  if W < MinW then W := MinW;
  if H < MinBtnSize.Y then H := MinBtnSize.Y;

  ButtonWidth := W div Count;
  Temp := Count * ButtonWidth;
  if Align = alNone then W := Temp;

  X := 0;
  Remain := W - Temp;
  Temp := Count div 2;
  for I := Low(Buttons) to High(Buttons) do
  begin
    if Buttons[I].Visible then
    begin
      Space := 0;
      if Remain <> 0 then
      begin
        Dec(Temp, Remain);
        if Temp < 0 then
        begin
          Inc(Temp, Count);
          Space := 1;
        end;
      end;
      Buttons[I].SetBounds(X, 0, ButtonWidth + Space, Height);
      Inc(X, ButtonWidth + Space);
    end
    else
      Buttons[I].SetBounds (Width + 1, 0, ButtonWidth, Height);
  end;
end;

procedure TDBNavigator.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
var
  W, H: Integer;
begin
  W := AWidth;
  H := AHeight;
  if not HandleAllocated then AdjustSize (W, H);
  inherited SetBounds (ALeft, ATop, W, H);
end;
}(*
procedure TDBNavigator.WMSize(var Message: TWMSize);
var
  W, H: Integer;
begin
  inherited;
  { check for minimum size }
  W := Width;
  H := Height;
  AdjustSize (W, H);
  if (W <> Width) or (H <> Height) then
    inherited SetBounds(Left, Top, W, H);
  Message.Result := 0;
end;

procedure TDBNavigator.ClickHandler(Sender: TObject);
begin
  BtnClick (TNavButton (Sender).Index);
end;

procedure TDBNavigator.BtnMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  OldFocus: TNavigateBtn;
begin
  OldFocus := FocusedButton;
  FocusedButton := TNavButton (Sender).Index;
  if TabStop and (GetFocus <> Handle) and CanFocus then
  begin
    SetFocus;
    if (GetFocus <> Handle) then
      Exit;
  end
  else if TabStop and (GetFocus = Handle) and (OldFocus <> FocusedButton) then
  begin
    Buttons[OldFocus].Invalidate;
    Buttons[FocusedButton].Invalidate;
  end;
end;

procedure TDBNavigator.BtnClick(Index: TNavigateBtn);
begin
  if (DataSource <> nil) and (DataSource.State <> dsInactive) then
  begin
    if not (csDesigning in ComponentState) and Assigned(FBeforeAction) then
      FBeforeAction(Self, Index);
    with DataSource.DataSet do
    begin
      case Index of
        nbPrior: Prior;
        nbNext: Next;
        nbFirst: First;
        nbLast: Last;
        nbInsert: Insert;
        nbEdit: Edit;
        nbCancel: Cancel;
        nbPost: Post;
        nbRefresh: Refresh;
        nbDelete:
          if not FConfirmDelete or
            (MessageDlg(SDeleteRecordQuestion, mtConfirmation,
            mbOKCancel, 0) <> idCancel) then Delete;
      end;
    end;
  end;
  if not (csDesigning in ComponentState) and Assigned(FOnNavClick) then
    FOnNavClick(Self, Index);
end;

procedure TDBNavigator.WMSetFocus(var Message: TWMSetFocus);
begin
  Buttons[FocusedButton].Invalidate;
end;

procedure TDBNavigator.WMKillFocus(var Message: TWMKillFocus);
begin
  Buttons[FocusedButton].Invalidate;
end;

procedure TDBNavigator.KeyDown(var Key: Word; Shift: TShiftState);
var
  NewFocus: TNavigateBtn;
  OldFocus: TNavigateBtn;
begin
  OldFocus := FocusedButton;
  case Key of
    VK_RIGHT:
      begin
        NewFocus := FocusedButton;
        repeat
          if NewFocus < High(Buttons) then
            NewFocus := Succ(NewFocus);
        until (NewFocus = High(Buttons)) or (Buttons[NewFocus].Visible);
        if NewFocus <> FocusedButton then
        begin
          FocusedButton := NewFocus;
          Buttons[OldFocus].Invalidate;
          Buttons[FocusedButton].Invalidate;
        end;
      end;
    VK_LEFT:
      begin
        NewFocus := FocusedButton;
        repeat
          if NewFocus > Low(Buttons) then
            NewFocus := Pred(NewFocus);
        until (NewFocus = Low(Buttons)) or (Buttons[NewFocus].Visible);
        if NewFocus <> FocusedButton then
        begin
          FocusedButton := NewFocus;
          Buttons[OldFocus].Invalidate;
          Buttons[FocusedButton].Invalidate;
        end;
      end;
    VK_SPACE:
      begin
        if Buttons[FocusedButton].Enabled then
          Buttons[FocusedButton].Click;
      end;
  end;
end;

procedure TDBNavigator.WMGetDlgCode(var Message: TWMGetDlgCode);
begin
  Message.Result := DLGC_WANTARROWS;
end;

procedure TDBNavigator.DataChanged;
var
  UpEnable, DnEnable: Boolean;
begin
  UpEnable := Enabled and FDataLink.Active and not FDataLink.DataSet.BOF;
  DnEnable := Enabled and FDataLink.Active and not FDataLink.DataSet.EOF;
  Buttons[nbFirst].Enabled := UpEnable;
  Buttons[nbPrior].Enabled := UpEnable;
  Buttons[nbNext].Enabled := DnEnable;
  Buttons[nbLast].Enabled := DnEnable;
  Buttons[nbDelete].Enabled := Enabled and FDataLink.Active and
    FDataLink.DataSet.CanModify and
    not (FDataLink.DataSet.BOF and FDataLink.DataSet.EOF);
end;

procedure TDBNavigator.EditingChanged;
var
  CanModify: Boolean;
begin
  CanModify := Enabled and FDataLink.Active and FDataLink.DataSet.CanModify;
  Buttons[nbInsert].Enabled := CanModify;
  Buttons[nbEdit].Enabled := CanModify and not FDataLink.Editing;
  Buttons[nbPost].Enabled := CanModify and FDataLink.Editing;
  Buttons[nbCancel].Enabled := CanModify and FDataLink.Editing;
  Buttons[nbRefresh].Enabled := CanModify;
end;

procedure TDBNavigator.ActiveChanged;
var
  I: TNavigateBtn;
begin
  if not (Enabled and FDataLink.Active) then
    for I := Low(Buttons) to High(Buttons) do
      Buttons[I].Enabled := False
  else
  begin
    DataChanged;
    EditingChanged;
  end;
end;

procedure TDBNavigator.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  if not (csLoading in ComponentState) then
    ActiveChanged;
end;

procedure TDBNavigator.SetDataSource(Value: TDataSource);
begin
  FDataLink.DataSource := Value;
  if not (csLoading in ComponentState) then
    ActiveChanged;
  if Value <> nil then Value.FreeNotification(Self);
end;

function TDBNavigator.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TDBNavigator.Loaded;
var
  W, H: Integer;
begin
  inherited Loaded;
  W := Width;
  H := Height;
  AdjustSize (W, H);
  if (W <> Width) or (H <> Height) then
    inherited SetBounds (Left, Top, W, H);
  InitHints;
  ActiveChanged;
end;
*)
{TNavButton}
(*
destructor TNavButton.Destroy;
begin
  if FRepeatTimer <> nil then
    FRepeatTimer.Free;
  inherited Destroy;
end;

procedure TNavButton.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited MouseDown (Button, Shift, X, Y);
  if nsAllowTimer in FNavStyle then
  begin
    if FRepeatTimer = nil then
      FRepeatTimer := TTimer.Create(Self);

    FRepeatTimer.OnTimer := TimerExpired;
    FRepeatTimer.Interval := InitRepeatPause;
    FRepeatTimer.Enabled  := True;
  end;
end;

procedure TNavButton.MouseUp(Button: TMouseButton; Shift: TShiftState;
                                  X, Y: Integer);
begin
  inherited MouseUp (Button, Shift, X, Y);
  if FRepeatTimer <> nil then
    FRepeatTimer.Enabled  := False;
end;

procedure TNavButton.TimerExpired(Sender: TObject);
begin
  FRepeatTimer.Interval := RepeatPause;
  if (FState = bsDown) and MouseCapture then
  begin
    try
      Click;
    except
      FRepeatTimer.Enabled := False;
      raise;
    end;
  end;
end;

procedure TNavButton.Paint;
var
  R: TRect;
begin
  inherited Paint;
  if (GetFocus = Parent.Handle) and
     (FIndex = TDBNavigator (Parent).FocusedButton) then
  begin
    R := Bounds(0, 0, Width, Height);
    InflateRect(R, -3, -3);
    if FState = bsDown then
      OffsetRect(R, 1, 1);
    DrawFocusRect(Canvas.Handle, R);
  end;
end;
*)
{ TNavDataLink }
(*
constructor TNavDataLink.Create(ANav: TDBNavigator);
begin
  inherited Create;
  FNavigator := ANav;
end;

destructor TNavDataLink.Destroy;
begin
  FNavigator := nil;
  inherited Destroy;
end;

procedure TNavDataLink.EditingChanged;
begin
  if FNavigator <> nil then FNavigator.EditingChanged;
end;

procedure TNavDataLink.DataSetChanged;
begin
  if FNavigator <> nil then FNavigator.DataChanged;
end;

procedure TNavDataLink.ActiveChanged;
begin
  if FNavigator <> nil then FNavigator.ActiveChanged;
end;
*)
{ TDataSourceLink }

procedure TDataSourceLink.ActiveChanged;
begin
  if FDBLookupControl <> nil then FDBLookupControl.DataLinkActiveChanged;
end;

procedure TDataSourceLink.RecordChanged(Field: TField);
begin
  if FDBLookupControl <> nil then FDBLookupControl.DataLinkRecordChanged(Field);
end;

procedure TDataSourceLink.FocusControl(Field: TFieldRef);
begin
  if (Field^ <> nil) and (Field^ = FDBLookupControl.Field) and
    (FDBLookupControl <> nil) and FDBLookupControl.CanFocus then
  begin
    Field^ := nil;
    FDBLookupControl.SetFocus;
  end;
end;

{ TListSourceLink }

procedure TListSourceLink.ActiveChanged;
begin
  if FDBLookupControl <> nil then FDBLookupControl.ListLinkActiveChanged;
end;

procedure TListSourceLink.DataSetChanged;
begin
  if FDBLookupControl <> nil then FDBLookupControl.ListLinkDataChanged;
end;

{ TDBLookupControl }

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

constructor TDBLookupControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  if NewStyleControls then
    ControlStyle := [csOpaque] else
    ControlStyle := [csOpaque, csFramed];
  ParentColor := False;
  TabStop := True;
  FLookupSource := TDataSource.Create(Self);
  FDataLink := TDataSourceLink.Create;
  FDataLink.FDBLookupControl := Self;
  FListLink := TListSourceLink.Create;
  FListLink.FDBLookupControl := Self;
  FListFields := TList.Create;
  FKeyValue := null;
end;

destructor TDBLookupControl.Destroy;
begin
  FListFields.Free;
  FListLink.FDBLookupControl := nil;
  FListLink.Free;
  FDataLink.FDBLookupControl := nil;
  FDataLink.Free;
  inherited Destroy;
end;

function TDBLookupControl.CanModify: Boolean;
begin
  Result := FListActive and not ReadOnly and ((FDataLink.DataSource = nil) or
    (FMasterField <> nil) and FMasterField.CanModify);
end;

procedure TDBLookupControl.CheckNotCircular;
begin
  if FDataLink.Active and FDataLink.DataSet.IsLinkedTo(ListSource) then
    DatabaseError(SCircularDataLink);
  if FListLink.Active and FListLink.DataSet.IsLinkedTo(DataSource) then
    DatabaseError(SCircularDataLink);
end;

procedure TDBLookupControl.CheckNotLookup;
begin
  if FLookupMode then DatabaseError('Неправильный Lookup');
  if FDataLink.DataSourceFixed then DatabaseError('Фиксированный Datasource');
end;

procedure TDBLookupControl.DataLinkActiveChanged;
begin
  FDataField := nil;
  FMasterField := nil;
  if FDataLink.Active and (FDataFieldName <> '') then
  begin
    CheckNotCircular;
    FDataField := GetFieldProperty(FDataLink.DataSet, Self, FDataFieldName);
    FMasterField := FDataField;
  end;
  SetLookupMode((FDataField <> nil) and (FDataField.FieldKind = fkLookup));
  DataLinkRecordChanged(nil);
end;

procedure TDBLookupControl.DataLinkRecordChanged(Field: TField);
begin
  if (Field = nil) or (Field = FMasterField) then
    if FMasterField <> nil then
      SetKeyValue(FMasterField.Value) else
      SetKeyValue(Null);
end;

function TDBLookupControl.GetBorderSize: Integer;
var
  Params: TCreateParams;
  R: TRect;
begin
  CreateParams(Params);
  SetRect(R, 0, 0, 0, 0);
  AdjustWindowRectEx(R, Params.Style, False, Params.ExStyle);
  Result := R.Bottom - R.Top;
end;

function TDBLookupControl.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

function TDBLookupControl.GetKeyFieldName: string;
begin
  if FLookupMode then Result := '' else Result := FKeyFieldName;
end;

function TDBLookupControl.GetListSource: TDataSource;
begin
  if FLookupMode then Result := nil else Result := FListLink.DataSource;
end;

function TDBLookupControl.GetReadOnly: Boolean;
begin
  Result := FDataLink.ReadOnly;
end;

function TDBLookupControl.GetTextHeight: Integer;
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

procedure TDBLookupControl.KeyValueChanged;
begin
end;

procedure TDBLookupControl.ListLinkActiveChanged;
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

procedure TDBLookupControl.ListLinkDataChanged;
begin
end;

function TDBLookupControl.LocateKey: Boolean;
begin
  Result := False;
  try
    if not VarIsNull(FKeyValue) and
      FListLink.DataSet.Locate(FKeyFieldName, FKeyValue, []) then
      Result := True;
  except
  end;
end;

procedure TDBLookupControl.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Operation = opRemove then
  begin
    if (FDataLink <> nil) and (AComponent = DataSource) then DataSource := nil;
    if (FListLink <> nil) and (AComponent = ListSource) then ListSource := nil;
  end;
end;

procedure TDBLookupControl.ProcessSearchKey(Key: Char);
var
  TickCount: Integer;
  S: string;
begin
  if (FListField <> nil) and (FListField.FieldKind = fkData) and
    (FListField.DataType = ftString) then
    case Key of
      #8, #27: FSearchText := '';
      #32..#255:
        if CanModify then
        begin
          TickCount := GetTickCount;
          if TickCount - SearchTickCount > 2000 then FSearchText := '';
          SearchTickCount := TickCount;
          if Length(FSearchText) < 32 then
          begin
            S := FSearchText + Key;
            if FListLink.DataSet.Locate(FListField.FieldName, S,
              [loCaseInsensitive, loPartialKey]) then
            begin
              SelectKeyValue(FKeyField.Value);
              FSearchText := S;
            end;
          end;
        end;
    end;
end;

procedure TDBLookupControl.SelectKeyValue(const Value: Variant);
begin
  if FMasterField <> nil then
  begin
    if FDataLink.Edit then
      FMasterField.Value := Value;
  end else
    SetKeyValue(Value);
  Repaint;
  Click;
end;

procedure TDBLookupControl.SetDataFieldName(const Value: string);
begin
  if FDataFieldName <> Value then
  begin
    FDataFieldName := Value;
    DataLinkActiveChanged;
  end;
end;

procedure TDBLookupControl.SetDataSource(Value: TDataSource);
begin
  FDataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

procedure TDBLookupControl.SetKeyFieldName(const Value: string);
begin
  CheckNotLookup;
  if FKeyFieldName <> Value then
  begin
    FKeyFieldName := Value;
    ListLinkActiveChanged;
  end;
end;

procedure TDBLookupControl.SetKeyValue(const Value: Variant);
begin
  if not VarEquals(FKeyValue, Value) then
  begin
    FKeyValue := Value;
    KeyValueChanged;
  end;
end;

procedure TDBLookupControl.SetListFieldName(const Value: string);
begin
  if FListFieldName <> Value then
  begin
    FListFieldName := Value;
    ListLinkActiveChanged;
  end;
end;

procedure TDBLookupControl.SetListSource(Value: TDataSource);
begin
  CheckNotLookup;
  FListLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

procedure TDBLookupControl.SetLookupMode(Value: Boolean);
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

procedure TDBLookupControl.SetReadOnly(Value: Boolean);
begin
  FDataLink.ReadOnly := Value;
end;

procedure TDBLookupControl.WMGetDlgCode(var Message: TMessage);
begin
  Message.Result := DLGC_WANTARROWS or DLGC_WANTCHARS;
end;

procedure TDBLookupControl.WMKillFocus(var Message: TMessage);
begin
  FFocused := False;
  Inherited;
  Invalidate;
end;

procedure TDBLookupControl.WMSetFocus(var Message: TMessage);
begin
  FFocused := True;
  Inherited;
  Invalidate;
end;

{ TDBLookupListBox }

constructor TDBLookupListBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csDoubleClicks];
  Width := 121;
  FBorderStyle := bsSingle;
  RowCount := 7;
end;

procedure TDBLookupListBox.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
    if FBorderStyle = bsSingle then
      if NewStyleControls and Ctl3D then
        ExStyle := ExStyle or WS_EX_CLIENTEDGE
      else
        Style := Style or WS_BORDER;
end;

procedure TDBLookupListBox.CreateWnd;
begin
  inherited CreateWnd;
  UpdateScrollBar;
end;

function TDBLookupListBox.GetKeyIndex: Integer;
var
  FieldValue: Variant;
begin
  if not VarIsNull(FKeyValue) then
    for Result := 0 to FRecordCount - 1 do
    begin
      FListLink.ActiveRecord := Result;
      FieldValue := FKeyField.Value;
      FListLink.ActiveRecord := FRecordIndex;
      if VarEquals(FieldValue, FKeyValue) then Exit;
    end;
  Result := -1;
end;

procedure TDBLookupListBox.KeyDown(var Key: Word; Shift: TShiftState);
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
      FSearchText := '';
      if Delta = -Maxint then FListLink.DataSet.First else
        if Delta = Maxint then FListLink.DataSet.Last else
        begin
          KeyIndex := GetKeyIndex;
          if KeyIndex >= 0 then
            FListLink.DataSet.MoveBy(KeyIndex - FRecordIndex)
          else
          begin
            KeyValueChanged;
            Delta := 0;
          end;
          FListLink.DataSet.MoveBy(Delta);
        end;
      SelectCurrent;
    end;
  end;
end;

procedure TDBLookupListBox.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  ProcessSearchKey(Key);
end;

procedure TDBLookupListBox.KeyValueChanged;
begin
  if FListActive and not FLockPosition then
    if not LocateKey then FListLink.DataSet.First;
  if FListField <> nil then
    FSelectedItem := FListField.DisplayText else
    FSelectedItem := '';
end;

procedure TDBLookupListBox.ListLinkActiveChanged;
begin
  try
    inherited;
  finally
    if FListActive then KeyValueChanged else ListLinkDataChanged;
  end;
end;

procedure TDBLookupListBox.ListLinkDataChanged;
begin
  if FListActive then
  begin
    FRecordIndex := FListLink.ActiveRecord;
    FRecordCount := FListLink.RecordCount;
    FKeySelected := not VarIsNull(FKeyValue) or
      not FListLink.DataSet.BOF;
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

procedure TDBLookupListBox.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    FSearchText := '';
    if not FPopup then
    begin
      SetFocus;
      if not FFocused then Exit;
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

procedure TDBLookupListBox.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  if FTracking then
  begin
    SelectItemAt(X, Y);
    FMousePos := Y;
    TimerScroll;
  end;
  inherited MouseMove(Shift, X, Y);
end;

procedure TDBLookupListBox.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  if FTracking then
  begin
    StopTracking;
    SelectItemAt(X, Y);
  end;
  inherited MouseUp(Button, Shift, X, Y);
end;

procedure TDBLookupListBox.Paint;
var
  I, J, W, X, TextWidth, TextHeight, LastFieldIndex: Integer;
  S: string;
  R: TRect;
  Selected: Boolean;
  Field: TField;
begin
  Canvas.Font := Font;
  TextWidth := Canvas.TextWidth('0');
  TextHeight := Canvas.TextHeight('0');
  LastFieldIndex := FListFields.Count - 1;
  if ColorToRGB(Color) <> ColorToRGB(clBtnFace) then
    Canvas.Pen.Color := clBtnFace else
    Canvas.Pen.Color := clBtnShadow;
  for I := 0 to FRowCount - 1 do
  begin
    Canvas.Font.Color := Font.Color;
    Canvas.Brush.Color := Color;
    Selected := not FKeySelected and (I = 0);
    R.Top := I * TextHeight;
    R.Bottom := R.Top + TextHeight;
    if I < FRecordCount then
    begin
      FListLink.ActiveRecord := I;
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
        Field := FListFields[J];
        if J < LastFieldIndex then
          W := Field.DisplayWidth * TextWidth + 4 else
          W := ClientWidth - R.Right;
        S := Field.DisplayText;
        X := 2;
        case Field.Alignment of
          taRightJustify: X := W - Canvas.TextWidth(S) - 3;
          taCenter: X := (W - Canvas.TextWidth(S)) div 2;
        end;
        R.Left := R.Right;
        R.Right := R.Right + W;
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
    if Selected and (FFocused or FPopup) then Canvas.DrawFocusRect(R);
  end;
  if FRecordCount <> 0 then FListLink.ActiveRecord := FRecordIndex;
end;

procedure TDBLookupListBox.SelectCurrent;
begin
  FLockPosition := True;
  try
    SelectKeyValue(FKeyField.Value);
  finally
    FLockPosition := False;
  end;
end;

procedure TDBLookupListBox.SelectItemAt(X, Y: Integer);
var
  Delta: Integer;
begin
  if Y < 0 then Y := 0;
  if Y >= ClientHeight then Y := ClientHeight - 1;
  Delta := Y div GetTextHeight - FRecordIndex;
  FListLink.DataSet.MoveBy(Delta);
  SelectCurrent;
end;

procedure TDBLookupListBox.SetBorderStyle(Value: TBorderStyle);
begin
  if FBorderStyle <> Value then
  begin
    FBorderStyle := Value;
    RecreateWnd;
    RowCount := RowCount;
  end;
end;

procedure TDBLookupListBox.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
var
  BorderSize, TextHeight, Rows: Integer;
begin
  BorderSize := GetBorderSize;
  TextHeight := GetTextHeight;
  Rows := (AHeight - BorderSize) div TextHeight;
  if Rows < 1 then Rows := 1;
  FRowCount := Rows;
  if FListLink.BufferCount <> Rows then
  begin
    FListLink.BufferCount := Rows;
    ListLinkDataChanged;
  end;
  inherited SetBounds(ALeft, ATop, AWidth, Rows * TextHeight + BorderSize);
end;

procedure TDBLookupListBox.SetRowCount(Value: Integer);
begin
  if Value < 1 then Value := 1;
  if Value > 100 then Value := 100;
  Height := Value * GetTextHeight + GetBorderSize;
end;

procedure TDBLookupListBox.StopTimer;
begin
  if FTimerActive then
  begin
    KillTimer(Handle, 1);
    FTimerActive := False;
  end;
end;

procedure TDBLookupListBox.StopTracking;
begin
  if FTracking then
  begin
    StopTimer;
    FTracking := False;
    MouseCapture := False;
  end;
end;

procedure TDBLookupListBox.TimerScroll;
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
    if FListLink.DataSet.MoveBy(Delta) <> 0 then SelectCurrent;
    Interval := 200 - Distance * 15;
    if Interval < 0 then Interval := 0;
    SetTimer(Handle, 1, Interval, nil);
    FTimerActive := True;
  end;
end;

procedure TDBLookupListBox.UpdateScrollBar;
var
  Pos, Max: Integer;
  ScrollInfo: TScrollInfo;
begin
  Pos := 0;
  Max := 0;
  if FRecordCount = FRowCount then
  begin
    Max := 4;
    if not FListLink.DataSet.BOF then
      if not FListLink.DataSet.EOF then Pos := 2 else Pos := 4;
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

procedure TDBLookupListBox.CMCtl3DChanged(var Message: TMessage);
begin
  if NewStyleControls and (FBorderStyle = bsSingle) then
  begin
    RecreateWnd;
    RowCount := RowCount;
  end;
  inherited;
end;

procedure TDBLookupListBox.CMFontChanged(var Message: TMessage);
begin
  inherited;
  Height := Height;
end;

procedure TDBLookupListBox.WMCancelMode(var Message: TMessage);
begin
  StopTracking;
  inherited;
end;

procedure TDBLookupListBox.WMTimer(var Message: TMessage);
begin
  TimerScroll;
end;

procedure TDBLookupListBox.WMVScroll(var Message: TWMVScroll);
begin
  FSearchText := '';
  with Message, FListLink.DataSet do
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

{ TPopupDataList }

constructor TPopupDataList.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csNoDesignVisible, csReplicatable];
  FPopup := True;
end;

procedure TPopupDataList.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style := WS_POPUP or WS_BORDER;
    ExStyle := WS_EX_TOOLWINDOW;
    WindowClass.Style := CS_SAVEBITS;
  end;
end;

procedure TPopupDataList.WMMouseActivate(var Message: TMessage);
begin
  Message.Result := MA_NOACTIVATE;
end;

{ TDBLookupComboBox }

constructor TDBLookupComboBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csReplicatable];
  Width := 145;
  Height := 0;
  FDataList := TPopupDataList.Create(Self);
  FDataList.Visible := False;
  FDataList.Parent := Self;
  FDataList.OnMouseUp := ListMouseUp;
  FButtonWidth := GetSystemMetrics(SM_CXVSCROLL);
  FDropDownRows := 7;
end;

procedure TDBLookupComboBox.CloseUp(Accept: Boolean);
var
  ListValue: Variant;
begin
  if FListVisible then
  begin
    if GetCapture <> 0 then SendMessage(GetCapture, WM_CANCELMODE, 0, 0);
    ListValue := FDataList.KeyValue;
    SetWindowPos(FDataList.Handle, 0, 0, 0, 0, 0, SWP_NOZORDER or
      SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE or SWP_HIDEWINDOW);
    FListVisible := False;
    FDataList.ListSource := nil;
    Invalidate;
    FSearchText := '';
    if Accept and CanModify then SelectKeyValue(ListValue);
    if Assigned(FOnCloseUp) then FOnCloseUp(Self);
  end;
end;

procedure TDBLookupComboBox.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
    if NewStyleControls and Ctl3D then
      ExStyle := ExStyle or WS_EX_CLIENTEDGE
    else
      Style := Style or WS_BORDER;
end;

procedure TDBLookupComboBox.DropDown;
var
  P: TPoint;
  I, Y: Integer;
  S: string;
begin
  if not FListVisible and FListActive then
  begin
    if Assigned(FOnDropDown) then FOnDropDown(Self);
    FDataList.Color := Color;
    FDataList.Font := Font;
    if FDropDownWidth > 0 then
      FDataList.Width := FDropDownWidth else
      FDataList.Width := Width;
    FDataList.ReadOnly := not CanModify;
    FDataList.RowCount := FDropDownRows;
    FDataList.KeyField := FKeyFieldName;
    for I := 0 to FListFields.Count - 1 do
      S := S + TField(FListFields[I]).FieldName + ';';
    FDataList.ListField := S;
    FDataList.ListFieldIndex := FListFields.IndexOf(FListField);
    FDataList.ListSource := FListLink.DataSource;
    FDataList.KeyValue := KeyValue;
    P := Parent.ClientToScreen(Point(Left, Top));
    Y := P.Y + Height;
    if Y + FDataList.Height > Screen.Height then Y := P.Y - FDataList.Height;
    case FDropDownAlign of
      daRight: Dec(P.X, FDataList.Width - Width);
      daCenter: Dec(P.X, (FDataList.Width - Width) div 2);
    end;
    SetWindowPos(FDataList.Handle, HWND_TOP, P.X, Y, 0, 0,
      SWP_NOSIZE or SWP_NOACTIVATE or SWP_SHOWWINDOW);
    FListVisible := True;
    Repaint;
  end;
end;

procedure TDBLookupComboBox.KeyDown(var Key: Word; Shift: TShiftState);
var
  Delta: Integer;
begin
  inherited KeyDown(Key, Shift);
  if FListActive and ((Key = VK_UP) or (Key = VK_DOWN)) then
    if ssAlt in Shift then
    begin
      if FListVisible then CloseUp(True) else DropDown;
      Key := 0;
    end else
      if not FListVisible then
      begin
        if not LocateKey then
          FListLink.DataSet.First
        else
        begin
          if Key = VK_UP then Delta := -1 else Delta := 1;
          FListLink.DataSet.MoveBy(Delta);
        end;
        SelectKeyValue(FKeyField.Value);
        Key := 0;
      end;
  if (Key <> 0) and FListVisible then FDataList.KeyDown(Key, Shift);
end;

procedure TDBLookupComboBox.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  if FListVisible then
    if Key in [#13, #27] then
      CloseUp(Key = #13)
    else
      FDataList.KeyPress(Key)
  else
    ProcessSearchKey(Key);
end;

procedure TDBLookupComboBox.KeyValueChanged;
begin
  if FLookupMode then
  begin
    FText := FDataField.DisplayText;
    FAlignment := FDataField.Alignment;
  end else
  if FListActive and LocateKey then
  begin
    FText := FListField.DisplayText;
    FAlignment := FListField.Alignment;
  end else
  begin
    FText := '';
    FAlignment := taLeftJustify;
  end;
  Invalidate;
end;

procedure TDBLookupComboBox.ListLinkActiveChanged;
begin
  inherited;
  KeyValueChanged;
end;

procedure TDBLookupComboBox.ListMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
    CloseUp(PtInRect(FDataList.ClientRect, Point(X, Y)));
end;

procedure TDBLookupComboBox.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    SetFocus;
    if not FFocused then Exit;
    if FListVisible then CloseUp(False) else
      if FListActive then
      begin
        MouseCapture := True;
        FTracking := True;
        TrackButton(X, Y);
        DropDown;
      end;
  end;
  inherited MouseDown(Button, Shift, X, Y);
end;

procedure TDBLookupComboBox.MouseMove(Shift: TShiftState; X, Y: Integer);
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

procedure TDBLookupComboBox.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  StopTracking;
  inherited MouseUp(Button, Shift, X, Y);
end;

procedure TDBLookupComboBox.Paint;
var
  W, X, Flags: Integer;
  Text: string;
  Alignment: TAlignment;
  Selected: Boolean;
  R: TRect;
begin
  Canvas.Font := Font;
  Canvas.Brush.Color := Color;
  Selected := FFocused and not FListVisible and
    not (csPaintCopy in ControlState);
  if Selected then
  begin
    Canvas.Font.Color := clHighlightText;
    Canvas.Brush.Color := clHighlight;
  end;
  if (csPaintCopy in ControlState) and (FDataField <> nil) then
  begin
    Text := FDataField.DisplayText;
    Alignment := FDataField.Alignment;
  end else
  begin
    Text := FText;
    Alignment := FAlignment;
  end;
  W := ClientWidth - FButtonWidth;
  X := 2;
  case Alignment of
    taRightJustify: X := W - Canvas.TextWidth(Text) - 3;
    taCenter: X := (W - Canvas.TextWidth(Text)) div 2;
  end;
  SetRect(R, 1, 1, W - 1, ClientHeight - 1);
  Canvas.TextRect(R, X, 2, Text);
  if Selected then Canvas.DrawFocusRect(R);
  SetRect(R, W, 0, ClientWidth, ClientHeight);
  if not FListActive then
    Flags := DFCS_SCROLLCOMBOBOX or DFCS_INACTIVE
  else if FPressed then
    Flags := DFCS_SCROLLCOMBOBOX or DFCS_FLAT or DFCS_PUSHED
  else
    Flags := DFCS_SCROLLCOMBOBOX;
  DrawFrameControl(Canvas.Handle, R, DFC_SCROLL, Flags);
end;

procedure TDBLookupComboBox.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited SetBounds(ALeft, ATop, AWidth, GetTextHeight + GetBorderSize + 4);
end;

procedure TDBLookupComboBox.StopTracking;
begin
  if FTracking then
  begin
    TrackButton(-1, -1);
    FTracking := False;
    MouseCapture := False;
  end;
end;

procedure TDBLookupComboBox.TrackButton(X, Y: Integer);
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

procedure TDBLookupComboBox.CMCancelMode(var Message: TCMCancelMode);
begin
  if (Message.Sender <> Self) and (Message.Sender <> FDataList) then
    CloseUp(False);
end;

procedure TDBLookupComboBox.CMCtl3DChanged(var Message: TMessage);
begin
  if NewStyleControls then
  begin
    RecreateWnd;
    Height := 0;
  end;
  inherited;
end;

procedure TDBLookupComboBox.CMFontChanged(var Message: TMessage);
begin
  inherited;
  Height := 0;
end;

procedure TDBLookupComboBox.CMGetDataLink(var Message: TMessage);
begin
  Message.Result := Integer(FDataLink);
end;

procedure TDBLookupComboBox.WMCancelMode(var Message: TMessage);
begin
  StopTracking;
  inherited;
end;

procedure TDBLookupComboBox.WMKillFocus(var Message: TWMKillFocus);
begin
  inherited;
  CloseUp(False);
end;

{ TDBRichEdit }

constructor TDBRichEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  inherited ReadOnly := True;
  FAutoDisplay := True;
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  FDataLink.OnDataChange := DataChange;
  FDataLink.OnEditingChange := EditingChange;
  FDataLink.OnUpdateData := UpdateData;
end;

destructor TDBRichEdit.Destroy;
begin
  FDataLink.Free;
  FDataLink := nil;
  inherited Destroy;
end;

procedure TDBRichEdit.Loaded;
begin
  inherited Loaded;
  if (csDesigning in ComponentState) then DataChange(Self);
end;

procedure TDBRichEdit.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (FDataLink <> nil) and
    (AComponent = DataSource) then DataSource := nil;
end;

procedure TDBRichEdit.BeginEditing;
begin
  if not FDataLink.Editing then
  try
    if FDataLink.Field.IsBlob then
      FDataSave := FDataLink.Field.AsString;
    FDataLink.Edit;
  finally
    FDataSave := '';
  end;
end;

procedure TDBRichEdit.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key, Shift);
  if FMemoLoaded then
  begin
    if (Key = VK_DELETE) or (Key = VK_BACK) or
      ((Key = VK_INSERT) and (ssShift in Shift)) or
      (((Key = Ord('V')) or (Key = Ord('X'))) and (ssCtrl in Shift)) then
      BeginEditing;
  end;
end;

procedure TDBRichEdit.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  if FMemoLoaded then
  begin
    if (Key in [#32..#255]) and (FDataLink.Field <> nil) and
      not FDataLink.Field.IsValidChar(Key) then
    begin
      MessageBeep(0);
      Key := #0;
    end;
    case Key of
      ^H, ^I, ^J, ^M, ^V, ^X, #32..#255:
        BeginEditing;
      #27:
        FDataLink.Reset;
    end;
  end else
  begin
    if Key = #13 then LoadMemo;
    Key := #0;
  end;
end;

procedure TDBRichEdit.Change;
begin
  if FMemoLoaded then FDataLink.Modified;
  FMemoLoaded := True;
  inherited Change;
end;

function TDBRichEdit.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TDBRichEdit.SetDataSource(Value: TDataSource);
begin
  FDataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

function TDBRichEdit.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

procedure TDBRichEdit.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

function TDBRichEdit.GetReadOnly: Boolean;
begin
  Result := FDataLink.ReadOnly;
end;

procedure TDBRichEdit.SetReadOnly(Value: Boolean);
begin
  FDataLink.ReadOnly := Value;
end;

function TDBRichEdit.GetField: TField;
begin
  Result := FDataLink.Field;
end;

procedure TDBRichEdit.LoadMemo;
begin
  if not FMemoLoaded and Assigned(FDataLink.Field) and FDataLink.Field.IsBlob then
  begin
    try
      Lines.Assign(FDataLink.Field);
      FMemoLoaded := True;
    except
      { Rich Edit Load failure }
      on E:EOutOfResources do
        Lines.Text := Format('(%s)', [E.Message]);
    end;
    EditingChange(Self);
  end;
end;

procedure TDBRichEdit.DataChange(Sender: TObject);
begin
  if FDataLink.Field <> nil then
    if FDataLink.Field.IsBlob then
    begin
      if FAutoDisplay or (FDataLink.Editing and FMemoLoaded) then
      begin
        { Check if the data has changed since we read it the first time }
        if (FDataSave <> '') and (FDataSave = FDataLink.Field.AsString) then Exit;
        FMemoLoaded := False;
        LoadMemo;
      end else
      begin
        Text := Format('(%s)', [FDataLink.Field.DisplayLabel]);
        FMemoLoaded := False;
      end;
    end else
    begin
      if FFocused and FDataLink.CanModify then
        Text := FDataLink.Field.Text
      else
        Text := FDataLink.Field.DisplayText;
      FMemoLoaded := True;
    end
  else
  begin
    if csDesigning in ComponentState then Text := Name else Text := '';
    FMemoLoaded := False;
  end;
  if HandleAllocated then
    RedrawWindow(Handle, nil, 0, RDW_INVALIDATE or RDW_ERASE or RDW_FRAME);
end;

procedure TDBRichEdit.EditingChange(Sender: TObject);
begin
  inherited ReadOnly := not (FDataLink.Editing and FMemoLoaded);
end;

procedure TDBRichEdit.UpdateData(Sender: TObject);
begin
  if FDataLink.Field.IsBlob then
    FDataLink.Field.Assign(Lines) else
    FDataLink.Field.AsString := Text;
end;

procedure TDBRichEdit.SetFocused(Value: Boolean);
begin
  if FFocused <> Value then
  begin
    FFocused := Value;
    if not Assigned(FDataLink.Field) or not FDataLink.Field.IsBlob then
      FDataLink.Reset;
  end;
end;

procedure TDBRichEdit.CMEnter(var Message: TCMEnter);
begin
  SetFocused(True);
  inherited;
  if SysLocale.FarEast and FDataLink.CanModify then
    inherited ReadOnly := False;
end;

procedure TDBRichEdit.CMExit(var Message: TCMExit);
begin
  try
    FDataLink.UpdateRecord;
  except
    SetFocus;
    raise;
  end;
  SetFocused(False);
  inherited;
end;

procedure TDBRichEdit.SetAutoDisplay(Value: Boolean);
begin
  if FAutoDisplay <> Value then
  begin
    FAutoDisplay := Value;
    if Value then LoadMemo;
  end;
end;

procedure TDBRichEdit.WMLButtonDblClk(var Message: TWMLButtonDblClk);
begin
  if not FMemoLoaded then LoadMemo else inherited;
end;

procedure TDBRichEdit.WMCut(var Message: TMessage);
begin
  BeginEditing;
  inherited;
end;

procedure TDBRichEdit.WMPaste(var Message: TMessage);
begin
  BeginEditing;
  inherited;
end;

procedure TDBRichEdit.CMGetDataLink(var Message: TMessage);
begin
  Message.Result := Integer(FDataLink);
end;

end.
