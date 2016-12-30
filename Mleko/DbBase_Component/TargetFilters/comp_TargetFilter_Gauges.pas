unit comp_TargetFilter_Gauges;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, StdCtrls;

type

  TTarget_GaugeKind = (gkText, gkHorizontalBar, gkVerticalBar, gkPie, gkNeedle);

  TTarget_Gauge = class(TGraphicControl)
  private
    FMinValue: Int64;
    FMaxValue: Int64;
    FCurValue: Int64;
    FKind: TTarget_GaugeKind;
    FShowText: Boolean;
    FBorderStyle: TBorderStyle;
    FForeColor: TColor;
    FBackColor: TColor;
    procedure PaintBackground(AnImage: TBitmap);
    procedure PaintAsText(AnImage: TBitmap; PaintRect: TRect);
    procedure PaintAsNothing(AnImage: TBitmap; PaintRect: TRect);
    procedure PaintAsBar(AnImage: TBitmap; PaintRect: TRect);
    procedure PaintAsPie(AnImage: TBitmap; PaintRect: TRect);
    procedure PaintAsNeedle(AnImage: TBitmap; PaintRect: TRect);
    procedure SeTTarget_GaugeKind(Value: TTarget_GaugeKind);
    procedure SetShowText(Value: Boolean);
    procedure SetBorderStyle(Value: TBorderStyle);
    procedure SetForeColor(Value: TColor);
    procedure SetBackColor(Value: TColor);
    procedure SetMinValue(Value: Int64);
    procedure SetMaxValue(Value: Int64);
    procedure SetProgress(Value: Int64);
    function GetPercentDone: Int64;
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure AddProgress(Value: Int64);
    property PercentDone: Int64 read GetPercentDone;
  published
    property Align;
    property Anchors;
    property BackColor: TColor read FBackColor write SetBackColor default clWhite;
    property BorderStyle: TBorderStyle read FBorderStyle write SetBorderStyle default bsSingle;
    property Color;
    property Constraints;
    property Enabled;
    property ForeColor: TColor read FForeColor write SetForeColor default clBlack;
    property Font;
    property Kind: TTarget_GaugeKind read FKind write SeTTarget_GaugeKind default gkHorizontalBar;
    property MinValue: Int64 read FMinValue write SetMinValue default 0;
    property MaxValue: Int64 read FMaxValue write SetMaxValue default 100;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property Progress: Int64 read FCurValue write SetProgress;
    property ShowHint;
    property ShowText: Boolean read FShowText write SetShowText default True;
    property Visible;
  end;

procedure Register;

implementation

uses Consts;

procedure Register;
begin
  RegisterComponents('TargetDB', [TTarget_Gauge]);
end;

type
  TBltBitmap = class(TBitmap)
    procedure MakeLike(ATemplate: TBitmap);
  end;

{ TBltBitmap }

procedure TBltBitmap.MakeLike(ATemplate: TBitmap);
begin
  Width := ATemplate.Width;
  Height := ATemplate.Height;
  Canvas.Brush.Color := clWindowFrame;
  Canvas.Brush.Style := bsSolid;
  Canvas.FillRect(Rect(0, 0, Width, Height));
end;

{ This function solves for x in the equation "x is y% of z". }
function SolveForX(Y, Z: Int64): Int64;
begin
  Result := Int64(Trunc( Z * (Y * 0.01) ));
end;

{ This function solves for y in the equation "x is y% of z". }
function SolveForY(X, Z: Int64): Int64;
begin
  if Z = 0 then Result := 0
  else Result := Int64(Trunc( (X * 100.0) / Z ));
end;

{ TTarget_Gauge }

constructor TTarget_Gauge.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csFramed, csOpaque];
  { default values }
  FMinValue := 0;
  FMaxValue := 100;
  FCurValue := 0;
  FKind := gkHorizontalBar;
  FShowText := True;
  FBorderStyle := bsSingle;
  FForeColor := clBlack;
  FBackColor := clWhite;
  Width := 100;
  Height := 100;
end;

function TTarget_Gauge.GetPercentDone: Int64;
begin
  Result := SolveForY(FCurValue - FMinValue, FMaxValue - FMinValue);
end;

procedure TTarget_Gauge.Paint;
var
  TheImage: TBitmap;
  OverlayImage: TBltBitmap;
  PaintRect: TRect;
