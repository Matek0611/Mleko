{----------------------------------------------------------------------------
|
| Library: Envision
|
| Module: EnConvolution
|
| Description: Unit contains improved version of TConvolutionTransform class
|
| History: Jan 10, 2004 (C) 2001-2004 Jaroslaw Wiechecki
|
|---------------------------------------------------------------------------}
unit EnConvolution;

interface

uses
    Windows,
    EnMisc,
    EnTransf,
    EnDiGrph;

const

MaxFilterSize = 7;

type


TCoefficientsMatrix = array[0..MaxFilterSize - 1, 0..MaxFilterSize - 1] of smallint;

TFilterSize = ( fs3, fs5, fs7);

TConvolutionTransformEx = class( TImageTransform)
protected
    FDivisor: integer;
    FBias: integer;
    FCoefficients: TCoefficientsMatrix;
    FFilterSize: TFilterSize;
    FFilterName: string;
    function GetCoefficient( ARow, ACol: integer): integer;
    procedure SetCoefficient( ARow, ACol: integer; Value: integer);
public
    constructor Create; virtual;
    procedure Apply( const DibGraphic: TDibGraphic); override;
    procedure ApplyOnDest(
        const Source: TDibGraphic;
        const Dest: TDibGraphic); override;
    property Coefficient[ARow: integer; ACol: integer]: integer read GetCoefficient write SetCoefficient;
    property FilterSize: TFilterSize read FFilterSize write FFilterSize;
    property Divisor: integer read FDivisor write FDivisor;
    property Bias: integer read FBias write FBias;
    property FilterName: string read FFilterName write FFilterName;
end;

TEmbossColorTransform = class( TConvolutionTransformEx)
public
    constructor Create; override;
end;

TEmbossLightTransform = class( TConvolutionTransformEx)
public
    constructor Create; override;
end;

TEmbossMediumTransform = class( TConvolutionTransformEx)
public
    constructor Create; override;
end;

TEmbossDarkTransform = class( TConvolutionTransformEx)
public
    constructor Create; override;
end;

TGlowTransform = class( TConvolutionTransformEx)
public
    constructor Create; override;
end;

TBlurBartlettTransform = class( TConvolutionTransformEx)
public
    constructor Create; override;
end;

TBlurGaussianTransform = class( TConvolutionTransformEx)
public
    constructor Create; override;
end;

TBlurTransform = class( TConvolutionTransformEx)
public
    constructor Create; override;
end;

TBlurSoftlyTransform = class( TConvolutionTransformEx)
public
    constructor Create; override;
end;

TBlurMoreTransform = class( TConvolutionTransformEx)
public
    constructor Create; override;
end;

TEdgeEnhanceTransform = class( TConvolutionTransformEx)
public
    constructor Create; override;
end;

TEdgesStrongTransform = class( TConvolutionTransformEx)
public
    constructor Create; override;
end;

TEdgesWeakTransform = class( TConvolutionTransformEx)
public
    constructor Create; override;
end;

TNormalSharpenTransform = class( TConvolutionTransformEx)
public
    constructor Create; override;
end;

TSharpenMoreTransform = class( TConvolutionTransformEx)
public
    constructor Create; override;
end;

TSharpenLessTransform = class( TConvolutionTransformEx)
public
    constructor Create; override;
end;

TUnSharpMaskTransform = class( TConvolutionTransformEx)
public
    constructor Create; override;
end;

TSharpenDirectionalTransform = class( TConvolutionTransformEx)
public
    constructor Create; override;
end;

TAverageTransform = class( TConvolutionTransformEx)
public
    constructor Create; override;
end;

TPrewittTransform = class( TConvolutionTransformEx)
public
    constructor Create; override;
end;

TTraceContourTransform = class( TConvolutionTransformEx)
public
    constructor Create; override;
end;

TEtchTransform = class( TConvolutionTransformEx)
public
    constructor Create; override;
end;

TLaplacianHVTransform = class( TConvolutionTransformEx)
public
    constructor Create; override;
end;

TLaplacianOmniTransform = class( TConvolutionTransformEx)
public
    constructor Create; override;
end;

TSobelPassTransform = class( TConvolutionTransformEx)
public
    constructor Create; override;
end;

TWaggleTransform = class( TConvolutionTransformEx)
public
    constructor Create; override;
end;

TPatternTransform = class( TConvolutionTransformEx)
public
    constructor Create; override;
end;

TGlowingEdgeTransform = class( TConvolutionTransformEx)
public
    constructor Create; override;
end;

TJitteryTransform = class( TConvolutionTransformEx)
public
    constructor Create; override;
end;

TSandyTransform = class( TConvolutionTransformEx)
public
    constructor Create; override;
end;

TBlurAverageTransform = class( TConvolutionTransformEx)
public
    constructor Create; override;
end;

