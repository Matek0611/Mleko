{----------------------------------------------------------------------------
|
| Module: NBLib.Pas
|
| Description: Wrapper unit for Nick Boland's add-on library to Envision
|
| History: May 22, 2002. Michel Brazeau, first version
|
|---------------------------------------------------------------------------}

unit NBLib;

interface

uses
    Windows,  { for TRect }
    EnDiGrph, { for TDibGraphic }
    EnTransf; { for TRotateTransform }

type

{ The TNBRotateTransform provides very fast rotation of black and white images }
TNBRotateTransform = class( TRotateTransform )
protected
    procedure Rotate90( const Source : TDibGraphic;
                        const Dest   : TDibGraphic ); override;

    procedure Rotate180( const Source : TDibGraphic;
                         const Dest   : TDibGraphic ); override;

    procedure Rotate270( const Source : TDibGraphic;
                         const Dest   : TDibGraphic ); override;

    procedure RotateArbitrary( const Source : TDibGraphic;
                               const Dest   : TDibGraphic ); override;

end;

{ Transform the find the skew angle and correct it. For black and white
  images only. If the image is not black and white, it is unchanged.  }
TNBDeskewTransform = class( TRotateTransform )

    procedure Apply( const DibGraphic : TDibGraphic ); override;

    procedure ApplyOnDest( const Source : TDibGraphic;
                           const Dest   : TDibGraphic ); override;
end;

{ The TNBCropTransform provides very fast crop of black and white images }
TNBCropTransform = class(TCropTransform)

    procedure ApplyOnDest( const Source : TDibGraphic;
                           const Dest   : TDibGraphic ); override;
end;

{ Transform the find the skew angle and correct it. For black and white
  images only. If the image is not black and white, it is unchanged.  }
TNBCleanupBorderTransform = class( TRotateTransform )
protected
    FMarginInches : Double;

    FFillColor    : TRgb;

public
    constructor Create;

    { The MarginInches indicates the limits of the margins where the
      transform will try to remove borders }
    property MarginInches : Double read FMarginInches
                                   write FMarginInches;

    { border pixels will be replaced by FillColor }
    property FillColor : TRgb read FFillColor
                              write FFillColor;

    procedure Apply( const DibGraphic : TDibGraphic ); override;

    procedure ApplyOnDest( const Source : TDibGraphic;
                           const Dest   : TDibGraphic ); override;
end;

{ Read a bar code within Rect on Graphic. Returns '' if unable to read and
  decode the bar code }
function ReadBarCode( const Graphic   : TDibGraphic;
                      const Rect      : TRect ) : AnsiString;

{ Perform optical character recognition on a region. Only a single line is
  decoded. }
function OCRRegion( const Graphic   : TDibGraphic;
                    const Rect      : TRect ) : AnsiString;

{--------------------------------------------------------------------------}

implementation

uses
    Classes,   { for TResourceStream }
    Dialogs,   { for ShowMessage }
    SysUtils,  { for StrLCopy }
    EnMisc,    { for ifBlackWhite }
    EnBarCode, { for EnReadBarcodeBW }
    EnOcr,
    EnProLib;

{$R NbLib.Res}

const

COCRDataResourceName = 'ENOCRDATA';

{--------------------------------------------------------------------------}

procedure TNBRotateTransform.Rotate90(
                     const Source : TDibGraphic;
                     const Dest   : TDibGraphic );
begin
    if Source.ImageFormat = ifBlackWhite then
        EnRotateBW90(Source, Dest)
    else
        inherited Rotate90(Source, Dest);
end;

{--------------------------------------------------------------------------}

procedure TNBRotateTransform.Rotate180(
                     const Source : TDibGraphic;
                     const Dest   : TDibGraphic );
begin
    if Source.ImageFormat = ifBlackWhite then
        EnRotateBW180(Source, Dest)
    else
        inherited Rotate180(Source, Dest);
end;

{--------------------------------------------------------------------------}

procedure TNBRotateTransform.Rotate270(
                     const Source : TDibGraphic;
                     const Dest   : TDibGraphic );
begin
    if Source.ImageFormat = ifBlackWhite then
        EnRotateBW270(Source, Dest)
    else
        inherited Rotate270(Source, Dest);
end;

{--------------------------------------------------------------------------}

procedure TNBRotateTransform.RotateArbitrary(
                               const Source : TDibGraphic;
                               const Dest   : TDibGraphic );
const
    CMaxAngle = 45;
begin
    if (Source.ImageFormat = ifBlackWhite) and (Angle > -1*CMaxAngle) and (Angle < CMaxAngle) then
        EnDeskewBW( Source, Dest, True, BackgroundColor, CMaxAngle, Angle )
    else
        inherited RotateArbitrary(Source, Dest);
end;

{--------------------------------------------------------------------------}

