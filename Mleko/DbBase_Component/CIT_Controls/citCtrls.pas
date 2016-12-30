unit citCtrls;

{$R-}

interface

uses Messages, Windows, SysUtils, Classes, Controls, Forms, Menus, Graphics, Dialogs,
     Buttons, RTLConsts;

type
  TcitCustomGroupBox = class(TCustomControl)
  private
    procedure CMDialogChar(var Message: TCMDialogChar); message CM_DIALOGCHAR;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
    procedure CMCtl3DChanged(var Message: TMessage); message CM_CTL3DCHANGED;
    procedure WMSize(var Message: TMessage); message WM_SIZE;
  protected
    procedure AlignControls(AControl: TControl; var Rect: TRect); override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TcitGroupBox = class(TcitCustomGroupBox)
  published
    property Align;
    property Caption;
    property Color;
    property Ctl3D;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
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
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
  end;

  TTextLayout = (tlTop, tlCenter, tlBottom);

  TcitCustomLabel = class(TGraphicControl)
  private
    FFocusControl: TWinControl;
    FAlignment: TAlignment;
    FAutoSize: Boolean;
    FLayout: TTextLayout;
    FWordWrap: Boolean;
    FShowAccelChar: Boolean;
    procedure AdjustBounds;
    procedure DoDrawText(var Rect: TRect; Flags: Word);
    function GetTransparent: Boolean;
    procedure SetAlignment(Value: TAlignment);
    procedure SetFocusControl(Value: TWinControl);
    procedure SetShowAccelChar(Value: Boolean);
    procedure SetTransparent(Value: Boolean);
    procedure SetLayout(Value: TTextLayout);
    procedure SetWordWrap(Value: Boolean);
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CMDialogChar(var Message: TCMDialogChar); message CM_DIALOGCHAR;
  protected
    function GetLabelText: string; virtual;
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    procedure Paint; override;
    procedure SetAutoSize(Value: Boolean); virtual;
    property Alignment: TAlignment read FAlignment write SetAlignment
      default taLeftJustify;
    property AutoSize: Boolean read FAutoSize write SetAutoSize default True;
    property FocusControl: TWinControl read FFocusControl write SetFocusControl;
    property ShowAccelChar: Boolean read FShowAccelChar write SetShowAccelChar default True;
    property Transparent: Boolean read GetTransparent write SetTransparent default False;
    property Layout: TTextLayout read FLayout write SetLayout default tlTop;
    property WordWrap: Boolean read FWordWrap write SetWordWrap default False;
  public
    constructor Create(AOwner: TComponent); override;
    property Canvas;
  end;

  TcitLabel = class(TcitCustomLabel)
  published
    property Align;
    property Alignment;
    property AutoSize;
    property Caption;
    property Color;
    property DragCursor;
    property DragMode;
    property Enabled;
    property FocusControl;
    property Font;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowAccelChar;
    property ShowHint;
    property Transparent;
    property Layout;
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

  TEditCharCase = (ecNormal, ecUpperCase, ecLowerCase);
  TLinkedLabelAlignment = (laLeft, laRight, laTop, laBottom);
  TLinkedButtonAlignment = (baRight, baLeft);
  TLBtnGlyphKind = (gkDots, gkArrow, gkTwoArrows, gkNative, gkUserDefined);
  TNumGlyphs = Buttons.TNumGlyphs;

  TcitCustomEdit = class(TWinControl)
  private
    FMaxLength: Integer;
    FBorderStyle: TBorderStyle;
    FPasswordChar: Char;
    FReadOnly: Boolean;
    FAutoSize: Boolean;
    FAutoSelect: Boolean;
    FHideSelection: Boolean;
    FOEMConvert: Boolean;
    FCharCase: TEditCharCase;
    FCreating: Boolean;
    FModified: Boolean;
    FOnChange: TNotifyEvent;
    FLinkedLabel: TcitLabel;
    FLinkedLabelAlignment: TLinkedLabelAlignment;
    FLinkedButtonAlignment: TLinkedButtonAlignment;
    FLinkedButton: TSpeedButton;
    FLBtnDown: Boolean;
    FLBtnGroupIndex: integer;
    FLBtnGlyphKind: TLBtnGlyphKind;
    FLBtnShortCut1: TShortCut;
    FLBtnShortCut2: TShortCut;
    FLinkedLabelCaption: string;
    FLinkedButtonCaption: string;
    FLinkedButtonWidth: integer;
    FLinkedLabelWidth: integer;
    FLinkedLabelFont: TFont;
    FLinkedLabelRequiredFont: TFont;
    FRequired: boolean;
    FVariant1, FVariant2 : Variant;
    procedure AdjustHeight;
    procedure DefaultHandler(var Message); override;
    function GetModified: Boolean;
    function GetLinkedButtonGlyph : TBitmap;
    function GetLinkedLabelWidth : integer;
    function GetLBtnAllowAllUp: Boolean;
    function GetNumGlyphs: TNumGlyphs;
    function GetLinkedButtonFlat : Boolean;
    function GetEnabled: Boolean;
    function GetVisible: Boolean;
    procedure SetAutoSize(Value: Boolean);
    procedure SetBorderStyle(Value: TBorderStyle);
    procedure SetCharCase(Value: TEditCharCase);
    procedure SetHideSelection(Value: Boolean);
    procedure SetMaxLength(Value: Integer);
    procedure SetModified(Value: Boolean);
    procedure SetOEMConvert(Value: Boolean);
    procedure SetPasswordChar(Value: Char);
    procedure SetReadOnly(Value: Boolean);
    procedure SetLinkedLabelAlignment(Value: TLinkedLabelAlignment);
    procedure SetLinkedButtonAlignment(Value: TLinkedButtonAlignment);
    procedure SetOwnesLButton(Value: Boolean);
    procedure SetOwnesLLabel(Value: Boolean);
    procedure SetLBtnDown(Value: Boolean);
    procedure SetLBtnGroupIndex(Value: Integer);
    procedure SetLBtnGlyphKind(Value: TLBtnGlyphKind);
    procedure SetLBtnAllowAllUp(Value: Boolean);
    procedure SetEnabled(Value : Boolean);
    procedure SetVisible(Value : Boolean);
    procedure SetLinkedButtonWidth(Value : integer);
    procedure SetLinkedLabelWidth(Value : integer);
    procedure SetLinkedLabelFont(Value: TFont);
    procedure SetLinkedLabelRequiredFont(Value: TFont);
    procedure SetRequired(Value: boolean);
    procedure SetLinkedButtonFlat(Value : Boolean);
    procedure SetLinkedButtonGlyph(Value : TBitMap);
    procedure SetLinkedLabelCaption(Value : string);
    procedure SetLinkedButtonCaption(Value : string);
    procedure SetNumGlyphs(Value: TNumGlyphs);
    procedure SetSelText(const Value: string);
    procedure UpdateHeight;
    procedure AlignLabel;
    procedure AlignButton;
    procedure WMSetFont(var Message: TWMSetFont); message WM_SETFONT;
    procedure CMCtl3DChanged(var Message: TMessage); message CM_CTL3DCHANGED;
    procedure CMEnter(var Message: TCMGotFocus); message CM_ENTER;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CNCommand(var Message: TWMCommand); message CN_COMMAND;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
    procedure WMMove(var Message: TMessage); message WM_MOVE;
    procedure WMSize(var Message: TMessage); message WM_SIZE;

  protected
    FOwnesLButton: Boolean;
    FOwnesLLabel: Boolean;
    FOnPushButton : TNotifyEvent;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure ButtonPushed(Sender : TObject); virtual;
    procedure Change; dynamic;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure DestroyWnd; override;
    procedure DoSetMaxLength(Value: Integer); virtual;
    function GetSelLength: Integer; virtual;
    function GetSelStart: Integer; virtual;
    function GetSelText: string; virtual;
    procedure SetSelLength(Value: Integer); virtual;
    procedure SetSelStart(Value: Integer); virtual;
    property AutoSelect: Boolean read FAutoSelect write FAutoSelect default True;
    property AutoSize: Boolean read FAutoSize write SetAutoSize default True;
    property BorderStyle: TBorderStyle read FBorderStyle write SetBorderStyle default bsSingle;
    property CharCase: TEditCharCase read FCharCase write SetCharCase default ecNormal;
    property HideSelection: Boolean read FHideSelection write SetHideSelection default True;
    property MaxLength: Integer read FMaxLength write SetMaxLength default 0;
    property OEMConvert: Boolean read FOEMConvert write SetOEMConvert default False;
    property PasswordChar: Char read FPasswordChar write SetPasswordChar default #0;
    property ParentColor default False;
    property ReadOnly: Boolean read FReadOnly write SetReadOnly default False;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnPushButton: TNotifyEvent read FOnPushButton write FOnPushButton;
    function IsStored: boolean;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Clear; virtual;
    procedure ClearSelection;
    procedure CopyToClipboard;
    procedure CutToClipboard;
    procedure PasteFromClipboard;
    function GetSelTextBuf(Buffer: PChar; BufSize: Integer): Integer; virtual;
    procedure SelectAll;
    procedure SetSelTextBuf(Buffer: PChar);
    property Modified: Boolean read GetModified write SetModified;
    property SelLength: Integer read GetSelLength write SetSelLength;
    property SelStart: Integer read GetSelStart write SetSelStart;
    property SelText: string read GetSelText write SetSelText;
    property Text;
    property LLblAlignment: TLinkedLabelAlignment
             read FLinkedLabelAlignment write SetLinkedLabelAlignment;// default laLeft;
    property LBtnAlignment: TLinkedButtonAlignment
             read FLinkedButtonAlignment write SetLinkedButtonAlignment;// default baRight;
    property OwnesLButton: Boolean read FOwnesLButton write SetOwnesLButton;
    property OwnesLLabel: Boolean read FOwnesLLabel write SetOwnesLLabel;
    property LBtnWidth: integer read FLinkedButtonWidth write SetLinkedButtonWidth;
    property LBtnFlat: Boolean read GetLinkedButtonFlat write SetLinkedButtonFlat
                                                            default True;
    property LBtnGroupIndex: integer read FLBtnGroupIndex write SetLBtnGroupIndex;
    property LBtnDown: Boolean read FLBtnDown write SetLBtnDown;
    property LBtnAllowAllUp: Boolean read GetLBtnAllowAllUp write SetLBtnAllowAllUp;
    property LBtnCaption: string read FLinkedButtonCaption write SetLinkedButtonCaption;
    property LBtnGlyphKind: TLBtnGlyphKind read FLBtnGlyphKind write SetLBtnGlyphKind;
    property LBtnGlyph: TBitmap read GetLinkedButtonGlyph write SetLinkedButtonGlyph stored IsStored;
    property LBtnNumGlyphs: TNumGlyphs read GetNumGlyphs write SetNumGlyphs
                                                            default 1;
    property LBtnShortCut1: TShortCut read FLBtnShortCut1 write FLBtnShortCut1;
    property LBtnShortCut2: TShortCut read FLBtnShortCut2 write FLBtnShortCut2;
    property LLblCaption: string read FLinkedLabelCaption write SetLinkedLabelCaption;
    property LLblWidth: integer read GetLinkedLabelWidth write SetLinkedLabelWidth;
    property LLblFont: TFont read FLinkedLabelFont write SetLinkedLabelFont;
    property LLblRequiredFont: TFont read FLinkedLabelRequiredFont write SetLinkedLabelRequiredFont;
    property Required: boolean read FRequired write SetRequired;
    property Enabled: Boolean read GetEnabled write SetEnabled;
    property Visible: Boolean read GetVisible write SetVisible;
    property Variant1: Variant read FVariant1 write FVariant1;
    property Variant2: Variant read FVariant2 write FVariant2;

  published
    property TabStop default True;
  end;

  TcitEdit = class(TcitCustomEdit)
  published
    property AutoSelect;
    property AutoSize;
    property BorderStyle;
    property CharCase;
    property Color;
    property Ctl3D;
    property DragCursor;
    property DragMode;
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
    property LBtnGlyphKind;
    property LBtnGlyph;
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
    property ReadOnly;
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

  TScrollStyle = (ssNone, ssHorizontal, ssVertical, ssBoth);

  TcitCustomMemo = class(TcitCustomEdit)
  private
    FLines: TStrings;
    FAlignment: TAlignment;
    FScrollBars: TScrollStyle;
    FWordWrap: Boolean;
    FWantReturns: Boolean;
    FWantTabs: Boolean;
    procedure WMGetDlgCode(var Message: TWMGetDlgCode); message WM_GETDLGCODE;
    procedure WMNCDestroy(var Message: TWMNCDestroy); message WM_NCDESTROY;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWindowHandle(const Params: TCreateParams); override;
    procedure KeyPress(var Key: Char); override;
    procedure Loaded; override;
    procedure SetAlignment(Value: TAlignment);
    procedure SetLines(Value: TStrings);
    procedure SetScrollBars(Value: TScrollStyle);
    procedure SetWordWrap(Value: Boolean);
    property Alignment: TAlignment read FAlignment write SetAlignment default taLeftJustify;
    property ScrollBars: TScrollStyle read FScrollBars write SetScrollBars default ssNone;
    property WantReturns: Boolean read FWantReturns write FWantReturns default True;
    property WantTabs: Boolean read FWantTabs write FWantTabs default False;
    property WordWrap: Boolean read FWordWrap write SetWordWrap default True;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Lines: TStrings read FLines write SetLines;
  end;

  TcitMemo = class(TcitCustomMemo)
  published
    property Align;
    property Alignment;
    property BorderStyle;
    property Color;
    property Ctl3D;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property HideSelection;
    property ImeMode;
    property ImeName;
    property Lines;
    property MaxLength;
    property OEMConvert;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly;
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
    property OnStartDrag;
  end;

  TComboBoxStyle = (csDropDown, csSimple, csDropDownList, csOwnerDrawFixed,
    csOwnerDrawVariable);
  TOwnerDrawState = set of (odSelected, odGrayed, odDisabled, odChecked,
    odFocused);

  TDrawItemEvent = procedure(Control: TWinControl; Index: Integer;
    Rect: TRect; State: TOwnerDrawState) of object;

  TMeasureItemEvent = procedure(Control: TWinControl; Index: Integer;
    var Height: Integer) of object;

  TcitCustomComboBox = class(TWinControl)
  private
    FItems: TStrings;
    FCanvas: TCanvas;
    FSorted: Boolean;
    FStyle: TComboBoxStyle;
    FItemHeight: Integer;
    FMaxLength: Integer;
    FDropDownCount: Integer;
    FEditHandle: HWnd;
    FListHandle: HWnd;
    FEditInstance: Pointer;
    FListInstance: Pointer;
    FDefEditProc: Pointer;
    FDefListProc: Pointer;
    FIsFocused: Boolean;
    FFocusChanged: Boolean;
    FSaveItems: TStringList;
    FOnChange: TNotifyEvent;
    FOnDropDown: TNotifyEvent;
    FOnDrawItem: TDrawItemEvent;
    FOnMeasureItem: TMeasureItemEvent;
    procedure AdjustDropDown;
    procedure EditWndProc(var Message: TMessage);
    function GetDroppedDown: Boolean;
    function GetItemIndex: Integer;
    function GetSelLength: Integer;
    function GetSelStart: Integer;
    function GetSelText: string;
    procedure ListWndProc(var Message: TMessage);
    procedure SetDroppedDown(Value: Boolean);
    procedure SetItems(Value: TStrings);
    procedure SetItemIndex(Value: Integer);
    procedure SetSelLength(Value: Integer);
    procedure SetSelStart(Value: Integer);
    procedure SetSelText(const Value: string);
    procedure SetSorted(Value: Boolean);
    function  GetItemHeight: Integer;
    procedure SetItemHeight(Value: Integer);
    procedure SetMaxLength(Value: Integer);
    procedure WMCreate(var Message: TWMCreate); message WM_CREATE;
    procedure WMEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
    procedure CMCancelMode(var Message: TCMCancelMode); message CM_CANCELMODE;
    procedure CMCtl3DChanged(var Message: TMessage); message CM_CTL3DCHANGED;
    procedure CMParentColorChanged(var Message: TMessage); message CM_PARENTCOLORCHANGED;
    procedure CNCommand(var Message: TWMCommand); message CN_COMMAND;
    procedure CNDrawItem(var Message: TWMDrawItem); message CN_DRAWITEM;
    procedure CNMeasureItem(var Message: TWMMeasureItem); message CN_MEASUREITEM;
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure WMDrawItem(var Message: TWMDrawItem); message WM_DRAWITEM;
    procedure WMMeasureItem(var Message: TWMMeasureItem); message WM_MEASUREITEM;
    procedure WMDeleteItem(var Message: TWMDeleteItem); message WM_DELETEITEM;
    procedure WMGetDlgCode(var Message: TWMGetDlgCode); message WM_GETDLGCODE;
  protected
    procedure ComboWndProc(var Message: TMessage; ComboWnd: HWnd;
      ComboProc: Pointer); virtual;
    procedure WndProc(var Message: TMessage); override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure DestroyWnd; override;
    procedure DrawItem(Index: Integer; Rect: TRect;
      State: TOwnerDrawState); virtual;
    procedure MeasureItem(Index: Integer; var Height: Integer); virtual;
    procedure Change; dynamic;
    procedure DropDown; dynamic;
    procedure SetStyle(Value: TComboBoxStyle); virtual;
    property DropDownCount: Integer read FDropDownCount write FDropDownCount default 8;
    property EditHandle: HWnd read FEditHandle;
    property ItemHeight: Integer read GetItemHeight write SetItemHeight;
    property ListHandle: HWnd read FListHandle;
    property MaxLength: Integer read FMaxLength write SetMaxLength default 0;
    property ParentColor default False;
    property Sorted: Boolean read FSorted write SetSorted default False;
    property Style: TComboBoxStyle read FStyle write SetStyle default csDropDown;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnDropDown: TNotifyEvent read FOnDropDown write FOnDropDown;
    property OnDrawItem: TDrawItemEvent read FOnDrawItem write FOnDrawItem;
    property OnMeasureItem: TMeasureItemEvent read FOnMeasureItem write FOnMeasureItem;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Clear;
    procedure SelectAll;
    property Canvas: TCanvas read FCanvas;
    property DroppedDown: Boolean read GetDroppedDown write SetDroppedDown;
    property Items: TStrings read FItems write SetItems;
    property ItemIndex: Integer read GetItemIndex write SetItemIndex;
    property SelLength: Integer read GetSelLength write SetSelLength;
    property SelStart: Integer read GetSelStart write SetSelStart;
    property SelText: string read GetSelText write SetSelText;
  published
    property TabStop default True;
  end;

  TcitComboBox = class(TcitCustomComboBox)
  published
    property Style; {Must be published before Items}
    property Color;
    property Ctl3D;
    property DragMode;
    property DragCursor;
    property DropDownCount;
    property Enabled;
    property Font;
    property ImeMode;
    property ImeName;
    property ItemHeight;
    property Items;
    property MaxLength;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property Sorted;
    property TabOrder;
    property TabStop;
    property Text;
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

  TcitButtonControl = class(TWinControl)
  private
    FClicksDisabled: Boolean;
  protected
    procedure WndProc(var Message: TMessage); override;
  end;

  TcitButton = class(TcitButtonControl)
  private
    FDefault: Boolean;
    FCancel: Boolean;
    FActive: Boolean;
    FModalResult: TModalResult;
    procedure SetDefault(Value: Boolean);
    procedure CMDialogKey(var Message: TCMDialogKey); message CM_DIALOGKEY;
    procedure CMDialogChar(var Message: TCMDialogChar); message CM_DIALOGCHAR;
    procedure CMFocusChanged(var Message: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure CNCommand(var Message: TWMCommand); message CN_COMMAND;
    procedure WMEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure SetButtonStyle(ADefault: Boolean); virtual;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Click; override;
  published
    property Cancel: Boolean read FCancel write FCancel default False;
    property Caption;
    property Default: Boolean read FDefault write SetDefault default False;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property ModalResult: TModalResult read FModalResult write FModalResult default 0;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop default True;
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

  TCheckBoxState = (cbUnchecked, cbChecked, cbGrayed);

  TcitCustomCheckBox = class(TcitButtonControl)
  private
    FAlignment: TLeftRight;
    FAllowGrayed: Boolean;
    FState: TCheckBoxState;
    function GetChecked: Boolean;
    procedure SetAlignment(Value: TLeftRight);
    procedure SetChecked(Value: Boolean);
    procedure SetState(Value: TCheckBoxState);
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
    procedure WMSize(var Message: TMessage); message WM_SIZE;
    procedure CMCtl3DChanged(var Message: TMessage); message CM_CTL3DCHANGED;
    procedure CMDialogChar(var Message: TCMDialogChar); message CM_DIALOGCHAR;
    procedure CNCommand(var Message: TWMCommand); message CN_COMMAND;
  protected
    procedure Toggle; virtual;
    procedure Click; override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWindowHandle(const Params: TCreateParams); override;
    procedure CreateWnd; override;
    property Alignment: TLeftRight read FAlignment write SetAlignment default taRightJustify;
    property AllowGrayed: Boolean read FAllowGrayed write FAllowGrayed default False;
    property Checked: Boolean read GetChecked write SetChecked stored False;
    property State: TCheckBoxState read FState write SetState default cbUnchecked;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property TabStop default True;
  end;

  TcitCheckBox = class(TcitCustomCheckBox)
  published
    property Alignment;
    property AllowGrayed;
    property Caption;
    property Checked;
    property Color;
    property Ctl3D;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property State;
    property TabOrder;
    property TabStop;
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

  TcitRadioButton = class(TcitButtonControl)
  private
    FAlignment: TLeftRight;
    FChecked: Boolean;
    procedure SetAlignment(Value: TLeftRight);
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
    procedure CMCtl3DChanged(var Message: TMessage); message CM_CTL3DCHANGED;
    procedure CMDialogChar(var Message: TCMDialogChar); message CM_DIALOGCHAR;
    procedure CNCommand(var Message: TWMCommand); message CN_COMMAND;
  protected
    procedure SetChecked(Value: Boolean);
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWindowHandle(const Params: TCreateParams); override;
    procedure CreateWnd; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Alignment: TLeftRight read FAlignment write SetAlignment default taRightJustify;
    property Caption;
    property Checked: Boolean read FChecked write SetChecked default False;
    property Color;
    property Ctl3D;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
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

  TListBoxStyle = (lbStandard, lbOwnerDrawFixed, lbOwnerDrawVariable);

  TcitCustomListBox = class(TWinControl)
  private
    FItems: TStrings;
    FBorderStyle: TBorderStyle;
    FCanvas: TCanvas;
    FColumns: Integer;
    FItemHeight: Integer;
    FStyle: TListBoxStyle;
    FIntegralHeight: Boolean;
    FMultiSelect: Boolean;
    FSorted: Boolean;
    FExtendedSelect: Boolean;
    FTabWidth: Integer;
    FSaveItems: TStringList;
    FSaveTopIndex: Integer;
    FSaveItemIndex: Integer;
    FOnDrawItem: TDrawItemEvent;
    FOnMeasureItem: TMeasureItemEvent;
    function GetItemHeight: Integer;
    function GetItemIndex: Integer;
    function GetSelCount: Integer;
    function GetSelected(Index: Integer): Boolean;
    function GetTopIndex: Integer;
    procedure SetBorderStyle(Value: TBorderStyle);
    procedure SetColumnWidth;
    procedure SetColumns(Value: Integer);
    procedure SetExtendedSelect(Value: Boolean);
    procedure SetIntegralHeight(Value: Boolean);
    procedure SetItemHeight(Value: Integer);
    procedure SetItems(Value: TStrings);
    procedure SetItemIndex(Value: Integer);
    procedure SetMultiSelect(Value: Boolean);
    procedure SetSelected(Index: Integer; Value: Boolean);
    procedure SetSorted(Value: Boolean);
    procedure SetStyle(Value: TListBoxStyle);
    procedure SetTabWidth(Value: Integer);
    procedure SetTopIndex(Value: Integer);
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure CNCommand(var Message: TWMCommand); message CN_COMMAND;
    procedure CNDrawItem(var Message: TWMDrawItem); message CN_DRAWITEM;
    procedure CNMeasureItem(var Message: TWMMeasureItem); message CN_MEASUREITEM;
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure CMCtl3DChanged(var Message: TMessage); message CM_CTL3DCHANGED;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure DestroyWnd; override;
    procedure WndProc(var Message: TMessage); override;
    procedure DragCanceled; override;
    procedure DrawItem(Index: Integer; Rect: TRect;
      State: TOwnerDrawState); virtual;
    procedure MeasureItem(Index: Integer; var Height: Integer); virtual;
    function GetItemData(Index: Integer): LongInt; dynamic;
    procedure SetItemData(Index: Integer; AData: LongInt); dynamic;
    procedure ResetContent; dynamic;
    procedure DeleteString(Index: Integer); dynamic;
    property BorderStyle: TBorderStyle read FBorderStyle write SetBorderStyle default bsSingle;
    property Columns: Integer read FColumns write SetColumns default 0;
    property ExtendedSelect: Boolean read FExtendedSelect write SetExtendedSelect default True;
    property IntegralHeight: Boolean read FIntegralHeight write SetIntegralHeight default False;
    property ItemHeight: Integer read GetItemHeight write SetItemHeight;
    property MultiSelect: Boolean read FMultiSelect write SetMultiSelect default False;
    property ParentColor default False;
    property Sorted: Boolean read FSorted write SetSorted default False;
    property Style: TListBoxStyle read FStyle write SetStyle default lbStandard;
    property TabWidth: Integer read FTabWidth write SetTabWidth default 0;
    property OnDrawItem: TDrawItemEvent read FOnDrawItem write FOnDrawItem;
    property OnMeasureItem: TMeasureItemEvent read FOnMeasureItem write FOnMeasureItem;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Clear;
    function ItemAtPos(Pos: TPoint; Existing: Boolean): Integer;
    function ItemRect(Index: Integer): TRect;
    property Canvas: TCanvas read FCanvas;
    property Items: TStrings read FItems write SetItems;
    property ItemIndex: Integer read GetItemIndex write SetItemIndex;
    property SelCount: Integer read GetSelCount;
    property Selected[Index: Integer]: Boolean read GetSelected write SetSelected;
    property TopIndex: Integer read GetTopIndex write SetTopIndex;
  published
    property TabStop default True;
  end;

  TcitListBox = class(TcitCustomListBox)
  published
    property Align;
    property BorderStyle;
    property Color;
    property Columns;
    property Ctl3D;
    property DragCursor;
    property DragMode;
    property Enabled;
    property ExtendedSelect;
    property Font;
    property ImeMode;
    property ImeName;
    property IntegralHeight;
    property ItemHeight;
    property Items;
    property MultiSelect;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property Sorted;
    property Style;
    property TabOrder;
    property TabStop;
    property TabWidth;
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

  TScrollCode = (scLineUp, scLineDown, scPageUp, scPageDown, scPosition,
    scTrack, scTop, scBottom, scEndScroll);

  TScrollEvent = procedure(Sender: TObject; ScrollCode: TScrollCode;
    var ScrollPos: Integer) of object;

  TcitScrollBar = class(TWinControl)
  private
    FKind: TScrollBarKind;
    FPosition: Integer;
    FMin: Integer;
    FMax: Integer;
    FSmallChange: TScrollBarInc;
    FLargeChange: TScrollBarInc;
    FOnChange: TNotifyEvent;
    FOnScroll: TScrollEvent;
    procedure DoScroll(var Message: TWMScroll);
    procedure SetKind(Value: TScrollBarKind);
    procedure SetMax(Value: Integer);
    procedure SetMin(Value: Integer);
    procedure SetPosition(Value: Integer);
    procedure CNHScroll(var Message: TWMHScroll); message CN_HSCROLL;
    procedure CNVScroll(var Message: TWMVScroll); message CN_VSCROLL;
    procedure CNCtlColorScrollBar(var Message: TMessage); message CN_CTLCOLORSCROLLBAR;
    procedure WMEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure Change; dynamic;
    procedure Scroll(ScrollCode: TScrollCode; var ScrollPos: Integer); dynamic;
  public
    constructor Create(AOwner: TComponent); override;
    procedure SetParams(APosition, AMin, AMax: Integer);
  published
    property Ctl3D;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Kind: TScrollBarKind read FKind write SetKind default sbHorizontal;
    property LargeChange: TScrollBarInc read FLargeChange write FLargeChange default 1;
    property Max: Integer read FMax write SetMax default 100;
    property Min: Integer read FMin write SetMin default 0;
    property ParentCtl3D;
    property ParentShowHint;
    property PopupMenu;
    property Position: Integer read FPosition write SetPosition default 0;
    property ShowHint;
    property SmallChange: TScrollBarInc read FSmallChange write FSmallChange default 1;
    property TabOrder;
    property TabStop default True;
    property Visible;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnScroll: TScrollEvent read FOnScroll write FOnScroll;
    property OnStartDrag;
  end;

  TStaticBorderStyle = (sbsNone, sbsSingle, sbsSunken);

  TCustomStaticText = class(TWinControl)
  private
    FAlignment: TAlignment;
    FAutoSize: Boolean;
    FBorderStyle: TStaticBorderStyle;
    FFocusControl: TWinControl;
    FShowAccelChar: Boolean;
    procedure CMDialogChar(var Message: TCMDialogChar); message CM_DIALOGCHAR;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
    procedure AdjustBounds;
    procedure SetAlignment(Value: TAlignment);
    procedure SetAutoSize(Value: Boolean);
    procedure SetBorderStyle(Value: TStaticBorderStyle);
    procedure SetFocusControl(Value: TWinControl);
    procedure SetShowAccelChar(Value: Boolean);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    property Alignment: TAlignment read FAlignment write SetAlignment
      default taLeftJustify;
    property AutoSize: Boolean read FAutoSize write SetAutoSize default True;
    property BorderStyle: TStaticBorderStyle read FBorderStyle
      write SetBorderStyle default sbsNone;
    property FocusControl: TWinControl read FFocusControl write SetFocusControl;
    property ShowAccelChar: Boolean read FShowAccelChar write SetShowAccelChar
      default True;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TStaticText = class(TCustomStaticText)
  published
    property Align;
    property Alignment;
    property AutoSize;
    property BorderStyle;
    property Caption;
    property Color;
    property DragCursor;
    property DragMode;
    property Enabled;
    property FocusControl;
    property Font;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowAccelChar;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
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

implementation

{$R BTN.RES}

uses Consts;

function HasPopup(Control: TControl): Boolean;
begin
  Result := True;
  while Control <> nil do
    if TcitCustomEdit(Control).PopupMenu <> nil then Exit else Control := Control.Parent;
  Result := False;
end;

type
  TSelection = record
    StartPos, EndPos: Integer;
  end;

  TMemoStrings = class(TStrings)
  private
    Memo: TcitCustomMemo;
  protected
    function Get(Index: Integer): string; override;
    function GetCount: Integer; override;
    function GetTextStr: string; override;
    procedure Put(Index: Integer; const S: string); override;
    procedure SetTextStr(const Value: string); override;
    procedure SetUpdateState(Updating: Boolean); override;
  public
    procedure Clear; override;
    procedure Delete(Index: Integer); override;
    procedure Insert(Index: Integer; const S: string); override;
  end;

  TComboBoxStrings = class(TStrings)
  private
    ComboBox: TcitCustomComboBox;
  protected
    function Get(Index: Integer): string; override;
    function GetCount: Integer; override;
    function GetObject(Index: Integer): TObject; override;
    procedure PutObject(Index: Integer; AObject: TObject); override;
    procedure SetUpdateState(Updating: Boolean); override;
  public
    function Add(const S: string): Integer; override;
    procedure Clear; override;
    procedure Delete(Index: Integer); override;
    procedure Insert(Index: Integer; const S: string); override;
  end;

  TListBoxStrings = class(TStrings)
  private
    ListBox: TcitCustomListBox;
  protected
    procedure Put(Index: Integer; const S: string); override;
    function Get(Index: Integer): string; override;
    function GetCount: Integer; override;
    function GetObject(Index: Integer): TObject; override;
    procedure PutObject(Index: Integer; AObject: TObject); override;
    procedure SetUpdateState(Updating: Boolean); override;
  public
    function Add(const S: string): Integer; override;
    procedure Clear; override;
    procedure Delete(Index: Integer); override;
    procedure Insert(Index: Integer; const S: string); override;
  end;

const
  BorderStyles: array[TBorderStyle] of Longint = (0, WS_BORDER);

{ TCustomGroupBox }

constructor TcitCustomGroupBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := [csAcceptsControls, csCaptureMouse, csClickEvents,
    csSetCaption, csDoubleClicks, csReplicatable];
  Width := 185;
  Height := 105;
end;

procedure TcitCustomGroupBox.AlignControls(AControl: TControl; var Rect: TRect);
begin
  Canvas.Font := Font;
  Inc(Rect.Top, Canvas.TextHeight('0'));
  InflateRect(Rect, -1, -1);
  if Ctl3d then InflateRect(Rect, -1, -1);
  inherited AlignControls(AControl, Rect);
end;

procedure TcitCustomGroupBox.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params.WindowClass do
    style := style and not (CS_HREDRAW or CS_VREDRAW);
end;

procedure TcitCustomGroupBox.Paint;
var
  H: Integer;
  R: TRect;
begin
  with Canvas do
  begin
    Font := Self.Font;
    H := TextHeight('0');
    R := Rect(0, H div 2 - 1, Width, Height);
    if Ctl3D then
    begin
      Inc(R.Left);
      Inc(R.Top);
      Brush.Color := clBtnHighlight;
      FrameRect(R);
      OffsetRect(R, -1, -1);
      Brush.Color := clBtnShadow;
    end else
      Brush.Color := clWindowFrame;
    FrameRect(R);
    if Text <> '' then
    begin
      R := Rect(8, 0, 0, H);
      DrawText(Handle, PChar(Text), Length(Text), R, DT_LEFT or DT_SINGLELINE or
        DT_CALCRECT);
      Brush.Color := Color;
      DrawText(Handle, PChar(Text), Length(Text), R, DT_LEFT or DT_SINGLELINE);
    end;
  end;
end;

procedure TcitCustomGroupBox.CMDialogChar(var Message: TCMDialogChar);
begin
  with Message do
    if IsAccel(CharCode, Caption) and CanFocus then
    begin
      SelectFirst;
      Result := 1;
    end else
      inherited;
end;

procedure TcitCustomGroupBox.CMTextChanged(var Message: TMessage);
begin
  Invalidate;
  Realign;
end;

procedure TcitCustomGroupBox.CMCtl3DChanged(var Message: TMessage);
begin
  inherited;
  Invalidate;
  Realign;
end;

procedure TcitCustomGroupBox.WMSize(var Message: TMessage);
begin
  inherited;
  Invalidate;
end;

{ TcitCustomLabel }

constructor TcitCustomLabel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csOpaque, csReplicatable];
  Width := 65;
  Height := 17;
  FAutoSize := True;
  FShowAccelChar := True;
