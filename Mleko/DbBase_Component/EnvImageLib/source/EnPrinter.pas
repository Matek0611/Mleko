{---------------------------------------------------------------------------
|
|  Module: EnPrinter.Pas
|
|  Description: TPrinter like class which prints to Envision multi-page
|               graphic formats like PDF, TIF, and DCX.
|
|  History: Feb 14, 2004. MB First version
|
|---------------------------------------------------------------------------}
unit EnPrinter;

{$B-,X+}

interface

uses
    Classes,   { for TFileStream }
    EnMisc,    { for TImageFormat, GetTempFileName }
    EnDiGrph,  { for TDibGraphic }
    EnTifGr,   { for TTiffGraphic }
    Printers,  { for TPrinterOrientation  }
    Graphics;  { for TCanvas, TGraphic }

type

TFileExistAction = ( fxaOverwrite, fxaRaiseError );

TEnvisionPrinter = class(TObject)
protected

    FAborted         : Boolean;

    FPageNumber      : Integer;

    FPageHeight      : Integer;
    FPageWidth       : Integer;

    FImageFormat     : TImageFormat;

    FOutputFileName  : String;

    { Only not nil when printing. }
    FPageGraphic     : TTiffGraphic;

    FFileExistAction : TFileExistAction;

    FBufferFileName  : String;
    FBufferStream    : TFileStream;

    function GetPrinting : Boolean;

    function GetCanvas : TCanvas;

    procedure SetOutputFileName( const InOutputFileName : String );

    procedure CheckPrinting( const Active : Boolean );

    procedure SaveCurrentPage;
    function GetGraphic( const ImageNo     : Integer;
                         var   FreeGraphic : Boolean ) : TGraphic;

public
    constructor Create;
    destructor Destroy; override;

    property ImageFormat : TImageFormat read FImageFormat
                                        write FImageFormat;

    property Canvas : TCanvas read GetCanvas;

    property Aborted : Boolean read FAborted;

    property PageNumber : Integer read FPageNumber;

    property PageHeight : Integer read FPageHeight;
    property PageWidth : Integer read FPageWidth;

    property Printing : Boolean read GetPrinting;

    procedure BeginDoc;
    procedure EndDoc;
    procedure Abort;

    procedure NewPage;

    property OutputFileName : String read FOutputFileName
                                     write SetOutputFileName;

    { default action when file exists is fxaOverwrite }
    property FileExistAction : TFileExistAction read FFileExistAction
                                                write FFileExistAction;

end;

function EnvisionPrinter : TEnvisionPrinter;

implementation

uses
    Forms,      { for Screen }
    Windows,    { for GetDeviceCaps }
    SysUtils;   { for Exception, DeleteFile }

var

FPrinter : TEnvisionPrinter;

{---------------------------------------------------------------------------}

function EnvisionPrinter : TEnvisionPrinter;
begin
    if FPrinter = nil then
        FPrinter := TEnvisionPrinter.Create;

    Result := FPrinter;
end;

{---------------------------------------------------------------------------}

constructor TEnvisionPrinter.Create;
begin
    inherited Create;

    FImageFormat     := ifBlackWhite;
    FFileExistAction := fxaOverwrite;
end;

{---------------------------------------------------------------------------}

destructor TEnvisionPrinter.Destroy;
begin
    FPageGraphic.Free;
    FPageGraphic := nil;

    FBufferStream.Free;
    FBufferStream := nil;

    inherited Destroy;
end;

{---------------------------------------------------------------------------}

procedure TEnvisionPrinter.BeginDoc;
var
    XRes   : Integer;
    YRes   : Integer;
begin
    CheckPrinting(False);

    if (FileExistAction = fxaRaiseError) and
       FileExists( OutputFileName ) then
        raise Exception.Create('File already exists, ' + OutputFileName );

    FPageGraphic     := TTiffGraphic.Create;
    case FImageFormat of
        ifBlackWhite : FPageGraphic.Compression := tcGroup4;
        ifTrueColor  : FPageGraphic.Compression := tcJpeg;
        else
            FPageGraphic.Compression := tcZlib;
    end; { case }

    FBufferFileName := EnMisc.GetTempFileName( 'Prt', '.tmp' );
    FBufferStream   := TFileStream.Create( FBufferFileName, fmCreate );

    FAborted     := False;
    FPageNumber  := 1;

    XRes         := GetDeviceCaps(Printer.Handle, LOGPIXELSX);
    YRes         := GetDeviceCaps(Printer.Handle, LOGPIXELSY);

    FPageHeight  := Printer.PageHeight;
    FPageWidth   := Printer.PageWidth;

    FPageGraphic.NewImage( FPageWidth, FPageHeight, FImageFormat, nil, XRes, YRes );

    FPageGraphic.Canvas.Font.PixelsPerInch := YRes;

    FPageGraphic.Fill(CWhiteRgb);