procedure TNBDeskewTransform.Apply( const DibGraphic : TDibGraphic ); 
begin
    { don't do anything if the image is not black and white }
    if DibGraphic.ImageFormat = ifBlackWhite then
        inherited Apply(DibGraphic);
end;

{--------------------------------------------------------------------------}

procedure TNBDeskewTransform.ApplyOnDest(
                      const Source : TDibGraphic;
                      const Dest   : TDibGraphic );
begin
    if Source.ImageFormat = ifBlackWhite then
        EnDeskewBW( Source, Dest, False, 15 )
    else
        Dest.Assign(Source);
end;

{--------------------------------------------------------------------------}

procedure TNBCropTransform.ApplyOnDest( const Source : TDibGraphic;
                                        const Dest   : TDibGraphic );
var
    Rect : TRect;
begin
    if Source.ImageFormat = ifBlackWhite then
    begin
        if CropMode = cmExtractRect then
        begin
            Rect.Top    := Self.Top;
            Rect.Left   := Self.Left;
            Rect.Bottom := Self.Bottom;
            Rect.Right  := Self.Right;
        end
        else
        begin
            Rect.Top    := Self.Top;
            Rect.Bottom := Source.Height - Self.Bottom;
            Rect.Left   := Self.Left;
            Rect.Right  := Source.Width - Self.Right;
        end;

        EnCropBW( Source, Rect, Dest );
    end
    else
        inherited ApplyOnDest(Source, Dest);
end;

{--------------------------------------------------------------------------}

constructor TNBCleanupBorderTransform.Create;
begin
    inherited Create;

    FFillColor    := MakeRGB(255, 255, 255);

    FMarginInches := 1;
end;

{--------------------------------------------------------------------------}

procedure TNBCleanupBorderTransform.Apply( const DibGraphic : TDibGraphic );
begin
    { don't do anything if the image is not black and white }
    if DibGraphic.ImageFormat = ifBlackWhite then
        EnBorderCleanup( DibGraphic, MarginInches, FillColor );
end;

{--------------------------------------------------------------------------}

procedure TNBCleanupBorderTransform.ApplyOnDest(
                      const Source : TDibGraphic;
                      const Dest   : TDibGraphic );
begin
    Dest.Assign(Source);

    Apply(Dest);
end;

{--------------------------------------------------------------------------}

function ReadBarCode( const Graphic   : TDibGraphic;
                      const Rect      : TRect ) : AnsiString;
var
  StrResults : TBarcodeStringResult;

begin
    Result := '';

    if Graphic.ImageFormat <> ifBlackWhite then
        Exit;

    if EnReadBarcodeBW( Graphic, Rect, '', itbUnknown, StrResults ) then
        Result := StrResults.BarcodeString;
end;

{--------------------------------------------------------------------------}

function OCRRegion( const Graphic   : TDibGraphic;
                    const Rect      : TRect ) : AnsiString;
var
    Stream        : TResourceStream;
    Lines         : TStringList;
    LineNo        : Integer;
    Line          : AnsiString;
    Index         : Integer;
    J             : Integer;

    Params        : AnsiString;
    ConfThreshold : Double;
    TypeOCR       : TImageTypeOCR;
    StrResults    : array [ 0 .. 9 ] of TOCRStringResult;
    CharSet       : TOCRCharSet;

begin
    Result := '';

    if Graphic.ImageFormat <> ifBlackWhite then
        Exit;

    Stream := TResourceStream.Create(HInstance, COcrDataResourceName, RT_RCDATA);
    Lines  := TStringList.Create;
    try
        Lines.LoadFromStream(Stream);

        { Allocate attribute array }
        SetLength( EnOcr.AttrArray, Lines.Count );

        Index := 0;
        for LineNo := 0 to (Lines.Count-1) do
        begin
            Line := AnsiString(Lines[LineNo]);
            if Length( Line) < 140 then
                Exit;

            AttrArray[Index].Letter := Line[1];
            if Line[2] <> ',' then
                Exit;

            Line := Copy( Line, 3, Length( Line ) );
            StrLCopy( @AttrArray[Index].FontID[0], PChar(@EnStrGetNextToken( Line, ',' )[1]), FONTID_MAXLEN );
            AttrArray[Index].TopGray := StrToInt( EnStrGetNextToken( Line, ',' ) );
            AttrArray[Index].BotGray := StrToInt( EnStrGetNextToken( Line, ',' ) );
            AttrArray[Index].WHRatio := StrToInt( EnStrGetNextToken( Line, ',' ) );
            AttrArray[Index].Disjoint := StrToInt( EnStrGetNextToken( Line, ',' ) );

            for J := 0 to 62 do
                AttrArray[Index].GridGray[J] := StrToInt( EnStrGetNextToken( Line, ',' ) );

            Inc( Index );
        end;

        ConfThreshold := 90;
        TypeOCR       := itoAlphaNumeric;
        CharSet       := EnOCRCharSet( typeOCR );

        CharSet       := CharSet + [ '~', '!', '@', '#', '$', '%', '^', '&', '*', '(', ')' ];
        CharSet       := CharSet + [ '-', '+', '=', '{', '}', '[', ']', '\', '|', ';', ':' ];
        CharSet       := CharSet + [ '''', '"', ',' ,'.', '<', '>', '/', '?', '$' ];

        Params        := AnsiString(Format( 'CONF=%f', [ ConfThreshold ] ));

        if EnOCRLineBW( Graphic, Rect, Params, TypeOCR, CharSet, '', StrResults ) then
            Result := strResults[0].OCRString
        else
            Result := 'Text not recognized.';

    finally
        Lines.Free;
        Stream.Free;
    end;
end;

{--------------------------------------------------------------------------}

end.
