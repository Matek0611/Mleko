unit EnBarcode;
{##############################################################################}
{ EnBarcode - Provides general purpose barcode related library functions.      }
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
{          Jan 03, 2002. Nick Boland, look for white space around barcode      }
{          Mar 28, 2002. Nick Boland, add GNU Lessor General Public License    }
{##############################################################################}

interface

uses
  Classes, SysUtils, WinTypes, WinProcs, Dialogs, Math,
  EnDiGrph, EnMisc, EnProLib;

type
  TImageTypeBarcode = ( itbUnknown, itbCode39, itbCode128, itbCode2of5, itbEAN13, itbEAN8, itbUPCA, itbUPCE, itbCODABAR );

  TBarcodeStringResult = record
    BarcodeString : AnsiString;
    BarcodeType : TImageTypeBarcode;
  end;

function  EnReadBarcodeBW( const srcGraphic : TDibGraphic; lineRect : TRect; params : AnsiString; typeBarcode : TImageTypeBarcode; var strResults : array of TBarcodeStringResult ) : Boolean;

implementation

const
  NUM_LEVELS = 2048 * 5;
type
  TLevelArray = array [ 0 .. NUM_LEVELS-1 ] of Word;

function EnGetRasterCountsInRowBW( const srcGraphic : TDibGraphic; row, fromCol, toCol : Integer; var blackLevels, whiteLevels : TLevelArray ) : Integer;
{******************************************************************************}
{ Returns the number of raster levels found along the given row.               }
{                                                                              }
{ NOTE - it is assumed that black level occurs first.  If the row starts       }
{ with white then it is skipped until it encounters black.                     }
{******************************************************************************}
var
  i : Integer;
  cntBlack : Integer;
  cntWhite : Integer;
  pSrcByte : ^Byte;
  srcBit : Byte;
  x0, x1 : Integer;
  isBlack : Boolean;
begin
  Result := 0;
  { Initialize the array }
  for i := Low( blackLevels ) to High( blackLevels ) do begin
    blackLevels[i] := 0;
    whiteLevels[i] := 0;
  end;
  { Preconditions }
  if row < 0 then Exit;
  if row >= srcGraphic.Height then Exit;
  x0 := Min( fromCol, toCol );
  x1 := Max( fromCol, toCol );
  pSrcByte := Addr( srcGraphic.ScanLine[ row ] ^ [ x0 div 8 ] );
  srcBit := $80 shr ( x0 mod 8 );
  { Initialize count }
  cntBlack := 0;
  cntWhite := 0;
  if ( pSrcByte^ and srcBit ) = 0 then begin
    Inc( cntBlack );
    isBlack := TRUE;
  end else begin
    Inc( cntWhite );
    isBlack := FALSE;
    Result := - 1;
  end;
  { Scan row looking for changes }
  while x0 <> x1 do begin
    Inc( x0 );
    srcBit := srcBit shr 1;
    if srcBit = 0 then begin
      srcBit := $80;
      pSrcByte := Ptr( Integer( pSrcByte ) + 1 );
    end;
    if ( pSrcByte^ and srcBit ) = 0 then begin
      Inc( cntBlack );
      if not isBlack then begin
        if Result >= 0 then whiteLevels[ Result ] := cntWhite;
        cntWhite := 0;
        isBlack := TRUE;
        Inc( Result );
        if Result >= NUM_LEVELS then break;
      end;
    end else begin
      Inc( cntWhite );
      if isBlack then begin
        blackLevels[ Result ] := cntBlack;
        cntBlack := 0;
        isBlack := FALSE;
      end;
    end;
  end;
end;

procedure EnTrimRasterCounts( const srcGraphic : TDibGraphic; var blackLevels, whiteLevels : TLevelArray );
{******************************************************************************}
{ Looks for large gaps and trims the count values to keep only what            }
{ seems to be valid in between.  Gaps are defined as a function of DPI.        }
{ It is hoped that huge barcodes would not be used on the page.                }
{ If the first gap is over half way through the barcode then it is assumed     }
{ that the gap follows the barcode.                                            }
{******************************************************************************}
const
  DPI_DIVISOR = 5;    // 1/5 of an inch, 200 DPI gives gap of 40 counts, 300 DPI gives gap of 60 counts
var
  threshold : Word;
  numEntries : Integer;
  startGap, endGap : Integer;
  i : Integer;
  x : Integer;
begin
  threshold := srcGraphic.XDotsPerInch div DPI_DIVISOR;
  { Find number of entries }
  numEntries := High( blackLevels ) - Low( blackLevels ) + 1;
  for i := High( blackLevels ) downto Low( blackLevels ) do begin
    if ( blackLevels[i] <> 0 ) or ( whiteLevels[i] <> 0 ) then break;
    Dec( numEntries );
  end;
  { Find any gaps }
  startGap := 0;
  endGap := High( blackLevels ) + 1;
  for i := Low( blackLevels ) to High( blackLevels ) do begin
    if ( blackLevels[i] > threshold ) or ( whiteLevels[i] > threshold ) then begin
      if ( startGap = 0 ) and ( i < ( numEntries div 2 ) ) then begin
        startGap := i + 1;
      end else begin
        endGap := i;
        break;
      end;
    end;
  end;
  { Move array }
  x := 0;
  for i := startGap to endGap - 1 do begin
    blackLevels[x] := blackLevels[i];
    whiteLevels[x] := whiteLevels[i];
    Inc( x );
  end;
  { Clear rest of array }
  while x <= High( blackLevels ) do begin
    blackLevels[x] := 0;
    whiteLevels[x] := 0;
    Inc( x );
  end;
end;

procedure EnNormalizeRasterCounts( numLevels : Integer; var levels : TLevelArray );
{******************************************************************************}
{ Normalizes the given raster "levels" using the given "numLevels".            }
{ For example, if numLevels = 2 then the array will contain the values         }
{ 0 and 1 when it is finished.                                                 }
{                                                                              }
{ NOTE - Right now "numLevels" is ignored and is assumed to be 2.              }
{******************************************************************************}
var
  i : Integer;
  cnt : Word;
  minVal, maxVal : Word;
  threshold : Word;
begin
  { Find min and max values }
  minVal := MAXWORD;
  maxVal := 0;
  for i := Low( levels ) to High( levels ) do begin
    cnt := levels[i];
    if cnt = 0 then continue;
    if cnt < minVal then minVal := cnt;
    if cnt > maxVal then maxVal := cnt;
  end;
  { Put threshold half way }
  threshold := ( maxVal + minVal ) div 2;
  { Normalize }
  for i := Low( levels ) to High( levels ) do begin
    if levels[i] > threshold then levels[i] := 1 else levels[i] := 0;
  end;
end;

function EnReadBarCode39( const blackLevels, whiteLevels : TLevelArray; var str : AnsiString ) : Boolean;
{******************************************************************************}
{ Returns TRUE if the given barcode raster levels were properly decoded,       }
{ otherwise FALSE.  The string is returned as "result".                        }
{                                                                              }
{ Code 39 (sometimes called Code 3 from 9) is a discrete barcode.  This means  }
{ a fixed pattern of bars represents a single character.                       }
{                                                                              }
{ Each character is made up of 9 bars, 3 of which are wider than the others.   }
{ A bar considered to be either black or the white space between bars.  Each   }
{ character has 5 black bars and 4 white bars.  If you count the white space   }
{ inbetween characters that makes 5 white bars to make them even.              }
{                                                                              }
{ In theory, the ratio of the bar widths can range from 2.2:1 to 3:1.          }
{ To read reliably the decoder must be able to differentiate between the       }
{ wide and narrow bars.  In practice when printing barcodes it is better       }
{ to try and be closer to the 3:1 ratio to avoid ambiguity.                    }
{                                                                              }
{ The space between each barcode character is called the intercharacter gap.   }
{ Its width is undefined but is usually equivalent to a narrow white bar.      }
{                                                                              }
{ The Code 39 supports 43 characters plus an additional character used as      }
{ a delimiter or start/stop character.  This character is the * astrick.       }
{ All alphabetic characters are upper case.                                    }
{                                                                              }
{ CHECK DIGIT                                                                  }
{ A check digit is not often used with Code 39 but a few critical applications }
{ may require one.  The check digit is the modulus 43 sum of all the           }
{ character values in the message.  It is printed as the last data character.  }
{                                                                              }
{ Example:  "12345/ABCDE"                                                      }
{ Sum of values  1 + 2 + 3 + 4 + 5 + 40 + 10 + 11 + 12 + 13 + 14 = 115         }
{ 115 divided by 43 = 2 remainder 29.  Therefore "T" is the check digit.       }
{ Data with check digit:  "12345/ABCDET"                                       }
{******************************************************************************}
type
  BitSet = set of ( B0, B1, B2, B3, B4, B5, B6, B7, B8 );

  TCode39Record = packed record
    C : AnsiChar;     // Character
    B : BitSet;   // Bars and space pattern
    M : Byte;     // Modulus check value
  end;

  TCode39Array = array [ 0 .. 43 ] of TCode39Record;

const
  CODE39TABLE : TCode39Array = (
    { CHAR       |----- BARS -----|  |-- SPACES --|  MOD VALUE       |- PATTERN-| }
    ( C:'1'; B:[ B8,             B4,     B2         ]; M:1  ),    // xx x  x x xx
    ( C:'2'; B:[     B7,         B4,     B2         ]; M:2  ),    // x xx  x x xx
    ( C:'3'; B:[ B8, B7,                 B2         ]; M:3  ),    // xx xx  x x x
    ( C:'4'; B:[         B6,     B4,     B2         ]; M:4  ),    // x x  xx x xx
    ( C:'5'; B:[ B8,     B6,             B2         ]; M:5  ),    // xx x  xx x x
    ( C:'6'; B:[     B7, B6,             B2         ]; M:6  ),    // x xx  xx x x
    ( C:'7'; B:[             B5, B4,     B2         ]; M:7  ),    // x x  x xx xx
    ( C:'8'; B:[ B8,         B5,         B2         ]; M:8  ),    // xx x  x xx x
    ( C:'9'; B:[     B7,     B5,         B2         ]; M:9  ),    // x xx  x xx x
    ( C:'0'; B:[         B6, B5,         B2         ]; M:0  ),    // x x  xx xx x
    ( C:'A'; B:[ B8,             B4,         B1     ]; M:10 ),    // xx x x  x xx
    ( C:'B'; B:[     B7,         B4,         B1     ]; M:11 ),    // x xx x  x xx
    ( C:'C'; B:[ B8, B7,                     B1     ]; M:12 ),    // xx xx x  x x
    ( C:'D'; B:[         B6,     B4,         B1     ]; M:13 ),    // x x xx  x xx
    ( C:'E'; B:[ B8,     B6,                 B1     ]; M:14 ),    // xx x xx  x x
    ( C:'F'; B:[     B7, B6,                 B1     ]; M:15 ),    // x xx xx  x x
    ( C:'G'; B:[             B5, B4,         B1     ]; M:16 ),    // x x x  xx xx
    ( C:'H'; B:[ B8,         B5,             B1     ]; M:17 ),    // xx x x  xx x
    ( C:'I'; B:[     B7,     B5,             B1     ]; M:18 ),    // x xx x  xx x
    ( C:'J'; B:[         B6, B5,             B1     ]; M:19 ),    // x x xx  xx x
    ( C:'K'; B:[ B8,             B4,             B0 ]; M:20 ),    // xx x x x  xx
    ( C:'L'; B:[     B7,         B4,             B0 ]; M:21 ),    // x xx x x  xx
    ( C:'M'; B:[ B8, B7,                         B0 ]; M:22 ),    // xx xx x x  x
    ( C:'N'; B:[         B6,     B4,             B0 ]; M:23 ),    // x x xx x  xx
    ( C:'O'; B:[ B8,     B6,                     B0 ]; M:24 ),    // xx x xx x  x
    ( C:'P'; B:[     B7, B6,                     B0 ]; M:25 ),    // x xx xx x  x
    ( C:'Q'; B:[             B5, B4,             B0 ]; M:26 ),    // x x x xx  xx
    ( C:'R'; B:[ B8,         B5,                 B0 ]; M:27 ),    // xx x x xx  x
    ( C:'S'; B:[     B7,     B5,                 B0 ]; M:28 ),    // x xx x xx  x
    ( C:'T'; B:[         B6, B5,                 B0 ]; M:29 ),    // x x xx xx  x
    ( C:'U'; B:[ B8,             B4, B3             ]; M:30 ),    // xx  x x x xx
    ( C:'V'; B:[     B7,         B4, B3             ]; M:31 ),    // x  xx x x xx
    ( C:'W'; B:[ B8, B7,             B3             ]; M:32 ),    // xx  xx x x x
    ( C:'X'; B:[         B6,     B4, B3             ]; M:33 ),    // x  x xx x xx
    ( C:'Y'; B:[ B8,     B6,         B3             ]; M:34 ),    // xx  x xx x x
    ( C:'Z'; B:[     B7, B6,         B3             ]; M:35 ),    // x  xx xx x x
    ( C:'-'; B:[             B5, B4, B3             ]; M:36 ),    // x  x x xx xx
    ( C:'.'; B:[ B8,         B5,     B3             ]; M:37 ),    // xx  x x xx x
    ( C:' '; B:[     B7,     B5,     B3             ]; M:38 ),    // x  xx x xx x
    ( C:'*'; B:[         B6, B5,     B3             ]; M:0  ),    // x  x xx xx x
    ( C:'$'; B:[                     B3, B2, B1     ]; M:39 ),    // x  x  x  x x
    ( C:'/'; B:[                     B3, B2,     B0 ]; M:40 ),    // x  x  x x  x
    ( C:'+'; B:[                     B3,     B1, B0 ]; M:41 ),    // x  x x  x  x
    ( C:'%'; B:[                         B2, B1, B0 ]; M:42 )     // x x  x  x  x
  );

var
  i : Integer;
  cp : Integer;
  bMatch : BitSet;
  found : Boolean;
  lenStr : Integer;
begin
  str := '';
  Result := FALSE;
  cp := 0;
  while cp < ( NUM_LEVELS + 4 ) do begin
    { Get matching value }
    bMatch := [];
    if blackLevels[ cp + 0 ] > 0 then bMatch := bMatch + [ B8 ];
    if blackLevels[ cp + 1 ] > 0 then bMatch := bMatch + [ B7 ];
    if blackLevels[ cp + 2 ] > 0 then bMatch := bMatch + [ B6 ];
    if blackLevels[ cp + 3 ] > 0 then bMatch := bMatch + [ B5 ];
    if blackLevels[ cp + 4 ] > 0 then bMatch := bMatch + [ B4 ];
    if whiteLevels[ cp + 0 ] > 0 then bMatch := bMatch + [ B3 ];
    if whiteLevels[ cp + 1 ] > 0 then bMatch := bMatch + [ B2 ];
    if whiteLevels[ cp + 2 ] > 0 then bMatch := bMatch + [ B1 ];
    if whiteLevels[ cp + 3 ] > 0 then bMatch := bMatch + [ B0 ];
    if bMatch = [] then break;
    { Search table for match }
    found := FALSE;
    for i := Low( CODE39TABLE ) to High( CODE39TABLE ) do begin
      if CODE39TABLE[i].B = bMatch then begin
        str := str + CODE39TABLE[i].C;
        found := TRUE;
        break;
      end;;
    end;
    if not found then Exit;
    Inc( cp, 5 );
  end;
  { Check results }
  lenStr := Length( str );
  if lenStr < 2 then Exit;
  if str[1] <> '*' then Exit;
  if str[ lenStr ] <> '*' then Exit;
  { Trim results }
  str := Copy( str, 2, lenStr - 2 );
  Result := TRUE;
end;

function EnReadBarcodeBW( const srcGraphic : TDibGraphic; lineRect : TRect; params : AnsiString; typeBarcode : TImageTypeBarcode; var strResults : array of TBarcodeStringResult ) : Boolean;
{******************************************************************************}
{ Returns TRUE if the barcode on the given "srcGraphic" within the given       }
{ "lineRect" of "typeBarcode" was correctly interpreted, otherwise FALSE.      }
{                                                                              }
{ If typeBarcode is itbUnknown then an automatic determination will be         }
{ attempted.                                                                   }
{                                                                              }
{ "strResults" contain the results.                                            }
{******************************************************************************}
const
  NUM_MATCH = 2;
  NUM_TRIALS = 3;
  THRESHOLD = 3.00;
var
  row : Integer;
  resNum : Integer;
  blackLevels : TLevelArray;
  whiteLevels : TLevelArray;
  trial : Integer;
  trialResults : array [ 1 .. NUM_TRIALS ] of TBarcodeStringResult;
  str : AnsiString;
  i : Integer;
  numMatch : Integer;
  numRight, numDown : Integer;
begin
  Result := FALSE;
  { Initialize results }
  for resNum := Low( strResults ) to High( strResults ) do begin
    with strResults[resNum] do begin
      BarcodeString := '';
      BarcodeType := itbUnknown;
    end;
  end;

  { Trim the given line }
  if not EnTextLineDetectionBW( srcGraphic, lineRect, THRESHOLD, 2.0 * THRESHOLD, lineRect, numRight, numDown ) then Exit;

  { Initialize trial }
  for resNum := Low( trialResults ) to High( trialResults ) do begin
    with trialResults[resNum] do begin
      BarcodeString := '';
      BarcodeType := itbUnknown;
    end;
  end;

  { Run some number of trials }
  for trial := 1 to NUM_TRIALS do begin
    { Fill raster array }
    row := lineRect.Top + ( trial * ( ( lineRect.Bottom - lineRect.Top ) div ( NUM_TRIALS + 1 ) ) );
    EnGetRasterCountsInRowBW( srcGraphic, row, lineRect.Left, lineRect.Right-1, blackLevels, whiteLevels );
    { Trim and Normalize }
    EnTrimRasterCounts( srcGraphic, blackLevels, whiteLevels );
    EnNormalizeRasterCounts( 2, blackLevels );
    EnNormalizeRasterCounts( 2, whiteLevels );
    { Decode }
    if EnReadBarCode39( blackLevels, whiteLevels, str ) then begin
      trialResults[ trial ].BarcodeString := str;
      trialResults[ trial ].BarcodeType := itbCode39;
    end;
  end;

  { Take best NUM_MATCH out of NUM_TRIALS in trials }
  for trial := 1 to NUM_TRIALS do begin
    if trialResults[ trial ].BarcodeType = itbUnknown then continue;
    numMatch := 0;
    for i := 1 to NUM_TRIALS do begin
      if  ( trialResults[ trial ].BarcodeString = trialResults[ i ].BarcodeString )
      and ( trialResults[ trial ].BarcodeType   = trialResults[ i ].BarcodeType ) then begin
        Inc( numMatch );
        if numMatch >= NUM_MATCH then begin
          strResults[0].BarcodeString := trialResults[ trial ].BarcodeString;
          strResults[0].BarcodeType   := trialResults[ trial ].BarcodeType;
          Result := TRUE;
          Exit;
        end;
      end;
    end;
  end;
end;

end.
