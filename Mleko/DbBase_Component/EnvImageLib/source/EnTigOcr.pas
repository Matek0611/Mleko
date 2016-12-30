{----------------------------------------------------------------------------
|
| Library: Envision
|
| Module: EnTigOcr
|
| Description: Driver for Tiger OCR engine, see www.ocr.com.
|
| History: Oct 11, 2003. Michel Brazeau, first version
|
|---------------------------------------------------------------------------}
unit EnTigOcr;

{$I Envision.Inc}

interface

uses
    Windows,  { for THandle }
    Classes,  { for TStringList }
    EnMisc,   { for TEnvisionProgressEvent }
    EnDiGrph, { for TDibGraphic }
    EnOcrEng; { for TOcrDriver }


const

LANG_ENGLISH               = 0;
LANG_GERMAN                = 1;
LANG_FRENCH                = 2;
LANG_RUSSIAN               = 3;
LANG_SWEDISH               = 4;
LANG_SPANISH               = 5;
LANG_ITALIAN               = 6;
LANG_RUSSIAN_AND_ENGLISH   = 7; { mixed language }
LANG_UKRAINIAN		   = 8;
LANG_SERBIAN	           = 9;
LANG_CROATIAN		   = 10;
LANG_DANISH		   = 11;
LANG_PORTUGUESE		   = 12;
LANG_DUTCH		   = 13;


type

TTigerOcrOptions = ( tgoUseDictionary,
                     tgoForceOneColumn );


TTigerOcrOptionsSet = set of TTigerOcrOptions;


TLongWordArray = array[0..(MaxLongInt div 4)-4] of LongWord;
TpLongWordArray = ^TLongWordArray;

PLongWord = ^LongWord;

TTigerCallBack = function( FuncNumber : Word;
                           pParams    : TpLongWordArray ) : LongWord; stdcall;


TpEdRect = ^TEdRect;
TEdRect = packed record
    Left   : SmallInt;
    Top    : SmallInt;
    Right  : SmallInt;
    Bottom : SmallInt;
end;

TpEdPage = ^TEdPage;
TEdPage = packed record
    FragmentCount      : Word;
    Frame              : TEdRect;
    InclineNumerator   : SmallInt;
    InclineDenominator : Word;
    Dpi                : Word;
end;

TpEdFragment = ^TEdFragment;
TEdFragment = packed record
    FragmentNumber       : Word;
    Frame                : TEdRect;
    StringCount          : Word;
    FragmentType         : Word;
    BaseDistanceFromLeft : Word;
    CenterFragmentNumber : Word;
end;

TpEdString = ^TEdString;
TEdString = packed record
    StringNumber    : Word;
    Frame           : TEdRect;
    WordCount       : Word;
    StringType      : Word;
    Indent          : SmallInt;
    BulletIndent    : Word;
    BaseLine        : SmallInt;
end;

TpEdWord = ^TEdWord;
TEdWord = packed record
    WordNumber     : word;
    Frame          : TEdRect;
    CharacterCount : Word;
    Font           : Word;
    PointSize      : Word;
end;

TpEdCharacter = ^TEdCharacter;
TEdCharacter = packed record
    CharNumber  : Word;
    Frame       : TEdRect;
    Character   : Byte;
    Probability : Byte;
end;

TpTigerImageInfo = ^TTigerImageInfo;
TTigerImageInfo = packed record
    ImageHeight       : Word;     { Height of the image in lines       }
    ImageWidth        : Word;     { Width of the image in pixels       }
    ImageByteWidth    : Word;     { Size of the image line in bytes    }
    ImageDisplacement : Word;     { Displacement of the first pixel of
                                   image line in pixels, usually 0  }
    ResolutionX       : Word;     { Resolution by X-axe }
    ResolutionY       : Word;     { Resolution by Y-axe }
    FotoMetrics       : Byte;     { White pixel, 1 if white pixel=1 }
    Unused            : Byte;     { not used; for alignment purpose only }

    AddX              : Word;
    AddY              : Word;
end;


{$Warnings Off}
TTigerLoad = function( TigerCallBack : LongWord;
                       TigerPathName : PChar;
                       TigerDataPath : PChar ) : Boolean; stdcall;

