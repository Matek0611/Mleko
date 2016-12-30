unit citRichEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, RichEdit;

type
  TcitRichEditException = class(Exception);

  TTokenGroup = class
  private
    FTokens : TStrings;
    FFont : TFont;

    function GetCount : integer;
  protected
    function GetToken(Index : integer) : string; virtual;
    procedure SetToken(Index : integer; Value : string); virtual;
  public
    GroupName : string;
    property Font : TFont read FFont;
    property Tokens[Index : integer] : string read GetToken write SetToken; default;
    property Count : integer read GetCount;

    function Add(Token : string) : boolean; virtual;
    function Delete(Token : string) : boolean; virtual;
    function IndexOf(Token : string) : integer; virtual;
    procedure Copy(ATokenGroup : TTokenGroup); virtual;
    procedure AssignTo(Dest : TStrings);
    constructor Create(AGroupName : string);
    destructor Destroy; override;
  end;

  TTokenGroups = class(TPersistent)
  private
    FItems : TList;

    function GetItemByName(GroupName : string) : TTokenGroup;
    function GetItem(Index : integer) : TTokenGroup;
    procedure ReadData(Reader : TReader);
    procedure WriteData(Writer : TWriter);
    function GetCount : integer;
  protected
    procedure DefineProperties(Filer: TFiler); override;
  public
    DefaultFont : TFont;
    property ItemsByName[GroupName : string] : TTokenGroup read GetItemByName; default;
    property Items[Index : integer] : TTokenGroup read GetItem;
    property Count : integer read GetCount;

    function Add(GroupName : string) : boolean; virtual;
    function Delete(GroupName : string) : boolean; virtual;
    function ChangeName(OldName, NewName : string) : boolean; virtual;
    function GetTokenFont(Token : string) : TFont;
    procedure Clear; virtual;
    procedure Assign(Source : TPersistent); override;
    constructor Create;
    destructor Destroy; override;
  end;

  TcitRichEdit = class(TCustomRichEdit)
  private
    FTokenGroups : TTokenGroups;
    FCommentSingleLine : string;
    FCommentLeft : string;
    FCommentRight : string;
    FQuotationMarks : string;
    FCommentFont : TFont;
    FStringFont : TFont;
    FChanging : boolean;

    procedure SetStringFont(Value : TFont);
    procedure SetCommentFont(Value : TFont);
  protected
    procedure Change; override;
    function UpdateLookFromPos(APos : integer) : boolean;
  public
    procedure UpdateLook; virtual;
    procedure SetTokenGroups(ATokenGroups : TTokenGroups);
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
//    procedure SaveHighlightingToStream(Stream : TStream);
  published
    property TokenGroups : TTokenGroups read FTokenGroups write SetTokenGroups stored True;
    property CommentSingleLine : string read FCommentSingleLine write FCommentSingleLine;
    property CommentLeft : string read FCommentLeft write FCommentLeft;
    property CommentRight : string read FCommentRight write FCommentRight;
    property QuotationMarks : string read FQuotationMarks write FQuotationMarks;
    property CommentFont : TFont read FCommentFont write SetCommentFont;
    property StringFont : TFont read FStringFont write SetStringFont;
    { inherited from TCustomRichEdit }
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
    property HideScrollBars;
    property ImeMode;
    property ImeName;
    property Lines;
    property MaxLength;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PlainText;
    property PopupMenu;
    property ReadOnly;
    property ScrollBars;
    property ShowHint;
    property TabOrder;
    property TabStop default True;
    property Visible;
    property WantTabs;
    property WantReturns;
    property WordWrap;
    property OnChange;
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
    property OnStartDrag;
    property OnProtectChange;
    property OnSaveClipboard;
  end;

implementation

{ TTokenGroup implementation }

constructor TTokenGroup.Create(AGroupName : string);
begin
  FTokens := TStringList.Create;
  FFont := TFont.Create;
  GroupName := AGroupName;
end;