TManHildreth5x5Transform = class( TConvolutionTransformEx)
public
    constructor Create; override;
end;

TDirectionalMediumTransform = class( TConvolutionTransformEx)
public
    constructor Create; override;
end;

TDirectionalMoreTransform = class( TConvolutionTransformEx)
public
    constructor Create; override;
end;

TSharpenEvenLessTransform = class( TConvolutionTransformEx)
public
    constructor Create; override;
end;

implementation

const
    msgIncorrectFilterSize = 'Incorrect filter size'; { This message should be included
    into EnMsg unit}

function TConvolutionTransformEx.GetCoefficient( ARow, ACol: integer): integer;
begin
    result := FCoefficients[ARow, ACol];
end;

procedure TConvolutionTransformEx.SetCoefficient( ARow, ACol: integer; Value: integer);
begin
    FCoefficients[ARow, ACol] := Value;
end;

constructor TConvolutionTransformEx.Create;
begin
    inherited Create;
    Divisor := 1;
    FFilterName := 'Base filter';
    FillChar( FCoefficients, SizeOf( FCoefficients), 0);
end;

procedure TConvolutionTransformEx.Apply( const DibGraphic: TDibGraphic);
var
    Dest: TDibGraphic;
begin
    Dest := TDibGraphic.Create;
    try
        ApplyOnDest( DibGraphic, Dest);
        DibGraphic.Assign( Dest);
    finally
        Dest.Free;
    end;
end;

procedure TConvolutionTransformEx.ApplyOnDest( const Source: TDibGraphic; const Dest: TDibGraphic);
var
    Width, Height, BorderWidth, r, i, j, x, y: integer;
    ClArr: array[0..MaxFilterSize - 1, 0..MaxFilterSize - 1] of TRgb;
    SourceRgb, DestRgb: TRgb;
    Blue, Green, Red: double;

    procedure CopyBorder( BorderWidth: integer);
    var
        y, x: integer;
    begin
        for y := 0 to Height - 1 do
        begin
            if ( y <= BorderWidth - 1) or ( y >= Height - BorderWidth) then
            begin
                for x := 0 to Width - 1 do
                    Dest.Rgb[x, y] := Source.Rgb[x, y];
            end
            else
            begin
                for x := 0 to BorderWidth - 1 do
                begin
                    Dest.Rgb[x, y] := Source.Rgb[x, y];
                    Dest.Rgb[Width - 1 - x, y] := Source.Rgb[Width - 1 - x, y];
                end;
            end;
        end;
    end;

