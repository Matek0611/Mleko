
//////////////////////////////////////////////////
//  DB Access Components
//  Copyright © 1998-2007 Core Lab. All right reserved.
//  CLRClasses
//////////////////////////////////////////////////

unit CLRClasses;

interface

{$I Dac.inc}

uses
  Classes, SysUtils;

type
  Int    = Integer;
  Int16  = SmallInt;
  Int32  = Integer;
  UInt16 = Word;
  UInt32 = LongWord;
  sbyte  = ShortInt;

  IntPtr = pointer;
  MulticastDelegate = pointer;
{$IFNDEF VER11}
  TBytes = array of byte;
{$ENDIF}  

  BitConverter = class
  public
    class function GetBytes(value: word): TBytes; overload;
    class function GetBytes(value: cardinal): TBytes; overload;
    class function GetBytes(value: int64): TBytes; overload;
    class function GetBytes(value: double): TBytes; overload;
    class function GetBytes(value: single): TBytes; overload;
    class function Int64BitsToDouble(Value: int64): double;
    class function DoubleToInt64Bits(Value: double): int64;
    class function ToDouble(const value: TBytes; startIndex: integer): Double; overload;
    class function ToDouble(value: PChar; startIndex: integer): Double; overload;
    class function ToSingle(const value: TBytes; startIndex: integer): Single;
    class function ToInt64(const value: TBytes; startIndex: integer): Int64; overload;
    class function ToInt64(value: PChar; startIndex: integer): Int64; overload;
    class function ToInt32(const value: TBytes; startIndex: integer): integer; overload;
    class function ToInt32(value: PChar; startIndex: integer): integer; overload;
    class function ToInt16(const value: TBytes; startIndex: integer): smallint;
    class function ToUInt32(const value: TBytes; startIndex: integer): UInt32;
    class function ToUInt16(const value: TBytes; startIndex: integer): UInt16; overload;
    class function ToUInt16(value: PChar; startIndex: integer): UInt16; overload;
  end;

  Marshal = class
  public
    class function AllocHGlobal(cb: integer): pointer;
    class function ReallocHGlobal(pv: pointer; cb: pointer): pointer;
    class procedure FreeHGlobal(hglobal: pointer);
    class procedure FreeCoTaskMem(ptr: pointer);

    class function ReadByte(ptr: pointer; ofs: integer = 0): byte;
    class procedure WriteByte(ptr: pointer; val: byte); overload;
    class procedure WriteByte(ptr: pointer; ofs: integer; val: byte); overload;

    class function ReadInt16(ptr: pointer; ofs: integer = 0): smallint;
    class procedure WriteInt16(ptr: pointer; val: smallint); overload;
    class procedure WriteInt16(ptr: pointer; ofs: integer; val: smallint); overload;

    class function ReadInt32(ptr: pointer; ofs: integer = 0): integer;
    class procedure WriteInt32(ptr: pointer; val: integer); overload;
    class procedure WriteInt32(ptr: pointer; ofs, val: integer); overload;

    class function ReadInt64(ptr: pointer; ofs: integer = 0): int64;
    class procedure WriteInt64(ptr: pointer; val: int64); overload;
    class procedure WriteInt64(ptr: pointer; val: double); overload;
    class procedure WriteInt64(ptr: pointer; ofs: integer; val: int64); overload;

    class function ReadIntPtr(ptr: pointer; ofs: integer = 0): pointer;
    class procedure WriteIntPtr(ptr: pointer; val: pointer); overload;
    class procedure WriteIntPtr(ptr: pointer; ofs: integer; val: pointer); overload;

    class function PtrToStringAnsi(ptr: pointer; len: integer = 0): string;
    class function PtrToStringUni(ptr: pointer; len: integer = 0): WideString;
    class function StringToHGlobalAnsi(const s: string): pointer;
    class function StringToHGlobalUni(const s: WideString): pointer;

    class procedure Copy(const source: TBytes; startIndex: integer; destination: pointer; length: integer); overload;
    class procedure Copy(source: pointer; var destination: TBytes; startIndex: integer; length: integer); overload;

    class function GetIUnknownForObject(o: TInterfacedObject): IntPtr;
    class function AddRef(pUnk: IntPtr): integer;
    class function Release(pUnk: IntPtr): integer;
  end;

  EncodingClass = class of Encoding;
  Encoding = class
  public
    class function Default: EncodingClass;
    class function Unicode: EncodingClass;
    class function UTF8: EncodingClass;

    class function GetBytes(const chars: string): TBytes; overload; virtual;
    class function GetBytes(const chars: string; charIndex, charCount: int; var bytes: TBytes; byteIndex: int): int; overload; virtual;
    class function {$IFNDEF VER5}GetBytes{$ELSE}GetBytesWide{$ENDIF}(const chars: WideString): TBytes; overload; virtual;
    class function {$IFNDEF VER5}GetBytes{$ELSE}GetBytesWide{$ENDIF}(const chars: WideString; charIndex, charCount: int; var bytes: TBytes; byteIndex: int): int; overload; virtual;

    class function GetString(const bytes: TBytes): string; overload; virtual;
    class function GetString(const bytes: TBytes; index: integer; count: integer): string; overload; virtual;
    class function GetWideString(const bytes: TBytes): WideString; overload; virtual;
    class function GetWideString(const bytes: TBytes; index: integer; count: integer): WideString; overload; virtual;
  end;

  UnicodeEncoding = class(Encoding)
  public
    class function GetString(const bytes: TBytes): string; overload; override;
    class function GetString(const bytes: TBytes; index: integer; count: integer): string; overload; override;
    class function GetWideString(const bytes: TBytes): WideString; overload; override;
    class function GetWideString(const bytes: TBytes; index: integer; count: integer): WideString; overload; override;
  end;

  UTF8Encoding = class(Encoding)
  public
    {$IFDEF BCB}
    {Added to avoid C++ Builder 6 bug}
    class function GetBytes(const chars: string; charIndex, charCount: int; var bytes: TBytes; byteIndex: int): int; overload; override;
    class function {$IFNDEF VER5}GetBytes{$ELSE}GetBytesWide{$ENDIF}(const chars: WideString; charIndex, charCount: int; var bytes: TBytes; byteIndex: int): int; overload; override;
    class function GetString(const bytes: TBytes): string; overload; override;
    {$ENDIF}
    class function GetBytes(const chars: string): TBytes; override;
    class function {$IFNDEF VER5}GetBytes{$ELSE}GetBytesWide{$ENDIF}(const chars: WideString): TBytes; override;

    class function GetString(const bytes: TBytes; index: integer; count: integer): string; overload; override;
    class function GetWideString(const bytes: TBytes): WideString; overload; override;
    class function GetWideString(const bytes: TBytes; index: integer; count: integer): WideString; overload; override;
  end;

  StringBuilder = class
  protected
    FString: string;
    FActualLength: integer;

    procedure SetActualLength(Value: integer);
  public
    constructor Create(capacity: integer); overload;
    constructor Create(const value: string; capacity: integer); overload;
    procedure Append(const value: string); overload;
    procedure Append(const value: string; const startIndex: integer; const count: integer); overload;
    procedure Append(const value: char); overload;
    procedure Append(const value: char; repeatCount: integer); overload;
    procedure Append(value: StringBuilder); overload;
    procedure Insert(index: integer; const value: string); overload;
    procedure Replace(const OldValue: string; const NewValue: string);
    function ToString: string;

    property Length: integer read FActualLength write SetActualLength;
  end;

  Buffer = class
  public
    class procedure BlockCopy(const src: TBytes; srcOffset: integer; const dst: TBytes; dstOffset: integer; count: integer);
  end;

