{----------------------------------------------------------------------------
|
| Library: Envision
|
| Module: OverviewPanel
|
| Description: TOverviewPanel
|
| History: May 22, 2002. Francesco Pucino, first version
|
|---------------------------------------------------------------------------}

unit EnOverviewPanel;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    EnImgScr, EnDiGrph, ExtCtrls;

type

TOverviewPanel = class( TPanel)
private
    { Private declarations }
    FImage: TImageScrollBox;
    FPlaceHolderColor: TColor;
    FSyncronizeCursor: TThread;
    FOriginalImage: TImageScrollBox;
    FOnOldRedraw: TRedrawEvent;
    XCursorPosition,
        YCursorPosition,
        CursorWidth,
        CursorHeight: Integer;
    DeltaX, DeltaY: Integer;
    Dragging: Boolean;
    procedure ImageMouseDown( Sender: TObject;
        Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ImageMouseMove( Sender: TObject;
        Shift: TShiftState; X, Y: Integer);
    procedure ImageMouseUp( Sender: TObject;
        Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormResize( Sender: TObject);
    procedure RedrawImage( const Graphic: TDibGraphic);
    procedure SetSource( Value: TImageScrollBox);
    procedure SetColor( Value: TColor);
    procedure UpdateCursor( Sender: TObject);
    procedure CalcCursor( Sender: TObject);
    procedure DrawCursor( Sender: TObject);
    procedure NewRedraw( const Graphic: TDibGraphic);
    procedure CenterImage;
    function GetCursorWidth: Integer;
    function GetCursorHeight: Integer;
    function GetCursorLeft: Integer;
    function GetCursorTop: Integer;
    {procedure ScaleToGray;}
protected
public
    { Public declarations }
    constructor Create( AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Reset;
published
    { Property declarations }
    property Source: TImageScrollBox read FOriginalImage write SetSource;
    property PlaceHolderColor: TColor read FPlaceHolderColor write SetColor;
end;

{--------------------------------------------------------------------------}

implementation

type

TSyncronizeCursor = class( TThread)
private
    { Private declarations }
    FOverviewPanel: TOverviewPanel;
    procedure UpdateCursor;
protected
    procedure Execute; override;
end;

{--------------------------------------------------------------------------}

procedure TOverviewPanel.Reset;
begin
    CenterImage;
    FImage.Redraw( True);
    CursorWidth := 0;
    CursorHeight := 0;
    XCursorPosition := 0;
    YCursorPosition := 0;
    UpdateCursor( Self);
end;

{--------------------------------------------------------------------------}

procedure TOverviewPanel.SetSource( Value: TImageScrollBox);
begin
    // If old image is still assigned
    if Assigned( FOriginalImage) then
        // then reset old redraw event
        FOriginalImage.OnRedraw := FOnOldRedraw;
    // Set new value
    FOriginalImage := Value;
    // Check if value is valid
    if FOriginalImage <> nil then
    begin
        // Save old ovent
        FOnOldRedraw := FOriginalImage.OnRedraw;
        // Set new event
        FOriginalImage.OnRedraw := NewRedraw;
        // Set same small image as original
        FImage.Graphic := FOriginalImage.Graphic;
        // Set zoom mode
        FImage.ZoomMode := zmFitToPage;
        FImage.Redraw( True);
        // Center image into form
        Reset;
        FSyncronizeCursor.Resume;
    end
    else
    begin
        FSyncronizeCursor.Suspend;
        FImage.Graphic := nil;
        // Force redraw
        FImage.Redraw( True);
    end;
end;

{--------------------------------------------------------------------------}

procedure TOverviewPanel.SetColor( Value: TColor);
begin
    if Value = FPlaceHolderColor then
        Exit;
    FPlaceHolderColor := Value;
    Reset;
end;

{--------------------------------------------------------------------------}

procedure TOverviewPanel.ImageMouseDown(
    Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
    Y: Integer);
begin
    { Check if left button is down }
    if Button <> mbLeft then
        Exit;
    { Check if mouse is in cursor }
    if ( X >= XCursorPosition) and ( X <= XCursorPosition + CursorWidth) and
        ( Y >= YCursorPosition) and ( Y <= YCursorPosition + CursorWidth) then
    begin
        { Calc distance from mouse and cursor }
        DeltaX := X - XCursorPosition;
        DeltaY := Y - YCursorPosition;
        { Set drawing variables }
        Dragging := True;
        if Assigned( FSyncronizeCursor) then
            FSyncronizeCursor.Suspend;
    end
    else
    begin
        // Delete current cursor
        DrawCursor( Self);
        XCursorPosition := X;
        YCursorPosition := Y;
        // Draw new cursor
        DrawCursor( Self);
        FImage.Refresh;
        // Scroll original image
        FOriginalImage.HorzScrollBar.Position :=
            Round( ( FOriginalImage.DisplayedGraphic.Width / FImage.DisplayedGraphic.Width) *
            XCursorPosition);
        FOriginalImage.VertScrollBar.Position :=
            Round( ( FOriginalImage.DisplayedGraphic.Height / FImage.DisplayedGraphic.Height) *
            YCursorPosition);
    end;
end;

{--------------------------------------------------------------------------}

procedure TOverviewPanel.ImageMouseMove(
    Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
    if Dragging then
    begin
        // Delete current cursor
        DrawCursor( Self);
        // Calculate new curor position
        XCursorPosition := X - DeltaX;
        YCursorPosition := Y - DeltaY;
        if XCursorPosition < 0 then
            XCursorPosition := 0;
        if YCursorPosition < 0 then
            YCursorPosition := 0;
        if XCursorPosition + CursorWidth > FImage.DisplayedGraphic.Width then
            XCursorPosition := FImage.DisplayedGraphic.Width - CursorWidth;
        if YCursorPosition + CursorHeight > FImage.DisplayedGraphic.Height then
            YCursorPosition := FImage.DisplayedGraphic.Height - CursorHeight;
        // Draw new cursor
        DrawCursor( Self);
        FImage.Refresh;
        // Scroll original image
        FOriginalImage.HorzScrollBar.Position :=
            Round( ( FOriginalImage.DisplayedGraphic.Width / FImage.DisplayedGraphic.Width) *
            XCursorPosition);
        FOriginalImage.VertScrollBar.Position :=
            Round( ( FOriginalImage.DisplayedGraphic.Height / FImage.DisplayedGraphic.Height) *
            YCursorPosition);
    end;
end;

{--------------------------------------------------------------------------}

procedure TOverviewPanel.ImageMouseUp( Sender: TObject;
    Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    { Check if left button is up }
    if Button <> mbLeft then
        Exit;
    // Exit if dragging
    if Dragging then
    begin
        Dragging := False;
        if Assigned( FSyncronizeCursor) then
            FSyncronizeCursor.Resume;
    end;
end;

{--------------------------------------------------------------------------}

procedure TOverviewPanel.DrawCursor( Sender: TObject);
var
    OldRop: Integer;
begin
    // If canvasa not assigned, exit
    //if not Assigned(Immagine.DisplayedGraphic.Canvas) then Exit;
    // Set xor draw mode
    OldRop := SetROP2( FImage.DisplayedGraphic.Canvas.Handle, R2_XORPEN);
    try
        // Set draw parameters
        FImage.DisplayedGraphic.Canvas.Brush.Style := bsSolid;
        FImage.DisplayedGraphic.Canvas.Brush.Color := $00FFFFFF - FPlaceHolderColor; // clWhite;
        FImage.DisplayedGraphic.Canvas.Pen.Color := $00FFFFFF - FPlaceHolderColor;
        // Draw the cursor
        FImage.DisplayedGraphic.Canvas.Rectangle( XCursorPosition, YCursorPosition,
            XCursorPosition + CursorWidth, YCursorPosition + CursorHeight);
    finally
        // Reset old draw mode
        SetROP2( FImage.DisplayedGraphic.Canvas.Handle, OldRop);
    end;
end;

{--------------------------------------------------------------------------}

procedure TOverviewPanel.UpdateCursor( Sender: TObject);
begin
    if not Assigned( FImage.DisplayedGraphic.Canvas) then
        Exit;
    // Delete old cursor
    DrawCursor( Self);
    // Calcultates new cursor coordinates
    CalcCursor( Self);
    // Draw new cursor
    DrawCursor( Self);
    // Refresh image
    FImage.Refresh;
end;

{--------------------------------------------------------------------------}

function TOverviewPanel.GetCursorWidth: Integer;
begin
    Result := 0;
    if csDestroying in ComponentState then
        Exit;
    if not Assigned( FImage.DisplayedGraphic.Canvas) then
        Exit;
    Result := Round( ( FImage.DisplayedGraphic.Width / FOriginalImage.DisplayedGraphic.Width) *
        FOriginalImage.ClientWidth);
end;

{--------------------------------------------------------------------------}

function TOverviewPanel.GetCursorHeight: Integer;
begin
    Result := 0;
    if csDestroying in ComponentState then
        Exit;
    if not Assigned( FImage.DisplayedGraphic.Canvas) then
        Exit;
    Result := Round( ( FImage.DisplayedGraphic.Height / FOriginalImage.DisplayedGraphic.Height) *
        FOriginalImage.ClientHeight);
end;

{--------------------------------------------------------------------------}

function TOverviewPanel.GetCursorLeft: Integer;
begin
    Result := 0;
    if csDestroying in ComponentState then
        Exit;
    if not Assigned( FImage.DisplayedGraphic.Canvas) then
        Exit;
    Result := Round( ( FImage.DisplayedGraphic.Width / FOriginalImage.DisplayedGraphic.Width) *
        FOriginalImage.HorzScrollBar.Position);
end;

{--------------------------------------------------------------------------}

function TOverviewPanel.GetCursorTop: Integer;
begin
    Result := 0;
    if csDestroying in ComponentState then
        Exit;
    if not Assigned( FImage.DisplayedGraphic.Canvas) then
        Exit;
    Result := Round( ( FImage.DisplayedGraphic.Height / FOriginalImage.DisplayedGraphic.Height) *
        FOriginalImage.VertScrollBar.Position);
end;

{--------------------------------------------------------------------------}

procedure TOverviewPanel.CalcCursor( Sender: TObject);
begin
    CursorWidth := GetCursorWidth;
    CursorHeight := GetCursorHeight;
    XCursorPosition := GetCursorLeft;
    YCursorPosition := GetCursorTop;
end;

{--------------------------------------------------------------------------}

constructor TOverviewPanel.Create( AOwner: TComponent);
begin
    inherited Create( AOwner);
    // Reset parameters
    BevelOuter := bvNone;
    Caption := '';
    Dragging := False;
    CursorWidth := 0;
    CursorHeight := 0;
    XCursorPosition := 0;
    YCursorPosition := 0;
    FPlaceHolderColor := clGreen;
    // Create the image into the form
    FImage := TImageScrollBox.Create( Self);
    FImage.Parent := Self;
    //FImage.Align:=alClient;
    FImage.ZoomMode := zmFitToPage;
    FImage.Visible := True;
    FImage.Cursor := crCross;
    FImage.AntiAliased := True;
    FImage.OnImageMouseDown := ImageMouseDown;
    FImage.OnImageMouseMove := ImageMouseMove;
    FImage.OnImageMouseUp := ImageMouseUp;
    FImage.OnRedraw := RedrawImage;
    OnResize := FormResize;
    FSyncronizeCursor := TSyncronizeCursor.Create( True);
    TSyncronizeCursor( FSyncronizeCursor).FOverviewPanel := Self;
    FSyncronizeCursor.Priority := tpLowest;
end;

{--------------------------------------------------------------------------}

destructor TOverviewPanel.Destroy;
begin
    FSyncronizeCursor.Terminate;
    FSyncronizeCursor.Free;
    inherited Destroy;
end;

{--------------------------------------------------------------------------}

procedure TOverviewPanel.CenterImage;
var
    FX, FY, ScaleFactor: Single;
begin
    if not Assigned( FImage.Graphic) then
        Exit;
    FX := ( FImage.Graphic.Width / ClientWidth);
    FY := ( FImage.Graphic.Height / ClientHeight);
    if FX > FY then
        ScaleFactor := FX
    else
        ScaleFactor := FY;
    if ScaleFactor > 0 then
    begin
        // Repositioning image in window
        FImage.Width := Round( FImage.Graphic.Width / ScaleFactor);
        FImage.Height := Round( FImage.Graphic.Height / ScaleFactor);
        FImage.Left := ( ClientWidth - FImage.Width) div 2;
        FImage.Top := ( ClientHeight - FImage.Height) div 2;
        FImage.Redraw( False);
    end;
end;

{--------------------------------------------------------------------------}

procedure TOverviewPanel.FormResize( Sender: TObject);
begin
    if not Assigned( FOriginalImage) then
        Exit;
    Reset;
end;

{--------------------------------------------------------------------------}

procedure TOverviewPanel.NewRedraw( const Graphic: TDibGraphic);
begin
    if Assigned( FSyncronizeCursor) then
        FSyncronizeCursor.Suspend;
    try
        if Assigned( FOnOldRedraw) then
            FOnOldRedraw( Graphic);
        FImage.Graphic := FOriginalImage.Graphic;
        Reset;
    finally
        if Assigned( FSyncronizeCursor) then
            FSyncronizeCursor.Resume;
    end;
end;

{ TSyncronizeCursor }

procedure TSyncronizeCursor.UpdateCursor;
begin
    FOverviewPanel.UpdateCursor( Self);
end;

{--------------------------------------------------------------------------}

procedure TSyncronizeCursor.Execute;
begin
    { Place thread code here }
    while not Terminated do
    begin
        if Assigned( FOverviewPanel) and ( not FOverviewPanel.Dragging) then
        begin
            if ( FOverviewPanel.GetCursorLeft <> FOverviewPanel.XCursorPosition) or
                ( FOverviewPanel.GetCursorTop <> FOverviewPanel.YCursorPosition) or
                ( FOverviewPanel.GetCursorWidth <> FOverviewPanel.CursorWidth) or
                ( FOverviewPanel.GetCursorHeight <> FOverviewPanel.CursorHeight) then
                Synchronize( UpdateCursor);
        end;
    end;
end;

{--------------------------------------------------------------------------}

procedure TOverviewPanel.RedrawImage( const Graphic: TDibGraphic);
begin
    {ScaleToGray;}
end;

{
procedure TOverviewForm.ScaleToGray;
 Var ScaleToGray:TScaleToGrayTransform;
begin
   ScaleToGray:=TScaleToGrayTransform.Create;
   try
    ScaleToGray.ZoomFactor:=FImage.ZoomPercent;
    ScaleToGray.GrayLevels:=16;
    ScaleToGray.ApplyOnDest(FImage.Graphic,FImage.DisplayedGraphic);
    FImage.Refresh;
   finally
    ScaleToGray.Free;
   end;
end;}

end.