begin
    Width := Source.Width;
    Height := Source.Height;
    case FilterSize of
        fs3:
            begin
                if ( ( Width < 3) or ( Height < 3)) and ( FilterSize = fs3) then
                begin
                    Dest.Assign( Source);
                    Exit;
                end
                else
                    BorderWidth := 1;
            end;
        fs5:
            begin
                if ( ( Width < 5) or ( Height < 5)) and ( FilterSize = fs5) then
                begin
                    Dest.Assign( Source);
                    Exit;
                end
                else
                    BorderWidth := 2;
            end;
        fs7:
            begin
                if ( ( Width < 7) or ( Height < 7)) and ( FilterSize = fs7) then
                begin
                    Dest.Assign( Source);
                    Exit;
                end
                else
                    BorderWidth := 3;
            end;
    else
        raise EEnvisionError.Create( msgIncorrectFilterSize);
    end;
    Dest.NewImage( Width, Height, ifTrueColor, nil, Source.XDotsPerInch, Source.YDotsPerInch);
    CopyBorder( BorderWidth);
    if FDivisor = 0 then
        FDivisor := 1;
    FLastPercent := -1;
    FLastPercent := DoProgress( Self, FOnProgress, 0, 0, 100, FLastPercent);
    r := MaxFilterSize div 2;
    for y := BorderWidth to Height - BorderWidth - 1 do
    begin
        FLastPercent := DoProgress( Self, FOnProgress, Y, 0, Height - 1, FLastPercent);
        for x := BorderWidth to Width - BorderWidth - 1 do
        begin
            FillChar( ClArr, SizeOf( ClArr), 0);
            for i := -BorderWidth to BorderWidth do
                for j := -BorderWidth to BorderWidth do
                    ClArr[r + i, r + j] := Source.Rgb[x + j, y + i];
            SourceRgb := ClArr[r, r];
            Red := 0;
            Green := 0;
            Blue := 0;
            //We don't use loops due to efficiency (loops are slower)
            Red := Red +
                ClArr[0, 0].Red * FCoefficients[0, 0] +
                ClArr[0, 1].Red * FCoefficients[0, 1] +
                ClArr[0, 2].Red * FCoefficients[0, 2] +
                ClArr[0, 3].Red * FCoefficients[0, 3] +
                ClArr[0, 4].Red * FCoefficients[0, 4] +
                ClArr[0, 5].Red * FCoefficients[0, 5] +
                ClArr[0, 6].Red * FCoefficients[0, 6] +
                ClArr[1, 0].Red * FCoefficients[1, 0] +
                ClArr[1, 1].Red * FCoefficients[1, 1] +
                ClArr[1, 2].Red * FCoefficients[1, 2] +
                ClArr[1, 3].Red * FCoefficients[1, 3] +
                ClArr[1, 4].Red * FCoefficients[1, 4] +
                ClArr[1, 5].Red * FCoefficients[1, 5] +
                ClArr[1, 6].Red * FCoefficients[1, 6] +
                ClArr[2, 0].Red * FCoefficients[2, 0] +
                ClArr[2, 1].Red * FCoefficients[2, 1] +
                ClArr[2, 2].Red * FCoefficients[2, 2] +
                ClArr[2, 3].Red * FCoefficients[2, 3] +
                ClArr[2, 4].Red * FCoefficients[2, 4] +
                ClArr[2, 5].Red * FCoefficients[2, 5] +
                ClArr[2, 6].Red * FCoefficients[2, 6] +
                ClArr[3, 0].Red * FCoefficients[3, 0] +
                ClArr[3, 1].Red * FCoefficients[3, 1] +
                ClArr[3, 2].Red * FCoefficients[3, 2] +
                ClArr[3, 3].Red * FCoefficients[3, 3] +
                ClArr[3, 4].Red * FCoefficients[3, 4] +
                ClArr[3, 5].Red * FCoefficients[3, 5] +
                ClArr[3, 6].Red * FCoefficients[3, 6] +
                ClArr[4, 0].Red * FCoefficients[4, 0] +
                ClArr[4, 1].Red * FCoefficients[4, 1] +
                ClArr[4, 2].Red * FCoefficients[4, 2] +
                ClArr[4, 3].Red * FCoefficients[4, 3] +
                ClArr[4, 4].Red * FCoefficients[4, 4] +
                ClArr[4, 5].Red * FCoefficients[4, 5] +
                ClArr[4, 6].Red * FCoefficients[4, 6] +
                ClArr[5, 0].Red * FCoefficients[5, 0] +
                ClArr[5, 1].Red * FCoefficients[5, 1] +
                ClArr[5, 2].Red * FCoefficients[5, 2] +
                ClArr[5, 3].Red * FCoefficients[5, 3] +
                ClArr[5, 4].Red * FCoefficients[5, 4] +
                ClArr[5, 5].Red * FCoefficients[5, 5] +
                ClArr[5, 6].Red * FCoefficients[5, 6] +
                ClArr[6, 0].Red * FCoefficients[6, 0] +
                ClArr[6, 1].Red * FCoefficients[6, 1] +
                ClArr[6, 2].Red * FCoefficients[6, 2] +
                ClArr[6, 3].Red * FCoefficients[6, 3] +
                ClArr[6, 4].Red * FCoefficients[6, 4] +
                ClArr[6, 5].Red * FCoefficients[6, 5] +
                ClArr[6, 6].Red * FCoefficients[6, 6];
            Green := Green +
                ClArr[0, 0].Green * FCoefficients[0, 0] +
                ClArr[0, 1].Green * FCoefficients[0, 1] +
                ClArr[0, 2].Green * FCoefficients[0, 2] +
                ClArr[0, 3].Green * FCoefficients[0, 3] +
                ClArr[0, 4].Green * FCoefficients[0, 4] +
                ClArr[0, 5].Green * FCoefficients[0, 5] +
                ClArr[0, 6].Green * FCoefficients[1, 6] +
                ClArr[1, 0].Green * FCoefficients[1, 0] +
                ClArr[1, 1].Green * FCoefficients[1, 1] +
                ClArr[1, 2].Green * FCoefficients[1, 2] +
                ClArr[1, 3].Green * FCoefficients[1, 3] +
                ClArr[1, 4].Green * FCoefficients[1, 4] +
                ClArr[1, 5].Green * FCoefficients[1, 5] +
                ClArr[1, 6].Green * FCoefficients[1, 6] +
                ClArr[2, 0].Green * FCoefficients[2, 0] +
                ClArr[2, 1].Green * FCoefficients[2, 1] +
                ClArr[2, 2].Green * FCoefficients[2, 2] +
                ClArr[2, 3].Green * FCoefficients[2, 3] +
                ClArr[2, 4].Green * FCoefficients[2, 4] +
                ClArr[2, 5].Green * FCoefficients[2, 5] +
                ClArr[2, 6].Green * FCoefficients[2, 6] +
                ClArr[3, 0].Green * FCoefficients[3, 0] +
                ClArr[3, 1].Green * FCoefficients[3, 1] +
                ClArr[3, 2].Green * FCoefficients[3, 2] +
                ClArr[3, 3].Green * FCoefficients[3, 3] +
                ClArr[3, 4].Green * FCoefficients[3, 4] +
                ClArr[3, 5].Green * FCoefficients[3, 5] +
                ClArr[3, 6].Green * FCoefficients[3, 6] +
                ClArr[4, 0].Green * FCoefficients[4, 0] +
                ClArr[4, 1].Green * FCoefficients[4, 1] +
                ClArr[4, 2].Green * FCoefficients[4, 2] +
                ClArr[4, 3].Green * FCoefficients[4, 3] +
                ClArr[4, 4].Green * FCoefficients[4, 4] +
                ClArr[4, 5].Green * FCoefficients[4, 5] +
                ClArr[4, 6].Green * FCoefficients[4, 6] +
                ClArr[5, 0].Green * FCoefficients[5, 0] +
                ClArr[5, 1].Green * FCoefficients[5, 1] +
                ClArr[5, 2].Green * FCoefficients[5, 2] +
                ClArr[5, 3].Green * FCoefficients[5, 3] +
                ClArr[5, 4].Green * FCoefficients[5, 4] +
                ClArr[5, 5].Green * FCoefficients[5, 5] +
                ClArr[5, 6].Green * FCoefficients[5, 6] +
                ClArr[6, 0].Green * FCoefficients[6, 0] +
                ClArr[6, 1].Green * FCoefficients[6, 1] +
                ClArr[6, 2].Green * FCoefficients[6, 2] +
                ClArr[6, 3].Green * FCoefficients[6, 3] +
                ClArr[6, 4].Green * FCoefficients[6, 4] +
                ClArr[6, 5].Green * FCoefficients[6, 5] +
                ClArr[6, 6].Green * FCoefficients[6, 6];
            Blue := Blue +
                ClArr[0, 0].Blue * FCoefficients[0, 0] +
                ClArr[0, 1].Blue * FCoefficients[0, 1] +
                ClArr[0, 2].Blue * FCoefficients[0, 2] +
                ClArr[0, 3].Blue * FCoefficients[0, 3] +
                ClArr[0, 4].Blue * FCoefficients[0, 4] +
                ClArr[0, 5].Blue * FCoefficients[0, 5] +
                ClArr[0, 6].Blue * FCoefficients[1, 6] +
                ClArr[1, 0].Blue * FCoefficients[1, 0] +
                ClArr[1, 1].Blue * FCoefficients[1, 1] +
                ClArr[1, 2].Blue * FCoefficients[1, 2] +
                ClArr[1, 3].Blue * FCoefficients[1, 3] +
                ClArr[1, 4].Blue * FCoefficients[1, 4] +
                ClArr[1, 5].Blue * FCoefficients[1, 5] +
                ClArr[1, 6].Blue * FCoefficients[1, 6] +
                ClArr[2, 0].Blue * FCoefficients[2, 0] +
                ClArr[2, 1].Blue * FCoefficients[2, 1] +
                ClArr[2, 2].Blue * FCoefficients[2, 2] +
                ClArr[2, 3].Blue * FCoefficients[2, 3] +
                ClArr[2, 4].Blue * FCoefficients[2, 4] +
                ClArr[2, 5].Blue * FCoefficients[2, 5] +
                ClArr[2, 6].Blue * FCoefficients[2, 6] +
                ClArr[3, 0].Blue * FCoefficients[3, 0] +
                ClArr[3, 1].Blue * FCoefficients[3, 1] +
                ClArr[3, 2].Blue * FCoefficients[3, 2] +
                ClArr[3, 3].Blue * FCoefficients[3, 3] +
                ClArr[3, 4].Blue * FCoefficients[3, 4] +
                ClArr[3, 5].Blue * FCoefficients[3, 5] +
                ClArr[3, 6].Blue * FCoefficients[3, 6] +
                ClArr[4, 0].Blue * FCoefficients[4, 0] +
                ClArr[4, 1].Blue * FCoefficients[4, 1] +
                ClArr[4, 2].Blue * FCoefficients[4, 2] +
                ClArr[4, 3].Blue * FCoefficients[4, 3] +
                ClArr[4, 4].Blue * FCoefficients[4, 4] +
                ClArr[4, 5].Blue * FCoefficients[4, 5] +
                ClArr[4, 6].Blue * FCoefficients[4, 6] +
                ClArr[5, 0].Blue * FCoefficients[5, 0] +
                ClArr[5, 1].Blue * FCoefficients[5, 1] +
                ClArr[5, 2].Blue * FCoefficients[5, 2] +
                ClArr[5, 3].Blue * FCoefficients[5, 3] +
                ClArr[5, 4].Blue * FCoefficients[5, 4] +
                ClArr[5, 5].Blue * FCoefficients[5, 5] +
                ClArr[5, 6].Blue * FCoefficients[5, 6] +
                ClArr[6, 0].Blue * FCoefficients[6, 0] +
                ClArr[6, 1].Blue * FCoefficients[6, 1] +
                ClArr[6, 2].Blue * FCoefficients[6, 2] +
                ClArr[6, 3].Blue * FCoefficients[6, 3] +
                ClArr[6, 4].Blue * FCoefficients[6, 4] +
                ClArr[6, 5].Blue * FCoefficients[6, 5] +
                ClArr[6, 6].Blue * FCoefficients[6, 6];

            Red := Red / Divisor + FBias;
            if Red < 0 then
                DestRgb.Red := 0
            else if Red > 255 then
                DestRgb.Red := 255
            else
                DestRgb.Red := trunc( Red);

            Green := Green / Divisor + FBias;
            if Green < 0 then
                DestRgb.Green := 0
            else if Green > 255 then
                DestRgb.Green := 255
            else
                DestRgb.Green := trunc( Green);

            Blue := Blue / Divisor + FBias;
            if Blue < 0 then
                DestRgb.Blue := 0
            else if Blue > 255 then
                DestRgb.Blue := 255
            else
                DestRgb.Blue := trunc( Blue);

            if Dest.ImageFormat <> ifTrueColor then
            begin
                DestRgb.Red := ( DestRgb.Red div 7) * 7;
                DestRgb.Green := ( DestRgb.Green div 7) * 7;
                DestRgb.Blue := ( DestRgb.Blue div 7) * 7;
                DestRgb.Filler := ( DestRgb.Filler div 7) * 7;
            end;
            Dest.Rgb[X, Y] := DestRgb;
        end;
    end;
    FLastPercent := DoProgress( Self, FOnProgress, 100, 0, 100, FLastPercent);
