{----------------------------------------------------------------------------
|
| Library: Envision
|
| Module: EnRecoICR
|
| Description: TOCREngine class interfacing Recogniform ICR Engine
|              available at www.recogniform.com
|
| History: Dec 16, 2003. Francesco Pucino (fpucino@mclink.it) , first version
|
|---------------------------------------------------------------------------}
unit EnRecoICR;

{$I Envision.Inc}

interface

uses
    Classes,  { for TStringList }
    Windows,  { for TRect }
    EnMisc,   { for TEnvisionProgressEvent }
    EnDiGrph, { for TDibGraphic }
    EnOcrEng; { for TOcrDriver }


type

TICRImageContent = ( ticNumeric,
                     ticNumericEuropean,
                     ticUppercase,
                     ticLowercase,
                     ticAlphabetic,
                     ticAlphanumeric);

TICRImageType = ( titChar,
                  titWord,
                  titLine,
                  titParagraph);


TRecogniformICRDriver = class(TOcrDriver)
protected
    FImageContent: TICRImageContent;
    FImageType   : TICRImageType;
    FLicenseName : String;
    FLicenseKey  : String;
    FICRSession  : Integer;
    FRecDirectory: String;
    FCharCount   : Integer;
    procedure SetLicenseName(Value:String);
    procedure SetLicenseKey(Value:String);
    function GetCharAscii(Index:Integer):Char;
    function GetCharRect(Index:Integer):TRect;
    function GetCharConfidence(Index:Integer):Integer;
public
    constructor Create; override;
    destructor Destroy; override;

    procedure Recognize( const Graphic       : TDibGraphic;
                         const Output        : TStrings;
                         const ProgressEvent : TEnvisionProgressEvent ); override;


    property ImageContent: TICRImageContent read FImageContent write FImageContent;

    property ImageType: TICRImageType read FImageType write FImageType;

    property LicenseName: String read FLicenseName write SetLicenseName;

    property LicenseKey: String read FLicenseKey write SetLicenseKey;

    property RecDirectory:String read FRecDirectory write FRecDirectory;

    property CharCount:Integer read FCharCount;

    property CharASCII[index:Integer]:Char read GetCharAscii;

    property CharRect[index:Integer]:TRect read GetCharRect;

    property CharConfidence[index:Integer]:Integer read GetCharConfidence;

end;

{--------------------------------------------------------------------------}

implementation

uses
    SysUtils,   { ExtractFilePath }
    EnMsg,      { msgXXXX }
    Recoicrapi; { Recogniform ICR API }

{--------------------------------------------------------------------------}

Var ICRLibraryLoaded:Boolean;

constructor TRecogniformICRDriver.Create;
begin
    // Load the ICR Library, when the first object is created
    if not ICRLibraryLoaded then
     begin
      if LoadICRLibrary = -1 then
          raise Exception.Create( 'RecogniFORM ICR engine must be installed.'#13 +
                                  'See http://www.recogniform.com');
      ICRLibraryLoaded:=True;
     end;

    { Set default recognizer as "numeric" }
    FImageContent :=ticNumeric;

    { Set default image type as "text line" }
    FImageType:=titLine;

    { Set default "evaluation" license name and key }
    FLicenseName:='demo';
    FLicenseKey:='demo';

    { Reset ICR session }
    FICRSession:=0;

    { Set default path for .rec files }
    FRecDirectory:=ExtractFilePath(ParamStr(0));


    { Reset available chars counter }
    FCharCount:=0;
end;

{--------------------------------------------------------------------------}

destructor TRecogniformICRDriver.Destroy;
begin
    { Close the ICR Session }
    if FICRSession<>0 then ICR_Done(FICRSession);

    // THE LIBRARY IS UNLOADED IN FINALIZATION PROCEDURE

    inherited Destroy;
end;

{--------------------------------------------------------------------------}

procedure TRecogniformICRDriver.Recognize( const Graphic       : TDibGraphic;
                                           const Output        : TStrings;
                                           const ProgressEvent : TEnvisionProgressEvent );
var

    DibHandle          : Windows.THandle;
    RecognizedChars    : Integer;
    RecognizedBuffer   : String;