{ MemoryStream }

  MemoryStream = class
  private
    FData: TBytes;
    FPosition: Integer;
    FLength: Integer;

  protected
    procedure SetPosition(const Pos: Integer);

  public
    constructor Create(capacity: int);
    function Seek(Offset: Longint; Origin: Word): Longint;
    function Read(var Buffer: TBytes; Offset: int; Count: int): int; overload;
    function Read(Buffer: PChar; Offset: int; Count: int): int; overload;
    procedure Write(const Buffer: TBytes; Offset: int; Count: int); overload;
    procedure Write(Buffer: PChar; Offset: int; Count: int); overload;
    procedure WriteByte(value: Byte);
    function ReadByte: Byte;
    function GetBuffer: PChar;

    procedure Close;
    procedure SetLength(Value: Integer);

    property Length: Integer read FLength write SetLength;
    property Position: integer read FPosition write SetPosition;
  end;

  ArgumentException = class(Exception)
  public
    constructor Create; overload;
    constructor Create(const Msg: string); overload;
  end;

  NotSupportedException = class(Exception)
  public
    constructor Create; overload;
    constructor Create(const Msg: string); overload;
  end;

{$IFDEF UTF8}
type
  UTF8String = type string;

function UnicodeToUtf8(Dest: PChar; Source: PWideChar; MaxBytes: Integer): Integer; overload;
function UnicodeToUtf8(Dest: PChar; MaxDestBytes: Cardinal; Source: PWideChar; SourceChars: Cardinal): Cardinal; overload;
function Utf8ToUnicode(Dest: PWideChar; Source: PChar; MaxChars: Integer): Integer; overload;
function Utf8ToUnicode(Dest: PWideChar; MaxDestChars: Cardinal; Source: PChar; SourceBytes: Cardinal): Cardinal; overload;
function Utf8Encode(const WS: WideString): UTF8String;
function Utf8Decode(const S: UTF8String): WideString;
function AnsiToUtf8(const S: string): UTF8String;
function Utf8ToAnsi(const S: UTF8String): string;
{$ENDIF}