end;

constructor TEmbossColorTransform.Create;
const
    Matrix: TCoefficientsMatrix =
    ( ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, -1, -1, -1, 0, 0),
        ( 0, 0, 0, 1, 0, 0, 0),
        ( 0, 0, 1, 1, 1, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0));

begin
    inherited Create;
    FCoefficients := Matrix;
    FFilterSize := fs3;
    FDivisor := 1;
    FBias := 0;
    FFilterName := 'Emboss Color';
end;

constructor TEmbossLightTransform.Create;
const
    Matrix: TCoefficientsMatrix =
    ( ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, -1, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 1, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0));
begin
    inherited Create;
    FCoefficients := Matrix;
    FFilterSize := fs3;
    FDivisor := 1;
    FBias := 192;
    FFilterName := 'Emboss Light';
end;

constructor TEmbossMediumTransform.Create;
const
    Matrix: TCoefficientsMatrix =
    ( ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, -1, -2, -1, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 1, 2, 1, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0));

begin
    inherited Create;
    FCoefficients := Matrix;
    FFilterSize := fs3;
    FDivisor := 1;
    FBias := 192;
    FFilterName := 'Emboss Medium';
end;

constructor TEmbossDarkTransform.Create;
const
    Matrix: TCoefficientsMatrix =
    ( ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, -1, -2, -1, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 1, 2, 1, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0));

