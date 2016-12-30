unit citDBGridUtils;

interface

uses
  Dialogs, Windows,
  Graphics, Types, Classes, StdCtrls, ImgList, Grids, Controls;

Type
  TTextOrientation = (toHorizontal, toVertical);

procedure UsesBitmap;
procedure ReleaseBitmap;
procedure ClearBitmap(Bitmap: TBitMap);
procedure DrawBitmapTransp(Canvas: TCanvas; bmp: TBitmap; bkcolor: TColor; r: TRect);

function GetTextWidth(Canvas:TCanvas; Text:String):Integer;
function PointInGridRect(Col, Row: Longint; const Rect: TGridRect): Boolean;

function MinimizeText(const Text: string; Canvas: TCanvas; MaxWidth: Integer): string;
function BreakStr(ACanvas: TCanvas; StrWidth: Integer; Str: String): TStringList;

function CreateVerticalFont(Font: TFont): HFont;

procedure Swap(var a, b: integer);

procedure RotateBitmap(pBitmap: TBitMap; pAngle: integer);

procedure WriteTextEh(ACanvas: TCanvas; ARect: TRect; //FillRect: boolean;
  DX, DY: integer; Text: string; Alignment: TAlignment; Layout: TTextLayout;
  MultyL: boolean; EndEllipsis: boolean; LeftMarg, RightMarg: integer; pRotate: boolean = False);

procedure WriteTextVerticalEhOld(ACanvas: TCanvas; ARect: TRect; DX, DY: integer;
  Text: string; Alignment: TAlignment; Layout: TTextLayout; MultyL: boolean;
  EndEllipsis: boolean; LeftMarg, RightMarg: integer);

procedure DrawClipped(imList: TCustomImageList; // TCustomImageList{ $ELSE}TImageList{ $ENDIF}
  ACanvas: TCanvas; ARect: TRect; Index, ALeftMarg: Integer; Align: TAlignment);

procedure WriteText(ACanvas: TCanvas; ARect: TRect; DX, DY: Integer;
  const Text: string; Alignment: TAlignment; ARightToLeft: Boolean);

var
  DrawBitmap: TBitmap = nil;
  UserCount: Integer = 0;

implementation

uses
  Math, SysUtils, EnTransf, EnDiGrph;

procedure UsesBitmap;
begin
  if UserCount = 0 then DrawBitmap := TBitmap.Create;
  Inc(UserCount);
end;

procedure ReleaseBitmap;
begin
  Dec(UserCount);
  if UserCount = 0 then DrawBitmap.Free;
end;

procedure ClearBitmap(Bitmap: TBitMap);
begin
  if Assigned(Bitmap) then BitMap.FreeImage;
end;

procedure DrawBitmapTransp(Canvas: TCanvas; bmp: TBitmap; bkcolor: TColor; r: TRect);
var
  tmpbmp: TBitmap;
  srcColor: TColor;
  tgtrect: TRect;
begin
  TmpBmp := TBitmap.Create;
  TmpBmp.Height := bmp.Height;
  TmpBmp.Width := bmp.Width;
  tgtrect.left :=0;
  tgtrect.top :=0;
  tgtrect.right := bmp.width;
  tgtrect.bottom := bmp.Height;
  r.bottom := r.top + bmp.height;
  r.Right := r.Left + bmp.width;
  TmpBmp.Canvas.Brush.Color := bkcolor;
  srcColor := bmp.canvas.pixels[0,0];
  TmpBmp.Canvas.BrushCopy(tgtrect,bmp,tgtrect,srcColor);
  Canvas.CopyRect(r, TmpBmp.Canvas, tgtrect);
  TmpBmp.Free;
end;

//----------

function GetTextWidth(Canvas:TCanvas; Text:String):Integer;
var ARect:TRect;
    uFormat:Integer;
begin
  uFormat := DT_CALCRECT or DT_LEFT or DT_NOPREFIX;
  ARect := Rect(0,0,1,0);
  DrawText(Canvas.Handle, PChar(Text), Length(Text), ARect, uFormat);
  Result := ARect.Right - ARect.Left;
end;

function PointInGridRect(Col, Row: Longint; const Rect: TGridRect): Boolean;
begin
  Result := (Col >= Rect.Left) and (Col <= Rect.Right) and (Row >= Rect.Top)
    and (Row <= Rect.Bottom);
end;

function MinimizeText(const Text: string; Canvas: TCanvas; MaxWidth: Integer): string;
var
  I: Integer;