implementation
uses
{$IFDEF VER7P}
  StrUtils,
{$ELSE}
  CRParser,
{$ENDIF}
  Math;

{ BitConverter }

class function BitConverter.GetBytes(value: word): TBytes;
begin
  SetLength(Result, SizeOf(Word));
  Word(Pointer(Result)^) := value;
end;

class function BitConverter.GetBytes(value: cardinal): TBytes;
begin
  SetLength(Result, SizeOf(Cardinal));
  Cardinal(Pointer(Result)^) := value;
end;

class function BitConverter.GetBytes(value: int64): TBytes;
begin
  SetLength(Result, SizeOf(int64));
  Int64(Pointer(Result)^) := value;
end;

class function BitConverter.GetBytes(value: double): TBytes;
begin
  SetLength(Result, SizeOf(Double));
  Double(Pointer(Result)^) := value;
end;

class function BitConverter.GetBytes(value: Single): TBytes;
begin
  SetLength(Result, SizeOf(Single));
  Single(Pointer(Result)^) := value;
end;

class function BitConverter.Int64BitsToDouble(value: int64): double;
begin
  Result := Double(Pointer(@value)^);
end;

class function BitConverter.DoubleToInt64Bits(value: double): int64;
begin
  Result := PInt64(@value)^;
end;

class function BitConverter.ToDouble(const value: TBytes; startIndex: integer): Double;
begin
  Result := Double(Pointer(PChar(value) + startIndex)^);
end;

class function BitConverter.ToDouble(value: PChar; startIndex: integer): Double;
begin
  Result := Double(Pointer(PChar(value) + startIndex)^);
end;

class function BitConverter.ToSingle(const value: TBytes; startIndex: integer): Single;
begin
  Result := Single(Pointer(PChar(value) + startIndex)^);
end;

class function BitConverter.ToInt64(const value: TBytes; startIndex: integer): Int64;
begin
  Result := Int64(Pointer(PChar(value) + startIndex)^);
end;

class function BitConverter.ToInt64(value: PChar; startIndex: integer): Int64;
begin
  Result := Int64(Pointer(value + startIndex)^);
end;

class function BitConverter.ToInt32(const value: TBytes; startIndex: integer): integer;
begin
  Result := Integer(Pointer(PChar(value) + startIndex)^);
end;

class function BitConverter.ToInt32(value: PChar; startIndex: integer): integer;
begin
  Result := Integer(Pointer(PChar(value) + startIndex)^);
end;

class function BitConverter.ToInt16(const value: TBytes; startIndex: integer): smallint;
begin
  Result := SmallInt(Pointer(PChar(value) + startIndex)^);
end;

class function BitConverter.ToUInt32(const value: TBytes; startIndex: integer): UInt32;
begin
  Result := UInt32(Pointer(PChar(value) + startIndex)^);
end;

class function BitConverter.ToUInt16(const value: TBytes; startIndex: integer): UInt16;
begin
  Result := UInt16(Pointer(PChar(value) + startIndex)^);
end;

class function BitConverter.ToUInt16(value: PChar; startIndex: integer): UInt16;
begin
  Result := UInt16(Pointer(PChar(value) + startIndex)^);
end;


{ Marshal }

class function Marshal.AllocHGlobal(cb: integer): pointer;
begin
  GetMem(Result, cb);
end;

class function Marshal.ReallocHGlobal(pv: pointer; cb: pointer): pointer;
begin
  Result := pv;
  ReallocMem(Result, Integer(cb));
end;

class procedure Marshal.FreeHGlobal(hglobal: pointer);
begin
  FreeMem(hglobal);
end;

class procedure Marshal.FreeCoTaskMem(ptr: pointer);
begin
end;

class function Marshal.ReadByte(ptr: pointer; ofs: integer): byte;
begin
  Result := Byte(Pointer(Integer(ptr) + ofs)^);
end;

class procedure Marshal.WriteByte(ptr: pointer; val: byte);
begin
  Byte(ptr^) := val;
end;

class procedure Marshal.WriteByte(ptr: pointer; ofs: integer; val: byte);
begin
  Byte(Pointer(Integer(ptr) + ofs)^) := val;
end;

