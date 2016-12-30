
//////////////////////////////////////////////////
//  Copyright © 1998-2007 Core Lab. All right reserved.
//  CRParser
//  Created:            27.03.98
//////////////////////////////////////////////////

{$IFNDEF CLR}

{$I Dac.inc}
 
unit CRParser;
{$ENDIF}
interface

uses
  Classes;

const
  lcEnd     =  0;
  lcLexem   = -100;
  lcSymbol  = -102;
  lcIdent   = -103;  // identificator
  lcNumber  = -105;
  lcString  = -106;
  lcBlank   = -107;
  lcComment = -108;

  BlockSize = 64 * 1024;

type
  TParserClass = class of TParser;
  TClausesArr = array of integer;

  TParser = class
  protected
    OldPos: integer;
    OldOldPos: integer;
    FOmitBlank: boolean;
    FOmitComment: boolean;
    FUppered: boolean;
    FCurrLine: integer;
    FPrevLine: integer;
    FCurrBegLine: integer;
    FPrevBegLine: integer;
    FQuotedString: boolean;
    FAdvancedStringParsing: boolean;

    FSavedPos: integer; // local var buf in previous version
    FLexemPos: integer; // start Lexem pos in Text
    FLexemLength: integer; // actual length of FLexemArray;

    FStream: TStream;
    FStoredBlocks: TStringList;
    FCurrentBlock: string;
    FFirstBlockOffset: integer;
    FBlockOffset: integer;
    FBlockSize: integer;
    FAlternativeQuoting: boolean; // supported in Oracle 10

    procedure ReadNextBlock;
    function GetChar(Index: integer): Char;
    function GetStoredChar(Index: integer): Char;
  protected
    TextLength: integer;
    Pos: integer;

    FSymbolLexems, FKeywordLexems: TStringList;
    FClauses: TClausesArr; // lxWHERE, lxLIMIT, lxORDER etc. Must be filled on Create
    FOmitKeywords: boolean;
    FDesiredLexem: string;
    FDesiredLexemFound: boolean;
    FLexem: string;

    procedure InitParser; virtual;

    function IsBlank(Ch: char): boolean; virtual;
    function IsSymbol(Ch: char): boolean; virtual;
    function IsAlpha(Ch: char): boolean; virtual;
    function IsNumber(Ch: char): boolean; virtual;
    function IsStringQuote(Ch: char): boolean; virtual;
    procedure ToRightQuoteP(RightQuote: Char); virtual;
 {$IFNDEF CLR}
    procedure ToRightQuoteA(RightQuote: Char); virtual;
 {$ENDIF}
    procedure ToRightQuote(RightQuote: Char); virtual; // Search right quote of quoted string value or quoted identifier
    function IsIdentQuote(Ch: char): boolean; virtual;
    function IsInlineComment(Pos: integer): boolean; virtual;
    function FindLexemIndex(const LexemPos, LexemLength: integer; Lexems: TStringList): integer;
    function InternalGetNext: integer; 

    function CopyText(const Pos, Count: integer): string;
    procedure AddToLexemArray(Index: integer; const Len: integer);

    property Text[Index: integer]: Char read GetChar;
    property AlternativeQuoting: boolean read FAlternativeQuoting write FAlternativeQuoting;

  public
    CommentBegin: string;
    CommentEnd: string;
    DecSeparator: string;

    constructor Create(const Text: string); overload; virtual;
    constructor Create(const Stream: TStream); overload; virtual;
    destructor Destroy; override;

    procedure SetText(const Text: string);

    procedure ToBegin; virtual;
    procedure Back;
    function GetNext(out Lexem: string): integer; virtual;
    function GetNextCode: integer;

    function ToLexem(const Code: integer): integer; overload;
    function ToLexem(const Lexem: string): boolean; overload;
    //function ToSymbol(const Symbol: Char): integer;
    function IsClauseLexem(Code: integer): boolean; // Is SELECT statement clause
    function PosClauseLexem(Code: integer): integer; // Code position in list of SELECT statement clauses. -1 if not found
    function IsMacroAllowed(Code: integer): boolean; virtual;
    function IsNumericMacroNameAllowed: boolean; virtual;
    function IsSemicolon(Code: integer): boolean; virtual;

    function CurrPos: integer;
    function PrevPos: integer;
    function PrevPrevPos: integer;
    function CurrLine: integer;
    function PrevLine: integer;
    function CurrCol: integer;
    function PrevCol: integer;

    property OmitBlank: boolean read FOmitBlank write FOmitBlank;
    property OmitComment: boolean read FOmitComment write FOmitComment;
    property Uppered: boolean read FUppered write FUppered;
    property QuotedString: boolean read FQuotedString write FQuotedString;
    property AdvancedStringParsing: boolean read FAdvancedStringParsing write FAdvancedStringParsing;   

    property SymbolLexems: TStringList read FSymbolLexems;
    property KeywordLexems: TStringList read FKeywordLexems;
  end;

  function CRCmpStrings(List: TStringList; Index1, Index2: Integer): Integer;
{$IFNDEF VER7P}
function PosEx(const SubStr, S: string; Offset: Cardinal = 1): Integer;
{$ENDIF}

