unit citDbGrid;

{$R-}

interface

uses
  citUtils, citComponentProps, citCursors, COMPSQLBuilder,
  citDBGridUtils,
  Windows, SysUtils, Messages, Classes, Controls, Forms, StdCtrls, Math,
  Graphics, Grids, DBGrids, DBCtrls, Db, Menus, DBTables, ComCtrls, IniFiles;

const
  DefaultTitleHeight    = 17;
  chrLevel              = '%';

type
  TcitDBGrid = class;
  TGetKeyEvent = function (Sender: TObject; DataSet: TDataSet): string of object;
  TGetCaptionEvent = function (Sender: TObject; DataSet: TDataSet): string of object;
  TIsCheckedEvent = function (Sender: TObject; DataSet: TDataSet): boolean of object;
  TIterForEachSelectProc = procedure (Key: string; Params: pointer) of object;
  TIterForEachRowsProc = procedure (Grid: TcitDBGrid; Params: pointer) of object;
  TBuildQueryEvent = procedure (Sender: TcitDBGrid; Query: TDataSet) of object;
  TTitlePressedEvent = procedure (Sender : TcitDBGrid; Field : TField) of object;
  TReleaseQueryEvent = procedure (Sender : TcitDBGrid; Field : TField;
                                  var ReleaseButton : boolean) of object;
  TEnableColPressQueryEvent = procedure (Sender : TcitDBGrid; Field : TField;
                                         var EnableColPress : boolean) of object;
  TReleaseGroupEvent = procedure (Sender : TcitDBGrid) of object;
  TUserDrawTitleCellEvent = procedure (Sender: TObject; const Rect: TRect;
                              ACol: LongInt; Column: TColumn) of object;

  TItemInsertEvent = function (Sender: TcitDBGrid; var aKey: string): boolean of object;
  TItemUpdateEvent = function (Sender: TcitDBGrid; aKey: string): boolean of object;
  TItemDeleteEvent = function (Sender: TcitDBGrid; aKey: string): boolean of object;

  TProfileString        = string[255];

  TLevelData = class
    FDisplayLabel       : TProfileString;
    FOrientation        : TTextOrientation;
    FMinimalHeight      : integer;
  public
    constructor Create;
    function  LevelToProfileData(var pProfileData: string): integer; // возвращает код ошибки 0 - все ок

    property DisplayLabel: TProfileString read FDisplayLabel write FDisplayLabel;
    property Orientation: TTextOrientation read FOrientation write FOrientation;
    property MinimalHeight: integer read FMinimalHeight write FMinimalHeight;
  end;

  TFieldProfileData = class
  private
    FFieldName          : TProfileString;
    FDisplayLabel       : TProfileString;
    FMask               : TProfileString;
    FOrientation        : TTextOrientation;
    FVisible            : boolean;
    FDisplayWidth       : integer;
    FMinimalHeight      : integer;
    FIsLoad             : boolean;
    FItems              : TList;
    FReadOnly           : boolean;

    FGrid               : TcitDBGrid;
    FField              : TField;
  protected
    procedure SetDisplayLabel(const Value: TProfileString);
    procedure SetFieldName(const Value: TProfileString);
    procedure SetDisplayWidth(const Value: integer);
    procedure SetIsLoad(const Value: boolean);
    procedure SetMask(const Value: TProfileString);
    procedure SetMinimalHeight(const Value: integer);
    procedure SetOrientation(const Value: TTextOrientation);
    procedure SetReadOnly(const Value: boolean);
    procedure SetVisible(const Value: boolean);
  public
    constructor Create(AFieldName: string; pGrid: TcitDBGrid);
    destructor  Destroy; override;

    function  SaveToProfileData(var pProfileData: string): integer; // возвращает код ошибки 0 - все ок
    function  LoadFromProfilesData(pProfileData: string; pDefProfileData: string; pLoadOnlyDefault: boolean): integer; // возвращает код ошибки 0 - все ок

    procedure ProfileToColumn;
    function  AutoLinkToField(pDataSet: TDataSet): boolean;
    procedure Clear;
    function  FieldToProfileData(pField: TField; var pProfileData: string): integer; // возвращает код ошибки 0 - все ок
    procedure UpdateProfileData;

    property FieldName: TProfileString read FFieldName write SetFieldName;
    property DisplayLabel: TProfileString read FDisplayLabel write SetDisplayLabel;
    property Mask: TProfileString read FMask write SetMask;
    property Orientation: TTextOrientation read FOrientation write SetOrientation;
    property Visible: boolean read FVisible write SetVisible;
    property DisplayWidth: integer read FDisplayWidth write SetDisplayWidth;
    property MinimalHeight: integer read FMinimalHeight write SetMinimalHeight;
    property IsLoad: boolean read FIsLoad write SetIsLoad;
    property Items: TList read FItems;
    property ReadOnly: boolean read FReadOnly write SetReadOnly;
    property Grid: TcitDBGrid read FGrid write FGrid;
    property Field: TField read FField write FField;
  end;

  TFieldProfiles = class
  private
    FItems              : TList;
    FDefaultItem        : TFieldProfileData;
    FDBGrid             : TcitDBGrid;
    FRepaintEnabled     : boolean;
  protected
    function Get(Index: Integer): TFieldProfileData;
    function GetByFieldName(pFieldName: string): TFieldProfileData;
  public
    constructor Create(pDBGrid: TcitDBGrid);
    destructor  Destroy; override;

    procedure Clear;
    procedure ClearLinks;
    function  Add(pFieldName: string; pField: TField = nil): integer;
    procedure Delele(pFieldName: string); overload;
    procedure Delele(Index: integer); overload;
    function  Count: integer;

    function  GetOnFieldName(pFieldName: string): TFieldProfileData;
    function  IndexOnFieldName(pFieldName: string): integer;
    procedure RepaintGrid;
    function  AutoLinkToFields: integer; // возвращает колличество неприсоединенных
    procedure SaveAllFieldDataToProfile(pProfileData: TStrings; pGrid: TcitDBGrid);
    function  LoadAllProfiles(pProfileData, pDefProfileData: TStrings; pLoadOnlyDefault: boolean): integer; // возвращает код ошибки 0 - все ок

    property Items[Index: Integer]: TFieldProfileData read Get; default;
    property ItemsByFieldName[pFieldName: string]: TFieldProfileData read GetByFieldName;
    property RepaintEnabled: boolean read FRepaintEnabled write FRepaintEnabled;
    property DefaultItem: TFieldProfileData read FDefaultItem;
  end;

  TcitDBGrid = class(TCustomDBGrid)
  private
    FMarkDisabled: boolean;
    FMarkColor: TColor;
    FMarkFont: TFont;
    FLightedColor: TColor;
    FLightedFont: TFont;
    FDisabledColor: TColor;
    FDisabledFont: TFont;
    FOnGetKey: TGetKeyEvent;
    FOnGetCaption: TGetCaptionEvent;
    FOnIsLighted: TIsCheckedEvent;
    FOnIsDisabled: TIsCheckedEvent;
    FOnBuildQuery: TBuildQueryEvent;
    FOnTestBeforeMark: TIsCheckedEvent;
    FMarkItems: TStringList;
    FStatusBar: TStatusBar;
    FFormat: TStrings;
    FFormatDef: TStrings;
    FImageFields: TStrings;
    FImages: TImageList;
    FTitlePressed : boolean;
    FOnTitlePressed : TTitlePressedEvent;
    FOnReleaseQuery : TReleaseQueryEvent;
    FOnEnableColPressQuery : TEnableColPressQueryEvent;
    FOnReleaseGroup : TReleaseGroupEvent;
    FOnUserDrawTitleCell : TUserDrawTitleCellEvent;
    FMultiPress : boolean;
    FLastPressed : integer;
    FEnableTitlePress : boolean;
    FMarkShortCut : TShortCut;
    FPropStorage : TcitComponentProps;
    FPressedList : TStringList;
    FPressedBtns : TStringList;
    FSaveOnClose : boolean;
    FTitleGlyph : TBitmap;
    FUpGlyph, FDownGlyph : TBitmap;
    FSQLBuilder: TTargetSQLBuilder;
    FOnItemInsert: TItemInsertEvent;
    FOnItemUpdate: TItemUpdateEvent;
    FOnItemDelete: TItemDeleteEvent;
    FTitleHeight: Integer;
    FFixedCols: Integer;
    FRedrawFlag: Boolean;
    FDrawRow : integer;
    FRepositionRecord: Boolean;
    FCanRenameColumns: boolean;
    FLoadOnlyFromDefault: boolean;

    FFldProfiles: TFieldProfiles;
    FEndEllipsis: boolean;
    FFixedColumnLayout: TTextLayout;

    FShowVScrollBar: boolean;
    FShowHScrollBar: boolean;
    FTitleColor: TColor;

    function GetOrderBy : string;
    procedure SetTitleGlyph(Value : TBitmap);
    procedure SetPropStorage(Value : TcitComponentProps);
    function GetIsMarked: boolean;
    procedure SetIsMarked(Value: boolean);
    function GetIsLighted: boolean;
    function GetIsDisabled: boolean;
    procedure SetMarkFont(Value: TFont);
    procedure SetLightedFont(Value: TFont);
    procedure SetDisabledFont(Value: TFont);
    procedure InvertRowMark;
    procedure MarkCountToStatusBar;
    function GetMarkEnabled: boolean;
    function GetPosition: string;
    procedure SetPosition(aPos: string);
    function GetCaption: string;
    function GetTestBeforeMark: boolean;
    procedure SetImageFields(Value: TStrings);
    procedure InvertRowMarkIterProc(Grid: TcitDBGrid; Params: pointer);
    procedure SaveFormatOnClose;
    procedure CheckOnDefaultSavedProps();
    Procedure WMNCCalcSize( Var msg: TMessage );
      message WM_NCCALCSIZE;
  protected
    procedure DrawColumnCell(const Rect: TRect; DataCol: Integer;
      Column: TColumn; State: TGridDrawState); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyUp(var Key: Word; Shift: TShiftState); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect;
      AState: TGridDrawState); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure Loaded; override;
    procedure BuildQuery; virtual;
    procedure SetTitleHeight(Value: Integer);
    procedure LayoutChanged; override;
    function GetFixedCols: Integer;
    procedure SetFixedCols(Value: Integer);
    function CalcTitleRect(Col: TColumn; ARow: Integer;
                           var MasterCol: TColumn): TRect;
    procedure SetRedrawFlag(Value: Boolean);
    function SelectCell(ACol, ARow: Longint): Boolean; override;
    procedure TopLeftChanged; override;
    procedure ColEnter; override;
    function GetTitleOffset: Byte;
    function DoMouseWheelDown(Shift: TShiftState; MousePos: TPoint): Boolean; override;
    function DoMouseWheelUp(Shift: TShiftState; MousePos: TPoint): Boolean; override;
    procedure SetEndEllipsis(const Value: boolean);
    procedure SetFixedColumnLayout(const Value: TTextLayout);
    procedure SetTitleColor(Value: TColor);


  public
    property Canvas;
    property SelectedRows;
   {----------------------------------------------}
    property OrderBy : string read GetOrderBy;
    property PressedBtns : TStringList read FPressedBtns;
   {----------------------------------------------}
    property MarkItems: TStringList read FMarkItems;
    property Position: string read GetPosition write SetPosition;
    property Caption: string read GetCaption;
    property IsMarked: boolean read GetIsMarked write SetIsMarked;
    property IsLighted: boolean read GetIsLighted;
    property IsDisabled: boolean read GetIsDisabled;
    property MarkEnabled: boolean read GetMarkEnabled;
    property TestBeforeMark: boolean read GetTestBeforeMark;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure MarkReset;
    procedure MarkAll;
    procedure MarkInvert;
    procedure ForEachSelect(Proc: TIterForEachSelectProc; Params: pointer;
      CommonAVI : TCommonAVI);
    procedure ForEachRows(Proc: TIterForEachRowsProc; Params: pointer;
      CommonAVI : TCommonAVI);
    procedure SaveFormat;
    procedure RestoreFormat;
    procedure SaveFormatToStorage;
    procedure RestoreFormatFromStorage;
    procedure RestoreDefaultFormat;    
    procedure Reopen;
    procedure Refresh;
    procedure Reposition(Key: string);
    procedure ChangeLayout;
    procedure DefaultTitleDrawCell(ACol: LongInt; ARect: TRect); virtual;
    procedure ItemInsert;
    procedure ItemUpdate;
    procedure ItemDelete;