class function Marshal.ReadInt16(ptr: pointer; ofs: integer): smallint;
begin
  Result := SmallInt(Pointer(Integer(ptr) + ofs)^);
end;

class procedure Marshal.WriteInt16(ptr: pointer; val: smallint);
begin
  SmallInt(ptr^) := val;
end;

class procedure Marshal.WriteInt16(ptr: pointer; ofs: integer; val: smallint);
begin
  SmallInt(Pointer(Integer(ptr) + ofs)^) := val;
end;

class function Marshal.ReadInt32(ptr: pointer; ofs: integer): integer;
begin
  Result := Integer(Pointer(Integer(ptr) + ofs)^);
end;

class procedure Marshal.WriteInt32(ptr: pointer; val: integer);
begin
  Integer(ptr^) := val;
end;

class procedure Marshal.WriteInt32(ptr: pointer; ofs, val: integer);
begin
  Integer(Pointer(Integer(ptr) + ofs)^) := val;
end;

class function Marshal.ReadInt64(ptr: pointer; ofs: integer): int64;
begin
  Result := Int64(Pointer(Integer(ptr) + ofs)^);
end;

class procedure Marshal.WriteInt64(ptr: pointer; val: int64);
begin
  Int64(ptr^) := val;
end;

class procedure Marshal.WriteInt64(ptr: pointer; val: double);
begin
  Double(ptr^) := val;
end;

class procedure Marshal.WriteInt64(ptr: pointer; ofs: integer; val: int64);
begin
  Int64(Pointer(Integer(ptr) + ofs)^) := val;
end;

class function Marshal.ReadIntPtr(ptr: pointer; ofs: integer): pointer;
begin
  Result := Pointer(Pointer(Integer(ptr) + ofs)^);
end;

class procedure Marshal.WriteIntPtr(ptr, val: pointer);
begin
  Pointer(ptr^) := val;
end;

class procedure Marshal.WriteIntPtr(ptr: pointer; ofs: integer; val: pointer);
begin
  Pointer(Pointer(Integer(ptr) + ofs)^) := val;
end;

class function Marshal.PtrToStringAnsi(ptr: pointer; len: integer = 0): string;
begin
  if len > 0 then begin
    SetLength(Result, len);
    Move(ptr^, PChar(Result)^, len);
  end
  else
    Result := PChar(ptr);
end;

class function Marshal.PtrToStringUni(ptr: pointer; len: integer = 0): WideString;
begin
  if len > 0 then begin
    SetLength(Result, len);
    Move(ptr^, PWideChar(Result)^, len shl 1);
  end
  else
    Result := PWideChar(ptr);
end;

class function Marshal.StringToHGlobalAnsi(const s: string): pointer;
begin
  Result := PChar(s);
end;

class function Marshal.StringToHGlobalUni(const s: WideString): pointer;
begin
  Result := PWideChar(s);
end;

class procedure Marshal.Copy(const source: TBytes; startIndex: integer;
  destination: pointer; length: integer);
begin
  if length = 0 then
    Exit;
  Move(Source[StartIndex], destination^, length);
end;

class procedure Marshal.Copy(Source: pointer; var destination: TBytes;
  startIndex, length: integer);
begin
  if length = 0 then
    Exit;
  Move(source^, destination[startIndex], length);
end;

class function Marshal.GetIUnknownForObject(o: TInterfacedObject): IntPtr;
var
  iu: IUnknown;
begin
  iu := IUnknown(o);
  iu._AddRef; 
  Result := IntPtr(iu);
end;

class function Marshal.AddRef(pUnk: IntPtr): integer;
begin
  Result := IUnknown(pUnk)._AddRef;
end;

class function Marshal.Release(pUnk: IntPtr): integer;
begin
  Result := IUnknown(pUnk)._Release;
end;

{ Encoding }

class function Encoding.Default: EncodingClass;
begin
  Result := Encoding;
end;

class function Encoding.Unicode: EncodingClass;
begin
  Result := UnicodeEncoding;
end;

class function Encoding.UTF8: EncodingClass;
begin
  Result := UTF8Encoding;
end;

class function Encoding.GetBytes(const chars: string): TBytes;
begin
  SetLength(Result, Length(chars));
  Move(PChar(chars)^, Pointer(Result)^, Length(chars));
end;

class function Encoding.GetBytes(const chars: string; charIndex, charCount: int; var bytes: TBytes; byteIndex: int): int;
begin
  if charCount > 0 then
    Move((PChar(chars) + charIndex)^, bytes[byteIndex], charCount);
  Result := charCount;
end;