begin
  with Canvas do
  begin
    TheImage := TBitmap.Create;
    try
      TheImage.Height := Height;
      TheImage.Width := Width;
      PaintBackground(TheImage);
      PaintRect := ClientRect;
      if FBorderStyle = bsSingle then InflateRect(PaintRect, -1, -1);
      OverlayImage := TBltBitmap.Create;
      try
        OverlayImage.MakeLike(TheImage);
        PaintBackground(OverlayImage);
        case FKind of
          gkText: PaintAsNothing(OverlayImage, PaintRect);
          gkHorizontalBar, gkVerticalBar: PaintAsBar(OverlayImage, PaintRect);
          gkPie: PaintAsPie(OverlayImage, PaintRect);
          gkNeedle: PaintAsNeedle(OverlayImage, PaintRect);
        end;
        TheImage.Canvas.CopyMode := cmSrcInvert;
        TheImage.Canvas.Draw(0, 0, OverlayImage);
        TheImage.Canvas.CopyMode := cmSrcCopy;
        if ShowText then PaintAsText(TheImage, PaintRect);
      finally
        FreeAndNil(OverlayImage);
      end;
      Canvas.CopyMode := cmSrcCopy;
      Canvas.Draw(0, 0, TheImage);
    finally
      TheImage.Destroy;
    end;
  end;
end;

procedure TTarget_Gauge.PaintBackground(AnImage: TBitmap);
var
  ARect: TRect;
begin
  with AnImage.Canvas do
  begin
    CopyMode := cmBlackness;
    ARect := Rect(0, 0, Width, Height);
    CopyRect(ARect, Animage.Canvas, ARect);
    CopyMode := cmSrcCopy;
  end;
end;

procedure TTarget_Gauge.PaintAsText(AnImage: TBitmap; PaintRect: TRect);
var
  S: string;
  X, Y: Integer;
  OverRect: TBltBitmap;
begin
  OverRect := TBltBitmap.Create;
  try
    OverRect.MakeLike(AnImage);
    PaintBackground(OverRect);
    S := Format('%d%%', [PercentDone]);
    with OverRect.Canvas do
    begin
      Brush.Style := bsClear;
      Font := Self.Font;
      Font.Color := clWhite;
      with PaintRect do
      begin
        X := (Right - Left + 1 - TextWidth(S)) div 2;
        Y := (Bottom - Top + 1 - TextHeight(S)) div 2;
      end;
      TextRect(PaintRect, X, Y, S);
    end;
    AnImage.Canvas.CopyMode := cmSrcInvert;
    AnImage.Canvas.Draw(0, 0, OverRect);
  finally
    FreeAndNil(OverRect);
  end;
end;

procedure TTarget_Gauge.PaintAsNothing(AnImage: TBitmap; PaintRect: TRect);
begin
  with AnImage do
  begin
    Canvas.Brush.Color := BackColor;
    Canvas.FillRect(PaintRect);
  end;
end;

procedure TTarget_Gauge.PaintAsBar(AnImage: TBitmap; PaintRect: TRect);
var
  FillSize: Int64;
  W, H: Integer;
begin
  W := PaintRect.Right - PaintRect.Left + 1;
  H := PaintRect.Bottom - PaintRect.Top + 1;
  with AnImage.Canvas do
  begin
    Brush.Color := BackColor;
    FillRect(PaintRect);
    Pen.Color := ForeColor;
    Pen.Width := 1;
    Brush.Color := ForeColor;
    case FKind of
      gkHorizontalBar:
        begin
          FillSize := SolveForX(PercentDone, W);
          if FillSize > W then FillSize := W;
          if FillSize > 0 then FillRect(Rect(PaintRect.Left, PaintRect.Top,
            FillSize, H));
        end;
      gkVerticalBar:
        begin
          FillSize := SolveForX(PercentDone, H);
          if FillSize >= H then FillSize := H - 1;
          FillRect(Rect(PaintRect.Left, H - FillSize, W, H));
        end;
    end;
  end;
end;

procedure TTarget_Gauge.PaintAsPie(AnImage: TBitmap; PaintRect: TRect);
var
  MiddleX, MiddleY: Integer;
  Angle: Double;
  W, H: Integer;