TTigerUnLoad = function : Boolean; stdcall;

TTigerReset = function : Boolean; stdcall;

TTigerStatus = function : Word; stdcall;

TTigerErrorMessage = function( Error : Word ) : PChar; stdcall;

TTigerSetRecognitionOptions = function ( Options : Word ) : Boolean; stdcall;

TTigerSetLanguage = function( Language : Word ) : Boolean; stdcall;

TTigerRecognition = function( pEdFileName : PChar ) : Boolean; stdcall;

TTigerOpenEdFile = function( pEdFileName : PChar ) : Boolean; stdcall;

TTigerCloseEdFile = function : Boolean; stdcall;

TTigerEdToText = function( pEdFileName   : PChar;
                           pTextFileName : PChar;
                           Options       : Word;
                           BadChar       : Word ) : Boolean; stdcall;

TTigerRecognitionToMem = function( ppBuffer : PPointer; pSize : PLongWord ) : Boolean; stdcall;



TTigerOpenEdFromMem = function( pBuffer : Pointer; Size : LongWord ) : Boolean; stdcall;

TTigerGetEdPage = function( pEdPage : TpEdPage ) : Boolean; stdcall;

TTigerGetEdFragment = function( FragmentId : Word; pFragment : TpEdFragment ) : Boolean; stdcall;

TTigerGetEdString = function( StringId : Word; pString : TpEdString ) : Boolean; stdcall;

TTigerGetEdWord = function( WordId : Word; pWord : TpEdWord ) : Boolean; stdcall;

TTigerGetEdCharacter = function( CharacterId : Word; pCharacter : TpEdCharacter ) : Boolean; stdcall;


TTigerEdFromMemToText = function( pBuffer      : Pointer;
                                  Size         : LongWord;
                                  TextFileName : PChar;
                                  Options      : Word;
                                  BadChar      : Word ) : Boolean; stdcall;

TTigerFreeMemory = function( pBuffer : Pointer ) : LongWord; stdcall;

{$Warnings on}