class function Encoding.{$IFNDEF VER5}GetBytes{$ELSE}GetBytesWide{$ENDIF}(const chars: WideString): TBytes;
begin
  SetLength(Result, Length(chars) shl 1);
  Move(PWideChar(chars)^, Pointer(Result)^, Length(chars) shl 1);
end;

class function Encoding.{$IFNDEF VER5}GetBytes{$ELSE}GetBytesWide{$ENDIF}(const chars: WideString; charIndex, charCount: int; var bytes: TBytes; byteIndex: int): int;
begin
  Move((PWideChar(chars) + charIndex)^, bytes[byteIndex], charCount shl 1);
  Result := charCount shl 1;
end;

class function Encoding.GetString(const bytes: TBytes): string;
begin
  Result := GetString(bytes, 0, Length(bytes));
end;

class function Encoding.GetString(const bytes: TBytes; index: integer; count: integer): string;
begin
  if count = 0 then begin
    Result := '';
    Exit;
  end;
  SetLength(Result, count);
  Move(Pointer(@Bytes[index])^, PChar(Result)^, Length(Result));
end;

class function Encoding.GetWideString(const bytes: TBytes): WideString; 
begin
  Result := GetString(bytes);
end;

class function Encoding.GetWideString(const bytes: TBytes; index: integer; count: integer): WideString;
begin
  Result := GetString(bytes, index, count);
end;

{ UnicodeEncoding }

class function UnicodeEncoding.GetString(const bytes: TBytes): string;
begin
  Result := GetWideString(bytes);
end;

class function UnicodeEncoding.GetString(const bytes: TBytes; index: integer; count: integer): string;
begin
  Result := GetWideString(bytes, index, count);
end;

class function UnicodeEncoding.GetWideString(const bytes: TBytes): WideString;
begin
  Result := GetWideString(bytes, 0, Length(bytes));
end;

class function UnicodeEncoding.GetWideString(const bytes: TBytes; index: integer; count: integer): WideString;
begin
  if count = 0 then begin
    Result := '';
    Exit;
  end;
  SetLength(Result, count shr 1);
  Move(Pointer(@bytes[index])^, PWideChar(Result)^, count);
end;

{ UTF8Encoding }

{$IFDEF UTF8}

// UnicodeToUTF8(3):
// Scans the source data to find the null terminator, up to MaxBytes
// Dest must have MaxBytes available in Dest.

function UnicodeToUtf8(Dest: PChar; Source: PWideChar; MaxBytes: Integer): Integer;
var
  len: Cardinal;
begin
  len := 0;
  if Source <> nil then
    while Source[len] <> #0 do
      Inc(len);
  Result := CLRClasses.UnicodeToUtf8(Dest, MaxBytes, Source, len);
end;

// UnicodeToUtf8(4):
// MaxDestBytes includes the null terminator (last char in the buffer will be set to null)
// Function result includes the null terminator.
// Nulls in the source data are not considered terminators - SourceChars must be accurate

function UnicodeToUtf8(Dest: PChar; MaxDestBytes: Cardinal; Source: PWideChar; SourceChars: Cardinal): Cardinal;
var
  i, count: Cardinal;
  c: Cardinal;
begin
  Result := 0;
  if Source = nil then Exit;
  count := 0;
  i := 0;
  if Dest <> nil then
  begin
    while (i < SourceChars) and (count < MaxDestBytes) do
    begin
      c := Cardinal(Source[i]);
      Inc(i);
      if c <= $7F then
      begin
        Dest[count] := Char(c);
        Inc(count);
      end
      else if c > $7FF then
      begin
        if count + 3 > MaxDestBytes then
          break;
        Dest[count] := Char($E0 or (c shr 12));
        Dest[count+1] := Char($80 or ((c shr 6) and $3F));
        Dest[count+2] := Char($80 or (c and $3F));
        Inc(count,3);
      end
      else //  $7F < Source[i] <= $7FF
      begin
        if count + 2 > MaxDestBytes then
          break;
        Dest[count] := Char($C0 or (c shr 6));
        Dest[count+1] := Char($80 or (c and $3F));
        Inc(count,2);
      end;
    end;
    if count >= MaxDestBytes then count := MaxDestBytes-1;
    Dest[count] := #0;
  end
  else
  begin
    while i < SourceChars do
    begin
      c := Integer(Source[i]);
      Inc(i);
      if c > $7F then
      begin
        if c > $7FF then
          Inc(count);
        Inc(count);
      end;
      Inc(count);
    end;
  end;
  Result := count+1;  // convert zero based index to byte count
end;

function Utf8ToUnicode(Dest: PWideChar; Source: PChar; MaxChars: Integer): Integer;
var
  len: Cardinal;