begin
  W := PaintRect.Right - PaintRect.Left;
  H := PaintRect.Bottom - PaintRect.Top;
  if FBorderStyle = bsSingle then
  begin
    Inc(W);
    Inc(H);
  end;
  with AnImage.Canvas do
  begin
    Brush.Color := Color;
    FillRect(PaintRect);
    Brush.Color := BackColor;
    Pen.Color := ForeColor;
    Pen.Width := 1;
    Ellipse(PaintRect.Left, PaintRect.Top, W, H);
    if PercentDone > 0 then
    begin
      Brush.Color := ForeColor;
      MiddleX := W div 2;
      MiddleY := H div 2;
      Angle := (Pi * ((PercentDone / 50) + 0.5));
      Pie(PaintRect.Left, PaintRect.Top, W, H,
        Integer(Round(MiddleX * (1 - Cos(Angle)))),
        Integer(Round(MiddleY * (1 - Sin(Angle)))), MiddleX, 0);
    end;
  end;
end;

procedure TTarget_Gauge.PaintAsNeedle(AnImage: TBitmap; PaintRect: TRect);
var
  MiddleX: Integer;
  Angle: Double;
  X, Y, W, H: Integer;
begin
  with PaintRect do
  begin
    X := Left;
    Y := Top;
    W := Right - Left;
    H := Bottom - Top;
    if FBorderStyle = bsSingle then
    begin
      Inc(W);
      Inc(H);
    end;
  end;
  with AnImage.Canvas do
  begin
    Brush.Color := Color;
    FillRect(PaintRect);
    Brush.Color := BackColor;
    Pen.Color := ForeColor;
    Pen.Width := 1;
    Pie(X, Y, W, H * 2 - 1, X + W, PaintRect.Bottom - 1, X, PaintRect.Bottom - 1);
    MoveTo(X, PaintRect.Bottom);
    LineTo(X + W, PaintRect.Bottom);
    if PercentDone > 0 then
    begin
      Pen.Color := ForeColor;
      MiddleX := Width div 2;
      MoveTo(MiddleX, PaintRect.Bottom - 1);
      Angle := (Pi * ((PercentDone / 100)));
      LineTo(Integer(Round(MiddleX * (1 - Cos(Angle)))),
        Integer(Round((PaintRect.Bottom - 1) * (1 - Sin(Angle)))));
    end;
  end;
end;

procedure TTarget_Gauge.SeTTarget_GaugeKind(Value: TTarget_GaugeKind);
begin
  if Value <> FKind then
  begin
    FKind := Value;
    Refresh;
  end;
end;

procedure TTarget_Gauge.SetShowText(Value: Boolean);
begin
  if Value <> FShowText then
  begin
    FShowText := Value;
    Refresh;
  end;
end;

procedure TTarget_Gauge.SetBorderStyle(Value: TBorderStyle);
begin
  if Value <> FBorderStyle then
  begin
    FBorderStyle := Value;
    Refresh;
  end;
end;

procedure TTarget_Gauge.SetForeColor(Value: TColor);
begin
  if Value <> FForeColor then
  begin
    FForeColor := Value;
    Refresh;
  end;
end;

procedure TTarget_Gauge.SetBackColor(Value: TColor);
begin
  if Value <> FBackColor then
  begin
    FBackColor := Value;
    Refresh;
  end;
end;

procedure TTarget_Gauge.SetMinValue(Value: Int64);
begin
  if Value <> FMinValue then
  begin
    if Value > FMaxValue then
      if not (csLoading in ComponentState) then
        raise EInvalidOperation.CreateFmt(SOutOfRange, [-MaxInt, FMaxValue - 1]);
    FMinValue := Value;
    if FCurValue < Value then FCurValue := Value;
    Refresh;
  end;
end;

procedure TTarget_Gauge.SetMaxValue(Value: Int64);
begin
  if Value <> FMaxValue then
  begin
    if Value < FMinValue then
      if not (csLoading in ComponentState) then
        raise EInvalidOperation.CreateFmt(SOutOfRange, [FMinValue + 1, MaxInt]);
    FMaxValue := Value;
    if FCurValue > Value then FCurValue := Value;
    Refresh;
  end;
end;

procedure TTarget_Gauge.SetProgress(Value: Int64);
var
  TempPercent: Int64;
begin
  TempPercent := GetPercentDone;  { remember where we were }
  if Value < FMinValue then
    Value := FMinValue
  else if Value > FMaxValue then
    Value := FMaxValue;
  if FCurValue <> Value then
  begin
    FCurValue := Value;
    if TempPercent <> GetPercentDone then { only refresh if percentage changed }
      Refresh;
  end;
end;

procedure TTarget_Gauge.AddProgress(Value: Int64);
begin
  Progress := FCurValue + Value;
  Refresh;
end;

end.