begin
    inherited Create;
    FCoefficients := Matrix;
    FFilterSize := fs3;
    FDivisor := 1;
    FBias := 128;
    FFilterName := 'Emboss Dark';
end;

constructor TGlowTransform.Create;
const
    Matrix: TCoefficientsMatrix =
    ( ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 1, 2, 2, 2, 1, 0),
        ( 0, 2, 0, 0, 0, 2, 0),
        ( 0, 2, 0, -20, 0, 2, 0),
        ( 0, 2, 0, 0, 0, 2, 0),
        ( 0, 1, 2, 2, 2, 1, 0),
        ( 0, 0, 0, 0, 0, 0, 0));

begin
    inherited Create;
    FCoefficients := Matrix;
    FFilterSize := fs7;
    FDivisor := 8;
    FBias := 0;
    FFilterName := 'Glow';
end;

constructor TBlurBartlettTransform.Create;
const
    Matrix: TCoefficientsMatrix =
    ( ( 1, 2, 3, 4, 3, 2, 1),
        ( 2, 4, 6, 8, 6, 4, 2),
        ( 3, 6, 9, 12, 9, 6, 3),
        ( 4, 8, 12, 16, 12, 8, 4),
        ( 3, 6, 9, 12, 9, 6, 3),
        ( 2, 4, 6, 8, 6, 4, 2),
        ( 1, 2, 3, 4, 3, 2, 1));

begin
    inherited Create;
    FCoefficients := Matrix;
    FFilterSize := fs7;
    FDivisor := 256;
    FBias := 0;
    FFilterName := 'Blur Bartlett';
end;

