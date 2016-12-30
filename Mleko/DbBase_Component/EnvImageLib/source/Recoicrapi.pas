// ************************************************
// *  ICR/OCR Interface DLL 32 Bits functions     *
// *  Library Version 2.0                         *
// *  Copyright 2000,01 - All rigths reserved     *
// *  RECOGNIFORM TECHNOLGIES SPA                 *
// *  www.recogniform.com - info@recogniform.com  *
// ************************************************

unit recoicrapi;

interface

Var

 //  Goal: nitialize the engine
 //  Requires: company name, license string
 //  Result: session handle
 {$WARNINGS OFF}
 ICR_Init : function (Company,LicenseKey:PChar):Integer; stdcall;

 //  Goal: select the recognizer to use
 //  Requires: session handle, .rec full file name
 //  Result: n/a
 ICR_SelectRecognizer : procedure (SessionHandle:Integer;RecognizerFile:PChar); stdcall;

 //  Goal: recognize a single char
 //  Requires: session handle, dib handle, options (not used at moment)
 //  Result: number of char(s) recognized
 ICR_RecognizeChar : function (SessionHandle:Integer;DIBHandle:Integer;Options:Integer):Integer; stdcall;

 //  Goal: recognize a single word
//  Requires: session handle, dib handle, options (not used at moment)
//  Result: number of char(s) recognized
 ICR_RecognizeWord : function (SessionHandle:Integer;DIBHandle:Integer;Options:Integer):Integer; stdcall;

 //  Goal: recognize a text line
 //  Requires: session handle, dib handle, options (not used at moment)
 //  Result: number of char(s) recognized (spaces included)
 ICR_RecognizeLine : function (SessionHandle:Integer;DIBHandle:Integer;Options:Integer):Integer; stdcall;

 //  Goal: recognize a text paragraph
 //  Requires: session handle, dib handle, options (not used at moment)
 //  Result: number of char(s) recognized (spaces included)
 ICR_RecognizeParagraph : function (SessionHandle:Integer;DIBHandle:Integer;Options:Integer):Integer; stdcall;

 //  Goal: retrieve the result length
 //  Requires: session handle
 //  Result: number of char(s) recognized in last operation (spaces included)
 ICR_GetResultLen : function (SessionHandle:Integer):Integer; stdcall;

 //  Goal: retrieve the medium result confidence
 //  Requires: session handle
 //  Result: confidence (0..100) attributed to the last recognition
 ICR_GetResultConfidence : function (SessionHandle:Integer):Integer; stdcall;

 //  Goal: retrieve the recognized string
 //  Requires: session handle
 //  Result: number of char(s) copied in the buffer
 ICR_GetResultValue : function (SessionHandle:Integer;Buffer:PChar):Integer; stdcall;

 {$WARNINGS ON}


 //  Goal: retrieve the rect coordinates of one of character recognized
 //  Requires: session handle, character index, left, top, right and bottom output long buffer
 //  Result: n/a
 ICR_GetCharacterRect : procedure (SessionHandle:Integer; CharIndex:Integer;Var Left,Top,Right,Bottom:Integer); stdcall;

 //  Goal: retrieve the confidence of one of possible character alternative recognized
 //  Requires: session handle, character index, character alternative (0..2), output long buffer
 //  Result: n/a
 ICR_GetCharacterConfidence : procedure (SessionHandle:Integer; CharIndex:Integer; CharAlternative:Integer; Var Confidence:Integer); stdcall;

 //  Goal: retrieve the ASCII code of one of possible character alternative recognized
 //  Requires: session handle, character index, character alternative (0..2), output char buffer
 //  Result: n/a
 ICR_GetCharacterValue : procedure (SessionHandle:Integer; CharIndex:Integer; CharAlternative:Integer; Var Value:Char); stdcall;

 //  Goal: retrieve the number of recognized characters (spaces excluded!)
 //  Requires: session handle
 //  Result: number of char(s) recognized in last operation, spaces excluded
 ICR_GetCharactersCount : function (SessionHandle:Integer):Integer; stdcall;

 //  Goal: deinitialize the engine
 //  Requires: session handle, .rec full file name
 //  Result: n/a
 ICR_Done : procedure (SessionHandle:Integer); stdcall;

 //  Goal: load dynamically the ICR library
 //  Requires: n/a
 //  Result: -1 if an error occurred, else 0
 function LoadICRLibrary:Integer;

 //  Goal: unload the ICR library
 //  Requires: n/a
 //  Result: n/a
 procedure FreeICRLibrary;

implementation

Uses Windows,Dialogs;

// ICR Library handle
Var ICRLIB:THandle;

// Use this funciton to load dynamically the ICR library
// The function return -1 if the library is not found or 0 if all goes rigth
function LoadICRLibrary:Integer;
 begin
  ICRLIB:=LoadLibrary('RECOICR.DLL');
  if (ICRLIB=0) then
   begin
    ShowMessage('Unable to load RECOICR.DLL');
    Result:=-1;
   end
  else
   begin
    ICR_Init:=GetProcAddress(ICRLIB,'ICR_Init');
    ICR_Done:=GetProcAddress(ICRLIB,'ICR_Done');
    ICR_SelectRecognizer:=GetProcAddress(ICRLIB,'ICR_SelectRecognizer');
    ICR_RecognizeChar:=GetProcAddress(ICRLIB,'ICR_RecognizeChar');
    ICR_RecognizeWord:=GetProcAddress(ICRLIB,'ICR_RecognizeWord');
    ICR_RecognizeLine:=GetProcAddress(ICRLIB,'ICR_RecognizeLine');
    ICR_RecognizeParagraph:=GetProcAddress(ICRLIB,'ICR_RecognizeParagraph');
    ICR_GetResultLen:=GetProcAddress(ICRLIB,'ICR_GetResultLen');
    ICR_GetResultConfidence:=GetProcAddress(ICRLIB,'ICR_GetResultConfidence');
    ICR_GetResultValue:=GetProcAddress(ICRLIB,'ICR_GetResultValue');
    ICR_GetCharacterValue:=GetProcAddress(ICRLIB,'ICR_GetCharacterValue');
    ICR_GetCharacterConfidence:=GetProcAddress(ICRLIB,'ICR_GetCharacterConfidence');
    ICR_GetCharacterRect:=GetProcAddress(ICRLIB,'ICR_GetCharacterRect');
    ICR_GetCharactersCount:=GetProcAddress(ICRLIB,'ICR_GetCharactersCount');
    Result:=0;
   end;
 end;

// Use this funciton to unload the ICR library when you don't need it
procedure FreeICRLibrary;
 begin
  if (ICRLIB<>0) then
   begin
    FreeLibrary(ICRLIB);
    ICRLIB := 0;
   end;
 end;

end.
 