destructor TTokenGroup.Destroy;
begin
  FTokens.Free;
  FFont.Free;
  inherited;
end;

function TTokenGroup.GetToken(Index : integer) : string;
begin
  Result := FTokens[Index]
end;

procedure TTokenGroup.SetToken(Index : integer; Value : string);
begin
  if FTokens.IndexOf(Value) < 0 then FTokens[Index] := Value
  else raise TcitRichEditException.Create('Token duplicates are not allowed');
end;

function TTokenGroup.Add(Token : string) : boolean;
begin
  Result := False;
  if FTokens.IndexOf(Token) < 0 then
  begin
    FTokens.Add(Token);
    Result := True;
  end;
end;

function TTokenGroup.Delete(Token : string) : boolean;
var
  i : integer;
begin
  Result := False;
  i := FTokens.IndexOf(Token);
  if i > -1 then
  begin
    FTokens.Delete(i);
    Result := True;
  end;
end;

procedure TTokenGroup.Copy(ATokenGroup : TTokenGroup);
var
  i : integer;
begin
  for i:=FTokens.Count-1 downto 0 do FTokens.Delete(i);
  for i:=0 to ATokenGroup.Count-1 do Add(ATokenGroup[i]);
  FFont.Assign(ATokenGroup.Font);
  GroupName := ATokenGroup.GroupName;
end;

function TTokenGroup.GetCount : integer;
begin
  Result := FTokens.Count
end;

function TTokenGroup.IndexOf(Token : string) : integer;
begin
  Result := FTokens.IndexOf(Token)
end;

procedure TTokenGroup.AssignTo(Dest : TStrings);
begin
  Dest.Assign(FTokens)
end;

{ TTokenGroups implementation }
constructor TTokenGroups.Create;
begin
  inherited;
  FItems := TList.Create;
  DefaultFont := TFont.Create;
end;

destructor TTokenGroups.Destroy;
var
  i : integer;
begin
  for i:=0 to FItems.Count-1 do TTokenGroup(FItems[i]).Free;
  FItems.Free;
  DefaultFont.Free;
  inherited
end;

function TTokenGroups.GetItemByName(GroupName : string) : TTokenGroup;
var
  i : integer;
begin
  for i:=0 to FItems.Count-1 do
    if TTokenGroup(FItems[i]).GroupName = GroupName then
    begin
      Result := FItems[i];
      Exit
    end;
  Result := nil
end;

function TTokenGroups.GetItem(Index : integer) : TTokenGroup;
begin
  Result := FItems[Index]
end;

function TTokenGroups.GetCount : integer;
begin
  Result := FItems.Count
end;

function TTokenGroups.Add(GroupName : string) : boolean;
begin
  if GetItemByName(GroupName) <> nil then
    Result := False
  else begin
    Result := True;
    FItems.Add(TTokenGroup.Create(GroupName));
    TTokenGroup(FItems.Last).Font.Assign(DefaultFont);
  end;
end;

function TTokenGroups.Delete(GroupName : string) : boolean;
var
  i : integer;
begin
  Result := False;
  for i:=0 to FItems.Count-1 do
  if TTokenGroup(FItems[i]).GroupName = GroupName then
  begin
    TTokenGroup(FItems[i]).Free;
    FItems.Delete(i);
    Result := True;
    break
  end;
end;

function TTokenGroups.ChangeName(OldName, NewName : string) : boolean;
var
  i, NewInd, OldInd : integer;
begin
  Result := False;
  NewInd := -1;
  OldInd := -1;
  for i:=0 to FItems.Count-1 do
    if TTokenGroup(FItems[i]).GroupName = OldName then OldInd := i else
    if TTokenGroup(FItems[i]).GroupName = NewName then NewInd := i;
  if (OldInd > -1) and (NewInd < 0) then
  begin
    TTokenGroup(FItems[OldInd]).GroupName := NewName;
    Result := True;
  end;
end;

procedure TTokenGroups.Clear;
var
  i : integer;
