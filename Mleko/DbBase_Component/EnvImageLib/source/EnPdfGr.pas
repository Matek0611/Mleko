{----------------------------------------------------------------------------
|
| Library: Envision
|
| Module: EnPdfGr
|
| Description: TPdfGraphic descendant for PDF files.
|
| History: Dec 20, 2003. Francesco Pucino, first version
|
|---------------------------------------------------------------------------}
unit EnPdfGr;

{$I Envision.Inc}

interface

uses
    SysUtils,  { for Exception}
    Classes,   { for TStream }
    EnDiGrph;  { for TDibGraphic }

type

EPdfError = class(Exception);

TPdfGraphic = class(TDibGraphic)
protected
public
    function GetImageCount( const Stream : TStream ) : LongInt; override;
    procedure SingleLoadFromStream( const Stream      : TStream;
                                    const ImageToLoad : LongInt ); override;
    procedure SaveToStream(Stream: TStream); override;

    { Note AppendToStream is not efficient with PDF files. A new file is recreated
      on every call. MultiSaveToStream should be used intead to create
      multipage PDF files }
    procedure AppendToStream(Stream : TStream); override;

    procedure MultiSaveToStream( const Stream       : TStream;
                                 const ImageCount   : Integer;
                                 const OnGetGraphic : TGetGraphicMethod ); override;

end;


implementation

uses
    Windows,   { for TRect, ColorRef, PMaxLogPalette }
    Graphics,  { for TGraphic }
    EnMisc,    { for TImageFormat, DateToDateStr, TimeToTimeStr }
    EnMsg,     { for msgXXXX }
    EnTransf,  { for TImageFormatTransform }
    EnTifGr,   { for TTiffGraphic }
    EnJpgGr;   { for TJpegGraphic }


{$ifndef __Delphi6AndAbove}

function SameText( const S1 : String; const S2 : String ) : Boolean;
begin
    Result := (AnsiCompareText( S1, S2 ) = 0 );
end;

{$endif}    
{--------------------------------------------------------------------------}