begin

    { MB Nov 7. If Graphic is not black and white an exception is raised
      in Recogniform DLL }
    if Graphic.ImageFormat <> ifBlackWhite then
        raise EEnvisionError.Create(msgGraphicMustBeBlackAndWhite);

    { Initialize the ICR session if required }
    {$WARNINGS OFF}
    if FICRSession=0 then FICRSession:=ICR_Init(PChar(FLicenseName),PChar(FLicenseKey));
    {$WARNINGS ON}
    { Retrieve the DIB handle to recognize }
    DibHandle := Graphic.AsDibHandle;

    { Load the right recognizer based on image content }
    {$WARNINGS OFF}
    Case FImageContent of
     ticNumeric : ICR_SelectRecognizer(FICRSession,PChar(FRecDirectory+'digit.rec'));
     ticNumericEuropean: ICR_SelectRecognizer(FICRSession,PChar(FRecDirectory+'eurodigit.rec'));
     ticUppercase: ICR_SelectRecognizer(FICRSession,PChar(FRecDirectory+'upper.rec'));
     ticLowercase: ICR_SelectRecognizer(FICRSession,PChar(FRecDirectory+'lower.rec'));
     ticAlphabetic: ICR_SelectRecognizer(FICRSession,PChar(FRecDirectory+'upperlow.rec'));
     ticAlphanumeric: ICR_SelectRecognizer(FICRSession,PChar(FRecDirectory+'alphanum.rec'));
     else raise Exception.Create('Invalid ICR Image Content !');
    end;
    {$WARNINGS ON}

    { Recognize the image based on image type }
    Case FImageType of
     titChar:RecognizedChars:=ICR_RecognizeChar(FICRSession,DibHandle,0);
     titWord:RecognizedChars:=ICR_RecognizeWord(FICRSession,DibHandle,0);
     titLine:RecognizedChars:=ICR_RecognizeLine(FICRSession,DibHandle,0);
     titParagraph:RecognizedChars:=ICR_RecognizeParagraph(FICRSession,DibHandle,0);
     else raise Exception.Create('Invalid ICR Image Type !');
    end;

    SetLength(RecognizedBuffer,RecognizedChars);


    { Retrieve the result buffer }
    {$WARNINGS OFF}
    ICR_GetResultValue(FICRSession,@RecognizedBuffer[1]);
    {$WARNINGS ON}
    
    { Copy data to outpur TStrings }
    if Assigned(Output)
     then Output.Text:=RecognizedBuffer;

    { Retrieve the numeber of true recognized characters }
    FCharCount:=ICR_GetCharactersCount(FICRSession);

end;

procedure TRecogniformICRDriver.SetLicenseName(Value:String);
 begin
  if FICRSession<>0 then ICR_Done(FICRSession);
  FICRSession:=0;
  FCharCount:=0;
  FLicenseName:=Value;
 end;

procedure TRecogniformICRDriver.SetLicenseKey(Value:String);
 begin
  if FICRSession<>0 then ICR_Done(FICRSession);
  FICRSession:=0;
  FCharCount:=0;
  FLicenseKey:=Value;
 end;

function TRecogniformICRDriver.GetCharAscii(Index:Integer):Char;
 begin
  Result:=#0;
  if FICRSession=0 then Exit;
  if Index<FCharCount then ICR_GetCharacterValue(FICRSession,Index,0,Result);
 end;

function TRecogniformICRDriver.GetCharRect(Index:Integer):TRect;
 begin
  Result:=Rect(0,0,0,0);
  if FICRSession=0 then Exit;
  if Index<FCharCount then ICR_GetCharacterRect(FICRSession,Index,Result.Left,Result.Top,Result.Right,Result.Bottom);
 end;

function TRecogniformICRDriver.GetCharConfidence(Index:Integer):Integer;
 begin
  Result:=0;
  if FICRSession=0 then Exit;
  if Index<FCharCount then ICR_GetCharacterConfidence(FICRSession,Index,0,Result);
 end;

{--------------------------------------------------------------------------}

initialization
 ICRLibraryLoaded:=False;
finalization
 if ICRLibraryLoaded then FreeICRLibrary;
end.