begin
  len := 0;
  if Source <> nil then
    while Source[len] <> #0 do
      Inc(len);
  Result := CLRClasses.Utf8ToUnicode(Dest, MaxChars, Source, len);
end;

function Utf8ToUnicode(Dest: PWideChar; MaxDestChars: Cardinal; Source: PChar; SourceBytes: Cardinal): Cardinal;
var
  i, count: Cardinal;
  c: Byte;
  wc: Cardinal;
begin
  if Source = nil then
  begin
    Result := 0;
    Exit;
  end;
  Result := Cardinal(-1);
  count := 0;
  i := 0;
  if Dest <> nil then
  begin
    while (i < SourceBytes) and (count < MaxDestChars) do
    begin
      wc := Cardinal(Source[i]);
      Inc(i);
      if (wc and $80) <> 0 then
      begin
        if i >= SourceBytes then Exit;          // incomplete multibyte char
        wc := wc and $3F;
        if (wc and $20) <> 0 then
        begin
          c := Byte(Source[i]);
          Inc(i);
          if (c and $C0) <> $80 then Exit;      // malformed trail byte or out of range char
          if i >= SourceBytes then Exit;        // incomplete multibyte char
          wc := (wc shl 6) or (c and $3F);
        end;
        c := Byte(Source[i]);
        Inc(i);
        if (c and $C0) <> $80 then Exit;       // malformed trail byte

        Dest[count] := WideChar((wc shl 6) or (c and $3F));
      end
      else
        Dest[count] := WideChar(wc);
      Inc(count);
    end;
    if count >= MaxDestChars then count := MaxDestChars-1;
    Dest[count] := #0;
  end
  else
  begin
    while (i < SourceBytes) do
    begin
      c := Byte(Source[i]);
      Inc(i);
      if (c and $80) <> 0 then
      begin
        if i >= SourceBytes then Exit;          // incomplete multibyte char
        c := c and $3F;
        if (c and $20) <> 0 then
        begin
          c := Byte(Source[i]);
          Inc(i);
          if (c and $C0) <> $80 then Exit;      // malformed trail byte or out of range char
          if i >= SourceBytes then Exit;        // incomplete multibyte char
        end;
        c := Byte(Source[i]);
        Inc(i);
        if (c and $C0) <> $80 then Exit;       // malformed trail byte
      end;
      Inc(count);
    end;
  end;
  Result := count+1;
end;

function Utf8Encode(const WS: WideString): UTF8String;
var
  L: Integer;
  Temp: UTF8String;
begin
  Result := '';
  if WS = '' then Exit;
  SetLength(Temp, Length(WS) * 3); // SetLength includes space for null terminator

  L := CLRClasses.UnicodeToUtf8(PChar(Temp), Length(Temp)+1, PWideChar(WS), Length(WS));
  if L > 0 then
    SetLength(Temp, L-1)
  else
    Temp := '';
  Result := Temp;
end;

function Utf8Decode(const S: UTF8String): WideString;
var
  L: Integer;
  Temp: WideString;
begin
  Result := '';
  if S = '' then Exit;
  SetLength(Temp, Length(S));

  L := CLRClasses.Utf8ToUnicode(PWideChar(Temp), Length(Temp)+1, PChar(S), Length(S));
  if L > 0 then
    SetLength(Temp, L-1)
  else
    Temp := '';
  Result := Temp;
end;

function AnsiToUtf8(const S: string): UTF8String;
begin
  Result := Utf8Encode(S);
end;

function Utf8ToAnsi(const S: UTF8String): string;
begin
  Result := Utf8Decode(S);
end;

{$ENDIF}

class function UTF8Encoding.GetBytes(const chars: string): TBytes;
var
  UTF8: UTF8String;
begin
  UTF8 := AnsiToUtf8(chars);
  SetLength(Result, Length(UTF8));
  Move(PChar(UTF8)^, Pointer(Result)^, Length(UTF8));
end;

class function UTF8Encoding.{$IFNDEF VER5}GetBytes{$ELSE}GetBytesWide{$ENDIF}(const chars: WideString): TBytes;
var
  UTF8: UTF8String;
begin
  UTF8 := UTF8Encode(chars);
  SetLength(Result, Length(UTF8));
  Move(PChar(UTF8)^, Pointer(Result)^, Length(UTF8));
end;

class function UTF8Encoding.GetString(const bytes: TBytes; index: integer; count: integer): string;
var
  UTF8: UTF8String;
begin
  if count = 0 then begin
    Result := '';
    Exit;
  end;
  SetLength(UTF8, count);
  
  Move(Pointer(@bytes[index])^, PChar(UTF8)^, Length(UTF8));
  Result := Utf8ToAnsi(UTF8);
end;