implementation
uses
{$IFDEF VER7P}
  StrUtils,
{$ENDIF}
{$IFDEF PERF_COUNTER}
  Debug,
{$ENDIF}
{$IFDEF CLR}
  System.Text,
{$ELSE}
  CLRClasses,
{$ENDIF}
  SysUtils, MemUtils;

var
  CommonSymbolLexems, CommonKeywordLexems: TStringList;

{ TParser }

constructor TParser.Create(const Text: string);
begin
  inherited Create;

  Self.FCurrentBlock := Text;
  TextLength := Length(Text);
  FBlockSize := TextLength;

  InitParser;
end;

constructor TParser.Create(const Stream: TStream);
begin
  inherited Create;

  FStoredBlocks := TStringList.Create;
  FStream := Stream;
  TextLength := Stream.Size;

  InitParser;
end;

destructor TParser.Destroy;
begin
  FStoredBlocks.Free;

  inherited;
end;

procedure TParser.InitParser;
begin
  FSymbolLexems := CommonSymbolLexems;
  FKeywordLexems := CommonKeywordLexems;
  CommentBegin := '/*';
  CommentEnd := '*/';
  DecSeparator := DecimalSeparator;

  FOmitBlank := True;
  FUppered := True;
  FQuotedString := False;
  ToBegin;
end;


procedure TParser.SetText(const Text: string);
begin
  Self.FCurrentBlock := Text;
  TextLength := Length(Text);
  FBlockSize := TextLength;

  ToBegin;
end;

function TParser.IsBlank(Ch: char): boolean;
begin
  Result := False;
  case Ch of
    #9, #10, #13, #32:
      Result := True;
  end;
end;

function TParser.IsSymbol(Ch: char): boolean;
begin
  Result := False;
  case Ch of
    '!'..'/', ':'..'@', '['..'^', '`', '{'..'~':
      Result := True;
  end;
end;

function TParser.IsAlpha(Ch: char): boolean;
begin
  Result := False;
  case Ch of
    'A'..'Z', 'a'..'z', #128..#255:
      Result := True;
  end;
end;

function TParser.IsNumber(Ch: char): boolean;
begin
  Result := False;
  case Ch of
    '0'..'9':
      Result := True;
  end;
end;