// 04.12.2003 Bolkonskiy A.V. start
    procedure CopyGridToClipboard ;
// 04.12.2003 Bolkonskiy A.V. end;
// 16.01.2004 AAndy start
    procedure CopyGridToExcel ;
    procedure CopyGridToOOCalc;
    procedure SetFieldWidth(Field: TField; aIndex: integer; aFieldName, aDisplayLabel: string;
      aDisplayWidth: integer; aVisible: boolean);
// AAndy end;
    property FldProfiles: TFieldProfiles read FFldProfiles;
  published
    {----------------------------------------------}
    property MarkDisabled: boolean read FMarkDisabled write FMarkDisabled;
    property MarkColor: TColor read FMarkColor write FMarkColor;
    property MarkFont: TFont read FMarkFont write SetMarkFont;
    property LightedFont: TFont read FLightedFont write SetLightedFont;
    property LightedColor: TColor read FLightedColor write FLightedColor;
    property DisabledFont: TFont read FDisabledFont write SetDisabledFont;
    property DisabledColor: TColor read FDisabledColor write FDisabledColor;
    property OnGetKey: TGetKeyEvent read FOnGetKey write FOnGetKey;
    property OnGetCaption: TGetCaptionEvent read FOnGetCaption write FOnGetCaption;
    property OnIsDisabled: TIsCheckedEvent read FOnIsDisabled write FOnIsDisabled;
    property OnIsLighted: TIsCheckedEvent read FOnIsLighted write FOnIsLighted;
    property OnBuildQuery: TBuildQueryEvent read FOnBuildQuery write FOnBuildQuery;
    property OnTestBeforeMark: TIsCheckedEvent read FOnTestBeforeMark write FOnTestBeforeMark;
    property StatusBar: TStatusBar read FStatusBar write FStatusBar;
    property ImageFields: TStrings read FImageFields write SetImageFields;
    property Images: TImageList read FImages write FImages;
    {----------------------------------------------}
    property MultiPress : boolean read FMultiPress write FMultiPress;
    property EnableTitlePress : boolean read FEnableTitlePress
                                        write FEnableTitlePress;
    property MarkShortCut : TShortCut read FMarkShortCut write FMarkShortCut;
    property SaveOnClose : boolean read FSaveOnClose write FSaveOnClose;
    property PropStorage : TcitComponentProps read FPropStorage
                                              write SetPropStorage;
    property OnTitlePressed : TTitlePressedEvent read FOnTitlePressed
                                                 write FOnTitlePressed;
    property OnReleaseQuery : TReleaseQueryEvent read FOnReleaseQuery
                                                 write FOnReleaseQuery;
    property OnEnableColPressQuery : TEnableColPressQueryEvent
      read FOnEnableColPressQuery write FOnEnableColPressQuery;
    property OnReleaseGroup : TReleaseGroupEvent read FOnReleaseGroup
                                                 write FOnReleaseGroup;
    property OnUserDrawTitleCell : TUserDrawTitleCellEvent
      read FOnUserDrawTitleCell write FOnUserDrawTitleCell;
    property TitleGlyph : TBitmap read FTitleGlyph write SetTitleGlyph;
    property SQLBuilder: TTargetSQLBuilder read FSQLBuilder write FSQLBuilder;
    property OnItemInsert: TItemInsertEvent read FOnItemInsert write FOnItemInsert;
    property OnItemUpdate: TItemUpdateEvent read FOnItemUpdate write FOnItemUpdate;
    property OnItemDelete: TItemDeleteEvent read FOnItemDelete write FOnItemDelete;
    property TitleHeight: integer read FTitleHeight write SetTitleHeight;
    property ShowVScrollBar: boolean read FShowVScrollBar write FShowVScrollBar default true;
    property ShowHScrollBar: boolean read FShowHScrollBar write FShowHScrollBar default true;
    property TitleColor: TColor read FTitleColor write SetTitleColor;

    {----------------------------------------------}
    property Align;
    property BorderStyle;
    property Color;
    property Columns stored False; //StoreColumns;
    property Ctl3D;
    property DataSource;
    property DefaultDrawing;
    property DragCursor;
    property DragMode;
    property Enabled;
    property FixedColor;
    property Font;
    property ImeMode;
    property ImeName;
    property Options;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property TitleFont;
    property Visible;
    property OnCellClick;
    property OnColEnter;
    property OnColExit;
    property OnColumnMoved;
    property OnDrawDataCell;  { obsolete }
    property OnDrawColumnCell;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEditButtonClick;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnStartDrag;
    property OnTitleClick;
    property OnMouseDown;
    property OnMouseUp;
    property OnMouseMove;
    property FixedCols: Integer read GetFixedCols write SetFixedCols default 0;
    property RepositionRecord: boolean read FRepositionRecord write FRepositionRecord default True;
    property CanRenameColumns: boolean read FCanRenameColumns write FCanRenameColumns default True;
    property LoadOnlyFromDefault: boolean read FLoadOnlyFromDefault write FLoadOnlyFromDefault default False;
    property EndEllipsis: boolean read FEndEllipsis write SetEndEllipsis default True;
    property FixedColumnLayout: TTextLayout read FFixedColumnLayout write SetFixedColumnLayout default tlTop;
  end;

function DecodeOnlyFieldName(FormatString: string): string;

procedure Register;

implementation

uses
  citDBGridLayoutDlg,
  citDBGridLayout,
  {citProgressDlg,} ComObj, Dialogs, TypInfo, Clipbrd, Variants, Activex;

procedure Register;
begin
  RegisterComponents('CIT Db', [TcitDBGrid]);
end;

{ Common }

function DecodeOnlyFieldName(FormatString: string): string;
begin
  Result := GetToken('=', FormatString);
end;

{ TcitDBGrid }

constructor TcitDBGrid.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  UsesBitmap;
  FTitleColor := clBtnFace;
  FTitleHeight := DefaultTitleHeight;
  FMarkItems := TStringList.Create;
  FMarkItems.Sorted := True;
  FMarkItems.Duplicates := Classes.dupIgnore;
  FFormat := TStringList.Create;
  FFormatDef := TStringList.Create;
  FImageFields := TStringList.Create;
  FMarkFont := TFont.Create;
  FMarkFont.Color := clNavy;
  FMarkColor := clAqua;
  FLightedFont := TFont.Create;
  FLightedFont.Color := clMaroon;
  FLightedColor := clWindow;
  FDisabledFont := TFont.Create;
  FDisabledFont.Color := clSilver;
  FDisabledColor := clWindow;
  FMarkDisabled := False;
  FMarkShortCut := ShortCut(VK_F5, []);
  FPressedList := TStringList.Create;
  FPressedBtns := TStringList.Create;
  FLastPressed := -1;
  FSaveOnClose := True;
  FTitleGlyph := TBitmap.Create;
  FUpGlyph := TBitmap.Create;
  FDownGlyph := TBitmap.Create;
  FRepositionRecord := True;

  FFixedCols := 0;
  FRedrawFlag := True;
  FCanRenameColumns := True;
  FLoadOnlyFromDefault := False;
  FEndEllipsis := True;

  FFldProfiles := TFieldProfiles.Create(Self);
  FFldProfiles.FRepaintEnabled := False;
  FFixedColumnLayout := tlTop;

  FShowVScrollBar := true;
  FShowHScrollBar := true;
end;

destructor TcitDBGrid.Destroy;
begin
  FFldProfiles.Free;
  FMarkItems.Free;
  FFormat.Free;
  FFormatDef.Free;
  FImageFields.Free;
  FMarkFont.Free;
  FLightedFont.Free;
  FDisabledFont.Free;
  FPressedList.Free;
  FPressedBtns.Free;
  FTitleGlyph.Free;
  FUpGlyph.Free;
  FDownGlyph.Free;
  inherited Destroy;
  ReleaseBitmap;
end;

function TcitDBGrid.GetMarkEnabled: boolean;
begin
  Result := False;
  if not MarkDisabled then
    if Assigned(FOnGetKey) then
      if Assigned(DataSource) then
        if Assigned(DataSource.DataSet) then
          if DataSource.DataSet.State = dsBrowse then
            Result := True;
end;

procedure TcitDBGrid.DefaultTitleDrawCell(ACol: LongInt; ARect: TRect);
var
  Bitmap        : TBitmap;
  ARect1        : TRect;
  vColumn       : TColumn;
begin
  ARect1 := ARect;

  if (FLastPressed > -1) or (FPressedList.Count > 0) then
  with FPressedList do
  begin
    DrawEdge(Canvas.Handle, ARect, EDGE_SUNKEN, BF_BOTTOMRIGHT);
    DrawEdge(Canvas.Handle, ARect, EDGE_SUNKEN, BF_TOPLEFT); // InflateRect
    Inc(ARect.Left);
    Inc(ARect.Top);
    if RawToDataColumn(ACol) > -1 then
    begin
      vColumn := Columns[RawToDataColumn(ACol)];
    with vColumn do
    begin
      Bitmap := FUpGlyph;
      if FPressedBtns.IndexOf(FieldName) > -1 then
        if (ACol = FLastPressed) and not FMultiPress and
           (integer(FPressedBtns.Objects[FPressedBtns.IndexOf(FieldName)]) = 0)
           then Bitmap := FDownGlyph;

      if IndexOf(FieldName) > -1 then
        if (ACol <> FLastPressed) and
          (integer(Objects[IndexOf(FieldName)]) > 0) then Bitmap := FDownGlyph;

      if (Bitmap.Handle <> 0) then
        if (ARect.Right-ARect.Left >= Bitmap.Width) then
          Canvas.Draw(ARect.Right-Bitmap.Width, ARect.Top-1, Bitmap);

      WriteTextEh(Canvas, ARect1, 1, 1, Title.Caption
        , Columns[RawToDataColumn(ACol)].Title.Alignment, FFixedColumnLayout, True, EndEllipsis, 2, 2
        , FFldProfiles.ItemsByFieldName[vColumn.FieldName].Orientation = toVertical);

      with Canvas do
      if IndexOf(FieldName) > -1 then
        if ARect.Right-ARect.Left >=
           Bitmap.Width + TextWidth(IntToStr(IndexOf(FieldName)+1)) then
        begin
          Canvas.Refresh;
          Font.Color := clGrayText;
          TextOut(ARect.Right - TextWidth(IntToStr(IndexOf(FieldName)+1)) - Bitmap.Width,
                  ARect.Bottom - TextHeight(IntToStr(IndexOf(FieldName)+1)),
                  IntToStr(IndexOf(FieldName)+1));
        end;
    end;
    end;
  end else
  with FPressedBtns do
  if ACol > 0 then
    with Columns[RawToDataColumn(ACol)] do
    if (RawToDataColumn(ACol) > -1) and (IndexOf(FieldName) > -1) then
    begin
      Bitmap := FUpGlyph;
      if integer(Objects[IndexOf(FieldName)]) > 0 then Bitmap := FDownGlyph;

      if (Bitmap.Handle <> 0) then
        if (ARect.Right-ARect.Left >= Bitmap.Width) then
        Canvas.Draw(ARect.Right-Bitmap.Width, ARect.Top-1, Bitmap);

      with Canvas do
      if not MultiPress then Canvas.Refresh
      else
        if ARect.Right-ARect.Left >=
           Bitmap.Width + TextWidth(IntToStr(IndexOf(FieldName)+1)) then
      begin
        Canvas.Refresh;
        Font.Color := clGrayText;
        TextOut(ARect.Right - TextWidth(IntToStr(IndexOf(FieldName)+1)) - Bitmap.Width,
                ARect.Bottom - TextHeight(IntToStr(IndexOf(FieldName))) - 1,
                IntToStr(IndexOf(FieldName)+1));
      end;
    end;

  if ACol <= 0 then
  begin
    if FLoadOnlyFromDefault then Canvas.Brush.Color := clRed
    else Canvas.Brush.Color := clGreen;
    Canvas.Pen.Color := clBlack;
    Canvas.Pen.Width := 1;
    Canvas.Brush.Style := bsSolid;
    ARect1 := ARect;
    InflateRect(ARect1, -2, -2);
    ARect1.Bottom := ARect1.Top + 5;
    ARect1.Right := ARect1.Left + 5;
    Canvas.Ellipse(ARect1);
  end;