begin
  Result := Text;
  I := 1;
  while (I <= Length(Text)) and (Canvas.TextWidth(Result) > MaxWidth) do begin
    Inc(I);
    Result := Copy(Text, 1, Max(0, Length(Text) - I)) + '...';
  end;
end;

function BreakStr(ACanvas: TCanvas; StrWidth: Integer; Str: String): TStringList;
const Dividers=' ,.<>:;-*/+"''$#()=';
var i: Integer;
    tmp: String;
    Words: TStringList;
begin
  Words:=TStringList.Create;
  Result:=TStringList.Create;
  tmp:='';
  for i:=1 to Length(Str) do
  begin
    tmp:=tmp+Str[i];
    if Pos(Str[i],Dividers)>0 then begin Words.Add(tmp); tmp:='' end;
  end;
  Words.Add(tmp);
  tmp:='';
  Result.Add(Words[0]);
  for i:=1 to Words.Count-1 do
  begin
    if (ACanvas.TextWidth(Result[Result.Count-1]+Words[i])>StrWidth) then
    begin
      Result[Result.Count-1]:=Trim(Result[Result.Count-1]); //trim the blanks at the line's edges
      Result.Add(Words[i]);
    end
    else
      Result[Result.Count-1]:=Result[Result.Count-1]+Words[i];
  end;
end;

function CreateVerticalFont(Font: TFont): HFont;
var
  LogFont:TLogFont;
begin
  with LogFont do
  begin
    lfEscapement := 900;
    lfOrientation := 900;

    lfHeight := Font.Height;
    lfWidth := 0; { have font mapper choose }
    if fsBold in Font.Style then
      lfWeight := FW_BOLD
    else
      lfWeight := FW_NORMAL;
    lfItalic := Byte(fsItalic in Font.Style);
    lfUnderline := Byte(fsUnderline in Font.Style);
    lfStrikeOut := Byte(fsStrikeOut in Font.Style);
    lfCharSet := Byte(Font.Charset);
    if AnsiCompareText(Font.Name, 'Default') = 0 then  // do not localize
      StrPCopy(lfFaceName, DefFontData.Name)
    else
      StrPCopy(lfFaceName, Font.Name);
    lfQuality := DEFAULT_QUALITY;
    { Everything else as default }
    lfOutPrecision := OUT_TT_ONLY_PRECIS; //OUT_DEFAULT_PRECIS;
    lfClipPrecision := CLIP_DEFAULT_PRECIS;
    case Font.Pitch of
      fpVariable: lfPitchAndFamily := VARIABLE_PITCH;
      fpFixed: lfPitchAndFamily := FIXED_PITCH;
    else
      lfPitchAndFamily := DEFAULT_PITCH;
    end;
  end;

  Result := CreateFontIndirect(LogFont);
end;

procedure Swap(var a, b: integer);
var c:Integer;
begin
  c := a;
  a := b;
  b := c;
end;

procedure RotateBitmap(pBitmap: TBitMap; pAngle: integer);
var
  Transform	: TRotateTransform;
  FUndoGraphic	: TDibGraphic;
  FUndoGraphic2	: TDibGraphic;

  x, y		: integer;
  x2, y2	: integer;
  vBitMap	: TBitMap;
  PSrc		: PByteArray;
  PDst		: PByteArray;
  fff		: TDibGraphic;
begin
  FUndoGraphic := TDibGraphic.Create;
  FUndoGraphic.Assign(pBitmap);
  FUndoGraphic2 := TDibGraphic.Create;
  Transform := TRotateTransform.Create;
  try
    Transform.Angle := pAngle;
//    ShowMessage('RotateBitmap 0');
    Transform.ApplyOnDest(FUndoGraphic, FUndoGraphic2);
//    ShowMessage('RotateBitmap 1');
    FUndoGraphic2.AssignTo(pBitmap);
//    ShowMessage('RotateBitmap 2');
  finally
    Transform.Free;
    FUndoGraphic.Free;
    FUndoGraphic2.Free;
  end;
  Exit;



  vBitMap := TBitMap.create;
  vBitMap.Assign(pBitMap);

  for y := 0 to vBitMap.Height -1 do
  begin
    PSrc := vBitMap.ScanLine[y];
    if y > (vBitMap.Width - 1) then Break;
    PSrc[y] := 0;
  end;
  Exit;

  vBitMap.Height := pBitMap.Width;
  vBitMap.Width  := pBitMap.Height;
{    vBitMap.Monochrome := BitMap.Width;
  vBitMap.Palette
  vBitMap.PixelFormat
  vBitMap.ScanLine
  vBitMap.TransparentColor}
  for y := 0 to pBitMap.Height -1 do
  begin
    PSrc := pBitMap.ScanLine[y];
    for x := 0 to pBitMap.Width - 1 do
    begin
      x2 := y - 1; y2 := pBitMap.Width - x - 1;
      PDst := pBitMap.ScanLine[y2];
      PDst[x2] := PSrc[x];
    end;
  end;