constructor TBlurGaussianTransform.Create;
const
    Matrix: TCoefficientsMatrix =
    ( ( 1, 4, 8, 10, 8, 4, 1),
        ( 4, 12, 25, 29, 25, 12, 4),
        ( 8, 25, 49, 58, 49, 25, 8),
        ( 10, 29, 58, 67, 58, 29, 10),
        ( 8, 25, 49, 58, 49, 25, 8),
        ( 4, 12, 25, 29, 25, 12, 4),
        ( 1, 4, 8, 10, 8, 4, 1));

begin
    inherited Create;
    FCoefficients := Matrix;
    FFilterSize := fs7;
    FDivisor := 999;
    FBias := 0;
    FFilterName := 'Blur Gaussian';
end;

constructor TBlurTransform.Create;
const
    Matrix: TCoefficientsMatrix =
    ( ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 1, 2, 1, 0, 0),
        ( 0, 0, 2, 4, 2, 0, 0),
        ( 0, 0, 1, 2, 1, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0));

begin
    inherited Create;
    FCoefficients := Matrix;
    FFilterSize := fs3;
    FDivisor := 16;
    FBias := 0;
    FFilterName := 'Blur Standard';
end;

constructor TBlurSoftlyTransform.Create;
const
    Matrix: TCoefficientsMatrix =
    ( ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 1, 3, 1, 0, 0),
        ( 0, 0, 3, 16, 3, 0, 0),
        ( 0, 0, 1, 3, 1, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0));

begin
    inherited Create;
    FCoefficients := Matrix;
    FFilterSize := fs3;
    FDivisor := 32;
    FBias := 0;
    FFilterName := 'Blur Softly';
end;

constructor TBlurMoreTransform.Create;
const
    Matrix: TCoefficientsMatrix =
    ( ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 1, 2, 1, 0, 0),
        ( 0, 1, 4, 6, 4, 1, 0),
        ( 0, 2, 6, 8, 6, 2, 0),
        ( 0, 1, 4, 6, 4, 1, 0),
        ( 0, 0, 1, 2, 1, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0));

begin
    inherited Create;
    FCoefficients := Matrix;
    FFilterSize := fs5;
    FDivisor := 64;
    FBias := 0;
    FFilterName := 'Blur More';
end;

constructor TEdgeEnhanceTransform.Create;
const
    Matrix: TCoefficientsMatrix =
    ( ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, -1, -2, -1, 0, 0),
        ( 0, 0, -2, 16, -2, 0, 0),
        ( 0, 0, -1, -2, -1, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0));

begin
    inherited Create;
    FCoefficients := Matrix;
    FFilterSize := fs3;
    FDivisor := 4;
    FBias := 0;
    FFilterName := 'Edge Enhance';
end;

constructor TEdgesStrongTransform.Create;
const
    Matrix: TCoefficientsMatrix =
    ( ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 1, 3, 1, 0, 0),
        ( 0, 0, 3, -16, 3, 0, 0),
        ( 0, 0, 1, 3, 1, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0));

begin
    inherited Create;
    FCoefficients := Matrix;
    FFilterSize := fs3;
    FDivisor := 1;
    FBias := 0;
    FFilterName := 'Edges Strong';
end;

constructor TEdgesWeakTransform.Create;
const
    Matrix: TCoefficientsMatrix =
    ( ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 1, 0, 0, 0),
        ( 0, 0, 1, -4, 1, 0, 0),
        ( 0, 0, 0, 1, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0));

begin
    inherited Create;
    FCoefficients := Matrix;
    FFilterSize := fs3;
    FDivisor := 1;
    FBias := 0;
    FFilterName := 'Edges Weak';
end;

constructor TNormalSharpenTransform.Create;
const
    Matrix: TCoefficientsMatrix =
    ( ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, -1, -1, -1, 0, 0),
        ( 0, 0, -1, 16, -1, 0, 0),
        ( 0, 0, -1, -1, -1, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0));

begin
    inherited Create;
    FCoefficients := Matrix;
    FFilterSize := fs3;
    FDivisor := 8;
    FBias := 0;
    FFilterName := 'Sharpen Standard';
end;

constructor TSharpenMoreTransform.Create;
const
    Matrix: TCoefficientsMatrix =
    ( ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, -1, -1, -1, 0, 0),
        ( 0, 0, -1, 12, -1, 0, 0),
        ( 0, 0, -1, -1, -1, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0));

begin
    inherited Create;
    FCoefficients := Matrix;
    FFilterSize := fs3;
    FDivisor := 4;
    FBias := 0;
    FFilterName := 'Sharepen More';
end;

constructor TSharpenLessTransform.Create;
const
    Matrix: TCoefficientsMatrix =
    ( ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, -1, -1, -1, 0, 0),
        ( 0, 0, -1, 24, -1, 0, 0),
        ( 0, 0, -1, -1, -1, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0));

begin
    inherited Create;
    FCoefficients := Matrix;
    FFilterSize := fs3;
    FDivisor := 16;
    FBias := 0;
    FFilterName := 'Sharpen Less';