class function UTF8Encoding.GetWideString(const bytes: TBytes): WideString;
begin
  Result := GetWideString(bytes, 0, Length(bytes));
end;

class function UTF8Encoding.GetWideString(const bytes: TBytes; index: integer; count: integer): WideString;
var
  UTF8: UTF8String;
begin
  if count = 0 then begin
    Result := '';
    Exit;
  end;
  SetLength(UTF8, count);
  
  Move(Pointer(@bytes[index])^, PChar(UTF8)^, Length(UTF8));
  Result := UTF8Decode(UTF8);
end;

{$IFDEF BCB}
{Added to avoid C++ Builder 6 bug}

class function UTF8Encoding.GetBytes(const chars: string; charIndex, charCount: int; var bytes: TBytes; byteIndex: int): int;
begin
  Result := inherited GetBytes(chars, charIndex, charCount, bytes, byteIndex);
end;

class function UTF8Encoding.{$IFNDEF VER5}GetBytes{$ELSE}GetBytesWide{$ENDIF}(const chars: WideString; charIndex, charCount: int; var bytes: TBytes; byteIndex: int): int;
begin
  Result := inherited GetBytes(chars, charIndex, charCount, bytes, byteIndex);
end;

class function UTF8Encoding.GetString(const bytes: TBytes): string;
begin
  Result := inherited GetString(bytes);
end;

{$ENDIF}


{ StringBuilder }

constructor StringBuilder.Create(capacity: integer);
begin
  FActualLength := 0;
  SetLength(FString, capacity);
end;

constructor StringBuilder.Create(const value: string; capacity: integer);
begin
  Create(capacity);
  Append(value);
end;

procedure StringBuilder.SetActualLength(Value: integer);
var
  l: integer;
begin
  l := System.Length(FString);
  if l - FActualLength < Value then
    SetLength(FString, FActualLength + Value + l shr 1);
  FActualLength := Value;
end;

procedure StringBuilder.Append(const value: string);
var
  l, ls: integer;

begin
  ls := System.Length(value);
  if ls = 0 then
    Exit;

  l := System.Length(FString);
  if l - FActualLength < ls then
    SetLength(FString, FActualLength + ls + l shr 1);
  Move(PChar(value)^, PChar(@FString[FActualLength + 1])^, ls);
  Inc(FActualLength, ls);
end;

procedure StringBuilder.Append(const value: string; const startIndex: integer; const count: integer);
var
  l: integer;

begin
  if count = 0 then
    Exit;

  l := System.Length(FString);
  if l - FActualLength < count then
    SetLength(FString, FActualLength + count + l shr 1);
  Move((PChar(value) + startIndex)^, PChar(@FString[FActualLength + 1])^, count);
  Inc(FActualLength, count);
end;

procedure StringBuilder.Append(const value: char);
var
  l: integer;

begin
  l := System.Length(FString);
  if l - FActualLength < 1 then
    SetLength(FString, FActualLength + 1 + l shr 1);
  FString[FActualLength + 1] := value;
  Inc(FActualLength);
end;

procedure StringBuilder.Append(const value: char; repeatCount: integer);
var
  s: string;
begin
  s := StringOfChar(value, repeatCount);
  Append(s);
end;

procedure StringBuilder.Append(value: StringBuilder);
var
  l: integer;

begin
  if (value = nil) or (value.Length = 0) then
    Exit;

  l := System.Length(FString);
  if l - FActualLength < value.Length then
    SetLength(FString, FActualLength + value.Length + l shr 1);
  Move(PChar(value.FString)^, PChar(@FString[FActualLength + 1])^, value.Length);
  Inc(FActualLength, value.Length);
end;

procedure StringBuilder.Insert(index: integer; const value: string);
var
  l, ls: integer;

begin
  l := System.Length(FString);
  ls := System.Length(value);
  if l - FActualLength < ls then
    SetLength(FString, FActualLength + ls + l shr 1);

  Move(PChar(@FString[Index + 1])^, PChar(@FString[Index + ls + 1])^, FActualLength - Index);
  Move(PChar(value)^, PChar(@FString[Index + 1])^, ls);

  Inc(FActualLength, ls);
end;

procedure StringBuilder.Replace(const OldValue: string; const NewValue: string);

  function PosEx(const SubStr, S: string; Offset, Len: integer): Integer;
  var
    I,X: Integer;
    LenSubStr: Integer;
  begin
    I := Offset;
    LenSubStr := System.Length(SubStr);
    Len := Len - LenSubStr + 1;
    while I <= Len do begin
      if S[I] = SubStr[1] then begin
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

  procedure Insert(index: integer; const value: string; offset: integer);
  var
    l, ls: integer;
  begin
    l := System.Length(FString);
    ls := System.Length(value) - offset + 1;
    if l - FActualLength < ls then
      SetLength(FString, FActualLength + ls + l shr 1);

    if FActualLength > Index then
      Move(PChar(@FString[Index + 1])^, PChar(@FString[Index + ls + 1])^, FActualLength - Index);
    Move(PChar(@value[offset])^, PChar(@FString[Index + 1])^, ls);
  end;