//  pBitMap.Assign(vBitMap);
//  Result := vBitMap;
end;

procedure WriteTextEh(ACanvas: TCanvas; ARect: TRect; //FillRect: boolean;
  DX, DY: integer; Text: string; Alignment: TAlignment; Layout: TTextLayout;
  MultyL: boolean; EndEllipsis: boolean; LeftMarg, RightMarg: integer; pRotate: boolean = False);
const
  AlignFlags : array [TAlignment] of Integer =
    ( DT_LEFT or DT_EXPANDTABS or DT_NOPREFIX,
      DT_RIGHT or DT_EXPANDTABS or DT_NOPREFIX,
      DT_CENTER or DT_EXPANDTABS or DT_NOPREFIX );
var
  rect1: TRect;
  txth, DrawFlag, Left, TextWidth: Integer;
  lpDTP :  TDrawTextParams;
  B: TRect;
  vRect	: TRect;
  w1,h1	: integer; 
begin
  vRect := ARect;
  if pRotate then
  begin
    Swap(vRect.Left, vRect.Top);
    Swap(vRect.Right, vRect.Bottom);
  end;

  if MultyL then
  begin                       // Use ExtTextOut for solid colors and single-line text
    DrawBitmap.Canvas.Lock;
    try
      DrawBitmap.Width := vRect.Right - vRect.Left;
      DrawBitmap.Height := vRect.Bottom - vRect.Top;

{      DrawBitmap.Width := Max(DrawBitmap.Width, vRect.Right - vRect.Left);
      DrawBitmap.Height := Max(DrawBitmap.Height, vRect.Bottom - vRect.Top);}

      B := Rect(0, 0, vRect.Right - vRect.Left, vRect.Bottom - vRect.Top);

      DrawBitmap.Canvas.Font := ACanvas.Font;
      DrawBitmap.Canvas.Font.Color := ACanvas.Font.Color;
      DrawBitmap.Canvas.Brush := ACanvas.Brush;
      DrawBitmap.Canvas.Brush.Style := bsSolid;

      SetBkMode(DrawBitmap.Canvas.Handle, TRANSPARENT);

      {if (FillRect = True) then }DrawBitmap.Canvas.FillRect(B);

      DrawFlag := 0;
      DrawFlag := DrawFlag or DT_WORDBREAK;
      if (EndEllipsis = True) then DrawFlag := DrawFlag or DT_END_ELLIPSIS;
      DrawFlag := DrawFlag or AlignFlags[Alignment];

      lpDTP.cbSize := SizeOf(lpDTP);
      lpDTP.uiLengthDrawn := Length(Text);
      lpDTP.iLeftMargin := LeftMarg;
      lpDTP.iRightMargin := RightMarg;

      Rect1 := B; InflateRect(Rect1, -DX, -DY);

      if (Layout <> tlTop) and (MultyL = True) then
        txth := DrawTextEx(ACanvas.Handle, PChar(Text), Length(Text),
           Rect1, DrawFlag or DT_CALCRECT, @lpDTP) // Получить квадрат.
      else txth := 0;

      Rect1 := B;  InflateRect(Rect1, -DX, -DY);

      case Layout of
       tlTop: ;
       tlBottom: Rect1.top := Rect1.Bottom - txth;
       tlCenter: Rect1.top := Rect1.top + ((Rect1.Bottom - Rect1.top) div 2) - (txth div 2);
      end;

      if DX > 0 then Rect1.Bottom := Rect1.Bottom + 1;

      DrawTextEx(DrawBitmap.Canvas.Handle, PChar(Text), Length(Text), Rect1, DrawFlag, @lpDTP);
      if pRotate then
      begin
        w1 := DrawBitmap.Width;
        h1 := DrawBitmap.Height;
        Swap(B.Left, B.Top);
        Swap(B.Right, B.Bottom);
        RotateBitmap(DrawBitmap, 270);
{        MessageDlgPos(
          'DrawBitmap befor ' + IntToStr(w1) + ':' + IntToStr(h1)+#$0D#$0A+
          'DrawBitmap аfter ' + IntToStr(DrawBitmap.Width) + ':' + IntToStr(DrawBitmap.Height)+#$0D#$0A+
          'vRect ' + IntToStr(vRect.Left) + ':' + IntToStr(vRect.Top)
            + ' - ' + IntToStr(vRect.Right) + ':' + IntToStr(vRect.Bottom)
            + ' (' + IntToStr(vRect.Right-vRect.Left) + ':' + IntToStr(vRect.Bottom-vRect.Top) + ')'+#$0D#$0A+
          'B ' + IntToStr(B.Left) + ':' + IntToStr(B.Top)
            + ' - ' + IntToStr(B.Right) + ':' + IntToStr(B.Bottom)
            + ' (' + IntToStr(B.Right-B.Left) + ':' + IntToStr(B.Bottom-B.Top) + ')'+#$0D#$0A+
          'ARect ' + IntToStr(ARect.Left) + ':' + IntToStr(ARect.Top)
            + ' - ' + IntToStr(ARect.Right) + ':' + IntToStr(ARect.Bottom)
            + ' (' + IntToStr(ARect.Right-ARect.Left) + ':' + IntToStr(ARect.Bottom-ARect.Top) + ')'
          ,mtInformation, [mbOk], 0, 1,1
        );}
      end;
      ACanvas.CopyRect(ARect, DrawBitmap.Canvas, B); //B
    finally
      DrawBitmap.Canvas.Unlock;
    end;
  end
  else begin
    if EndEllipsis then Text := MinimizeText(Text,ACanvas,ARect.Right - ARect.Left - DX);
    if (Alignment <> taLeftJustify) and (ACanvas.Font.Style * [fsBold, fsItalic] <> []) then
    begin
      TextWidth := GetTextWidth(ACanvas,Text)
    end else
      TextWidth := ACanvas.TextWidth(Text);

    case Alignment of
      taLeftJustify:
        Left := ARect.Left + DX;
      taRightJustify:
        Left := ARect.Right - TextWidth - 3;
    else // taCenter
      Left := ARect.Left + (ARect.Right - ARect.Left) shr 1 - (TextWidth shr 1) ;
    end;
    ACanvas.TextRect(ARect, Left, ARect.Top + DY, Text);
  end;