begin
  for i:=0 to FItems.Count-1 do TTokenGroup(FItems[i]).Free;
  FItems.Clear;
end;

procedure TTokenGroups.Assign(Source : TPersistent);
var
  i : integer;
begin
  if Source = nil then Clear
  else
    if not(Source is TTokenGroups) then
      inherited Assign(Source)
    else
    begin
      Clear;
      for i:=0 to TTokenGroups(Source).Count-1 do
        if Add(TTokenGroups(Source).Items[i].GroupName) then
          TTokenGroup(FItems.Last).Copy(TTokenGroups(Source).Items[i]);
      DefaultFont.Assign(TTokenGroups(Source).DefaultFont)
    end;
end;

procedure SaveFontToWriter(Writer : TWriter; Font : TFont);
begin
  with Writer, Font do
  begin
    WriteInteger(CharSet);
    WriteInteger(Color);
    WriteInteger(Height);
    WriteString(Name);
    WriteInteger(Integer(fsBold in Style)+(Integer(fsItalic in Style) shl 1)+
      (Integer(fsUnderline in Style) shl 2)+(Integer(fsStrikeOut in Style) shl 3))
  end
end;

procedure ReadFontFromReader(Reader : TReader; Font : TFont);
var
  i : integer;
begin
  with Reader, Font do
  begin
    CharSet := ReadInteger;
    Color := ReadInteger;
    Height := ReadInteger;
    Name := ReadString;
    i := ReadInteger;
    if (i and 1) <> 0 then Style := Style + [fsBold]; // Include doesn't work :(
    if (i and 2) <> 0 then Style := Style + [fsItalic];
    if (i and 4) <> 0 then Style := Style + [fsUnderline];
    if (i and 8) <> 0 then Style := Style + [fsStrikeOut];
  end
end;

procedure TTokenGroups.ReadData(Reader : TReader);
var
  Cnt, i, j : integer;
begin
  Clear;
  Reader.ReadListBegin;
  try
    ReadFontFromReader(Reader, DefaultFont);
    Cnt := Reader.ReadInteger;
    for i:=0 to Cnt-1 do
    if Add(Reader.ReadString) then
    begin
      ReadFontFromReader(Reader, TTokenGroup(FItems.Last).Font);
      for j:=0 to Reader.ReadInteger-1 do
        TTokenGroup(FItems.Last).Add(Reader.ReadString);
    end;
  finally
    Reader.ReadListEnd;
  end;
end;

procedure TTokenGroups.WriteData(Writer : TWriter);
var
  i, j : integer;
begin
  Writer.WriteListBegin;
  try
    SaveFontToWriter(Writer, DefaultFont);
    Writer.WriteInteger(Count);
    for i:=0 to Count-1 do
    begin
      Writer.WriteString(Items[i].GroupName);
      SaveFontToWriter(Writer, Items[i].Font);
      Writer.WriteInteger(Items[i].Count);
      for j:=0 to Items[i].Count-1 do Writer.WriteString(Items[i].Tokens[j]);
    end
  finally
    Writer.WriteListEnd;
  end;
end;

procedure TTokenGroups.DefineProperties(Filer: TFiler);
  function ShouldWrite : boolean;
  begin
    if Filer.Ancestor <> nil then Result := True
                             else Result := Count > 0;
  end;
begin
  Filer.DefineProperty('TokenGroups', ReadData, WriteData, ShouldWrite);
end;

function TTokenGroups.GetTokenFont(Token : string) : TFont;
var
  i : integer;
begin
  Result := nil;
  for i:=0 to FItems.Count-1 do
    if Items[i].IndexOf(Token) > -1 then
    begin
      Result := Items[i].Font;
      Exit;
    end;
end;

{ TcitRichEdit implementation }