end;

procedure TcitDBGrid.DrawCell(ACol, ARow: Longint; ARect: TRect;
  AState: TGridDrawState);
var
  FrameOffs     : Byte;
  ARect1        : TRect;

  procedure DrawTitleCell(ACol, ARow: Integer; AColumn: TColumn; var AState: TGridDrawState);
  const
    ScrollArrows: array [Boolean, Boolean] of Integer =
      ((DFCS_SCROLLRIGHT, DFCS_SCROLLLEFT), (DFCS_SCROLLLEFT, DFCS_SCROLLRIGHT));
  var
    vMasterCol: TColumn;
    TitleRect, TextRect, ButtonRect: TRect;
    I: Integer;
    InBiDiMode: Boolean;
  begin
    TitleRect := CalcTitleRect(AColumn, ARow, vMasterCol);

    if vMasterCol = nil then
    begin
      Canvas.FillRect(ARect);
      Exit;
    end;

    Canvas.Font := vMasterCol.Title.Font;
    Canvas.Brush.Color := vMasterCol.Title.Color;
    if [dgRowLines, dgColLines] * Options = [dgRowLines, dgColLines] then
      InflateRect(TitleRect, -1, -1);
    TextRect := TitleRect;
    I := GetSystemMetrics(SM_CXHSCROLL);
    if ((TextRect.Right - TextRect.Left) > I) and vMasterCol.Expandable then
    begin
      Dec(TextRect.Right, I);
      ButtonRect := TitleRect;
      ButtonRect.Left := TextRect.Right;
      I := SaveDC(Canvas.Handle);
      try
        Canvas.FillRect(ButtonRect);
        InflateRect(ButtonRect, -1, -1);
        IntersectClipRect(Canvas.Handle, ButtonRect.Left,
          ButtonRect.Top, ButtonRect.Right, ButtonRect.Bottom);
        InflateRect(ButtonRect, 1, 1);
        InBiDiMode := Canvas.CanvasOrientation = coRightToLeft;
        if InBiDiMode then
          Inc(ButtonRect.Right, GetSystemMetrics(SM_CXHSCROLL) + 4);
        DrawFrameControl(Canvas.Handle, ButtonRect, DFC_SCROLL,
          ScrollArrows[InBiDiMode, vMasterCol.Expanded] or DFCS_FLAT);
      finally
        RestoreDC(Canvas.Handle, I);
      end;
    end;

    with vMasterCol.Title do
      WriteTextEh(Canvas, TextRect, FrameOffs, FrameOffs,
        Caption, Alignment, FFixedColumnLayout, True, EndEllipsis, 1, 1
        , FFldProfiles.ItemsByFieldName[AColumn.FieldName].Orientation = toVertical);

    if [dgRowLines, dgColLines] * Options = [dgRowLines, dgColLines] then
    begin
      InflateRect(TitleRect, 1, 1);
      DrawEdge(Canvas.Handle, TitleRect, BDR_RAISEDINNER, BF_BOTTOMRIGHT);
      DrawEdge(Canvas.Handle, TitleRect, BDR_RAISEDINNER, BF_TOPLEFT);
    end;
    AState := AState - [gdFixed];
  end;

var
  MasterCol,Column: TColumn;
  TitleRect: TRect;
{  LeftPoint,i: Integer;
  LineHeight: Integer;}
//  Strs: TStringList;

  OldActive: Integer;
  Highlight: Boolean;
  Value: string;
  DrawColumn: TColumn;
  TitleOffset: Integer;
  OldCol, OldRow: Integer;
  OldRect: TRect;
  OldState: TGridDrawState;
begin
  FDrawRow := ARow;
  OldCol := ACol;
  OldRow := ARow;
  OldRect := ARect;
  OldState := AState;
  TitleOffset := GetTitleOffset;
  ARect1 := ARect;

  //Multiline
  if (dgTitles in Options) and (ARow=0) and ((ACol>0) or (not (dgIndicator in Options))) then
  begin
    if dgIndicator in Options then Column:=Columns[ACol-1] else Column:=Columns[ACol];
    TitleRect:=CalcTitleRect(Column, ARow, MasterCol);
    if MasterCol = nil then
    begin
      Canvas.Brush.Color := FixedColor;
      Canvas.FillRect(ARect);
      Exit;
    end;
    Canvas.Font := MasterCol.Title.Font;
    Canvas.Brush.Color := FTitleColor; //MasterCol.Title.Color;
    Canvas.FillRect(TitleRect);

    WriteTextEh(Canvas, ARect1, 1, 1, MasterCol.Title.Caption,
      Column.Title.Alignment, FFixedColumnLayout, True, EndEllipsis, 1, 1
      , FFldProfiles.ItemsByFieldName[Column.FieldName].Orientation = toVertical);

    if [dgRowLines, dgColLines]*Options=[dgRowLines, dgColLines] then
    begin
      DrawEdge(Canvas.Handle, TitleRect, BDR_RAISEDINNER, BF_BOTTOMRIGHT);
      DrawEdge(Canvas.Handle, TitleRect, BDR_RAISEDINNER, BF_TOPLEFT);
    end;
  end
  else
  begin
      //inherited DrawCell(ACol, ARow, ARect, AState);
    if (ARow >= TitleOffset) and (ACol >= IndicatorOffset) then
      AState := AState - [gdFixed];

    if (gdFixed in AState) and (ACol < IndicatorOffset) then
    begin
      inherited DrawCell(ACol, ARow, ARect, AState);
    end
    else
    begin
      if csLoading in ComponentState then
      begin
        Canvas.Brush.Color := Color;
        Canvas.FillRect(ARect);
        Exit;
      end;

      Dec(ARow, TitleOffset);
      Dec(ACol, IndicatorOffset);

      if (gdFixed in AState) and ([dgRowLines, dgColLines] * Options =
        [dgRowLines, dgColLines]) then
      begin
        InflateRect(ARect, -1, -1);
        FrameOffs := 1;
      end
      else FrameOffs := 2;

      DrawColumn := Columns[ACol];
      if DrawColumn.Showing then
      begin
        with Canvas do
        begin
          if not (gdFixed in AState) then
          begin
            Font := DrawColumn.Font;
            Brush.Color := DrawColumn.Color;
          end;
          if ARow < 0 then
            DrawTitleCell(ACol, ARow + TitleOffset, DrawColumn, AState)
          else if (DataLink = nil) or not DataLink.Active then
            FillRect(ARect)
          else
          begin
            Value := '';
            OldActive := DataLink.ActiveRecord;
            try
              DataLink.ActiveRecord := ARow;
              if Assigned(DrawColumn.Field) then
                Value := DrawColumn.Field.DisplayText;
              Highlight := HighlightCell(ACol, ARow, Value, AState);
              if Highlight then
              begin
                Brush.Color := clHighlight;
                Font.Color := clHighlightText;
              end;
              if not Enabled then
                Font.Color := clGrayText;
              if DefaultDrawing then
                WriteText(Canvas, ARect, 2, 2, Value, DrawColumn.Alignment,
                  UseRightToLeftAlignmentForField(DrawColumn.Field, DrawColumn.Alignment));
              if Columns.State = csDefault then
                DrawDataCell(ARect, DrawColumn.Field, AState);
              DrawColumnCell(ARect, ACol, DrawColumn, AState);
            finally
              DataLink.ActiveRecord := OldActive;
            end;
            if DefaultDrawing and (gdSelected in AState)
              and ((dgAlwaysShowSelection in Options) or Focused)
              and not (csDesigning in ComponentState)
              and not (dgRowSelect in Options)
              and (UpdateLock = 0)
              and (ValidParentForm(Self).ActiveControl = Self) then
              Windows.DrawFocusRect(Handle, ARect);
          end;
        end;
        if (gdFixed in AState) and ([dgRowLines, dgColLines] * Options =
          [dgRowLines, dgColLines]) then
        begin
          InflateRect(ARect, 1, 1);
          DrawEdge(Canvas.Handle, ARect, BDR_RAISEDINNER, BF_BOTTOMRIGHT);
          DrawEdge(Canvas.Handle, ARect, BDR_RAISEDINNER, BF_TOPLEFT);
        end;
      end;
    end;

    ACol := OldCol;
    ARow := OldRow;
    ARect := OldRect;
    AState := OldState;
  end;

  if (gdFixed in AState) and (ARow < FixedRows) then
  with FPressedList do
  begin
    if (ACol = 0) and FTitlePressed then DefaultTitleDrawCell(ACol, ARect1)
    else
    if RawToDataColumn(ACol) > -1 then
     if (IndexOf(Columns[RawToDataColumn(ACol)].FieldName) > -1) or
        ((ACol = FLastPressed) and FTitlePressed) then
      begin
        if not Assigned(FOnUserDrawTitleCell) then
          DefaultTitleDrawCell(ACol, ARect1)
        else
          if RawToDataColumn(ACol) > -1 then
            FOnUserDrawTitleCell(Self, ARect,
                                 ACol, Columns[RawToDataColumn(ACol)]);
        Exit;
      end;
    if (FLastPressed < 0) and (Count = 0) then DefaultTitleDrawCell(ACol, ARect1)
  end;
end;