TTigerOcrDriver = class(TOcrDriver)
protected

    FOptions       : TTigerOcrOptionsSet;

    { current scan line on graphic being ocr'd }
    FScanLineNo    : LongInt;

    FGraphic       : TDibGraphic;
    FLastPercent   : Byte;
    FProgressEvent : TEnvisionProgressEvent;

    FTigerLanguage : Word;

    DLLHandle      : THandle;

    TigerLoad                    : TTigerLoad;
    TigerUnLoad                  : TTigerUnLoad;
    TigerReset                   : TTigerReset;
    TigerStatus                  : TTigerStatus;
    TigerErrorMessage            : TTigerErrorMessage;
    TigerSetRecognitionOptions   : TTigerSetRecognitionOptions;
    TigerSetLanguage             : TTigerSetLanguage;
    TigerRecognitionToMem        : TTigerRecognitionToMem;
    TigerOpenEdFile              : TTigerOpenEdFile;
    TigerCloseEdFile             : TTigerCloseEdFile;
    TigerEdToText                : TTigerEdToText;
    TigerRecognition             : TTigerRecognition;
    TigerOpenEdFromMem           : TTigerOpenEdFromMem;
    TigerGetEdPage               : TTigerGetEdPage;
    TigerGetEdFragment           : TTigerGetEdFragment;
    TigerGetEdString             : TTigerGetEdString;
    TigerGetEdWord               : TTigerGetEdWord;
    TigerGetEdCharacter          : TTigerGetEdCharacter;
    TigerEdFromMemToText         : TTigerEdFromMemToText;
    TigerFreeMemory              : TTigerFreeMemory;

    procedure LoadEngine;
    procedure UnloadEngine;

    { raises an exception if the last tiger status is an error. }
    procedure CheckTigerStatus;

    {$Warnings off}
    { returns the address of a routine in the OCR engine DLL. }
    function GetRoutineAddr( const RoutineName : AnsiString ) : Pointer;
    {$Warnings on}

public
    constructor Create; override;
    destructor Destroy; override;

    procedure Recognize( const Graphic       : TDibGraphic;
                         const Output        : TStrings;
                         const ProgressEvent : TEnvisionProgressEvent ); override;


    { Language if image to OCR. Only used when tgoUseDictionary is active }
    property Language : Word read FTigerLanguage
                             write FTigerLanguage;

    property Options : TTigerOcrOptionsSet read FOptions
                                           write FOptions;

end;

{--------------------------------------------------------------------------}

implementation

uses
    EnMsg,    { for msgXXXX }
    SysUtils; { for Exception }

var

OcrDriverInstance : TTigerOcrDriver;


const

CTigerDLLFileName = 'CTOCRC32.DLL';


TSRO_SPELLER            = 1;
TSRO_FORCE_ONE_COLUMN   = 2;
TSRO_NOFORMAT           = 4;
TSRO_FAX100             = 8;
TSRO_DOTMATRIX          = 16;
TSRO_BCR                = 32;
TSRO_RECOGLANG          = 64;
TSRO_CUT_LEFT_EDGE      = 128;
TSRO_CUT_RIGHT_EDGE     = 256;
TSRO_PICTURES_NO        = 512;
TSRO_ED_FILE_EMULATION  = $4000; { AK   7/19/98 }


TCB_IMAGE_OPEN               = 1;
TCB_IMAGE_READ               = 2;
TCB_IMAGE_CLOSE              = 3;
TCB_REPORT_ERROR             = 4;
TCB_PROGRESS_START           = 5;
TCB_PROGRESS_FINISH          = 6;
TCB_PROGRESS_SET_PERCENTAGE  = 7;
TCB_PROGRESS_SET_STAGE       = 8;
TCB_VERS_NUM                 = 9;

TIGER_TOEDNATIVE           = $01;
TIGER_TOASCII              = $02;
TIGER_TOSMARTASCII         = $04;
TIGER_TORTF                = $08;
TIGER_TOANSI               = $10;
TIGER_TOSMARTANSI          = $20;
TIGER_APPEND               = $80;           { flag of appending mode }
TIGER_TOTABLETXT           = $0100;
TIGER_TOTABLECSV           = $0200;
TIGER_TOTABLEDBF           = $0400;
TIGER_TOTABLEODBC          = $0800;
TIGER_TOTABLEWKS           = $1000;
TIGER_TOHTML               = $2000;

TG_EDC_BIG_SUSPECT         = 70;

{---------------------------------------------------------------------------}

function TigerCallbackImageOpen(pImageInfo : TpTigerImageInfo) : Boolean;
var
    XDpi : Word;
    YDpi : Word;
begin
    if OcrDriverInstance.FGraphic = nil then
        Result := False
    else
    begin
        if OcrDriverInstance.FGraphic.XDotsPerInch <= 200 then
        begin
            XDpi := 200;
            YDpi := 200;
        end
        else if OcrDriverInstance.FGraphic.XDotsPerInch <= 300 then
        begin
            XDpi := 300;
            YDpi := 300;
        end
        else
        begin
            XDpi := 400;
            YDpi := 400;
        end;

        {$WARNINGS OFF}
        pImageInfo^.ImageHeight       := MinInteger($FFFF, OcrDriverInstance.FGraphic.Height);
        pImageInfo^.ImageWidth        := MinInteger($FFFF, OcrDriverInstance.FGraphic.Width);
        pImageInfo^.ImageByteWidth    := OcrDriverInstance.FGraphic.ScanLineSize;
        pImageInfo^.ImageDisplacement := 0;
        pImageInfo^.ResolutionX       := XDpi;
        pImageInfo^.ResolutionY       := YDpi;
        pImageInfo^.FotoMetrics       := 1;
        pImageInfo^.AddX              := 0;
        pImageInfo^.AddY              := 0;
        {$WARNINGS ON}

        Result := True;
    end;
end;

{---------------------------------------------------------------------------}

{$WARNINGS OFF}
function TigerCallbackImageRead( pScanLine  : Pointer;
                                 MaxSize    : Word ) : Word;
{$WARNINGS ON}
begin
    if OcrDriverInstance.FScanLineNo < OcrDriverInstance.FGraphic.Height then
    begin
        {$WARNINGS OFF}
        Move( OcrDriverInstance.FGraphic.ScanLine[OcrDriverInstance.FScanLineNo]^,
              pScanLine^,
              OcrDriverInstance.FGraphic.ScanLineSize );
        {$WARNINGS ON}

        Result := OcrDriverInstance.FGraphic.ScanLineSize;

        Inc(OcrDriverInstance.FScanLineNo);
    end
    else
        Result := 0;
end;

{---------------------------------------------------------------------------}

function TigerCallbackImageClose : Boolean;
begin
    {
     TigerCallbackImageClose could be invoked even if TigerCallbackImageOpen returned
     bad status or was not opened at all
    }
    Result := True;
end;

{---------------------------------------------------------------------------}

{$WARNINGS OFF}
procedure TigerCallbackReportError( Status   : Word;
                                    pMessage : PChar );
begin
end;
{$WARNINGS ON}

{---------------------------------------------------------------------------}

function TigerCallbackProgressStart : Boolean;
begin
    Result := True;
end;

{---------------------------------------------------------------------------}

function TigerCallbackProgressFinish : Boolean;
begin
    Result := True;
end;

{---------------------------------------------------------------------------}

function TigerCallbackProgressSetPerc( Percent : Word ) : Boolean;
begin
    DoProgress( OcrDriverInstance, OcrDriverInstance.FProgressEvent,
                Percent, 0, 100, OcrDriverInstance.FLastPercent );
    Result := True;
end;

{---------------------------------------------------------------------------}

{$WARNINGS OFF}
function TigerCallbackProgressSetStage( StageNumber : Word;
                                        pStageName  : PChar;
                                        Volume      : Word ) : Boolean;
begin
    Result := True;
end;
{$WARNINGS ON}

{---------------------------------------------------------------------------}

function TigerCallBack( FuncNumber : Word;
                        pParams    : TpLongWordArray ) : LongWord; stdcall;
begin
    Result := 0;

    case FuncNumber of
        TCB_IMAGE_OPEN :
        begin
            {$WARNINGS OFF}
            if TigerCallbackImageOpen(
                                TpTigerImageInfo(pParams^[0])) then
                Result := 1
            else
                Result := 0;
            {$WARNINGS ON}
        end;


        TCB_IMAGE_READ:
        begin
            {$WARNINGS OFF}
            Result := LongWord( TigerCallbackImageRead(
                                Pointer(pParams^[0]),
                                Word(pParams^[1])));
            {$WARNINGS ON}
        end;

        TCB_IMAGE_CLOSE:
        begin
            if TigerCallbackImageClose then
                Result := 1
            else
                Result := 0;
        end;

        TCB_REPORT_ERROR:
        begin
            {$WARNINGS OFF}
            TigerCallbackReportError ( Word(pParams^[0]), PChar(pParams^[1]));
            Result := 1;
            {$WARNINGS ON}
        end;

        TCB_PROGRESS_START:
        begin
            if TigerCallbackProgressStart then
                Result := 1
            else
                Result := 0;
        end;

        TCB_PROGRESS_FINISH:
        begin
            if TigerCallbackProgressFinish then
                Result := 1
            else
                Result := 0;
        end;

        TCB_PROGRESS_SET_PERCENTAGE:
        begin
            {$WARNINGS OFF}
            if TigerCallbackProgressSetPerc(Word(pParams^[0])) then
                Result := 1
            else
                Result := 0;
            {$WARNINGS ON}
        end;

        TCB_PROGRESS_SET_STAGE:
        begin
            {$WARNINGS OFF}
            if TigerCallbackProgressSetStage(
                                Word(pParams^[0]),
                                PChar(pParams^[1]),
                                Word(pParams^[2])) then
                Result := 1
            else
                Result := 0;
            {$WARNINGS ON}
        end;
    end; { case }
end;

{---------------------------------------------------------------------------}

procedure TTigerOcrDriver.CheckTigerStatus;
var
    Status : Word;
begin
    Status := TigerStatus;

    if Status <> 0 then
        raise Exception.Create(TigerErrorMessage(Status));
end;

{--------------------------------------------------------------------------}


constructor TTigerOcrDriver.Create;
begin
    inherited Create;

    if OcrDriverInstance <> nil then
        raise Exception.Create(msgOnlyOneTigerOcrEngineInstancePermitted);

    OcrDriverInstance := Self;

    LoadEngine;

    FOptions       := [];

    FTigerLanguage := EnTigOcr.LANG_ENGLISH;
end;

{--------------------------------------------------------------------------}

destructor TTigerOcrDriver.Destroy;
begin
    if OcrDriverInstance <> nil then
    begin
        OcrDriverInstance := nil;

        UnloadEngine;
    end;

    inherited Destroy;
end;

{--------------------------------------------------------------------------}

procedure TTigerOcrDriver.Recognize( const Graphic       : TDibGraphic;
                                     const Output        : TStrings;
                                     const ProgressEvent : TEnvisionProgressEvent );
const
    {$J+}
    InRecognize : Boolean = False;
var
    {$WARNINGS OFF}
    pEdBuffer    : Pointer;
    {$WARNINGS ON}
    EdSize       : DWORD;

    RecogOptions : Word;

    EdPage       : TEdPage;
    EdFragment   : TEdFragment;
    EdString     : TEdString;
    EdWord       : TEdWord;
    EdCharacter  : TEdCharacter;

    FragmentNo   : Integer;
    StringNo     : Integer;
    WordNo       : Integer;
    CharNo       : Integer;
    Line         : String;

begin
    if InRecognize then
        Exit;

    InRecognize := True;
    try
        FLastPercent   := DoProgress( Self, ProgressEvent, 0, 0, 100, -1 );
        FProgressEvent := ProgressEvent;
        Output.Clear;

        TigerReset;

        RecogOptions := 0;
        if tgoUseDictionary in FOptions then
        begin
            RecogOptions := RecogOptions or TSRO_SPELLER;
            TigerSetLanguage(FTigerLanguage);
        end;

        if tgoForceOneColumn in FOptions then
            RecogOptions := RecogOptions or TSRO_FORCE_ONE_COLUMN;

        TigerSetRecognitionOptions(RecogOptions);

        FGraphic    := Graphic;
        FScanLineNo := 0;

        try
            {$WARNINGS OFF}
            TigerRecognitionToMem(@pEdBuffer, @EdSize);
            {$WARNINGS ON}
        except
            raise Exception.Create(msgInternalTigerOcrError);
        end;

        if EdSize > 0 then
        try
            {$WARNINGS OFF}
            TigerOpenEdFromMem(pEdBuffer, EdSize);

            TigerGetEdPage(@EdPage);
            {$WARNINGS ON}
            TigerStatus;

            for FragmentNo := 1 to EdPage.FragmentCount do
            begin
                {$WARNINGS OFF}
                TigerGetEdFragment(FragmentNo-1, @EdFragment);
                {$WARNINGS ON}

                for StringNo := 1 to EdFragment.StringCount do
                begin
                    {$WARNINGS OFF}
                    TigerGetEdString(StringNo-1, @EdString);
                    {$WARNINGS ON}

                    Line := '';

                    for WordNo := 1 to EdString.WordCount do
                    begin
                        {$WARNINGS OFF}
                        TigerGetEdWord(WordNo-1, @EdWord);
                        {$WARNINGS ON}

                        for CharNo := 1 to EdWord.CharacterCount do
                        begin
                            {$WARNINGS OFF}
                            TigerGetEdCharacter(CharNo-1, @EdCharacter);
                            {$WARNINGS ON}

                            Line := Line + Char(EdCharacter.Character);
                        end;

                        Line := Line + ' ';

                    end;

                    Output.Add(SysUtils.Trim(Line));
                end;

                Output.Add('');
            end;

            TigerCloseEdFile;

        finally
            if EdSize > 0 then
                {$WARNINGS OFF}
                TigerFreeMemory(pEdBuffer);
                {$WARNINGS ON}

        end;

    finally
        InRecognize := False;

        FGraphic      := nil;
    end;

    DoProgress( Self, ProgressEvent, 100, 0, 100, FLastPercent );
end;

{--------------------------------------------------------------------------}

procedure TTigerOcrDriver.LoadEngine;
var
    DLLName     : String;
    TigerPath   : String;
    DataPath    : String;
    SystemPath  : array[1..1024] of Char;

begin
    { Search for the Tiger DLL in the applications directory, then in the
      windows system directory }
    DLLName   := AddBackSlashToPath(ExtractFilePath(ParamStr(0))) + CTigerDllFileName;

    if not FileExists( DLLName ) then
    begin
        {$WARNINGS OFF}
        GetSystemDirectory( @SystemPath, SizeOf(SystemPath));
        DLLName := AddBackSlashToPath(PChar(@SystemPath)) + CTigerDllFileName;
        if not FileExists( DLLName ) then
            raise Exception.Create( Format( msgFileNotFoundInAppOrSystemDirectory,
                                            [ CTigerDllFileName,
                                              ExtractFilePath(ParamStr(0)),
                                              AddBackSlashToPath(PChar(@SystemPath)) ] ));
        {$WARNINGS ON}
    end;

    TigerPath := AddBackSlashToPath(ExtractFilePath(DLLName));

    DataPath  := TigerPath + 'BIN\';

    {$WARNINGS OFF}
    DLLHandle := LoadLibrary(PChar(DLLName));
    {$WARNINGS ON}

    if DLLHandle = 0 then
        raise Exception.Create( msgUnableToLoadDLL + ', ' + DLLName );

    TigerLoad                   := GetRoutineAddr('__Tiger_Load');
    TigerUnLoad                 := GetRoutineAddr('__Tiger_Unload');
    TigerReset                  := GetRoutineAddr('Tiger_Reset');
    TigerStatus                 := GetRoutineAddr('Tiger_Status');
    TigerErrorMessage           := GetRoutineAddr('Tiger_ErrorMessage');
    TigerSetRecognitionOptions  := GetRoutineAddr('Tiger_SetRecognitionOptions');
    TigerSetLanguage            := GetRoutineAddr('Tiger_SetLanguage');
    TigerGetEdPage              := GetRoutineAddr('Tiger_GetEdPage');
    TigerGetEdFragment          := GetRoutineAddr('Tiger_GetEdFragment');
    TigerGetEdString            := GetRoutineAddr('Tiger_GetEdString');
    TigerGetEdWord              := GetRoutineAddr('Tiger_GetEdWord');
    TigerGetEdCharacter         := GetRoutineAddr('Tiger_GetEdCharacter');
    TigerCloseEdFile            := GetRoutineAddr('Tiger_CloseEdFile');
    TigerRecognitionToMem       := GetRoutineAddr('Tiger_RecognitionToMem');
    TigerRecognition            := GetRoutineAddr('Tiger_RecognitionToMem');
    TigerOpenEdFile             := GetRoutineAddr('Tiger_OpenEdFile');
    TigerCloseEdFile            := GetRoutineAddr('Tiger_CloseEdFile');
    TigerEdToText               := GetRoutineAddr('Tiger_EdToText');
    TigerOpenEdFromMem          := GetRoutineAddr('Tiger_OpenEdFromMem');
    TigerEdFromMemToText        := GetRoutineAddr('Tiger_EdFromMemToText');
    TigerFreeMemory             := GetRoutineAddr('Tiger_FreeMemory');

    {$WARNINGS OFF}
    TigerLoad( DWORD(@TigerCallBack),
               PChar(TigerPath),
               PChar(DataPath) );
    {$WARNINGS ON}
               
    CheckTigerStatus;
end;

{---------------------------------------------------------------------------}

procedure TTigerOcrDriver.UnloadEngine;
begin
    {$WARNINGS OFF}
    if @TigerUnLoad <> nil then
        TigerUnLoad;
    {$WARNINGS ON}

    if DLLHandle <> 0 then
    begin
        FreeLibrary(DLLHandle);
        DLLHandle := 0;
    end;
end;

{---------------------------------------------------------------------------}

{$WARNINGS OFF}
function TTigerOcrDriver.GetRoutineAddr( const RoutineName : AnsiString ) : Pointer;
begin
    Result := nil;

    if DLLHandle = 0 then
        Exit;

    Result := GetProcAddress( DllHandle, PChar(RoutineName));
end;
{$WARNINGS ON}

{---------------------------------------------------------------------------}

initialization

    OcrDriverInstance := nil;

end.

