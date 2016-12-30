{----------------------------------------------------------------------------
|
| Library: Envision
|
| Module: EnConsoleOcr.Pas
|
| Description: OCR driver which uses a console application which accepts
|              a filename as parameter and outputs results to Stdout.
|
|              One example is JOCR, http://jocr.sourceforge.net
|
| History: Oct 24, 2004. Michel Brazeau, first version
|
|---------------------------------------------------------------------------}
unit EnConsoleOcr;

{$I Envision.Inc}

interface

uses
    Classes, { for TStringList }
    EnMisc, { for TEnvisionProgressEvent }
    EnDiGrph, { for TDibGraphic }
    EnOcrEng; { for TOcrDriver }

type

TConsoleOcrDriver = class( TOcrDriver)
protected
    FOcrProgram: string;
    FInputFileFormat: string;
public
    constructor Create; override;
    destructor Destroy; override;

    procedure Recognize( const Graphic: TDibGraphic;
        const Output: TStrings;
        const ProgressEvent: TEnvisionProgressEvent); override;

    { The OCR program must work by accepting a graphic file of the format
      specified in InputFileFormat and send to resulting OCR'd text to the
      standard output console }
    property OcrProgram: string read FOcrProgram
        write FOcrProgram;

    property InputFileFormat: string read FInputFileFormat
        write FInputFileFormat;

end;

{--------------------------------------------------------------------------}

implementation

uses
    Windows, { for THandle }
    EnMsg, { for msgXXXX }
    SysUtils; { for ExtractFilePath }

{--------------------------------------------------------------------------}

constructor TConsoleOcrDriver.Create;
begin
    inherited Create;
end;

{--------------------------------------------------------------------------}

destructor TConsoleOcrDriver.Destroy;
begin
    inherited Destroy;
end;

{ The latest version of the GOCR open source OCR program, was built as a
16 DOS program, and stdout redirection was not working by using the
TStartupInfo.hStdOutput handle. It did work with some previous version but
not with GOCR039.exe. The only workaround is to pipe the output to a
temporary file,

gocr039 file.pbm > out.txt
}

{--------------------------------------------------------------------------}

procedure TConsoleOcrDriver.Recognize( const Graphic: TDibGraphic;
    const Output: TStrings;
    const ProgressEvent: TEnvisionProgressEvent);
var
    GraphicFileName: string;
    OutputFileName: string;
    LastPercent: Byte;
    TempGraphic: TDibGraphic;
    ExitCode: LongInt;

begin
    if OcrProgram = '' then
        raise EEnvisionError.Create( msgOcrProgramNotSpecified);

    if InputFileFormat = '' then
        raise EEnvisionError.Create( msgOcrInputFileFormatNotSpecified);

    LastPercent := DoProgress( Self, ProgressEvent, 0, 0, 100, -1);

    GraphicFileName := '';
    OutputFileName := '';
    TempGraphic := nil;
    try
        TempGraphic := NewDibGraphic( InputFileFormat);
        TempGraphic.Assign( Graphic);
        GraphicFileName := EnMisc.GetTempFileName( 'ocr', 'tmp');
        TempGraphic.SaveToFile( GraphicFileName);

        OutputFileName := EnMisc.GetTempFileName( 'ocr', 'tmp');
        { create the file immediate to limit the chance of two threads
          or process creating the same file }
        FileClose( FileCreate( OutputFileName));

        if not ExecWait( OcrProgram + ' ' + GraphicFileName + ' > ' + OutputFileName,
            False, ExitCode) then
            raise EEnvisionError.Create( msgUnableToExecuteProgram + ', ' + OcrProgram  );

        Output.LoadFromFile( OutputFileName);

    finally
        TempGraphic.Free;
        if GraphicFileName <> '' then
            DeleteFile( GraphicFileName);
        if OutputFileName <> '' then
            DeleteFile( OutputFileName);
    end;

    DoProgress( Self, ProgressEvent, 100, 0, 100, LastPercent);

end;

{--------------------------------------------------------------------------}

end.
