unit EnProLib;
{##############################################################################}
{ EnProLib - Provides general purpose enhancements to the Envision library     }
{ Copyright (C) 2002  Nick Boland  nick@b-e.com                                }
{ 20556 Country Lake Blvd, Noblesville, IN  46060  USA                         }
{                                                                              }
{ This library is free software; you can redistribute it and/or                }
{ modify it under the terms of the GNU Lesser General Public                   }
{ License as published by the Free Software Foundation; either                 }
{ version 2.1 of the License, or (at your option) any later version.           }
{                                                                              }
{ This library is distributed in the hope that it will be useful,              }
{ but WITHOUT ANY WARRANTY; without even the implied warranty of               }
{ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU            }
{ Lesser General Public License for more details.                              }
{                                                                              }
{ You should have received a copy of the GNU Lesser General Public             }
{ License along with this library; if not, write to the Free Software          }
{ Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA    }
{                                                                              }
{ History: Dec 10, 2001. Nick Boland, preliminary test version                 }
{          Dec 12, 2001. Nick Boland, fix problem calculating percentages      }
{                        on large number of pixels                             }
{          Jan 27, 2002. Nick Boland, add OCR ability to put some broken       }
{                        characters together (dot matrix)                      }
{          Feb 01, 2002. Nick Boland, have deskew do more areas on faster      }
{                        processors and try to do a better job of              }
{                        selecting the areas that get used.                    }
{          Mar 28, 2002. Nick Boland, add GNU Lessor General Public License    }
{##############################################################################}

interface

uses
  SysUtils, WinTypes, WinProcs, Graphics, Classes, Math, Dialogs,
  EnImgScr, EnDiGrph, EnBmpGr, EnJpgGr, EnTifGr, EnTransf, EnMisc, EnPrint;

const
  EnCRLF = #13#10;

type
  TEnPictureMask = (
    prComplete,
    prIncomplete,
    prEmpty,
    prError,
    prSyntax,
    prAmbiguous,
    prIncompNoFill
  );

function  EnIsDigit( ch : AnsiChar ) : Boolean;
function  EnIsAlpha( ch: AnsiChar ): Boolean;
function  EnStrGetNextToken( var S : AnsiString; delimiter : AnsiString ) : AnsiString;
function  EnStrGetValue( const S, item, delim1, delim2, defVal : AnsiString ) : AnsiString;
function  EnStrPosInList( const S, delimiter, item : AnsiString ) : Integer;
function  EnStrAddToList( const S, delimiter, nextitem : AnsiString ) : AnsiString;
function  EnStrAddToListUnique( const S, delimiter, nextitem : AnsiString; makeUnique : Boolean ) : AnsiString;
function  EnStrToFloatDef( const S : AnsiString; Deflt : Extended ) : Extended;
function  EnStrReplace( const S : AnsiString; Srch, Rplc : AnsiString ) : AnsiString;
function  EnPicture( const aMask : AnsiString; var Input : AnsiString; AutoFill : Boolean; var ErrorPos : Integer ) : TEnPictureMask;

function  EnRotateBW90 ( const srcGraphic, dstGraphic : TDibGraphic ) : Boolean;
function  EnRotateBW180( const srcGraphic, dstGraphic : TDibGraphic ) : Boolean;
function  EnRotateBW270( const srcGraphic, dstGraphic : TDibGraphic ) : Boolean;

function  EnCropBW( const srcGraphic : TDibGraphic; srcRect : TRect; const dstGraphic : TDibGraphic ) : Boolean;

function  EnDeskewAngleBW( const srcGraphic : TDibGraphic; maxAngle : Double ) : Double; overload;
function  EnDeskewAngleBW( const srcGraphic : TDibGraphic; maxAngle : Double; var infoMsg, errMsg : AnsiString ) : Double; overload;
function  EnDeskewAngleBW( const srcGraphic : TDibGraphic; srcRect : TRect; maxAngle : Double ) : Double; overload;
function  EnDeskewBW( const srcGraphic, dstGraphic : TDibGraphic; canResize : Boolean; maxAngle : Double ) : Double; overload;
function  EnDeskewBW( const srcGraphic, dstGraphic : TDibGraphic; canResize : Boolean; maxAngle, angle : Double ) : Double; overload;
function  EnDeskewBW( const srcGraphic, dstGraphic : TDibGraphic; canResize : Boolean; const bgColor : TRgb; maxAngle, angle : Double ) : Double; overload;

procedure EnBorderCleanup( const srcGraphic : TDibGraphic; maxDepthInches : Double ); overload;
procedure EnBorderCleanup( const srcGraphic : TDibGraphic; maxDepthInches : Double; const bgColor : TRgb ); overload;

function  EnFindBordersBW( const srcGraphic : TDibGraphic; const bgColor : TRgb ) : TRect;

function  EnNumPixelsInLine( x0, y0, x1, y1 : Integer ) : Integer;
function  EnNumBlackPixelsInLineBW( const srcGraphic : TDibGraphic; x0, y0, x1, y1 : Integer ) : Integer;
function  EnNumBlackPixelsInRowBW( const srcGraphic : TDibGraphic; row, fromCol, toCol : Integer ) : Integer;
function  EnNumBlackPixelsInColBW( const srcGraphic : TDibGraphic; col, fromRow, toRow :Integer ) : Integer;
function  EnLeftEdgeBW( const srcGraphic : TDibGraphic; x0, y0, x1, y1 : Integer; thresholdPct : Double ) : Integer;
function  EnRightEdgeBW( const srcGraphic : TDibGraphic; x0, y0, x1, y1 : Integer; thresholdPct : Double ) : Integer;
function  EnPercentBlackPixelsBW( const srcGraphic : TDibGraphic; srcRect : TRect ) : Integer; overload;
function  EnPercentBlackPixelsBW( const srcGraphic : TDibGraphic; srcRect : TRect; var numBlack, numPixels : LongInt ) : Integer; overload;
function  EnPercentBlackPixelsInLineBW( const srcGraphic : TDibGraphic; x0, y0, x1, y1 : Integer ) : Integer;

function  EnTextLineDetectionBW( const srcGraphic : TDibGraphic; srcRect : TRect; rowThresholdPct, colThresholdPct : Double; var lineRect : TRect; var numRight, numDown : Integer ) : Boolean;
function  EnTextCharDetectionBW( const srcGraphic : TDibGraphic; lineRect : TRect; rowThresholdPct, colThresholdPct : Double; var charRect : TRect; var nextCharColumn : Integer ) : Boolean;

//function  ImagePixelsPercentBlack( SrcBitmap : TBitmap; SrcRect : TRect ) : Integer;
//function  ImagePixelsPercentBlackEx( SrcBitmap : TBitmap; SrcRect : TRect; var NumBlack, NumPixels : LongInt ) : Integer;
//function  ImagePixelsCenterAdjustment( SrcBitmap : TBitmap; SrcRect : TRect; RowThresholdPct, ColThresholdPct : Double; var NumRight, NumDown : LongInt ) : Boolean;

implementation

{$Warnings Off}

function EnIsDigit( ch : AnsiChar ) : Boolean;
{******************************************************************************}
{ Returns TRUE if the given character is a numeric digit, otherwise FALSE.     }
{******************************************************************************}
begin
  Result := ch in ['0'..'9'];
end;

function EnIsAlpha( ch: AnsiChar ): Boolean;
{******************************************************************************}
{ Returns TRUE if the given character is a letter of the alphabet,             }
{ otherwise FALSE.                                                             }
{******************************************************************************}
begin
  Result := ch in ['a'..'z', 'A'..'Z'];
end;

function EnStrGetNextToken( var S : AnsiString; delimiter : AnsiString ) : AnsiString;
{******************************************************************************}
{ Returns a copy of the given string up to, but not including, the given       }
{ delimiter character.  The given string is then modified to remove the        }
{ string that is returned and the delimiter.  Leading and trailing spaces      }
{ are trimmed.                                                                 }
{                                                                              }
{ EXAMPLE                                                                      }
{   list := 'One|Two|Three';                                                   }
{   while list <> '' do begin                                                  }
{     item := StrGetNextToken( list, '|' );                                    }
{   end;                                                                       }
{******************************************************************************}
var
  i : Integer;
begin
  i := Pos( delimiter, S );
  if i = 0 then begin
    Result := Trim( S );
    S := '';
  end else begin
    Result := Trim( Copy( S, 1, i - 1 ) );
    Delete( S, 1, i + Length(delimiter) - 1 );
  end
end;

function EnStrGetValue( const S, item, delim1, delim2, defVal : AnsiString ) : AnsiString;
{******************************************************************************}
{ Returns the value of the given "item" from the given string "S" using the    }
{ given delimiters.  If the item is not found then "defVal" is returned.       }
{                                                                              }
{ EXAMPLE                                                                      }
{   list := 'Item1=123;Item2=456';                                             }
{   value := EnStrGetValue( list, 'Item2', ';', '=', '789' );                  }
{******************************************************************************}
var
  list : AnsiString;
  subList : AnsiString;
  subItem : AnsiString;
begin
  Result := defVal;
  list := S;
  while list <> '' do begin
    subList := EnStrGetNextToken( list, delim1 );
    subItem := EnStrGetNextToken( subList, delim2 );

    { MB Dec 04, 2002 Replace AnsiSameText for Delphi 4 compatibility }
    if AnsiCompareText( item, subItem ) = 0 then Result := Trim( subList );
  end;
end;

function EnStrPosInList( const S, delimiter, item : AnsiString ) : Integer;
{******************************************************************************}
{ Returns the position in the given list using the given delimiter that the    }
{ given item can be found (1..N).  If the item is not found it returns zero.   }
{******************************************************************************}
var
  list : AnsiString;
  i : Integer;
begin
  Result := 0;
  i := 0;
  list := S;
  while list <> '' do begin
    Inc( i );
    if EnStrGetNextToken( list, delimiter ) = Trim( item ) then begin
      Result := i;
      Exit;
    end;
  end;
end;

function EnStrAddToList( const S, delimiter, nextitem : AnsiString ) : AnsiString;
{******************************************************************************}
{ Returns a string that is a list with the given delimiter. The delimiter      }
{ is added only if necessary (current list is not blank and next item is       }
{ not blank).                                                                  }
{******************************************************************************}
var
  item : AnsiString;
begin
  item := Trim( nextitem );
  if S = '' then begin
    Result := item;
  end else if item = '' then begin
    Result := S;
  end else begin
    Result := S + delimiter + item;
  end;
end;

function EnStrAddToListUnique( const S, delimiter, nextitem : AnsiString; makeUnique : Boolean ) : AnsiString;
{******************************************************************************}
{ Returns a string that is a list with the given delimiter. The delimiter      }
{ is added only if necessary (current list is not blank and next item is       }
{ not blank).  If makeUnique is TRUE then this is only done if it does not     }
{ already exist in the list.                                                   }
{******************************************************************************}
begin
  if makeUnique and ( EnStrPosInList( S, delimiter, nextitem ) > 0 ) then begin
    Result := S;
  end else begin
    Result := EnStrAddToList( S, delimiter, nextitem );
  end;
end;

function EnStrToFloatDef( const S : AnsiString; Deflt : Extended ) : Extended;
{******************************************************************************}
{ Returns a floating-point value from the given string. If S does not          }
{ represent a valid floating-point number, it returns the number passed        }
{ in Deflt.                                                                    }
{******************************************************************************}
begin
  try
    Result := StrToFloat( S );
  except
  on EConvertError do
    Result := Deflt;
  end;
end;

function EnStrReplace( const S : AnsiString; Srch, Rplc : AnsiString ) : AnsiString;
{******************************************************************************}
{ Searches through the given string looking for all occurances of Src.         }
{ If found it is replaced with Rplc.                                           }
{******************************************************************************}
var
  j : Integer;
begin
  Result := S;
  while TRUE do begin
    j := Pos( Srch, Result );
    if j = 0 then Exit;
    Delete( Result, j, Length( Srch ) );
    Insert( Rplc, Result, j );
  end;
end;

function EnPicture( const aMask : AnsiString; var Input : AnsiString; AutoFill : Boolean; var ErrorPos : Integer ) : TEnPictureMask;
{******************************************************************************}
{ Returns the status for the given "aMask", and "Input".  If AutoFill is       }
{ TRUE then "Input" will be appropriately modified.  This is primarily         }
{ intended for keyboard input.  "ErrorPos" indicates the position of any       }
{ errors.                                                                      }
{******************************************************************************}

//  Use the following special characters to define the mask along with any
//  other character as a constant:
//
//  Character   Description
//    #         Any digit (0-9)
//    ?         Any letter (a-z or A-Z)
//    &         Any letter (a-z or A-Z - automatically converted to uppercase
//    ~         Any letter (a-z or A-Z - automatically converted to lowercase
//    @         Any character
//    !         Any characters (letters automatically converted to uppercase)
//
//    ;         Next character is to be used literally and not used as a
//              picture mask character
//
//    *         Repeat the following character any number of times.  For
//              instance *& means convert any number of characters to uppercase.
//              To specify a specific number of times, follow the * with a
//              number.  For example, to specify 5 numbers in a row you would
//              use *%{#}
//
//    [abc]     Optional sequence of characters abc that do not need to be
//              entered by the end-user
//
//    {a,b,c}   Grouping operator.  Set of a, b, or c.  The end-user must choose
//              either a, b, or c.  For example {Red,Green,Blue} means the
//              end-user must choose either Red, Green, or Blue.  Similarly
//              {R,G,B} means the end-user must choose between the characters
//              R, G, or B.
//
//  NOTE - the picture mask must be carefully constructed to avoid situations
//  where one element completely contains another element in the group.
//  For example, if you have three valid choices of Auto, Automobile, and Car,
//  do NOT set the mask to {Auto,Automobile,Car}.  Instead set the mask to
//  {Auto[mobile],Car}
//
//  Any other character in the mask is treated as a constant.

const
  SpecialChars = ['#', '?', '&', '!', '@', '*', '{', '}', '[', ']', ',', '~'];

var
  I, J : Integer;
  Rslt : TEnPictureMask;
  Reprocess : Boolean;

  function IsComplete( Rslt : TEnPictureMask ) : Boolean;
  {****************************************************************************}
  { Returns TRUE if result is complete or ambiguous, otherwise FALSE.          }
  {****************************************************************************}
  begin
    result := Rslt in [ prComplete, prAmbiguous ];
  end;

  function IsIncomplete(Rslt: TEnPictureMask): Boolean;
  {****************************************************************************}
  { Returns TRUE if result is incomplete or incomplete no fill,                }
  { otherwise FALSE.                                                           }
  {****************************************************************************}
  begin
    result := Rslt in [ prIncomplete, prIncompNoFill ];
  end;

  function Process( TermCh : Integer ) : TEnPictureMask;
  {****************************************************************************}
  {                                                                            }
  {****************************************************************************}
  var
    Rslt : TEnPictureMask;
    Incomp : Boolean;
    OldI, OldJ, IncompJ, IncompI : Integer;

    procedure Consume( Ch : AnsiChar );
    {**************************************************************************}
    { Consume input.                                                           }
    {**************************************************************************}
    begin
      Input[J] := Ch;
      Inc(J);
      Inc(I);
      inc(ErrorPos);
    end;

    procedure ToGroupEnd( var I : Integer );
    {**************************************************************************}
    { Skip a character or a picture group.                                     }
    {**************************************************************************}
    var
      BrkLevel, BrcLevel : Integer;
    begin
      BrkLevel := 0;
      BrcLevel := 0;
      repeat
        if I = TermCh then Exit;
        case aMask[I] of
        '[': Inc(BrkLevel);
        ']': Dec(BrkLevel);
        '{': Inc(BrcLevel);
        '}': Dec(BrcLevel);
        ';': Inc(I);
        '*':
          begin
            Inc(I);
            while EnIsDigit( aMask[I] ) do Inc(I);
            ToGroupEnd(I);
            Continue;
          end;
        end;
        Inc(I);
      until (BrkLevel = 0) and (BrcLevel = 0);
    end;

    function SkipToComma : Boolean;
    {**************************************************************************}
    { Find the comma separator.                                                }
    {**************************************************************************}
    begin
      repeat ToGroupEnd(I) until (I = TermCh) or (aMask[I] = ',');
      while (I <= TermCh) and (aMask[I] = ',') do Inc(I);
      result := I < TermCh;
    end;

    function CalcTerm : Integer;
    {**************************************************************************}
    { Calculate the end of a group.                                            }
    {**************************************************************************}
    begin
      result := I;
      ToGroupEnd(result);
    end;

    function Iteration : TEnPictureMask;
    {**************************************************************************}
    { The next group is repeated X times.                                      }
    {**************************************************************************}
    var
      oldJ, Itr, K, L : Integer;
      NewTermCh : Integer;
      Rslt : TEnPictureMask;
    begin
      Result := prError;
      Rslt := prError;
      Itr := 0;

      Inc(I);     { Skip '*' }

      { Retrieve number }
      while EnIsDigit( aMask[I] ) do begin
        Itr := Itr * 10 + Byte(aMask[I]) - Byte('0');
        Inc(I);
      end;

      if I > TermCh then begin
        Result := prSyntax;
        Exit;
      end;

      K := I;
      NewTermCh := CalcTerm;

      { If Itr is 0 allow any number, otherwise enforce the number }
      if Itr <> 0 then begin
        for L := 1 to Itr do begin
          I := K;
          Rslt := Process(NewTermCh);
          if not IsComplete(Rslt) then begin
            { Empty means incomplete since all are required }
            { BugFix: empty means incomplete ONLY if no optional input. }
            //  e.g. *3[..] means 0 to 3 times, *3{...} means exactly 3 times
            if (Rslt = prEmpty) then begin
              if (aMask[K] <> '[') then Result := prIncomplete
              else Result := prAmbiguous;
            end;
            Exit;
          end;
        end;
      end else begin
        repeat
          OldJ := J;
          I := K;
          Rslt := Process(NewTermCh);
        until not IsComplete(Rslt) or (OldJ = J);
        if (Rslt = prEmpty) or (Rslt = prError) then begin
          Inc(I);
          Rslt := prAmbiguous;
        end;
      end;
      if IsComplete(Rslt) then I := NewTermCh;
      Result := Rslt;
    end;

    function Group : TEnPictureMask;
    {**************************************************************************}
    { Process a picture group.                                                 }
    {**************************************************************************}
    var
      TermCh: cardinal;
    begin
      TermCh := CalcTerm;
      Inc(I);
      Result := Process(TermCh - 1);
      if not IsIncomplete(Result) then I := TermCh;
    end;

    function CheckComplete( Rslt : TEnPictureMask ) : TEnPictureMask;
    {**************************************************************************}
    {                                                                          }
    {**************************************************************************}
    var
      J, Z: Integer;
    begin
      J := I;
      if IsIncomplete(Rslt) then begin
        { Skip optional pieces }
        while True do begin
          case aMask[J] of
          '[': ToGroupEnd(J);
          '*':
            if not EnIsDigit( aMask[J + 1] ) then begin
              Inc(J);
              ToGroupEnd(J);
            end else begin
              Z := J;
              repeat inc(Z) until not EnIsDigit( aMask[Z] );
              if aMask[Z] = '[' then begin
                J := Z;
                ToGroupEnd(J);
              end else
                Break;
            end;
          else
            Break;
          end;
        end;
        if J = TermCh then Rslt := prAmbiguous;
      end;
      Result := Rslt;
    end;

    function Scan : TEnPictureMask;
    {**************************************************************************}
    {                                                                          }
    {**************************************************************************}

      function LoCase( c : AnsiChar ) : AnsiChar;
      {************************************************************************}
      { Convert character to lower case.                                       }
      {************************************************************************}
      begin
        result := AnsiChar(longInt(Lowercase(AnsiChar(longInt(c)))));
      end;

    var
      Ch : AnsiChar;
      Rslt : TEnPictureMask;
    begin

      Scan := prError;
      Rslt := prEmpty;
      while (I <> TermCh) and (aMask[I] <> ',') do begin
        if J > Length(Input) then begin
          Scan := CheckComplete(Rslt);
          Exit;
        end;

        Ch := Input[J];
        case aMask[I] of
        '#': if not EnIsDigit( ch ) then Exit
             else Consume(Ch);
        '?': if not isCharAlpha(Char(ch)) then Exit
             else Consume(Ch);
        '&': if not isCharAlpha(Char(ch)) then Exit
             else Consume(UpCase(ch));
        '~': if not isCharAlpha(Char(ch)) then Exit     // New special char in DBD32
             else Consume(LoCase(ch));
        '!': Consume(UpCase(ch));
        '@': Consume(Ch);
        '*':
            begin
              Rslt := Iteration;
              if not IsComplete(Rslt) then begin
                Scan := Rslt;
                Exit;
              end;
              if Rslt = prError then Rslt := prAmbiguous;
            end;
        '{':
            begin
              Rslt := Group;
              if not IsComplete(Rslt) then begin
                Scan := Rslt;
                Exit;
              end;
            end;
        '[':
            begin
              Rslt := Group;
              if IsIncomplete(Rslt) then begin
                Scan := Rslt;
                Exit;
              end;
              if (Rslt = prError) then Rslt := prAmbiguous;
            end;
        else
          if aMask[I] = ';' then Inc(I);
          if (UpCase(aMask[i]) = UpCase(ch)) or (Ch = ' ')
          then Consume(aMask[I])
          else Exit;
        end;

        if Rslt = prAmbiguous then
          Rslt := prIncompNoFill
        else
          Rslt := prIncomplete;
      end;

      if Rslt = prIncompNoFill then
        Scan := prAmbiguous
      else
        Scan := prComplete;
    end;

  begin
    Incomp := False;
    IncompI := 0;
    IncompJ := 0;
    OldI := I;
    OldJ := J;
    repeat
      Rslt := Scan;

      { Only accept completes if they make it farther in the input
        stream from the last incomplete }
      {Bug???Fix??? J < IncompJ --> J <= IncompJ}
      if (Rslt in [prComplete, prAmbiguous]) and Incomp and (J <= IncompJ) then begin
        Rslt := prIncomplete;
        J := IncompJ;
      end;

      if (Rslt = prError) or (Rslt = prIncomplete) then begin
        Process := Rslt;
        if not Incomp and (Rslt = prIncomplete) then begin
          Incomp := True;
          IncompI := I;
          IncompJ := J;
        end;
        I := OldI;
        J := OldJ;
        if not SkipToComma then begin
          if Incomp then begin
            Process := prIncomplete;
            I := IncompI;
            J := IncompJ;
          end;
          Exit;
        end;
        OldI := I;
      end;
    until (Rslt <> prError) and (Rslt <> prIncomplete);

    if (Rslt = prComplete) and Incomp then
      Process := prAmbiguous
    else
      Process := Rslt;
  end;

begin
  Result := prComplete;
  ErrorPos := 1;
  if aMask = '' then exit;

  Result := prEmpty;
  if Input = '' then Exit;

  J := 1;
  I := 1;

  Rslt := Process(Length(aMask) + 1);
  if (Rslt <> prError) and (Rslt <> prSyntax) and (J <= Length(Input)) then
    Rslt := prError;

  if (Rslt = prIncomplete) and AutoFill then begin
    Reprocess := False;
    while (I <= Length(aMask)) and
      not (aMask[I] in SpecialChars) do
    begin
      if aMask[I] = ';' then Inc(I);
      Input := Input + aMask[I];
      Inc(I);
      Reprocess := True;
    end;
    J := 1;
    I := 1;
    if Reprocess then
      Rslt := Process(Length(aMask) + 1)
  end;

  case Rslt of
    prAmbiguous : Result := prComplete;
    prIncompNoFill : Result := prIncomplete;
  else
    Result := Rslt;
  end;
end;

function EnRotateBW90( const srcGraphic, dstGraphic : TDibGraphic ) : Boolean;
{******************************************************************************}
{ Returns TRUE if the rotation was performed, otherwise FALSE.                 }
{                                                                              }
{ The rotation is optimized by reading a block of 32 long words, rotating      }
{ those by 90 degrees, and then writing them to the proper place in the        }
{ destination.                                                                 }
{                                                                              }
{ NOTE - It is optimized for B/W images only.                                  }
{                                                                              }
{ Before       After        The image is broken up into blocks of 32x32 pixels.}
{ +-------+   +---------+   Each block is read from the source, rotated using  }
{ |       |   |x        |   optimized inline code, and then written to the     }
{ |       |   |         |   destination.                                       }
{ |x      |   +---------+                                                      }
{ +-------+                                                                    }
{                                                                              }
{ By starting the blocks in the lower left hand corner, the left over at the   }
{ top and right of the source becomes the left over on the right and bottom    }
{ of the destination.                                                          }
{                                                                              }
{ NOTE - Long word access must compensate for memory byte order.               }
{ NOTE - Scan lines are aligned to long word boundaries.                       }
{ NOTE - Scan line memory locations decrease working from the top down.        }
{                                                                              }
{ Benchmark                                                    Time  Improve   }
{ ---------                                                    ----  -------   }
{ 2550 x 3300 Original                                         4.48     1.0x   }
{ 2550 x 3300 Use 8x8 blocks inline                            0.60     7.5x   }
{ 2550 x 3300 Use 32x32 blocks inline                          0.28    16.0x   }
{******************************************************************************}
type
  PLWord = ^LongWord;
const
  BLOCKSIZE = 32;
  LWBit : array [ 0 .. 31 ] of LongWord =
    ( $01000000, $02000000, $04000000, $08000000, $10000000, $20000000, $40000000, $80000000,
      $00010000, $00020000, $00040000, $00080000, $00100000, $00200000, $00400000, $00800000,
      $00000100, $00000200, $00000400, $00000800, $00001000, $00002000, $00004000, $00008000,
      $00000001, $00000002, $00000004, $00000008, $00000010, $00000020, $00000040, $00000080 );
var
  xSrc, ySrc : Integer;   // x is Bytes, y is ScanLines
  xDst, yDst : Integer;   // x is Bytes, y is ScanLines
  i : Word;
  pSrcByte, pDstByte : ^Byte;
  srcLWord : LongWord;
  dstBlock : array [ 0 .. BLOCKSIZE - 1 ] of LongWord;
  dstBit : LongWord;
begin
  Result := FALSE;
  { See if conditions are good }
  if srcGraphic.ImageFormat <> ifBlackWhite then Exit;

  { Create new image }
  dstGraphic.NewImage( srcGraphic.Height, srcGraphic.Width, srcGraphic.ImageFormat, srcGraphic.PalettePtr, srcGraphic.XDotsPerInch, srcGraphic.YDotsPerInch );

  { Go through grids }
  xDst := 0;
  ySrc := srcGraphic.Height - BLOCKSIZE;
  while ( ySrc + BLOCKSIZE ) > 0 do begin

    yDst := 0;
    xSrc := 0;
    while xSrc < ( ( ( srcGraphic.Width + BLOCKSIZE - 1 ) div BLOCKSIZE ) * 4 ) do begin    // 4 is Bytes per LongWord

      for i := 0 to BLOCKSIZE - 1 do dstBlock[i] := $0;       // Clear transform block

      pSrcByte := Addr( srcGraphic.ScanLine[ ySrc ] ^ [ xSrc ] );

      for i := 0 to BLOCKSIZE - 1 do begin                    // Rotate block

        dstBit := LWBit[i];                                   // Has to do with memory byte order

        if ( ySrc + i ) >= 0 then begin

          srcLWord := PLWord( pSrcByte )^;

          if ( srcLWord and $00000080 ) <> 0 then dstBlock[ 0] := dstBlock[ 0] or dstBit;
          if ( srcLWord and $00000040 ) <> 0 then dstBlock[ 1] := dstBlock[ 1] or dstBit;
          if ( srcLWord and $00000020 ) <> 0 then dstBlock[ 2] := dstBlock[ 2] or dstBit;
          if ( srcLWord and $00000010 ) <> 0 then dstBlock[ 3] := dstBlock[ 3] or dstBit;
          if ( srcLWord and $00000008 ) <> 0 then dstBlock[ 4] := dstBlock[ 4] or dstBit;
          if ( srcLWord and $00000004 ) <> 0 then dstBlock[ 5] := dstBlock[ 5] or dstBit;
          if ( srcLWord and $00000002 ) <> 0 then dstBlock[ 6] := dstBlock[ 6] or dstBit;
          if ( srcLWord and $00000001 ) <> 0 then dstBlock[ 7] := dstBlock[ 7] or dstBit;

          if ( srcLWord and $00008000 ) <> 0 then dstBlock[ 8] := dstBlock[ 8] or dstBit;
          if ( srcLWord and $00004000 ) <> 0 then dstBlock[ 9] := dstBlock[ 9] or dstBit;
          if ( srcLWord and $00002000 ) <> 0 then dstBlock[10] := dstBlock[10] or dstBit;
          if ( srcLWord and $00001000 ) <> 0 then dstBlock[11] := dstBlock[11] or dstBit;
          if ( srcLWord and $00000800 ) <> 0 then dstBlock[12] := dstBlock[12] or dstBit;
          if ( srcLWord and $00000400 ) <> 0 then dstBlock[13] := dstBlock[13] or dstBit;
          if ( srcLWord and $00000200 ) <> 0 then dstBlock[14] := dstBlock[14] or dstBit;
          if ( srcLWord and $00000100 ) <> 0 then dstBlock[15] := dstBlock[15] or dstBit;

          if ( srcLWord and $00800000 ) <> 0 then dstBlock[16] := dstBlock[16] or dstBit;
          if ( srcLWord and $00400000 ) <> 0 then dstBlock[17] := dstBlock[17] or dstBit;
          if ( srcLWord and $00200000 ) <> 0 then dstBlock[18] := dstBlock[18] or dstBit;
          if ( srcLWord and $00100000 ) <> 0 then dstBlock[19] := dstBlock[19] or dstBit;
          if ( srcLWord and $00080000 ) <> 0 then dstBlock[20] := dstBlock[20] or dstBit;
          if ( srcLWord and $00040000 ) <> 0 then dstBlock[21] := dstBlock[21] or dstBit;
          if ( srcLWord and $00020000 ) <> 0 then dstBlock[22] := dstBlock[22] or dstBit;
          if ( srcLWord and $00010000 ) <> 0 then dstBlock[23] := dstBlock[23] or dstBit;

          if ( srcLWord and $80000000 ) <> 0 then dstBlock[24] := dstBlock[24] or dstBit;
          if ( srcLWord and $40000000 ) <> 0 then dstBlock[25] := dstBlock[25] or dstBit;
          if ( srcLWord and $20000000 ) <> 0 then dstBlock[26] := dstBlock[26] or dstBit;
          if ( srcLWord and $10000000 ) <> 0 then dstBlock[27] := dstBlock[27] or dstBit;
          if ( srcLWord and $08000000 ) <> 0 then dstBlock[28] := dstBlock[28] or dstBit;
          if ( srcLWord and $04000000 ) <> 0 then dstBlock[29] := dstBlock[29] or dstBit;
          if ( srcLWord and $02000000 ) <> 0 then dstBlock[30] := dstBlock[30] or dstBit;
          if ( srcLWord and $01000000 ) <> 0 then dstBlock[31] := dstBlock[31] or dstBit;

        end;

        pSrcByte := Ptr( Integer( pSrcByte ) - srcGraphic.ScanLineSize );   // Scan lines run backwards
      end;

      { No significant savings making it inline }
      pDstByte := Addr( dstGraphic.ScanLine[ yDst ] ^ [ xDst ] );
      for i := 0 to BLOCKSIZE - 1 do begin
        if ( ( yDst + i ) < dstGraphic.Height ) then begin
          PLWORD( pDstByte )^ := dstBlock[i];
        end;
        pDstByte := Ptr( Integer( pDstByte ) - dstGraphic.ScanLineSize );   // Scan lines run backwards
      end;

      Inc( xSrc, BLOCKSIZE div 8 );
      Inc( yDst, BLOCKSIZE );
    end;

    Inc( xDst, BLOCKSIZE div 8 );
    Dec( ySrc, BLOCKSIZE );
  end;

  Result := TRUE;
end;

function EnRotateBW180( const srcGraphic, dstGraphic : TDibGraphic ) : Boolean;
{******************************************************************************}
{ Returns TRUE if the rotation was performed, otherwise FALSE.                 }
{                                                                              }
{ The rotation is optimized by using long word, word, and byte access          }
{ whenever possible.  As a last resort it will work with the individual bits.  }
{                                                                              }
{ NOTE - It is optimized for B/W images only.                                  }
{                                                                              }
{ Before       After                                                           }
{ +-------+   +-------+                                                        }
{ |x      |   |       |                                                        }
{ |       |   |       |                                                        }
{ |       |   |      x|                                                        }
{ +-------+   +-------+                                                        }
{                                                                              }
{ NOTE - Long word access must compensate for memory byte order.               }
{ NOTE - Scan lines are aligned to long word boundaries.                       }
{ NOTE - Scan line memory locations decrease working from the top down.        }
{******************************************************************************}
type
  PLWord = ^LongWord;

const
  LWBit : array [ 0 .. 31 ] of LongWord =
    ( $00000080, $00000040, $00000020, $00000010, $00000008, $00000004, $00000002, $00000001,
      $00008000, $00004000, $00002000, $00001000, $00000800, $00000400, $00000200, $00000100,
      $00800000, $00400000, $00200000, $00100000, $00080000, $00040000, $00020000, $00010000,
      $80000000, $40000000, $20000000, $10000000, $08000000, $04000000, $02000000, $01000000 );

  NotLWBit : array [ 0 .. 31 ] of LongWord =
    ( $FFFFFF7F, $FFFFFFBF, $FFFFFFDF, $FFFFFFEF, $FFFFFFF7, $FFFFFFFB, $FFFFFFFD, $FFFFFFFE,
      $FFFF7FFF, $FFFFBFFF, $FFFFDFFF, $FFFFEFFF, $FFFFF7FF, $FFFFFBFF, $FFFFFDFF, $FFFFFEFF,
      $FF7FFFFF, $FFBFFFFF, $FFDFFFFF, $FFEFFFFF, $FFF7FFFF, $FFFBFFFF, $FFFDFFFF, $FFFEFFFF,
      $7FFFFFFF, $BFFFFFFF, $DFFFFFFF, $EFFFFFFF, $F7FFFFFF, $FBFFFFFF, $FDFFFFFF, $FEFFFFFF );

var
  dstWidth, dstHeight : LongInt;
  srcWidth, srcHeight : LongInt;

  srcX, srcY : LongInt;
  dstX, dstY : LongInt;

  pDstByte, pSrcByte : ^Byte;

  dstByte, srcByte : Byte;
  dstWord, srcWord : LongWord;
  dstLWord, srcLWord : LongWord;

  optBits : Integer;

  i : Integer;
  srcNBit : Integer;
  dstNBit : Integer;

begin
  Result := FALSE;
  { See if conditions are good }
  if srcGraphic.ImageFormat <> ifBlackWhite then Exit;

  srcWidth  := srcGraphic.Width;
  srcHeight := srcGraphic.Height;
  dstWidth  := srcWidth;
  dstHeight := srcHeight;

  { Create new image }
  dstGraphic.NewImage( srcGraphic.Width, srcGraphic.Height, srcGraphic.ImageFormat, srcGraphic.PalettePtr, srcGraphic.XDotsPerInch, srcGraphic.YDotsPerInch );

  pSrcByte := nil;
  srcNBit := 0;

  dstY := 0;
  while dstY < dstHeight do begin

    pDstByte := Addr( dstGraphic.ScanLine[ dstY ] ^ [ 0 div 8 ] );
    dstNBit := 0;

    dstX := 0;
    while dstX < dstWidth do begin

      srcX := srcGraphic.Width - 1 - dstX;
      srcY := srcGraphic.Height - 1 - dstY;

      optBits := 0;
      if ( dstX mod 32 ) = 0 then begin
        optBits := 32;
        pSrcByte := Addr( SrcGraphic.ScanLine[ srcY ] ^ [ 4 * ( srcX div 32 ) ] );
        srcNBit := srcX mod 32;
      end;
      if ( optBits = 0 ) and ( ( dstX mod 16 ) = 0 ) then begin
        optBits := 16;
        pSrcByte := Addr( SrcGraphic.ScanLine[ srcY ] ^ [ 2 * ( srcX div 16 ) ] );
        srcNBit := srcX mod 16;
      end;
      if ( optBits = 0 ) and ( ( dstX mod 8 ) = 0 ) then begin
        optBits := 8;
        pSrcByte := Addr( SrcGraphic.ScanLine[ srcY ] ^ [ 1 * ( srcX div 8 ) ] );
        srcNBit := srcX mod 8;
      end;

      { WORK WITH LONG WORDS }
      if optBits = 32 then begin

        dstLWord := $FFFFFFFF;
        srcLWord := PLWord( pSrcByte )^;
        for i := 0 to optBits - 1 do begin
          if ( srcNBit < 0 ) and ( srcX >= optBits ) then begin
            srcNBit := optBits - 1;
            pSrcByte := Ptr( Integer( pSrcByte ) - 4 );
            srcLWord := PLWord( pSrcByte )^;
          end;
          if ( srcLWord and LWBit[ srcNBit ] ) = 0 then dstLWord := dstLWord and NotLWBit[i];
          Dec( srcNBit );
        end;

        PLWord( pDstByte )^ := dstLWord;
        pDstByte := Ptr( Integer( pDstByte ) + 4 );
        Inc( dstX, 32 );
        dstNBit := 0;

      { WORK WITH WORDS }
      end else if optBits = 16 then begin

        dstWord := $FFFF;
        srcWord := PWord( pSrcByte )^;
        for i := 0 to optBits - 1 do begin
          if ( srcNBit < 0 ) and ( srcX >= optBits ) then begin
            srcNBit := optBits - 1;
            pSrcByte := Ptr( Integer( pSrcByte ) - 2 );
            srcWord := PWord( pSrcByte )^;
          end;
          if ( srcWord and LWBit[ srcNBit ] ) = 0 then dstWord := dstWord and NotLWBit[i];
          Dec( srcNBit );
        end;

        PWord( pDstByte )^ := dstWord;
        pDstByte := Ptr( Integer( pDstByte ) + 2 );
        Inc( dstX, 16 );
        dstNBit := 0;

      { WORK WITH BYTES }
      end else if optBits = 8 then begin

        dstByte := $FF;
        srcByte := pSrcByte^;
        for i := 0 to optBits - 1 do begin
          if ( srcNBit < 0 ) and ( srcX >= optBits ) then begin
            srcNBit := optBits - 1;
            pSrcByte := Ptr( Integer( pSrcByte ) - 1 );
            srcByte := pSrcByte^;
          end;
          if ( srcByte and LWBit[ srcNBit ] ) = 0 then dstByte := dstByte and NotLWBit[i];
          Dec( srcNBit );
        end;

        pDstByte^ := dstByte;
        pDstByte := Ptr( Integer( pDstByte ) + 1 );
        Inc( dstX, 8 );
        dstNBit := 0;

      { WORK WITH INDIVIDUAL BITS }
      end else begin

        if ( srcX >= 0 ) and ( srcX < srcWidth ) and ( srcY >= 0 ) and ( srcY < srcHeight ) then begin
          if ( ( SrcGraphic.ScanLine[ srcY ] ^ [ srcX div 8 ] ) and LWBit[ srcX mod 8 ] ) = 0 then begin
            pDstByte^ := pDstByte^ and NotLWBit[ dstNBit ];
          end else begin
            pDstByte^ := pDstByte^ or LWBit[ dstNBit ];
          end;
        end else begin
          pDstByte^ := pDstByte^ or LWBit[ dstNBit ];
        end;

        Inc( dstNBit );
        if dstNBit >= 8 then begin
          dstNBit := 0;
          pDstByte := Ptr( Integer( pDstByte ) + 1 );
        end;

        Inc( dstX );
      end;

    end;

    Inc( dstY );
  end;

  Result := TRUE;
end;

function EnRotateBW270( const srcGraphic, dstGraphic : TDibGraphic ) : Boolean;
{******************************************************************************}
{ Returns TRUE if the rotation was performed, otherwise FALSE.                 }
{                                                                              }
{ The rotation is optimized by reading a block of 32 long words, rotating      }
{ those by 270 degrees, and then writing them to the proper place in the       }
{ destination.                                                                 }
{                                                                              }
{ NOTE - It is optimized for B/W images only.                                  }
{                                                                              }
{ Before       After        The image is broken up into blocks of 32x32 pixels.}
{ +-------+   +---------+   Each block is read from the source, rotated using  }
{ |x      |   |         |   optimized inline code, and then written to the     }
{ |       |   |x        |   destination.                                       }
{ |       |   +---------+                                                      }
{ +-------+                                                                    }
{                                                                              }
{ By starting the blocks in the upper left hand corner, the left over at the   }
{ bottom and right of the source becomes the left over on the top and right    }
{ of the destination.                                                          }
{                                                                              }
{ NOTE - Long word access must compensate for memory byte order.               }
{ NOTE - Scan lines are aligned to long word boundaries.                       }
{ NOTE - Scan line memory locations decrease working from the top down.        }
{******************************************************************************}
type
  PLWord = ^LongWord;
const
  BLOCKSIZE = 32;
  LWBit : array [ 0 .. 31 ] of LongWord =
    ( $00000080, $00000040, $00000020, $00000010, $00000008, $00000004, $00000002, $00000001,
      $00008000, $00004000, $00002000, $00001000, $00000800, $00000400, $00000200, $00000100,
      $00800000, $00400000, $00200000, $00100000, $00080000, $00040000, $00020000, $00010000,
      $80000000, $40000000, $20000000, $10000000, $08000000, $04000000, $02000000, $01000000 );
var
  xSrc, ySrc : Integer;   // x is Bytes, y is ScanLines
  xDst, yDst : Integer;   // x is Bytes, y is ScanLines
  i : Word;
  pSrcByte, pDstByte : ^Byte;
  srcLWord : LongWord;
  dstBlock : array [ 0 .. BLOCKSIZE - 1 ] of LongWord;
  dstBit : LongWord;
begin
  Result := FALSE;
  { See if conditions are good }
  if srcGraphic.ImageFormat <> ifBlackWhite then Exit;

  { Create new image }
  dstGraphic.NewImage( srcGraphic.Height, srcGraphic.Width, srcGraphic.ImageFormat, srcGraphic.PalettePtr, srcGraphic.XDotsPerInch, srcGraphic.YDotsPerInch );

  { Go through grids }
  xDst := 0;
  ySrc := 0;
  while ySrc < srcGraphic.Height do begin

    yDst := dstGraphic.Height - BLOCKSIZE;
    xSrc := 0;
    while xSrc < ( ( ( srcGraphic.Width + BLOCKSIZE - 1 ) div BLOCKSIZE ) * 4 ) do begin    // 4 is Bytes per LongWord

      for i := 0 to BLOCKSIZE - 1 do dstBlock[i] := $0;       // Clear transform block

      pSrcByte := Addr( srcGraphic.ScanLine[ ySrc ] ^ [ xSrc ] );

      for i := 0 to BLOCKSIZE - 1 do begin                    // Rotate block

        dstBit := LWBit[i];                                   // Has to do with memory byte order

        if ( ySrc + i ) < srcGraphic.Height then begin

          srcLWord := PLWord( pSrcByte )^;

          if ( srcLWord and $00000080 ) <> 0 then dstBlock[31] := dstBlock[31] or dstBit;
          if ( srcLWord and $00000040 ) <> 0 then dstBlock[30] := dstBlock[30] or dstBit;
          if ( srcLWord and $00000020 ) <> 0 then dstBlock[29] := dstBlock[29] or dstBit;
          if ( srcLWord and $00000010 ) <> 0 then dstBlock[28] := dstBlock[28] or dstBit;
          if ( srcLWord and $00000008 ) <> 0 then dstBlock[27] := dstBlock[27] or dstBit;
          if ( srcLWord and $00000004 ) <> 0 then dstBlock[26] := dstBlock[26] or dstBit;
          if ( srcLWord and $00000002 ) <> 0 then dstBlock[25] := dstBlock[25] or dstBit;
          if ( srcLWord and $00000001 ) <> 0 then dstBlock[24] := dstBlock[24] or dstBit;

          if ( srcLWord and $00008000 ) <> 0 then dstBlock[23] := dstBlock[23] or dstBit;
          if ( srcLWord and $00004000 ) <> 0 then dstBlock[22] := dstBlock[22] or dstBit;
          if ( srcLWord and $00002000 ) <> 0 then dstBlock[21] := dstBlock[21] or dstBit;
          if ( srcLWord and $00001000 ) <> 0 then dstBlock[20] := dstBlock[20] or dstBit;
          if ( srcLWord and $00000800 ) <> 0 then dstBlock[19] := dstBlock[19] or dstBit;
          if ( srcLWord and $00000400 ) <> 0 then dstBlock[18] := dstBlock[18] or dstBit;
          if ( srcLWord and $00000200 ) <> 0 then dstBlock[17] := dstBlock[17] or dstBit;
          if ( srcLWord and $00000100 ) <> 0 then dstBlock[16] := dstBlock[16] or dstBit;

          if ( srcLWord and $00800000 ) <> 0 then dstBlock[15] := dstBlock[15] or dstBit;
          if ( srcLWord and $00400000 ) <> 0 then dstBlock[14] := dstBlock[14] or dstBit;
          if ( srcLWord and $00200000 ) <> 0 then dstBlock[13] := dstBlock[13] or dstBit;
          if ( srcLWord and $00100000 ) <> 0 then dstBlock[12] := dstBlock[12] or dstBit;
          if ( srcLWord and $00080000 ) <> 0 then dstBlock[11] := dstBlock[11] or dstBit;
          if ( srcLWord and $00040000 ) <> 0 then dstBlock[10] := dstBlock[10] or dstBit;
          if ( srcLWord and $00020000 ) <> 0 then dstBlock[ 9] := dstBlock[ 9] or dstBit;
          if ( srcLWord and $00010000 ) <> 0 then dstBlock[ 8] := dstBlock[ 8] or dstBit;

          if ( srcLWord and $80000000 ) <> 0 then dstBlock[ 7] := dstBlock[ 7] or dstBit;
          if ( srcLWord and $40000000 ) <> 0 then dstBlock[ 6] := dstBlock[ 6] or dstBit;
          if ( srcLWord and $20000000 ) <> 0 then dstBlock[ 5] := dstBlock[ 5] or dstBit;
          if ( srcLWord and $10000000 ) <> 0 then dstBlock[ 4] := dstBlock[ 4] or dstBit;
          if ( srcLWord and $08000000 ) <> 0 then dstBlock[ 3] := dstBlock[ 3] or dstBit;
          if ( srcLWord and $04000000 ) <> 0 then dstBlock[ 2] := dstBlock[ 2] or dstBit;
          if ( srcLWord and $02000000 ) <> 0 then dstBlock[ 1] := dstBlock[ 1] or dstBit;
          if ( srcLWord and $01000000 ) <> 0 then dstBlock[ 0] := dstBlock[ 0] or dstBit;

        end;

        pSrcByte := Ptr( Integer( pSrcByte ) - srcGraphic.ScanLineSize );   // Scan lines run backwards
      end;

      { No significant savings making it inline }
      pDstByte := Addr( dstGraphic.ScanLine[ yDst ] ^ [ xDst ] );
      for i := 0 to BLOCKSIZE - 1 do begin
        if ( ( yDst + i ) >= 0 ) then begin
          PLWORD( pDstByte )^ := dstBlock[i];
        end;
        pDstByte := Ptr( Integer( pDstByte ) - dstGraphic.ScanLineSize );   // Scan lines run backwards
      end;

      Inc( xSrc, BLOCKSIZE div 8 );
      Dec( yDst, BLOCKSIZE );
    end;

    Inc( xDst, BLOCKSIZE div 8 );
    Inc( ySrc, BLOCKSIZE );
  end;

  Result := TRUE;
end;

function EnCropBW( const srcGraphic : TDibGraphic; srcRect : TRect; const dstGraphic : TDibGraphic ) : Boolean;
{******************************************************************************}
{ Returns TRUE if the crop was performed, otherwise FALSE.                     }
{                                                                              }
{ The crop is optimized by using long word, word, and byte access              }
{ whenever possible.  As a last resoort it will work with the individual bits. }
{                                                                              }
{ NOTE - It is optimized for B/W images only.                                  }
{                                                                              }
{ NOTE - Long word access must compensate for memory byte order.               }
{ NOTE - Scan lines are aligned to long word boundaries.                       }
{ NOTE - Scan line memory locations decrease working from the top down.        }
{******************************************************************************}
type
  PLWord = ^LongWord;

const
  LWBit : array [ 0 .. 31 ] of LongWord =
    ( $00000080, $00000040, $00000020, $00000010, $00000008, $00000004, $00000002, $00000001,
      $00008000, $00004000, $00002000, $00001000, $00000800, $00000400, $00000200, $00000100,
      $00800000, $00400000, $00200000, $00100000, $00080000, $00040000, $00020000, $00010000,
      $80000000, $40000000, $20000000, $10000000, $08000000, $04000000, $02000000, $01000000 );

  NotLWBit : array [ 0 .. 31 ] of LongWord =
    ( $FFFFFF7F, $FFFFFFBF, $FFFFFFDF, $FFFFFFEF, $FFFFFFF7, $FFFFFFFB, $FFFFFFFD, $FFFFFFFE,
      $FFFF7FFF, $FFFFBFFF, $FFFFDFFF, $FFFFEFFF, $FFFFF7FF, $FFFFFBFF, $FFFFFDFF, $FFFFFEFF,
      $FF7FFFFF, $FFBFFFFF, $FFDFFFFF, $FFEFFFFF, $FFF7FFFF, $FFFBFFFF, $FFFDFFFF, $FFFEFFFF,
      $7FFFFFFF, $BFFFFFFF, $DFFFFFFF, $EFFFFFFF, $F7FFFFFF, $FBFFFFFF, $FDFFFFFF, $FEFFFFFF );

var
  dstWidth, dstHeight : LongInt;
  srcWidth, srcHeight : LongInt;

  srcX, srcY : LongInt;
  dstX, dstY : LongInt;

  pDstByte, pSrcByte : ^Byte;

  dstByte, srcByte : Byte;
  dstWord, srcWord : LongWord;
  dstLWord, srcLWord : LongWord;

  optBits : Integer;

  i : Integer;
  srcNBit : Integer;
  dstNBit : Integer;

begin
  Result := FALSE;
  { See if conditions are good }
  if srcGraphic.ImageFormat <> ifBlackWhite then Exit;

  if ( srcRect.Top >= srcRect.Bottom ) or ( srcRect.Left >= srcRect.Right ) then begin
    raise EEnvisionError.Create( 'Invalid crop parameters' );
  end;

  srcWidth  := srcGraphic.Width;
  srcHeight := srcGraphic.Height;
  dstWidth  := srcRect.Right - srcRect.Left;
  dstHeight := srcRect.Bottom - srcRect.Top;

  { Create new image }
  dstGraphic.NewImage( dstWidth, dstHeight, srcGraphic.ImageFormat, srcGraphic.PalettePtr, srcGraphic.XDotsPerInch, srcGraphic.YDotsPerInch );

  pSrcByte := nil;
  srcNBit := 0;

  dstY := 0;
  while dstY < dstHeight do begin

    pDstByte := Addr( dstGraphic.ScanLine[ dstY ] ^ [ 0 div 8 ] );
    dstNBit := 0;

    dstX := 0;
    while dstX < dstWidth do begin

      srcX := srcRect.Left + dstX;
      srcY := srcRect.Top + dstY;

      optBits := 0;
      if ( dstX mod 32 ) = 0 then begin
        optBits := 32;
        pSrcByte := Addr( SrcGraphic.ScanLine[ srcY ] ^ [ 4 * ( srcX div 32 ) ] );
        srcNBit := srcX mod 32;
      end;
      if ( optBits = 0 ) and ( ( dstX mod 16 ) = 0 ) then begin
        optBits := 16;
        pSrcByte := Addr( SrcGraphic.ScanLine[ srcY ] ^ [ 2 * ( srcX div 16 ) ] );
        srcNBit := srcX mod 16;
      end;
      if ( optBits = 0 ) and ( ( dstX mod 8 ) = 0 ) then begin
        optBits := 8;
        pSrcByte := Addr( SrcGraphic.ScanLine[ srcY ] ^ [ 1 * ( srcX div 8 ) ] );
        srcNBit := srcX mod 8;
      end;

      { WORK WITH LONG WORDS }
      if optBits = 32 then begin

        dstLWord := $FFFFFFFF;
        srcLWord := PLWord( pSrcByte )^;
        for i := 0 to optBits - 1 do begin
          if ( srcNBit >= optBits ) and ( srcX >= optBits ) then begin
            srcNBit := 0;
            pSrcByte := Ptr( Integer( pSrcByte ) + 4 );
            srcLWord := PLWord( pSrcByte )^;
          end;
          if ( srcLWord and LWBit[ srcNBit ] ) = 0 then dstLWord := dstLWord and NotLWBit[i];
          Inc( srcNBit );
        end;

        PLWord( pDstByte )^ := dstLWord;
        pDstByte := Ptr( Integer( pDstByte ) + 4 );
        Inc( dstX, 32 );
        dstNBit := 0;

      { WORK WITH WORDS }
      end else if optBits = 16 then begin

        dstWord := $FFFF;
        srcWord := PWord( pSrcByte )^;
        for i := 0 to optBits - 1 do begin
          if ( srcNBit >= optBits ) and ( srcX >= optBits ) then begin
            srcNBit := 0;
            pSrcByte := Ptr( Integer( pSrcByte ) + 2 );
            srcWord := PWord( pSrcByte )^;
          end;
          if ( srcWord and LWBit[ srcNBit ] ) = 0 then dstWord := dstWord and NotLWBit[i];
          Inc( srcNBit );
        end;

        PWord( pDstByte )^ := dstWord;
        pDstByte := Ptr( Integer( pDstByte ) + 2 );
        Inc( dstX, 16 );
        dstNBit := 0;

      { WORK WITH BYTES }
      end else if optBits = 8 then begin

        dstByte := $FF;
        srcByte := pSrcByte^;
        for i := 0 to optBits - 1 do begin
          if ( srcNBit >= optBits ) and ( srcX >= optBits ) then begin
            srcNBit := 0;
            pSrcByte := Ptr( Integer( pSrcByte ) + 1 );
            srcByte := pSrcByte^;
          end;
          if ( srcByte and LWBit[ srcNBit ] ) = 0 then dstByte := dstByte and NotLWBit[i];
          Inc( srcNBit );
        end;

        pDstByte^ := dstByte;
        pDstByte := Ptr( Integer( pDstByte ) + 1 );
        Inc( dstX, 8 );
        dstNBit := 0;

      { WORK WITH INDIVIDUAL BITS }
      end else begin

        if ( srcX >= 0 ) and ( srcX < srcWidth ) and ( srcY >= 0 ) and ( srcY < srcHeight ) then begin
          if ( ( SrcGraphic.ScanLine[ srcY ] ^ [ srcX div 8 ] ) and LWBit[ srcX mod 8 ] ) = 0 then begin
            pDstByte^ := pDstByte^ and NotLWBit[ dstNBit ];
          end else begin
            pDstByte^ := pDstByte^ or LWBit[ dstNBit ];
          end;
        end else begin
          pDstByte^ := pDstByte^ or LWBit[ dstNBit ];
        end;

        Inc( dstNBit );
        if dstNBit >= 8 then begin
          dstNBit := 0;
          pDstByte := Ptr( Integer( pDstByte ) + 1 );
        end;

        Inc( dstX );
      end;

    end;

    Inc( dstY );
  end;

  Result := TRUE;
end;

function EnDeskewAngleBW( const srcGraphic : TDibGraphic; maxAngle : Double; var infoMsg, errMsg : AnsiString ) : Double; overload;
{******************************************************************************}
{ Returns the angle in degrees that the image should be rotated to deskew it.  }
{                                                                              }
{ The image is broken up into multiple boxes so that an average may be done    }
{ from all over the image.                                                     }
{                                                                              }
{     0                          dx        The algorithm starts with a box     }
{ 0   +---------------------------+ 0      of appropriate dimensions for       }
{     |                           |        checking deskew.  The arctan        }
{ dy  +  -   -   -  .  -   -   -  + dy     of dy/dx is the maximum angle       }
{     |                           |        that will be checked.  A rectangle  }
{ dy2 +---------------------------+ dy2    of dimension dy and dx is rotated   }
{                                dx        about the center point and a        }
{                                          hystogram of black pixels is saved. }
{                                                                              }
{ The left and right edges are brought together along the dy line until they   }
{ touch some black pixels.  The width must still be at least dx/2 to help      }
{ ensure good results.                                                         }
{                                                                              }
{ The box moves vertically by "dy" so there is 50% overlap during the check.   }
{                                                                              }
{ Sometimes the algorithm is fooled, so multiple angles are obtained and       }
{ compared with each other.  Angles that are not withing some margin of        }
{ error with the other angles are removed.                                     }
{                                                                              }
{ Blocks that are mostly all black or all white are excluded as not having     }
{ enought material.                                                            }
{******************************************************************************}
const
  MIN_NUM_ANGLES = 5;         // Minimum number of angles accumulated
  MAX_NUM_ANGLES = 16;        // Maximum number of angles accumulated
  MAX_COLLECTION_TIME = 0.75; // Maximum time in seconds that collection will take place
  FILL_THRESHOLD_LO =  5.0;   // Percentage box must be filled to examine closely
  FILL_THRESHOLD_HI = 85.0;   // Percentage box must be filled to examine closely
  ANGLE_THRESHOLD   = 0.50;   // Degrees that angle has to be within other angles
  NOMINAL_BOX_WIDTH = 2.75;   // Nominal box length in inches
var
  i, j, x, y : Integer;
  dx, dy, dy2 : Integer;
  numBlack, numPixels : LongInt;
  prcnt : Integer;
  fx, fy : Double;
  srcRect : TRect;
  angles : array [ 1 .. MAX_NUM_ANGLES ] of Double;
  numAngles : Integer;
  cnt : Integer;
  deskewAngle : Double;
  aveAngle : Double;
  startTime : TDateTime;
  deltaSec : Double;
begin
  Result := 0.0;
  { Determine maximum box size for checking }
  fx := NOMINAL_BOX_WIDTH * srcGraphic.XDotsPerInch;
  fy := NOMINAL_BOX_WIDTH * Tan( maxAngle * Pi / 180 ) * srcGraphic.YDotsPerInch;
  dx := Trunc( fx );
  dy := Trunc( fy );
  dy2 := 2 * dy;
  { Range check dimensions }
  if dx > srcGraphic.Width then dx := srcGraphic.Width;
  if dy2 > srcGraphic.Height then begin
    dy2 := srcGraphic.Height;
    dy := dy2 div 2;
  end;
  if Odd( dy ) then begin   // Ensures a horizontal line during checking
    Dec( dy );
    dy2 := 2 * dy;
  end;
  { Go through the image checking the boxes }
  startTime := Now;
  deltaSec := 0.0;
  numAngles := 0;
  x := 0;
  while ( x <= ( srcGraphic.Width - dx ) ) and ( numAngles < MAX_NUM_ANGLES ) do begin
    y := 0;
    while ( y <= ( srcGraphic.Height - dy2 ) ) and ( numAngles < MAX_NUM_ANGLES ) do begin
      srcRect := Rect( x, y, x+dx, y+dy2 );
      { Find left and right edges along center line }
      srcRect.Left := EnLeftEdgeBW( srcGraphic, x, y+dy, x+dx, y+dy, FILL_THRESHOLD_LO );
      srcRect.Right := EnRightEdgeBW( srcGraphic, x, y+dy, x+dx, y+dy, FILL_THRESHOLD_LO );
      { See if the box is still big enough }
      if ( srcRect.Right - srcRect.Left ) > ( dx div 2 ) then begin
        { See if it passes the percentage filled test }
        prcnt := EnPercentBlackPixelsBW( srcGraphic, srcRect, numBlack, numPixels );
        if ( prcnt > Trunc( 100 * FILL_THRESHOLD_LO ) )
        and ( prcnt < Trunc( 100 * FILL_THRESHOLD_HI ) ) then begin
          deskewAngle := EnDeskewAngleBW( srcGraphic, srcRect, maxAngle );
          if ( deskewAngle > maxAngle ) or ( deskewAngle < -maxAngle ) then begin
            errMsg := errMsg + Format( 'deskew angle %f degrees out of range', [ deskewAngle ] ) + EnCRLF;
          end else begin
            Inc( numAngles );
            angles[ numAngles ] := deskewAngle;
            infoMsg := infoMsg + Format( 'angle[%d] = %5.2f  rect (%d,%d),(%d,%d)', [ numAngles, deskewAngle, srcRect.Left, srcRect.Top, srcRect.Right, srcRect.Bottom ] ) + EnCRLF;
            deltaSec := ( Now - startTime ) * 86400;
          end;
        end;
      end;
      Inc( y, dy );
      if ( numAngles >= MIN_NUM_ANGLES ) and ( deltaSec >= MAX_COLLECTION_TIME ) then break;
    end;
    Inc( x, dx );
    if ( numAngles >= MIN_NUM_ANGLES ) and ( deltaSec >= MAX_COLLECTION_TIME ) then begin
      infoMsg := infoMsg + Format( 'halted because of time %f', [ deltaSec ] ) + EnCRLF;
      break;
    end;
  end;
  { Clean up angle list }
  if numAngles > 1 then begin
    { Look at all the angles }
    for i := 1 to numAngles do begin
      { Count how many others are within error margin }
      cnt := 0;
      for j := 1 to numAngles do begin
        if i <> j then begin
          if ( angles[i] > ( angles[j] - ANGLE_THRESHOLD ) )
          and ( angles[i] < ( angles[j] + ANGLE_THRESHOLD ) ) then begin
            Inc( cnt );
          end;
        end;
      end;
      { Throw angle away if there are not at least 10% of other angles close }
      if ( cnt / numAngles ) < 0.10 then begin
        angles[i] := 100.00;
        errMsg := errMsg + Format( 'angle[%d] more than %f degrees from any other', [ i, ANGLE_THRESHOLD ] ) + EnCRLF;
      end;
    end;
    { Now average all the angles }
    cnt := 0;
    aveAngle := 0.0;
    for i := 1 to numAngles do begin
      if angles[i] < 40.0 then begin
        Inc( cnt );
        aveAngle := aveAngle + angles[i];
      end;
    end;
    if cnt > 0 then aveAngle := aveAngle / cnt;
    infoMsg := infoMsg + Format( 'average angle = %5.2f', [ aveAngle ] ) + EnCRLF;
    { Range check }
    if aveAngle > maxAngle then aveAngle := maxAngle;
    if aveAngle < -maxAngle then aveAngle := -maxAngle;
    if ( aveAngle < 0.10 ) and ( aveAngle > -0.10 ) then aveAngle := 0.00;
    Result := aveAngle;
  end;
end;

function EnDeskewAngleBW( const srcGraphic : TDibGraphic; maxAngle : Double ) : Double; overload;
{******************************************************************************}
{ Same as EnDeskewAngleBW above but without extra parameters.                  }
{******************************************************************************}
var
  infoMsg : AnsiString;
  errMsg : AnsiString;
begin
  Result := EnDeskewAngleBW( srcGraphic, maxAngle, infoMsg, errMsg );
//ShowMessage( infoMsg + EnCRLF + errMsg );
end;

function EnDeskewAngleBW( const srcGraphic : TDibGraphic; srcRect : TRect; maxAngle : Double ) : Double; overload;
{******************************************************************************}
{ Returns the angle in degrees that the image should be rotated to deskew it.  }
{                                                                              }
{     0                          dx        The algorithm starts with a box     }
{ 0   +---------------------------+ 0      of appropriate dimensions for       }
{     |                           |        checking deskew.  The arctan        }
{ dy  +  -   -   -  .  -   -   -  + dy     of dy/dx is the maximum angle       }
{     |                           |        that will be checked.  A rectangle  }
{ dy2 +---------------------------+ dy2    of dimension dy and dx is rotated   }
{                                dx        about the center point and a        }
{                                          hystogram of black pixels is saved. }
{                                                                              }
{ The difference between the min and max hystogram values are checked and      }
{ if a higher value is found OR the value is the same but the counts are       }
{ higher then that slope is used as the desired angle.                         }
{******************************************************************************}
var
  i, cnt : Integer;
  y0, y1, dy : Integer;
  prcnt : Integer;
  hystMinVal, hystMinCnt : Integer;
  hystMaxVal, hystMaxCnt : Integer;
  dVal, dHystVal : Integer;
  dCnt, dHystCnt : Integer;
  minVal, minCnt, maxVal, maxCnt : Integer;
  xSlope, ySlope : Integer;
begin
  Result := 0.0;
  { Get all possible hystograms }
  cnt := 0;
  xSlope := 0;
  ySlope := 0;
  hystMinVal :=  500; hystMinCnt := 0;
  hystMaxVal := 2000; hystMaxCnt := 0;
  y0 := srcRect.Top;
  dy := ( srcRect.Bottom - srcRect.Top ) div 2;
  y1 := y0 + dy;
  while y0 < ( srcRect.Top + dy ) do begin
    { Get hystogram }
    minVal :=  500; minCnt := 0;
    maxVal := 2000; maxCnt := 0;
    for i := 0 to dy - 1 do begin
      prcnt := EnPercentBlackPixelsInLineBW( srcGraphic, srcRect.Left, y0 + i, srcRect.Right, y1 + i );
      if prcnt < minVal then begin
        minVal := prcnt;  minCnt := 1;
      end else if prcnt = minVal then begin
        Inc( minCnt );
      end;
      if prcnt > maxVal then begin
        maxVal := prcnt;  maxCnt := 1;
      end else if prcnt = maxVal then begin
        Inc( maxCnt );
      end;
    end;
    { Get differences between highs and lows }
    dVal := maxVal - minVal;
    dHystVal := hystMaxVal - hystMinVal;
    dCnt := minCnt + maxCnt;
    dHystCnt := hystMinCnt + hystMaxCnt;
    { Compare with previous results }
    if ( dVal > dHystVal )
    or ( ( dVal = dHystVal ) and ( dCnt > dHystCnt ) )
    then begin
      Inc( cnt );
      hystMinVal := minVal;
      hystMinCnt := minCnt;
      hystMaxVal := maxVal;
      hystMaxCnt := maxCnt;
      xSlope := srcRect.Right - srcRect.Left;
      ySlope := y0 - y1;
    end;
    { Adjust line for next run }
    Inc( y0 );
    Dec( y1 );
  end;
  if cnt > 0 then Result := ArcTan2( ySlope, xSlope ) * 180 / Pi;
end;

function EnDeskewBW( const srcGraphic, dstGraphic : TDibGraphic; canResize : Boolean; maxAngle : Double ) : Double; overload;
{******************************************************************************}
{ Returns the angle in degrees that the image was rotated to deskew it.        }
{******************************************************************************}
begin
  Result := EnDeskewAngleBW( srcGraphic, maxAngle );
  EnDeskewBW( srcGraphic, dstGraphic, canResize, maxAngle, Result );
end;

function EnDeskewBW( const srcGraphic, dstGraphic : TDibGraphic; canResize : Boolean; maxAngle, angle : Double ) : Double; overload;
{******************************************************************************}
{ Returns the angle in degrees that the image was rotated to deskew it.        }
{******************************************************************************}
begin
  Result := EnDeskewBW( srcGraphic, dstGraphic, canResize, MakeRgb(255, 255, 255), maxAngle, angle );
end;

function EnDeskewBW( const srcGraphic, dstGraphic : TDibGraphic; canResize : Boolean; const bgColor : TRgb; maxAngle, angle : Double ) : Double; overload;
{******************************************************************************}
{ Returns the angle in degrees that the image was given to be rotated.         }
{ If "canResize" is TRUE then the image dimensions will increase so that no    }
{ information is lost, otherwise the original dimensions are kept.             }
{                                                                              }
{ NOTE - It is optimized for B/W images only.                                  }
{                                                                              }
{ The algorithm is highly optimized for rotations at slight angles.  It takes  }
{ advantage of the fact that there will be long runs without changing          }
{ scan lines.  In those situations an attempt is made to use the longest       }
{ access possible:  Long Word, Word, or Byte.  As a last resort, it will       }
{ work with the individual bits.  Rotations 0.5 degrees or less are very fast  }
{ and those above 4 degrees are very slow.                                     }
{                                                                              }
{ Benchmark                                                    Time  Improve   }
{ ---------                                                    ----  -------   }
{ 1700 x 2200 Original                                         3.30     1.0x   }
{ 1700 x 2200 Optimize write                                   2.60     1.3x   }
{ 1700 x 2200 Optimize read                                    2.40     1.4x   }
{ 1700 x 2200 Byte acceess                                     0.97     3.4x   }
{ 1700 x 2200 Long Word access                                 0.66     5.0x   }
{******************************************************************************}

  procedure RotatePoint( sinOfAngle, cosOfAngle : Double; const X, Y, XOffset, YOffset, XCenter, YCenter : LongInt; var NewX, NewY : LongInt); register;
  begin
    NewX := Round((X - XCenter)*CosOfAngle - (Y - YCenter)*SinOfAngle + XCenter + XOffset);
    NewY := Round((X - XCenter)*SinOfAngle + (Y - YCenter)*CosOfAngle + YCenter + YOffset);
  end;

  procedure AdjustBounds( const NewX, NewY : LongInt; var MaxX, MinX, MaxY, MinY : LongInt );
  begin
    if NewX > MaxX then MaxX := NewX;
    if NewX < MinX then MinX := NewX;
    if NewY > MaxY then MaxY := NewY;
    if NewY < MinY then MinY := NewY;
  end;

type
  PLWord = ^LongWord;

const
  LWBit : array [ 0 .. 31 ] of LongWord =
    ( $00000080, $00000040, $00000020, $00000010, $00000008, $00000004, $00000002, $00000001,
      $00008000, $00004000, $00002000, $00001000, $00000800, $00000400, $00000200, $00000100,
      $00800000, $00400000, $00200000, $00100000, $00080000, $00040000, $00020000, $00010000,
      $80000000, $40000000, $20000000, $10000000, $08000000, $04000000, $02000000, $01000000 );

  NotLWBit : array [ 0 .. 31 ] of LongWord =
    ( $FFFFFF7F, $FFFFFFBF, $FFFFFFDF, $FFFFFFEF, $FFFFFFF7, $FFFFFFFB, $FFFFFFFD, $FFFFFFFE,
      $FFFF7FFF, $FFFFBFFF, $FFFFDFFF, $FFFFEFFF, $FFFFF7FF, $FFFFFBFF, $FFFFFDFF, $FFFFFEFF,
      $FF7FFFFF, $FFBFFFFF, $FFDFFFFF, $FFEFFFFF, $FFF7FFFF, $FFFBFFFF, $FFFDFFFF, $FFFEFFFF,
      $7FFFFFFF, $BFFFFFFF, $DFFFFFFF, $EFFFFFFF, $F7FFFFFF, $FBFFFFFF, $FDFFFFFF, $FEFFFFFF );

var
  AngleRadians : Double;
  SinOfAngle   : Double;
  CosOfAngle   : Double;

  dstWidth, dstHeight : LongInt;
  srcWidth, srcHeight : LongInt;

  XCenter, YCenter : LongInt;
  XOffset, YOffset : LongInt;
  MaxX, MinX : LongInt;
  MaxY, MinY : LongInt;

  srcX, srcY : LongInt;
  dstX, dstY : LongInt;
  nextSrcX, nextSrcY : LongInt;

  pDstByte, pSrcByte : ^Byte;
  doOpt : Boolean;

  dstByte, srcByte : Byte;
  dstWord, srcWord : LongWord;
  dstLWord, srcLWord : LongWord;

  optBits : Integer;

  ySinComp : Double;
  yCosComp : Double;

  i : Integer;
  srcNBit : Integer;
  dstNBit : Integer;

  bgIsWhite : Boolean;

begin
  Result := 0.00;
  { See if conditions are good }
  if srcGraphic.ImageFormat <> ifBlackWhite then Exit;

  Result := angle;

  AngleRadians := angle * Pi / 180;
  SinOfAngle   := Sin( AngleRadians );
  CosOfAngle   := Cos( AngleRadians );

  srcWidth  := srcGraphic.Width;
  srcHeight := srcGraphic.Height;
  dstWidth  := srcWidth;
  dstHeight := srcHeight;
  XCenter := srcWidth div 2;
  YCenter := srcHeight div 2;

  { See if image should keep all information }
  if canResize then begin
    srcX := 0; srcY := 0;
    RotatePoint( SinOfAngle, CosOfAngle, 0, 0, 0, 0, XCenter, YCenter, srcX, srcY );
    MinX := srcX; MaxX := srcX; MinY := srcY; MaxY := srcY;
    RotatePoint( SinOfAngle, CosOfAngle, 0, srcHeight-1, 0, 0, XCenter, YCenter, srcX, srcY );
    AdjustBounds( srcX, srcY, MaxX, MinX, MaxY, MinY );
    RotatePoint( SinOfAngle, CosOfAngle, srcWidth-1, srcHeight-1, 0, 0, XCenter, YCenter, srcX, srcY );
    AdjustBounds( srcX, srcY, MaxX, MinX, MaxY, MinY );
    RotatePoint( SinOfAngle, CosOfAngle, srcWidth-1, 0, 0, 0, XCenter, YCenter, srcX, srcY );
    AdjustBounds( srcX, srcY, MaxX, MinX, MaxY, MinY );
    dstWidth  := MaxX - MinX + 1;
    dstHeight := MaxY - MinY + 1;
    XCenter := dstWidth div 2;
    YCenter := dstHeight div 2;
  end;

  bgIsWhite := ( bgColor.Red = 255 );

  dstGraphic.NewImage( dstWidth, dstHeight, srcGraphic.ImageFormat, srcGraphic.PalettePtr, srcGraphic.XDotsPerInch, srcGraphic.YDotsPerInch );

  SinOfAngle := Sin( -AngleRadians );
  CosOfAngle := Cos( -AngleRadians );

  XOffset := - ( ( dstWidth  div 2 ) - ( srcWidth  div 2 ) );
  YOffset := - ( ( dstHeight div 2 ) - ( srcHeight div 2 ) );

  pSrcByte := nil;
  srcNBit := 0;

  dstY := 0;
  while dstY < dstHeight do begin

    pDstByte := Addr( dstGraphic.ScanLine[ dstY ] ^ [ 0 div 8 ] );
    dstNBit := 0;

    dstX := 0;
    while dstX < dstWidth do begin

      ySinComp := ( dstY - YCenter ) * SinOfAngle;
      yCosComp := ( dstY - YCenter ) * CosOfAngle;

      srcX := Round( ( dstX - XCenter ) * CosOfAngle - ySinComp ) + XCenter + XOffset;
      srcY := Round( ( dstX - XCenter ) * SinOfAngle + yCosComp ) + YCenter + YOffset;

      { this adjustment corrects rounding errors on boundaries }
      if srcX = srcWidth  then srcX := srcWidth  - 1;
      if srcY = srcHeight then srcY := srcHeight - 1;

      { Determine optimal number of bits to manipulate in which srcY does not change }
      optBits := 0;
      if ( dstX mod 32 ) = 0 then begin
        nextSrcX := Round(( dstX + 32 - XCenter)*CosOfAngle - ySinComp ) + XCenter;
        nextSrcY := Round(( dstX + 32 - XCenter)*SinOfAngle + yCosComp ) + YCenter;
        if ( srcX >= 0 ) and ( ( srcX + 31 ) < srcWidth ) and ( srcY >= 0 ) and ( srcY < srcHeight )
        and ( ( srcX + 32 ) = nextSrcX ) and ( srcY = nextSrcY ) then begin
          optBits := 32;
          srcNBit := srcX mod 32;
          pSrcByte := Addr( SrcGraphic.ScanLine[ srcY ] ^ [ 4 * ( srcX div 32 ) ] );
        end;
      end;
      if ( optBits = 0 ) and ( ( dstX mod 16 ) = 0 ) then begin
        nextSrcX := Round(( dstX + 16 - XCenter)*CosOfAngle - ySinComp ) + XCenter;
        nextSrcY := Round(( dstX + 16 - XCenter)*SinOfAngle + yCosComp ) + YCenter;
        if ( srcX >= 0 ) and ( ( srcX + 15 ) < srcWidth ) and ( srcY >= 0 ) and ( srcY < srcHeight )
        and ( ( srcX + 16 ) = nextSrcX ) and ( srcY = nextSrcY ) then begin
          optBits := 16;
          pSrcByte := Addr( SrcGraphic.ScanLine[ srcY ] ^ [ 2 * ( srcX div 16 ) ] );
          srcNBit := srcX mod 16;
        end;
      end;
      if ( optBits = 0 ) and ( ( dstX mod 8 ) = 0 ) then begin
        nextSrcX := Round(( dstX + 8 - XCenter)*CosOfAngle - ySinComp ) + XCenter;
        nextSrcY := Round(( dstX + 8 - XCenter)*SinOfAngle + yCosComp ) + YCenter;
        if ( srcX >= 0 ) and ( ( srcX + 7 ) < srcWidth ) and ( srcY >= 0 ) and ( srcY < srcHeight )
        and ( ( srcX + 8 ) = nextSrcX ) and ( srcY = nextSrcY ) then begin
          optBits := 8;
          pSrcByte := Addr( SrcGraphic.ScanLine[ srcY ] ^ [ 1 * ( srcX div 8 ) ] );
          srcNBit := srcX mod 8;
        end;
      end;

      { WORK WITH LONG WORDS }
      if optBits = 32 then begin

        dstLWord := $FFFFFFFF;
        srcLWord := PLWord( pSrcByte )^;
        for i := 0 to optBits - 1 do begin
          if srcNBit >= optBits then begin
            srcNBit := 0;
            pSrcByte := Ptr( Integer( pSrcByte ) + 4 );
            srcLWord := PLWord( pSrcByte )^;
          end;
          if ( srcLWord and LWBit[ srcNBit ] ) = 0 then dstLWord := dstLWord and NotLWBit[i];
          Inc( srcNBit );
        end;

        PLWord( pDstByte )^ := dstLWord;
        pDstByte := Ptr( Integer( pDstByte ) + 4 );
        Inc( dstX, 32 );
        dstNBit := 0;

      { WORK WITH WORDS }
      end else if optBits = 16 then begin

        dstWord := $FFFF;
        srcWord := PWord( pSrcByte )^;
        for i := 0 to optBits - 1 do begin
          if srcNBit >= optBits then begin
            srcNBit := 0;
            pSrcByte := Ptr( Integer( pSrcByte ) + 2 );
            srcWord := PWord( pSrcByte )^;
          end;
          if ( srcWord and LWBit[ srcNBit ] ) = 0 then dstWord := dstWord and NotLWBit[i];
          Inc( srcNBit );
        end;

        PWord( pDstByte )^ := dstWord;
        pDstByte := Ptr( Integer( pDstByte ) + 2 );
        Inc( dstX, 16 );
        dstNBit := 0;

      { WORK WITH BYTES }
      end else if optBits = 8 then begin

        dstByte := $FF;
        srcByte := pSrcByte^;
        for i := 0 to optBits - 1 do begin
          if srcNBit >= optBits then begin
            srcNBit := 0;
            pSrcByte := Ptr( Integer( pSrcByte ) + 1 );
            srcByte := pSrcByte^;
          end;
          if ( srcByte and LWBit[ srcNBit ] ) = 0 then dstByte := dstByte and NotLWBit[i];
          Inc( srcNBit );
        end;

        pDstByte^ := dstByte;
        pDstByte := Ptr( Integer( pDstByte ) + 1 );
        Inc( dstX, 8 );
        dstNBit := 0;

      { WORK WITH INDIVIDUAL BITS }
      end else begin

        if ( srcX >= 0 ) and ( srcX < srcWidth ) and ( srcY >= 0 ) and ( srcY < srcHeight ) then begin
          if ( ( SrcGraphic.ScanLine[ srcY ] ^ [ srcX div 8 ] ) and LWBit[ srcX mod 8 ] ) = 0 then begin
            pDstByte^ := pDstByte^ and NotLWBit[ dstNBit ];
          end else begin
            pDstByte^ := pDstByte^ or LWBit[ dstNBit ];
          end;
        end else begin
          if bgIsWhite then pDstByte^ := pDstByte^ or LWBit[ dstNBit ]
          else pDstByte^ := pDstByte^ and NotLWBit[ dstNBit ];
        end;

        Inc( dstNBit );
        if dstNBit >= 8 then begin
          dstNBit := 0;
          pDstByte := Ptr( Integer( pDstByte ) + 1 );
        end;

        Inc( dstX );
      end;

    end;

    Inc( dstY );
  end;
end;

procedure EnBorderCleanup( const srcGraphic : TDibGraphic; maxDepthInches : Double );
{******************************************************************************}
{ Cleans up the borders of the given image to the given depth.                 }
{******************************************************************************}
begin
  EnBorderCleanup( srcGraphic, maxDepthInches, MakeRgb(255, 255, 255) );    // Default with white fill
end;

procedure EnBorderCleanup( const srcGraphic : TDibGraphic; maxDepthInches : Double; const bgColor : TRgb ); overload;
{******************************************************************************}
{ Cleans up the borders of the given image to the given depth.                 }
{                                                                              }
{  +---------------------------+   --           The algorithm bevels the       }
{  |                           |   YMargin      limits in the Y direction      }
{  |    + - - - - - - - - +    |   --           on the top and bottom edges.   }
{  |                           |                                               }
{  |    |                 |    |                This lets the algorithm do     }
{  |                           |                a better job reaching in when  }
{  |    |                 |    |                doing the left and right       }
{  |                           |                edges.                         }
{  |    |                 |    |                                               }
{  |                           |                The algorithm also looks for   }
{  |    |                 |    |                so many white pixels IN_A_ROW  }
{  |                           |                before it stops searching      }
{  |    |                 |    |                in towards the center.         }
{  |                           |                                               }
{  |    + - - - - - - - - +    |   -- YEdge                                    }
{  |                           |                                               }
{  +---------------------------+                                               }
{->|    |<-               |                                                    }
{  XMargin              XEdge                                                  }
{                                                                              }
{******************************************************************************}
const
  IN_A_ROW = 5;

  LWBit : array [ 0 .. 31 ] of LongWord =
    ( $00000080, $00000040, $00000020, $00000010, $00000008, $00000004, $00000002, $00000001,
      $00008000, $00004000, $00002000, $00001000, $00000800, $00000400, $00000200, $00000100,
      $00800000, $00400000, $00200000, $00100000, $00080000, $00040000, $00020000, $00010000,
      $80000000, $40000000, $20000000, $10000000, $08000000, $04000000, $02000000, $01000000 );

  NotLWBit : array [ 0 .. 31 ] of LongWord =
    ( $FFFFFF7F, $FFFFFFBF, $FFFFFFDF, $FFFFFFEF, $FFFFFFF7, $FFFFFFFB, $FFFFFFFD, $FFFFFFFE,
      $FFFF7FFF, $FFFFBFFF, $FFFFDFFF, $FFFFEFFF, $FFFFF7FF, $FFFFFBFF, $FFFFFDFF, $FFFFFEFF,
      $FF7FFFFF, $FFBFFFFF, $FFDFFFFF, $FFEFFFFF, $FFF7FFFF, $FFFBFFFF, $FFFDFFFF, $FFFEFFFF,
      $7FFFFFFF, $BFFFFFFF, $DFFFFFFF, $EFFFFFFF, $F7FFFFFF, $FBFFFFFF, $FDFFFFFF, $FEFFFFFF );

  procedure SetBitWhite( srcX, srcY : Integer );
  {******************************************************************************}
  { Sets the given pixel white.                                                  }
  {******************************************************************************}
  var
    pSrcByte : ^Byte;
  begin
    pSrcByte := Addr( srcGraphic.ScanLine[ srcY ] ^ [ srcX div 8 ] );
    pSrcByte^ := pSrcByte^ or LWBit[ srcX mod 8 ];
  end;

  procedure SetBitBlack( srcX, srcY : Integer );
  {******************************************************************************}
  { Sets the given pixel black.                                                  }
  {******************************************************************************}
  var
    pSrcByte : ^Byte;
  begin
    pSrcByte := Addr( srcGraphic.ScanLine[ srcY ] ^ [ srcX div 8 ] );
    pSrcByte^ := pSrcByte^ and NotLWBit[ srcX mod 8 ];
  end;

  function procXW( xDir : Boolean; srcX, srcY : Integer; var lastCnt : Integer ) : Boolean;
  {******************************************************************************}
  { Looks for some consecutive number of white pixels in X or Y direction        }
  { before stopping.                                                             }
  {******************************************************************************}
  var
    i : Integer;
    pSrcByte : ^Byte;
    srcNBit : Integer;
    srcByte : Byte;
  begin
    Result := FALSE;
    pSrcByte := Addr( srcGraphic.ScanLine[ srcY ] ^ [ srcX div 8 ] );
    srcNBit := srcX mod 8;
    srcByte := pSrcByte^;
    if srcByte and LWBit[ srcNBit ] <> 0 then begin
      Inc( lastCnt );
      if lastCnt > IN_A_ROW then Result := TRUE;
      Exit;
    end;
    for i := 0 to lastCnt do begin
      if xDir then SetBitWhite( srcX - i, srcY )
      else SetBitWhite( srcX, srcY - i );
    end;
    lastCnt := 0;
  end;

  function procXB( xDir : Boolean; srcX, srcY : Integer; var lastCnt : Integer ) : Boolean;
  {******************************************************************************}
  { Looks for some consecutive number of black pixels in X or Y direction        }
  { before stopping.                                                             }
  {******************************************************************************}
  var
    i : Integer;
    pSrcByte : ^Byte;
    srcNBit : Integer;
    srcByte : Byte;
  begin
    Result := FALSE;
    pSrcByte := Addr( srcGraphic.ScanLine[ srcY ] ^ [ srcX div 8 ] );
    srcNBit := srcX mod 8;
    srcByte := pSrcByte^;
    if srcByte and LWBit[ srcNBit ] = 0 then begin
      Inc( lastCnt );
      if lastCnt > IN_A_ROW then Result := TRUE;
      Exit;
    end;
    for i := 0 to lastCnt do begin
      if xDir then SetBitBlack( srcX - i, srcY )
      else SetBitBlack( srcX, srcY - i );
    end;
    lastCnt := 0;
  end;

var
  srcX, srcY : Integer;
  XEdge, XMargin : Integer;
  YEdge, YMargin : Integer;
  lastCnt : Integer;
  limitY : Integer;
  bgIsWhite : Boolean;

begin
  bgIsWhite := ( bgColor.Red = 255 );

  { X dimension }
  XMargin := Trunc( maxDepthInches * srcGraphic.XDotsPerInch );
  XEdge := srcGraphic.Width - XMargin;
  if XMargin >= srcGraphic.Width then XMargin := srcGraphic.Width - 1;
  if XEdge < 0 then XEdge := 0;
  { Y dimension }
  YMargin := Trunc( maxDepthInches * srcGraphic.YDotsPerInch );
  YEdge := srcGraphic.Height - YMargin;
  if YMargin >= srcGraphic.Height then YMargin := srcGraphic.Height - 1;
  if YEdge < 0 then YEdge := 0;

  { Top and bottom edge }
  for srcX := 0 to srcGraphic.Width - 1 do begin
    { Top edge }
    limitY := YMargin;   // Bevel edge on corners
    if srcX < XMargin then limitY := Trunc( YMargin * ( srcX / XMargin ) );
    if srcX > XEdge then limitY := Trunc( YMargin * ( ( srcGraphic.Width - srcX - 1 ) / XMargin ) );
    lastCnt := 0;
    for srcY := 0 to limitY do begin
      if bgIsWhite then begin
        if procXW( FALSE, srcX, srcY, lastCnt ) then break;
      end else begin
        if procXB( FALSE, srcX, srcY, lastCnt ) then break;
      end;
    end;
    { Bottom edge }
    limitY := YEdge;   // Bevel edge on corners
    if srcX < XMargin then limitY := srcGraphic.Height - Trunc( YMargin * ( srcX / XMargin ) ) - 1;
    if srcX > XEdge then limitY := YEdge + Trunc( YMargin * ( ( srcX - XEdge ) / XMargin ) );
    lastCnt := 0;
    for srcY := ( srcGraphic.Height - 1 ) downto limitY do begin
      if bgIsWhite then begin
        if procXW( FALSE, srcX, srcY, lastCnt ) then break;
      end else begin
        if procXB( FALSE, srcX, srcY, lastCnt ) then break;
      end;
    end;
  end;

  { Left and Right edge }
  for srcY := 0 to srcGraphic.Height - 1 do begin
    { Left edge }
    lastCnt := 0;
    for srcX := 0 to XMargin do begin
      if bgIsWhite then begin
        if procXW( TRUE, srcX, srcY, lastCnt ) then break;
      end else begin
        if procXB( TRUE, srcX, srcY, lastCnt ) then break;
      end;
    end;
    { Right edge }
    lastCnt := 0;
    for srcX := ( srcGraphic.Width - 1 ) downto XEdge do begin
      if bgIsWhite then begin
        if procXW( TRUE, srcX, srcY, lastCnt ) then break;
      end else begin
        if procXB( TRUE, srcX, srcY, lastCnt ) then break;
      end;
    end;
  end;
end;

function EnFindBordersBW( const srcGraphic : TDibGraphic; const bgColor : TRgb ) : TRect;
{******************************************************************************}
{ Finds the borders of the image.                                              }
{******************************************************************************}
const
  SOLID_THRESHOLD = 99.0;     // Percentage line must be filled to be considered solid
var
  bgIsWhite : Boolean;
  cnt : Integer;
  numPixelsInLine : Integer;
  x0, y0, x1, y1 : Integer;
begin

  Result := Rect( 0, 0, srcGraphic.Width, srcGraphic.Height );

  { See if conditions are good }
  if srcGraphic.ImageFormat <> ifBlackWhite then Exit;

  bgIsWhite := ( bgColor.Red = 255 );

  x0 := 0;
  y0 := 0;
  x1 := srcGraphic.Width - 1;
  y1 := srcGraphic.Height - 1;

  { Find left edge }
  numPixelsInLine := EnNumPixelsInLine( x0, y0, x0, y1 );
  while x0 < x1 do begin
    cnt := EnNumBlackPixelsInColBW( srcGraphic, x0, y0, y1 );
    if not bgIsWhite then cnt := numPixelsInLine - cnt;
    if ( ( 100.0 * cnt ) / numPixelsInLine ) < SOLID_THRESHOLD then break;
    Inc( x0 );
  end;

  { Find right edge }
  while x1 > x0 do begin
    cnt := EnNumBlackPixelsInColBW( srcGraphic, x1, y0, y1 );
    if not bgIsWhite then cnt := numPixelsInLine - cnt;
    if ( ( 100.0 * cnt ) / numPixelsInLine ) < SOLID_THRESHOLD then break;
    Dec( x1 );
  end;

  { Find top edge }
  numPixelsInLine := EnNumPixelsInLine( x0, y0, x1, y0 );
  while y0 < y1 do begin
    cnt := EnNumBlackPixelsInRowBW( srcGraphic, y0, x0, x1 );
    if not bgIsWhite then cnt := numPixelsInLine - cnt;
    if ( ( 100.0 * cnt ) / numPixelsInLine ) < SOLID_THRESHOLD then break;
    Inc( y0 );
  end;

  { Find bottom edge }
  while y1 > y0 do begin
    cnt := EnNumBlackPixelsInRowBW( srcGraphic, y1, x0, x1 );
    if not bgIsWhite then cnt := numPixelsInLine - cnt;
    if ( ( 100.0 * cnt ) / numPixelsInLine ) < SOLID_THRESHOLD then break;
    Dec( y1 );
  end;

  Result := Rect( x0, y0, x1 + 1, y1 + 1 );
end;

function EnNumPixelsInLine( x0, y0, x1, y1 : Integer ) : Integer;
{******************************************************************************}
{ Returns the number of pixels that would be found along the given line.       }
{******************************************************************************}
var
  dx, dy : Integer;
begin
  dx := x1 - x0;
  dy := y1 - y0;
  if dx < 0 then dx := -dx;
  if dy < 0 then dy := -dy;
  if dx > dy then Result := dx + 1
  else Result := dy + 1;
end;

function EnNumBlackPixelsInLineBW( const srcGraphic : TDibGraphic; x0, y0, x1, y1 : Integer ) : Integer;
{******************************************************************************}
{ Returns the number of pixels that are black in the given "srcGraphic"        }
{ along the given line.                                                        }
{******************************************************************************}
var
  dx, dy : Integer;
  dx2, dy2 : Integer;
  stepx, stepy : Integer;
  fraction : Integer;
  stepScan : LongInt;
  pSrcByte : ^Byte;
  srcBit : Byte;
begin
  Result := 0;
  { See if conditions are good }
  if srcGraphic.ImageFormat <> ifBlackWhite then Exit;
  { Initialize variables }
  dx := x1 - x0;
  dy := y1 - y0;
  stepx := 1;
  stepy := 1;
  stepScan := - srcGraphic.ScanLineSize;
  pSrcByte := Addr( srcGraphic.ScanLine[ y0 ] ^ [ x0 div 8 ] );
  srcBit := $80 shr ( x0 mod 8 );
  { Adjust if moving in opposite direction }
  if dx < 0 then begin
    dx := -dx;
    stepx := -1;
  end;
  if dy < 0 then begin
    dy := -dy;
    stepy := -1;
    stepScan := -stepScan;
  end;
  dx2 := 2 * dx;
  dy2 := 2 * dy;

  if ( pSrcByte^ and srcBit ) = 0 then Inc( Result );
//if srcGraphic.PaletteIndex[ x0, y0 ] = 0 then Inc( Result );

  if dx > dy then begin
    fraction := dy2 - dx;
    while x0 <> x1 do begin
      if fraction >= 0 then begin
//      Inc( y0, stepy );
        Dec( fraction, dx2 );
        pSrcByte := Ptr( Integer( pSrcByte ) + stepScan );
      end;
      Inc( x0, stepx );
      Inc( fraction, dy2 );

      if stepx > 0 then begin
        srcBit := srcBit shr 1;
        if srcBit = 0 then begin
          srcBit := $80;
          pSrcByte := Ptr( Integer( pSrcByte ) + 1 );
        end;
      end else begin
        srcBit := srcBit shl 1;
        if srcBit = 0 then begin
          srcBit := $01;
          pSrcByte := Ptr( Integer( pSrcByte ) - 1 );
        end;
      end;

      if ( pSrcByte^ and srcBit ) = 0 then Inc( Result );
//    if srcGraphic.PaletteIndex[ x0, y0 ] = 0 then Inc( Result );

    end;
  end else begin
    fraction := dx2 - dy;
    while y0 <> y1 do begin
      if fraction >= 0 then begin
//      Inc( x0, stepx );
        Dec( fraction, dy2 );

        if stepx > 0 then begin
          srcBit := srcBit shr 1;
          if srcBit = 0 then begin
            srcBit := $80;
            pSrcByte := Ptr( Integer( pSrcByte ) + 1 );
          end;
        end else begin
          srcBit := srcBit shl 1;
          if srcBit = 0 then begin
            srcBit := $01;
            pSrcByte := Ptr( Integer( pSrcByte ) - 1 );
          end;
        end;

      end;
      Inc( y0, stepy );
      Inc( fraction, dx2 );
      pSrcByte := Ptr( Integer( pSrcByte ) + stepScan );

      if ( pSrcByte^ and srcBit ) = 0 then Inc( Result );
//    if srcGraphic.PaletteIndex[ x0, y0 ] = 0 then Inc( Result );
    end;
  end;
end;

function EnNumBlackPixelsInRowBW( const srcGraphic : TDibGraphic; row, fromCol, toCol : Integer ) : Integer;
{******************************************************************************}
{ Returns the number of pixels that are black in the given "srcGraphic"        }
{ in the given row between the given columns.                                  }
{******************************************************************************}
var
  pSrcByte : ^Byte;
  srcBit : Byte;
  x0, x1 : Integer;
begin
  Result := 0;
  if row < 0 then Exit;
  if row >= srcGraphic.Height then Exit;
  x0 := Min( fromCol, toCol );
  x1 := Max( fromCol, toCol );
  pSrcByte := Addr( srcGraphic.ScanLine[ row ] ^ [ x0 div 8 ] );
  srcBit := $80 shr ( x0 mod 8 );
  if ( pSrcByte^ and srcBit ) = 0 then Inc( Result );
  while x0 <> x1 do begin
    Inc( x0 );
    srcBit := srcBit shr 1;
    if srcBit = 0 then begin
      srcBit := $80;
      pSrcByte := Ptr( Integer( pSrcByte ) + 1 );
    end;
    if ( pSrcByte^ and srcBit ) = 0 then Inc( Result );
  end;
//Result := EnNumBlackPixelsInLineBW( srcGraphic, fromCol, row, toCol, row );
end;

function EnNumBlackPixelsInColBW( const srcGraphic : TDibGraphic; col, fromRow, toRow :Integer ) : Integer;
{******************************************************************************}
{ Returns the number of pixels that are black in the given "srcGraphic"        }
{ in the given column between the given rows.                                  }
{******************************************************************************}
var
  pSrcByte : ^Byte;
  srcBit : Byte;
  y0, y1 : Integer;
  stepScan : LongInt;
begin
  Result := 0;
  if col < 0 then Exit;
  if col >= srcGraphic.Width then Exit;
  stepScan := - srcGraphic.ScanLineSize;
  y0 := Min( fromRow, toRow );
  y1 := Max( fromRow, toRow );
  pSrcByte := Addr( srcGraphic.ScanLine[ y0 ] ^ [ col div 8 ] );
  srcBit := $80 shr ( col mod 8 );
  if ( pSrcByte^ and srcBit ) = 0 then Inc( Result );
  while y0 <> y1 do begin
    Inc( y0 );
    pSrcByte := Ptr( Integer( pSrcByte ) + stepScan );
    if ( pSrcByte^ and srcBit ) = 0 then Inc( Result );
  end;
//Result := EnNumBlackPixelsInLineBW( srcGraphic, col, fromRow, col, toRow );
end;

function EnLeftEdgeBW( const srcGraphic : TDibGraphic; x0, y0, x1, y1 : Integer; thresholdPct : Double ) : Integer;
{******************************************************************************}
{ Returns the left edge in the given "srcGraphic" inside the given "srcRect"   }
{ which is defined as the first column with black in it.                       }
{******************************************************************************}
var
  cnt : Integer;
  colIsSolid : Boolean;
  numPixelsInLine : Integer;
begin
  { Left edge }
  numPixelsInLine := EnNumPixelsInLine( x0, y0, x0, y1 );
  Result := x0;
  while Result < x1 do begin
    cnt := EnNumBlackPixelsInColBW( srcGraphic, Result, y0, y1 );
    colIsSolid := ( ( ( 100.0 * cnt ) / numPixelsInLine ) > thresholdPct );
    if colIsSolid then break;
    Inc( Result );
  end;
end;

function EnRightEdgeBW( const srcGraphic : TDibGraphic; x0, y0, x1, y1 : Integer; thresholdPct : Double ) : Integer;
{******************************************************************************}
{ Returns the right edge in the given "srcGraphic" inside the given "srcRect"  }
{ which is defined as the last column with black in it.                        }
{******************************************************************************}
var
  cnt : Integer;
  colIsSolid : Boolean;
  numPixelsInLine : Integer;
begin
  { Left edge }
  numPixelsInLine := EnNumPixelsInLine( x1, y0, x1, y1 );
  Result := x1;
  while Result > x0 do begin
    Dec( Result );
    cnt := EnNumBlackPixelsInColBW( srcGraphic, Result, y0, y1 );
    colIsSolid := ( ( ( 100.0 * cnt ) / numPixelsInLine ) > thresholdPct );
    if colIsSolid then break;
  end;
end;

function EnPercentBlackPixelsBW( const srcGraphic : TDibGraphic; srcRect : TRect ) : Integer;
{******************************************************************************}
{ Returns 0 .. 10000 which indicates the percentage of pixels that are black   }
{ within the given "SrcRect" on the given "SrcBitmap".                         }
{******************************************************************************}
var
  numBlack : LongInt;
  numPixels : LongInt;
begin
  Result := EnPercentBlackPixelsBW( srcGraphic, srcRect, numBlack, numPixels );
end;

function EnPercentBlackPixelsBW( const srcGraphic : TDibGraphic; srcRect : TRect; var numBlack, numPixels : LongInt ) : Integer;
{******************************************************************************}
{ Returns 0 .. 10000 which indicates the percentage of pixels that are black   }
{ within the given "srcRect" on the given "srcGraphic".                        }
{ It also returns the number of black pixels and number of pixels examined.    }
{******************************************************************************}
var
  y : Integer;
  numPixelsInLine : Integer;
  num : Int64;
begin
  Result := 0;
  numBlack := 0;
  numPixels := 0;
  numPixelsInLine := EnNumPixelsInLine( srcRect.Left, srcRect.Top, srcRect.Right-1, srcRect.Top );
  for y := srcRect.Top to srcRect.Bottom-1 do begin
    Inc( numPixels, numPixelsInLine );
    Inc( numBlack, EnNumBlackPixelsInRowBW( srcGraphic, y, srcRect.Left, srcRect.Right-1 ) );
  end;
  if numPixels = 0 then Exit;
  num := numBlack;
  num := ( 100 * 100 * num ) div numPixels;
  Result := num;
end;

function EnPercentBlackPixelsInLineBW( const srcGraphic : TDibGraphic; x0, y0, x1, y1 : Integer ) : Integer; overload;
{******************************************************************************}
{ Returns 0 .. 10000 which indicates the percentage of pixels that are black   }
{ along the line with the given "srcRect" on the given "srcGraphic".           }
{******************************************************************************}
var
  numPixels : Integer;
  numBlack : Integer;
  num : Int64;
begin
  Result := 0;
  numPixels := EnNumPixelsInLine( x0, y0, x1, y1 );
  numBlack := EnNumBlackPixelsInLineBW( srcGraphic, x0, y0, x1, y1 );
  if numPixels = 0 then Exit;
  num := numBlack;
  num := ( 100 * 100 * num ) div numPixels;
  Result := num;
end;
(*
function ImagePixelsPercentBlack( SrcBitmap : TBitmap; SrcRect : TRect ) : Integer;
{******************************************************************************}
{ Returns 0 .. 10000 which indicates the percentage of pixels that are black   }
{ within the given "SrcRect" on the given "SrcBitmap".                         }
{******************************************************************************}
var
  numBlack : LongInt;
  numPixels : LongInt;
begin
  Result := ImagePixelsPercentBlackEx( SrcBitmap, SrcRect, numBlack, numPixels );
end;

function ImagePixelsPercentBlackEx( SrcBitmap : TBitmap; SrcRect : TRect; var NumBlack, NumPixels : LongInt ) : Integer;
{******************************************************************************}
{ Returns 0 .. 10000 which indicates the percentage of pixels that are black   }
{ within the given "SrcRect" on the given "SrcBitmap".                         }
{ It also returns the number of black pixels and number of pixels examined.    }
{******************************************************************************}
type
  PColorArray = ^TColorArray;
  TColorArray = array[0..32767] of TColor;
var
  row, col : Integer;
  cnt : LongInt;
  rowHeight : Integer;
  colWidth : Integer;
  numOfRow : Integer;
  numOfCol : Integer;
  rowInc : LongInt;
  colInc : LongInt;
  p : PColorArray;
  num : Int64;
begin
  { Convert bitmap into something standard }
  SrcBitmap.HandleType := bmDIB;
  SrcBitmap.PixelFormat := pf32bit;
  { Default values }
  colWidth  := SrcRect.Right  - SrcRect.Left;
  rowHeight := SrcRect.Bottom - SrcRect.Top;
  { Determine number of rows }
  numOfRow := rowHeight;        // Runs fast enough it doesn't need limited
//     if rowHeight <=  30 then numOfRow := rowHeight
//else if rowHeight <= 200 then numOfRow := 30
//else                          numOfRow := 60;
  { Determine number of columns }
  numOfCol := colWidth;         // Runs fast enought it doesn't need limited
//     if colWidth <=  30 then numOfCol := colWidth
//else if colWidth <= 200 then numOfCol := 30
//else                         numOfCol := 60;
  { Calculate increment with factor of 256 }
  rowInc := ( 256 * rowHeight ) div numOfRow;
  colInc := ( 256 * colWidth  ) div numOfCol;
  { Count pixels }
  cnt := 0;
  row := 0;
  while ( row div 256 ) < rowHeight do begin
    p := SrcBitmap.ScanLine[ ( row div 256 ) ];
    col := 0;
    while ( col div 256 ) < colWidth do begin
      if p[ ( col div 256 ) ] = clBlack then Inc( cnt );
      Inc( col, colInc );
    end;
    Inc( row, rowInc );
  end;
  NumBlack := cnt;
  NumPixels := numOfRow * numOfCol;
  num := cnt;
  num := ( 100 * 100 * num ) div numPixels;
  Result := num;
end;

function ImagePixelsCenterAdjustment( SrcBitmap : TBitmap; SrcRect : TRect; RowThresholdPct, ColThresholdPct : Double; var NumRight, NumDown : LongInt ) : Boolean;
{******************************************************************************}
{ Returns TRUE if the center adjustment was determined, otherwise FALSE.       }
{ The current image within the given "SrcRect" on the given "SrcBitmap"        }
{ is scanned.  The values returned in "NumRight" and "NumDown" are about       }
{ how much the image needs to shift in those directions to be centered.        }
{                                                                              }
{ The algorithm counts how many rows are solid, space, solid, space, solid.    }
{ This the offers these possible configurations:                               }
{                                                                              }
{     1        2       3        4        5        6        7        8          }
{ +--------------------------------------------------------------------------+ }
{            #####                     #####             #####    #####        }
{                                                                              }
{                    #####             #####    #####             #####        }
{                                                                              }
{                             #####             #####    #####    #####        }
{ +--------------------------------------------------------------------------+ }
{                                                                              }
{ In situation 7 the row that is largest will be centered.                     }
{                                                                              }
{ EXAMPLE                                                                      }
{                                                                              }
{   Clipboard.Assign( dibGraphic );                                            }
{   bitmap := TBitmap.Create;                                                  }
{   try                                                                                                         }
{     bitmap.LoadFromClipBoardFormat( CF_BITMAP, ClipBoard.GetAsHandle( CF_BITMAP ), 0 );                       }
{     r := Rect( 0, 0, bitmap.Width, bitmap.Height );                                                           }
{     Result := ImagePixelsCenterAdjustment( bitmap, r, RowThresholdPct, ColThresholdPct, numRight, numDown );  }
{     if Result then do something with numRight and numDown;                                                    }
{   finally bitmap.Free; end;                                                  }
{******************************************************************************}
type
  PColorArray = ^TColorArray;
  TColorArray = array[0..32767] of TColor;

  function numBlackPixelsInRow( row, fromCol, toCol : Integer ) : Integer;
  {******************************************************************************}
  { Returns number of pixels that are black in the given "row" starting from     }
  { column "fromCol" to column "toCol".                                          }
  {******************************************************************************}
  var
    p : PColorArray;
  begin
    Result := 0;
    p := SrcBitmap.ScanLine[ row ];
    while fromCol < toCol do begin
      if p[ fromCol ] = clBlack then Inc( Result );
      Inc( fromCol );
    end;
  end;

  function numBlackPixelsInCol( col, fromRow, toRow : Integer ) : Integer;
  {******************************************************************************}
  { Returns number of pixels that are black in the given "col" starting from     }
  { row "fromRow" to row "toRow".                                                }
  {******************************************************************************}
  var
    p : PColorArray;
  begin
    Result := 0;
    while fromRow < toRow do begin
      p := SrcBitmap.ScanLine[ fromRow ];
      if p[ col ] = clBlack then Inc( Result );
      Inc( fromRow );
    end;
  end;

  function calcRow( isSolid : Boolean; var fromRow : Integer; toRow, fromCol, toCol, colWidth : Integer ) : Integer;
  {******************************************************************************}
  { Returns the number of rows counted based which are considered solid or not   }
  { solid based on "isSolid".  The "fromRow" is set to the next row that         }
  { should be looked at if inspection continues.                                 }
  {******************************************************************************}
  var
    cnt : Integer;
    rowIsSolid : Boolean;
  begin
    Result := 0;
    while fromRow < toRow do begin
      cnt := numBlackPixelsInRow( fromRow, fromCol, toCol );
      rowIsSolid := ( ( ( 100.0 * cnt ) / colWidth ) > RowThresholdPct );
      if rowIsSolid then begin
        if not isSolid then Exit;
      end else begin
        if isSolid then Exit;
      end;
      Inc( fromRow );
      Inc( Result );
    end;
  end;

var
  row : Integer;
  rowHeight : Integer;
  colWidth : Integer;
  solid1, solid2, solid3 : Integer;
  space1, space2 : Integer;
  row1, row2, row3 : Integer;
  topRow, botRow : Integer;
  leftCol, rightCol : Integer;
  cnt : Integer;
  colIsSolid : Boolean;
//rptText : AnsiString;

begin
  Result  := FALSE;
  { Convert bitmap into something standard }
  SrcBitmap.HandleType := bmDIB;
  SrcBitmap.PixelFormat := pf32bit;
  { Default values }
  colWidth  := SrcRect.Right  - SrcRect.Left;
  rowHeight := SrcRect.Bottom - SrcRect.Top;

  { Count pixels }
  row := 0;
  solid1 := calcRow( TRUE,  row, rowHeight, 0, colWidth, colWidth );   row1 := row;
  space1 := calcRow( FALSE, row, rowHeight, 0, colWidth, colWidth );   row2 := row;
  solid2 := calcRow( TRUE,  row, rowHeight, 0, colWidth, colWidth );   row3 := row;
  space2 := calcRow( FALSE, row, rowHeight, 0, colWidth, colWidth );
  solid3 := calcRow( TRUE,  row, rowHeight, 0, colWidth, colWidth );

  { Configurations 1, 3, 4, 6 }
  if solid1 = 0 then begin
    { Configuration 1 - nothing }
    if solid2 = 0 then begin
      NumDown  := 0;
      Exit;
    { Configuration 4 - jammed against the bottom }
    end else if space2 = 0 then begin
      NumDown := - ( space1 div 2 );
      topRow := row2;
      botRow := row3;
    { Configuration 3 - floating in middle }
    end else if solid3 = 0 then begin
      NumDown := ( ( space1 + space2 ) div 2 ) - space1;
      topRow := row2;
      botRow := row3;
    { Configuration 6 - floating in middle and bottom piece }
    end else begin
      NumDown := ( ( space1 + space2 + solid3 ) div 2 ) - space1;
      topRow := row2;
      botRow := row3;
    end
  { Configurations 2, 5, 7, 8 }
  end else begin
    { Configuration 2 - jammed against the top }
    if solid2 = 0 then begin
      NumDown := ( space1 div 2 );
      topRow := 0;
      botRow := row1;
    { Configuration 7 - jammed against the top and bottom }
    end else if space2 = 0 then begin
      if solid1 > solid2 then begin
        NumDown := ( space1 div 2 ) + solid2;
        topRow := 0;
        botRow := row1;
      end else begin
        NumDown := - ( ( space1 div 2 ) + solid1 );
        topRow := row2;
        botRow := row3;
      end;
    { Configuration 5 - top piece and floating in middle }
    end else if solid3 = 0 then begin
      NumDown := ( ( space1 + space2 ) div 2 ) - space1 - solid1;
      topRow := row2;
      botRow := row3;
    { Configuration 8 - top piece, floating in middle, and bottom piece }
    end else begin
      NumDown := ( ( solid1 + space1 + space2 + solid3 ) div 2 ) - ( solid1 + space1 );
      topRow := row2;
      botRow := row3;
    end
  end;

  { Left edge }
  leftCol := 0;
  while leftCol < colWidth do begin
    cnt := numBlackPixelsInCol( leftCol, topRow, botRow );
    colIsSolid := ( ( ( 100.0 * cnt ) / ( botRow - topRow ) ) > ColThresholdPct );
    if colIsSolid then break;
    Inc( leftCol );
  end;

  { Right edge }
  rightCol := colWidth;
  while rightCol > 0 do begin
    Dec( rightCol );
    cnt := numBlackPixelsInCol( rightCol, topRow, botRow );
    colIsSolid := ( ( ( 100.0 * cnt ) / ( botRow - topRow ) ) > ColThresholdPct );
    if colIsSolid then break;
  end;

  { Nothing was found }
  if leftCol >= rightCol then begin
    NumRight := 0;
  end else begin
    NumRight := ( ( ( leftCol - 0 ) + ( colWidth - rightCol ) ) div 2 ) - ( leftCol - 0 );
  end;

//rptText := rptText + Format( '%8d', [ solid1 ] ) + CRLF;
//rptText := rptText + Format( '%8d', [ space1 ] ) + CRLF;
//rptText := rptText + Format( '%8d', [ solid2 ] ) + CRLF;
//rptText := rptText + Format( '%8d', [ space2 ] ) + CRLF;
//rptText := rptText + Format( '%8d', [ solid3 ] ) + CRLF;
//rptText := rptText + Format( 'NumDown = %d', [ NumDown ] ) + CRLF;
//rptText := rptText + Format( 'TopRow = %d  BotRow = %d', [ topRow, botRow ] ) + CRLF;
//rptText := rptText + Format( 'LeftCol = %d  RightCol = %d', [ leftCol, rightCol ] ) + CRLF;
//rptText := rptText + Format( 'NumRight = %d', [ NumRight ] ) + CRLF;
//ShowMessage( rptText );

  Result  := TRUE;
end;
*)

function calcColLeft( const srcGraphic : TDibGraphic; isSolid : Boolean; numInRow : Integer; var fromCol : Integer; toCol, fromRow, toRow : Integer; rowThresholdPct, colThresholdPct : Double ) : Integer;
{******************************************************************************}
{ Returns the number of columns counted.  If "isSolid" is TRUE then it looks   }
{ for solid columns, otherwise it looks for spaces.  The "fromCol" is set to   }
{ the next column that should be looked at if inspection continues.            }
{                                                                              }
{ The algorithm looks at the current column plus "numInRow" after that to make }
{ a determination.  This adds some hysteresis and allows weak columns.         }
{                                                                              }
{ It also keeps track of the last zero column.  This is used when searching    }
{ for a solid column so that if a column did not pass the threshold it might   }
{ still be included if it is close.                                            }
{                                                                              }
{ It also looks ahead when searching for spaces so that if a column was below  }
{ the threshold it might still be included if it is close.                     }
{******************************************************************************}
var
  cnt0, cnt1, cnt2 : Integer;
  rowHeight : Integer;
  colIsSolid : ( csFALSE, csTRUE, csUNKNOWN );
  colIsSolid0, colIsSolid1, colIsSolid2 : Boolean;
  lastZeroColumn : Integer;
begin
  Result := 0;
  lastZeroColumn := fromCol - 1;
  rowHeight := toRow - fromRow + 1;
  if rowHeight <= 0 then Exit;
  { Get all counts including those that look ahead }
  cnt0 := EnNumBlackPixelsInColBW( srcGraphic, fromCol, fromRow, toRow );
  if ( fromCol + 1 ) <= toCol then cnt1 := EnNumBlackPixelsInColBW( srcGraphic, fromCol + 1, fromRow, toRow ) else cnt1 := cnt0;
  if ( fromCol + 2 ) <= toCol then cnt2 := EnNumBlackPixelsInColBW( srcGraphic, fromCol + 2, fromRow, toRow ) else cnt2 := cnt1;
  { Get determinations }
  colIsSolid := csUNKNOWN;
  colIsSolid0 := ( ( ( 100.0 * cnt0 ) / rowHeight ) > colThresholdPct );
  colIsSolid1 := ( ( ( 100.0 * cnt1 ) / rowHeight ) > colThresholdPct );
  colIsSolid2 := ( ( ( 100.0 * cnt2 ) / rowHeight ) > colThresholdPct );
  { Go through the columns }
  while fromCol <= toCol do begin
    { All numInRow must be solid to change }
    case numInRow of
    1 :  if colIsSolid0 then colIsSolid := csTRUE;
    2 :  if colIsSolid0 and colIsSolid1 then colIsSolid := csTRUE;
    else if colIsSolid0 and colIsSolid1 and colIsSolid2 then colIsSolid := csTRUE;
    end;
    { All numInRow must NOT be solid to change }
    case numInRow of
    1 :  if not ( colIsSolid0 ) then colIsSolid := csFALSE;
    2 :  if not ( colIsSolid0 or colIsSolid1 ) then colIsSolid := csFALSE;
    else if not ( colIsSolid0 or colIsSolid1 or colIsSolid2 ) then colIsSolid := csFALSE;
    end;
    { Finding all the solid columns }
    if isSolid then begin
      if colIsSolid = csFALSE then begin
        if cnt0 = 0 then begin
          // don't need to change anything
        end else if ( cnt1 = 0 ) and ( ( fromCol + 1 ) <= toCol ) then begin
          Inc( fromCol );
          Inc( Result );
        end else if ( cnt2 = 0 ) and ( ( fromCol + 2 ) <= toCol ) then begin
          Inc( fromCol, 2 );
          Inc( Result, 2 );
        end;
        Exit;
      end;
    { Finding all the space columns }
    end else begin
      if colIsSolid = csTRUE then begin
        if ( lastZeroColumn + 2 ) >= fromCol then begin   // Had zero line recently
          Result := Result - ( fromCol - ( lastZeroColumn + 1 ) );
          fromCol := lastZeroColumn + 1;
        end;
        Exit;
      end;
    end;
    Inc( fromCol );
    Inc( Result );
    { Get next counts and shuffle determinations }
    cnt0 := cnt1;
    if cnt0 = 0 then lastZeroColumn := fromCol;
    cnt1 := cnt2;
    if ( fromCol + 2 ) <= toCol then cnt2 := EnNumBlackPixelsInColBW( srcGraphic, fromCol + 2, fromRow, toRow );
    colIsSolid0 := colIsSolid1;
    colIsSolid1 := colIsSolid2;
    colIsSolid2 := ( ( ( 100.0 * cnt2 ) / rowHeight ) > colThresholdPct );
  end;
end;

function EnTextLineDetectionBW( const srcGraphic : TDibGraphic; srcRect : TRect; rowThresholdPct, colThresholdPct : Double; var lineRect : TRect; var numRight, numDown : Integer ) : Boolean;
{******************************************************************************}
{ Returns TRUE if a line was found, the coordinates determined, and any        }
{ centering adjustment calculated, otherwise FALSE.                            }
{ The given "srcGraphic" is scanned within the given "srcRect" limits          }
{ using the given "rowThresholdPct" and "colThresholdPct" values.              }
{ The lines rectangular area is returned in "lineRect".                        }
{ The number of pixels necessary to center the line, if that would be desired, }
{ is returned in "numRight" and "numDown".                                     }
{                                                                              }
{ The algorithm counts how many rows are solid, space, solid, space, solid.    }
{ That allows these eight possible outcomes.  Any more lines than that are     }
{ ignored.                                                                     }
{                                                                              }
{     1        2       3        4        5        6        7        8          }
{ +--------------------------------------------------------------------------+ }
{            #####                     #####             #####    #####        }
{                                                                              }
{                    #####             #####    #####             #####        }
{                                                                              }
{                             #####             #####    #####    #####        }
{ +--------------------------------------------------------------------------+ }
{                                                                              }
{ In situation 7 the row that is of greatest height will be centered.          }
{******************************************************************************}

  function calcRow( isSolid : Boolean; var fromRow : Integer; toRow, fromCol, toCol : Integer ) : Integer;
  {******************************************************************************}
  { Returns the number of rows counted.  If "isSolid" is TRUE then it looks      }
  { for solid rows, otherwise it looks for spaces.  The "fromRow" is set to      }
  { the next row that should be looked at if inspection continues.               }
  {                                                                              }
  { The algorithm looks at the current row plus the two after that to make a     }
  { determination.  This adds some hysteresis and allows weak lines.             }
  {                                                                              }
  { It also keeps track of the last zero line.  This is used when searching      }
  { for a solid line so that if a row did not pass the threshold it might        }
  { still be included if it is close.                                            }
  {                                                                              }
  { It also looks ahead when searching for spaces so that if a row was below     }
  { the threshold it might still be included if it is close.                     }
  {******************************************************************************}
  var
    cnt0, cnt1, cnt2 : Integer;
    colWidth : Integer;
    rowIsSolid : ( rsFALSE, rsTRUE, rsUNKNOWN );
    rowIsSolid0, rowIsSolid1, rowIsSolid2 : Boolean;
    lastZeroLine : Integer;
  begin
    Result := 0;
    lastZeroLine := fromRow - 1;
    colWidth := toCol - fromCol + 1;
    if colWidth <= 0 then Exit;
    { Get all counts including those that look ahead }
    cnt0 := EnNumBlackPixelsInRowBW( srcGraphic, fromRow, fromCol, toCol );
    if ( fromRow + 1 ) <= toRow then cnt1 := EnNumBlackPixelsInRowBW( srcGraphic, fromRow + 1, fromCol, toCol ) else cnt1 := cnt0;
    if ( fromRow + 2 ) <= toRow then cnt2 := EnNumBlackPixelsInRowBW( srcGraphic, fromRow + 2, fromCol, toCol ) else cnt2 := cnt1;
    { Get determinations }
    rowIsSolid := rsUNKNOWN;
    rowIsSolid0 := ( ( ( 100.0 * cnt0 ) / colWidth ) > rowThresholdPct );
    rowIsSolid1 := ( ( ( 100.0 * cnt1 ) / colWidth ) > rowThresholdPct );
    rowIsSolid2 := ( ( ( 100.0 * cnt2 ) / colWidth ) > rowThresholdPct );
    { Go through the rows }
    while fromRow <= toRow do begin
      { All three rows must be solid to change }
      if rowIsSolid0 and rowIsSolid1 and rowIsSolid2 then rowIsSolid := rsTRUE;
      { All three rows must NOT be solid to change }
      if not ( rowIsSolid0 or rowIsSolid1 or rowIsSolid2 ) then rowIsSolid := rsFALSE;
      { Finding all the solid lines }
      if isSolid then begin
        if rowIsSolid = rsFALSE then begin
          if cnt0 = 0 then begin
            // don't need to change anything
          end else if ( cnt1 = 0 ) and ( ( fromRow + 1 ) <= toRow ) then begin
            Inc( fromRow );
            Inc( Result );
          end else if ( cnt2 = 0 ) and ( ( fromRow + 2 ) <= toRow ) then begin
            Inc( fromRow, 2 );
            Inc( Result, 2 );
          end;
          Exit;
        end;
      { Finding all the space lines }
      end else begin
        if rowIsSolid = rsTRUE then begin
          if ( lastZeroLine + 2 ) >= fromRow then begin   // Had zero line recently
            Result := Result - ( fromRow - ( lastZeroLine + 1 ) );
            fromRow := lastZeroLine + 1;
          end;
          Exit;
        end;
      end;
      Inc( fromRow );
      Inc( Result );
      { Get next counts and shuffle determinations }
      cnt0 := cnt1;
      if cnt0 = 0 then lastZeroLine := fromRow;
      cnt1 := cnt2;
      if ( fromRow + 2 ) <= toRow then cnt2 := EnNumBlackPixelsInRowBW( srcGraphic, fromRow + 2, fromCol, toCol );
      rowIsSolid0 := rowIsSolid1;
      rowIsSolid1 := rowIsSolid2;
      rowIsSolid2 := ( ( ( 100.0 * cnt2 ) / colWidth ) > rowThresholdPct );
    end;
  end;

  function calcColRight( isSolid : Boolean; fromCol : Integer; var toCol : Integer; fromRow, toRow : Integer ) : Integer;
  {******************************************************************************}
  { Returns the number of columns counted.  If "isSolid" is TRUE then it looks   }
  { for solid columns, otherwise it looks for spaces.  The "fromCol" is set to   }
  { the next column that should be looked at if inspection continues.            }
  {                                                                              }
  { The algorithm looks at the current column minus the two before that to make  }
  { a determination.  This adds some hysteresis and allows weak columns.         }
  {                                                                              }
  { It also keeps track of the last zero column.  This is used when searching    }
  { for a solid column so that if a column did not pass the threshold it might   }
  { still be included if it is close.                                            }
  {                                                                              }
  { It also looks ahead when searching for spaces so that if a column was below  }
  { the threshold it might still be included if it is close.                     }
  {******************************************************************************}
  var
    cnt0, cnt1, cnt2 : Integer;
    rowHeight : Integer;
    colIsSolid : ( csFALSE, csTRUE, csUNKNOWN );
    colIsSolid0, colIsSolid1, colIsSolid2 : Boolean;
    lastZeroColumn : Integer;
  begin
    Result := 0;
    lastZeroColumn := toCol + 1;
    rowHeight := toRow - fromRow + 1;
    if rowHeight <= 0 then Exit;
    { Get all counts including those that look ahead }
    cnt0 := EnNumBlackPixelsInColBW( srcGraphic, fromCol, fromRow, toRow );
    if ( toCol - 1 ) > fromCol then cnt1 := EnNumBlackPixelsInColBW( srcGraphic, toCol - 1, fromRow, toRow ) else cnt1 := cnt0;
    if ( toCol - 2 ) > fromCol then cnt2 := EnNumBlackPixelsInColBW( srcGraphic, toCol - 2, fromRow, toRow ) else cnt2 := cnt1;
    { Get determinations }
    colIsSolid := csUNKNOWN;
    colIsSolid0 := ( ( ( 100.0 * cnt0 ) / rowHeight ) > colThresholdPct );
    colIsSolid1 := ( ( ( 100.0 * cnt1 ) / rowHeight ) > colThresholdPct );
    colIsSolid2 := ( ( ( 100.0 * cnt2 ) / rowHeight ) > colThresholdPct );
    { Go through the columns }
    while toCol > fromCol do begin
      { All three rows must be solid to change }
      if colIsSolid0 and colIsSolid1 and colIsSolid2 then colIsSolid := csTRUE;
      { All three rows must NOT be solid to change }
      if not ( colIsSolid0 or colIsSolid1 or colIsSolid2 ) then colIsSolid := csFALSE;
      { Finding all the solid columns }
      if isSolid then begin
        if colIsSolid = csFALSE then begin
          if cnt0 = 0 then begin
            // don't need to change anything
          end else if ( cnt1 = 0 ) and ( ( toCol - 1 ) > fromCol ) then begin
            Dec( toCol );
            Inc( Result );
          end else if ( cnt2 = 0 ) and ( ( toCol - 2 ) > fromCol ) then begin
            Dec( toCol, 2 );
            Inc( Result, 2 );
          end;
          Exit;
        end;
      { Finding all the space columns }
      end else begin
        if colIsSolid = csTRUE then begin
          if ( lastZeroColumn - 2 ) <= toCol then begin   // Had zero column recently
            Result := Result + ( ( lastZeroColumn - 1 ) - toCol );
            toCol := lastZeroColumn - 1;
          end;
          Exit;
        end;
      end;
      Dec( toCol );
      Inc( Result );
      { Get next counts and shuffle determinations }
      cnt0 := cnt1;
      if cnt0 = 0 then lastZeroColumn := toCol;
      cnt1 := cnt2;
      if ( toCol - 2 ) > fromCol then cnt2 := EnNumBlackPixelsInColBW( srcGraphic, toCol - 2, fromRow, toRow );
      colIsSolid0 := colIsSolid1;
      colIsSolid1 := colIsSolid2;
      colIsSolid2 := ( ( ( 100.0 * cnt2 ) / rowHeight ) > colThresholdPct );
    end;
  end;

var
  row : Integer;
  solid1, solid2, solid3 : Integer;
  space1, space2 : Integer;
  row1, row2, row3 : Integer;
//rptText : AnsiString;

begin
  Result  := FALSE;
  lineRect := srcRect;
  { See if conditions are good }
  if srcGraphic.ImageFormat <> ifBlackWhite then Exit;

  { Bring the left edge in - trivial }
  while lineRect.Left < (lineRect.Right-1) do begin
    if EnNumBlackPixelsInColBW( srcGraphic, lineRect.Left, lineRect.Top, lineRect.Bottom-1 ) > 0 then break;
    Inc( lineRect.Left );
  end;

  { Bring the right edge in - trivial }
  while lineRect.Right > lineRect.Left do begin
    if EnNumBlackPixelsInColBW( srcGraphic, lineRect.Right-1, lineRect.Top, lineRect.Bottom-1 ) > 0 then break;
    Dec( lineRect.Right );
  end;
(*
  { Bring the top row down - trivial }
  while srcRect.Top < (srcRect.Bottom-1) do begin
    if EnNumBlackPixelsInRowBW( srcGraphic, srcRect.Top, srcRect.Left, srcRect.Right-1 ) > 0 then break;
    Inc( srcRect.Top );
  end;

  { Bring the bottom row up - trivial }
  while srcRect.Bottom > srcRect.Top do begin
    if EnNumBlackPixelsInRowBW( srcGraphic, srcRect.Bottom-1, srcRect.Left, srcRect.Right-1 ) > 0 then break;
    Dec( srcRect.Bottom );
  end;
*)

  { Count pixels }
  row := srcRect.Top;
  solid1 := calcRow( TRUE,  row, srcRect.Bottom-1, lineRect.Left, lineRect.Right-1 );   row1 := row;
  space1 := calcRow( FALSE, row, srcRect.Bottom-1, lineRect.Left, lineRect.Right-1 );   row2 := row;
  solid2 := calcRow( TRUE,  row, srcRect.Bottom-1, lineRect.Left, lineRect.Right-1 );   row3 := row;
  space2 := calcRow( FALSE, row, srcRect.Bottom-1, lineRect.Left, lineRect.Right-1 );
  solid3 := calcRow( TRUE,  row, srcRect.Bottom-1, lineRect.Left, lineRect.Right-1 );

  { Configurations 1, 3, 4, 6 }
  if solid1 = 0 then begin
    { Configuration 1 - nothing }
    if solid2 = 0 then begin
      numDown  := 0;
      Exit;
    { Configuration 4 - jammed against the bottom }
    end else if space2 = 0 then begin
      numDown := - ( space1 div 2 );
      lineRect.Top := row2;
      lineRect.Bottom := row3;
    { Configuration 3 - floating in middle }
    end else if solid3 = 0 then begin
      numDown := ( ( space1 + space2 ) div 2 ) - space1;
      lineRect.Top := row2;
      lineRect.Bottom := row3;
    { Configuration 6 - floating in middle and bottom piece }
    end else begin
      numDown := ( ( space1 + space2 + solid3 ) div 2 ) - space1;
      lineRect.Top := row2;
      lineRect.Bottom := row3;
    end
  { Configurations 2, 5, 7, 8 }
  end else begin
    { Configuration 2 - jammed against the top }
    if solid2 = 0 then begin
      numDown := ( space1 div 2 );
      lineRect.Top := srcRect.Top;
      lineRect.Bottom := row1;
    { Configuration 7 - jammed against the top and bottom }
    end else if space2 = 0 then begin
      if solid1 > solid2 then begin
        numDown := ( space1 div 2 ) + solid2;
        lineRect.Top := srcRect.Top;
        lineRect.Bottom := row1;
      end else begin
        numDown := - ( ( space1 div 2 ) + solid1 );
        lineRect.Top := row2;
        lineRect.Bottom := row3;
      end;
    { Configuration 5 - top piece and floating in middle }
    end else if solid3 = 0 then begin
      numDown := ( ( space1 + space2 ) div 2 ) - space1 - solid1;
      lineRect.Top := row2;
      lineRect.Bottom := row3;
    { Configuration 8 - top piece, floating in middle, and bottom piece }
    end else begin
      numDown := ( ( solid1 + space1 + space2 + solid3 ) div 2 ) - ( solid1 + space1 );
      lineRect.Top := row2;
      lineRect.Bottom := row3;
    end
  end;

  { Left edge }
  calcColLeft( srcGraphic, FALSE, 3, lineRect.Left, lineRect.Right-1, lineRect.Top, lineRect.Bottom-1, rowThresholdPct, colThresholdPct );
  { Right edge }
  Dec( lineRect.Right );
  calcColRight( FALSE, lineRect.Left, lineRect.Right, lineRect.Top, lineRect.Bottom-1 );
  Inc( lineRect.Right );

  { Nothing was found }
  if lineRect.Left >= lineRect.Right then begin
    numRight := 0;
  end else begin
    numRight := ( ( ( lineRect.Left - srcRect.Left ) + ( srcRect.Right - lineRect.Right ) ) div 2 ) - ( lineRect.Left - srcRect.Left );
  end;
  (*
  rptText := rptText + Format( '%8d', [ solid1 ] ) + CRLF;
  rptText := rptText + Format( '%8d', [ space1 ] ) + CRLF;
  rptText := rptText + Format( '%8d', [ solid2 ] ) + CRLF;
  rptText := rptText + Format( '%8d', [ space2 ] ) + CRLF;
  rptText := rptText + Format( '%8d', [ solid3 ] ) + CRLF;
  rptText := rptText + Format( 'NumDown = %d', [ NumDown ] ) + CRLF;
  rptText := rptText + Format( 'TopRow = %d  BotRow = %d', [ lineRect.Top, lineRect.Bottom ] ) + CRLF;
  rptText := rptText + Format( 'LeftCol = %d  RightCol = %d', [ lineRect.Left, lineRect.Right ] ) + CRLF;
  rptText := rptText + Format( 'NumRight = %d', [ NumRight ] ) + CRLF;
  ShowMessage( rptText );
  *)
  Result  := TRUE;
end;

function EnTextCharDetectionBWLocal( const srcGraphic : TDibGraphic; lineRect : TRect; rowThresholdPct, colThresholdPct : Double; var charRect : TRect; var nextCharColumn : Integer ) : Boolean;
{******************************************************************************}
{ Returns TRUE if another character was found, otherwise FALSE.                }
{ The given "srcGraphic" is scanned within the given "lineRect" limits         }
{ using the given "rowThresholdPct" and "colThresholdPct" values.              }
{ The character rectangular area is returned in "charRect".  The search        }
{ begins in the "nextCharColumn" and this value is modified so it is ready     }
{ for use in the next call to this function.                                   }
{******************************************************************************}
var
  rowHeight : Integer;
  minWidth, maxWidth, typWidth : Integer;
//aveWidth : Integer;
//minCnt : Integer;
  minCol : Integer;
  i, cnt, col : Integer;
  prcnt : Integer;
  hystMinVal, hystMinCnt : Integer;
  minVal, minCnt : Integer;
  valSet : Boolean;

begin
  Result  := FALSE;
  charRect := lineRect;
  { See if conditions are good }
  if srcGraphic.ImageFormat <> ifBlackWhite then Exit;

  { Simple initialization }
  rowHeight := charRect.Bottom - charRect.Top;
  minWidth := Trunc( rowHeight * 0.3 );       // Minimum width a character can be
  typWidth := Trunc( rowHeight * 0.7 );       // Typical width of a character
//aveWidth := Trunc( rowHeight * 1.1 );       // Average distance between characters
  maxWidth := Trunc( rowHeight * 1.4 );       // Maximum width a character can be

  { See if too short to OCR }
  if rowHeight < 9 then begin
    nextCharColumn := lineRect.Right;
    Exit;
  end;

  { Determine left position - skip space pixels }
  if nextCharColumn < lineRect.Left then nextCharColumn := lineRect.Left;
  charRect.Left := nextCharColumn;
  if calcColLeft( srcGraphic, FALSE, 2, nextCharColumn, charRect.Right-1, charRect.Top, charRect.Bottom-1, rowThresholdPct, colThresholdPct ) >= typWidth then begin
    { Limit was reached }
    charRect.Left := charRect.Left + typWidth;
    charRect.Right := charRect.Left + typWidth;
    if charRect.Right > lineRect.Right then charRect.Right := lineRect.Right;
    nextCharColumn := charRect.Left;
    Exit;
  end;
  charRect.Left := nextCharColumn;

(*
  { Determine right position - skip solid pixels }
  if calcColLeft( srcGraphic, TRUE, 2, nextCharColumn, charRect.Right-1, charRect.Top, charRect.Bottom-1, rowThresholdPct, colThresholdPct ) >= maxWidth then begin
    { Obvious break was not found again so use minimum between minimum and average widths }
    charRect.Right := charRect.Left + aveWidth;
    nextCharColumn := charRect.Left + ( ( minWidth + typWidth ) div 2 );
    minCnt := rowHeight;
    minCol := nextCharColumn;
    while nextCharColumn < charRect.Right do begin
      cnt := EnNumBlackPixelsInColBW( srcGraphic, nextCharColumn, charRect.Top, charRect.Bottom-1 );
      if ( minCnt <> 0 ) and ( cnt <= (minCnt+2) ) then begin
        minCnt := cnt;
        minCol := nextCharColumn;
      end;
      Inc( nextCharColumn );
    end;
    nextCharColumn := minCol;
  end;
  charRect.Right := nextCharColumn;
*)


  { Determine right position - skip solid pixels }
  minCol := charRect.Left + typWidth;
  nextCharColumn := minCol;

  cnt := 0;
  valSet := FALSE;
  hystMinVal := 10000; hystMinCnt := 0;
  for col := charRect.Left + minWidth to charRect.Left + maxWidth do begin
    { Get hystogram }
    minVal := 10000; minCnt := 0;
    for i := 0 to 0 do begin          // If this was -x to x then it would try different angled lines
      prcnt := EnPercentBlackPixelsInLineBW( srcGraphic, col + i, charRect.Top, col - i, charRect.Bottom-1 );
      if prcnt < minVal then begin
        minVal := prcnt;  minCnt := 1;
      end else if prcnt = minVal then begin
        Inc( minCnt );
      end;
    end;
    { Compare with previous results }
    if ( minVal < hystMinVal )
    or ( ( minVal = hystMinVal ) and ( minCnt >= hystMinCnt ) )
    then begin
      Inc( cnt );
      if ( minVal < hystMinVal )      // Always go with lowest value
      or not valSet then begin        // Or first value if not yet set
        valSet := TRUE;
        minCol := col;
      end;
      hystMinVal := minVal;
      hystMinCnt := minCnt;
    end else begin
      if hystMinVal <> 0 then begin     // Only rearm if zero was not already found
        valSet := FALSE;
      end;
    end;
  end;
  if cnt > 0 then begin
    nextCharColumn := minCol;
  end;

  { Bring the right edge in - trivial }
  while nextCharColumn > (charRect.Left+1) do begin
    prcnt := EnPercentBlackPixelsInLineBW( srcGraphic, nextCharColumn-1, charRect.Top, nextCharColumn-1, charRect.Bottom-1 );
    if prcnt > hystMinVal then break;
    Dec( nextCharColumn );
  end;

  charRect.Right := nextCharColumn;

  Result  := TRUE;
end;

function EnTextCharDetectionBW( const srcGraphic : TDibGraphic; lineRect : TRect; rowThresholdPct, colThresholdPct : Double; var charRect : TRect; var nextCharColumn : Integer ) : Boolean;
{******************************************************************************}
{ Returns TRUE if another character was found, otherwise FALSE.                }
{ The given "srcGraphic" is scanned within the given "lineRect" limits         }
{ using the given "rowThresholdPct" and "colThresholdPct" values.              }
{ The character rectangular area is returned in "charRect".  The search        }
{ begins in the "nextCharColumn" and this value is modified so it is ready     }
{ for use in the next call to this function.                                   }
{                                                                              }
{   nextCharColumn := 0;                                                       }
{   while nextCharColumn < (lineRect.Right-1) do begin                         }
{     if EnTextCharDetectionBW( srcGraphic, lineRect, rowThresh, colThresh,    }
{                               charRect, nextCharColumn ) then                }
{     begin                                                                    }
{       do whatever with charRect                                              }
{     end else begin                                                           }
{       character was a space                                                  }
{     end;                                                                     }
{   end;                                                                       }
{******************************************************************************}
var
  rowHeight : Integer;
  minWidth : Integer;
  typWidth : Integer;
  maxWidth : Integer;
  maxGap : Integer;
  charRect2 : TRect;
  nextCharColumn2 : Integer;
  gap : Integer;
  width2 : Integer;
  width3 : Integer;
begin
  { Get original results }
  Result := EnTextCharDetectionBWLocal( srcGraphic, lineRect, rowThresholdPct, colThresholdPct, charRect, nextCharColumn );
  { Get next character also }
  if Result then begin
    nextCharColumn2 := nextCharColumn;
    if EnTextCharDetectionBWLocal( srcGraphic, lineRect, rowThresholdPct, colThresholdPct, charRect2, nextCharColumn2 ) then begin
      rowHeight := charRect2.Bottom - charRect2.Top;
      minWidth := Trunc( rowHeight * 0.30 );          // Minimum width a character can be
      typWidth := Trunc( rowHeight * 0.70 * 0.80 );   // Typical width of a character * reduction factor
      maxWidth := Trunc( rowHeight * 1.40 );          // Maximum width a character can be
      maxGap   := Trunc( rowHeight * 0.10 );          // Maximum gap space
      gap := charRect2.Left - charRect.Right;         // Gap between characters or within character
      width2 := charRect2.Right - charRect2.Left;     // Width of possible second character
      width3 := charRect2.Right - charRect.Left;      // Width if combined
      { Put characters together if they have a small gap and fit parameters }
      if ( gap <= maxGap ) and ( width2 < typWidth ) then begin   // If the gap is small and the second width is smaller than typical character
        if ( width2 < minWidth )                                  // If second width is really small
        or ( width3 < maxWidth ) then begin                       // Or total width could be a character
          nextCharColumn := nextCharColumn2;                      // Then combine the parts
          charRect.Right := charRect2.Right;
        end;
      end;
    end;
  end;
end;

end.