type

      PTIFFHeader = ^TTIFFHeader;
      TTIFFHeader = packed record
   	Signature:word;
        Version:word;
        IFD:integer;
      end;

      PTIFFTag = ^TTIFFTag;
      TTIFFTag = packed record
	TagId:word;
        TagType:word;
        TagSize:integer;
        TagPosition:integer;
      end;

      PIFD = ^TIFD;
      TIFD = array [0..0] of TTIFFTag;

      TTiffDecoder=Class
      private
       FHeader:TTiffHeader;
       FStream:TStream;
       FStartPosition:Int64;
       FNeedToSwap:Boolean;
       FPagesCount:Integer;
       FCurrentIFD:PIFD;
       FCurrentTagCounter:Integer;
       procedure FixInt(Var Value:Integer);
       procedure FixWord(Var Value:Word);
       function FindTagIndex(TagId:Word):Integer;
      public
       constructor Create(SourceStream:TStream); virtual;

       { MB Feb 16, 2004 }
       destructor Destroy; override;

       function IsValidData:Boolean;
       function PagesCount:Integer;
       procedure SelectPage(PageIndex:Integer);
       function GetTagSize(TagId:Word):Integer;
       function GetTagPosition(TagId:Word):Integer;
       {$WARNINGS OFF}
       function GetTagData(TagId:Word;Buffer:Pointer;Size:Integer):Integer;
       {$WARNINGS ON}
      End;

     TTiffEncoder=Class
     private
       FStream:TStream;
       FStartPosition:Int64;
       FCurrentIFD:TList;
       FPagesCount:Integer;
     public
      constructor Create(DestStream:TStream); virtual;
      destructor Destroy; override;
      procedure PageBegin;
      procedure PageEnd;
      procedure WriteTagAsLong(TagId:Word;TagData:Integer);
      procedure WriteTagAsWord(TagId:Word;TagData:Word);
      property Stream:TStream read FStream;
     end;


  {$WARNINGS OFF}
  function Swap16(ASmallInt : word) : word ; register;
   asm  xchg al,ah  end ;

  function Swap32(value : dword) : dword ; assembler;
   asm  bswap eax  end ;
 {$WARNINGS ON

{--------------------------------------------------------------------------}

  constructor TTiffDecoder.Create(SourceStream:TStream);
   begin
    inherited Create;
    FStream:=SourceStream;
    FStartPosition:=FStream.Position;
    FStream.Read(FHeader,SizeOf(FHeader));
    FNeedToSwap:=FHeader.Signature=$4D4D;
    FixInt(FHeader.IFD);
    FPagesCount:=0;
    FCurrentIFD:=nil;
   end;

  destructor TTiffDecoder.Destroy;
  begin
      { MB Feb 2004 }
      if FCurrentIFD <> nil then
          {$WARNINGS OFF}
          FreeMem(FCurrentIFD);
          {$WARNINGS ON}

      inherited Destroy;
  end;

  function TTiffDecoder.IsValidData:Boolean;
   begin
    Result:=(FHeader.Signature=$4949) or (FHeader.Signature=$4D4D);
   end;

  procedure TTiffDecoder.FixInt(Var Value:Integer);
   begin
    if FNeedToSwap then Value:=Swap32(Value);
   end;

  procedure TTiffDecoder.FixWord(Var Value:Word);
   begin
    if FNeedToSwap then Value:=Swap16(Value);
   end;

  function TTiffDecoder.PagesCount:Integer;
   Var NextIFDPosition:Int64;
       TagCounter:Word;
       IFDSize:Integer;
       NewIFDPosition:Integer;
   begin
    if FPagesCount>0 then
     begin
      Result:=FPagesCount;
      Exit;
     end;
    FPagesCount:=0;
    NextIFDPosition:=FHeader.IFD;
    While NextIFDPosition>0 do
     begin
      FStream.Seek(FStartPosition+NextIFDPosition,soFromBeginning);
      FStream.Read(TagCounter,SizeOf(TagCounter));
      FixWord(TagCounter);
      IFDSize:=FCurrentTagCounter*SizeOf(TTiffTag);
      FStream.Seek(IFDSize,soFromCurrent);
      FStream.Read(NewIFDPosition,SizeOf(NewIFDPosition));
      FixInt(NewIFDPosition);
      if NewIFDPosition<>NextIFDPosition
       then NextIFDPosition:=NewIFDPosition
       else NextIFDPosition:=0;
      Inc(FPagesCount);
     end;
    Result:=FPagesCount;
   end;

  procedure TTiffDecoder.SelectPage(PageIndex:Integer);
   Var NextIFDPosition:Int64;
       TagCounter:Word;
       IFDSize:Integer;
       NewIFDPosition:Integer;
       CurrentPage:Integer;
       I:Integer;
   begin
     { MB Feb 16, 2004 }
     if FCurrentIFD <> nil then
     begin
         {$WARNINGS OFF}
         FreeMem(FCurrentIFD);
         {$WARNINGS ON}
         FCurrentIFD:=nil;
     end;
    CurrentPage:=0;
    NextIFDPosition:=FHeader.IFD;
    While NextIFDPosition>0 do
     begin
      FStream.Seek(FStartPosition+NextIFDPosition,soFromBeginning);
      FStream.Read(TagCounter,SizeOf(TagCounter));
      FixWord(TagCounter);
      // Calculate the size of IFD
      IFDSize:=TagCounter*SizeOf(TTiffTag);
      if CurrentPage=PageIndex then
       begin
      	FCurrentTagCounter:=TagCounter;
        {$WARNINGS OFF}
        GetMem(FCurrentIFD,IFDSize);
        FStream.Read(FCurrentIFD^,IFDSize);
        {$WARNINGS ON}
       	 for i:=0 to FCurrentTagCounter-1 do
         begin
         {$WARNINGS OFF}
         FixWord(FCurrentIFD^[i].TagId);
         FixWord(FCurrentIFD^[i].TagType);
         FixInt(FCurrentIFD^[i].TagSize);
         FixInt(FCurrentIFD^[i].TagPosition);
         {$WARNINGS ON}
        end;
        break;
       end
      else
       begin
        FStream.Seek(IFDSize,soFromCurrent);
       end;
      FStream.Read(NewIFDPosition,SizeOf(NewIFDPosition));
      FixInt(NewIFDPosition);
      if NewIFDPosition<>NextIFDPosition
       then NextIFDPosition:=NewIFDPosition
       else NextIFDPosition:=0;
      Inc(CurrentPage);
    end;
    if not assigned(FCurrentIFD) then raise Exception.Create(msgTIFFInvalidPageNumber);
   end;

   function TTiffDecoder.FindTagIndex(TagId:Word):Integer;
    Var I:Integer;
    begin
     Result:=-1;
     for I:=0 to FCurrentTagCounter-1 do
      {$WARNINGS OFF}
      if FCurrentIFD^[I].TagId=TagId then
      {$WARNINGS ON}
       begin
        Result:=I;
        Break;
       end;
    end;

   function TTiffDecoder.GetTagSize(TagId:Word):Integer;
    Var TagIndex:Integer;
    begin
     TagIndex:=FindTagIndex(TagId);
     //if TagIndex<0 then raise Exception.Create(Format(rsTIFFTagNotFound,[TagId]));
     //Result:=FCurrentIFD^[TagIndex].TagSize;
     if TagIndex<0
      then Result:=0
      {$WARNINGS OFF}
      else Result:=FCurrentIFD^[TagIndex].TagSize;
      {$WARNINGS ON}
    end;

   {$WARNINGS OFF}
   function TTiffDecoder.GetTagData(TagId:Word;Buffer:Pointer;Size:Integer):Integer;
   {$WARNINGS ON}
    Var TagIndex:Integer;
    begin
     TagIndex:=FindTagIndex(TagId);
     if TagIndex<0 then raise Exception.Create(Format(msgTIFFTagNotFound,[TagId]));
     {$WARNINGS OFF}
     FStream.Seek(FStartPosition+FCurrentIFD^[TagIndex].TagPosition,soFromBeginning);
     if Assigned(Buffer) then FStream.Read(Buffer^,FCurrentIFD^[TagIndex].TagSize);
     Result:=FCurrentIFD^[TagIndex].TagSize;
     {$WARNINGS ON}
    end;

   function TTiffDecoder.GetTagPosition(TagId:Word):Integer;
    Var TagIndex:Integer;
    begin
     TagIndex:=FindTagIndex(TagId);
     if TagIndex<0 then raise Exception.Create(Format(msgTIFFTagNotFound,[TagId]));
     {$WARNINGS OFF}
     Result:=FCurrentIFD^[TagIndex].TagPosition;
     {$WARNINGS ON}
    end;


   constructor TTiffEncoder.Create(DestStream:TStream);
    Var TifHeader:TTIFFHeader;
    begin
     inherited Create;
     FStream:=DestStream;
     FStartPosition:=DestStream.Position;
     // Dummy header , as place-holder
     DestStream.Write(TifHeader,SizeOf(TifHeader));
     FPagesCount:=0;
    end;

   destructor TTiffEncoder.Destroy;
    var i:integer;
    begin
     if Assigned(FCurrentIFD) then
      begin
       for i:=0 to FCurrentIFD.Count-1 do
        Dispose(FCurrentIFD[i]);
       FCurrentIFD.Free;
      end; 
    end;

   procedure TTiffEncoder.WriteTagAsLong(TagId:Word;TagData:Integer);
    var TempTag:PTIFFTAG;
   begin
    New(TempTag);
    {$WARNINGS OFF}
    TempTag^.TagId:=TagId;
    TempTag^.TagType:=4;
    TempTag^.TagSize:=1;
    TempTag^.TagPosition:=TagData;
    {$WARNINGS ON}
    FCurrentIFD.add(TempTag);
   end;

   procedure TTiffEncoder.WriteTagAsWord(TagId:Word;TagData:Word);
    var TempTag:PTIFFTAG;
   begin
    New(TempTag);
    {$WARNINGS OFF}
    TempTag^.TagId:=TagId;
    TempTag^.TagType:=3;
    TempTag^.TagSize:=1;
    TempTag^.TagPosition:=TagData;
    {$WARNINGS ON}
    FCurrentIFD.add(TempTag);
   end;

  procedure TTiffEncoder.PageBegin;
   begin
    FCurrentIFD:=TList.Create;
   end;

  procedure TTiffEncoder.PageEnd;
   Var IFDPosition:Int64;
       Filler:Byte;
       TotalTags,i:Word;
       TifHeader:TTIFFHeader;
   begin
    // Store staring IFD position
    IFDPosition:=FStream.Position;
    if (IFDPosition and 1)<>0 then
     begin
      inc(IFDPosition);	// allign to word
      Filler:=0;
      FStream.Write(Filler,1); // write a byte for filling
     end;
    // Write the IFD
    FStream.Position:=IFDPosition;
    // Write tag count
    TotalTags:=FCurrentIFD.Count;
    FStream.Write(TotalTags,2);
    // Write each tag
    for i:=0 to FCurrentIFD.Count-1 do
     begin
      {$WARNINGS OFF}
      FStream.Write(PTIFFTAG(FCurrentIFD[i])^ , sizeof(TTIFFTAG) );
      {$WARNINGS ON}
      Dispose(PTIFFTAG(FCurrentIFD[i]));
     end;
    FCurrentIFD.Free;
    FCurrentIFD:=nil;
    if FPagesCount=0 then
     begin
      // Write updated header
      TifHeader.Signature:=$4949;
      TifHeader.Version:=42;
      TifHeader.IFD:=IFDPosition;
      FStream.Position:=FStartPosition;
      FStream.Write(TifHeader,SizeOf(TifHeader));
     end;
    Inc(FPagesCount);
   end;

{--------------------------------------------------------------------------}

type

 TPDFObject=class
  StreamOffset:Int64;
  Index:Integer;
  Revision:Word;
 end;

 TPDFPage=class
  Index:Integer;
  MediaBox:TRect;
 end;

 TPDFParser=class
  FStream:TStream;
  FStartPos:Int64;
  FVersion:Double;
  FXREFOffset:Int64;
  FXRef:TList;
  FRootObjectId,
  FInfoObjectId:Integer;
  FPages:TList;
  constructor Create(Stream:TStream); virtual;
  procedure CheckHeader;
  procedure ReadXref;
  procedure ReadRoot;
  procedure ParsePageSection(PagesSectionId:Integer);
  procedure ParseCrossReferenceSection(StreamOffset:Int64);
  function GetObjectAsString(Id:Integer):String;
  function GetPageResources(Id:Integer):String;
  function GetFirstPageImage(Id:Integer):Integer;
  procedure GetStreamFromXObject(Source:String;DestStream:TStream);
  destructor Destroy; override;
  property Version:Double read FVersion;
  property XRefOffset:Int64 read FXREFOffset;
 end;

{--------------------------------------------------------------------------}

 function RemoveStartEndCRLF(Source:String):String;
 begin
  while Pos(Copy(Source,1,1),#10#13)>0 do Delete(Source,1,1);
  while Pos(Copy(Source,Length(Source),1),#10#13)>0 do Delete(Source,Length(Source),1);
  Result:=Source;
 end;

{--------------------------------------------------------------------------}

function GetSpaceSeparetdInteger(Source:String;Index:Integer=0):Integer;
 Var SpacePos:Integer;
     i:integer;
 begin
  Result:=0;
  i:=0;
  Repeat
   SpacePos:=Pos(' ',Source);
   if SpacePos=0 then SpacePos:=Length(Source)+1;
   if i=Index then
    begin
     Result:=StrToInt(Copy(Source,1,SpacePos-1));
     Break;
    end;
   Delete(Source,1,SpacePos);
   Inc(i);
  Until (i=Index) and (Length(Source)>0);
 end;

{--------------------------------------------------------------------------}

function ParameterIsReference(Source,Parameter:String):boolean;
 Var StartPos:Integer;
 begin
  StartPos:=Pos(Parameter,Source);
  if StartPos=0 then raise EPdfError.Create('Parameter not found !');
  Inc(StartPos,Length(Parameter));
  Result:=True;
  While Copy(Source,StartPos,1)<>'R' do
   begin
    if Pos(Copy(Source,StartPos,1),'0123456789 ')=0 then
     begin
      Result:=False;
      Break;
     end;
    Inc(StartPos);
   end;
 end;

{--------------------------------------------------------------------------}

function ParameterIsDictionary(Source,Parameter:String):boolean;
 Var StartPos:Integer;
 begin
  StartPos:=Pos(Parameter,Source);
  if StartPos=0 then raise EPdfError.Create('Parameter not found !');
  Inc(StartPos,Length(Parameter));
  While Copy(Source,StartPos,1)=' ' do Inc(StartPos);
  Result:=Copy(Source,StartPos,2)='<<';
 end;

{--------------------------------------------------------------------------}

function ParameterIsArray(Source,Parameter:String):boolean;
 Var StartPos:Integer;
 begin
  StartPos:=Pos(Parameter,Source);
  if StartPos=0 then raise EPdfError.Create('Parameter not found !');
  Inc(StartPos,Length(Parameter));
  While Copy(Source,StartPos,1)=' ' do Inc(StartPos);
  Result:=Copy(Source,StartPos,1)='[';
 end;

{--------------------------------------------------------------------------}

function RemoveObjectDelimiters(Source:String):String;
 var StartPos:Integer;
 begin
  StartPos:=Pos('obj',Source);
  Inc(StartPos,3);
  Result:=RemoveStartEndCRLF(Trim(Copy(Source,StartPos,Length(Source))));
  Delete(Result,Length(Result)-5,6);
 end;

{--------------------------------------------------------------------------}

function RemoveDictionaryDelimiters(Source:String):String;
 begin
  While Pos(Copy(Source,1,1),' <')>0 do Delete(Source,1,1);
  While Pos(Copy(Source,Length(Source),1),' >')>0 do Delete(Source,Length(Source),1);
  Result:=Source;
 end;

{--------------------------------------------------------------------------}

function GetArrayParameter(Source,Parameter:String):String;
 Var StartPos:Integer;
 begin
  StartPos:=Pos(Parameter,Source);
  if StartPos=0 then raise EPdfError.Create('Parameter not found !');
  Inc(StartPos,Length(Parameter));
  // Salta gli spazi
  While (StartPos<Length(Source)) and (Copy(Source,StartPos,1)<>'[') do Inc(StartPos);
  // Salta il primo carattere che DEVE essere "["
  Result:='';
  Inc(StartPos,1);
  While StartPos<=Length(Source) do
   begin
    if (Source[StartPos]=']') then break;
    Result:=Result+Source[StartPos];
    Inc(StartPos);
   end;
 end;

{--------------------------------------------------------------------------}

function GetReferenceParameter(Source,Parameter:String):String;
 Var StartPos:Integer;
 begin
  StartPos:=Pos(Parameter,Source);
  if StartPos=0 then raise EPdfError.Create('Parameter not found !');
  Inc(StartPos,Length(Parameter));
  While Copy(Source,StartPos,1)=' ' do Inc(StartPos);
  While StartPos<=Length(Source) do
   begin
    Result:=Result+Source[StartPos];
    if Source[StartPos]='R' then Break;
    Inc(StartPos);
   end;
 end;

{--------------------------------------------------------------------------}

function GetDictionaryParameter(Source,Parameter:String):String;
 Var StartPos:Integer;
     ToBeClosed:Integer;
 begin
  StartPos:=Pos(Parameter,Source);
  if StartPos=0 then raise EPdfError.Create('Parameter not found !');
  Inc(StartPos,Length(Parameter));
  // Skip spaces
  While (StartPos<Length(Source)) and (Copy(Source,StartPos,2)<>'<<') do Inc(StartPos);
  // Takes first two chars that should be "<<"
  Result:=Copy(Source,StartPos,2);
  Inc(StartPos,2);
  ToBeClosed:=2;
  if Result<>'<<' then raise EPdfError.Create('Parameter is not a dictionary !');
  While StartPos<=Length(Source) do
   begin
    Result:=Result+Source[StartPos];
    if (Source[StartPos]='>') then Dec(ToBeClosed);
    if (Source[StartPos]='<') then Inc(ToBeClosed);
    if ToBeClosed=0 then Break;
    Inc(StartPos);
   end;
 end;

{--------------------------------------------------------------------------}

function GetIntegerParameter(Source,Parameter:String):Integer;
 Var StartPos:Integer;
     TempStr:String;
 begin
  StartPos:=Pos(Parameter,Source);
  if StartPos=0 then raise EPdfError.Create('Parameter not found !');
  Inc(StartPos,Length(Parameter));
  TempStr:='';
  While Pos(Copy(Source,StartPos,1),'0123456789')=0 do Inc(StartPos);
  While Pos(Copy(Source,StartPos,1),'0123456789')>0 do
   begin
    TempStr:=TempStr+Copy(Source,StartPos,1);
    Inc(StartPos);
   end;
  Result:=StrToInt(TempStr);
 end;

{--------------------------------------------------------------------------}

function GetStringParameter(Source,Parameter:String):String;
 Var StartPos:Integer;
   begin
  StartPos:=Pos(Parameter,Source);
  if StartPos=0 then raise EPdfError.Create('Parameter not found !');
  Inc(StartPos,Length(Parameter));
  Result:='';
  While Copy(Source,StartPos,1)=' ' do Inc(StartPos);
  While StartPos<=Length(Source) do
   begin
    if Pos(Source[StartPos],' '#10#13)>0 then Break;
    Result:=Result+Source[StartPos];
    Inc(StartPos);
   end;
 end;

{--------------------------------------------------------------------------}

function GetSubString(Source,StartSeq,EndSeq:String):string;
 Var StartPos,i:Integer;
 begin
  Result:='';
  StartPos:=Pos(StartSeq,Source);
  if StartPos=0 then Exit;
  for i:=StartPos+Length(StartSeq) to Length(Source) do
   begin
    if Copy(Source,i,Length(EndSeq))=EndSeq then break;
    Result:=Result+Copy(Source,i,1);
   end;
 end;

{--------------------------------------------------------------------------}

procedure SkipCRLF(Stream:TStream);
 Var OldPos:Int64;
     TheChars:Array[0..1] of AnsiChar;
 begin
  // Save current position
  OldPos:=Stream.Position;
  // Read a character
  Stream.Read(TheChars,1);
  if Pos(TheChars,#13#10)>0 then Inc(OldPos);
  // Read a character
  Stream.Read(TheChars,1);
  if Pos(TheChars,#13#10)>0 then Inc(OldPos);
  // Set old position
  Stream.Position:=OldPos;
 end;

{--------------------------------------------------------------------------}

function NextStringIs(Stream:TStream;TheString:String):Boolean;
 Var Temp:String;
     OldPos:Int64;
 begin
  OldPos:=Stream.Position;
  SetLength(Temp,Length(TheString));
  {$WARNINGS OFF}
  if (Stream.Read(Temp[1],Length(TheString))<>Length(TheString)) or (TheString<>Temp) then
  {$WARNINGS ON}
   begin
    Result:=False;
    Stream.Position:=OldPos;
   end
  else Result:=True;
 end;

{--------------------------------------------------------------------------}

function ReadInteger(Stream:TStream):Integer;
 Var TheChar:Char;
     Numero:String;
 begin
  // Read a character
  Numero:='';
  Stream.Read(TheChar,1);
  // Skip initial spaces
  While TheChar=' ' do Stream.Read(TheChar,1);
  // Read until find numbers
  While Pos(TheChar,'0123456789')>0 do
   begin
    Numero:=Numero+TheChar;
    Stream.Read(TheChar,1);
   end;
  // Results the found number
  Result:=StrToInt(Numero);
 end;

{--------------------------------------------------------------------------}

function ReadLineUntil(Stream:TStream;StopSequence:String;StripCRLF:Boolean):String;
 Var ReadChar:Char;
     TempStopSeq:String;
 begin
  Result:='';
  TempStopSeq:='';
  While Stream.Read(ReadChar,1)=1 do
   begin
    if (not StripCRLF) or (StripCRLF and (Pos(ReadChar,#10#13)=0))
     then Result:=Result+ReadChar;
    TempStopSeq:=TempStopSeq+ReadChar;
    if Length(TempStopSeq)>Length(StopSequence) then Delete(TempStopSeq,1,1);
    if TempStopSeq=StopSequence then break;
   end;
 end;

{--------------------------------------------------------------------------}

function ReadChar(Stream:TStream;Chars:Integer):String;
 begin
  SetLength(Result,Chars);
  {$WARNINGS OFF}
  Stream.Read(Result[1],Chars);
  {$WARNINGS ON}
 end;

{--------------------------------------------------------------------------}

function ReadLine(Stream:TStream):String;
 Var ReadChar:Char;
     LineFound:Boolean;
 begin
  Result:='';
  LineFound:=False;
  While Stream.Read(ReadChar,1)=1 do
   begin
    if (Pos(ReadChar,#10)>0) then LineFound:=True else
     begin
      if LineFound then
       begin
        Stream.Position:=Stream.Position-1;
        Break;
       end
      else Result:=Result+ReadChar;
     end;
   end;
 end;

{--------------------------------------------------------------------------}

function ConsumeNextInteger(Var Source:String):Integer;
 Var TempStr:String;
 begin
  TempStr:='';
  // Skip spaces if any
  While (Length(Source)>0) and (Pos(Copy(Source,1,1),'0123456789')=0) do Delete(Source,1,1);
  While (Length(Source)>0) and (Pos(Copy(Source,1,1),'0123456789')>0) do
   begin
    TempStr:=TempStr+Copy(Source,1,1);
    Delete(Source,1,1);
   end;
  Result:=StrToInt(TempStr);
 end;

function ConsumeStringUp(Var Source:String;Sep:String):String;
 Var Position:Integer;
 begin
  Result:='';
  Position:=Pos(Sep,Source);
  if Position>0 then
   begin
    Result:=Copy(Source,1,Position+Length(Sep)-1);
    Delete(Source,1,Position+Length(Sep)-1);
   end;
 end;

{--------------------------------------------------------------------------}

constructor TPDFParser.Create(Stream:TStream);
 begin
  inherited Create;
  FStream:=Stream;
  FStartPos:=FStream.Position;
  FXREFOffset:=0;
  FVersion:=0.0;
  FXRef:=TList.Create;
  FPages:=TList.Create;
  FRootObjectId:=-1;
  FInfoObjectId:=-1;
 end;

{--------------------------------------------------------------------------}

destructor TPDFParser.Destroy;
 begin
  While FXRef.Count>0 do
   begin
    {$WARNINGS OFF}
    TPDFObject(FXRef[FXRef.Count-1]).Destroy;
    {$WARNINGS ON}
    FXRef.Delete(FXRef.Count-1);
   end;
  FXRef.Free;
  While FPages.Count>0 do
   begin
    {$WARNINGS OFF}
    TPDFPage(FPages[FPages.Count-1]).Destroy;
    {$WARNINGS ON}
    FPages.Delete(FPages.Count-1);
   end;
  FPages.Free;
  inherited Destroy;
 end;

{--------------------------------------------------------------------------}

function TPDFParser.GetFirstPageImage(Id:Integer):Integer;
 Var Resources,StringObject:String;
 begin
  Resources:=GetPageResources(Id);
  StringObject:=GetDictionaryParameter(Resources,'/XObject');
  StringObject:=Trim(RemoveDictionaryDelimiters(StringObject));
  StringObject:=GetSubString(StringObject,' ',' ');
  Result:=StrToInt(StringObject);
 end;

{--------------------------------------------------------------------------}

function TPDFParser.GetPageResources(Id:Integer):String;
 Var StringObject,Parameter:String;
 begin
  StringObject:=GetObjectAsString(Id);
  // Check if its an indirect object
  if not ParameterIsDictionary(StringObject,'/Resources') then
   begin
    // Find object id
    Parameter:=GetReferenceParameter(StringObject,'/Resources');
    // Find dictionary
    StringObject:=GetObjectAsString(ConsumeNextInteger(Parameter));
    Result:=GetDictionaryParameter(StringObject,'obj');
   end
  else Result:=GetDictionaryParameter(StringObject,'/Resources');
 end;

{--------------------------------------------------------------------------}

procedure TPDFParser.CheckHeader;
 {$WARNINGS OFF}
 Var Buffer:PChar;
 {$WARNINGS ON}
     IdPosition:Integer;
     OldPos:Int64;
 begin
  OldPos:=FStream.Position;
  try
   FStream.Position:=FStartPos;
   {$WARNINGS OFF}
   GetMem(Buffer,1024);
   {$WARNINGS ON}
   try
    {$WARNINGS OFF}
    FStream.Read(Buffer^,1024);
    IdPosition:=Pos('%PDF-',String(Buffer));
    if IdPosition<=0 then raise EPdfError.Create('Invalid PDF stream: header not found !');
    FVersion:=StrToInt(Buffer[IdPosition+4])+StrToInt(Buffer[IdPosition+6])/10;
    {$WARNINGS ON}
   finally
    {$WARNINGS OFF}
    FreeMem(Buffer);
    {$WARNINGS ON}
   end;
  finally
   FStream.Position:=OldPos;
  end;
 end;

{--------------------------------------------------------------------------}

procedure TPDFParser.ParseCrossReferenceSection(StreamOffset:Int64);
 Var StringLine,ParameterString:String;
     NextObjectIndex,TotalObjects,i:integer;
     PDFObject:TPDFObject;
 begin
  // Set position to start of xref
  FStream.Position:=StreamOffset;
  if not NextStringIs(FStream,'xref') then  raise EPdfError.Create('Invalid PDF stream: "xref" not found !');
  // Skip CRLF after "xref"
  SkipCRLF(FStream);
  while not NextStringIs(FStream,'trailer') do
   begin
    // Read first number
    NextObjectIndex:=ReadInteger(FStream);
    // Read second number
    TotalObjects:=ReadInteger(FStream);
    // Skip CRLF after the two numbers
    SkipCRLF(FStream);
    // Read objects
    for i:=0 to TotalObjects-1 do
     begin
      // Read line with object
      StringLine:=RemoveStartEndCRLF(ReadLine(FStream));
      // Create the object in memory
      PDFObject:=TPDFObject.Create;
      // Save the offset
      PDFObject.StreamOffset:=StrToInt(Copy(StringLine,1,10));
      // Save the version
      PDFObject.Revision:=StrToInt(Copy(StringLine,12,5));
      // Save the index
      PDFObject.Index:=NextObjectIndex;
      // Add the object to the list
      FXRef.Add(PDFObject);
      // Increase index
      Inc(NextObjectIndex);
     end;
   end;
   // Skip CRLF after "trailer"
   SkipCRLF(FStream);
   // Read the trailer
   StringLine:=ReadLineUntil(FStream,'>>',True);
   // Check if trailer has a /Parent and read it in recursive mode
   ParameterString:=GetSubString(StringLine,'/Prev ',' ');
   if Length(ParameterString)>0 then ParseCrossReferenceSection(StrToInt(ParameterString));
   // Get the object /Root
   ParameterString:=GetSubString(StringLine,'/Root ',' R');
   if Length(ParameterString)>0 then FRootObjectId:=GetSpaceSeparetdInteger(ParameterString,0);
   // Get the object  /Info
   ParameterString:=GetSubString(StringLine,'/Info ',' R');
   if Length(ParameterString)>0 then FInfoObjectId:=GetSpaceSeparetdInteger(ParameterString,0);
   // Get the total of objects  /Size and check if all was read
   //ParameterString:=GetSubString(StringLine,'/Size ','/');
   //if StrToInt(ParameterString)<>FXRef.Count then raise EPdfError.Create('Invalid Objects Count !');
 end;

{--------------------------------------------------------------------------}

procedure TPDFParser.ReadXREF;
 Var Buffer:String;
     EOFPosition,STARTXREFPosition:Integer;
     OldPos:Int64;
     i:integer;
 begin
  OldPos:=FStream.Position;
  try
   FStream.Position:=FStream.Size-1024;
   SetLength(Buffer,1024);
   try
    {$WARNINGS OFF}
    FStream.Read(Buffer[1],1024);
    {$WARNINGS ON}
    EOFPosition:=Pos('%%EOF',Buffer);
    if EOFPosition<=0 then raise EPdfError.Create('Invalid PDF stream: EOF not found !');
    // Search the startxref keyword
    for i:=EOFPosition-1 downto 1 do
     begin
      STARTXREFPosition:=Pos('startxref',Copy(Buffer,i,Length(Buffer)));
      if STARTXREFPosition>0 then
       begin
        Inc(STARTXREFPosition,i);
        FXREFOffset:=StrToInt(RemoveStartEndCRLF(Trim(Copy(Buffer,(STARTXREFPosition+9),EOFPosition-(STARTXREFPosition+9)))));
        break;
       end;
     end;
    if FXREFOffset=0 then raise EPdfError.Create('Invalid PDF stream: XREF offset not found !');
    // Read all the XREF section starting from the first
    ParseCrossReferenceSection(FXREFOffset);
   finally
    SetLength(Buffer,0);
   end;
  finally
   FStream.Position:=OldPos;
  end;
 end;

{--------------------------------------------------------------------------}

procedure TPDFParser.ReadRoot;
 Var StringLine,ParameterString:String;
     PagesObjectId:Integer;
 begin
  // Read the root object
  StringLine:=GetObjectAsString(FRootObjectId);
  // Get the object /Pages
  ParameterString:=GetSubString(StringLine,'/Pages ',' R');
  PagesObjectId:=GetSpaceSeparetdInteger(ParameterString,0);
  ParsePageSection(PagesObjectId);
 end;

{--------------------------------------------------------------------------}

procedure TPDFParser.ParsePageSection(PagesSectionId:Integer);
 Var KidsString,PageString,StringLine,ParameterString:String;
     //TotalPages,
     PageIndex:Integer;
     PDFPage:TPDFPage;
     DefaultMediaBox:TRect;
 begin
  // Read the pages tree object
  StringLine:=GetObjectAsString(PagesSectionId);
  // Get the default /mediabox , inherited from all childs
  ParameterString:=GetSubString(StringLine,'/MediaBox [',']');
  if Length(ParameterString)>0 then
   begin
    DefaultMediaBox.Left:=ConsumeNextInteger(ParameterString);
    DefaultMediaBox.Top:=ConsumeNextInteger(ParameterString);
    DefaultMediaBox.Right:=ConsumeNextInteger(ParameterString);
    DefaultMediaBox.Bottom:=ConsumeNextInteger(ParameterString);
   end;
  // Find the "/Count " entry
  //TotalPages:=GetIntegerParameter(StringLine,'/Count');
  // Find the "/Kids" entry
  KidsString:=Trim(GetSubString(StringLine,'/Kids [',']'));
  PageString:=Trim(ConsumeStringUp(KidsString,' R'));
  while Length(PageString)>0 do
   begin
    // Checki if its a page or a node
    PageIndex:=GetSpaceSeparetdInteger(PageString,0);
    StringLine:=GetObjectAsString(PageIndex);
    if Pos('/Pages',StringLine)>0 then ParsePageSection(PageIndex) else
     begin
      PDFPage:=TPDFPage.Create;
      PDFPage.Index:=PageIndex;
      PDFPage.MediaBox:=DefaultMediaBox;
      // Get the  /mediabox always required
      ParameterString:=GetSubString(StringLine,'/MediaBox [',']');
      if Length(ParameterString)>0 then
       begin
        PDFPage.MediaBox.Left:=ConsumeNextInteger(ParameterString);
        PDFPage.MediaBox.Top:=ConsumeNextInteger(ParameterString);
        PDFPage.MediaBox.Right:=ConsumeNextInteger(ParameterString);
        PDFPage.MediaBox.Bottom:=ConsumeNextInteger(ParameterString);
       end;
      {$WARNINGS OFF}
      FPages.Add(Pointer(PDFPage));
      {$WARNINGS ON}
     end;
    PageString:=Trim(ConsumeStringUp(KidsString,' R'));
   end;
 end;

{--------------------------------------------------------------------------}

procedure TPDFParser.GetStreamFromXObject(Source:String;DestStream:TStream);
 Var StartPos,StreamLen:Integer;
     Parameter:String;
 begin
  StartPos:=Pos('stream',Source);
  if StartPos=0 then raise EPdfError.Create('Stream not found !');
  Inc(StartPos,6);
  if Source[StartPos]=#$0D then Inc(StartPos,2) else Inc(StartPos,1);
  // Check if parameter /length is "R"
  if ParameterIsReference(Source,'/Length') then
   begin
    // Get the object id "integer" with lenght
    Parameter:=GetReferenceParameter(Source,'/Length');
    // Get the integer
    Parameter:=GetObjectAsString(ConsumeNextInteger(Parameter));
    Parameter:=Trim(RemoveObjectDelimiters(Parameter));
    StreamLen:=StrToInt(Parameter);
   end
  else StreamLen:=GetIntegerParameter(Source,'/Length');
  {$WARNINGS OFF}
  DestStream.Write(Source[StartPos],StreamLen);
  {$WARNINGS ON}
 end;

{--------------------------------------------------------------------------}

function TPDFParser.GetObjectAsString(Id:Integer):String;
 Var i:Integer;
 begin
  Result:='';
  {$WARNINGS OFF}
  for i:=0 to FXRef.Count-1 do
   if TPDFObject(FXRef[i]).Index=Id then
    begin
     if TPDFObject(FXRef[i]).StreamOffset=0 then raise EPdfError.Create('Invalid PDF stream: object offset '+IntToStr(Id)+' not valid !');
     FStream.Position:=TPDFObject(FXRef[i]).StreamOffset;
     Result:=ReadLineUntil(FStream,'endobj',False);
     break;
    end;
   {$WARNINGS ON}
 end;

{--------------------------------------------------------------------------}

function TPdfGraphic.GetImageCount( const Stream : TStream ) : LongInt;
 Var PDFParser:TPDFParser;
 begin
   PDFParser:=TPDFParser.Create(Stream);
   try
    PDFParser.CheckHeader;
    PDFParser.ReadXREF;
    PDFParser.ReadRoot;
    Result:=PDFParser.FPages.Count;
   finally
    PDFParser.Free;
   end;
 end;

{--------------------------------------------------------------------------}

procedure CreateTIFFStream(InputStream:TMemoryStream;OutputStream:TStream;ImageWidth,ImageHeight,ImageDepth,ImageCompression:Integer);
 Var CurrentPosition:Integer;
     TiffEncoder:TTiffEncoder;
begin
 TiffEncoder:=TTiffEncoder.Create(OutputStream);
 try
  TiffEncoder.PageBegin;
  // Define all tags to write
  TiffEncoder.WriteTagAsLong(256,ImageWidth);
  TiffEncoder.WriteTagAsLong(257,ImageHeight);
  if ImageDepth=1 then
   begin
    TiffEncoder.WriteTagAsWord(258,1); // BitsPerSample: 1 bit x sample
    TiffEncoder.WriteTagAsWord(277,1); // SamplesPerPixel: 1 sample x pixel
    TiffEncoder.WriteTagAsWord(262,0); // PhotometricInterpretation=0 (0=white)
   end else
  if ImageDepth=4 then
   begin
    TiffEncoder.WriteTagAsWord(258,4); // BitsPerSample: 1 bit x sample
    TiffEncoder.WriteTagAsWord(277,1); // SamplesPerPixel: 1 sample x pixel
    TiffEncoder.WriteTagAsWord(262,3); // PhotometricInterpretation=3 Palette
   end else
  if ImageDepth=8 then
   begin
    TiffEncoder.WriteTagAsWord(258,8); // BitsPerSample: 1 bit x sample
    TiffEncoder.WriteTagAsWord(277,1); // SamplesPerPixel: 1 sample x pixel
    TiffEncoder.WriteTagAsWord(262,0); // PhotometricInterpretation=0 (0=white)
   end else
  if ImageDepth=24 then
   begin
    TiffEncoder.WriteTagAsWord(258,8); // BitsPerSample: 1 bit x sample
    TiffEncoder.WriteTagAsWord(277,3); // SamplesPerPixel: 1 sample x pixel
    TiffEncoder.WriteTagAsWord(262,2); // PhotometricInterpretation=2 RGB
   end;
  TiffEncoder.WriteTagAsWord(259,ImageCompression);  //ImageCompression); // Compression
  TiffEncoder.WriteTagAsWord(266,1); // Fill Order
  // Get the position where to place the strip
  CurrentPosition:=TiffEncoder.Stream.Position;
  // Insert the compressed strip
  TiffEncoder.WriteTagAsLong(273,CurrentPosition); // StripOffsets: just one strip
  {$WARNINGS OFF}
  TiffEncoder.Stream.Write(InputStream.Memory^,InputStream.Size);
  {$WARNINGS ON}
  TiffEncoder.WriteTagAsLong(278,ImageHeight);  // RowsPerStrip: the full height
  TiffEncoder.WriteTagAsLong(279,OutputStream.Position-CurrentPosition); // Size of the strip in bytes
  TiffEncoder.WriteTagAsLong(279,InputStream.Size); // Size of the strip in bytes
  TiffEncoder.WriteTagAsWord(292,0);
  TiffEncoder.PageEnd;
 finally
  TiffEncoder.Free;
 end;
end;

{--------------------------------------------------------------------------}

procedure CreateJPEGFile(InputStream:TMemoryStream;OutputStream:TStream;ImageWidth,ImageHeight,ImageDepth:Integer);
 begin
  OutputStream.CopyFrom(InputStream,InputStream.Size)
 end;

{--------------------------------------------------------------------------}

procedure TPdfGraphic.SingleLoadFromStream( const Stream : TStream; const ImageToLoad : LongInt);
 Var PDFParser:TPDFParser;
     IdImage:Integer;
     ImageObject,ColorSpace,Filter:String;
     ImageWidth,ImageHeight,ImageDepth,ImageCompression,XDPI,YDPI:Integer;
     Raw,FileStream:TMemoryStream;
     TiffObj:TTiffGraphic;
     JpegObj:TJpegGraphic;
 begin
   PDFParser:=TPDFParser.Create(Stream);
   try
    PDFParser.CheckHeader;
    PDFParser.ReadXREF;
    PDFParser.ReadRoot;
    if ImageToLoad<=PDFParser.FPages.Count then
     begin
      // Get the first image resource from page
      {$WARNINGS OFF}
      IdImage:=PDFParser.GetFirstPageImage(TPDFPage(PDFParser.FPages[ImageToLoad-1]).Index);
      {$WARNINGS ON}
      // Get the object as string
      ImageObject:=PDFParser.GetObjectAsString(IdImage);
      // Find sizes and other parameters
      ImageWidth:=GetIntegerParameter(ImageObject,'/Width');
      ImageHeight:=GetIntegerParameter(ImageObject,'/Height');
      ImageDepth:=GetIntegerParameter(ImageObject,'/BitsPerComponent');
      ColorSpace:=GetStringParameter(ImageObject,'/ColorSpace');
      if SameText(ColorSpace,'/DeviceRGB') then ImageDepth:=ImageDepth*3;
      ImageCompression:=1;
      try
       if ParameterIsArray(ImageObject,'/Filter')
        then Filter:=GetArrayParameter(ImageObject,'/Filter')
        else Filter:=GetStringParameter(ImageObject,'/Filter');
       if SameText(Filter,'/CCITTFaxDecode') then
        begin
         ImageCompression:=4;
         //ImageCompression:=4; G3
        end;
       if SameText(Filter,'/FlateDecode') then ImageCompression:=32946;
       if SameText(Filter,'/DCTDecode') then ImageCompression:=7;
       if SameText(Filter,'/RunLengthDecode') then ImageCompression:=32773;
      except
       ImageCompression:=1; // Nessuna compressione
      end;
      // Calculate resolution
      {$WARNINGS OFF}
      XDPI:=Round(ImageWidth/(TPDFPage(PDFParser.FPages[ImageToLoad-1]).MediaBox.Right/72));
      YDPI:=Round(ImageHeight/(TPDFPage(PDFParser.FPages[ImageToLoad-1]).MediaBox.Bottom/72));
      {$WARNINGS ON}
      // Get the object stream
      Raw:=TMemoryStream.Create;
      try
       PDFParser.GetStreamFromXObject(ImageObject,Raw);
       //Raw.SaveToFile('c:\test.txt');
       Raw.Position:=0;
       FileStream:=TMemoryStream.Create;
       try
        if ImageCompression<>7 then
         begin
          CreateTIFFStream(Raw,FileStream,ImageWidth,ImageHeight,ImageDepth,ImageCompression);
          FileStream.Position:=0;
          TiffObj:=TTiffGraphic.Create;
          try
           TiffObj.OnReadWriteProgress := Self.FOnReadWriteProgress;
           TiffObj.LoadFromStream(FileStream);
           Self.Assign(TiffObj);
          finally
           TiffObj.Free;
          end;
         end
        else
         begin
          CreateJPEGFile(Raw,FileStream,ImageWidth,ImageHeight,ImageDepth);
          FileStream.Position:=0;
          JpegObj:=TJpegGraphic.Create;
          try
           JpegObj.OnReadWriteProgress := Self.FOnReadWriteProgress;
           JpegObj.LoadFromStream(FileStream);
           Self.Assign(JpegObj);
          finally
           JpegObj.Free;
          end;
         end;
        Self.XDotsPerInch:=XDPI;
        Self.YDotsPerInch:=YDPI;
       finally
        FileStream.Free;
       end;
      finally
       Raw.Free;
      end;
     end;
   finally
    PDFParser.Free;
   end;
 end;

{--------------------------------------------------------------------------}

function EscapeString(TheString: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(TheString) do
    case TheString[I] of
      '(': Result := Result + '\(';
      ')': Result := Result + '\)';
      '\': Result := Result + '\\';
      #13: Result := result + '\r';
    else Result := Result + chr(Ord(TheString[i]));
    end;
end;

{--------------------------------------------------------------------------}

procedure TextToStream(Stream:TStream; TheString:String;LineBreak:Boolean = true);
var
  CRLF:String;
begin
  {$WARNINGS OFF}
  Stream.Write(TheString[1], Length(TheString));
  {$WARNINGS ON}
  if LineBreak then
   begin
    CRLF:=#13#10;
    {$WARNINGS OFF}
    Stream.Write(CRLF[1],2)
    {$WARNINGS ON}
   end;
end;

{--------------------------------------------------------------------------}

function IntToStrZeroPadded(TheID, Digits: Integer): string;
begin
  Result:=IntToStr(TheID);
  While Length(Result)<Digits do Result:='0'+Result;
end;

{--------------------------------------------------------------------------}

function FormatFloat(TheValue: Extended): string;
var OldSep:Char;
begin
  OldSep := DecimalSeparator;
  DecimalSeparator := '.';
  try
   Result := SysUtils.FormatFloat('0.####', TheValue);
  finally
   DecimalSeparator := OldSep;
  end;
end;

{--------------------------------------------------------------------------}

procedure SavePDFInfo(Stream:TStream;PDFObjects:TList;ObjectId:Integer);
 begin
  {$WARNINGS OFF}
  PDFObjects[ObjectId]:=Pointer(Stream.Position);
  {$WARNINGS ON}
  TextToStream(Stream,IntToStr(ObjectId) + ' 0 obj');
  TextToStream(Stream,'<<', False);
  TextToStream(Stream,'/Creator (TPdfGraphic)');
  TextToStream(Stream,'/CreationDate (' + EscapeString('D:' + FormatDateTime('yyyymmddhhnnss', Now)) + ')');
  TextToStream(Stream,'/Producer (Envision Image Library)');
  TextToStream(Stream,'/Author ()');
  TextToStream(Stream,'/Title ()');
  TextToStream(Stream,'/Subject ()');
  TextToStream(Stream,'/Keywords ()');
  TextToStream(Stream,'>>');
  TextToStream(Stream,'endobj');
 end;

{--------------------------------------------------------------------------}

procedure SavePDFPagesList(Stream:TStream;PDFObjects:TList;ObjectId:Integer;PageId:Array of Integer);
 Var Page:integer;
 begin
  {$WARNINGS OFF}
  PDFObjects[ObjectId]:=Pointer(Stream.Position);
  {$WARNINGS ON}
  TextToStream(Stream,IntToStr(ObjectId) + ' 0 obj');
  TextToStream(Stream,'<<', False);
  TextToStream(Stream,'/Type /Pages');
  TextToStream(Stream,'/Kids [');
  for Page:=Low(PageId) to High(PageId) do
   TextToStream(Stream,IntToStr(PageId[Page]) + ' 0 R');
  TextToStream(Stream,']');
  TextToStream(Stream,'/Count '+IntToStr(High(PageId)-Low(PageId)+1));
  TextToStream(Stream,'>>');
  TextToStream(Stream,'endobj');
 end;

{--------------------------------------------------------------------------}

procedure SavePDFPage(Stream:TStream;PDFObjects:TList;ObjectId:Integer;PagesID,ResourceID,ContentID,w72,h72:Integer);
 begin
  {$WARNINGS OFF}
  PDFObjects[ObjectId]:=Pointer(Stream.Position);
  {$WARNINGS ON}
  TextToStream(Stream,IntToStr(ObjectId) + ' 0 obj');
  TextToStream(Stream,'<<', False);
  TextToStream(Stream,'/Type /Page');
  TextToStream(Stream,'/Parent ' + IntToStr(PagesId) + ' 0 R');
  TextToStream(Stream,'/Resources ' + IntToStr(ResourceID) + ' 0 R');
  TextToStream(Stream,'/Contents [' + IntToStr(ContentID) + ' 0 R]');
  TextToStream(Stream,'/MediaBox [0 0 ' + IntToStr(w72) + ' ' + IntToStr(h72) + ']');
  TextToStream(Stream,'>>');
  TextToStream(Stream,'endobj');
 end;

{--------------------------------------------------------------------------}

procedure SavePDFResource(Stream:TStream;PDFObjects:TList;ObjectId:Integer;ImageID:Integer);
 begin
  {$WARNINGS OFF}
  PDFObjects[ObjectId]:=Pointer(Stream.Position);
  {$WARNINGS ON}
  TextToStream(Stream,IntToStr(ObjectId) + ' 0 obj');
  TextToStream(Stream,'<<', False);
  TextToStream(Stream,' /XObject << /Im'+IntToStr(ImageId)+' '+IntToStr(ImageId)+' 0 R >>');
  TextToStream(Stream,'/Font << >>');
  TextToStream(Stream,'>>');
  TextToStream(Stream,'endobj');
 end;

{--------------------------------------------------------------------------}

procedure SavePDFContent(Stream:TStream;PDFObjects:TList;ObjectId:Integer;ContentStr:String);
 begin
  {$WARNINGS OFF}
  PDFObjects[ObjectId]:=Pointer(Stream.Position);
  {$WARNINGS ON}
  TextToStream(Stream,IntToStr(ObjectId) + ' 0 obj');
  TextToStream(Stream,'<<', False);
  TextToStream(Stream,'/Length '+IntToStr(Length(ContentStr)));
  TextToStream(Stream,'>>');
  TextToStream(Stream,'stream');
  TextToStream(Stream,ContentStr);
  TextToStream(Stream,'endstream');
  TextToStream(Stream,'endobj');
 end;

{--------------------------------------------------------------------------}

procedure SavePDFCatalog(Stream:TStream;PDFObjects:TList;ObjectId:Integer;PagesID:Integer);
 begin
  {$WARNINGS OFF}
  PDFObjects[ObjectId]:=Pointer(Stream.Position);
  {$WARNINGS ON}
  TextToStream(Stream,IntToStr(ObjectId) + ' 0 obj');
  TextToStream(Stream,'<<',False);
  TextToStream(Stream,'/Type /Catalog');
  TextToStream(Stream,'/Pages ' + IntToStr(PagesID) + ' 0 R');
  TextToStream(Stream,'/PageLayout /SinglePage');
  TextToStream(Stream,'/PageMode /UseNone');
  TextToStream(Stream,'>>');
  TextToStream(Stream,'endobj');
 end;

{--------------------------------------------------------------------------}

procedure SavePDFImage(Stream:TStream;PDFObjects:TList;ObjectId:Integer;Image:TDibGraphic;WithProgress:Boolean);
 Var CompressedStream,TempStream:TMemoryStream;
     FilterInfo:String;
     TiffObj:TTiffGraphic;
     JpegObj:TJpegGraphic;
     TiffDecoder:TTiffDecoder;
     DataSize,DataOffset:Integer;
     FormatTransform:TImageFormatTransform;
     TempImage:TDibGraphic;

     procedure SaveGray256(const Image : TDibGraphic);
      begin
       TextToStream(Stream,'/BitsPerComponent 8');
       TextToStream(Stream,'/ColorSpace /DeviceGray');
       FilterInfo:='/DCTDecode';
       JpegObj:=TJpegGraphic.Create;
       try
        JpegObj.Assign(Image);
        if WithProgress then
            Image.OnReadWriteProgress := JpegObj.OnReadWriteProgress;
        JpegObj.SaveToStream(CompressedStream);
       finally
        JpegObj.Free;
       end;
      end;

    procedure SaveTrueColor(const Image : TDibGraphic);
    begin
     TextToStream(Stream,'/BitsPerComponent 8');
     TextToStream(Stream,'/ColorSpace /DeviceRGB');
     FilterInfo:='/DCTDecode';
     JpegObj:=TJpegGraphic.Create;
     try
      JpegObj.Assign(Image);
      if WithProgress then
          Image.OnReadWriteProgress := JpegObj.OnReadWriteProgress;
      JpegObj.SaveToStream(CompressedStream);
     finally
      JpegObj.Free;
     end;
    end;

 begin
  {$WARNINGS OFF}
  PDFObjects[ObjectId]:=Pointer(Stream.Position);
  {$WARNINGS ON}
  TextToStream(Stream,IntToStr(ObjectId) + ' 0 obj');
  TextToStream(Stream,'<<', False);
  TextToStream(Stream,'/Type /XObject');
  TextToStream(Stream,'/Subtype /Image');
  TextToStream(Stream,'/Name /Im'+IntToStr(ObjectId));
  TextToStream(Stream,'/Width '+IntToStr(Image.Width));
  TextToStream(Stream,'/Height '+IntToStr(Image.Height));
  CompressedStream:=TMemoryStream.Create;
  try
   Case Image.ImageFormat of
    ifBlackWhite:
    begin
     TextToStream(Stream,'/BitsPerComponent 1');
     TextToStream(Stream,'/ColorSpace /DeviceGray');
     FilterInfo:='[/CCITTFaxDecode] /DecodeParms[<< /Columns '+IntToStr(Image.Width)+' /Rows '+IntToStr(Image.Height)+' /K -1 >>]';
     TempStream:=TMemoryStream.Create;
     try
      TiffObj:=TTiffGraphic.Create;
      try
       TiffObj.Assign(Image);
       TiffObj.Compression:=tcGroup4;
       TiffObj.RowsPerStrip:=Image.Height;
       if WithProgress then
           Image.OnReadWriteProgress := TiffObj.OnReadWriteProgress;
       TiffObj.SaveToStream(TempStream);
      finally
       TiffObj.Free;
      end;
      TempStream.Position:=0;
      TiffDecoder:=TTiffDecoder.Create(TempStream);
      try
       TiffDecoder.SelectPage(0);
       DataOffset:=TiffDecoder.GetTagPosition(273);
       DataSize:=TiffDecoder.GetTagPosition(279);
       TempStream.Position:=DataOffset;
       CompressedStream.CopyFrom(TempStream,DataSize);
      finally
       TiffDecoder.Free;
      end;
     finally
      TempStream.Free;
     end;
    end;
    ifGray16:
    begin
     { MB Apr 25 Saving with palette does not work convert to gray 256
     TextToStream(Stream,'/BitsPerComponent 4');
     TextToStream(Stream,'/ColorSpace /DeviceGray');
     FilterInfo:='/FlateDecode';
     TempStream:=TMemoryStream.Create;
     try
      TiffObj:=TTiffGraphic.Create;
      try
       TiffObj.Assign(Image);
       TiffObj.Compression:=tcZLib;
       TiffObj.RowsPerStrip:=Image.Height;
       if WithProgress then
           Image.OnReadWriteProgress := TiffObj.OnReadWriteProgress;
       TiffObj.SaveToStream(TempStream);
      finally
       TiffObj.Free;
      end;
      TempStream.Position:=0;
      TiffDecoder:=TTiffDecoder.Create(TempStream);
      try
       TiffDecoder.SelectPage(0);
       DataOffset:=TiffDecoder.GetTagPosition(273);
       DataSize:=TiffDecoder.GetTagPosition(279);
       TempStream.Position:=DataOffset;
       CompressedStream.CopyFrom(TempStream,DataSize);
      finally
       TiffDecoder.Free;
      end;
     finally
      TempStream.Free;
     end;
     }
     FormatTransform := TImageFormatTransform.Create;
     TempImage       := TDibGraphic.Create;
     try
         FormatTransform.ImageFormat := ifGray256;
         FormatTransform.ApplyOnDest(Image,TempImage);
         SaveGray256(TempImage);
     finally
         TempImage.Free;
         FormatTransform.Free;
     end;

    end;
    ifGray256: SaveGray256(Image);
    ifColor16:
    begin
     { MB Apr 25 Saving with palette does not work convert to true color
     TextToStream(Stream,'/BitsPerComponent 4');
     TextToStream(Stream,'/ColorSpace /DevicePalette');
     FilterInfo:='/FlateDecode';
     TempStream:=TMemoryStream.Create;
     try
      TiffObj:=TTiffGraphic.Create;
      try
       TiffObj.Assign(Image);
       TiffObj.Compression:=tcZLib;
       TiffObj.RowsPerStrip:=Image.Height;
       if WithProgress then
           Image.OnReadWriteProgress := TiffObj.OnReadWriteProgress;
       TiffObj.SaveToStream(TempStream);
      finally
       TiffObj.Free;
      end;
      TempStream.Position:=0;
      TiffDecoder:=TTiffDecoder.Create(TempStream);
      try
       TiffDecoder.SelectPage(0);
       DataOffset:=TiffDecoder.GetTagPosition(273);
       DataSize:=TiffDecoder.GetTagPosition(279);
       TempStream.Position:=DataOffset;
       CompressedStream.CopyFrom(TempStream,DataSize);
      finally
       TiffDecoder.Free;
      end;
     finally
      TempStream.Free;
     end;
     }
     FormatTransform := TImageFormatTransform.Create;
     TempImage       := TDibGraphic.Create;
     try
         FormatTransform.ImageFormat := ifTrueColor;
         FormatTransform.ApplyOnDest(Image,TempImage);
         SaveTrueColor(TempImage);
     finally
         TempImage.Free;
         FormatTransform.Free;
     end;

    end;
    ifColor256:
    begin
     { MB Apr 25 Saving with palette does not work convert to true color
     TextToStream(Stream,'/BitsPerComponent 8');
     TextToStream(Stream,'/ColorSpace /DevicePalette');
     FilterInfo:='/FlateDecode';
     TempStream:=TMemoryStream.Create;
     try
      TiffObj:=TTiffGraphic.Create;
      try
       TiffObj.Assign(Image);
       TiffObj.Compression:=tcZLib;
       TiffObj.RowsPerStrip:=Image.Height;
       if WithProgress then
           Image.OnReadWriteProgress := TiffObj.OnReadWriteProgress;
       TiffObj.SaveToStream(TempStream);
      finally
       TiffObj.Free;
      end;
      TempStream.Position:=0;
      TiffDecoder:=TTiffDecoder.Create(TempStream);
      try
       TiffDecoder.SelectPage(0);
       DataOffset:=TiffDecoder.GetTagPosition(273);
       DataSize:=TiffDecoder.GetTagPosition(279);
       TempStream.Position:=DataOffset;
       CompressedStream.CopyFrom(TempStream,DataSize);
      finally
       TiffDecoder.Free;
      end;
     finally
      TempStream.Free;
     end;
     }
     FormatTransform := TImageFormatTransform.Create;
     TempImage       := TDibGraphic.Create;
     try
         FormatTransform.ImageFormat := ifTrueColor;
         FormatTransform.ApplyOnDest(Image,TempImage);
         SaveTrueColor(TempImage);
     finally
         TempImage.Free;
         FormatTransform.Free;
     end;

    end;

    ifTrueColor:SaveTrueColor(Image);

   end; { case }
   TextToStream(Stream,'/Length '+IntToStr(CompressedStream.Size));
   TextToStream(Stream,'/Filter '+FilterInfo);
   TextToStream(Stream,'>>');
   TextToStream(Stream,'stream');
   CompressedStream.Position:=0;
   Stream.CopyFrom(CompressedStream,CompressedStream.Size);
   TextToStream(Stream,'');
   TextToStream(Stream,'endstream');
   TextToStream(Stream,'endobj');
  finally
   CompressedStream.Free;
  end;
 end;

{--------------------------------------------------------------------------}

procedure SavePDFXRef(Stream:TStream;PDFObjects:TList;CatalogId:Integer;InfoID:Integer);
 Var XREFOffset:Int64;
     i:integer;
 begin
  XREFOffset := Stream.Position;
  TextToStream(Stream,'xref');
  TextToStream(Stream,'0 ' + IntToStr(PDFObjects.Count));
  TextToStream(Stream,IntToStrZeroPadded(0, 10) + ' ' + IntToStr($FFFF) + ' f');
  for i := 1 to PDFObjects.Count - 1 do
   TextToStream(Stream,IntToStrZeroPadded(Integer(PDFObjects[I]), 10) + ' ' + IntToStrZeroPadded(0, 5) + ' n');
  TextToStream(Stream,'trailer');
  TextToStream(Stream,'<<');
  TextToStream(Stream,'/Size ' + IntToStr(PDFObjects.Count));
  TextToStream(Stream,'/Root ' + IntToStr(CatalogID) + ' 0 R');
  TextToStream(Stream,'/Info ' + IntToStr(InfoID) + ' 0 R');
  TextToStream(Stream,'>>');
  TextToStream(Stream,'startxref');
  TextToStream(Stream,IntToStr(XREFOffset));
 end;

{--------------------------------------------------------------------------}

procedure SavePDFHeader(Stream:TStream);
 begin
  TextToStream(Stream,'%PDF-1.3'#255#254#253);
 end;

{--------------------------------------------------------------------------}

procedure SavePDFFooter(Stream:TStream);
 begin
  TextToStream(Stream,'%%EOF',True);
 end;

{--------------------------------------------------------------------------}

procedure TPdfGraphic.AppendToStream(Stream : TStream);
 Var PDFImage:TPDFGraphic;
     TempStream:TMemoryStream;
     i:integer;
     PageId,ContentId,ResourceId,ImageId:Array of Integer;
     PDFObjects:TList;
     InfoId,PagesId,CatalogId:Integer;
     TempStr:String;
     w72,h72:Integer;
     PagesCount:Integer;
     LastPercent:ShortInt;
begin
 LastPercent := -1;
 LastPercent := DoProgress( Self, FOnReadWriteProgress, 0, 0, 100, LastPercent );

 // Creates object to load existing Images from PDF file
 PDFImage:=TPDFGraphic.Create;
 try
  // Retrieve the number of pages in the file
  Stream.Position:=0;
  PagesCount:=PDFImage.GetImageCount(Stream);
  // Create temp output memory stream
  TempStream:=TMemoryStream.Create;
  try
   // Creates list to store objects offset
   PDFObjects:=TList.Create;
   try
    PDFObjects.Add(nil); // 0 indexed null object
    InfoId:=PDFObjects.Add(nil);
    PagesId:=PDFObjects.Add(nil);
    CatalogId:=PDFObjects.Add(nil);
    // Set arrays lenght: an object for each old page + new objects
    SetLength(PageId,PagesCount+1);
    SetLength(ContentId,PagesCount+1);
    SetLength(ResourceId,PagesCount+1);
    SetLength(ImageId,PagesCount+1);
    for i:=0 to PagesCount do
     begin
      PageId[i]:=PDFObjects.Add(nil);
      ContentId[i]:=PDFObjects.Add(nil);
      ResourceId[i]:=PDFObjects.Add(nil);
      ImageId[i]:=PDFObjects.Add(nil);
     end;
    // Save Header
    SavePDFHeader(TempStream);
    // Save Info
    SavePDFInfo(TempStream,PDFObjects,InfoId);
    // Save Pages list
    SavePDFPagesList(TempStream,PDFObjects,PagesId,PageId);
    // Move existing images from old PDF stream to new temp stream
    for i:=0 to PagesCount-1 do
     begin
      // Read next image from PDF stream
      Stream.Position:=0;
      PDFImage.SingleLoadFromStream(Stream,I+1);
      // Calculates width and height in 1/72" of inch, basic PDF unit
      w72:=Round(PDFImage.Width*72/PDFImage.XDotsPerInch);
      h72:=Round(PDFImage.Height*72/PDFImage.YDotsPerInch);
      // Save Page
      SavePDFPage(TempStream,PDFObjects,PageId[i],PagesID,ResourceID[i],ContentID[i],w72,h72);
      // Save Resource
      SavePDFResource(TempStream,PDFObjects,ResourceId[i],ImageId[i]);
      // Save Content
      TempStr:='q'#13#10+
         FormatFloat(1)+' '+ FormatFloat(0)+' '+FormatFloat(0)+' '+
         FormatFloat(1)+' '+FormatFloat(0)+' '+FormatFloat(0)+' cm'+#13#10+
         FormatFloat(w72)+' '+ FormatFloat(0)+' '+FormatFloat(0)+' '+
         FormatFloat(h72)+' '+FormatFloat(0)+' '+FormatFloat(0)+' cm'+#13#10+
         '/Im'+IntToStr(ImageId[i])+' Do'+#13#10+'Q'+#13#10;
      SavePDFContent(TempStream,PDFObjects,ContentId[i],TempStr);
      // Recupera la prima risorsa immagine della pagina
      SavePDFImage(TempStream,PDFObjects,ImageId[i],PDFImage,False);

      LastPercent := DoProgress( Self, FOnReadWriteProgress, I, 0, PagesCount, LastPercent );

     end;
    // Calculates width and height in 1/72" of inch, basic PDF unit
    w72:=Round(Self.Width*72/Self.XDotsPerInch);
    h72:=Round(Self.Height*72/Self.YDotsPerInch);
    // Save Page
    SavePDFPage(TempStream,PDFObjects,PageId[PagesCount],PagesID,ResourceID[PagesCount],ContentID[PagesCount],w72,h72);
    // Save Resource
    SavePDFResource(TempStream,PDFObjects,ResourceId[PagesCount],ImageId[PagesCount]);
    // Save Image
    SavePDFImage(TempStream,PDFObjects,ImageId[PagesCount],Self,False);
    // Save Content
    TempStr:='q'#13#10+
     FormatFloat(1)+' '+ FormatFloat(0)+' '+FormatFloat(0)+' '+
     FormatFloat(1)+' '+FormatFloat(0)+' '+FormatFloat(0)+' cm'+#13#10+
     FormatFloat(w72)+' '+ FormatFloat(0)+' '+FormatFloat(0)+' '+
     FormatFloat(h72)+' '+FormatFloat(0)+' '+FormatFloat(0)+' cm'+#13#10+
     '/Im'+IntToStr(ImageId[PagesCount])+' Do'+#13#10+'Q'+#13#10;
    SavePDFContent(TempStream,PDFObjects,ContentId[PagesCount],TempStr);
    // Save Catalog
    SavePDFCatalog(TempStream,PDFObjects,CatalogId,PagesId);
    // Save XRef
    SavePDFXRef(TempStream,PDFObjects,CatalogId,InfoId);
    // Save Footer
    SavePDFFooter(TempStream);
   finally
    PDFObjects.Free;
   end;
   // Copy temp stream in output stream
   TempStream.Position:=0;
   Stream.Position:=0;
   Stream.CopyFrom(TempStream,TempStream.Size);
   Stream.Size:=Stream.Position;
  finally
   TempStream.Free;
  end;
 finally
  PDFImage.Free;
 end;

 DoProgress( Self, FOnReadWriteProgress, 100, 0, 100, LastPercent );

end;

{--------------------------------------------------------------------------}

procedure TPdfGraphic.MultiSaveToStream( const Stream       : TStream;
                                         const ImageCount   : Integer;
                                         const OnGetGraphic : TGetGraphicMethod );
 Var i:integer;
     PageId,ContentId,ResourceId,ImageId:Array of Integer;
     PDFObjects:TList;
     InfoId,PagesId,CatalogId:Integer;
     TempStr:String;
     w72,h72:Integer;
     Graphic : TGraphic;
     FreeGraphic : Boolean;
begin
   // Creates list to store objects offset
   PDFObjects:=TList.Create;
   try
    PDFObjects.Add(nil); // 0 indexed null object
    InfoId:=PDFObjects.Add(nil);
    PagesId:=PDFObjects.Add(nil);
    CatalogId:=PDFObjects.Add(nil);
    // Set arrays length
    SetLength(PageId,ImageCount);
    SetLength(ContentId,ImageCount);
    SetLength(ResourceId,ImageCount);
    SetLength(ImageId,ImageCount);
    for i:=0 to (ImageCount-1) do
     begin
      PageId[i]:=PDFObjects.Add(nil);
      ContentId[i]:=PDFObjects.Add(nil);
      ResourceId[i]:=PDFObjects.Add(nil);
      ImageId[i]:=PDFObjects.Add(nil);
     end;
    // Save Header
    SavePDFHeader(Stream);
    // Save Info
    SavePDFInfo(Stream,PDFObjects,InfoId);
    // Save Pages list
    SavePDFPagesList(Stream,PDFObjects,PagesId,PageId);

    // Save each page
    for i:=0 to (ImageCount-1) do
     begin

      Graphic := OnGetGraphic(I+1, FreeGraphic);
      try
          Self.Assign(Graphic);
      finally
          if FreeGraphic then
              Graphic.Free;
      end;

      // Calculates width and height in 1/72" of inch, basic PDF unit
      w72:=Round(Self.Width*72/Self.XDotsPerInch);
      h72:=Round(Self.Height*72/Self.YDotsPerInch);
      // Save Page
      SavePDFPage(Stream,PDFObjects,PageId[i],PagesID,ResourceID[i],ContentID[i],w72,h72);
      // Save Resource
      SavePDFResource(Stream,PDFObjects,ResourceId[i],ImageId[i]);
      // Save Content
      TempStr:='q'#13#10+
         FormatFloat(1)+' '+ FormatFloat(0)+' '+FormatFloat(0)+' '+
         FormatFloat(1)+' '+FormatFloat(0)+' '+FormatFloat(0)+' cm'+#13#10+
         FormatFloat(w72)+' '+ FormatFloat(0)+' '+FormatFloat(0)+' '+
         FormatFloat(h72)+' '+FormatFloat(0)+' '+FormatFloat(0)+' cm'+#13#10+
         '/Im'+IntToStr(ImageId[i])+' Do'+#13#10+'Q'+#13#10;
      SavePDFContent(Stream,PDFObjects,ContentId[i],TempStr);
      SavePDFImage(Stream,PDFObjects,ImageId[i],Self,False);
     end;

    // Save Catalog
    SavePDFCatalog(Stream,PDFObjects,CatalogId,PagesId);
    // Save XRef
    SavePDFXRef(Stream,PDFObjects,CatalogId,InfoId);
    // Save Footer
    SavePDFFooter(Stream);
   finally
    PDFObjects.Free;
   end;
end;

{--------------------------------------------------------------------------}

procedure TPdfGraphic.SaveToStream(Stream: TStream);
var
    Position     : LongInt;
    ImageStream  : TStream;
    PDFObjects   : TList;
    InfoId       : Integer;
    PagesId      : Integer;
    PageId       : Integer;
    ImageId      : Integer;
    ResourceID   : Integer;
    ContentId    : Integer;
    CatalogId    : Integer;
    w72,h72      : Integer;
    TempStr      : String;
begin

    Position := Stream.Position;

    ImageStream := nil;
    try
        if Position <> 0 then
        begin
            { when saving images from DFM files, the image
              stream is included within a larger stream. The LibTiff
              library does not handle this, so a new stream
              must be created. }
            ImageStream := TMemoryStream.Create;
        end
        else
            ImageStream := Stream;

        // Creates list to store objects offset
        PDFObjects:=TList.Create;
        try
         PDFObjects.Add(nil); // 0 indexed null object
         InfoId:=PDFObjects.Add(nil);
         PagesId:=PDFObjects.Add(nil);
         PageId:=PDFObjects.Add(nil);
         ResourceId:=PDFObjects.Add(nil);
         CatalogId:=PDFObjects.Add(nil);
         ContentId:=PDFObjects.Add(nil);
         ImageId:=PDFObjects.Add(nil);
         // Save Header
         SavePDFHeader(ImageStream);
         // Save Info
         SavePDFInfo(ImageStream,PDFObjects,InfoId);
         // Save Pages list
         SavePDFPagesList(ImageStream,PDFObjects,PagesId,[PageId]);
         // Calculates width and height in 1/72" of inch, basic PDF unit
         w72:=Round(Width*72/XDotsPerInch);
         h72:=Round(Height*72/YDotsPerInch);
         // Save Page
         SavePDFPage(ImageStream,PDFObjects,PageId,PagesID,ResourceID,ContentID,w72,h72);
         // Save Resource
         SavePDFResource(ImageStream,PDFObjects,ResourceId,ImageId);
         // Save Image
         SavePDFImage(ImageStream,PDFObjects,ImageId,Self,True);
         // Save Content
         TempStr:='q'#13#10+
            FormatFloat(1)+' '+ FormatFloat(0)+' '+FormatFloat(0)+' '+
            FormatFloat(1)+' '+FormatFloat(0)+' '+FormatFloat(0)+' cm'+#13#10+
            FormatFloat(w72)+' '+ FormatFloat(0)+' '+FormatFloat(0)+' '+
            FormatFloat(h72)+' '+FormatFloat(0)+' '+FormatFloat(0)+' cm'+#13#10+
            '/Im'+IntToStr(ImageId)+' Do'+#13#10+'Q'+#13#10;
         SavePDFContent(ImageStream,PDFObjects,ContentId,TempStr);
          // Save Catalog
         SavePDFCatalog(ImageStream,PDFObjects,CatalogId,PagesId);
         // Save XRef
         SavePDFXRef(ImageStream,PDFObjects,CatalogId,InfoId);
         // Save Footer
         SavePDFFooter(Stream);
        finally
         PDFObjects.Free;
        end;

        if Position <> 0 then
        begin
          ImageStream.Seek(0, soFromBeginning);
          Stream.CopyFrom(ImageStream, ImageStream.Size);
        end;

    finally
        if Position <> 0 then
            ImageStream.Free;
    end;
end;

{--------------------------------------------------------------------------}

initialization

    {$ifdef __RegisterEnvisionPdf}
    RegisterDibGraphic('PDF', 'PDF file', TPdfGraphic);
    {$endif}

finalization

end.