function TParser.IsStringQuote(Ch: char): boolean;
begin
  Result := False;
  case Ch of
    '''', '"':
      Result := True;
  end;
end;

procedure TParser.ToRightQuote(RightQuote: Char);
begin
  if FAdvancedStringParsing or (FStream <> nil) then
    ToRightQuoteP(RightQuote)
  else
{$IFDEF CLR}
    while (Pos <= TextLength) and (Text[Pos] <> RightQuote) do
      Inc(Pos);
{$ELSE}
    ToRightQuoteA(RightQuote);
{$ENDIF}   
end;

procedure TParser.ToRightQuoteP(RightQuote: Char);
var
  c: Char;
begin
  while (Pos <= TextLength) do begin
    c := Text[Pos];
    if (c = #13) or (c = #10) then begin
      if (Pos < TextLength) and (Text[Pos + 1] = #10) then
        inc(Pos);
      Inc(FCurrLine);
      FCurrBegLine := Pos + 1;
    end
    else
    if c = RightQuote then
      Break;
    inc(Pos);
  end;
end;

{$IFNDEF CLR}
procedure TParser.ToRightQuoteA(RightQuote: Char);
var
  i: integer;
begin
  i := TextLength - Pos + 1 {Pos is counted from 1} + 1 {#0};
  asm
    PUSHAD

    MOV EAX, Self
    MOV EDI, EAX

    ADD EAX, Pos
    MOV EAX, [EAX] // EAX := Pos

    ADD EDI, FCurrentBlock
    MOV EDI, [EDI]
    ADD EDI, EAX
    DEC EDI // EDI := PChar(Text) + Pos {Pos is counted from 1};

    MOV ECX, i
    MOV AL, RightQuote
    REPNE   SCASB
    MOV i, ECX
    POPAD
  end;
  Pos := TextLength - i + 1;
end;
{$ENDIF}

function TParser.IsIdentQuote(Ch: char): boolean;
begin
  Result := False;
end;

function TParser.IsInlineComment(Pos: integer): boolean;
begin
  Result := (TextLength >= Pos + 2) and (Text[Pos] = '/') and (Text[Pos + 1] = '/');
end;

function TParser.IsMacroAllowed(Code: integer): boolean;
begin
  Result := Code <> lcString;
end;

function TParser.IsNumericMacroNameAllowed: boolean;
begin
  Result := False;
end;

function TParser.IsSemicolon(Code: integer): boolean;
begin
  Result := False;
end;

function TParser.FindLexemIndex(const LexemPos, LexemLength: integer; Lexems: TStringList): integer;
  function CompareWithLexem(const S: string): integer;
  var
    i, l, ls: integer;
    Ch: Char;
  begin
    Result := 0;
    ls := Length(S);
    if ls > LexemLength then
      l := LexemLength
    else
      l := ls;

    for i := 1 to l do begin
      Ch := Text[LexemPos + i - 1];
      if (Ch >= 'a') and (Ch <= 'z') then Dec(Ch, 32);
      Result := integer(S[i]) - integer(Ch);
      if Result <> 0 then
        Exit;
    end;

    if ls > LexemLength then
      Result := 1
    else
    if ls < LexemLength then
      Result := -1;
  end;


var
  L, H, I, C: integer;
begin
{$IFDEF PERF_COUNTER}
  PerfCounters[9].Start;
{$ENDIF}
  Result := -1;
  L := 0;
  H := Lexems.Count - 1;
  while L <= H do
  begin
    I := (L + H) shr 1;
    C := CompareWithLexem(Lexems[I]);

    if C < 0 then
      L := I + 1
    else begin
      H := I - 1;
      if C = 0 then
        Result := I;
    end;
  end;

{$IFDEF PERF_COUNTER}
  PerfCounters[9].Stop;
{$ENDIF}
end;

procedure TParser.ToBegin;
begin
  Pos := 1;
  OldPos := Pos;
  OldOldPos := OldPos;
  FCurrLine := 0;
  FPrevLine := 0;
  FCurrBegLine := Pos;
  FPrevBegLine := Pos;

  FFirstBlockOffset := 1;
  FBlockOffset := 1;
end;

procedure TParser.Back;
begin
  Pos := OldPos;
end;

{$IFNDEF VER7P}
{ PosEx searches for SubStr in S and returns the index position of
  SubStr if found and 0 otherwise.  If Offset is not given then the result is
  the same as calling Pos.  If Offset is specified and > 1 then the search
  starts at position Offset within S.  If Offset is larger than Length(S)
  then PosEx returns 0.  By default, Offset equals 1.  }

function PosEx(const SubStr, S: string; Offset: Cardinal = 1): Integer;
var
  I,X: Integer;
  Len, LenSubStr: Integer;
begin
  if Offset = 1 then
    Result := Pos(SubStr, S)
  else
  begin
    I := Offset;
    LenSubStr := Length(SubStr);
    Len := Length(S) - LenSubStr + 1;
    while I <= Len do
    begin
      if S[I] = SubStr[1] then
      begin
        X := 1;
        while (X < LenSubStr) and (S[I + X] = SubStr[X + 1]) do
          Inc(X);
        if (X = LenSubStr) then
        begin
          Result := I;
          exit;
        end;
      end;
      Inc(I);
    end;
    Result := 0;
  end;
end;
{$ENDIF}

function TParser.InternalGetNext: integer;
  function IsCommentBegin: boolean;
  var
    i, l: integer;
  begin
    l := Length(CommentBegin);
    Result := Pos <= TextLength - l + 1;
    if not Result then
      Exit;

    for i := 1 to l do
      if Text[Pos + i - 1] <> CommentBegin[i] then begin
        Result := False;
        Exit;
      end;
  end;

var
  j, CommentLen: integer;
  IsComment: boolean;
  Quote: Char;
  c: Char;
  DL: boolean;
  i: integer;
  St, StLength: integer;
  SymbolPos: integer;
  QuoteDelimiter: char;
  QuoteDelimiterFound: boolean;
begin
  DL := FDesiredLexem <> '';
  OldOldPos := OldPos;
  OldPos := Pos;
  FPrevLine := FCurrLine;
  FPrevBegLine := FCurrBegLine;

  FSavedPos := -1;
  FLexemPos := -1;
  FLexemLength := 0;

  repeat
    if Pos > TextLength then begin
      Result := lcEnd;
      Exit;
      c := #0; // To Prevent compiler warning
    end
    else
      if FStream = nil then // Performance optimization
        c := FCurrentBlock[Pos]
      else
        c := Text[Pos];

  // Blanks
    while IsBlank(c) do begin
      AddToLexemArray(Pos, 1);
      if (c = #13) or (c = #10) then begin
        if (c = #13) and (Text[Pos + 1] = #10) then begin
          Inc(Pos);                    /// CR-M12015
          AddToLexemArray(Pos, 1);
        end;
        Inc(FCurrLine);
        FCurrBegLine := Pos + 1;               
      end;
      Inc(Pos);
      c := Text[Pos];
    end;

    if not OmitBlank and (FLexemLength <> 0) then begin
      Result := lcBlank;
      Exit;
    end;

  // End
    if Pos > TextLength then begin
      Result := lcEnd;
      Exit;
    end;

  // Comment
    IsComment := False;
    if IsInlineComment(Pos) then begin
      IsComment := True;
      FSavedPos := Pos;
      while not((Pos > TextLength) or (c = #13) or (c = #10)) do begin
        Inc(Pos);
        c := Text[Pos];
      end;  
      // optimize expression StrLexem := StrLexem + Copy(Buf, 1, Pos - Buf);
      AddToLexemArray(FSavedPos, Pos - FSavedPos);
    end;

    if IsCommentBegin then begin
      IsComment := True;
      if Pos <= TextLength then begin
        FSavedPos := Pos;
        while Pos <= TextLength do begin
          if (c = #13) or (c = #10) then begin
            if (Pos < TextLength) and (Text[Pos + 1] = #10) then begin
              inc(Pos);
            end;
            Inc(FCurrLine);
            FCurrBegLine := Pos + 1;
          end
          else begin
            j := 0;
            CommentLen := Length(CommentEnd);
            while (j < CommentLen) and (Text[Pos + j] = CommentEnd[j + 1]) do
              inc(j);
            if j = CommentLen then begin
              Inc(Pos, CommentLen);
              Break;
            end;
          end;
          inc(Pos);
          c := Text[Pos];
        end;
        // optimize expression StrLexem := StrLexem + Copy(Buf, 1, Pos - Buf);
        AddToLexemArray(FSavedPos, Pos - FSavedPos);
      end;
    end;

    if not OmitComment and IsComment then begin
      Result := lcComment;
      Exit;
    end;
  until not IsComment;

  FLexemPos := -1;
  FLexemLength := 0;
  if IsSymbol(c) then
    if IsStringQuote(c) then begin
      Result := lcString;
      Quote := c;
      if FQuotedString then
        AddToLexemArray(Pos, 1);
      Inc(Pos);
      FSavedPos := Pos;
      ToRightQuote(Quote);
      // optimize expression StrLexem := StrLexem + Copy(Buf, 1, Pos - Buf);
      if Pos > FSavedPos then
        AddToLexemArray(FSavedPos, Pos - FSavedPos);
      if Pos <= TextLength then begin
        if FQuotedString then
          AddToLexemArray(Pos, 1);
        Inc(Pos);
      end;
    end
    else
      if IsIdentQuote(c) then begin
        Result := lcIdent;
        Quote := c;
        AddToLexemArray(Pos, 1);
        Inc(Pos);
        FSavedPos := Pos;
        ToRightQuote(Quote);
        if Pos > FSavedPos then
          AddToLexemArray(FSavedPos, Pos - FSavedPos);
        if Pos <= TextLength then begin
          AddToLexemArray(Pos, 1);
          Inc(Pos);
        end;
      end
      else begin
        Result := lcSymbol;
        SymbolPos := Pos + 1;   // WAR
        FLexemPos := Pos;
        FLexemLength := 0;
        St := Pos;
        StLength := 1;

        repeat
          AddToLexemArray(Pos, 1);
          Inc(Pos);
          c := Text[Pos];
          // Find
          i := FindLexemIndex(FLexemPos, FLexemLength, FSymbolLexems);
          if i <> - 1 then begin
            FLexem := FSymbolLexems[i];

            SymbolPos := Pos;
            Result := integer(FSymbolLexems.Objects[i]);
            Assert(Result > 0);
          end
          else
            Dec(FLexemLength);
        until not IsSymbol(c);

        if Result = lcSymbol then begin
          FLexemPos := St;
          FLexemLength := StLength;
          if DL then begin
            Assert(Length(FDesiredLexem) <= 1);
            FDesiredLexemFound := (FDesiredLexem[1] = Text[FLexemPos]);
          end;
        end
        else
        if DL then
          FDesiredLexemFound := (FDesiredLexem = FLexem);

        Pos := SymbolPos;
      end
  else
    if IsAlpha(c) or (c = '_') then begin
      Result := lcIdent;
      FSavedPos := Pos;
      QuoteDelimiter := c;
      repeat
        if DL then begin
          if (c >= 'a') and (c <= 'z') then
            Dec(c, 32);
          DL := (Pos - FSavedPos + 1 <= Length(FDesiredLexem)) and (FDesiredLexem[Pos - FSavedPos + 1] = c);
        end;

        Inc(Pos);
        c := Text[Pos];
      until not IsAlpha(c) and not IsNumber(c) and (c <> '_');

      if FAlternativeQuoting and (Pos - FSavedPos = 1) and
        ((QuoteDelimiter = 'q') or (QuoteDelimiter = 'Q')) and IsStringQuote(c)
      then begin
        Result := lcString;
        Quote := c;
        Inc(Pos);
        if Pos <= TextLength then begin
          QuoteDelimiter := Text[Pos];
          case QuoteDelimiter of
            '[': QuoteDelimiter := ']';
            '{': QuoteDelimiter := '}';
            '<': QuoteDelimiter := '>';
            '(': QuoteDelimiter := ')';
          end;
          QuoteDelimiterFound := False;
          Inc(Pos);
          while Pos <= TextLength do begin
            c := Text[Pos];
            Inc(Pos);

            if QuoteDelimiterFound and (c = Quote) then
              break;

            QuoteDelimiterFound := (c = QuoteDelimiter);
          end;
        end;
        if FQuotedString then
          AddToLexemArray(FSavedPos, Pos - FSavedPos)
        else
          if Pos - FSavedPos > 5 then
            AddToLexemArray(FSavedPos + 3, Pos - FSavedPos - 5)
      end
      else begin
        FDesiredLexemFound := DL;
        AddToLexemArray(FSavedPos, Pos - FSavedPos);
      end;
    end
    else
      if IsNumber(c) then begin
        Result := lcNumber;
        SymbolPos := Pos;
        repeat
          AddToLexemArray(Pos, 1);
          if DL then
            DL := (Pos - SymbolPos + 1 <= Length(FDesiredLexem)) and (FDesiredLexem[Pos - SymbolPos + 1] = c);

          Inc(Pos);
          c := Text[Pos];
        until not IsNumber(c);
        FDesiredLexemFound := DL;
        if (c = DecSeparator) and (Pos + 1 <= TextLength) and IsNumber(Text[Pos + 1]) then begin
          AddToLexemArray(Pos, 1);
          Inc(Pos);
          c := Text[Pos];
          while IsNumber(c) do begin
            AddToLexemArray(Pos, 1);
            Inc(Pos);
            c := Text[Pos];
          end;
        end;
      end
      else
        raise Exception.Create('Parser: The unknown symbol ''' + Text[Pos] + '''  $' + IntToHex(Word(Text[Pos]), 4));

  Assert(Result <> - MaxInt);
end;

function TParser.GetNext(out Lexem: string): integer;
var
  i: integer;
begin
{$IFDEF PERF_COUNTER}
  PerfCounters[2].Start;//}
  try
{$ENDIF}
  Result := InternalGetNext; // Result is not in KeywordLexems
  if Result > 0 then begin
    Assert(FLexem <> '');
    Lexem := FLexem
  end
  else begin
    if FLexemLength = 0 then
      Lexem := ''
    else
    begin
      Assert(FLexemPos > 0);
      Lexem := CopyText(FLexemPos, FLexemLength);
    end;
  end;

  if not FOmitKeywords and (Result = lcIdent) then begin
    Assert(FLexemPos > 0);
    Assert(FLexemLength > 0);
    i := FindLexemIndex(FLexemPos, FLexemLength, FKeywordLexems);
    if i <> -1 then begin
      Result := integer(FKeywordLexems.Objects[i]);
      Assert(Result > 0);
      if Uppered then
        Lexem := AnsiUpperCase(Lexem);  //WAR problem with macros as key words
    end;
  end;

  Assert(Result <> - MaxInt);
{$IFDEF PERF_COUNTER}
  finally
    PerfCounters[2].Stop;
  end;
{$ENDIF}
end;

function TParser.GetNextCode: integer;
var
  St: string;
begin
  Result := GetNext(St);
end;

function TParser.ToLexem(const Code: integer): integer;
var
  St: string;
begin
  repeat
    Result := GetNext(St);
  until (Result = Code) or (Result = lcEnd);
end;

function TParser.ToLexem(const Lexem: string): boolean;
begin
  try
    FDesiredLexem := UpperCase(Lexem);
    FDesiredLexemFound := False;

    while (InternalGetNext <> lcEnd) and not FDesiredLexemFound do;

    Result := FDesiredLexemFound;
  finally
    FDesiredLexem := '';
    FDesiredLexemFound := False;
  end;
end;

{function TParser.ToSymbol(const Symbol: Char): integer;
var
  St: string;
begin
  FOmitKeywords := True;
  try
    repeat
      Result := GetNext(St);
    until (Result = lcEnd) or ((Length(St) = 1) and (St[1] = Symbol));
  finally
    FOmitKeywords := False;
  end;
end;}

function TParser.IsClauseLexem(Code: integer): boolean;
begin
  Result := PosClauseLexem(Code) <> -1;
end;

function TParser.PosClauseLexem(Code: integer): integer;
var
  i: integer;
begin
  Assert(Length(FClauses) > 0);
  Result := -1;
  for i := Low(FClauses) to High(FClauses) do
    if Code = FClauses[i] then begin
      Result := i;
      Exit;
    end;
end;

function TParser.CurrPos: integer;
begin
  Result := Pos - 1;
end;

function TParser.PrevPos: integer;
begin
  Result := OldPos - 1;
end;

function TParser.PrevPrevPos: integer;
begin
  Result := OldOldPos - 1;
end;

function TParser.CurrLine: integer;
begin
  Result := FCurrLine;
end;

function TParser.PrevLine: integer;
begin
  Result := FPrevLine;
end;

function TParser.CurrCol: integer;
begin
  Result := Pos - FCurrBegLine;
end;

function TParser.PrevCol: integer;
begin
  Result := OldPos - FPrevBegLine;
end;

function CRCmpStrings(List: TStringList; Index1, Index2: Integer): Integer;
begin
{$IFDEF CLR}
  Result := System.String.CompareOrdinal(List[Index1], List[Index2]);
{$ELSE}
  Result := CompareStr(List[Index1],
                       List[Index2]);
{$ENDIF}
end;

procedure TParser.ReadNextBlock;
var
  i: integer;
  UsedBlocks: integer;
  SavedPos: integer;
{$IFDEF CLR}
  Buffer: TBytes;
{$ENDIF}
begin
  if (FSavedPos > -1) and ((FSavedPos < FLexemPos) or (FLexemPos = -1)) then
    SavedPos := FSavedPos
  else
    SavedPos := FLexemPos;

  if ((SavedPos > Pos) or (SavedPos = -1)) and not (FCurrentBlock = '') then
    SavedPos := Pos;

  UsedBlocks := FStoredBlocks.Count;
  for i := 0 to FStoredBlocks.Count - 1 do
    if (SavedPos >= FFirstBlockOffset + i * BlockSize) or (SavedPos = -1) then
      Dec(UsedBlocks);

  while FStoredBlocks.Count > UsedBlocks do
    FStoredBlocks.Delete(0);    

  if ((SavedPos > -1) and (SavedPos < FBlockOffset + BlockSize)) then
    FStoredBlocks.Add(FCurrentBlock);

  if FCurrentBlock = '' then
    SetLength(FCurrentBlock, BlockSize);

  if FStoredBlocks.Count = 0 then
    FFirstBlockOffset := FStream.Position + 1
  else
  if FStoredBlocks.Count = 1 then
    FFirstBlockOffset := FBlockOffset;

  FBlockOffset := FStream.Position + 1;

{$IFDEF CLR}
  SetLength(Buffer, BlockSize);
  FBlockSize := FStream.Read(Buffer, BlockSize);
  FCurrentBlock := Encoding.Default.GetString(Buffer, 0, FBlockSize);
{$ELSE}
  FBlockSize := FStream.Read(FCurrentBlock[1], BlockSize);
{$ENDIF}
end;

function TParser.GetStoredChar(Index: integer): Char;
begin
  if Index >= FFirstBlockOffset then
    Result := FStoredBlocks[(Index - FFirstBlockOffset) div BlockSize][(Index - FFirstBlockOffset) mod BlockSize + 1]
  else begin
    Result := #0;
    Assert(False);
  end;
end;

function TParser.GetChar(Index: integer): Char;
begin
  if Index > TextLength then
    Result := #0
  else begin
    if Index >= FBlockOffset + FBlockSize then
      ReadNextBlock;

    if Index >= FBlockOffset then
      Result := FCurrentBlock[Index - FBlockOffset + 1]
    else
      Result := GetStoredChar(Index);
  end;
end;

procedure TParser.AddToLexemArray(Index: integer; const Len: integer);
begin
  FSavedPos := -1;
  if FLexemPos = -1 then
    FLexemPos := Index;
  Inc(FLexemLength, Len);
end;

function TParser.CopyText(const Pos, Count: integer): string;
var
  sb: StringBuilder;
  i: integer;
begin
  if Pos < FBlockOffset then begin
    sb := StringBuilder.Create(Count);
    try
      for i := 0 to FStoredBlocks.Count - 1 do
        if i = 0 then
          sb.Append(Copy(FStoredBlocks[i], Pos - FFirstBlockOffset + 1, Count))
        else
          sb.Append(FStoredBlocks[i]);

      sb.Append(Copy(FCurrentBlock, 1, Count - FBlockOffset + Pos));
      Result := sb.ToString;
    finally
      sb.Free;
    end;
  end
  else
    Result := Copy(FCurrentBlock, FLexemPos - FBlockOffset + 1, FLexemLength);
end;

initialization
  CommonSymbolLexems := TStringList.Create;
  CommonKeywordLexems := TStringList.Create;

  CommonSymbolLexems.AddObject('!', TObject(integer(1)));
  CommonSymbolLexems.AddObject('"', TObject(integer(2)));
  CommonSymbolLexems.AddObject('#', TObject(integer(3)));
  CommonSymbolLexems.AddObject('$', TObject(integer(4)));
  CommonSymbolLexems.AddObject('%', TObject(integer(5)));
  CommonSymbolLexems.AddObject('&', TObject(integer(6)));
  CommonSymbolLexems.AddObject('''', TObject(integer(7)));
  CommonSymbolLexems.AddObject('(', TObject(integer(8)));
  CommonSymbolLexems.AddObject(')', TObject(integer(9)));
  CommonSymbolLexems.AddObject('*', TObject(integer(10)));
  CommonSymbolLexems.AddObject('+', TObject(integer(11)));
  CommonSymbolLexems.AddObject(',', TObject(integer(12)));
  CommonSymbolLexems.AddObject('-', TObject(integer(13)));
  CommonSymbolLexems.AddObject('.', TObject(integer(14)));
  CommonSymbolLexems.AddObject('/', TObject(integer(15)));
  CommonSymbolLexems.AddObject(':', TObject(integer(16)));
  CommonSymbolLexems.AddObject(';', TObject(integer(17)));
  CommonSymbolLexems.AddObject('<', TObject(integer(18)));
  CommonSymbolLexems.AddObject('=', TObject(integer(19)));
  CommonSymbolLexems.AddObject('>', TObject(integer(20)));
  CommonSymbolLexems.AddObject('?', TObject(integer(21)));
  CommonSymbolLexems.AddObject('@', TObject(integer(22)));
  CommonSymbolLexems.AddObject('[', TObject(integer(23)));
  CommonSymbolLexems.AddObject('\', TObject(integer(24)));
  CommonSymbolLexems.AddObject(']', TObject(integer(25)));
  CommonSymbolLexems.AddObject('^', TObject(integer(26)));
  CommonSymbolLexems.AddObject('_', TObject(integer(27)));
  CommonSymbolLexems.AddObject('`', TObject(integer(28)));
  CommonSymbolLexems.CustomSort(CRCmpStrings);

  CommonKeywordLexems.AddObject('AND', TObject(integer(29)));
  CommonKeywordLexems.AddObject('NOT', TObject(integer(30)));
  CommonKeywordLexems.AddObject('OR', TObject(integer(31)));
  CommonKeywordLexems.CustomSort(CRCmpStrings);

{$IFDEF PERF_COUNTER}
  PerfCounters[2].Name := 'Parser.Next';
  PerfCounters[8].Name := 'Parser.Code';
  PerfCounters[9].Name := 'Parser.FindLexemIndex';
{$ENDIF}

finalization
  CommonSymbolLexems.Free;
  CommonKeywordLexems.Free;

end.
