{----------------------------------------------------------------------------
|
| Library: Envision
|
| Module: BlowUpPanel
|
| Description: TBlowupPanel
|
| History: May 22, 2002. Francesco Pucino, first version
|
|---------------------------------------------------------------------------}

unit EnBlowUpPanel;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, EnImgScr, EnTransf, EnDiGrph, ExtCtrls;

type

TBlowupPanel = class( TPanel)
private
    { Private declarations }
    FImage,
    FSource: TImageScrollBox;
    FZoom: Double;
    FSyncronizeCursor: TThread;
    FOldPos: TPoint;
    FCropped: TDibGraphic;
    FCross: Boolean;
    FUpdating: Boolean;
    procedure SetSource( Value: TImageScrollBox);
    procedure SetZoom( Value: Double);
    function GetMousePos: TPoint;
    procedure FormResize( Sender: TObject);
protected
    { Protected declarations }
public
    { Public declarations }
    constructor Create( AOwner: TComponent); override;
    destructor Destroy; override;
    procedure UpdateDisplay;
    function NeedToUpdate: Boolean;
published
    { Published declarations }
    property Source: TImageScrollBox read FSource write SetSource;
    property Zoom: Double read FZoom write SetZoom;
    property Cross: Boolean read FCross write FCross;
end;

{--------------------------------------------------------------------------}

implementation

type

TSyncronizeCursor = class( TThread)
private
    { Private declarations }
    FBlowUpForm: TBlowUpPanel;
    procedure UpdateDisplay;
protected
    procedure Execute; override;
end;

{--------------------------------------------------------------------------}

constructor TBlowupPanel.Create( AOwner: TComponent);
begin
    inherited Create( AOwner);

    BevelOuter := bvNone;
    Caption := ''; { MB Jan 29, 2003 Empty caption by default }
    FCross := False; { MB Jan 29, 2003 Change default to False }
    OnResize := FormResize;

    FCropped := TDibGraphic.Create;

    FImage := TImageScrollBox.Create( Self); //FForm
    FImage.Parent := Self; //FForm
    FImage.Align := alClient;
    FImage.ZoomMode := zmPercent;
    FImage.ZoomPercent := 100;
    FImage.Graphic := FCropped;
    FImage.Visible := True;

    FSyncronizeCursor := TSyncronizeCursor.Create( True);
    TSyncronizeCursor( FSyncronizeCursor).FBlowUpForm := Self;
    FSyncronizeCursor.Priority := tpLowest;

    FZoom := 2;
    FUpdating := False;
end;

{--------------------------------------------------------------------------}

destructor TBlowupPanel.Destroy;
begin
    FSyncronizeCursor.Terminate;
    FSyncronizeCursor.Free;
    FCropped.Free; { MB Jan 20, 2003 }
    inherited Destroy;
end;

{--------------------------------------------------------------------------}

procedure TBlowupPanel.SetSource( Value: TImageScrollBox);
begin
    FSource := Value;
    if FSource = nil then
        FSyncronizeCursor.Suspend
    else
        FSyncronizeCursor.Resume;
    UpdateDisplay;
end;

{--------------------------------------------------------------------------}

procedure TBlowupPanel.SetZoom( Value: Double);
begin
    FZoom := Value;
    UpdateDisplay;
end;

{--------------------------------------------------------------------------}

function TBlowupPanel.GetMousePos: TPoint;
var
    Posizione: TPoint;
    SourceZoom: Double;
    PosizioneScreen: TPoint;
begin
    // Find the mouse pos
    PosizioneScreen := Mouse.CursorPos;
    // Calculate the mouse pos in SourceWindow
    if Assigned( FSource.Parent) then
        Posizione := FSource.Parent.ScreenToClient( PosizioneScreen)
    else
        Posizione := Point( -1, -1);
    // Check if the source Pos is valid
    if PtInRect( FSource.BoundsRect, Posizione) and ( Assigned( FSource.DisplayedGraphic.Canvas)) and ( FindVCLWindow( Mouse.CursorPos) = FSource) then
    begin
        // Calculate the point in the original image
        Posizione := FSource.ScreenToClient( PosizioneScreen);
        SourceZoom := ( FSource.Graphic.Width / FSource.DisplayedGraphic.Width);
        Posizione.x := Round( ( Posizione.x + FSource.HorzScrollBar.Position) * SourceZoom);
        Posizione.y := Round( ( Posizione.y + FSource.VertScrollBar.Position) * SourceZoom);
        Result := Posizione;
    end
    else
    begin
        Result := Point( -1, -1);
    end;