end;

function TcitCustomLabel.GetLabelText: string;
begin
  Result := Caption;
end;

procedure TcitCustomLabel.DoDrawText(var Rect: TRect; Flags: Word);
var
  Text: string;
begin
  Text := GetLabelText;
  if (Flags and DT_CALCRECT <> 0) and ((Text = '') or FShowAccelChar and
    (Text[1] = '&') and (Text[2] = #0)) then Text := Text + ' ';
  if not FShowAccelChar then Flags := Flags or DT_NOPREFIX;
  Canvas.Font := Font;
  if not Enabled then
  begin
    OffsetRect(Rect, 1, 1);
    Canvas.Font.Color := clBtnHighlight;
    DrawText(Canvas.Handle, PChar(Text), Length(Text), Rect, Flags);
    OffsetRect(Rect, -1, -1);
    Canvas.Font.Color := clBtnShadow;
    DrawText(Canvas.Handle, PChar(Text), Length(Text), Rect, Flags);
  end
  else
    DrawText(Canvas.Handle, PChar(Text), Length(Text), Rect, Flags);
end;

procedure TcitCustomLabel.Paint;
const
  Alignments: array[TAlignment] of Word = (DT_LEFT, DT_RIGHT, DT_CENTER);
  WordWraps: array[Boolean] of Word = (0, DT_WORDBREAK);
var
  Rect: TRect;
  DrawStyle: Integer;
begin
  with Canvas do
  begin
    if not Transparent then
    begin
      Brush.Color := Self.Color;
      Brush.Style := bsSolid;
      FillRect(ClientRect);
    end;
    Brush.Style := bsClear;
    Rect := ClientRect;
    DrawStyle := DT_EXPANDTABS or WordWraps[FWordWrap] or Alignments[FAlignment];
    { Calculate vertical layout }
    if FLayout <> tlTop then
    begin
      DoDrawText(Rect, DrawStyle or DT_CALCRECT);
      if FLayout = tlBottom then OffsetRect(Rect, 0, Height - Rect.Bottom)
      else OffsetRect(Rect, 0, (Height - Rect.Bottom) div 2);
    end;
    DoDrawText(Rect, DrawStyle);
  end;
end;

procedure TcitCustomLabel.Loaded;
begin
  inherited Loaded;
  AdjustBounds;
end;

procedure TcitCustomLabel.AdjustBounds;
const
  WordWraps: array[Boolean] of Word = (0, DT_WORDBREAK);
var
  DC: HDC;
  X: Integer;
  Rect: TRect;
begin
  if not (csReading in ComponentState) and FAutoSize then
  begin
    Rect := ClientRect;
    DC := GetDC(0);
    Canvas.Handle := DC;
    DoDrawText(Rect, (DT_EXPANDTABS or DT_CALCRECT) or WordWraps[FWordWrap]);
    Canvas.Handle := 0;
    ReleaseDC(0, DC);
    X := Left;
    if FAlignment = taRightJustify then Inc(X, Width - Rect.Right);
    SetBounds(X, Top, Rect.Right, Rect.Bottom);
  end;
end;

procedure TcitCustomLabel.SetAlignment(Value: TAlignment);
begin
  if FAlignment <> Value then
  begin
    FAlignment := Value;
    Invalidate;
  end;
end;

procedure TcitCustomLabel.SetAutoSize(Value: Boolean);
begin
  if FAutoSize <> Value then
  begin
    FAutoSize := Value;
    AdjustBounds;
  end;
end;

function TcitCustomLabel.GetTransparent: Boolean;
begin
  Result := not (csOpaque in ControlStyle);
end;

procedure TcitCustomLabel.SetFocusControl(Value: TWinControl);
begin
  FFocusControl := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

procedure TcitCustomLabel.SetShowAccelChar(Value: Boolean);
begin
  if FShowAccelChar <> Value then
  begin
    FShowAccelChar := Value;
    Invalidate;
  end;
end;

procedure TcitCustomLabel.SetTransparent(Value: Boolean);
begin
  if Transparent <> Value then
  begin
    if Value then
      ControlStyle := ControlStyle - [csOpaque] else
      ControlStyle := ControlStyle + [csOpaque];
    Invalidate;
  end;
end;

procedure TcitCustomLabel.SetLayout(Value: TTextLayout);
begin
  if FLayout <> Value then
  begin
    FLayout := Value;
    Invalidate;
  end;
end;

procedure TcitCustomLabel.SetWordWrap(Value: Boolean);
begin
  if FWordWrap <> Value then
  begin
    FWordWrap := Value;
    AdjustBounds;
    Invalidate;
  end;
end;

procedure TcitCustomLabel.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FFocusControl) then
    FFocusControl := nil;
end;

procedure TcitCustomLabel.CMTextChanged(var Message: TMessage);
begin
  Invalidate;
  AdjustBounds;
end;

procedure TcitCustomLabel.CMFontChanged(var Message: TMessage);
begin
  inherited;
  AdjustBounds;
end;

procedure TcitCustomLabel.CMDialogChar(var Message: TCMDialogChar);
begin
  if (FFocusControl <> nil) and Enabled and ShowAccelChar and
    IsAccel(Message.CharCode, Caption) then
    with FFocusControl do
      if CanFocus then
      begin
        SetFocus;
        Message.Result := 1;
      end;
end;

{ TCustomEdit }

constructor TcitCustomEdit.Create(AOwner: TComponent);
const
  EditStyle = [csClickEvents, csSetCaption, csDoubleClicks, csFixedHeight];
begin
  inherited Create(AOwner);
  FLinkedLabelFont := TFont.Create;
  FLinkedLabelRequiredFont := TFont.Create;
  FLinkedLabelRequiredFont.Style := [fsBold];
  if NewStyleControls then
    ControlStyle := EditStyle else
    ControlStyle := EditStyle + [csFramed];
  Width := 121;
  Height := 25;
  TabStop := True;
  ParentColor := False;
  FBorderStyle := bsSingle;
  FAutoSize := True;
  FAutoSelect := True;
  FHideSelection := True;
  FLinkedLabel := nil;
  FLinkedButton := nil;
  if not(csReading in ComponentState) and (csDesigning in ComponentState) then
  begin
    SetOwnesLButton(True);
    SetOwnesLLabel(True)
  end;
  AdjustHeight;
  FLBtnShortCut1 := TextToShortCut('F4');
  FLBtnShortCut2 := TextToShortCut('Down');
end;

destructor TcitCustomEdit.Destroy;
begin
    FLinkedLabelFont.Free;
    FLinkedLabelRequiredFont.Free;
    inherited;
end;


procedure TcitCustomEdit.DoSetMaxLength(Value: Integer);
begin
  SendMessage(Handle, EM_LIMITTEXT, Value, 0)
end;

procedure TcitCustomEdit.SetAutoSize(Value: Boolean);
begin
  if FAutoSize <> Value then
  begin
    FAutoSize := Value;
    UpdateHeight;
  end;
end;

procedure TcitCustomEdit.SetBorderStyle(Value: TBorderStyle);
begin
  if FBorderStyle <> Value then
  begin
    FBorderStyle := Value;
    UpdateHeight;
    RecreateWnd;
  end;
end;

procedure TcitCustomEdit.SetCharCase(Value: TEditCharCase);
begin
  if FCharCase <> Value then
  begin
    FCharCase := Value;
    RecreateWnd;
  end;
end;

procedure TcitCustomEdit.SetHideSelection(Value: Boolean);
begin
  if FHideSelection <> Value then
  begin
    FHideSelection := Value;
    RecreateWnd;
  end;
end;

procedure TcitCustomEdit.SetMaxLength(Value: Integer);
begin
  if FMaxLength <> Value then
  begin
    FMaxLength := Value;
    if HandleAllocated then DoSetMaxLength(Value);
  end;
end;

procedure TcitCustomEdit.SetOEMConvert(Value: Boolean);
begin
  if FOEMConvert <> Value then
  begin
    FOEMConvert := Value;
    RecreateWnd;
  end;
end;

function TcitCustomEdit.GetModified: Boolean;
begin
  Result := FModified;
  if HandleAllocated then Result := SendMessage(Handle, EM_GETMODIFY, 0, 0) <> 0;
end;

procedure TcitCustomEdit.SetModified(Value: Boolean);
begin
  if HandleAllocated then
    SendMessage(Handle, EM_SETMODIFY, Byte(Value), 0) else
    FModified := Value;
end;

procedure TcitCustomEdit.SetPasswordChar(Value: Char);
begin
  if FPasswordChar <> Value then
  begin
    FPasswordChar := Value;
    if HandleAllocated then
    begin
      SendMessage(Handle, EM_SETPASSWORDCHAR, Ord(FPasswordChar), 0);
      SetTextBuf(PChar(Text));
    end;
  end;
end;

procedure TcitCustomEdit.SetReadOnly(Value: Boolean);
begin
  if FReadOnly <> Value then
  begin
    FReadOnly := Value;
    if HandleAllocated then
      SendMessage(Handle, EM_SETREADONLY, Ord(Value), 0);
  end;
end;

function TcitCustomEdit.GetSelStart: Integer;
begin
  SendMessage(Handle, EM_GETSEL, Longint(@Result), 0);
end;

procedure TcitCustomEdit.SetSelStart(Value: Integer);
begin
  SendMessage(Handle, EM_SETSEL, Value, Value);
end;

function TcitCustomEdit.GetSelLength: Integer;
var
  Selection: TSelection;
begin
  SendMessage(Handle, EM_GETSEL, Longint(@Selection.StartPos), Longint(@Selection.EndPos));
  Result := Selection.EndPos - Selection.StartPos;
end;

procedure TcitCustomEdit.SetSelLength(Value: Integer);
var
  Selection: TSelection;
begin
  SendMessage(Handle, EM_GETSEL, Longint(@Selection.StartPos), Longint(@Selection.EndPos));
  Selection.EndPos := Selection.StartPos + Value;
  SendMessage(Handle, EM_SETSEL, Selection.StartPos, Selection.EndPos);
  SendMessage(Handle, EM_SCROLLCARET, 0,0);
end;

procedure TcitCustomEdit.Clear;
begin
  SetWindowText(Handle, '');
end;

procedure TcitCustomEdit.ClearSelection;
begin
  SendMessage(Handle, WM_CLEAR, 0, 0);
end;

procedure TcitCustomEdit.CopyToClipboard;
begin
  SendMessage(Handle, WM_COPY, 0, 0);
end;

procedure TcitCustomEdit.CutToClipboard;
begin
  SendMessage(Handle, WM_CUT, 0, 0);
end;

procedure TcitCustomEdit.PasteFromClipboard;
begin
  SendMessage(Handle, WM_PASTE, 0, 0);
end;

procedure TcitCustomEdit.SelectAll;
begin
  SendMessage(Handle, EM_SETSEL, 0, -1);
end;

function TcitCustomEdit.GetSelTextBuf(Buffer: PChar; BufSize: Integer): Integer;
var
  P: PChar;
  StartPos: Integer;
begin
  StartPos := GetSelStart;
  Result := GetSelLength;
  P := StrAlloc(GetTextLen + 1);
  try
    GetTextBuf(P, StrBufSize(P));
    if Result >= BufSize then Result := BufSize - 1;
    StrLCopy(Buffer, P + StartPos, Result);
  finally
    StrDispose(P);
  end;
end;

procedure TcitCustomEdit.SetSelTextBuf(Buffer: PChar);
begin
  SendMessage(Handle, EM_REPLACESEL, 0, LongInt(Buffer));
end;

function TcitCustomEdit.GetSelText: string;
var
  P: PChar;
  SelStart, Len: Integer;
begin
  SelStart := GetSelStart;
  Len := GetSelLength;
  SetString(Result, PChar(nil), Len);
  if Len <> 0 then
  begin
    P := StrAlloc(GetTextLen + 1);
    try
      GetTextBuf(P, StrBufSize(P));
      Move(P[SelStart], Pointer(Result)^, Len);
    finally
      StrDispose(P);
    end;
  end;
end;

procedure TcitCustomEdit.SetSelText(const Value: String);
begin
  SendMessage(Handle, EM_REPLACESEL, 0, Longint(PChar(Value)));
end;

procedure TcitCustomEdit.CreateParams(var Params: TCreateParams);
const
  Passwords: array[Boolean] of Longint = (0, ES_PASSWORD);
  ReadOnlys: array[Boolean] of Longint = (0, ES_READONLY);
  CharCases: array[TEditCharCase] of Longint = (0, ES_UPPERCASE, ES_LOWERCASE);
  HideSelections: array[Boolean] of Longint = (ES_NOHIDESEL, 0);
  OEMConverts: array[Boolean] of Longint = (0, ES_OEMCONVERT);
begin
  inherited CreateParams(Params);
  CreateSubClass(Params, 'EDIT');
  with Params do
  begin
    Style := Style or (ES_AUTOHSCROLL or ES_AUTOVSCROLL) or
      BorderStyles[FBorderStyle] or Passwords[FPasswordChar <> #0] or
      ReadOnlys[FReadOnly] or CharCases[FCharCase] or
      HideSelections[FHideSelection] or OEMConverts[FOEMConvert];
    if NewStyleControls and Ctl3D and (FBorderStyle = bsSingle) then
    begin
      Style := Style and not WS_BORDER;
      ExStyle := ExStyle or WS_EX_CLIENTEDGE;
    end;
  end;
end;

procedure TcitCustomEdit.CreateWnd;
begin
  FCreating := True;
  try
    inherited CreateWnd;
  finally
    FCreating := False;
  end;
  SendMessage(Handle, EM_LIMITTEXT, FMaxLength, 0);
  Modified := FModified;
  if FPasswordChar <> #0 then
    SendMessage(Handle, EM_SETPASSWORDCHAR, Ord(FPasswordChar), 0);
  UpdateHeight;
  if not(csReading in ComponentState) and (csDesigning in ComponentState) then
  begin
    if FOwnesLButton then FLinkedButton.Parent := Parent;
    if FOwnesLLabel then
    begin
      if FLinkedLabel.Caption = '' then FLinkedLabel.Caption := Name;
      FLinkedLabel.Parent := Parent;
    end;
  end;
  if FOwnesLButton then
  begin
    FLinkedButton.GroupIndex := FLBtnGroupIndex;
    FLinkedButton.Down := FLBtnDown;
//    if not(csReading in ComponentState) then LBtnGlyphKind := gkNative;
  end
end;

procedure TcitCustomEdit.DestroyWnd;
begin
  FModified := Modified;
  inherited DestroyWnd;
end;

procedure TcitCustomEdit.UpdateHeight;
begin
  if FAutoSize and (BorderStyle = bsSingle) then
  begin
    ControlStyle := ControlStyle + [csFixedHeight];
    AdjustHeight;
  end else
    ControlStyle := ControlStyle - [csFixedHeight];
end;

procedure TcitCustomEdit.AdjustHeight;
var
  DC: HDC;
  SaveFont: HFont;
  I: Integer;
  SysMetrics, Metrics: TTextMetric;
begin
  DC := GetDC(0);
  GetTextMetrics(DC, SysMetrics);
  SaveFont := SelectObject(DC, Font.Handle);
  GetTextMetrics(DC, Metrics);
  SelectObject(DC, SaveFont);
  ReleaseDC(0, DC);
  if NewStyleControls then
  begin
    if Ctl3D then I := 8 else I := 6;
    I := GetSystemMetrics(SM_CYBORDER) * I;
  end else
  begin
    I := SysMetrics.tmHeight;
    if I > Metrics.tmHeight then I := Metrics.tmHeight;
    I := I div 4 + GetSystemMetrics(SM_CYBORDER) * 4;
  end;
  Height := Metrics.tmHeight + I;
end;

procedure TcitCustomEdit.Change;
begin
  inherited Changed;
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TcitCustomEdit.DefaultHandler(var Message);
begin
  case TMessage(Message).Msg of
    WM_RBUTTONUP:
      if HasPopup(Self) then Exit;
    WM_SETFOCUS:
      if (Win32Platform = VER_PLATFORM_WIN32_WINDOWS) and
        not IsWindow(TWMSetFocus(Message).FocusedWnd) then
        TWMSetFocus(Message).FocusedWnd := 0;
  end;
  inherited;
end;

procedure TcitCustomEdit.WMSetFont(var Message: TWMSetFont);
begin
  inherited;
  if NewStyleControls and
    (GetWindowLong(Handle, GWL_STYLE) and ES_MULTILINE = 0) then
    SendMessage(Handle, EM_SETMARGINS, EC_LEFTMARGIN or EC_RIGHTMARGIN, 0);
end;

procedure TcitCustomEdit.CMCtl3DChanged(var Message: TMessage);
begin
  if NewStyleControls and (FBorderStyle = bsSingle) then
  begin
    UpdateHeight;
    RecreateWnd;
  end;
  inherited;
end;

procedure TcitCustomEdit.CMFontChanged(var Message: TMessage);
begin
  inherited;
  if (csFixedHeight in ControlStyle) and not ((csDesigning in
    ComponentState) and (csLoading in ComponentState)) then AdjustHeight;
end;

procedure TcitCustomEdit.CNCommand(var Message: TWMCommand);
begin
  if (Message.NotifyCode = EN_CHANGE) and not FCreating then Change;
end;

procedure TcitCustomEdit.CMEnter(var Message: TCMGotFocus);
begin
  if FAutoSelect and not (csLButtonDown in ControlState) and
    (GetWindowLong(Handle, GWL_STYLE) and ES_MULTILINE = 0) then SelectAll;
  inherited;
end;

procedure TcitCustomEdit.CMTextChanged(var Message: TMessage);
begin
  inherited;
  if not HandleAllocated or (GetWindowLong(Handle, GWL_STYLE) and
    ES_MULTILINE <> 0) then Change;
end;

procedure TcitCustomEdit.KeyDown(var Key: Word; Shift: TShiftState);
var
   Key1, Key2 : word;
   Shift1, Shift2 : TShiftState;
begin
   ShortCutToKey(LBtnShortCut1, Key1, Shift1);
   ShortCutToKey(LBtnShortCut2, Key2, Shift2);
   if ((Key = Key1) and (Shift = Shift1)) or ((Key = Key2) and (Shift = Shift2))
    then ButtonPushed(Self)
    else inherited;
end;

procedure TcitCustomEdit.SetLinkedLabelAlignment(Value: TLinkedLabelAlignment);
begin
  if (Ord(FLinkedButtonAlignment) + Ord(Value) = 1) and FOwnesLLabel
     and FOwnesLButton and (csDesigning in ComponentState)
     and not(csReading in ComponentState)
   then
    begin
     if MessageDlg('У кнопки и метки одинаковое выравнивание. Исправить ?',
                   mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       begin
         FLinkedButtonAlignment := TLinkedButtonAlignment(1-Ord(FLinkedButtonAlignment));
         FLinkedLabelAlignment := TLinkedLabelAlignment(1-Ord(FLinkedLabelAlignment));
         AlignButton;
         AlignLabel
       end;
    end
   else
    begin
      FLinkedLabelAlignment := Value;
      if FOwnesLLabel then AlignLabel
    end;
end;

procedure TcitCustomEdit.SetLinkedButtonAlignment(Value: TLinkedButtonAlignment);
begin
  if (Ord(Value) + Ord(FLinkedLabelAlignment) = 1) and FOwnesLLabel
     and FOwnesLButton and (csDesigning in ComponentState)
     and not(csReading in ComponentState)
   then
   begin
     if MessageDlg('У метки и кнопки одинаковое выравнивание. Исправить ?',
                   mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       begin
         FLinkedButtonAlignment := TLinkedButtonAlignment(1-Ord(FLinkedButtonAlignment));
         FLinkedLabelAlignment := TLinkedLabelAlignment(1-Ord(FLinkedLabelAlignment));
         AlignButton;
         AlignLabel
       end;
   end
   else
   begin
     FLinkedButtonAlignment := Value;
     if FOwnesLButton then AlignButton
   end;
end;

procedure TcitCustomEdit.SetLinkedButtonWidth(Value: integer);
begin
  if FLinkedButtonWidth <> Value then
   begin
     FLinkedButtonWidth := Value;
     if FOwnesLButton then
      begin
        FLinkedButton.Width := Value;
        AlignButton;
      end
   end;
end;

procedure TcitCustomEdit.SetLinkedLabelWidth(Value: integer);
begin
  if FLinkedLabelWidth <> Value then
   begin
     FLinkedLabelWidth := Value;
     if FOwnesLLabel then
      begin
        FLinkedLabel.Width := Value;
        AlignLabel;
      end
   end;
end;

procedure TcitCustomEdit.SetLinkedLabelFont(Value: TFont);
begin
    FLinkedLabelFont.Assign(Value);
    if FOwnesLLabel then begin
        if not FRequired then
            FLinkedLabel.Font.Assign(Value);
    end;
end;

procedure TcitCustomEdit.SetLinkedLabelRequiredFont(Value: TFont);
begin
    FLinkedLabelRequiredFont.Assign(Value);
    if FOwnesLLabel then begin
        if FRequired then
            FLinkedLabel.Font.Assign(Value);
    end;
end;

procedure TcitCustomEdit.SetRequired(Value: boolean);
begin
    if FRequired <> Value then begin
        FRequired := Value;
        if FOwnesLLabel then begin
            if Value then FLinkedLabel.Font.Assign(FLinkedLabelRequiredFont)
                     else FLinkedLabel.Font.Assign(FLinkedLabelFont);
        end;
    end;
end;

procedure TcitCustomEdit.SetLinkedButtonFlat(Value: Boolean);
begin
  if FOwnesLButton then FLinkedButton.Flat := Value;
end;

function TcitCustomEdit.GetLinkedButtonFlat: Boolean;
begin
  if FOwnesLButton then Result := FLinkedButton.Flat
                   else Result := False;
end;

function TcitCustomEdit.GetLinkedLabelWidth: integer;
begin
  if FOwnesLLabel then Result := FLinkedLabel.Width
                  else Result := 0;
end;

function TcitCustomEdit.IsStored: boolean;
begin
  Result := (FLBtnGlyphKind = gkUserDefined);
end;

procedure TcitCustomEdit.SetLBtnGlyphKind(Value: TLBtnGlyphKind);
begin
  FLBtnGlyphKind := Value;
  if FOwnesLButton then
   begin
     case FLBtnGlyphKind of
       gkDots : FLinkedButton.Glyph.Handle := LoadBitmap(HInstance, 'TcitEditDots');
       gkArrow : FLinkedButton.Glyph.Handle := LoadBitmap(HInstance, 'TcitEditArrow');
       gkTwoArrows : FLinkedButton.Glyph.Handle := LoadBitmap(HInstance, 'TcitEditTwoArrows');
       gkNative : try
                   FLinkedButton.Glyph.Handle := LoadBitmap(HInstance, PChar(String(ClassName)+'Glyph'));
                   if (csDesigning in ComponentState) and not(csReading in ComponentState)then
                    FLinkedButton.NumGlyphs := FLinkedButton.Glyph.Width div FLinkedButton.Glyph.Height;
                  except
                   on Exception do
                    begin
                      MessageDlg(Format('Ошибка чтения ресурса %s. Возможно для данного компонента нет собственной картинки.', [ClassName]),
                                 mtError, [mbOK], 0);
                      FLinkedButton.Glyph.Handle := LoadBitmap(HInstance, 'TcitEditDots');
                    end
                  end;
     end;
     if FLBtnGlyphKind in [gkDots, gkArrow, gkTwoArrows] then FLinkedButton.NumGlyphs := 1;
   end
end;

procedure TcitCustomEdit.SetLinkedButtonGlyph(Value: TBitmap);
begin
  if FOwnesLButton then
    if (Value <> nil) and (FLBtnGlyphKind = gkUserDefined) then
     begin
       FLinkedButton.Glyph := Value;
       FLinkedButton.Invalidate;
     end
    else
     begin
       if (csDesigning in ComponentState) or not(csReading in ComponentState) then
        begin
          case FLBtnGlyphKind of
           gkDots : FLinkedButton.Glyph.Handle := LoadBitmap(HInstance, 'TcitEditDots');
           gkArrow : FLinkedButton.Glyph.Handle := LoadBitmap(HInstance, 'TcitEditArrow');
           gkTwoArrows : FLinkedButton.Glyph.Handle := LoadBitmap(HInstance, 'TcitEditTwoArrows');
           gkNative : try
                       FLinkedButton.Glyph.Handle := LoadBitmap(HInstance, PChar(String(ClassName)+'Glyph'));
                       FLinkedButton.NumGlyphs := FLinkedButton.Glyph.Width div FLinkedButton.Glyph.Height;                      except
                       on Exception do
                        begin
                          MessageDlg(Format('Ошибка чтения ресурса %s. Возможно для данного компонента нет собственной картинки.', [ClassName]),
                                     mtError, [mbOK], 0);
                          FLinkedButton.Glyph.Handle := LoadBitmap(HInstance, 'TcitEditDots');
                        end
                      end;
           gkUserDefined : FLinkedButton.Glyph := nil
          end;
          FLinkedButton.NumGlyphs := 1;
        end;
       FLinkedButton.Invalidate;
     end
end;

function TcitCustomEdit.GetLinkedButtonGlyph: TBitmap;
begin
  if FOwnesLButton then Result := FLinkedButton.Glyph
                   else Result := nil;
end;

function TcitCustomEdit.GetNumGlyphs: TNumGlyphs;
begin
   if FOwnesLButton then Result := FLinkedButton.NumGlyphs
                    else Result := 1;
end;

procedure TcitCustomEdit.SetNumGlyphs(Value: TNumGlyphs);
begin
   if FOwnesLButton then FLinkedButton.NumGlyphs := Value;
end;

procedure TcitCustomEdit.SetLBtnDown(Value: Boolean);
begin
   if FOwnesLButton then FLinkedButton.Down := Value;
   FLBtnDown := Value;
end;

procedure TcitCustomEdit.SetLBtnGroupIndex(Value: integer);
begin
   if FOwnesLButton then FLinkedButton.GroupIndex := Value;
   FLBtnGroupIndex := Value
end;

function TcitCustomEdit.GetEnabled: Boolean;
begin
  Result := inherited Enabled;
end;

procedure TcitCustomEdit.SetEnabled(Value: Boolean);
begin
   if FOwnesLButton then FLinkedButton.Enabled := Value;
   if FOwnesLLabel then FLinkedLabel.Enabled := Value;
   inherited Enabled := Value
end;

function TcitCustomEdit.GetVisible: Boolean;
begin
  Result := inherited Visible;
end;

procedure TcitCustomEdit.SetVisible(Value: Boolean);
begin
   if FOwnesLButton then FLinkedButton.Visible := Value;
   if FOwnesLLabel then FLinkedLabel.Visible := Value;
   inherited Visible := Value
end;

function TcitCustomEdit.GetLBtnAllowAllUp: Boolean;
begin
  if FOwnesLButton then Result := FLinkedButton.AllowAllUp
                   else Result := True;
end; 

procedure TcitCustomEdit.SetLBtnAllowAllUp(Value: Boolean);
begin
   if FOwnesLButton then FLinkedButton.AllowAllUp := Value;
end;

procedure TcitCustomEdit.SetLinkedLabelCaption(Value: string);
begin
  FLinkedLabelCaption := Value;
  if FOwnesLLabel then begin
                            FLinkedLabel.Caption := Value;
                            AlignLabel
                          end;
end;

procedure TcitCustomEdit.SetLinkedButtonCaption(Value: string);
begin
  FLinkedButtonCaption := Value;
  if FOwnesLButton then FLinkedButton.Caption := Value;
end;

procedure TcitCustomEdit.AlignLabel;
begin
  if FOwnesLLabel then
   begin
    case FLinkedLabelAlignment of
      laRight : begin
                  FLinkedLabel.Left := Left + Width + 1;
                  FLinkedLabel.Top := Top + (Height - FLinkedLabel.Height) div 2;
                end;
      laLeft  : begin
                  FLinkedLabel.Left := Left - FLinkedLabel.Width - 1;
                  FLinkedLabel.Top := Top + (Height - FLinkedLabel.Height) div 2;
                end;
      laTop   : begin
                  FLinkedLabel.Left := Left;
                  FLinkedLabel.Top := Top - FLinkedLabel.Height - 1;
                end;
      laBottom: begin
                  FLinkedLabel.Left := Left;
                  FLinkedLabel.Top := Top + Height + 1;
                end;
    end;
   end;
end;

procedure TcitCustomEdit.AlignButton;
begin
  if FOwnesLButton then
   begin
    if FLinkedButton.Height <> Height then FLinkedButton.Height := Height;
    case FLinkedButtonAlignment of
      baRight : begin
                  FLinkedButton.Left := Left + Width;
                  FLinkedButton.Top := Top;
                end;
      baLeft  : begin
                  FLinkedButton.Left := Left - FLinkedButtonWidth - 1;
                  FLinkedButton.Top := Top;
                end;
    end;
   end;
end;

procedure TcitCustomEdit.SetOwnesLButton(Value: Boolean);
begin
  if Value <> FOwnesLButton then
   if Value then begin
                   FLinkedButton := TSpeedButton.Create(Self);
                   FOwnesLButton := True;
                   if (Ord(FLinkedButtonAlignment) + Ord(FLinkedLabelAlignment) = 1)
                      and (csDesigning in ComponentState)
                      and not(csReading in ComponentState) then
                      FLinkedButtonAlignment := TLinkedButtonAlignment(1-(Ord(FLinkedButtonAlignment)));
                   FLinkedButton.Height := Height;
                   if LBtnWidth = 0 then LBtnWidth := Height;
                   FLinkedButton.Width := LBtnWidth;
                   FLinkedButton.Flat := True;
                   FLinkedButton.Enabled := Enabled;
                   FLinkedButton.Caption := FLinkedButtonCaption;
                   FLinkedButton.Parent := Parent;
                   FLinkedButton.OnClick := ButtonPushed;
                   LBtnGlyph := nil;
                   AlignButton;
//                 FLinkedButton.Show;
                 end
            else begin
                   FLinkedButton.Free;
                   FOwnesLButton := False
                 end;
end;

procedure TcitCustomEdit.SetOwnesLLabel(Value: Boolean);
begin
  if Value <> FOwnesLLabel then
   if Value then begin
                   FLinkedLabel := TcitLabel.Create(Self);
                   FLinkedLabel.Parent := Parent;
                   FOwnesLLabel := True;
                   if (Ord(FLinkedButtonAlignment) + Ord(FLinkedLabelAlignment) = 1)
                   and (csDesigning in ComponentState)
                   and not(csReading in ComponentState) then
                      FLinkedLabelAlignment := TLinkedLabelAlignment(1-(Ord(FLinkedLabelAlignment)));
                   if Length(FLinkedLabelCaption) <> 0 then
                           FLinkedLabel.Caption := FLinkedLabelCaption
                      else FLinkedLabel.Caption := Name;
                   FLinkedLabel.FocusControl := Self;
                   FLinkedLabel.AutoSize := False;
                   if FLinkedLabelWidth <> 0 then FLinkedLabel.Width := FLinkedLabelWidth;
                   AlignLabel;
                   if FRequired then FLinkedLabel.Font.Assign(FLinkedLabelRequiredFont)
                                else FLinkedLabel.Font.Assign(FLinkedLabelFont);
                   FLinkedLabel.Show;
                 end
            else begin
                   FLinkedLabel.Free;
                   FOwnesLLabel := False
                 end;
end;

procedure TcitCustomEdit.WMMove(var Message: TMessage);
begin
  AlignLabel;
  AlignButton;
end;

procedure TcitCustomEdit.WMSize(var Message: TMessage);
begin
  AlignLabel;
  AlignButton;
end;

procedure TcitCustomEdit.ButtonPushed(Sender : TObject);
begin
  if Assigned(FOnPushButton) and FOwnesLButton then
  begin
    FOnPushButton(Self);
    SetFocus;
  end;
end;
{ TMemoStrings }

function TMemoStrings.GetCount: Integer;
begin
  Result := 0;
  if Memo.HandleAllocated then
  begin
    Result := SendMessage(Memo.Handle, EM_GETLINECOUNT, 0, 0);
    if SendMessage(Memo.Handle, EM_LINELENGTH, SendMessage(Memo.Handle,
      EM_LINEINDEX, Result - 1, 0), 0) = 0 then Dec(Result);
  end;
end;

function TMemoStrings.Get(Index: Integer): string;
var
  Text: array[0..4095] of Char;
begin
  Word((@Text)^) := SizeOf(Text);
  SetString(Result, Text, SendMessage(Memo.Handle, EM_GETLINE, Index,
    Longint(@Text)));
end;

procedure TMemoStrings.Put(Index: Integer; const S: string);
var
  SelStart: Integer;
begin
  SelStart := SendMessage(Memo.Handle, EM_LINEINDEX, Index, 0);
  if SelStart >= 0 then
  begin
    SendMessage(Memo.Handle, EM_SETSEL, SelStart, SelStart +
      SendMessage(Memo.Handle, EM_LINELENGTH, SelStart, 0));
    SendMessage(Memo.Handle, EM_REPLACESEL, 0, Longint(PChar(S)));
  end;
end;

procedure TMemoStrings.Insert(Index: Integer; const S: string);
var
  SelStart, LineLen: Integer;
  Line: string;
begin
  if Index >= 0 then
  begin
    SelStart := SendMessage(Memo.Handle, EM_LINEINDEX, Index, 0);
    if SelStart >= 0 then Line := S + #13#10 else
    begin
      SelStart := SendMessage(Memo.Handle, EM_LINEINDEX, Index - 1, 0);
      if SelStart < 0 then Exit;
      LineLen := SendMessage(Memo.Handle, EM_LINELENGTH, SelStart, 0);
      if LineLen = 0 then Exit;
      Inc(SelStart, LineLen);
      Line := #13#10 + s;
    end;
    SendMessage(Memo.Handle, EM_SETSEL, SelStart, SelStart);
    SendMessage(Memo.Handle, EM_REPLACESEL, 0, Longint(PChar(Line)));
  end;
end;

procedure TMemoStrings.Delete(Index: Integer);
const
  Empty: PChar = '';
var
  SelStart, SelEnd: Integer;
begin
  SelStart := SendMessage(Memo.Handle, EM_LINEINDEX, Index, 0);
  if SelStart >= 0 then
  begin
    SelEnd := SendMessage(Memo.Handle, EM_LINEINDEX, Index + 1, 0);
    if SelEnd < 0 then SelEnd := SelStart +
      SendMessage(Memo.Handle, EM_LINELENGTH, SelStart, 0);
    SendMessage(Memo.Handle, EM_SETSEL, SelStart, SelEnd);
    SendMessage(Memo.Handle, EM_REPLACESEL, 0, Longint(Empty));
  end;
end;

procedure TMemoStrings.Clear;
begin
  Memo.Clear;
end;

procedure TMemoStrings.SetUpdateState(Updating: Boolean);
begin
  if Memo.HandleAllocated then
  begin
    SendMessage(Memo.Handle, WM_SETREDRAW, Ord(not Updating), 0);
    if not Updating then
    begin   // WM_SETREDRAW causes visibility side effects in memo controls
      Memo.Perform(CM_SHOWINGCHANGED,0,0); // This reasserts the visibility we want
      Memo.Refresh;
    end;
  end;
end;

function TMemoStrings.GetTextStr: string;
begin
  Result := Memo.Text;
end;

procedure TMemoStrings.SetTextStr(const Value: string);
var
  NewText: string;
begin
  NewText := AdjustLineBreaks(Value);
  if (Length(NewText) <> Memo.GetTextLen) or (NewText <> Memo.Text) then
  begin
    if SendMessage(Memo.Handle, WM_SETTEXT, 0, Longint(NewText)) = 0 then
      raise EInvalidOperation.Create(SInvalidMemoSize);
    Memo.Perform(CM_TEXTCHANGED, 0, 0);
  end;
end;

{ TCustomMemo }

constructor TcitCustomMemo.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Width := 185;
  Height := 89;
  AutoSize := False;
  FWordWrap := True;
  FWantReturns := True;
  FLines := TMemoStrings.Create;
  TMemoStrings(FLines).Memo := Self;
end;

destructor TcitCustomMemo.Destroy;
begin
  FLines.Free;
  inherited Destroy;
end;

procedure TcitCustomMemo.CreateParams(var Params: TCreateParams);
const
  Alignments: array[TAlignment] of Longint = (ES_LEFT, ES_RIGHT, ES_CENTER);
  ScrollBar: array[TScrollStyle] of LongInt = (0, WS_HSCROLL, WS_VSCROLL,
    WS_HSCROLL or WS_VSCROLL);
  WordWraps: array[Boolean] of LongInt = (0, ES_AUTOHSCROLL);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style := Style and not WordWraps[FWordWrap] or ES_MULTILINE or
      Alignments[FAlignment] or ScrollBar[FScrollBars];
  end;
end;

procedure TcitCustomMemo.CreateWindowHandle(const Params: TCreateParams);
begin
  with Params do
  begin
    WindowHandle := CreateWindowEx(ExStyle, WinClassName, '', Style,
      X, Y, Width, Height, WndParent, 0, HInstance, Param);
    SendMessage(WindowHandle, WM_SETTEXT, 0, Longint(Caption));
  end;
end;

procedure TcitCustomMemo.Loaded;
begin
  inherited Loaded;
  Modified := False;
end;

procedure TcitCustomMemo.SetAlignment(Value: TAlignment);
begin
  if FAlignment <> Value then
  begin
    FAlignment := Value;
    RecreateWnd;
  end;
end;

procedure TcitCustomMemo.SetLines(Value: TStrings);
begin
  FLines.Assign(Value);
end;

procedure TcitCustomMemo.SetScrollBars(Value: TScrollStyle);
begin
  if FScrollBars <> Value then
  begin
    FScrollBars := Value;
    RecreateWnd;
  end;
end;

procedure TcitCustomMemo.SetWordWrap(Value: Boolean);
begin
  if Value <> FWordWrap then
  begin
    FWordWrap := Value;
    RecreateWnd;
  end;
end;

procedure TcitCustomMemo.WMGetDlgCode(var Message: TWMGetDlgCode);
begin
  inherited;
  if FWantTabs then Message.Result := Message.Result or DLGC_WANTTAB
  else Message.Result := Message.Result and not DLGC_WANTTAB;
  if not FWantReturns then
    Message.Result := Message.Result and not DLGC_WANTALLKEYS;
end;

procedure TcitCustomMemo.WMNCDestroy(var Message: TWMNCDestroy);
begin
  inherited;
end;

procedure TcitCustomMemo.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  if (Key = Char(VK_RETURN)) and not FWantReturns then Key := #0;
end;

{ TComboBoxStrings }

function TComboBoxStrings.GetCount: Integer;
begin
  Result := SendMessage(ComboBox.Handle, CB_GETCOUNT, 0, 0);
end;

function TComboBoxStrings.Get(Index: Integer): string;
var
  Text: array[0..4095] of Char;
  Len: Integer;
begin
  Len := SendMessage(ComboBox.Handle, CB_GETLBTEXT, Index, Longint(@Text));
  if Len = CB_ERR then Len := 0;
  SetString(Result, Text, Len);
end;

function TComboBoxStrings.GetObject(Index: Integer): TObject;
begin
  Result := TObject(SendMessage(ComboBox.Handle, CB_GETITEMDATA, Index, 0));
end;

procedure TComboBoxStrings.PutObject(Index: Integer; AObject: TObject);
begin
  SendMessage(ComboBox.Handle, CB_SETITEMDATA, Index, Longint(AObject));
end;

function TComboBoxStrings.Add(const S: string): Integer;
begin
  Result := SendMessage(ComboBox.Handle, CB_ADDSTRING, 0, Longint(PChar(S)));
  if Result < 0 then
    raise EOutOfResources.Create(SInsertLineError);
end;

procedure TComboBoxStrings.Insert(Index: Integer; const S: string);
begin
  if SendMessage(ComboBox.Handle, CB_INSERTSTRING, Index,
    Longint(PChar(S))) < 0 then
    raise EOutOfResources.Create(SInsertLineError);
end;

procedure TComboBoxStrings.Delete(Index: Integer);
begin
  SendMessage(ComboBox.Handle, CB_DELETESTRING, Index, 0);
end;

procedure TComboBoxStrings.Clear;
var
  S: string;
begin
  S := ComboBox.Text;
  SendMessage(ComboBox.Handle, CB_RESETCONTENT, 0, 0);
  ComboBox.Text := S;
  ComboBox.Update;
end;

procedure TComboBoxStrings.SetUpdateState(Updating: Boolean);
begin
  SendMessage(ComboBox.Handle, WM_SETREDRAW, Ord(not Updating), 0);
  if not Updating then ComboBox.Refresh;
end;

{ TCustomComboBox }

constructor TcitCustomComboBox.Create(AOwner: TComponent);
const
  ComboBoxStyle = [csCaptureMouse, csSetCaption, csDoubleClicks,
    csFixedHeight, csReflector];
begin
  inherited Create(AOwner);
  if NewStyleControls then
    ControlStyle := ComboBoxStyle else
    ControlStyle := ComboBoxStyle + [csFramed];
  Width := 145;
  Height := 25;
  TabStop := True;
  ParentColor := False;
  FItems := TComboBoxStrings.Create;
  TComboBoxStrings(FItems).ComboBox := Self;
  FCanvas := TControlCanvas.Create;
  FItemHeight := 16;
  FStyle := csDropDown;
  FEditInstance := MakeObjectInstance(EditWndProc);
  FListInstance := MakeObjectInstance(ListWndProc);
  FDropDownCount := 8;
end;

destructor TcitCustomComboBox.Destroy;
begin
  if HandleAllocated then DestroyWindowHandle;
  FreeObjectInstance(FListInstance);
  FreeObjectInstance(FEditInstance);
  FCanvas.Free;
  FItems.Free;
  FSaveItems.Free;
  inherited Destroy;
end;

procedure TcitCustomComboBox.Clear;
begin
  SetTextBuf('');
  FItems.Clear;
end;

procedure TcitCustomComboBox.SelectAll;
begin
  SendMessage(Handle, CB_SETEDITSEL, 0, $FFFF0000);
end;

function TcitCustomComboBox.GetDroppedDown: Boolean;
begin
  Result := LongBool(SendMessage(Handle, CB_GETDROPPEDSTATE, 0, 0));
end;

procedure TcitCustomComboBox.SetDroppedDown(Value: Boolean);
begin
  SendMessage(Handle, CB_SHOWDROPDOWN, Longint(Value), 0);
end;

function TcitCustomComboBox.GetItemIndex: Integer;
begin
  Result := SendMessage(Handle, CB_GETCURSEL, 0, 0);
end;

procedure TcitCustomComboBox.SetItemIndex(Value: Integer);
begin
  SendMessage(Handle, CB_SETCURSEL, Value, 0);
end;

function TcitCustomComboBox.GetSelStart: Integer;
begin
  SendMessage(Handle, CB_GETEDITSEL, Longint(@Result), 0);
end;

procedure TcitCustomComboBox.SetSelStart(Value: Integer);
var
  Selection: TSelection;
begin
  Selection.StartPos := Value;
  Selection.EndPos := Value;
  SendMessage(Handle, CB_SETEDITSEL, 0, MakeLParam(Selection.StartPos,
    Selection.EndPos));
end;

function TcitCustomComboBox.GetSelLength: Integer;
var
  Selection: TSelection;
begin
  SendMessage(Handle, CB_GETEDITSEL, Longint(@Selection.StartPos),
    Longint(@Selection.EndPos));
  Result := Selection.EndPos - Selection.StartPos;
end;

procedure TcitCustomComboBox.SetSelLength(Value: Integer);
var
  Selection: TSelection;
begin
  SendMessage(Handle, CB_GETEDITSEL, Longint(@Selection.StartPos),
    Longint(@Selection.EndPos));
  Selection.EndPos := Selection.StartPos + Value;
  SendMessage(Handle, CB_SETEDITSEL, 0, MakeLParam(Selection.StartPos,
    Selection.EndPos));
end;

function TcitCustomComboBox.GetSelText: string;
begin
  Result := '';
  if FStyle < csDropDownList then
    Result := Copy(Text, GetSelStart + 1, GetSelLength);
end;

procedure TcitCustomComboBox.SetSelText(const Value: string);
begin
  if FStyle < csDropDownList then
  begin
    HandleNeeded;
    SendMessage(FEditHandle, EM_REPLACESEL, 0, Longint(PChar(Value)));
  end;
end;

procedure TcitCustomComboBox.SetMaxLength(Value: Integer);
begin
  if FMaxLength <> Value then
  begin
    FMaxLength := Value;
    if HandleAllocated then SendMessage(Handle, CB_LIMITTEXT, Value, 0);
  end;
end;

procedure TcitCustomComboBox.SetSorted(Value: Boolean);
begin
  if FSorted <> Value then
  begin
    FSorted := Value;
    RecreateWnd;
  end;
end;

procedure TcitCustomComboBox.SetStyle(Value: TComboBoxStyle);
begin
  if FStyle <> Value then
  begin
    FStyle := Value;
    if Value = csSimple then
      ControlStyle := ControlStyle - [csFixedHeight] else
      ControlStyle := ControlStyle + [csFixedHeight];
    RecreateWnd;
  end;
end;

function TcitCustomComboBox.GetItemHeight: Integer;
begin
  if FStyle in [csOwnerDrawFixed, csOwnerDrawVariable] then
    Result := FItemHeight else
    Result := Perform(CB_GETITEMHEIGHT, 0, 0);
end;

procedure TcitCustomComboBox.SetItemHeight(Value: Integer);
begin
  if Value > 0 then FItemHeight := Value;
end;

procedure TcitCustomComboBox.SetItems(Value: TStrings);
begin
  Items.Assign(Value);
end;

procedure TcitCustomComboBox.CreateParams(var Params: TCreateParams);
const
  ComboBoxStyles: array[TComboBoxStyle] of Longint = (
    CBS_DROPDOWN, CBS_SIMPLE, CBS_DROPDOWNLIST,
    CBS_DROPDOWNLIST or CBS_OWNERDRAWFIXED,
    CBS_DROPDOWNLIST or CBS_OWNERDRAWVARIABLE);
  Sorts: array[Boolean] of Longint = (0, CBS_SORT);
begin
  inherited CreateParams(Params);
  CreateSubClass(Params, 'COMBOBOX');
  with Params do
  begin
    Style := Style or (WS_VSCROLL or CBS_HASSTRINGS or CBS_AUTOHSCROLL) or
      ComboBoxStyles[FStyle] or Sorts[FSorted];
    if NewStyleControls and Ctl3D then
      ExStyle := ExStyle or WS_EX_CLIENTEDGE;
  end;
end;

procedure TcitCustomComboBox.CreateWnd;
var
  ChildHandle: THandle;
  MaxChars: Integer;
begin
  inherited CreateWnd;
  MaxChars := FMaxLength;
  if (MaxChars <= 0) or (MaxChars > 255) then MaxChars := 255;
  SendMessage(Handle, CB_LIMITTEXT, MaxChars, 0);
  if FSaveItems <> nil then
  begin
    FItems.Assign(FSaveItems);
    FSaveItems.Free;
    FSaveItems := nil;
  end;
  FEditHandle := 0;
  FListHandle := 0;
  if FStyle in [csDropDown, csSimple] then
  begin
    ChildHandle := GetWindow(Handle, GW_CHILD);
    if ChildHandle <> 0 then
    begin
      if FStyle = csSimple then
      begin
        FListHandle := ChildHandle;
        FDefListProc := Pointer(GetWindowLong(FListHandle, GWL_WNDPROC));
        SetWindowLong(FListHandle, GWL_WNDPROC, Longint(FListInstance));
        ChildHandle := GetWindow(ChildHandle, GW_HWNDNEXT);
      end;
      FEditHandle := ChildHandle;
      FDefEditProc := Pointer(GetWindowLong(FEditHandle, GWL_WNDPROC));
      SetWindowLong(FEditHandle, GWL_WNDPROC, Longint(FEditInstance));
    end;
  end;
  if NewStyleControls and (FEditHandle <> 0) then
    SendMessage(FEditHandle, EM_SETMARGINS, EC_LEFTMARGIN or EC_RIGHTMARGIN, 0);
end;

procedure TcitCustomComboBox.DestroyWnd;
begin
  if FItems.Count > 0 then
  begin
    FSaveItems := TStringList.Create;
    FSaveItems.Assign(FItems);
  end;
  inherited DestroyWnd;
end;

procedure TcitCustomComboBox.WMCreate(var Message: TWMCreate);
begin
  inherited;
  SetWindowText(Handle, WindowText);
end;

procedure TcitCustomComboBox.WMEraseBkgnd(var Message: TWMEraseBkgnd);
begin
  if Style = csSimple then
  begin
    FillRect(Message.DC, ClientRect, Parent.Brush.Handle);
    Message.Result := 1;
  end
  else
    DefaultHandler(Message);
end;

procedure TcitCustomComboBox.WMDrawItem(var Message: TWMDrawItem);
begin
  DefaultHandler(Message);
end;

procedure TcitCustomComboBox.WMMeasureItem(var Message: TWMMeasureItem);
begin
  DefaultHandler(Message);
end;

procedure TcitCustomComboBox.WMDeleteItem(var Message: TWMDeleteItem);
begin
  DefaultHandler(Message);
end;

procedure TcitCustomComboBox.WMGetDlgCode(var Message: TWMGetDlgCode);
begin
  inherited;
  if DroppedDown then Message.Result := Message.Result or DLGC_WANTALLKEYS;
end;

procedure TcitCustomComboBox.CMCancelMode(var Message: TCMCancelMode);
begin
  if Message.Sender <> Self then Perform(CB_SHOWDROPDOWN, 0, 0);
end;

procedure TcitCustomComboBox.CMCtl3DChanged(var Message: TMessage);
begin
  if NewStyleControls then RecreateWnd;
  inherited;
end;

procedure TcitCustomComboBox.CMParentColorChanged(var Message: TMessage);
begin
  inherited;
  if not NewStyleControls and (Style < csDropDownList) then Invalidate;
end;

procedure TcitCustomComboBox.EditWndProc(var Message: TMessage);
var
  P: TPoint;
  Form: TCustomForm;
begin
  if Message.Msg = WM_SYSCOMMAND then
  begin
    WndProc(Message);
    Exit;
  end
  else if (Message.Msg >= WM_KEYFIRST) and (Message.Msg <= WM_KEYLAST) then
  begin
    Form := GetParentForm(Self);
    if (Form <> nil) and Form.WantChildKey(Self, Message) then Exit;
  end;
  ComboWndProc(Message, FEditHandle, FDefEditProc);
  case Message.Msg of
    WM_LBUTTONDOWN, WM_LBUTTONDBLCLK:
      begin
        if DragMode = dmAutomatic then
        begin
          GetCursorPos(P);
          P := ScreenToClient(P);
          SendMessage(FEditHandle, WM_LBUTTONUP, 0,Longint(PointToSmallPoint(P)));
          BeginDrag(False);
        end;
      end;
    WM_SETFONT:
      if NewStyleControls then
        SendMessage(FEditHandle, EM_SETMARGINS, EC_LEFTMARGIN or EC_RIGHTMARGIN, 0);
  end;
end;

procedure TcitCustomComboBox.ListWndProc(var Message: TMessage);
begin
  ComboWndProc(Message, FListHandle, FDefListProc);
end;

procedure TcitCustomComboBox.ComboWndProc(var Message: TMessage; ComboWnd: HWnd;
  ComboProc: Pointer);
var
  Point: TPoint;
  Form: TCustomForm;
begin
  try
    with Message do
    begin
      case Msg of
        WM_SETFOCUS:
          begin
            Form := GetParentForm(Self);
            if (Form <> nil) and not Form.SetFocusedControl(Self) then Exit;
          end;
        WM_KILLFOCUS:
          if csFocusing in ControlState then Exit;
        WM_KEYDOWN, WM_SYSKEYDOWN:
          if (ComboWnd <> FListHandle) and DoKeyDown(TWMKey(Message)) then
            Exit;
        WM_CHAR:
          begin
            if DoKeyPress(TWMKey(Message)) then Exit;
            if ((TWMKey(Message).CharCode = VK_RETURN) or
              (TWMKey(Message).CharCode = VK_ESCAPE)) and DroppedDown then
            begin
              DroppedDown := False;
              Exit;
            end;
          end;
        WM_KEYUP, WM_SYSKEYUP:
          if DoKeyUp(TWMKey(Message)) then Exit;
        WM_MOUSEMOVE: Application.HintMouseMessage(Self, Message);
        WM_RBUTTONUP:
          if HasPopup(Self) then
          begin
            with TWMRButtonUp(Message) do
            begin
              Point.X := Pos.X;
              Point.Y := Pos.Y;
              MapWindowPoints(ComboWnd, Handle, Point, 1);
              Pos.X := Point.X;
              Pos.Y := Point.Y;
            end;
            WndProc(Message);
            Exit;
          end;
        WM_GETDLGCODE:
          if DroppedDown then
          begin
            Result := DLGC_WANTALLKEYS;
            Exit;
          end;
        WM_NCHITTEST:
          if csDesigning in ComponentState then
          begin
            Result := HTTRANSPARENT;
            Exit;
          end;
        CN_KEYDOWN, CN_CHAR, CN_SYSKEYDOWN, CN_SYSCHAR:
          begin
            WndProc(Message);
            Exit;
          end;
      end;
      Result := CallWindowProc(ComboProc, ComboWnd, Msg, WParam, LParam);
      if (Msg = WM_LBUTTONDBLCLK) and (csDoubleClicks in ControlStyle) then
        DblClick;
    end;
  except
    Application.HandleException(Self);
  end;
end;

procedure TcitCustomComboBox.WndProc(var Message: TMessage);
begin
    {for auto drag mode, let listbox handle itself, instead of TControl}
  if not (csDesigning in ComponentState) and
     ((Message.Msg = WM_LBUTTONDOWN) or (Message.Msg = WM_LBUTTONDBLCLK)) and
     not Dragging then
  begin
    if DragMode = dmAutomatic then
    begin
      if IsControlMouseMsg(TWMMouse(Message)) then
        Exit;
      ControlState := ControlState + [csLButtonDown];
      Dispatch(Message);  {overrides TControl's BeginDrag}
      Exit;
    end;
  end;
  with Message do
    case Msg of
      WM_CTLCOLORMSGBOX..WM_CTLCOLORSTATIC:
        begin
          SetTextColor(WParam, ColorToRGB(Font.Color));
          SetBkColor(WParam, ColorToRGB(Brush.Color));
          Result := Brush.Handle;
          Exit;
        end;
      CN_CTLCOLORMSGBOX..CN_CTLCOLORSTATIC:
        if not NewStyleControls and (Style < csDropDownList) then
        begin
          Result := Parent.Brush.Handle;
          Exit;
        end;
      WM_CHAR:
        begin
          if DoKeyPress(TWMKey(Message)) then Exit;
          if ((TWMKey(Message).CharCode = VK_RETURN) or
            (TWMKey(Message).CharCode = VK_ESCAPE)) and DroppedDown then
          begin
            DroppedDown := False;
            Exit;
          end;
        end;
    end;
  inherited WndProc(Message);
end;

procedure TcitCustomComboBox.AdjustDropDown;
var
  ItemCount: Integer;
begin
  ItemCount := FItems.Count;
  if ItemCount > DropDownCount then ItemCount := DropDownCount;
  if ItemCount < 1 then ItemCount := 1;
  SetWindowPos(Handle, 0, 0, 0, Width, ItemHeight * ItemCount +
    Height + 2, SWP_NOMOVE + SWP_NOZORDER + SWP_NOACTIVATE + SWP_NOREDRAW +
    SWP_HIDEWINDOW);
  SetWindowPos(Handle, 0, 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE +
    SWP_NOZORDER + SWP_NOACTIVATE + SWP_NOREDRAW + SWP_SHOWWINDOW);
end;

procedure TcitCustomComboBox.CNCommand(var Message: TWMCommand);
begin
  case Message.NotifyCode of
    CBN_DBLCLK:
      DblClick;
    CBN_EDITCHANGE:
      Change;
    CBN_DROPDOWN:
      begin
        FFocusChanged := False;
        DropDown;
        AdjustDropDown;
        if FFocusChanged then
        begin
          PostMessage(Handle, WM_CANCELMODE, 0, 0);
          if not FIsFocused then PostMessage(Handle, CB_SHOWDROPDOWN, 0, 0);
        end;
      end;
    CBN_SELCHANGE:
      begin
        Text := Items[ItemIndex];
        Click;
        Change;
      end;
    CBN_SETFOCUS:
      begin
        FIsFocused := True;
        FFocusChanged := True;
        SetIme;
      end;
    CBN_KILLFOCUS:
      begin
        FIsFocused := False;
        FFocusChanged := True;
        ResetIme;
      end;
  end;
end;

procedure TcitCustomComboBox.Change;
begin
  inherited Changed;
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TcitCustomComboBox.DrawItem(Index: Integer; Rect: TRect;
  State: TOwnerDrawState);
begin
  if Assigned(FOnDrawItem) then FOnDrawItem(Self, Index, Rect, State)
  else
  begin
    FCanvas.FillRect(Rect);
    FCanvas.TextOut(Rect.Left + 2, Rect.Top, Items[Index]);
  end;
end;

procedure TcitCustomComboBox.DropDown;
begin
  if Assigned(FOnDropDown) then FOnDropDown(Self);
end;

procedure TcitCustomComboBox.MeasureItem(Index: Integer; var Height: Integer);
begin
  if Assigned(FOnMeasureItem) then FOnMeasureItem(Self, Index, Height)
end;

procedure TcitCustomComboBox.CNDrawItem(var Message: TWMDrawItem);
var
  State: TOwnerDrawState;
begin
  with Message.DrawItemStruct^ do
  begin
    State := TOwnerDrawState(WordRec(LongRec(itemState).Lo).Lo);
    FCanvas.Handle := hDC;
    FCanvas.Font := Font;
    FCanvas.Brush := Brush;
    if (Integer(itemID) >= 0) and (odSelected in State) then
    begin
      FCanvas.Brush.Color := clHighlight;
      FCanvas.Font.Color := clHighlightText
    end;
    if Integer(itemID) >= 0 then
      DrawItem(itemID, rcItem, State) else
      FCanvas.FillRect(rcItem);
    if odFocused in State then DrawFocusRect(hDC, rcItem);
    FCanvas.Handle := 0;
  end;
end;

procedure TcitCustomComboBox.CNMeasureItem(var Message: TWMMeasureItem);
begin
  with Message.MeasureItemStruct^ do
  begin
    itemHeight := FItemHeight;
    if FStyle = csOwnerDrawVariable then
      MeasureItem(itemID, Integer(itemHeight));
  end;
end;

procedure TcitCustomComboBox.WMLButtonDown(var Message: TWMLButtonDown);
var
  Form: TCustomForm;
begin
  if (DragMode = dmAutomatic) and (Style = csDropDownList) and
      (Message.XPos < (Width - GetSystemMetrics(SM_CXHSCROLL))) then
  begin
    SetFocus;
    BeginDrag(False);
    Exit;
  end;
  inherited;
  if MouseCapture then
  begin
    Form := GetParentForm(Self);
    if (Form <> nil) and (Form.ActiveControl <> Self) then
      MouseCapture := False;
  end;
end;

{ TButtonControl }

procedure TcitButtonControl.WndProc(var Message: TMessage);
begin
  case Message.Msg of
    WM_LBUTTONDOWN, WM_LBUTTONDBLCLK:
      if not (csDesigning in ComponentState) and not Focused then
      begin
        FClicksDisabled := True;
        Windows.SetFocus(Handle);
        FClicksDisabled := False;
        if not Focused then Exit;
      end;
    CN_COMMAND:
      if FClicksDisabled then Exit;
  end;
  inherited WndProc(Message);
end;

{ TButton }

constructor TcitButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := [csSetCaption, csOpaque, csDoubleClicks];
  Width := 75;
  Height := 25;
  TabStop := True;
end;

procedure TcitButton.Click;
var
  Form: TCustomForm;
begin
  Form := GetParentForm(Self);
  if Form <> nil then Form.ModalResult := ModalResult;
  inherited Click;
end;

procedure TcitButton.SetButtonStyle(ADefault: Boolean);
const
  BS_MASK = $000F;
var
  Style: Word;
begin
  if HandleAllocated then
  begin
    if ADefault then Style := BS_DEFPUSHBUTTON else Style := BS_PUSHBUTTON;
    if GetWindowLong(Handle, GWL_STYLE) and BS_MASK <> Style then
      SendMessage(Handle, BM_SETSTYLE, Style, 1);
  end;
end;

procedure TcitButton.SetDefault(Value: Boolean);
var
  Form: TCustomForm;
begin
  FDefault := Value;
  if HandleAllocated then
  begin
    Form := GetParentForm(Self);
    if Form <> nil then
      Form.Perform(CM_FOCUSCHANGED, 0, Longint(Form.ActiveControl));
  end;
end;

procedure TcitButton.CreateParams(var Params: TCreateParams);
const
  ButtonStyles: array[Boolean] of LongInt = (BS_PUSHBUTTON, BS_DEFPUSHBUTTON);
begin
  inherited CreateParams(Params);
  CreateSubClass(Params, 'BUTTON');
  Params.Style := Params.Style or ButtonStyles[FDefault];
end;

procedure TcitButton.CreateWnd;
begin
  inherited CreateWnd;
  FActive := FDefault;
end;

procedure TcitButton.CNCommand(var Message: TWMCommand);
begin
  if Message.NotifyCode = BN_CLICKED then Click;
end;

procedure TcitButton.CMDialogKey(var Message: TCMDialogKey);
begin
  with Message do
    if  (((CharCode = VK_RETURN) and FActive) or
      ((CharCode = VK_ESCAPE) and FCancel)) and
      (KeyDataToShiftState(Message.KeyData) = []) and CanFocus then
    begin
      Click;
      Result := 1;
    end else
      inherited;
end;

procedure TcitButton.CMDialogChar(var Message: TCMDialogChar);
begin
  with Message do
    if IsAccel(CharCode, Caption) and CanFocus then
    begin
      Click;
      Result := 1;
    end else
      inherited;
end;

procedure TcitButton.CMFocusChanged(var Message: TCMFocusChanged);
begin
  with Message do
    if Sender is TcitButton then
      FActive := Sender = Self
    else
      FActive := FDefault;
  SetButtonStyle(FActive);
  inherited;
end;

procedure TcitButton.WMEraseBkgnd(var Message: TWMEraseBkgnd);
begin
  DefaultHandler(Message);
end;

{ TCustomCheckBox }

constructor TcitCustomCheckBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Width := 97;
  Height := 17;
  TabStop := True;
  ControlStyle := [csSetCaption, csDoubleClicks];
  FAlignment := taRightJustify;
  FState := cbUnchecked;
end;

procedure TcitCustomCheckBox.Toggle;
begin
  case State of
    cbUnchecked:
      if AllowGrayed then State := cbGrayed else State := cbChecked;
    cbChecked: State := cbUnchecked;
    cbGrayed: State := cbChecked;
  end;
end;

procedure TcitCustomCheckBox.Click;
begin
  inherited Changed;
  inherited Click;
end;

function TcitCustomCheckBox.GetChecked: Boolean;
begin
  Result := State = cbChecked;
end;

procedure TcitCustomCheckBox.SetAlignment(Value: TLeftRight);
begin
  if FAlignment <> Value then
  begin
    FAlignment := Value;
    RecreateWnd;
  end;
end;

procedure TcitCustomCheckBox.SetChecked(Value: Boolean);
begin
  if Value then State := cbChecked else State := cbUnchecked;
end;

procedure TcitCustomCheckBox.SetState(Value: TCheckBoxState);
begin
  if FState <> Value then
  begin
    FState := Value;
    if HandleAllocated then
      SendMessage(Handle, BM_SETCHECK, Integer(FState), 0);
    Click;
  end;
end;

procedure TcitCustomCheckBox.CreateParams(var Params: TCreateParams);
const
  Alignments: array[TLeftRight] of LongInt = (BS_LEFTTEXT, 0);
begin
  inherited CreateParams(Params);
  CreateSubClass(Params, 'BUTTON');
  with Params do
  begin
    Style := Style or BS_3STATE or Alignments[FAlignment];
    WindowClass.style := WindowClass.style and not (CS_HREDRAW or CS_VREDRAW);
  end;
end;

procedure TcitCustomCheckBox.CreateWnd;
begin
  inherited CreateWnd;
  SendMessage(Handle, BM_SETCHECK, Integer(FState), 0);
end;

procedure TcitCustomCheckBox.CreateWindowHandle(const Params: TCreateParams);
begin
  if Ctl3D and not NewStyleControls then
  begin      // special subclassing required by unicode Ctl3D on NT
    with Params do
      WindowHandle := CreateWindowEx(ExStyle, 'BUTTON', Caption, Style,
        X, Y, Width, Height, WndParent, 0, HInstance, Param);
    Subclass3DWnd(WindowHandle);
    DefWndProc := Pointer(GetWindowLong(WindowHandle, GWL_WNDPROC));
    CreationControl := Self;
    SetWindowLong(WindowHandle, GWL_WNDPROC, Longint(@InitWndProc));
    SendMessage(WindowHandle, WM_NULL, 0, 0);
  end
  else
    inherited CreateWindowHandle(Params);
end;

procedure TcitCustomCheckBox.WMSize(var Message: TMessage);
begin
  inherited;
  Invalidate;
end;

procedure TcitCustomCheckBox.CMCtl3DChanged(var Message: TMessage);
begin
  RecreateWnd;
end;

procedure TcitCustomCheckBox.CMDialogChar(var Message: TCMDialogChar);
begin
  with Message do
    if IsAccel(CharCode, Caption) and CanFocus then
    begin
      SetFocus;
      if Focused then Toggle;
      Result := 1;
    end else
      inherited;
end;

procedure TcitCustomCheckBox.CNCommand(var Message: TWMCommand);
begin
  if Message.NotifyCode = BN_CLICKED then Toggle;
end;

procedure TcitCustomCheckBox.WMSetFocus(var Message: TWMSetFocus);
begin // fix double focus rect drawing bug in Ctl3D when switching notebook pages
  if Ctl3D and not NewStyleControls then  UpdateWindow(Handle);
  inherited;
end;

{ TRadioButton }

constructor TcitRadioButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Width := 113;
  Height := 17;
  ControlStyle := [csSetCaption, csDoubleClicks];
  FAlignment := taRightJustify;
end;

procedure TcitRadioButton.SetAlignment(Value: TLeftRight);
begin
  if FAlignment <> Value then
  begin
    FAlignment := Value;
    RecreateWnd;
  end;
end;

procedure TcitRadioButton.SetChecked(Value: Boolean);

  procedure TurnSiblingsOff;
  var
    I: Integer;
    Sibling: TControl;
  begin
    if Parent <> nil then
      with Parent do
        for I := 0 to ControlCount - 1 do
        begin
          Sibling := Controls[I];
          if (Sibling <> Self) and (Sibling is TcitRadioButton) then
            TcitRadioButton(Sibling).SetChecked(False);
        end;
  end;

begin
  if FChecked <> Value then
  begin
    FChecked := Value;
    TabStop := Value;
    if HandleAllocated then
      SendMessage(Handle, BM_SETCHECK, Integer(Checked), 0);
    if Value then
    begin
      TurnSiblingsOff;
      inherited Changed;
      Click;
    end;
  end;
end;

procedure TcitRadioButton.CreateParams(var Params: TCreateParams);
const
  Alignments: array[TLeftRight] of LongInt = (BS_LEFTTEXT, 0);
begin
  inherited CreateParams(Params);
  CreateSubClass(Params, 'BUTTON');
  with Params do
    Style := Style or BS_RADIOBUTTON or Alignments[FAlignment];
end;

procedure TcitRadioButton.CreateWnd;
begin
  inherited CreateWnd;
  SendMessage(Handle, BM_SETCHECK, Integer(FChecked), 0);
end;

procedure TcitRadioButton.CreateWindowHandle(const Params: TCreateParams);
begin
  if Ctl3D and not NewStyleControls then
  begin      // special subclassing required by unicode Ctl3D on NT
    with Params do
      WindowHandle := CreateWindowEx(ExStyle, 'BUTTON', Caption, Style,
        X, Y, Width, Height, WndParent, 0, HInstance, Param);
    Subclass3DWnd(WindowHandle);
    DefWndProc := Pointer(GetWindowLong(WindowHandle, GWL_WNDPROC));
    CreationControl := Self;
    SetWindowLong(WindowHandle, GWL_WNDPROC, Longint(@InitWndProc));
    SendMessage(WindowHandle, WM_NULL, 0, 0);
  end
  else
    inherited CreateWindowHandle(Params);
end;

procedure TcitRadioButton.CMCtl3DChanged(var Message: TMessage);
begin
  RecreateWnd;
end;

procedure TcitRadioButton.CMDialogChar(var Message: TCMDialogChar);
begin
  with Message do
    if IsAccel(Message.CharCode, Caption) and CanFocus then
    begin
      SetFocus;
      Result := 1;
    end else
      inherited;
end;

procedure TcitRadioButton.CNCommand(var Message: TWMCommand);
begin
  case Message.NotifyCode of
    BN_CLICKED: SetChecked(True);
    BN_DOUBLECLICKED: DblClick;
  end;
end;

procedure TcitRadioButton.WMSetFocus(var Message: TWMSetFocus);
begin // fix double focus rect drawing bug in Ctl3D when switching notebook pages
  if Ctl3D and not NewStyleControls then  UpdateWindow(Handle);
  inherited;
end;


{ TListBoxStrings }

function TListBoxStrings.GetCount: Integer;
begin
  Result := SendMessage(ListBox.Handle, LB_GETCOUNT, 0, 0);
end;

function TListBoxStrings.Get(Index: Integer): string;
var
  Len: Integer;
  Text: array[0..4095] of Char;
begin
  Len := SendMessage(ListBox.Handle, LB_GETTEXT, Index, Longint(@Text));
  if Len < 0 then Error(SListIndexError, Index);
  SetString(Result, Text, Len);
end;

function TListBoxStrings.GetObject(Index: Integer): TObject;
begin
  Result := TObject(ListBox.GetItemData( Index ));
  if Longint(Result) = LB_ERR then Error(SListIndexError, Index);
end;

procedure TListBoxStrings.Put(Index: Integer; const S: string);
var
  I: Integer;
begin
  I := ListBox.ItemIndex;
  inherited Put(Index, S);
  ListBox.ItemIndex := I;
end;

procedure TListBoxStrings.PutObject(Index: Integer; AObject: TObject);
begin
  ListBox.SetItemData( Index, LongInt(AObject) );
end;

function TListBoxStrings.Add(const S: string): Integer;
begin
  Result := SendMessage(ListBox.Handle, LB_ADDSTRING, 0, Longint(PChar(S)));
  if Result < 0 then raise EOutOfResources.Create(SInsertLineError);
end;

procedure TListBoxStrings.Insert(Index: Integer; const S: string);
begin
  if SendMessage(ListBox.Handle, LB_INSERTSTRING, Index,
    Longint(PChar(S))) < 0 then
    raise EOutOfResources.Create(SInsertLineError);
end;

procedure TListBoxStrings.Delete(Index: Integer);
begin
  ListBox.DeleteString( Index );
end;

procedure TListBoxStrings.Clear;
begin
  ListBox.ResetContent;
end;

procedure TListBoxStrings.SetUpdateState(Updating: Boolean);
begin
  SendMessage(ListBox.Handle, WM_SETREDRAW, Ord(not Updating), 0);
  if not Updating then ListBox.Refresh;
end;

{ TCustomListBox }

constructor TcitCustomListBox.Create(AOwner: TComponent);
const
  ListBoxStyle = [csSetCaption, csDoubleClicks];
begin
  inherited Create(AOwner);
  if NewStyleControls then
    ControlStyle := ListBoxStyle else
    ControlStyle := ListBoxStyle + [csFramed];
  Width := 121;
  Height := 97;
  TabStop := True;
  ParentColor := False;
  FItems := TListBoxStrings.Create;
  TListBoxStrings(FItems).ListBox := Self;
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  FItemHeight := 16;
  FBorderStyle := bsSingle;
  FExtendedSelect := True;
end;

destructor TcitCustomListBox.Destroy;
begin
  FCanvas.Free;
  FItems.Free;
  FSaveItems.Free;
  inherited Destroy;
end;

function TcitCustomListBox.GetItemData(Index: Integer): LongInt;
begin
  Result := SendMessage(Handle, LB_GETITEMDATA, Index, 0);
end;

procedure TcitCustomListBox.SetItemData(Index: Integer; AData: LongInt);
begin
  SendMessage(Handle, LB_SETITEMDATA, Index, AData);
end;

procedure TcitCustomListBox.DeleteString( Index: Integer );
begin
  SendMessage(Handle, LB_DELETESTRING, Index, 0);
end;

procedure TcitCustomListBox.ResetContent;
begin
  SendMessage(Handle, LB_RESETCONTENT, 0, 0);
end;

procedure TcitCustomListBox.Clear;
begin
  FItems.Clear;
end;

procedure TcitCustomListBox.SetColumnWidth;
begin
  if (FColumns > 0) and (Width > 0) then
    SendMessage(Handle, LB_SETCOLUMNWIDTH,
      (Width + FColumns - 3) div FColumns, 0);
end;

procedure TcitCustomListBox.SetColumns(Value: Integer);
begin
  if FColumns <> Value then
    if (FColumns = 0) or (Value = 0) then
    begin
      FColumns := Value;
      RecreateWnd;
    end else
    begin
      FColumns := Value;
      if HandleAllocated then SetColumnWidth;
    end;
end;

function TcitCustomListBox.GetItemIndex: Integer;
begin
  Result := SendMessage(Handle, LB_GETCURSEL, 0, 0);
end;

function TcitCustomListBox.GetSelCount: Integer;
begin
  Result := SendMessage(Handle, LB_GETSELCOUNT, 0, 0);
end;

procedure TcitCustomListBox.SetItemIndex(Value: Integer);
begin
  if GetItemIndex <> Value then
    SendMessage(Handle, LB_SETCURSEL, Value, 0);
end;

procedure TcitCustomListBox.SetExtendedSelect(Value: Boolean);
begin
  if Value <> FExtendedSelect then
  begin
    FExtendedSelect := Value;
    RecreateWnd;
  end;
end;

procedure TcitCustomListBox.SetIntegralHeight(Value: Boolean);
begin
  if Value <> FIntegralHeight then
  begin
    FIntegralHeight := Value;
    RecreateWnd;
  end;
end;

function TcitCustomListBox.GetItemHeight: Integer;
var
  R: TRect;
begin
  Result := FItemHeight;
  if HandleAllocated and (FStyle = lbStandard) then
  begin
    Perform(LB_GETITEMRECT, 0, Longint(@R));
    Result := R.Bottom - R.Top;
  end;
end;

procedure TcitCustomListBox.SetItemHeight(Value: Integer);
begin
  if (FItemHeight <> Value) and (Value > 0) then
  begin
    FItemHeight := Value;
    RecreateWnd;
  end;
end;

procedure TcitCustomListBox.SetTabWidth(Value: Integer);
begin
  if Value < 0 then Value := 0;
  if FTabWidth <> Value then
  begin
    FTabWidth := Value;
    RecreateWnd;
  end;
end;

procedure TcitCustomListBox.SetMultiSelect(Value: Boolean);
begin
  if FMultiSelect <> Value then
  begin
    FMultiSelect := Value;
    RecreateWnd;
  end;
end;

function TcitCustomListBox.GetSelected(Index: Integer): Boolean;
var
  R: Longint;
begin
  R := SendMessage(Handle, LB_GETSEL, Index, 0);
  if R = LB_ERR then
    raise EListError.CreateFmt(SListIndexError, [Index]);
  Result := LongBool(R);
end;

procedure TcitCustomListBox.SetSelected(Index: Integer; Value: Boolean);
begin
  if SendMessage(Handle, LB_SETSEL, Longint(Value), Index) = LB_ERR then
    raise EListError.CreateFmt(SListIndexError, [Index]);
end;

procedure TcitCustomListBox.SetSorted(Value: Boolean);
begin
  if FSorted <> Value then
  begin
    FSorted := Value;
    RecreateWnd;
  end;
end;

procedure TcitCustomListBox.SetStyle(Value: TListBoxStyle);
begin
  if FStyle <> Value then
  begin
    FStyle := Value;
    RecreateWnd;
  end;
end;

function TcitCustomListBox.GetTopIndex: Integer;
begin
  Result := SendMessage(Handle, LB_GETTOPINDEX, 0, 0);
end;

procedure TcitCustomListBox.SetBorderStyle(Value: TBorderStyle);
begin
  if FBorderStyle <> Value then
  begin
    FBorderStyle := Value;
    RecreateWnd;
  end;
end;

procedure TcitCustomListBox.SetTopIndex(Value: Integer);
begin
  if GetTopIndex <> Value then
    SendMessage(Handle, LB_SETTOPINDEX, Value, 0);
end;

procedure TcitCustomListBox.SetItems(Value: TStrings);
begin
  Items.Assign(Value);
end;

function TcitCustomListBox.ItemAtPos(Pos: TPoint; Existing: Boolean): Integer;
var
  Count: Integer;
  ItemRect: TRect;
begin
  if PtInRect(ClientRect, Pos) then
  begin
    Result := TopIndex;
    Count := Items.Count;
    while Result < Count do
    begin
      Perform(LB_GETITEMRECT, Result, Longint(@ItemRect));
      if PtInRect(ItemRect, Pos) then Exit;
      Inc(Result);
    end;
    if not Existing then Exit;
  end;
  Result := -1;
end;

function TcitCustomListBox.ItemRect(Index: Integer): TRect;
var
  Count: Integer;
begin
  Count := Items.Count;
  if (Index = 0) or (Index < Count) then
    Perform(LB_GETITEMRECT, Index, Longint(@Result))
  else if Index = Count then
  begin
    Perform(LB_GETITEMRECT, Index - 1, Longint(@Result));
    OffsetRect(Result, 0, Result.Bottom - Result.Top);
  end else FillChar(Result, SizeOf(Result), 0);
end;

procedure TcitCustomListBox.CreateParams(var Params: TCreateParams);
type
  PSelects = ^TSelects;
  TSelects = array[Boolean] of Longint;
const
  Styles: array[TListBoxStyle] of Longint =
    (0, LBS_OWNERDRAWFIXED, LBS_OWNERDRAWVARIABLE);
  Sorteds: array[Boolean] of Longint = (0, LBS_SORT);
  MultiSelects: array[Boolean] of Longint = (0, LBS_MULTIPLESEL);
  ExtendSelects: array[Boolean] of Longint = (0, LBS_EXTENDEDSEL);
  IntegralHeights: array[Boolean] of Longint = (LBS_NOINTEGRALHEIGHT, 0);
  MultiColumns: array[Boolean] of Longint = (0, LBS_MULTICOLUMN);
  TabStops: array[Boolean] of Longint = (0, LBS_USETABSTOPS);
var
  Selects: PSelects;
begin
  inherited CreateParams(Params);
  CreateSubClass(Params, 'LISTBOX');
  with Params do
  begin
    Selects := @MultiSelects;
    if FExtendedSelect then Selects := @ExtendSelects;
    Style := Style or (WS_HSCROLL or WS_VSCROLL or LBS_HASSTRINGS or
      LBS_NOTIFY) or Styles[FStyle] or Sorteds[FSorted] or
      Selects^[FMultiSelect] or IntegralHeights[FIntegralHeight] or
      MultiColumns[FColumns <> 0] or BorderStyles[FBorderStyle] or
      TabStops[FTabWidth <> 0];
    if NewStyleControls and Ctl3D and (FBorderStyle = bsSingle) then
    begin
      Style := Style and not WS_BORDER;
      ExStyle := ExStyle or WS_EX_CLIENTEDGE;
    end;
    WindowClass.style := WindowClass.style and not (CS_HREDRAW or CS_VREDRAW);
  end;
end;

procedure TcitCustomListBox.CreateWnd;
var
  W, H: Integer;
begin
  W := Width;
  H := Height;
  inherited CreateWnd;
  SetWindowPos(Handle, 0, Left, Top, W, H, SWP_NOZORDER or SWP_NOACTIVATE);
  if FTabWidth <> 0 then
    SendMessage(Handle, LB_SETTABSTOPS, 1, Longint(@FTabWidth));
  SetColumnWidth;
  if FSaveItems <> nil then
  begin
    FItems.Assign(FSaveItems);
    SetTopIndex(FSaveTopIndex);
    SetItemIndex(FSaveItemIndex);
    FSaveItems.Free;
    FSaveItems := nil;
  end;
end;

procedure TcitCustomListBox.DestroyWnd;
begin
  if FItems.Count > 0 then
  begin
    FSaveItems := TStringList.Create;
    FSaveItems.Assign(FItems);
    FSaveTopIndex := GetTopIndex;
    FSaveItemIndex := GetItemIndex;
  end;
  inherited DestroyWnd;
end;

procedure TcitCustomListBox.WndProc(var Message: TMessage);
begin
  {for auto drag mode, let listbox handle itself, instead of TControl}
  if not (csDesigning in ComponentState) and ((Message.Msg = WM_LBUTTONDOWN) or
    (Message.Msg = WM_LBUTTONDBLCLK)) and not Dragging then
  begin
    if DragMode = dmAutomatic then
    begin
      if IsControlMouseMsg(TWMMouse(Message)) then
        Exit;
      ControlState := ControlState + [csLButtonDown];
      Dispatch(Message);  {overrides TControl's BeginDrag}
      Exit;
    end;
  end;
  inherited WndProc(Message);
end;

procedure TcitCustomListBox.WMLButtonDown(var Message: TWMLButtonDown);
var
  ItemNo : Integer;
  ShiftState: TShiftState;
begin
  ShiftState := KeysToShiftState(Message.Keys);
  if (DragMode = dmAutomatic) and FMultiSelect then
  begin
    if not (ssShift in ShiftState) or (ssCtrl in ShiftState) then
    begin
      ItemNo := ItemAtPos(SmallPointToPoint(Message.Pos), True);
      if (ItemNo >= 0) and (Selected[ItemNo]) then
      begin
        BeginDrag (False);
        Exit;
      end;
    end;
  end;
  inherited;
  if (DragMode = dmAutomatic) and not (FMultiSelect and
    ((ssCtrl in ShiftState) or (ssShift in ShiftState))) then
    BeginDrag(False);
end;

procedure TcitCustomListBox.CNCommand(var Message: TWMCommand);
begin
  case Message.NotifyCode of
    LBN_SELCHANGE:
      begin
        inherited Changed;
        Click;
      end;
    LBN_DBLCLK: DblClick;
  end;
end;

procedure TcitCustomListBox.WMPaint(var Message: TWMPaint);

  procedure PaintListBox;
  var
    DrawItemMsg: TWMDrawItem;
    MeasureItemMsg: TWMMeasureItem;
    DrawItemStruct: TDrawItemStruct;
    MeasureItemStruct: TMeasureItemStruct;
    R: TRect;
    Y, I, H, W: Integer;
  begin
    { Initialize drawing records }
    DrawItemMsg.Msg := CN_DRAWITEM;
    DrawItemMsg.DrawItemStruct := @DrawItemStruct;
    DrawItemMsg.Ctl := Handle;
    DrawItemStruct.CtlType := ODT_LISTBOX;
    DrawItemStruct.itemAction := ODA_DRAWENTIRE;
    DrawItemStruct.itemState := 0;
    DrawItemStruct.hDC := Message.DC;
    DrawItemStruct.CtlID := Handle;
    DrawItemStruct.hwndItem := Handle;

    { Intialize measure records }
    MeasureItemMsg.Msg := CN_MEASUREITEM;
    MeasureItemMsg.IDCtl := Handle;
    MeasureItemMsg.MeasureItemStruct := @MeasureItemStruct;
    MeasureItemStruct.CtlType := ODT_LISTBOX;
    MeasureItemStruct.CtlID := Handle;

    { Draw the listbox }
    Y := 0;
    I := TopIndex;
    GetClipBox(Message.DC, R);
    H := Height;
    W := Width;
    while Y < H do
    begin
      MeasureItemStruct.itemID := I;
      if I < Items.Count then
        MeasureItemStruct.itemData := Longint(Pointer(Items.Objects[I]));
      MeasureItemStruct.itemWidth := W;
      MeasureItemStruct.itemHeight := FItemHeight;
      DrawItemStruct.itemData := MeasureItemStruct.itemData;
      DrawItemStruct.itemID := I;
      Dispatch(MeasureItemMsg);
      DrawItemStruct.rcItem := Rect(0, Y, MeasureItemStruct.itemWidth,
        Y + MeasureItemStruct.itemHeight);
      Dispatch(DrawItemMsg);
      Inc(Y, MeasureItemStruct.itemHeight);
      Inc(I);
      if I >= Items.Count then break;
    end;
  end;

begin
  if Message.DC <> 0 then
    { Listboxes don't allow paint "sub-classing" like the other windows controls
      so we have to do it ourselves. }
    PaintListBox
  else inherited;
end;

procedure TcitCustomListBox.WMSize(var Message: TWMSize);
begin
  inherited;
  SetColumnWidth;
end;

procedure TcitCustomListBox.DragCanceled;
var
  M: TWMMouse;
  MousePos: TPoint;
begin
  with M do
  begin
    Msg := WM_LBUTTONDOWN;
    GetCursorPos(MousePos);
    Pos := PointToSmallPoint(ScreenToClient(MousePos));
    Keys := 0;
    Result := 0;
  end;
  DefaultHandler(M);
  M.Msg := WM_LBUTTONUP;
  DefaultHandler(M);
end;

procedure TcitCustomListBox.DrawItem(Index: Integer; Rect: TRect;
  State: TOwnerDrawState);
begin
  if Assigned(FOnDrawItem) then FOnDrawItem(Self, Index, Rect, State) else
  begin
    FCanvas.FillRect(Rect);
    if Index < Items.Count then
      FCanvas.TextOut(Rect.Left + 2, Rect.Top, Items[Index]);
  end;
end;

procedure TcitCustomListBox.MeasureItem(Index: Integer; var Height: Integer);
begin
  if Assigned(FOnMeasureItem) then FOnMeasureItem(Self, Index, Height)
end;

procedure TcitCustomListBox.CNDrawItem(var Message: TWMDrawItem);
var
  State: TOwnerDrawState;
begin
  with Message.DrawItemStruct^ do
  begin
    State := TOwnerDrawState(WordRec(LongRec(itemState).Lo).Lo);
    FCanvas.Handle := hDC;
    FCanvas.Font := Font;
    FCanvas.Brush := Brush;
    if (Integer(itemID) >= 0) and (odSelected in State) then
    begin
      FCanvas.Brush.Color := clHighlight;
      FCanvas.Font.Color := clHighlightText
    end;
    if Integer(itemID) >= 0 then
      DrawItem(itemID, rcItem, State) else
      FCanvas.FillRect(rcItem);
    if odFocused in State then DrawFocusRect(hDC, rcItem);
    FCanvas.Handle := 0;
  end;
end;

procedure TcitCustomListBox.CNMeasureItem(var Message: TWMMeasureItem);
begin
  with Message.MeasureItemStruct^ do
  begin
    itemHeight := FItemHeight;
    if FStyle = lbOwnerDrawVariable then
      MeasureItem(itemID, Integer(itemHeight));
  end;
end;

procedure TcitCustomListBox.CMCtl3DChanged(var Message: TMessage);
begin
  if NewStyleControls and (FBorderStyle = bsSingle) then RecreateWnd;
  inherited;
end;

{ TScrollBar }

constructor TcitScrollBar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Width := 121;
  Height := GetSystemMetrics(SM_CYHSCROLL);
  TabStop := True;
  ControlStyle := [csFramed, csDoubleClicks];
  FKind := sbHorizontal;
  FPosition := 0;
  FMin := 0;
  FMax := 100;
  FSmallChange := 1;
  FLargeChange := 1;
end;

procedure TcitScrollBar.CreateParams(var Params: TCreateParams);
const
  Kinds: array[TScrollBarKind] of LongInt = (SBS_HORZ, SBS_VERT);
begin
  inherited CreateParams(Params);
  CreateSubClass(Params, 'SCROLLBAR');
  Params.Style := Params.Style or Kinds[FKind];
end;

procedure TcitScrollBar.CreateWnd;
begin
  inherited CreateWnd;
  SetScrollRange(Handle, SB_CTL, FMin, FMax, False);
  SetScrollPos(Handle, SB_CTL, FPosition, True);
end;

procedure TcitScrollBar.SetKind(Value: TScrollBarKind);
begin
  if FKind <> Value then
  begin
    FKind := Value;
    if not (csLoading in ComponentState) then SetBounds(Left, Top, Height, Width);
    RecreateWnd;
  end;
end;

procedure TcitScrollBar.SetParams(APosition, AMin, AMax: Integer);
begin
  if AMax < AMin then
    raise EInvalidOperation.Create(SScrollBarRange);
  if APosition < AMin then APosition := AMin;
  if APosition > AMax then APosition := AMax;
  if (FMin <> AMin) or (FMax <> AMax) then
  begin
    FMin := AMin;
    FMax := AMax;
    if HandleAllocated then
      SetScrollRange(Handle, SB_CTL, AMin, AMax, FPosition = APosition);
  end;
  if FPosition <> APosition then
  begin
    FPosition := APosition;
    if HandleAllocated then SetScrollPos(Handle, SB_CTL, APosition, True);
    Change;
  end;
end;

procedure TcitScrollBar.SetPosition(Value: Integer);
begin
  SetParams(Value, FMin, FMax);
end;

procedure TcitScrollBar.SetMin(Value: Integer);
begin
  SetParams(FPosition, Value, FMax);
end;

procedure TcitScrollBar.SetMax(Value: Integer);
begin
  SetParams(FPosition, FMin, Value);
end;

procedure TcitScrollBar.Change;
begin
  inherited Changed;
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TcitScrollBar.Scroll(ScrollCode: TScrollCode; var ScrollPos: Integer);
begin
  if Assigned(FOnScroll) then FOnScroll(Self, ScrollCode, ScrollPos);
end;

procedure TcitScrollBar.DoScroll(var Message: TWMScroll);
var
  ScrollPos: Integer;
  NewPos: Longint;
  ScrollInfo: TScrollInfo;
begin
  with Message do
  begin
    NewPos := FPosition;
    case TScrollCode(ScrollCode) of
      scLineUp:
        Dec(NewPos, FSmallChange);
      scLineDown:
        Inc(NewPos, FSmallChange);
      scPageUp:
        Dec(NewPos, FLargeChange);
      scPageDown:
        Inc(NewPos, FLargeChange);
      scPosition, scTrack:
        with ScrollInfo do
        begin
          cbSize := SizeOf(ScrollInfo);
          fMask := SIF_ALL;
          GetScrollInfo(Handle, SB_CTL, ScrollInfo);
          NewPos := nTrackPos;
        end;
      scTop:
        NewPos := FMin;
      scBottom:
        NewPos := FMax;
    end;
    if NewPos < FMin then NewPos := FMin;
    if NewPos > FMax then NewPos := FMax;
    ScrollPos := NewPos;
    Scroll(TScrollCode(ScrollCode), ScrollPos);
    SetPosition(ScrollPos);
  end;
end;

procedure TcitScrollBar.CNHScroll(var Message: TWMHScroll);
begin
  DoScroll(Message);
end;

procedure TcitScrollBar.CNVScroll(var Message: TWMVScroll);
begin
  DoScroll(Message);
end;

procedure TcitScrollBar.CNCtlColorScrollBar(var Message: TMessage);
begin
  with Message do
    CallWindowProc(DefWndProc, Handle, Msg, WParam, LParam);
end;

procedure TcitScrollBar.WMEraseBkgnd(var Message: TWMEraseBkgnd);
begin
  DefaultHandler(Message);
end;

{ TCustomStaticText }

constructor TCustomStaticText.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := [csCaptureMouse, csClickEvents, csSetCaption,
    csOpaque, csReplicatable, csDoubleClicks];
  Width := 65;
  Height := 17;
  FAutoSize := True;
  FShowAccelChar := True;
  AdjustBounds;
end;

procedure TCustomStaticText.CreateParams(var Params: TCreateParams);
const
  Alignments: array[TAlignment] of Integer = (SS_LEFT, SS_RIGHT, SS_CENTER);
  Borders: array[TStaticBorderStyle] of Integer = (0, WS_BORDER, SS_SUNKEN);
begin
  inherited CreateParams(Params);
  CreateSubClass(Params, 'STATIC');
  with Params do
  begin
    Style := Style or SS_NOTIFY or Alignments[FAlignment] or Borders[FBorderStyle];
    if not FShowAccelChar then Style := Style or SS_NOPREFIX;
  end;
end;

procedure TCustomStaticText.CMDialogChar(var Message: TCMDialogChar);
begin
  if (FFocusControl <> nil) and Enabled and ShowAccelChar and
    IsAccel(Message.CharCode, Caption) then
    with FFocusControl do
      if CanFocus then
      begin
        SetFocus;
        Message.Result := 1;
      end;
end;

procedure TCustomStaticText.CMFontChanged(var Message: TMessage);
begin
  inherited;
  AdjustBounds;
end;

procedure TCustomStaticText.CMTextChanged(var Message: TMessage);
begin
  inherited;
  AdjustBounds;
end;

procedure TCustomStaticText.Loaded;
begin
  inherited Loaded;
  AdjustBounds;
end;

procedure TCustomStaticText.AdjustBounds;
var
  DC: HDC;
  SaveFont: HFont;
  TextSize: TSize;
begin
  if not (csReading in ComponentState) and FAutoSize then
  begin
    DC := GetDC(0);
    SaveFont := SelectObject(DC, Font.Handle);
    GetTextExtentPoint32(DC, PChar(Caption), Length(Caption), TextSize);
    SelectObject(DC, SaveFont);
    ReleaseDC(0, DC);
    SetBounds(Left, Top,
      TextSize.cx + (GetSystemMetrics(SM_CXBORDER) * 4),
      TextSize.cy + (GetSystemMetrics(SM_CYBORDER) * 4));
  end;
end;

procedure TCustomStaticText.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FFocusControl) then
    FFocusControl := nil;
end;

procedure TCustomStaticText.SetAlignment(Value: TAlignment);
begin
  if FAlignment <> Value then
  begin
    FAlignment := Value;
    RecreateWnd;
  end;
end;

procedure TCustomStaticText.SetAutoSize(Value: Boolean);
begin
  if FAutoSize <> Value then
  begin
    FAutoSize := Value;
    if Value then AdjustBounds;
  end;
end;

procedure TCustomStaticText.SetBorderStyle(Value: TStaticBorderStyle);
begin
  if FBorderStyle <> Value then
  begin
    FBorderStyle := Value;
    RecreateWnd;
  end;
end;

procedure TCustomStaticText.SetFocusControl(Value: TWinControl);
begin
  FFocusControl := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

procedure TCustomStaticText.SetShowAccelChar(Value: Boolean);
begin
  if FShowAccelChar <> Value then
  begin
    FShowAccelChar := Value;
    RecreateWnd;
  end;
end;

end.