end;

procedure WriteTextVerticalEhOld(ACanvas:TCanvas;
                          ARect: TRect;           // Draw rect and ClippingRect
//                          FillRect: boolean;      // Fill rect Canvas.Brash.Color
                          DX, DY: integer;        // InflateRect(Rect, -DX, -DY) for text
                          Text: string;           // Draw text
                          Alignment: TAlignment;  // Text alignment
                          Layout: TTextLayout;    // Text layout
                          MultyL: boolean;        // Многострочный
                          EndEllipsis: boolean;   // Truncate long text by ellipsis
                          LeftMarg, RightMarg: integer
                          );
const
  AlignFlags : array [TAlignment] of Integer =
    ( DT_LEFT or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX,
      DT_RIGHT or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX,
      DT_CENTER or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX );
var
//  Left, Top,
  TextWidth	: integer;
  tm		: TTextMetric;
  otm		: TOutlineTextMetric;
  Overhang	: integer;

  B		: TRect;
  DrawFlag	: Integer;
  rect1		: TRect;
  lpDTP		:  TDrawTextParams;
  txth{, DrawFlag, Left, TextWidth}: Integer;
  RectInv	: TRect;
begin
  WriteTextEh(ACanvas, ARect, DX, DY, Text, Alignment, Layout,
    MultyL, EndEllipsis, LeftMarg, RightMarg, True);
  Exit;  

//  Swap(ARect.Top, ARect.Bottom);
  RectInv.Left := ARect.Top;
  RectInv.Right := ARect.Bottom;
  RectInv.Top := ARect.Left;
  RectInv.Bottom := ARect.Right;

  ACanvas.Font.Handle := CreateVerticalFont(ACanvas.Font);
  try
  GetTextMetrics(ACanvas.Handle,tm);
  Overhang := tm.tmOverhang;
  if (tm.tmPitchAndFamily and TMPF_TRUETYPE <> 0) and
     (ACanvas.Font.Style * [fsItalic] <> []) then
  begin
    otm.otmSize := SizeOf(otm);
    GetOutlineTextMetrics(ACanvas.Handle, otm.otmSize, @otm);
    Overhang := (tm.tmHeight - tm.tmInternalLeading) * otm.otmsCharSlopeRun div otm.otmsCharSlopeRise;
  end;

  TextWidth := ACanvas.TextWidth(Text);