end;

constructor TUnSharpMaskTransform.Create;
const
    Matrix: TCoefficientsMatrix =
    ( ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, -1, -2, -1, 0, 0),
        ( 0, 0, -2, 16, -2, 0, 0),
        ( 0, 0, -1, -2, -1, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0));

begin
    inherited Create;
    FCoefficients := Matrix;
    FFilterSize := fs3;
    FDivisor := 4;
    FBias := 0;
    FFilterName := 'UnSharp Mask';
end;

constructor TSharpenDirectionalTransform.Create;
const
    Matrix: TCoefficientsMatrix =
    ( ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, -3, -3, -3, 0, 0),
        ( 0, 0, 0, 16, 0, 0, 0),
        ( 0, 0, 1, 1, 1, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0));

begin
    inherited Create;
    FCoefficients := Matrix;
    FFilterSize := fs3;
    FDivisor := 10;
    FBias := 0;
    FFilterName := 'Directional Sharpen';
end;

constructor TAverageTransform.Create;
const
    Matrix: TCoefficientsMatrix =
    ( ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 1, 1, 1, 0, 0),
        ( 0, 0, 1, 1, 1, 0, 0),
        ( 0, 0, 1, 1, 1, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0));

begin
    inherited Create;
    FCoefficients := Matrix;
    FFilterSize := fs3;
    FDivisor := 9;
    FBias := 0;
    FFilterName := 'Averrage';
end;

constructor TPrewittTransform.Create;
const
    Matrix: TCoefficientsMatrix =
    ( ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 1, 1, 1, 0, 0),
        ( 0, 0, 1, -2, 1, 0, 0),
        ( 0, 0, -1, -1, -1, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0));

begin
    inherited Create;
    FCoefficients := Matrix;
    FFilterSize := fs3;
    FDivisor := 1;
    FBias := 0;
    FFilterName := 'Prewitt';
end;

constructor TTraceContourTransform.Create;
const
    Matrix: TCoefficientsMatrix =
    ( ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, -6, -2, -6, 0, 0),
        ( 0, 0, -1, 32, -1, 0, 0),
        ( 0, 0, -6, -2, -6, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0));

begin
    inherited Create;
    FCoefficients := Matrix;
    FFilterSize := fs3;
    FDivisor := 1;
    FBias := 240;
    FFilterName := 'TRace Contour';
end;

constructor TEtchTransform.Create;
const
    Matrix: TCoefficientsMatrix =
    ( ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, -6, -2, -6, 0, 0),
        ( 0, 0, -1, 32, -1, 0, 0),
        ( 0, 0, -6, -2, -6, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0));

begin
    inherited Create;
    FCoefficients := Matrix;
    FFilterSize := fs3;
    FDivisor := 1;
    FBias := 240;
    FFilterName := 'Etch';
end;

constructor TLaplacianHVTransform.Create;
const
    Matrix: TCoefficientsMatrix =
    ( ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, -1, 0, 0, 0),
        ( 0, 0, -1, 4, -1, 0, 0),
        ( 0, 0, 0, -1, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0));

begin
    inherited Create;
    FCoefficients := Matrix;
    FFilterSize := fs3;
    FDivisor := 1;
    FBias := 0;
    FFilterName := 'Laplacian Horiontal/Vertical';
end;

constructor TLaplacianOmniTransform.Create;
const
    Matrix: TCoefficientsMatrix =
    ( ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, -1, -1, -1, 0, 0),
        ( 0, 0, -1, 8, -1, 0, 0),
        ( 0, 0, -1, -1, -1, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0));

begin
    inherited Create;
    FCoefficients := Matrix;
    FFilterSize := fs3;
    FDivisor := 1;
    FBias := 0;
    FFilterName := 'Laplacian Omni';
end;

constructor TSobelPassTransform.Create;
const
    Matrix: TCoefficientsMatrix =
    ( ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 1, 2, 1, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, -1, -2, -1, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0));

begin
    inherited Create;
    FCoefficients := Matrix;
    FFilterSize := fs3;
    FDivisor := 1;
    FBias := 0;
    FFilterName := 'Sobel Pass';
end;

constructor TWaggleTransform.Create;
const
    Matrix: TCoefficientsMatrix =
    ( ( 0, 1, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 1),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 1, 0, 0, 0, 0));

begin
    inherited Create;
    FCoefficients := Matrix;
    FFilterSize := fs7;
    FDivisor := 3;
    FBias := 0;
    FFilterName := 'Waggle';
end;

constructor TPatternTransform.Create;
const
    Matrix: TCoefficientsMatrix =
    ( ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, -4, -9, -4, 0, 0),
        ( 0, -4, -24, -1, -24, -4, 0),
        ( 0, -9, -1, 168, -1, -9, 0),
        ( 0, -4, -24, -1, -24, -4, 0),
        ( 0, 0, -4, -9, -4, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0));