procedure TcitDBGrid.DrawColumnCell(const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
var
  Bmp: TBitmap;
  Idx: integer;
begin
  if Assigned(Column.Field) and (FImageFields.IndexOf(Column.Field.FieldName) > -1) then
  begin
    Idx := TranslatePicCode(Column.Field.AsString);
    if Idx > 0 then
    begin
      Bmp := TBitmap.Create;
      try
        FImages.GetBitmap(Idx, Bmp);
        Canvas.FillRect(Rect);
        Canvas.BrushCopy(Bounds(Rect.Left + 1,Rect.Top + 1, 16, 16),
          Bmp, Bounds(0, 0, 16, 16), clWhite);
      finally
        Bmp.Free;
      end;
    end;
  end else begin
  //---------------------------------------------------------
  if not(gdFocused in State) then
  begin
    if IsMarked then
    begin
      if (dgRowSelect in Options) and (gdSelected in State)
       then Canvas.Brush.Color := clHighlight
       else Canvas.Brush.Color := MarkColor;

      if IsDisabled then
       begin
         if (dgRowSelect in Options) and (gdSelected in State)
          then Canvas.Brush.Color := clHighlight
          else Canvas.Font.Assign(DisabledFont)
       end
      else if IsLighted then
            begin
              if (dgRowSelect in Options) and (gdSelected in State)
               then Canvas.Brush.Color := clHighlight
               else Canvas.Font.Assign(LightedFont)
            end
           else Canvas.Font.Assign(MarkFont);
    end
    else if IsDisabled then
          begin
            if (dgRowSelect in Options) and (gdSelected in State)
              then begin
                     Canvas.Brush.Color := clHighlight;
                     Canvas.Font.Color := clHighlightText;
                   end
              else begin
                     Canvas.Brush.Color := FDisabledColor;
                     Canvas.Font.Assign(FDisabledFont);
                   end;
          end else if IsLighted then
                     if (dgRowSelect in Options) and (gdSelected in State)
                       then begin
                              Canvas.Brush.Color := clHighlight;
                              Canvas.Font.Color := clHighlightText;
                            end
                       else begin
                              Canvas.Brush.Color := FLightedColor;
                              Canvas.Font.Assign(FLightedFont);
                            end;
    DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
  //---------------------------------------------------------
  end;
  inherited;
end;

procedure TcitDBGrid.KeyDown(var Key: Word; Shift: TShiftState);
var
   MarkKey : Word;
   MarkShift : TShiftState;
begin
  ShortCutToKey(MarkShortCut, MarkKey, MarkShift);
  if MarkEnabled and (Shift = []) then
    case Key of
      VK_ADD:      MarkAll;
      VK_SUBTRACT: MarkReset;
      VK_MULTIPLY: MarkInvert;
    end;
  if MarkEnabled and (Key = MarkKey) and (Shift = MarkShift) then
    begin
      InvertRowMark;
      if not DataSource.DataSet.EOF then
        DataSource.DataSet.Next;
    end;


  inherited KeyDown(Key, Shift);
end;

procedure TcitDBGrid.KeyUp(var Key: Word; Shift: TShiftState);
var
   i : integer;
begin
 if (Key = VK_SHIFT) and (FPressedList.Count > 0) then
 begin
   FPressedBtns.Assign(FPressedList);
   MouseCapture := False;
   FTitlePressed := False;

   with FPressedList do
   for i:=0 to Count-1 do
     if Assigned(FOnTitlePressed) then
       FOnTitlePressed(Self, DataSource.DataSet.FieldByName(FPressedList[i]));
   if Assigned(FOnReleaseGroup) then FOnReleaseGroup(Self);
//   else Refresh;

   FPressedList.Clear;
   for i:=0 to FieldCount do InvalidateCell(i, 0);
 end
 else inherited;
end;

procedure TcitDBGrid.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
   GCoord : TGridCoord;
   ReleaseButton, EnableColPress : boolean;
   i : integer;
   SaveMouseDown: TMouseEvent;
begin
 GCoord := MouseCoord(X, Y);
 if DataSource.Dataset <> nil then
 if DataSource.Dataset.Active then
 if FEnableTitlePress then
  begin
  if (GCoord.Y < FixedRows) and (Button = mbLeft) and
    not Sizing(X, Y) then
    if GCoord.X = 0 then
    begin
      SetFocus;
      FTitlePressed := True;
      MouseCapture := True;
      FLastPressed := 0;
      InvalidateCell(0, GCoord.Y);
    end
    else if (RawToDataColumn(GCoord.X) > -1) then
     with FPressedList, Columns[RawToDataColumn(GCoord.X)] do
     if IndexOf(FieldName) < 0 then
     begin
       SetFocus;
       EnableColPress := True;
       if Assigned(FOnEnableColPressQuery) then
         FOnEnableColPressQuery(Self, Field, EnableColPress);
       if not EnableColPress then Exit;
       FTitlePressed := True;
       MouseCapture := True;
       FLastPressed := GCoord.X;
       InvalidateCell(GCoord.X, GCoord.Y);
       ReleaseButton := False;
       if Assigned(FOnReleaseQuery) then
         FOnReleaseQuery(Self, Field, ReleaseButton);
       if ReleaseButton then
       begin
         SendMessage(Handle, WM_MBUTTONUP, 0, (Y shl 16)+X);
         FTitlePressed := True
       end;
     end
     else
     begin
       if (integer(Objects[IndexOf(FieldName)]) > 0) or
          (TitleGlyph.Handle = 0) then
       begin
         Delete(IndexOf(FieldName));
         for i:=0 to FieldCount do InvalidateCell(i, 0);
       end else
       begin
         Objects[IndexOf(FieldName)] := pointer(1);
         InvalidateCell(GCoord.X, GCoord.Y);
       end;
     end;
    end;

 if not FTitlePressed and not (ssShift in Shift) then
 begin
   SaveMouseDown := OnMouseDown;
   OnMouseDown := NIL;
   try
     inherited MouseDown(Button, Shift, X, Y);
     if Assigned(SaveMouseDown) then
       SaveMouseDown(Self, Button, Shift, X, Y);
   finally
     OnMouseDown := SaveMouseDown;
   end;
 end;
 if (ssShift in Shift) and (Button = mbLeft) and MarkEnabled and
    (GCoord.Y >= FixedRows) then InvertRowMark;
end;

procedure TcitDBGrid.MouseUp(Button: TMouseButton; Shift: TShiftState;
                             X, Y: Integer);
var
  i : integer;
begin
  inherited MouseUp(Button, Shift, X, Y);
  if (FLastPressed <> -1) then
  begin
    if FTitlePressed then
      if FLastPressed = 0 then
      begin
        MouseCapture := False;
        FTitlePressed := False;
        FPressedBtns.Clear;
        InvalidateCell(FLastPressed, 0);
        if Assigned(FOnReleaseGroup) then FOnReleaseGroup(Self);
      end
      else
      with Columns[RawToDataColumn(FLastPressed)] do
      if (ssShift in Shift) and FMultiPress then
      begin
        FPressedList.Add(FieldName);
        FTitlePressed := False;
        for i:=0 to FieldCount do InvalidateCell(i, 0);
      end
      else if FPressedList.Count = 0 then
           begin
             MouseCapture := False;
             FTitlePressed := False;
             InvalidateCell(FLastPressed, 0);
             if not FMultiPress and (FPressedBtns.IndexOf(FieldName) > -1) then
               i := 1 - integer(FPressedBtns.Objects[FPressedBtns.IndexOf(FieldName)])
             else i := 0;

             FPressedBtns.Clear;
             FPressedBtns.AddObject(FieldName, TObject(i));
             if Assigned(FOnTitlePressed) then FOnTitlePressed(Self, Field);
             if Assigned(FOnReleaseGroup) then FOnReleaseGroup(Self);
//             else Refresh;
           end;
    FLastPressed := -1
  end;
end;

procedure TcitDBGrid.MouseMove(Shift: TShiftState; X, Y: Integer);
var
   GCoord : TGridCoord;
begin
  inherited MouseMove(Shift, X, Y);
  GCoord := MouseCoord(X, Y);

  if not Sizing(X, Y) then
   if FLastPressed <> -1 then
    begin
     if (FTitlePressed and not PointInRect(Point(X, Y), ClientRect)) then
      begin
        FTitlePressed := False;
        InvalidateCell(FLastPressed, 0);
      end;
     if (((GCoord.Y < FixedRows) and (GCoord.X = FLastPressed)) =
         not FTitlePressed) and PointInRect(Point(X, Y), ClientRect) then
      begin
        FTitlePressed := not FTitlePressed;
        InvalidateCell(FLastPressed, 0);
      end;
    end;
end;

procedure TcitDBGrid.MarkInvert;
begin
  if MarkEnabled then ForEachRows(InvertRowMarkIterProc, nil, aviNone);
end;

procedure TcitDBGrid.InvertRowMarkIterProc(Grid: TcitDBGrid; Params: pointer);
begin
  InvertRowMark;
end;

procedure TcitDBGrid.InvertRowMark;
var
  i: integer;
  Key: string;
begin
  Key := Position;
  i := FMarkItems.IndexOf(Key);
  if i > -1 then
    FMarkItems.Delete(i)
  else if TestBeforeMark then
    FMarkItems.Add(Key);
  Invalidate;
  MarkCountToStatusBar;
end;

procedure TcitDBGrid.MarkAll;
begin
  BeginUpdate;
  try
    MarkReset;
    MarkInvert;
  finally
    EndUpdate;
  end;
end;

procedure TcitDBGrid.MarkReset;
begin
  FMarkItems.Clear;
  Invalidate;
  MarkCountToStatusBar;
end;

procedure TcitDBGrid.MarkCountToStatusBar;
begin
  if Assigned(StatusBar) then
    if StatusBar.Panels.Count > 0 then
      StatusBar.Panels.Items[0].Text := Format('Выделено объектов: %d', [FMarkItems.Count]);
end;

function TcitDBGrid.GetPosition: string;
begin
  Result := '';
  if Assigned(DataSource) then
    if Assigned(DataSource.DataSet) then
      if DataSource.DataSet.State <> dsInactive  then
        if Assigned(OnGetKey) then
          Result := OnGetKey(Self, DataSource.DataSet);
end;

procedure TcitDBGrid.SetPosition(aPos: string);
begin
  if Assigned(FOnGetKey) then
    if Assigned(DataSource) then
      if Assigned(DataSource.DataSet) then
        if DataSource.DataSet.State = dsBrowse then
        begin
          DataSource.DataSet.DisableControls;
          try
            while (OnGetKey(Self, DataSource.DataSet) <> aPos)
              and (not DataSource.DataSet.EOF)
            do
              DataSource.DataSet.Next;
          finally
            DataSource.DataSet.EnableControls;
          end;
        end;
end;

function TcitDBGrid.GetCaption: string;
begin
  Result := '';
  if Assigned(FOnGetCaption) then
    if Assigned(DataSource) then
      if Assigned(DataSource.DataSet) then
        if DataSource.DataSet.State = dsBrowse then
          Result := OnGetCaption(Self, DataSource.DataSet);
end;

function RegExcept(S: string): string;
const
  EOS = #13#10;
begin
  if Pos('~~', S) <> 0 then
  begin
    Delete(S, 1, Pos('~~', S) + 1);
    Delete(S, Pos('~~', S), Length(S));
  end;
  Result := 'Возникла ошибка'+ EOS + EOS + S;
end;

procedure TcitDBGrid.ForEachSelect(Proc: TIterForEachSelectProc; Params: pointer;
  CommonAVI : TCommonAVI);
var
  SL: TStrings;
  Cancel: Boolean;
  I: Integer;
  IgnoreAll: Boolean;
begin
  CursorBusy;
  try
    Cancel := False;
    IgnoreAll := False;
//    StartProgress('Работаю ...', MarkItems.Count, CommonAVI);
    SL := TStringList.Create;
    Try
      if GetMarkEnabled then Begin
        if MarkItems.Count > 0 then Begin
          while MarkItems.Count > 0 do begin
            Try
              Proc(MarkItems.Strings[0], Params);
            Except
              On E: Exception Do Begin
                SL.Add(MarkItems.Strings[0]);
                If Not IgnoreAll Then
                  Case MessageDlg(RegExcept(E.Message), mtError,
                       [mbIgnore, mbCancel, mbAll], 0) Of
                    mrCancel: Begin
                      Cancel := True;
                      Break { Конец циклу по Cancel }
                    End;
                    mrAll: IgnoreAll := True;
                  End; { Case MessageDlg ... }
  //              Application.ProcessMessages;
              End; { On E: ....}
            End; { Try .. Except }
            MarkItems.Delete(0);
//            NextProgress;
            if Cancel then Break;
          End; { While MarkItems.Count > 0 do begin }
          MarkItems.BeginUpDate;
          If Cancel Then For I := 0 To SL.Count-1 Do MarkItems.Add(SL.Strings[I])
            Else MarkItems.Text := SL.Text;
          MarkItems.EndUpDate;
        End { if MarkItems.Count > 0 then begin }
          else if not(DataSource.DataSet.EOF and DataSource.DataSet.BOF) then Proc(Position, Params);
      End { If GetMarkEnabled then begin }
    Finally
      SL.Free;
//      StopProgress;
      Invalidate;
//    Application.ProcessMessages;
    End
  finally
    CursorArrow;
  end;
end;

procedure TcitDBGrid.ForEachRows(Proc: TIterForEachRowsProc; Params: pointer;
  CommonAVI : TCommonAVI);
var
  Pos: string;
  Cancel, IgnoreAll : boolean;
 procedure DoCallProc;
 begin
   Try
     Proc(Self, Params);
   Except
     On E: Exception Do
       If Not IgnoreAll Then
         Case MessageDlg(RegExcept(E.Message), mtError,
              [mbIgnore, mbCancel, mbAll], 0) Of
           mrCancel: Begin
             Cancel := True;
             Exit { Конец циклу по Cancel }
           End;
           mrAll: IgnoreAll := True;
         End; { Case MessageDlg ... }
//              Application.ProcessMessages;
   End;
 end;
begin
  CursorBusy;
  try
    Cancel := False;
    IgnoreAll := False;
    DataSource.DataSet.DisableControls;
//    StartProgress('Работаю ...', DataSource.DataSet.RecordCount, CommonAVI);
    try
      Pos := Position;
      if DataSource.DataSet.EOF and not DataSource.DataSet.BOF then
      begin
        DoCallProc;
//        NextProgress;
      end;
      while not DataSource.DataSet.EOF and not Cancel do
      begin
        DoCallProc;
        if Cancel then break;
        DataSource.DataSet.Next;
//        NextProgress;
      end;
      DataSource.DataSet.First;
      while not DataSource.DataSet.EOF and not Cancel
        and (Pos <> Position) do
      begin
        DoCallProc;
        if Cancel then break;
        DataSource.DataSet.Next;
//        NextProgress;
      end;
    finally
//      StopProgress;
      DataSource.DataSet.EnableControls;
    end;
  finally
    CursorArrow;
  end;
end;

procedure TcitDBGrid.SaveFormat;
begin
  FldProfiles.SaveAllFieldDataToProfile(FFormat, Self);
end;

procedure TcitDBGrid.RestoreFormat;
var
  i, f_index    : integer;
  vFieldName    : string;
  Er            : integer;
  f             : TField;
begin
  if not Assigned(DataSource) then Exit;
  if not Assigned(DataSource.DataSet) then Exit;

  Canvas.Font := Self.Font;
  f_index := 0;
  FFldProfiles.Clear;

  for i := 0 to FFormat.Count - 1 do
  begin
      vFieldName := DecodeOnlyFieldName(FFormat[i]);
      if vFieldName = '' then Continue;
      f:=DataSource.DataSet.FindField(vFieldName);
      if f<>nil then f.Index := f_index;
      inc(f_index);
  end;
  Er := FFldProfiles.LoadAllProfiles(FFormat, FFormatDef, FLoadOnlyFromDefault);
  if Er < 0 then raise Exception.CreateFmt('Ошибка №%d загрузки профиля.', [Er]);
  for i := 0 to FFldProfiles.Count - 1 do FFldProfiles[i].ProfileToColumn;
end;

procedure TcitDBGrid.CheckOnDefaultSavedProps();
var
  S     : string;
begin
  if not Assigned(FPropStorage) then Exit;
  S := Name + '.TitleHeight';
  if Pos(S, FPropStorage.Properties.Text) <= 0 then
    FPropStorage.Properties.Add(S);
end;

procedure TcitDBGrid.SetPropStorage(Value : TcitComponentProps);
begin
  FPropStorage := Value;
  if Value <> nil then
  begin
    if FSaveOnClose then
    begin
      Value.SaveMethod := SaveFormatOnClose; //SaveFormatToStorage;
{      Value.RestoreMethod := RestoreFormatFromStorage;
      if FSaveOnClose then Value.SaveMethod := SaveFormatToStorage;}
      CheckOnDefaultSavedProps;
    end;
  end;
end;

procedure TcitDBGrid.SaveFormatOnClose;
var
   i : integer;
begin
  if Assigned(FPropStorage) and DataSource.DataSet.Active then
  begin
    CheckOnDefaultSavedProps;
    SaveFormat;
    for i:=0 to FFormat.Count-1 do FFormat[i] := Name+'~'+FFormat[i];
    FPropStorage.AddUserStrings(FFormat);
  end;
end;

procedure TcitDBGrid.SaveFormatToStorage;
var
   i : integer;
begin
  if Assigned(FPropStorage) and DataSource.DataSet.Active then
  begin
    CheckOnDefaultSavedProps;
    SaveFormat;
    for i:=0 to FFormat.Count-1 do FFormat[i] := Name+'~'+FFormat[i];
    FPropStorage.AddUserStrings(FFormat);
    FPropStorage.SaveToStorage;
  end;
end;

procedure TcitDBGrid.RestoreFormatFromStorage;
begin
  if Assigned(FPropStorage) then
  begin
    FPropStorage.ReadUserStrings(Name, FFormat);
    FPropStorage.ReadDefaultStrings(Name, FFormatDef);
    RestoreFormat;
  end;
end;

procedure TcitDBGrid.RestoreDefaultFormat;
begin
  if Assigned(FPropStorage) then
  begin
    FFormat.Assign(FFormatDef);
    RestoreFormat;
  end;
end;

procedure TcitDBGrid.BuildQuery;
var
    SQL: TStrings;
    Params: TParams;
begin
    if Assigned(SQLBuilder) then
    begin
      SQL    := (GetObjectProp(DataSource.DataSet, 'SQL') as TStrings);
      Params := (GetObjectProp(DataSource.DataSet, 'Params') as TParams);
      SQL.Clear;
      SQL.Text := SQLBuilder.SQL;
      Params.Assign(SQLBuilder.Params);
      SQLBuilder.Builded := True;
    end else if Assigned(OnBuildQuery) then
      OnBuildQuery(Self, DataSource.DataSet);
end;

procedure TcitDBGrid.Reopen;
begin
  if Assigned(DataSource) then
    if Assigned(DataSource.DataSet) then
    begin
      DataSource.DataSet.DisableControls;
      try
        SaveFormat;
        Columns.BeginUpdate;
        DataSource.DataSet.Close;
        BuildQuery;
        try
          DataSource.DataSet.Open;
          Columns.EndUpdate;
          MarkReset;
        finally
          RestoreFormat;
        end;
      finally
        DataSource.DataSet.EnableControls;
      end;
    end;
end;

procedure TcitDBGrid.Refresh;
begin
  CursorBusy;
  try
    Reposition(Position);
    MarkCountToStatusBar;
  finally
    CursorArrow;
  end;
end;

procedure TcitDBGrid.Reposition(Key: string);
begin
  if Assigned(DataSource) then
    if Assigned(DataSource.DataSet) then
    begin
      DataSource.DataSet.DisableControls;
      try
        Reopen;
        if (Key <> '') and RepositionRecord then
          Position := Key;
      finally
        DataSource.DataSet.EnableControls;
      end;
    end;
end;

function TcitDBGrid.GetIsMarked: boolean;
begin
  Result := MarkEnabled and (FMarkItems.IndexOf(OnGetKey(Self, DataSource.DataSet)) > -1);
end;

procedure TcitDBGrid.SetIsMarked(Value: boolean);
begin
  if MarkEnabled and (IsMarked <> Value) then InvertRowMark;
end;

function TcitDBGrid.GetIsLighted: boolean;
begin
  Result := False;
  if Assigned(OnIsLighted) then
    Result := OnIsLighted(Self, DataSource.DataSet);
end;

function TcitDBGrid.GetIsDisabled: boolean;
begin
  Result := False;
  if Assigned(OnIsDisabled) then
    Result := OnIsDisabled(Self, DataSource.DataSet);
end;

procedure TcitDBGrid.SetMarkFont(Value: TFont);
begin
  FMarkFont.Assign(Value);
end;

procedure TcitDBGrid.SetLightedFont(Value: TFont);
begin
  FLightedFont.Assign(Value);
end;

procedure TcitDBGrid.SetDisabledFont(Value: TFont);
begin
  FDisabledFont.Assign(Value);
end;

function TcitDBGrid.GetTestBeforeMark: boolean;
begin
  Result := True;
  if Assigned(OnTestBeforeMark) then
    Result := OnTestBeforeMark(Self, DataSource.DataSet);
end;

procedure TcitDBGrid.SetImageFields(Value: TStrings);
begin
  FImageFields.Assign(Value);
end;

procedure TcitDBGrid.ChangeLayout;
var
  Dlg           : TDBGridLayoutDlg;
  Field         : TField;
  i             : integer;
  vDispLbl      : string;
  vNode         : TTreeNode;
  vFI           : TFieldInfo;
  vChildNode    : TTreeNode;
  vFldData      : TFieldProfileData;
  OldFormat     : TStrings;
  vLev          : TLevelData;
  Ind           : integer;
begin
  Dlg := TDBGridLayoutDlg.Create(Self);
  try
    OldFormat:=TStringList.Create;
    OldFormat.Assign(FFormat);
    Dlg.OwnerGrid := TDBGrid(Self);
    if Dlg.ShowModal = mrOK then
    begin
      TitleHeight := Dlg.CalcCommonHeight;
      vNode := Dlg.TVMain.Items.GetFirstNode;
      i := 0;
      while vNode <> nil do
      begin
        Inc(i);
        vFI := TFieldInfo(vNode.Data);
        if vFI = nil then
        begin
          vNode := vNode.getNextSibling;
          Continue;
        end;
        Field := DataSource.DataSet.FieldByName(vFI.FieldName);
        Field.Index := i;

        vNode := vNode.getNextSibling;
      end;

      vNode := Dlg.TVMain.Items.GetFirstNode;
      i := 0;
      while vNode <> nil do
      begin
        Inc(i);
        vFI := TFieldInfo(vNode.Data);
        if vFI = nil then
        begin
          vNode := vNode.getNextSibling;
          Continue;
        end;
        Field := DataSource.DataSet.FieldByName(vFI.FieldName);
        if CanRenameColumns then vDispLbl := vFI.DisplayLabel
        else vDispLbl := Field.DisplayName;
        SetFieldWidth(Field, i, Field.FieldName, vDispLbl, vFI.DisplayWidth, vFI.Visible);

        if (Field is TNumericField) then (Field as TNumericField).DisplayFormat := vFI.Mask
        else
          if (Field is TDateTimeField) then (Field as TDateTimeField).DisplayFormat := vFI.Mask
          else Field.EditMask := vFI.Mask;

        vFldData := FFldProfiles.ItemsByFieldName[vFI.FieldName];
        if vFldData <> nil then
        begin
          vFldData.Orientation := vFI.Orientation;
          vFldData.MinimalHeight := vFI.MinimalHeight;

          vChildNode := vNode; Ind := 0;
          while vChildNode.Count > 0 do
          begin
            vFI := TFieldInfo(vChildNode[0].Data);
            if vFldData.Items.Count > ind then vLev := vFldData.Items[ind]
            else begin
              vLev := TLevelData.Create;
              vFldData.Items.Add(vLev);
            end;
            vLev.DisplayLabel := vFI.DisplayLabel;
            vLev.Orientation := vFI.Orientation;
            vLev.MinimalHeight := vFI.MinimalHeight;
            vChildNode := vChildNode[0]; Inc(ind);
          end;
          while ind < vFldData.Items.Count do
          begin
            vLev := vFldData.Items[ind];
            vLev.Free;
            vFldData.Items.Delete(ind);
          end;
        end;
        vNode := vNode.getNextSibling;
      end;
      end else
      if Dlg.IsLoadedDef then
         begin
           FFormat.Assign(OldFormat);
           RestoreFormat;
         end;
  finally
    Dlg.Free;
    OldFormat.Free;
  end;
end;

procedure TcitDBGrid.SetTitleGlyph(Value : TBitmap);
var
  ARect : TRect;
  Glyphs : integer;
begin
  ClearBitmap(FUpGlyph);
  ClearBitmap(FDownGlyph);
  if Value <> FTitleGlyph then ClearBitmap(FTitleGlyph);
  if Value.Handle <> 0 then
  begin
    FTitleGlyph.Assign(Value);
    Glyphs := FTitleGlyph.Width div FTitleGlyph.Height;
    if Glyphs > 1 then
    begin
      ARect := Rect(0, 0, FTitleGlyph.Height, FTitleGlyph.Height);
      FUpGlyph.Height := FTitleGlyph.Height;
      FDownGlyph.Height := FTitleGlyph.Height;
      FUpGlyph.Width := FTitleGlyph.Height;
      FDownGlyph.Width := FTitleGlyph.Height;
      FUpGlyph.Canvas.CopyRect(ARect, FTitleGlyph.Canvas, ARect);
      FDownGlyph.Canvas.CopyRect(ARect, FTitleGlyph.Canvas, Rect(ARect.Right+1, 0,
                                 2*FTitleGlyph.Height-1, ARect.Bottom));
      FUpGlyph.Transparent := True;
      FDownGlyph.Transparent := True;
    end else
    begin
      MessageDlg('Bitmap should contain at least two glyphs', mtError, [mbOK], 0);
      ClearBitmap(FTitleGlyph);
    end;
  end
end;

procedure TcitDBGrid.Loaded;
begin
  inherited;
  SetTitleGlyph(FTitleGlyph);
end;

function TcitDBGrid.GetOrderBy : string;
var
   i : integer;
begin
  Result := '';
  with FPressedBtns do
  for i := 0 to Count - 1 do
  begin
    if integer(Objects[i]) = 0 then
      Result := Result + FPressedBtns[i] + ' ' + 'ASC'
    else Result := Result + FPressedBtns[i] + ' ' + 'DESC';
    if i <> Count-1 then Result := Result + ',';
  end;
end;

procedure TcitDBGrid.ItemInsert;
var
  NewKey: string;
begin
  if Assigned(FOnItemInsert) then
    if FOnItemInsert(Self, NewKey) then
      Reposition(NewKey);
end;

procedure TcitDBGrid.ItemUpdate;
begin
  if Assigned(FOnItemUpdate) then
    if FOnItemUpdate(Self, Position) then
      Refresh;
end;

procedure TcitDBGrid.ItemDelete;
begin
  if Assigned(FOnItemDelete) then
    if FOnItemDelete(Self, Position) then
      Reopen;
end;

procedure TcitDBGrid.SetTitleHeight(Value: Integer);
begin
  if FTitleHeight<>Value then
  begin
    FTitleHeight:=Value;
    LayoutChanged;
  end;
end;

procedure TcitDBGrid.LayoutChanged;
begin
  inherited LayoutChanged;
  if dgTitles in Options then RowHeights[0]:=FTitleHeight;
  if ([csLoading, csDestroying]*ComponentState <> []) then Exit;
  SetFixedCols(FFixedCols);
end;

procedure TcitDBGrid.CopyGridToClipboard;
var
  clip_txt: String;
  dsClipboard: TDataSet;
  i: Integer;
  fLocate : TBookmark;
  SL: TStringList;
  hklKey : HKL;
begin
  SL := TStringList.Create;
//    dsClipboard := DBGrid.DataSource.DataSet;
  fLocate := DataSource.DataSet.GetBookmark;
  DataSource.DataSet.DisableControls;
  dsClipboard := DataSource.DataSet;
  dsClipboard.DisableControls;
  try
    dsClipboard.First;
    clip_txt := '';
    // шапка
    for i:=0 to dsClipboard.FieldCount - 1 do
      if dsClipboard.Fields[i].Visible = true then
        clip_txt := clip_txt + dsClipboard.Fields[i].DisplayName + #9;
    SL.Add(clip_txt);
    // тело
//      i := 0;
    Screen.Cursor := crHourGlass;
    while not dsClipboard.Eof do
    begin
      clip_txt := '';
      for i := 0 to dsClipboard.FieldCount-1 do
        if dsClipboard.Fields[i].Visible  then
          clip_txt := clip_txt + dsClipboard.Fields[i].AsString + #9;
      SL.Add(clip_txt);
      dsClipboard.Next;
    end;
//------ begin AAndy
    hklKey := GetKeyboardLayout(0);
    LoadKeyboardLayout('00000419',KLF_ACTIVATE);
//---- end AAndy
    Clipboard.SetTextBuf(PChar(SL.Text));
//------ begin AAndy
    ActivateKeyboardLayout(hklKey,KLF_REORDER   );
//---- end AAndy
    DataSource.DataSet.GotoBookmark(fLocate);
  finally
    SL.Free;
    Screen.Cursor := crDefault;
    dsClipboard.EnableControls;
    DataSource.DataSet.EnableControls;
    DataSource.DataSet.FreeBookmark(fLocate);
  end;
end;

procedure TcitDBGrid.CopyGridToExcel;
var Excel, WorkBook: Variant;
    Data, Cell1, Cell2 : Variant;
    i, j, k: integer;
    fLocate : TBookmark;
  function FieldToVariant(Field: TField): OLEVariant;
  begin
    Result := '';
    case Field.DataType of
      ftString, ftFixedChar, ftWideString, ftMemo, ftFmtMemo: Result := Field.AsString;
      ftSmallint, ftInteger, ftWord, ftLargeint, ftAutoInc: Result   := Field.AsInteger;
      ftFloat, ftCurrency, ftBCD: Result := Field.AsFloat;
      ftBoolean: Result := Field.AsBoolean;
      ftDate, ftTime, ftDateTime: Result := Field.AsDateTime;
    end;
  end;

begin
  inherited;
// создать объект
  try
    Excel := GetActiveOleObject('Excel.Application');
  except
    try
      Excel := CreateOleObject('Excel.Application');
    except
      Exception.Create('Невозможно запустить Excel!!!');
    end;
  end;
// заполнить данные
  try
    fLocate := DataSource.DataSet.GetBookmark;
    Excel.Visible := false;
    Excel.SheetsInNewWorkbook := 1;
    WorkBook := Excel.WorkBooks.Add;
    WorkBook.WorkSheets[1].Name := 'Спецификация';

    DataSource.DataSet.DisableControls;
    // шапка
    k:=1;
    for i:=1 to  Columns.Count do begin
      if Columns[i-1].Visible then begin
       WorkBook.WorkSheets[1].Cells[1,k] := Columns[i-1].Field.DisplayLabel;
       if Columns[i-1].Field.DisplayWidth > 255
         then WorkBook.WorkSheets[1].Columns[k].ColumnWidth := 255
         else WorkBook.WorkSheets[1].Columns[k].ColumnWidth := Columns[i-1].Field.DisplayWidth;
       inc(k);
      end;

    end;
    // тело
{
    j := 2;
    DataSource.DataSet.First;
    while not DataSource.DataSet.Eof do begin
       k:=1;
       if (isMarked AND (MarkItems.Count>0))OR(MarkItems.Count=0) then
       for i:=1 to  Columns.Count do begin
         if Columns[i-1].Visible then begin
           WorkBook.WorkSheets[1].Cells[j,k] := FieldToVariant(Columns[i-1].Field);
           inc(k);
         end;
       end;
       if (isMarked AND (MarkItems.Count>0))OR(MarkItems.Count=0) then inc(j);
       DataSource.DataSet.Next;
     end;
}
     Data := VarArrayCreate([1,DataSource.DataSet.RecordCount-1,1,DataSource.DataSet.FieldCount-1],varVariant);
     j := 2;
     DataSource.DataSet.First;
     while not DataSource.DataSet.Eof do begin
       k:=1;
       for i:=1 to  Columns.Count do begin
         if Columns[i-1].Visible then begin
           Data[j, k-1] := FieldToVariant(Columns[i-1].Field);
           inc(k);
         end;
       end;
       DataSource.DataSet.Next;
       inc(j);
     end;
     Cell1 := WorkBook.WorkSheets[1].Cells[2, 1];

     WorkBook.WorkSheets[1].Range[Cell1,WorkBook.WorkSheets[1].Cells.Item[DataSource.Dataset.RecordCount+1,DataSource.Dataset.FieldCount]].Value :=Data;
     Data := Unassigned;

     Excel.Visible := true;
     Excel := UnAssigned;
     DataSource.DataSet.GotoBookmark(fLocate);
     DataSource.DataSet.EnableControls;
     DataSource.DataSet.FreeBookmark(fLocate);

  except
    raise Exception.Create('Невозможно выгрузить данные!!!');
  end;
end;

procedure TcitDBGrid.CopyGridToOOCalc;
var
  vFactory : variant;
  vLoadFile : variant;
  vDocument: Variant;
  vCoreReflection: Variant;
  vLoadParams : variant;
  vSheet : variant;
  nFormat: Integer; // for Date
  Locale: Variant;
//------------------------------------------------------------------------------
  i, j, k : integer;
  fLocate : TBookmark;
begin
  fLocate := DataSource.DataSet.GetBookmark;
  DataSource.DataSet.DisableControls;
  try
//------------------------------------------------------------------------------
//        Посредством фабрики классов создадим объек и запустим приложение
//------------------------------------------------------------------------------
    if VarIsEmpty(vFactory) then
      try
        vFactory := CreateOleObject('com.sun.star.ServiceManager');
      except
        Exception.Create('Не удалось получить доступ к ServiceManager. '+ #13#10 +' Open Office не установлен на этой машине.');
        exit;
      end;
    if (VarIsNull(vFactory) or VarIsEmpty(vFactory)) then
      begin
        Exception.Create('Не удалось получить доступ к ServiceManager.'+ #13#10 +'Open Office не установлен на этой машине.');
        exit;
      end;
   vCoreReflection := vFactory.createInstance('com.sun.star.reflection.CoreReflection');
    try
      vLoadFile := vFactory.createInstance('com.sun.star.frame.Desktop');
      vLoadParams := VarArrayCreate([0, -1], varVariant);
      vDocument := vLoadFile.LoadComponentFromURL( 'private:factory/scalc', '_blank', 0,  vLoadParams);
    except
        Exception.Create('Не удалось создать документ Open Office.');
        exit;
    end;
    if (VarIsNull(vDocument) or VarIsEmpty(vDocument)) then
      begin
        Exception.Create('Не удалось создать документ Open Office.');
        exit;
      end;
//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
    vSheet := vDocument.getSheets.getByIndex(0);
    vSheet.setName( 'Спецификация' );

    vCoreReflection.forName('com.sun.star.lang.Locale').createObject(Locale);
    nFormat := vDocument.getNumberFormats().addNew(ShortDateFormat, Locale);
//------------------------------------------------------------------------------
//    Заполнение шапки
//------------------------------------------------------------------------------
    k:=0;
    for i:=1 to  Columns.Count do begin
      if Columns[i-1].Visible then begin
        vSheet.getCellByPosition( k, 0 ).setPropertyValue('CellBackColor', $99CCFF);
        vSheet.getCellByPosition( k, 0 ).setFormula( Columns[i-1].Field.DisplayLabel );
        vSheet.getCellRangeByPosition(k, 1, k, 1).getColumns.getByIndex( 0 ).setPropertyValue('Width', Columns[i-1].Field.DisplayWidth*300);
        inc(k);
      end;
    end;
//------------------------------------------------------------------------------
//    Заполнение содержимого
//------------------------------------------------------------------------------
    j := 1;
    DataSource.DataSet.First;
    while not DataSource.DataSet.Eof do
     begin
       k:=0;
       if (isMarked AND (MarkItems.Count>0))OR(MarkItems.Count=0) then
       for i:=1 to  Columns.Count do begin
         if Columns[i-1].Visible then begin
           if not Columns[i-1].Field.IsNull then begin
             // Date
             if Columns[i-1].Field.DataType in [ftDate, ftTime, ftDateTime] then begin
                vSheet.getCellByPosition( k, j ).setFormula( DateTimeToStr(Columns[i-1].Field.AsDateTime) );
                vSheet.getCellByPosition( k, j ).setPropertyValue('NumberFormat', nFormat);
             end        // Float
             else if Columns[i-1].Field.DataType = ftFloat then begin
                vSheet.getCellByPosition( k, j ).setValue( Columns[i-1].Field.AsFloat);
             end
             else begin  // Text
                vSheet.getCellByPosition( k, j ).setFormula( Columns[i-1].Field.AsString );
             end;
           end;
           inc(k);
         end;
       end;
       if (isMarked AND (MarkItems.Count>0))OR(MarkItems.Count=0) then inc(j);
       DataSource.DataSet.Next;
     end;
  finally
//------------------------------------------------------------------------------
//                    Освободим все Варианты
//------------------------------------------------------------------------------
      if not VarIsEmpty(vLoadFile) then
        vLoadFile := UnAssigned;

      if not VarIsEmpty(vDocument) then
        vDocument := UnAssigned;

      if not VarIsEmpty(vCoreReflection) then
        vCoreReflection := UnAssigned;

      if not VarIsEmpty(vLoadParams) then
        vLoadParams := UnAssigned;

      if not VarIsEmpty(vSheet) then
        vSheet := UnAssigned;

      if not VarIsEmpty(Locale) then
        Locale:=UnAssigned;
//------------------------------------------------------------------------------
     DataSource.DataSet.GotoBookmark(fLocate);
     DataSource.DataSet.EnableControls;
     DataSource.DataSet.FreeBookmark(fLocate);

  end;
  inherited;
end;

procedure TcitDBGrid.TopLeftChanged;
begin
  inherited;
  if (LeftCol<FixedCols+IndicatorOffset) then
  begin
    LeftCol:=FixedCols+IndicatorOffset;
  end;
  SetRedrawFlag(True);
end;

function TcitDBGrid.CalcTitleRect(Col: TColumn; ARow: Integer;
                                  var MasterCol: TColumn): TRect;
var
  I,J: Integer;
  InBiDiMode: Boolean;
  DrawInfo: TGridDrawInfo;
begin
  MasterCol:=ColumnAtDepth(Col, ARow);
  if MasterCol=nil then Exit;

  I:=DataToRawColumn(MasterCol.Index);
  if I>=LeftCol then
    J:=MasterCol.Depth
  else
  begin
    if (FixedCols>0) and (MasterCol.Index<FixedCols) then
    begin
      J:=MasterCol.Depth;
    end
    else
    begin
      I:=LeftCol;
      if Col.Depth>ARow then
        J:=ARow
      else
        J:=Col.Depth;
    end;
  end;

  Result:=CellRect(I, J);
  InBiDiMode:=UseRightToLeftAlignment and
                (Canvas.CanvasOrientation=coLeftToRight);

  for I:=Col.Index to Columns.Count-1 do
  begin
    if ColumnAtDepth(Columns[I], ARow)<>MasterCol then Break;
    if not InBiDiMode then
    begin
      J:=CellRect(DataToRawColumn(I), ARow).Right;
      if J=0 then Break;
      Result.Right:=Max(Result.Right, J);
    end
    else
    begin
      J:=CellRect(DataToRawColumn(I), ARow).Left;
      if J>=ClientWidth then Break;
      Result.Left:=J;
    end;
  end;
  J:=Col.Depth;
  if (J<=ARow) and (J<FixedRows-1) then
  begin
    CalcFixedInfo(DrawInfo);
    Result.Bottom:=DrawInfo.Vert.FixedBoundary-DrawInfo.Vert.EffectiveLineWidth;
  end;
end;

function TcitDBGrid.GetFixedCols: Integer;
begin
  if DataLink.Active then
    Result:=inherited FixedCols-IndicatorOffset
  else
    Result:=FFixedCols;
end;

procedure TcitDBGrid.SetFixedCols(Value: Integer);
var FixCount: Integer;
    OldCol, OldRow: Integer;
begin
  if Value>0 then FixCount:=Value+IndicatorOffset
  else FixCount:=IndicatorOffset;
  if DataLink.Active and
     ([csLoading, csDestroying]*ComponentState=[]) and
     (ColCount>IndicatorOffset+1) then
  begin
    if FixCount>ColCount-1 then
      FixCount:=ColCount-1;
    OldRow:=Row;
    OldCol:=Col;
    inherited FixedCols:=FixCount;
    Row:=OldRow;
    Col:=OldCol;
  end;
  FFixedCols:=FixCount-IndicatorOffset;
end;

function TcitDBGrid.SelectCell(ACol, ARow: Longint): Boolean;
begin
  Result:=inherited SelectCell(ACol, ARow);
  if not Result then
    Exit;
  if (ACol<>Col) and ((ACol<FixedCols+IndicatorOffset) or (Col<FixedCols+IndicatorOffset)) then
    SetRedrawFlag(False);
end;

procedure TcitDBGrid.ColEnter;
begin
  SetRedrawFlag(True);
  inherited;
end;

procedure TcitDBGrid.SetRedrawFlag(Value: Boolean);
begin
  if FRedrawFlag<>Value then
  begin
    FRedrawFlag:=Value;
    SendMessage(Handle, WM_SETREDRAW, Integer(FRedrawFlag), 0);
    if FRedrawFlag then Invalidate;
  end;
end;

function TcitDBGrid.GetTitleOffset: Byte;
var
  I, J: Integer;
begin
  Result:=0;
  if dgTitles in Options then begin
    Result:=1;
    if (Datalink<>nil) and (Datalink.Dataset<>nil) and
      Datalink.Dataset.ObjectView then
    begin
      for I:=0 to Columns.Count-1 do begin
        if Columns[I].Showing then begin
          J:=Columns[I].Depth;
          if J>=Result then Result:=J+1;
        end;
      end;
    end;
  end;
end;

{procedure UsesWriteTextBitmap;
begin
  if UserCount=0 then DrawBitmap:=TBitmap.Create;
  Inc(UserCount);
end;

procedure ReleaseWriteTextBitmap;
begin
  Dec(UserCount);
  if (UserCount=0) and (DrawBitmap<>nil) then
  begin
    DrawBitmap.Free;
    DrawBitmap:=nil;
  end;
end;}

function TcitDBGrid.DoMouseWheelDown(Shift: TShiftState; MousePos: TPoint): Boolean;
begin
  Result := False;
  if Assigned(OnMouseWheelDown) then
    OnMouseWheelDown(Self, Shift, MousePos, Result);
  if not Result then
  begin
    if DataSource.DataSet.Active then
      DataSource.DataSet.Next;
    Result := True;
  end;
end;

function TcitDBGrid.DoMouseWheelUp(Shift: TShiftState; MousePos: TPoint): Boolean;
begin
  Result := False;
  if Assigned(OnMouseWheelUp) then
    OnMouseWheelUp(Self, Shift, MousePos, Result);
  if not Result then
  begin
    if DataSource.DataSet.Active then
      DataSource.DataSet.Prior;
    Result := True;
  end;
end;

procedure TcitDBGrid.SetFieldWidth(Field: TField; aIndex: integer;
  aFieldName, aDisplayLabel: string; aDisplayWidth: integer; aVisible: boolean);
var
  k, j, jj: integer;
  TM: TTextMetric;
  RestoreCanvas: Boolean;
begin
  if aDisplayWidth > (Screen.Width - 30) then
    aDisplayWidth := (Screen.Width - 30);
  if not Assigned(Field) then Exit;
  with Field do
  begin
    DisplayLabel := aDisplayLabel;
    Visible      := aVisible;
    RestoreCanvas := (Canvas.Handle = 0);
    if RestoreCanvas then Canvas.Handle := GetDC(0);
    try
        Canvas.Font := Self.Font;
        GetTextMetrics(Canvas.Handle, TM);
        jj := aDisplayWidth * TM.tmAveCharWidth - (TM.tmAveCharWidth div 2) + TM.tmOverhang + 3;
        k := -1;
        for j := 0 to Columns.Count - 1 do
          if uppercase(Columns[j].FieldName) = UpperCase(aFieldName) then
          begin
            k := j;
            break;
          end;
        if k < 0 then k := aIndex;
        if AcquireLayoutLock then
        try
          if k < Columns.Count then
          begin
            Columns[k].Width := jj;
            Field.DisplayWidth := (Columns[k].Width + (TM.tmAveCharWidth div 2) - TM.tmOverhang - 3)
               div TM.tmAveCharWidth;
          end
          else Field.DisplayWidth := aDisplayWidth;
        finally
          EndLayout;
        end;
    finally
      if RestoreCanvas then
      begin
        ReleaseDC(0, Canvas.Handle);
        Canvas.Handle := 0;
      end;
    end;
  end;
end;

procedure TcitDBGrid.SetEndEllipsis(const Value: boolean);
begin
  FEndEllipsis := Value;
  Repaint;
end;

procedure TcitDBGrid.SetFixedColumnLayout(const Value: TTextLayout);
begin
  FFixedColumnLayout := Value;
  Repaint;
end;

procedure TcitDBGrid.WMNCCalcSize(var msg: TMessage);
var
  Style: Integer;
begin
  if not (ShowVScrollBar and ShowHScrollBar) then
  begin
    Style := getWindowLong( Handle, GWL_STYLE );
    if ((Style and WS_VSCROLL) <> 0)
      or ((Style and WS_HSCROLL) <> 0) then
    begin
      if ((Style and WS_VSCROLL) <> 0)
          and not ShowVScrollBar then
        Style := Style and not WS_VSCROLL;
      if ((Style and WS_HSCROLL) <> 0)
          and not ShowHScrollBar then
        Style := Style and not WS_HSCROLL;
      SetWindowLong( Handle, GWL_STYLE, Style );
    end;
  end;
  inherited;
end;

procedure TcitDBGrid.SetTitleColor(Value: TColor);
begin
  if FTitleColor <> Value then
  begin
    FTitleColor := Value;
    Repaint;
  end;
end;

{ TLevelData }

constructor TLevelData.Create;
begin
  FDisplayLabel  := '';
  FOrientation   := toHorizontal;
  FMinimalHeight := DefaultTitleHeight;
end;

function TLevelData.LevelToProfileData(var pProfileData: string): integer;
var
  chOrient      : char;
begin
  if FOrientation = toVertical then chOrient := '1' else chOrient := '0';
  pProfileData := pProfileData + FDisplayLabel +chrLevel+ chOrient
    +'~'+ IntToStr(FMinimalHeight) + '~';
  Result := 0;
end;

{ TFieldProfileData }

constructor TFieldProfileData.Create(AFieldName: string; pGrid: TcitDBGrid);
begin
  inherited Create;
  FGrid := pGrid;
  FField := nil;
  FItems := TList.Create;
  Clear;
  FFieldName := AFieldName;
end;

destructor TFieldProfileData.Destroy;
begin
  Clear;
  FItems.Free;
  FField := nil;
  inherited;
end;

procedure TFieldProfileData.Clear;
var
  i     : integer;
begin
  FField := nil;

  FieldName := '';
  DisplayLabel := '';
  Mask := '';
  Orientation := toHorizontal;
  Visible := True;
  DisplayWidth := 60;
  MinimalHeight := DefaultTitleHeight;
  IsLoad := False;
  for i := FItems.Count - 1 downto 0 do
  begin
    TLevelData(FItems[i]).Free;
    FItems.Delete(i);
  end;
end;

function TFieldProfileData.SaveToProfileData(var pProfileData: string): integer;
var
  i     : integer;
begin
  pProfileData := ''; Result := 0;
  if FField = nil then Exit;
  Result := FieldToProfileData(FField, pProfileData);
  if Result > 0 then Exit;
  if FItems.Count > 0 then pProfileData := pProfileData + '~';
  for i := 0 to FItems.Count - 1 do
  begin
    Result := TLevelData(FItems[i]).LevelToProfileData(pProfileData);
    if Result > 0 then Exit;
  end;
  Result := 0;
end;

function TFieldProfileData.FieldToProfileData(pField: TField; var pProfileData: string): integer;
var
  ch            : char;
  Mask          : string[255];
  chOrient      : char;
begin
  pProfileData := '';
  if pField.Visible then ch := '1' else ch := '0';

  if (pField is TNumericField) then
    Mask := (pField as TNumericField).DisplayFormat
  else
    if (pField is TDateTimeField) then
         Mask := (pField as TDateTimeField).DisplayFormat
    else Mask := pField.EditMask;

  if FOrientation = toVertical then chOrient := '1'
  else chOrient := '0';

  pProfileData := pField.FieldName +'='+ pField.DisplayLabel
    +'~'+ IntToStr(pField.DisplayWidth) +'~'+ Mask +'~'+ ch +'~'+ chOrient
    +'~'+ IntToStr(FMinimalHeight);
  Result := 0;
end;

procedure TFieldProfileData.ProfileToColumn;
begin
  if (FField = nil) or (FGrid = nil) then Exit;
//  if not FProfile.IsLoad then GetProfile(pLoadOnlyDefault); // Только откуда взять - pLoadOnlyDefault
  FGrid.SetFieldWidth(FField, FField.Index, FFieldName, FDisplayLabel,
    FDisplayWidth, FVisible);
  if (FField is TNumericField) then
    (FField as TNumericField).DisplayFormat := FMask
  else if (FField is TDateTimeField) then
    (FField as TDateTimeField).DisplayFormat := FMask
  else FField.EditMask := FMask;
end;

procedure TFieldProfileData.UpdateProfileData;
begin
  if FField = nil then Exit;
  FDisplayLabel := FField.DisplayLabel;
  FVisible := FField.Visible;
  FDisplayWidth := FField.DisplayWidth;
  if (FField is TNumericField) then
    FMask := (FField as TNumericField).DisplayFormat
  else if (FField is TDateTimeField) then
    FMask := (FField as TDateTimeField).DisplayFormat
  else FMask := FField.EditMask;
end;

function TFieldProfileData.AutoLinkToField(pDataSet: TDataSet): boolean;
var
  i             : integer;
begin
  Result := False;
  FField := nil;
  if not Assigned(pDataSet) then Exit;
  for i := 0 to pDataSet.FieldCount - 1 do
  begin
    Result := pDataSet.Fields[i].FieldName = FFieldName;
    if not Result then Continue;
    FField := pDataSet.Fields[i];
    Break;
  end;
end;

function TFieldProfileData.LoadFromProfilesData(pProfileData,
  pDefProfileData: string; pLoadOnlyDefault: boolean): integer;
{var
  IsSctn        : boolean;
  IsFld         : boolean;}

  function LoadInfoParam(pProfileStr: string): string;
  begin
    Result := pProfileStr;
    GetToken('=', Result);
    FDisplayLabel  := GetToken('~', Result);
  end;

  function LoadVisualParam(pProfileStr: string): string;
  var   vVertOrient     : boolean;
  begin
    Result := pProfileStr;
    GetToken('=', Result);
    GetToken('~', Result);
    FDisplayWidth  := StrToIntDef(GetToken('~', Result), DefaultTitleHeight);
    FMask          := GetToken('~', Result);
    FVisible       := GetToken('~', Result) = '1';
    vVertOrient    := GetToken('~', Result) = '1';
    if vVertOrient then FOrientation := toVertical
    else FOrientation := toHorizontal;
    FMinimalHeight := StrToIntDef(GetToken('~', Result), 0);
  end;

  function LoadLevels(pProfileStr: string): string;
  var
    vPos        : integer;
    vLev        : TLevelData;
    vVert       : boolean;
  begin
    Result := pProfileStr;
    vPos := Pos(chrLevel, Result);
    while vPos > 0 do
    begin
      vLev := TLevelData.Create;
      vLev.DisplayLabel := GetToken(chrLevel, Result);
      vVert := GetToken('~', Result) = '1';
      if vVert then vLev.Orientation := toVertical
      else vLev.Orientation := toHorizontal;
      vLev.MinimalHeight := StrToIntDef(GetToken('~', Result), 0);
      FItems.Add(vLev);
      vPos := Pos(chrLevel, Result);
    end;
  end;

  function LoadLevelVisualParam(pProfileStr: string): string;
  var
    ind         : integer;
    vPos        : integer;
    vLev        : TLevelData;
    vVert       : boolean;
  begin
    Result := pProfileStr; ind := 0;
    vPos := Pos(chrLevel, Result);
    while vPos > 0 do
    begin
      if ind <= FItems.Count then Break;
      GetToken(chrLevel, Result);
      vLev := TLevelData(FItems[ind]);
      vVert := GetToken('~', Result) = '1';
      if vVert then vLev.Orientation := toVertical
      else vLev.Orientation := toHorizontal;
      vLev.MinimalHeight := StrToIntDef(GetToken('~', Result), 0);
      vPos := Pos(chrLevel, Result); Inc(ind);
    end;
  end;

var
  pDefProfileDataRest   : string;
  pProfileDataRest      : string;
begin
//  Result := 1;
  FIsLoad := False;
{  IsSctn := False; IsFld := False;
  if Assigned(FGrid) then
    if Assigned(FGrid.PropStorage) then
      IsSctn := FGrid.PropStorage.IniSection = 'WhoListSpecExpirationForm';
  IsFld := FFieldName = 'ARTICLE_ID';}

//  Clear; {? Слишком много чиститься}
  if pLoadOnlyDefault then // Загрузка комбинированная
  begin
    pDefProfileDataRest := LoadInfoParam(pDefProfileData);
    pProfileDataRest := LoadVisualParam(pProfileData);
    pDefProfileDataRest := LoadLevels(pDefProfileDataRest);
    pProfileDataRest := LoadLevelVisualParam(pProfileDataRest);
    // Вставить загрузку уровней
  end else
    if pProfileData <> '' then
    // Загрузка всего из пользовательского профиля
    begin
      pProfileDataRest := LoadInfoParam(pProfileData);
      pProfileDataRest := LoadVisualParam(pProfileData);
      // Вставить загрузку уровней
      pProfileDataRest := LoadLevels(pProfileDataRest);
    end
    else begin // Загрузка из настроек поля по умолчанию
      if FField <> nil then
      begin
        FDisplayLabel := FField.DisplayLabel;
        FDisplayWidth := FField.DisplayWidth;
        FMask := FField.EditMask;
        FVisible := FField.Visible;
        FOrientation := toHorizontal;
        FMinimalHeight := FGrid.TitleHeight;
      end;
    end;
  FIsLoad := True;
  Result := 0;
end;

procedure TFieldProfileData.SetDisplayLabel(
  const Value: TProfileString);
begin
  if not FReadOnly then FDisplayLabel := Value;
end;

procedure TFieldProfileData.SetFieldName(
  const Value: TProfileString);
begin
  if not FReadOnly then FFieldName := Value;
end;

procedure TFieldProfileData.SetDisplayWidth(const Value: integer);
begin
  if not FReadOnly then FDisplayWidth := Value;
end;

procedure TFieldProfileData.SetIsLoad(const Value: boolean);
begin
  if not FReadOnly then FIsLoad := Value;
end;

procedure TFieldProfileData.SetMask(const Value: TProfileString);
begin
  if not FReadOnly then FMask := Value;
end;

procedure TFieldProfileData.SetMinimalHeight(const Value: integer);
begin
  if not FReadOnly then FMinimalHeight := Value;
end;

procedure TFieldProfileData.SetOrientation(
  const Value: TTextOrientation);
begin
  if not FReadOnly then FOrientation := Value;
end;

procedure TFieldProfileData.SetReadOnly(const Value: boolean);
begin
  FReadOnly := Value;
end;

procedure TFieldProfileData.SetVisible(const Value: boolean);
begin
  if not FReadOnly then FVisible := Value;
end;

{ TFieldProfiles }

constructor TFieldProfiles.Create(pDBGrid: TcitDBGrid);
begin
  Inherited Create;
  FItems := TList.Create;
  FDBGrid := pDBGrid;
  FRepaintEnabled := False;
  FDefaultItem := TFieldProfileData.Create('%%%%%', pDBGrid);
end;

destructor TFieldProfiles.Destroy;
begin
  ClearLinks;
  Clear;
  FItems.Free;
  inherited;
end;

procedure TFieldProfiles.Clear;
var
  vDBGrid       : TcitDBGrid;
begin
  vDBGrid := FDBGrid; FDBGrid := nil;
  while FItems.Count > 0 do
  begin
    TFieldProfileData(FItems[FItems.Count-1]).Free;
    FItems.Delete(FItems.Count-1);
  end;
  FDBGrid := vDBGrid; RepaintGrid;
end;

function TFieldProfiles.AutoLinkToFields: integer;
var
  i             : integer;
  vDBGrid       : TcitDBGrid;
begin
  Result := FItems.Count;
  if FDBGrid = nil then Exit;
  if FDBGrid.DataSource = nil then Exit;
  if FDBGrid.DataSource.DataSet = nil then Exit;
  vDBGrid := FDBGrid; FDBGrid := nil;
  for i := 0 to FItems.Count - 1 do
    if TFieldProfileData(FItems[i]).AutoLinkToField(FDBGrid.DataSource.DataSet) then Dec(Result);
  FDBGrid := vDBGrid;
  RepaintGrid;
end;

procedure TFieldProfiles.ClearLinks;
var
  i             : integer;
  vDBGrid       : TcitDBGrid;
begin
  vDBGrid := FDBGrid; FDBGrid := nil;
  for i := 0 to FItems.Count - 1 do TFieldProfileData(FItems[i]).Field := nil;
  FDBGrid := vDBGrid; RepaintGrid;
end;

function TFieldProfiles.Get(Index: Integer): TFieldProfileData;
begin
  Result := FItems[Index];
end;

function TFieldProfiles.GetByFieldName(
  pFieldName: string): TFieldProfileData;
begin
  Result := GetOnFieldName(pFieldName);
  if Result = nil then Result := FDefaultItem;
end;

function TFieldProfiles.Add(pFieldName: string; pField: TField): integer;
var
  vNewProf      : TFieldProfileData;
begin
  if IndexOnFieldName(pFieldName) >= 0 then
    raise Exception.CreateFmt('Попытка повторного добавления данных профиля для поля "%s".', [pFieldName]);
  vNewProf := TFieldProfileData.Create(pFieldName, FDBGrid);
  if pField <> nil then vNewProf.Field := pField;
  Result := FItems.Add(vNewProf);
end;

procedure TFieldProfiles.Delele(Index: integer);
begin
  FItems.Delete(Index);
end;

procedure TFieldProfiles.Delele(pFieldName: string);
var
  vIndex        : integer;
begin
  vIndex := IndexOnFieldName(pFieldName);
  Delele(vIndex);
end;

function TFieldProfiles.Count: integer;
begin
  Result := FItems.Count;
end;

function TFieldProfiles.GetOnFieldName( pFieldName: string): TFieldProfileData;
var
  vIndex        : integer;
begin
  vIndex := IndexOnFieldName(pFieldName);
  if vIndex >= 0 then Result := FItems[vIndex] else Result := nil; 
end;

function TFieldProfiles.IndexOnFieldName(pFieldName: string): integer;
var
  i     : integer;
begin
  Result := -1;
  for i := 0 to FItems.Count - 1 do
    if TFieldProfileData(FItems[i]).FieldName = pFieldName then
      begin Result := i; Exit; end;
end;

procedure TFieldProfiles.RepaintGrid;
begin
  if Assigned(FDBGrid) and FRepaintEnabled then FDBGrid.Repaint;
end;

function TFieldProfiles.LoadAllProfiles(pProfileData,
  pDefProfileData: TStrings; pLoadOnlyDefault: boolean): integer;
var
  i, ind        : integer;
  vFieldName    : string;

  function GetProfileString(pProfileData: TStrings; pFieldName: string): string;
  var    i      : integer;
  begin
    Result := '';
    for i := 0 to pProfileData.Count - 1 do
      if DecodeOnlyFieldName(pProfileData[i]) = pFieldName then
        Result := pProfileData[i];
  end;

begin
  Result := 0;

  for i := 0 to FDBGrid.DataSource.DataSet.FieldCount - 1 do
  begin
    vFieldName := FDBGrid.DataSource.DataSet.Fields[i].FieldName;
    if vFieldName = '' then Continue;
    ind := IndexOnFieldName(vFieldName);
    if ind < 0 then
    begin
      ind := Add(vFieldName);
      TFieldProfileData(Items[ind]).AutoLinkToField(FDBGrid.DataSource.DataSet);
    end;

    Result := TFieldProfileData(Items[ind]).LoadFromProfilesData(
      GetProfileString(pProfileData, vFieldName),
      GetProfileString(pDefProfileData, vFieldName),
      pLoadOnlyDefault);
    if Result > 0 then Exit;
  end;
end;

procedure TFieldProfiles.SaveAllFieldDataToProfile(
  pProfileData: TStrings; pGrid: TcitDBGrid);
var
  i             : integer;
  Field         : TField;
  S             : string;
  Er            : integer;
  ind           : integer;
begin
  pProfileData.Clear;
  if not Assigned(pGrid.DataSource) or (not Assigned(pGrid.DataSource.DataSet)) then Exit;
  for i := 0 to pGrid.DataSource.DataSet.FieldCount - 1 do
  begin
    Field := pGrid.DataSource.DataSet.Fields[i];
    ind := IndexOnFieldName(Field.FieldName);

    if ind >= 0 then
    begin
      Items[ind].AutoLinkToField(pGrid.DataSource.DataSet);
      Items[ind].UpdateProfileData;
      Er := Items[ind].SaveToProfileData(S);
    end
    else Er := DefaultItem.FieldToProfileData(Field, S);

    if Er > 0 then
      raise Exception.CreateFmt('Ошибка №%d при сохранении поля "%s"', [Er, Field.FieldName]);
    pProfileData.Add(S);
  end;
end;

end.