//  Result := TextWidth + Overhang;
//  if CalcTextExtent then Exit;

  // ------------------------------------------------------------

  DrawBitmap.Canvas.Lock;
  try
    DrawBitmap.Width := Max(DrawBitmap.Width, ARect.Right - ARect.Left);
    DrawBitmap.Height := Max(DrawBitmap.Height, ARect.Bottom - ARect.Top);
    B := Rect(0,0,ARect.Right - ARect.Left, ARect.Bottom - ARect.Top);
    DrawBitmap.Canvas.Font := ACanvas.Font;
    DrawBitmap.Canvas.Font.Color := ACanvas.Font.Color;
    DrawBitmap.Canvas.Brush := ACanvas.Brush;
    DrawBitmap.Canvas.Brush.Style := bsSolid;

    SetBkMode(DrawBitmap.Canvas.Handle, TRANSPARENT);

    {if (FillRect = True) then }DrawBitmap.Canvas.FillRect(B);

    DrawText(DrawBitmap.Canvas.Handle, PChar(Text), Length(Text), B, AlignFlags[Alignment]); // Это было раньше для вертикалки
    Exit;

    DrawFlag := 0;
    if (MultyL = True) then DrawFlag := DrawFlag or DT_WORDBREAK;
    if (EndEllipsis = True) then DrawFlag := DrawFlag or DT_END_ELLIPSIS;
    DrawFlag := DrawFlag or AlignFlags[Alignment];

    rect1 := B;

    lpDTP.cbSize := SizeOf(lpDTP);
    lpDTP.uiLengthDrawn := Length(Text);
    lpDTP.iLeftMargin := LeftMarg;
    lpDTP.iRightMargin := RightMarg;

    InflateRect(rect1, -DX, -DY);

    if (Layout <> tlTop) {and (MultyL = True)} then
      txth := DrawTextEx(ACanvas.Handle,PChar(Text), Length(Text),
         rect1, DrawFlag or DT_CALCRECT,@lpDTP) // Получить квадрат.
    else txth := 0;
    rect1 := B;  {}
    InflateRect(rect1, -DX, -DY);

    case Layout of
     tlTop: ;
     tlBottom: rect1.top := rect1.Bottom - txth;
     tlCenter: rect1.top := rect1.top + ((rect1.Bottom-rect1.top) div 2) - (txth div 2);
    end;

    if DX > 0 then rect1.Bottom := rect1.Bottom + 1;
      DrawTextEx(DrawBitmap.Canvas.Handle,PChar(Text), Length(Text), rect1, DrawFlag, @lpDTP);

    ACanvas.CopyRect(ARect, DrawBitmap.Canvas, B);
  finally
    DrawBitmap.Canvas.Unlock;
  end;

  finally
    ACanvas.Font.Height := ACanvas.Font.Height;
  end;
  // ============================================================

(*  Swap(ARect.Top, ARect.Bottom);

  ACanvas.Font.Handle := CreateVerticalFont(ACanvas.Font);
  try
  GetTextMetrics(ACanvas.Handle,tm);
  Overhang := tm.tmOverhang;
  if (tm.tmPitchAndFamily and TMPF_TRUETYPE <> 0) and
     (ACanvas.Font.Style * [fsItalic] <> []) then
  begin
    otm.otmSize := SizeOf(otm);
    GetOutlineTextMetrics(ACanvas.Handle, otm.otmSize, @otm);
    Overhang := (tm.tmHeight - tm.tmInternalLeading) * otm.otmsCharSlopeRun div otm.otmsCharSlopeRise;
  end;

  TextWidth := ACanvas.TextWidth(Text);
  Result := TextWidth + Overhang;
  if CalcTextExtent then Exit;

  case Alignment of
    taLeftJustify:  Left := ARect.Left + DX;
    taRightJustify: Left := ARect.Right - ACanvas.TextHeight(Text);
  else // taCenter
    Left := ARect.Left + (ARect.Right - ARect.Left) shr 1
      - ((ACanvas.TextHeight(Text)+tm.tmOverhang) shr 1);
  end;
  case Layout of
    tlTop: Top := ARect.Bottom + TextWidth + Overhang;
    tlBottom: Top := ARect.Top - DY;
  else
    Top := ARect.Top - (ARect.Top - ARect.Bottom) shr 1
      + ((TextWidth+Overhang) shr 1);
  end;
  ACanvas.TextRect(ARect, Left, Top, Text);
  finally
    ACanvas.Font.Height := ACanvas.Font.Height;
  end;*)