begin
    inherited Create;
    FCoefficients := Matrix;
    FFilterSize := fs5;
    FDivisor := 1;
    FBias := 0;
    FFilterName := 'Pattern';
end;

constructor TGlowingEdgeTransform.Create;
const
    Matrix: TCoefficientsMatrix =
    ( ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 1, 2, 2, 2, 1, 0),
        ( 0, 2, 0, 0, 0, 2, 0),
        ( 0, 2, 0, -20, 0, 2, 0),
        ( 0, 2, 0, 0, 0, 2, 0),
        ( 0, 1, 2, 2, 2, 1, 0),
        ( 0, 0, 0, 0, 0, 0, 0));

begin
    inherited Create;
    FCoefficients := Matrix;
    FFilterSize := fs7;
    FDivisor := 8;
    FBias := 0;
    FFilterName := 'Glowing Edge';
end;

constructor TJitteryTransform.Create;
const
    Matrix: TCoefficientsMatrix =
    ( ( 0, 1, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 1),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 1, 0, 0, 0, 0));

begin
    inherited Create;
    FCoefficients := Matrix;
    FFilterSize := fs7;
    FDivisor := 3;
    FBias := 0;
    FFilterName := 'Jittery';
end;

constructor TSandyTransform.Create;
const
    Matrix: TCoefficientsMatrix =
    ( ( 0, -1, -1, -1, -1, -1, 0),
        ( 0, 0, -3, -3, -3, 0, 0),
        ( 0, 0, 0, -7, 0, 0, 0),
        ( 0, 0, 0, 50, 0, 0, 0),
        ( 0, 0, 0, -7, 0, 0, 0),
        ( 0, 0, -3, -3, -3, 0, 0),
        ( 0, -1, -1, -1, -1, -1, 0));

begin
    inherited Create;
    FCoefficients := Matrix;
    FFilterSize := fs7;
    FDivisor := 8;
    FBias := 0;
    FFilterName := 'Sandy';
end;

constructor TBlurAverageTransform.Create;
const
    Matrix: TCoefficientsMatrix =
    ( ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 1, 1, 1, 0, 0),
        ( 0, 0, 1, 1, 1, 0, 0),
        ( 0, 0, 1, 1, 1, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0));

begin
    inherited Create;
    FCoefficients := Matrix;
    FFilterSize := fs3;
    FDivisor := 9;
    FBias := 0;
    FFilterName := 'Blur Averrage';
end;

constructor TManHildreth5x5Transform.Create;
const
    Matrix: TCoefficientsMatrix =
    ( ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, -4, -9, -4, 0, 0),
        ( 0, -4, -24, -1, -24, -4, 0),
        ( 0, -9, -1, 168, -1, -9, 0),
        ( 0, -4, -24, -1, -24, -4, 0),
        ( 0, 0, -4, -9, -4, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0));
begin
    inherited Create;
    FCoefficients := Matrix;
    FFilterSize := fs5;
    FDivisor := 1;
    FBias := 0;
    FFilterName := 'ManHildreth 5x5';
end;

constructor TDirectionalMediumTransform.Create;
const
    Matrix: TCoefficientsMatrix =
    ( ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, -1, -2, 0, 0, 0),
        ( 0, -1, -2, -3, -1, 0, 0),
        ( 0, 0, 0, 16, 0, 0, 0),
        ( 0, 1, 2, 3, 1, 0, 0),
        ( 0, 0, 1, 2, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0));
begin
    inherited Create;
    FCoefficients := Matrix;
    FFilterSize := fs5;
    FDivisor := 16;
    FBias := 0;
    FFilterName := 'Directional Medium';
end;

constructor TDirectionalMoreTransform.Create;
const
    Matrix: TCoefficientsMatrix =
    ( ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, -1, -2, -1, 0, 0),
        ( 0, -1, -2, -3, -2, -1, 0),
        ( 0, 0, 0, 12, 0, 0, 0),
        ( 0, 1, 1, 2, 1, 1, 0),
        ( 0, 0, 0, 1, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0));
begin
    inherited Create;
    FCoefficients := Matrix;
    FFilterSize := fs5;
    FDivisor := 6;
    FBias := 0;
    FFilterName := 'Directional More';
end;


constructor TSharpenEvenLessTransform.Create;
const
    Matrix: TCoefficientsMatrix =
    ( ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, -1, -1, -1, 0, 0),
        ( 0, 0, -1, 32, -1, 0, 0),
        ( 0, 0, -1, -1, -1, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0),
        ( 0, 0, 0, 0, 0, 0, 0));
begin
    inherited Create;
    FCoefficients := Matrix;
    FFilterSize := fs3;
    FDivisor := 24;
    FBias := 0;
    FFilterName := 'Sharpen Even Less';
end;
end.