end;

{---------------------------------------------------------------------------}

procedure TEnvisionPrinter.EndDoc;
var
    Graphic : TDibGraphic;
begin
    CheckPrinting(True);

    SaveCurrentPage;

    Graphic := NewDibGraphic(OutputFileName);
    BeginHourglass;
    try
        FBufferStream.Seek( 0, soFromBeginning );
        Graphic.MultiSaveToFile( OutputFileName, FPageNumber, GetGraphic );
    finally
        EndHourglass;
        Graphic.Free;
    end;

    FBufferStream.Free;
    FBufferStream := nil;

    DeleteFile(FBufferFileName);

    FPageGraphic.Free;
    FPageGraphic := nil;
end;

{---------------------------------------------------------------------------}

procedure TEnvisionPrinter.Abort;
begin
    CheckPrinting(True);

    FAborted := True;

    FBufferStream.Free;
    FBufferStream := nil;

    DeleteFile(FBufferFileName);

    FPageGraphic.Free;
    FPageGraphic := nil;
end;

{---------------------------------------------------------------------------}

procedure TEnvisionPrinter.NewPage;
begin
    CheckPrinting(True);

    SaveCurrentPage;

    Inc(FPageNumber);

    FPageGraphic.Fill(CWhiteRgb);
end;

{---------------------------------------------------------------------------}

procedure TEnvisionPrinter.SaveCurrentPage;
var
    Stream : TMemoryStream;
    Size   : LongInt;
begin
    Stream := TMemoryStream.Create;
    try
        FPageGraphic.SaveToStream(Stream);
        Size := Stream.Size;

        FBufferStream.WriteBuffer( Size, SizeOf(Size) );
        Stream.Position := 0;
        {$WARNINGS OFF}
        FBufferStream.WriteBuffer( Stream.Memory^, Size );
        {$WARNINGS ON}
    finally
        Stream.Free;
    end;
end;

{---------------------------------------------------------------------------}

function TEnvisionPrinter.GetGraphic( const ImageNo     : Integer;
                                      var   FreeGraphic : Boolean ) : TGraphic;
var
    Size   : LongInt;
    Stream : TMemoryStream;
begin
    Result      := TTiffGraphic.Create;
    FreeGraphic := True;

    Stream := TMemoryStream.Create;
    try
        FBufferStream.ReadBuffer( Size, SizeOf(Size) );
        Stream.SetSize(Size);
        {$WARNINGS OFF}
        FBufferStream.ReadBuffer( Stream.Memory^, Size );
        {$WARNINGS ON}

        Stream.Position := 0;
        Result.LoadFromStream(Stream);
    finally
        Stream.Free;
    end;
end;

{---------------------------------------------------------------------------}

procedure TEnvisionPrinter.CheckPrinting( const Active : Boolean );
begin
    if Active then
    begin
        if not Printing then
            raise Exception.Create( 'TEnvisionPrinter not printing');
    end
    else
    begin
        if Printing then
            raise Exception.Create( 'TEnvisionPrinter busy');
    end;
end;

{---------------------------------------------------------------------------}

function TEnvisionPrinter.GetPrinting : Boolean;
begin
    Result := (FPageGraphic <> nil);
end;

{---------------------------------------------------------------------------}

function TEnvisionPrinter.GetCanvas : TCanvas;
begin
    CheckPrinting(True);

    Result := FPageGraphic.Canvas;
end;

{---------------------------------------------------------------------------}

procedure TEnvisionPrinter.SetOutputFileName( const InOutputFileName : String );
begin
    CheckPrinting(False);

    FOutputFileName := InOutputFileName;
end;

{---------------------------------------------------------------------------}

initialization

    FPrinter := nil;

finalization

    FPrinter.Free;

end.