end;

{--------------------------------------------------------------------------}

procedure TBlowupPanel.UpdateDisplay;
var
    W, H: Integer;
    SourceRect: TRect;
    Crop: TCropTransform;
    Resize: TResizeTransform;
begin
    { MB Nov 7, check Self.Parent }
    if ( not Assigned( FSource)) or not Visible or (Self.Parent = nil) then
        Exit;
    if FUpdating then
        Exit;
    FUpdating := True;
    try
        FOldPos := GetMousePos;
        if ( FOldPos.x > -1) then
        begin
            // Calculate the size of the rect to display;
            W := Round( FImage.ClientWidth / FZoom); //FForm
            H := Round( FImage.ClientHeight / FZoom);
            // Calculate the coord of the rect
            SourceRect := Rect( FOldPos.x - ( W div 2), FOldPos.y - ( H div 2), FOldPos.x + ( W div 2), FOldPos.y + ( H div 2));
            // Verify the rect is in the image
            if SourceRect.Left < 0 then
            begin
                OffsetRect( SourceRect, -SourceRect.Left, 0);
            end;
            if SourceRect.Top < 0 then
            begin
                OffsetRect( SourceRect, 0, -SourceRect.Top);
            end;
            if SourceRect.Right >= FSource.Graphic.Width then
            begin
                OffsetRect( SourceRect, ( FSource.Graphic.Width - 1) - SourceRect.Right, 0);
            end;
            if SourceRect.Bottom >= FSource.Graphic.Height then
            begin
                OffsetRect( SourceRect, 0, ( FSource.Graphic.Height - 1) - SourceRect.Bottom);
            end;

            SourceRect.Right := FSource.Graphic.Width - SourceRect.Right;
            SourceRect.Bottom := FSource.Graphic.Height - SourceRect.Bottom;

            // Crop the rect from the source image
            Crop := TCropTransform.Create;
            try
                Crop.Left := SourceRect.Left;
                Crop.Top := SourceRect.Top;
                Crop.Right := SourceRect.Right;
                Crop.Bottom := SourceRect.Bottom;
                Crop.ApplyOnDest( FSource.Graphic, FCropped);
            finally
                Crop.Free;
            end;
            Resize := TResizeTransform.Create;
            try
                Resize.Width := FImage.ClientWidth;
                Resize.Height := FImage.ClientHeight;
                Resize.Apply( FCropped);
            finally
                Resize.Free;
            end;
            if FCross then
            begin
                FCropped.Canvas.MoveTo( 0, FCropped.Height div 2);
                FCropped.Canvas.LineTo( FCropped.Width, FCropped.Height div 2);
                FCropped.Canvas.MoveTo( FCropped.Width div 2, 0);
                FCropped.Canvas.LineTo( FCropped.Width div 2, FCropped.Height);
            end;
            FImage.Visible := True;
            FImage.Graphic := FCropped;
            FImage.Redraw( True);
        end
        else
        begin
            FImage.Visible := False;
        end;
    finally
        FUpdating := False;
    end;
end;

{--------------------------------------------------------------------------}

function SamePoint( P1, P2: TPoint): Boolean;
begin
    Result := ( p1.x = p2.x) and ( p1.y = p2.y);
end;

{--------------------------------------------------------------------------}

function TBlowupPanel.NeedToUpdate: Boolean;
begin
    Result := Assigned( FSource) and ( not SamePoint( FOldPos, GetMousePos));
end;

{--------------------------------------------------------------------------}

procedure TBlowupPanel.FormResize( Sender: TObject);
begin
    UpdateDisplay;
end;

{--------------------------------------------------------------------------}

{ TSyncronizeCursor }

procedure TSyncronizeCursor.UpdateDisplay;
begin
    FBlowUpForm.UpdateDisplay;
end;

{--------------------------------------------------------------------------}

procedure TSyncronizeCursor.Execute;
begin
    { Place thread code here }
    while not Terminated do
    begin
        if Assigned( FBlowUpForm) then
        begin
            if FBlowUpForm.NeedToUpdate then
                Synchronize( UpdateDisplay);
        end;
    end;
end;

{--------------------------------------------------------------------------}

end.