constructor TcitRichEdit.Create(AOwner : TComponent);
begin
  inherited;
  FTokenGroups := TTokenGroups.Create;
  FTokenGroups.DefaultFont.Assign(DefAttributes);
  FCommentFont := TFont.Create;
  FStringFont := TFont.Create;
  FCommentFont.Assign(DefAttributes);
  FStringFont.Assign(DefAttributes);
  FCommentLeft := '/*';
  FCommentRight := '*/';
  FCommentSingleLine := '//';
  FQuotationMarks := '''"';
  FChanging := False;
end;

destructor TcitRichEdit.Destroy;
begin
  FTokenGroups.Free;
  FCommentFont.Free;
  FStringFont.Free;
  inherited;
end;

procedure TcitRichEdit.SetTokenGroups(ATokenGroups : TTokenGroups);
begin
  TokenGroups.Assign(ATokenGroups)
end;

procedure TcitRichEdit.SetStringFont(Value : TFont);
begin
  FStringFont.Assign(Value)
end;

procedure TcitRichEdit.SetCommentFont(Value : TFont);
begin
  FCommentFont.Assign(Value)
end;

function TcitRichEdit.UpdateLookFromPos(APos : integer) : boolean;
  function PosFromIndex(SubStr, S : string; Index : integer) : integer;
  var
    pc : PChar;
  begin
    pc := StrPos(PChar(S)+Index-1, PChar(SubStr));
    if pc <> nil then Result := pc - PChar(S) + 1
                 else Result := 0;
  end;
  function SetAttrs(AObject : TPersistent) : boolean;
  var
    tmpFont : TFont;
  begin
    if AObject is TFont then
    begin
      tmpFont := TFont.Create;
      try
        tmpFont.Assign(SelAttributes);
        Result := StrLComp(PChar(tmpFont), PChar(AObject), SizeOf(TFont)) = 0;
        if Result then SelAttributes.Assign(AObject);
      finally
        tmpFont.Free;
      end;
    end else
    begin
      Result := StrLComp(PChar(SelAttributes), PChar(AObject), SizeOf(TTextAttributes)) = 0;
      if Result then SelAttributes.Assign(AObject);
    end;
  end;
var
  StringMode, CommentMode, WordMode : boolean;
  CurFont : TFont;
  i, OldSelStart, TmpSelStart : integer;
begin
  i := 0;   //APos;
  OldSelStart := SelStart;
  TmpSelStart := APos-1;
  CommentMode := False;
  StringMode := False;
  WordMode := False;
  Result := False;

  with Lines do
  while i <= Length(Text) do
  begin
    if not CommentMode and not StringMode then
      if Length(CommentLeft) > 0 then
        if StrLComp(PChar(CommentLeft), PChar(@Text[i]), Length(CommentLeft)) = 0 then
        begin
          CommentMode := True;
          TmpSelStart := i-1;
          Inc(i, Length(CommentLeft));
          continue;
        end;
    if CommentMode then
      if Length(CommentRight) > 0 then
      begin
        if (StrLComp(PChar(CommentRight), PChar(@Text[i]), Length(CommentRight)) = 0)
           or (i = Length(Text)) then
        begin
          CommentMode := False;
          Inc(i, Length(CommentRight));
          if i < APos then continue;
          SelStart := TmpSelStart;
          SelLength := i-TmpSelStart-1;
          Result := SetAttrs(CommentFont);
{          SelStart := i;
          if Result then SelAttributes.Assign(DefAttributes);}
        end;
        inc(i);
        continue;
      end;

    if not CommentMode and not StringMode then
      if Length(CommentSingleLine) > 0 then
        if StrLComp(PChar(CommentSingleLine), PChar(@Text[i]),
             Length(CommentSingleLine)) = 0 then
        begin
          WordMode := False;
          if i < APos then begin inc(i); continue; end;
          SelStart := i - 1;
          SelLength := PosFromIndex(#$0D#$0A, Text, SelStart+1) - SelStart;
          Result := SetAttrs(CommentFont);
//          SelStart := SelStart + SelLength + 1;
          i := SelStart + SelLength + 2;
//          if Result then SelAttributes.Assign(DefAttributes);
          continue;
        end;

    if not StringMode and not CommentMode then
      if Pos(Text[i], QuotationMarks) > 0 then
      begin
        StringMode := True;
        TmpSelStart := i;
        Inc(i);
        continue;
      end;
    if StringMode then
    begin
      if (Text[i] = Text[TmpSelStart]) or (i = Length(Text)) then
      begin
        StringMode := False;
        Inc(i);
        if i < APos then continue;
        SelStart := TmpSelStart;
        SelLength := i-TmpSelStart-2;
        Result := SetAttrs(StringFont);
{        SelStart := i;
        if Result then SelAttributes.Assign(DefAttributes);}
      end;
      inc(i);
      continue;
    end;

    if (Perform(EM_FINDWORDBREAK, WB_ISDELIMITER, i-1) = 0) and
       not (Text[i] in [#$0D, #$0A]) then
    begin
      if not WordMode then TmpSelStart := i-1;
      WordMode := True;
    end
    else
      if WordMode then
      begin
        WordMode := False;
        CurFont := TokenGroups.GetTokenFont(Copy(Text, TmpSelStart+1, i-TmpSelStart-1));
//        if CurFont <> nil then
//        begin
        if i < APos then begin inc(i); continue; end;

//      if WordMode then
//      begin
//        SelStart := i-1;
//        SetAttrs(DefAttributes);
//      end;
          SelStart := TmpSelStart;
          SelLength := i-TmpSelStart-1;
          if CurFont = nil then Result := SetAttrs(DefAttributes)
                           else Result := SetAttrs(CurFont);
          SelStart := i;
          if Result then SelAttributes.Assign(DefAttributes);
          continue
//        end;
      end;

    Inc(i);
  end;
  SelStart := OldSelStart;
end;

procedure TcitRichEdit.UpdateLook;
begin
  FChanging := True;
  UpdateLookFromPos(1);
  FChanging := False;
end;

procedure TcitRichEdit.Change;
  procedure SwapInt(var A, B : integer);
  var
    x : integer;
  begin
    x := B;
    B := A;
    A := x;
  end;
var
  i : integer;
  r : TRect;
  FChanged : boolean;
  TextAttrs : TTextAttributes;
begin
  inherited;
  if FChanging or (csReading in ComponentState) or (csDesigning in ComponentState) then Exit;
  FChanging := True;
  Application.ProcessMessages;
  HideCaret(Handle);
  Perform(WM_SETREDRAW, 0, 0);
  try
    i := Perform(EM_LINEINDEX, Perform(EM_LINEFROMCHAR, SelStart, 0), 0);
{    TextAttrs := TTextAttributes.Create(Self, atSelected);
    try
      TextAttrs.Assign(SelAttributes);}
      FChanged := UpdateLookFromPos(i+1);
{      SelAttributes.Assign(TextAttrs);
    finally
      TextAttrs.Free
    end;}
  finally
 //   SendMessage(Handle, WM_PAINT, Handle, 0);
(*    r := ClientRect;
{    if r.Left > r.Right then SwapInt(r.Left, r.Right);
    if r.Top > r.Bottom then SwapInt(r.Top, r.Bottom);
    r.Bottom := r.Bottom + 20;}
    InvalidateRect(Handle, @r, False);*)
    Perform(WM_SETREDRAW, 1, 0);
//    Repaint;
    Perform(EM_POSFROMCHAR, Integer(@r.Left), i);
    Perform(EM_POSFROMCHAR, Integer(@r.Right), SelStart+1);
    FChanging := False;
//    if r.Left > r.Right then SwapInt(r.Left, r.Right);
    r.Left := 0;
    r.Right := Width;
    if r.Top > r.Bottom then SwapInt(r.Top, r.Bottom);
    r.Bottom := r.Bottom + 20;
    if FChanged then InvalidateRect(Handle, @r, False);
    ShowCaret(Handle);
  end;
end;

end.