var
  lOld, lNew: integer;
  Index: integer;

begin
  lOld := System.Length(OldValue);
  lNew := System.Length(NewValue);
  Index := PosEx(OldValue, FString, 1, FActualLength);

  while Index > 0 do begin
    if lOld > lNew then begin
      Move(PChar(NewValue)^, PChar(@FString[Index])^, lNew);
      Move(PChar(@FString[Index + lOld])^, PChar(@FString[Index + lNew])^, FActualLength - Index - lOld + 1);
    end else
    if lOld < lNew then begin
      Move(PChar(NewValue)^, PChar(@FString[Index])^, lOld);
      Insert(Index + lOld - 1, NewValue, lOld + 1);
    end else
      Move(PChar(NewValue)^, PChar(@FString[Index])^, lNew);

    Inc(FActualLength, lNew - lOld);
    Index := PosEx(OldValue, FString, Index + lNew, FActualLength);
  end;
end;

function StringBuilder.ToString: string;
begin
  Result := Copy(FString, 1, FActualLength);
end;

{ Buffer }

class procedure Buffer.BlockCopy(const src: TBytes; srcOffset: integer; const dst: TBytes; dstOffset: integer; count: integer);
begin
  Move((PChar(src) + srcOffset)^, (PChar(dst) + dstOffset)^, count);
end;

{ MemoryStream }
constructor MemoryStream.Create(capacity: int);
begin
  inherited Create;
  System.SetLength(FData, capacity);
end;

procedure MemoryStream.Close;
begin
  System.SetLength(FData, 0);
end;

procedure MemoryStream.SetLength(Value: Integer);
const
  MinCapacity = $FFFF;
var
  l: integer;
begin
  l := System.Length(FData); // Performance opt
  if (Value > l) or (l > MinCapacity) then
    System.SetLength(FData, Value);

  FLength := Value;
end;

procedure MemoryStream.SetPosition(const Pos: Integer);
begin
  if Pos > Length then
    Length := Pos;
  FPosition := Pos;
end;

function MemoryStream.Read(var Buffer: TBytes; Offset: int; Count: int): int;
begin
  Result := Read(PChar(@Buffer[0]), Offset, Count);
end;

function MemoryStream.Read(Buffer: PChar; Offset: int; Count: int): int;
begin
  Result := System.Length(FData) - FPosition;
  if Result > Count then
    Result := Count;
  Move(PChar(@FData[FPosition])^, Buffer[Offset], Result);
  Inc(FPosition, Result);
end;

function MemoryStream.ReadByte: Byte;
begin
  Result := FData[FPosition];
  Inc(FPosition);
end;

function MemoryStream.GetBuffer: PChar;
begin
  Result := @FData[0];
end;

procedure MemoryStream.Write(const Buffer: TBytes; Offset: int; Count: int);
begin
  Write(PChar(@Buffer[0]), Offset, Count);
end;

procedure MemoryStream.Write(Buffer: PChar; Offset: int; Count: int);
var
  l: integer;
begin
  l := FPosition + Count;
  if l > Length then
    Length := l;
  Move(Buffer[Offset], PChar(@FData[FPosition])^, Count);
  Inc(FPosition, Count);
end;

procedure MemoryStream.WriteByte(value: Byte);
var
  l: integer;
begin
  l := FPosition + 1;
  if l > Length then
    Length := l;
  FData[FPosition] := Value;
  Inc(FPosition);
end;

function MemoryStream.Seek(Offset: Longint; Origin: Word): Longint;
begin
  case Origin of
    soFromBeginning: FPosition := Offset;
    soFromCurrent: FPosition := FPosition + Offset;
    soFromEnd: FPosition := System.Length(FData) - Offset;
  end;
  if FPosition > System.Length(FData) then
    FPosition := System.Length(FData)
  else if FPosition < 0 then FPosition := 0;
  Result := FPosition;
end;

{ ArgumentException }
constructor ArgumentException.Create;
begin
  inherited Create('');
end;

constructor ArgumentException.Create(const Msg: string);
begin
  inherited Create(Msg);
end;

constructor NotSupportedException.Create;
begin
  inherited Create('');
end;

constructor NotSupportedException.Create(const Msg: string);
begin
  inherited Create(Msg);
end;

initialization

end.