end;

procedure DrawClipped(imList: TCustomImageList; // TCustomImageList{ $ELSE}TImageList{ $ENDIF}
  ACanvas:TCanvas; ARect:TRect; Index, ALeftMarg: Integer; Align:TAlignment);
var CheckedRect,AUnionRect:TRect;
    OldRectRgn,RectRgn:HRGN;
    r,x,y:Integer;
begin
  case Align of
    taLeftJustify: x := ARect.Left + ALeftMarg;
    taRightJustify: x := ARect.Right - imList.Width + ALeftMarg;
  else
    x := (ARect.Right + ARect.Left - imList.Width) div 2 + ALeftMarg;
  end;
  y := (ARect.Bottom + ARect.Top - imList.Height) div 2;
  CheckedRect := Rect(X,Y,X+imList.Width,Y+imList.Height);
  UnionRect(AUnionRect,CheckedRect,ARect);
  if EqualRect(AUnionRect,ARect) then // ARect containt image
    imList.Draw(ACanvas, X, Y, Index)
  else begin                          // Need clip
    OldRectRgn := CreateRectRgn(0,0,0,0);
    r := GetClipRgn(ACanvas.Handle, OldRectRgn);
    RectRgn := CreateRectRgn(ARect.Left,ARect.Top,ARect.Right,ARect.Bottom);
    SelectClipRgn(ACanvas.Handle, RectRgn);
    DeleteObject(RectRgn);

    imList.Draw(ACanvas, X, Y, Index);

    if r = 0 then
      SelectClipRgn(ACanvas.Handle, 0)
    else
      SelectClipRgn(ACanvas.Handle, OldRectRgn);
    DeleteObject(OldRectRgn);
  end;
end;

procedure WriteText(ACanvas: TCanvas; ARect: TRect; DX, DY: Integer;
  const Text: string; Alignment: TAlignment; ARightToLeft: Boolean);
const
  AlignFlags: array [TAlignment] of Integer=
    ( DT_LEFT or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX,
      DT_RIGHT or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX,
      DT_CENTER or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX );
  RTL: array [Boolean] of Integer=(0, DT_RTLREADING);
var
  B, R: TRect;
  Hold, Left: Integer;
  I: TColorRef;
begin
  I:=ColorToRGB(ACanvas.Brush.Color);
  if GetNearestColor(ACanvas.Handle, I)=I then
  begin
    if (ACanvas.CanvasOrientation=coRightToLeft) and (not ARightToLeft) then
      ChangeBiDiModeAlignment(Alignment);
    case Alignment of
      taLeftJustify:
        Left:=ARect.Left+DX;
      taRightJustify:
        Left:=ARect.Right-ACanvas.TextWidth(Text)-3;
    else
      Left:=ARect.Left+(ARect.Right-ARect.Left) shr 1 - (ACanvas.TextWidth(Text) shr 1);
    end;
    ACanvas.TextRect(ARect, Left, ARect.Top+DY, Text);
  end
  else begin
    DrawBitmap.Canvas.Lock;
    try
      with DrawBitmap, ARect do
      begin
        Width:=Max(Width, Right-Left);
        Height:=Max(Height, Bottom-Top);
        R:=Rect(DX, DY, Right-Left-1, Bottom-Top-1);
        B:=Rect(0, 0, Right-Left, Bottom-Top);
      end;
      with DrawBitmap.Canvas do
      begin
        Font:=ACanvas.Font;
        Font.Color:=ACanvas.Font.Color;
        Brush:=ACanvas.Brush;
        Brush.Style:=bsSolid;
        FillRect(B);
        SetBkMode(Handle, TRANSPARENT);
        if (ACanvas.CanvasOrientation=coRightToLeft) then ChangeBiDiModeAlignment(Alignment);
        DrawText(Handle, PChar(Text), Length(Text), R,
          AlignFlags[Alignment] or RTL[ARightToLeft]);
      end;
      if (ACanvas.CanvasOrientation=coRightToLeft) then
      begin
        Hold:=ARect.Left;
        ARect.Left:=ARect.Right;
        ARect.Right:=Hold;
      end;
      ACanvas.CopyRect(ARect, DrawBitmap.Canvas, B);
    finally
      DrawBitmap.Canvas.Unlock;
    end;
  end;
end;


end.
