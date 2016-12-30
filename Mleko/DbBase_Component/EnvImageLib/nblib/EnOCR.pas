unit EnOCR;
{##############################################################################}
{ EnOCR - Provides general purpose OCR related library functions.              }
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
{          Dec 12, 2001. Nick Boland, add support for reading barcodes         }
{          Jan 22, 2002. Nick Boland, increase number of OCR rows              }
{                        Make OCR recursion much more efficient                }
{          Jan 27, 2002. Nick Boland, add support for many HCFA related fields }
{                        Add support for multiple attribute files              }
{          Feb 05, 2002. Nick Boland, fix situation where OCR determined that  }
{                        result was a single space character                   }
{          Mar 28, 2002. Nick Boland, add GNU Lessor General Public License    }
{##############################################################################}

interface

uses
  Classes, SysUtils, WinTypes, WinProcs, Dialogs, ExtCtrls, Graphics,
  EnDiGrph, EnMisc, EnProLib;

const
  OCR_GRID_HEIGHT = 9;
  OCR_GRID_WIDTH = 7;
  FONTID_MAXLEN = 3;

type
  TOCRCharAttr = record
    Letter : AnsiChar;
    FontID : array[0..FONTID_MAXLEN] of AnsiChar;
    TopGray : Byte;
    BotGray : Byte;
    WHRatio : Byte;
    Disjoint : Byte;
    GridGray : packed array [ 0 .. 63 ] of Byte;
  end;

  TOCRCharResult = record
    Letter : AnsiChar;
    FontID : array[0..FONTID_MAXLEN] of AnsiChar;
    ConfPct : Double;
  end;

  TOCRStringResult = record
    OCRString : AnsiString;
    ConfPct : Double;
  end;

  TOCRCharSet = set of AnsiChar;

  TImageTypeOCR = ( itoNone, itoCustom, itoNumber, itoAlpha, itoAlphaNumeric, itoMoney, itoDate, itoFirstName, itoMiddleName, itoLastName, itoName, itoTFML, itoAddress, itoCity, itoState, itoZipCode, itoCSZ, itoSSN, itoEMail,
                    itoBarcode, itoHcfaICD9, itoHcfaPOS, itoHcfaTOS, itoHcfaCPT, itoHcfaMod, itoHcfaDiag, itoHcfaUnits );

function  EnLoadOCRAttrFile( fileName : String; uncond : Boolean ) : Boolean;
function  EnGetOCRCharAttrBW( const srcGraphic : TDibGraphic; charRect : TRect; var charAttr : TOCRCharAttr ) : Boolean;
function  EnGetStringFromOCRCharAttr( var charAttr : TOCRCharAttr ) : AnsiString;
procedure EnGetImageFromOCRCharAttr( var charAttr : TOCRCharAttr; var image : TImage );
function  EnOCRCharBW( const srcGraphic : TDibGraphic; charRect : TRect; const charAttr : TOCRCharAttr; const charSet : TOCRCharSet; const fontID : AnsiString; var charResults : array of TOCRCharResult ) : Integer;
function  EnOCRLineBW( const srcGraphic : TDibGraphic; lineRect : TRect; params : AnsiString; typeOCR : TImageTypeOCR; charSet : TOCRCharSet; pictureMask : AnsiString; var strResults : array of TOCRStringResult ) : Boolean;
function  EnOCRCharSet( typeOCR : TImageTypeOCR ) : TOCRCharSet;
function  EnOCRPictureMask( typeOCR : TImageTypeOCR ) : AnsiString;
function  EnOCRClean( const params : AnsiString; typeOCR : TImageTypeOCR; charSet : TOCRCharSet; pictureMask : AnsiString; var strResults : TOCRStringResult ) : Boolean;

var
  AttrFileName : AnsiString;
  AttrArray : array of TOCRCharAttr;

implementation

function EnLoadOCRAttrFile( fileName : String; uncond : Boolean ) : Boolean;
{******************************************************************************}
{ Returns TRUE if the given OCR attribute file was loaded, otherwise FALSE.    }
{ If "uncond" is TRUE then the attribute file is always loaded, otherwise      }
{ it will only be loaded if it has not already been loaded or is different.    }
{******************************************************************************}

  function NumLinesInFile( fileName : String ) : Integer;
  {******************************************************************************}
  { Returns the number of lines in the given file.                               }
  {******************************************************************************}
  var
    F : TextFile;
  begin
    Result := 0;
    if not FileExists( fileName ) then Exit;
    AssignFile( F, fileName );
    Reset( F );
    try
      while not EOF( F ) do begin
        ReadLn( F );
        Inc( Result );
      end;
    finally CloseFile( F ); end;
  end;

  function LoadAttributeFile( fileName : AnsiString; index : Integer ) : Boolean;
  {******************************************************************************}
  { Returns TRUE if attribute file was loaded, otherwise FALSE. It loads         }
  { the given attribute file into "AttrArray" beginning at the given             }
  { "index" position.                                                            }
  {******************************************************************************}
  var
    j : Integer;
    F : TextFile;
    line : AnsiString;
  begin
    Result := FALSE;
    if not FileExists( fileName ) then Exit;
    AssignFile( F, fileName );
    Reset( F );
    try
      while not EOF( F ) do begin
        ReadLn( F, line );
        if Length( line ) < 140 then Exit;
        AttrArray[index].Letter := line[1];
        if line[2] <> ',' then Exit;
        line := Copy( line, 3, Length( line ) );
        StrLCopy( @AttrArray[index].FontID[0], PChar( @EnStrGetNextToken( line, ',' )[1] ), FONTID_MAXLEN );
        AttrArray[index].TopGray := StrToInt( EnStrGetNextToken( line, ',' ) );
        AttrArray[index].BotGray := StrToInt( EnStrGetNextToken( line, ',' ) );
        AttrArray[index].WHRatio := StrToInt( EnStrGetNextToken( line, ',' ) );
        AttrArray[index].Disjoint := StrToInt( EnStrGetNextToken( line, ',' ) );
        for j := 0 to 62 do AttrArray[index].GridGray[j] := StrToInt( EnStrGetNextToken( line, ',' ) );
        Inc( index );
      end;
    finally CloseFile( F ); end;
    Result := TRUE;
  end;

var
  numLines1, numLines2 : Integer;
  fileName2 : AnsiString;
begin
  Result := TRUE;

  { MB Dec 04, 2002 Replace AnsiSameText for Delphi 4 compatibility }
  if ( not uncond ) and ( AttrFileName <> '' ) and
     (AnsiCompareText( fileName, AttrFileName ) = 0) then
      Exit;

  AttrFileName := AnsiString(fileName);

  fileName2 := AnsiString(ChangeFileExt( fileName, '2' + ExtractFileExt( fileName ) ));

  { Count number of entries in attribute file }
  numLines1 := NumLinesInFile( fileName );
  numLines2 := NumLinesInFile( fileName2 );

  { Allocate attribute array }
  SetLength( AttrArray, numLines1 + numLines2 );

  { Load attribute file }
  Result := LoadAttributeFile( AnsiString(fileName), 0 )
         or LoadAttributeFile( fileName2, numLines1 );
end;

function EnGetOCRCharAttrBW( const srcGraphic : TDibGraphic; charRect : TRect; var charAttr : TOCRCharAttr ) : Boolean;
{******************************************************************************}
{ Returns TRUE if the "charAttr" value was returned, otherwise FALSE.          }
{                                                                              }
{ The character is divided into a 7 x 9 grid with each position represented    }
{ by a percent gray scale value from 0 (white) to 255 (black).                 }
{                                                                              }
{ There are other properties.  Percent gray across the top; percent gray       }
{ across the bottom; the width to height ratio where 30 is thin, 128 is        }
{ square, 200 is wide; and a vertically disjoint character property like       }
{ "i" or "j".                                                                  }
{******************************************************************************}
var
  x, y : Integer;
  prcnt : Integer;
  gridNum : Integer;
  colWidth : Integer;
  rowHeight : Integer;
  numBlack : Integer;
begin
  Result  := FALSE;
  { See if conditions are good }
  if srcGraphic.ImageFormat <> ifBlackWhite then Exit;

  charAttr.Letter := Chr(0);
  charAttr.FontID := '';

  colWidth  := charRect.Right  - charRect.Left;
  rowHeight := charRect.Bottom - charRect.Top;

  { If character is very skinny then move left side out some and don't trim tops }
  if ( rowHeight / colWidth ) > 3.0 then begin
    while charRect.Left > ( charRect.Right - ( rowHeight div 2 ) ) do begin
      if charRect.Left < 1 then break;
      Dec( charRect.Left );
      numBlack := EnNumBlackPixelsInColBW( srcGraphic, charRect.Left, charRect.Top, charRect.Bottom-1 );
      if numBlack > 2 then break;
    end;
    colWidth  := charRect.Right  - charRect.Left;

  { See if top and bottom can be trimmed.  This is done by working up or down    }
  { and skipping lines that are blank within the constraints of a typical        }
  { character ratio of 1.5                                                       }
  end else begin
    while charRect.Bottom > ( charRect.Top + Trunc( 1.50 * colWidth ) ) do begin
      numBlack := EnNumBlackPixelsInRowBW( srcGraphic, charRect.Bottom-1, charRect.Left, charRect.Right-1 );
      if numBlack > 1 then break;
      Dec( charRect.Bottom );
    end;
    while charRect.Top < ( charRect.Bottom - Trunc( 1.50 * colWidth ) ) do begin
      numBlack := EnNumBlackPixelsInRowBW( srcGraphic, charRect.Top, charRect.Left, charRect.Right-1 );
      if numBlack > 1 then break;
      Inc( charRect.Top );
    end;
    rowHeight := charRect.Bottom - charRect.Top;
  end;

  prcnt := EnPercentBlackPixelsBW( srcGraphic, Rect( charRect.Left, charRect.Top, charRect.Right, charRect.Top + ( rowHeight div 2 ) ) );
  charAttr.TopGray := ( prcnt * 255 ) div 10000;

  prcnt := EnPercentBlackPixelsBW( srcGraphic, Rect( charRect.Left, charRect.Top  + ( rowHeight div 2 ), charRect.Right, charRect.Bottom ) );
  charAttr.BotGray := ( prcnt * 255 ) div 10000;

  prcnt := ( colWidth * 128 ) div rowHeight;
  if prcnt > 255 then prcnt := 255;
  charAttr.WHRatio := prcnt;

  charAttr.Disjoint := 0;

  gridNum := 0;
  for y := 1 to OCR_GRID_HEIGHT do begin
    for x := 1 to OCR_GRID_WIDTH do begin
      prcnt := EnPercentBlackPixelsBW( srcGraphic,
                Rect( charRect.Left + ( ( colWidth  * (x-1) ) div OCR_GRID_WIDTH ),
                      charRect.Top  + ( ( rowHeight * (y-1) ) div OCR_GRID_HEIGHT ),
                      charRect.Left + ( ( colWidth  * x ) div OCR_GRID_WIDTH ),
                      charRect.Top  + ( ( rowHeight * y ) div OCR_GRID_HEIGHT ) ) );
      charAttr.GridGray[ gridNum ] := ( prcnt * 255 ) div 10000;
      Inc( gridNum );
    end;
  end;

  Result  := TRUE;
end;

function EnGetStringFromOCRCharAttr( var charAttr : TOCRCharAttr ) : AnsiString;
{******************************************************************************}
{ Returns a string representation of the charAttr value.  This is a grid that  }
{ may be displayed as text.                                                    }
{                                                                              }
{   XXXXXXX   XXXXXX     XXXX                                                  }
{   XXXXXXX   X     X   X    X                                                 }
{   XXXXXXX   X     X         X                                                }
{   XXXXXXX   X     X        X                                                 }
{   XXXXXXX   XXXXXX       XX                                                  }
{   XXXXXXX   X     X     X                                                    }
{   XXXXXXX   X     X    X                                                     }
{   XXXXXXX   X     X   X                                                      }
{   XXXXXXX   XXXXXX    XXXXXXX                                                }
{                                                                              }
{******************************************************************************}
var
  x, y : Integer;
  gridNum : Integer;
  prcnt : Integer;
begin
  Result := '';
  gridNum := 0;
  for y := 1 to OCR_GRID_HEIGHT do begin
    for x := 1 to OCR_GRID_WIDTH do begin
      prcnt := 10000 * charAttr.GridGray[ gridNum ] div 255;
      if prcnt >= 7500 then begin
        Result := Result + 'X';
      end else if prcnt >= 5000 then begin
        Result := Result + '+';
      end else if prcnt >= 2500 then begin
        Result := Result + '.';
      end else begin
        Result := Result + ' ';
      end;
      Inc( gridNum );
    end;
    Result := Result + #13#10;
  end;
end;

procedure EnGetImageFromOCRCharAttr( var charAttr : TOCRCharAttr; var image : TImage );
{******************************************************************************}
{ Returns a graphic representation of the charAttr value.                      }
{******************************************************************************}
var
  x, y : Integer;
  gridNum : Integer;
  gray : Byte;
begin
  gridNum := 0;
  for y := 0 to OCR_GRID_HEIGHT - 1 do begin
    for x := 0 to OCR_GRID_WIDTH - 1 do begin
      gray := 255 - charAttr.GridGray[ gridNum ];
      image.Canvas.Brush.Color := RGB( gray, gray, gray );
      image.Canvas.Brush.Style := bsSolid;
      image.Canvas.Rectangle( x     * ( image.width  div OCR_GRID_WIDTH ),
                              y     * ( image.height div OCR_GRID_HEIGHT ),
                              (x+1) * ( image.width  div OCR_GRID_WIDTH ),
                              (y+1) * ( image.height div OCR_GRID_HEIGHT ) );
      Inc( gridNum );
    end;
  end;
end;

function EnOCRCharBW( const srcGraphic : TDibGraphic; charRect : TRect; const charAttr : TOCRCharAttr; const charSet : TOCRCharSet; const fontID : AnsiString; var charResults : array of TOCRCharResult ) : Integer;
{******************************************************************************}
{ Returns the number of characters that matched after finding the closest      }
{ match in the list of possible choices.                                       }
{                                                                              }
{ The algorithm uses the least-squares method of matching "charAttr" to        }
{ all the characters available.                                                }
{                                                                              }
{ The "elbows" have been determined Empirically.                               }
{******************************************************************************}

const
  ELBOW_99  = 0.20;     // If distance is within 20% of maximum then consider that 99% accurate
  ELBOW_98  = 0.25;     // If distance is within 25% of maximum then consider that 98% accurate
  ELBOW_ERR = 0.35;     // If distance is greater than 35% of maximum then consider that an error

  MAX_DISTANCE  = ( 2 + 2 + 6 + 6 + 63 ) * ( 255 * 255 );
  MAX_ELBOW_99  = TRUNC( ELBOW_99  * ELBOW_99  * MAX_DISTANCE );
  MAX_ELBOW_98  = TRUNC( ELBOW_98  * ELBOW_98  * MAX_DISTANCE );
  MAX_ELBOW_ERR = TRUNC( ELBOW_ERR * ELBOW_ERR * MAX_DISTANCE );

var
  i, j, k : Integer;
  dif : LongInt;
  distance : LongInt;
  conf : Double;
  insertPos : Integer;
  nilResult : TOCRCharResult;
  newResult : TOCRCharResult;
//str : AnsiString;
//F : TextFile;

begin
  { Initialize results }
  nilResult.Letter := Chr(0);
  nilResult.FontID := '';
  nilResult.ConfPct := 0.0;

  for j := Low( charResults ) to High( charResults ) do begin
    charResults[j] := nilResult;
  end;

  { Search array }
  for i := Low( AttrArray ) to High( AttrArray ) do begin

    { See if this letter is even possible }
    if ( AttrArray[i].Letter in charSet )
    and ( ( fontID = '' ) or ( AttrArray[i].FontID = fontID ) ) then begin

      { Calculate confidence level }
      distance := 0;
      dif := charAttr.TopGray - AttrArray[i].TopGray;
      distance := distance + ( 2 * ( dif * dif ) );
      dif := charAttr.BotGray - AttrArray[i].BotGray;
      distance := distance + ( 2 * ( dif * dif ) );
      dif := charAttr.WHRatio - AttrArray[i].WHRatio;
      distance := distance + ( 6 * ( dif * dif ) );
      dif := charAttr.Disjoint - AttrArray[i].Disjoint;
      distance := distance + ( 6 * ( dif * dif ) );
      for j := 0 to 62 do begin
        dif := charAttr.GridGray[j] - AttrArray[i].GridGray[j];
        distance := distance + ( dif * dif );
      end;

      if distance < MAX_ELBOW_99 then begin
        conf := 100.0 - ( 1.0 * Sqrt( ( distance ) / ( MAX_ELBOW_99 ) ) );                                   // 1 degree range
      end else if distance < MAX_ELBOW_98 then begin
        conf :=  99.0 - ( 1.0 * Sqrt( ( distance - MAX_ELBOW_99 ) / ( MAX_ELBOW_98 - MAX_ELBOW_99 ) ) );     // 1 degree range
      end else if distance < MAX_ELBOW_ERR then begin
        conf :=  98.0 - ( 5.0 * Sqrt( ( distance - MAX_ELBOW_98 ) / ( MAX_ELBOW_ERR - MAX_ELBOW_98 ) ) );    // 5 degree range
      end else begin
        conf := 0;
      end;

      //str := str + Format('%d, %s, %f', [ distance, AttrArray[i].Letter, conf ] ) + #13#10;

      { See if it should be put on the list }
      if conf > charResults[ High( charResults ) ].ConfPct then begin
        { Hold new result }
        newResult.Letter := AttrArray[i].Letter;
        StrLCopy( newResult.FontID, AttrArray[i].FontID, FONTID_MAXLEN );
        newResult.ConfPct := conf;
        { If same letter with lower priority is already in the list then substitute }
        for j := Low( charResults ) to High( charResults ) do begin
          if charResults[j].Letter = newResult.Letter then begin
            if charResults[j].ConfPct > newResult.ConfPct then newResult := charResults[j];
//          newResult.Confidence := ...   // Optional reprioritization
            charResults[j] := nilResult;
            for k := j to High( charResults ) - 1 do begin
              charResults[k] := charResults[k+1];
            end;
            break;
          end;
        end;
        { Find correct position to insert and shuffle at the same time }
        insertPos := 0;
        for j := High( charResults ) downto Low( charResults ) do begin
          if newResult.ConfPct > charResults[j].ConfPct then begin
            insertPos := j;
            if j < High( charResults ) then begin
              charResults[j+1] := charResults[j];
            end;
          end;
        end;
        charResults[ insertPos ] := newResult;
      end;
    end;
  end;

//AssignFile( F, ChangeFileExt( AttrFileName, 'z.csv' ) );
//Rewrite( F );
//Write( F, str );
//CloseFile( F );
//ShowMessage( str );

  { See how many entries were returned }
  Result := 0;
  for j := Low( charResults ) to High( charResults ) do begin
    if charResults[j].Letter <> Chr(0) then Inc( Result );
  end;
end;

function EnOCRLineBW( const srcGraphic : TDibGraphic; lineRect : TRect; Params : AnsiString; typeOCR : TImageTypeOCR; charSet : TOCRCharSet; pictureMask : AnsiString; var strResults : array of TOCRStringResult ) : Boolean;
{******************************************************************************}
{ Returns TRUE if OCR results were returned, otherwise FALSE.                  }
{                                                                              }
{ If "charSet" is specified then those are the only characters that will be    }
{ returned by the OCR function.  Otherwise, "typeOCR" is used to determine     }
{ the valid characters returned.                                               }
{                                                                              }
{ "Params" is a semicolon separated list with the following values:            }
{   CONF = Confidence value from 0.00 = lowest to 100.00 = perfect             }
{   MASK = Picture mask                                                        }
{                                                                              }
{ The given line is broken up into characters. If there is a gap in the        }
{ letters then it is counted as a single space.                                }
{******************************************************************************}
const
  NUMCOL = 256;
  NUMROW = 3;

var
  ocrPictureMask : AnsiString;
  confThreshold : Double;
  confFirstPass : array [ 0 .. NUMCOL-1 ] of Boolean;
  confRowKick : array [ 0 .. NUMCOL-1 ] of Integer;
  charResults : array [ 0 .. NUMCOL-1, 0 .. NUMROW-1 ] of TOCRCharResult;

  function Recurse( col : Integer; valueSoFar : TOCRStringResult ) : Boolean;
  {******************************************************************************}
  { Returns TRUE if the current combination was put on the list, otherwise       }
  { FALSE.  This is then used to help trim the list.                             }
  {                                                                              }
  { confFirstPass is used to determine if a first pass has been made on all      }
  { the letters in the column.                                                   }
  {                                                                              }
  { confRowKick is used to determine the highest row that EVER made it into      }
  { the list.  If the row makes it into the list during the first pass then      }
  { it MIGHT make the list again, otherwise there will NEVER be enough room      }
  { in the list because all other combinations following it will have a          }
  { lower confidence level.                                                      }
  {******************************************************************************}
  var
    c : AnsiChar;
    conf : Double;
    row : Integer;
    resNum : Integer;
    insertPos : Integer;
    valueNow : TOCRStringResult;
    errPos : Integer;
    madeList : Boolean;
  begin
    Result := FALSE;
    for row := 0 to NUMROW-1 do begin
      c := charResults[col,row].Letter;
      conf := charResults[col,row].ConfPct;
      if c = Chr(0) then break;
      if ( row <> 0 ) and ( conf < confThreshold ) then break;
      valueNow.OCRString := valueSoFar.OCRString + c;
      valueNow.ConfPct := valueSoFar.ConfPct;
      { See if it fits the mask }
      if EnPicture( ocrPictureMask, valueNow.OCRString, FALSE, errPos ) = prError then continue;
//    { Confidence is only as good as the weakest letter }
//    if valueNow.ConfPct < 1.0 then valueNow.ConfPct := conf
//    else if valueNow.ConfPct > conf then valueNow.ConfPct := conf;
      { COnfidence is the average of the string }
      valueNow.ConfPct := ( ( valueSoFar.ConfPct * Length( valueSoFar.OCRString ) ) + conf ) / Length( valueNow.OCRString );

      { Do recursion if there are more letters }
      if ( (col+1) < (NUMCOL-1) )
      and ( charResults[col+1,0].Letter <> Chr(0) ) then begin
        { Check if first pass or if row ever made the list }
        if confFirstPass[ col ] or ( row <= confRowKick[ col ] ) then begin
          madeList := Recurse( col+1, valueNow );
          if madeList then begin
            if row > confRowKick[ col ] then confRowKick[ col ] := row;
          end;
        end;

      { If it makes the list then find correct position to insert and shuffle at the same time }
      end else if valueNow.ConfPct > strResults[ High( strResults ) ].ConfPct then begin
        Result := TRUE;
        { Insert into list }
        insertPos := 0;
        for resNum := High( strResults ) downto Low( strResults ) do begin
          if valueNow.ConfPct > strResults[resNum].ConfPct then begin
            insertPos := resNum;
            if resNum < High( strResults ) then begin
              strResults[resNum+1] := strResults[resNum];
            end;
          end;
        end;
        strResults[ insertPos ] := valueNow;
//      ShowMessage( Format( '%s  %f', [ valueNow.OCRString, valueNow.ConfPct ] ) );

      { Otherwise it will only get worst on the following letters }
      end else begin
        break;
      end;
    end;

    confFirstPass[ col ] := FALSE;
  end;

const
  THRESHOLD = 3.00;
  DEFAULT_CONFIDENCE = 99.00;
var
  numRight, numDown : Integer;
  nextCharColumn : Integer;
  charRect : TRect;
  charAttr : TOCRCharAttr;
  numFound : Integer;
  colNum : Integer;
  resNum : Integer;
  curPos : Integer;
  valueSoFar : TOCRStringResult;
  lastCharWasSpace : Boolean;

begin
  Result := FALSE;

  { Initialize parameters }
  confThreshold := EnStrToFloatDef( EnStrGetValue( Params, 'CONF', ';', '=', '' ), DEFAULT_CONFIDENCE );
  if pictureMask = '' then begin
    pictureMask := EnStrGetValue( Params, 'MASK', ';', '=', '' );
  end;

  { Initialize results }
  for resNum := Low( strResults ) to High( strResults ) do begin
    with strResults[resNum] do begin
      OCRString := '';
      ConfPct := 0.0;
    end;
  end;

  FillChar( charResults, SizeOf( charResults ), 0 );

  { Determine CharSet based on TypeOCR }
  if charSet = [] then charSet := EnOCRCharSet( typeOCR );
  { Determine picture mask based on TypeOCR }
  ocrPictureMask := EnOCRPictureMask( typeOCR );
  if ocrPictureMask = '' then ocrPictureMask := pictureMask;

  { Trim the given line }
  if not EnTextLineDetectionBW( srcGraphic, lineRect, THRESHOLD, 2.0 * THRESHOLD, lineRect, numRight, numDown ) then Exit;

  { Break into Characters and get results }
  colNum := 0;
  nextCharColumn := 0;
  lastCharWasSpace := TRUE;
  while nextCharColumn < (lineRect.Right-1) do begin
    if EnTextCharDetectionBW( srcGraphic, lineRect, THRESHOLD, 2.0 * THRESHOLD, charRect, nextCharColumn ) then begin
      EnGetOCRCharAttrBW( srcGraphic, charRect, charAttr );
      numFound := EnOCRCharBW( srcGraphic, charRect, charAttr, charSet, '', charResults[ colNum ] );
      lastCharWasSpace := FALSE;
    end else begin
      numFound := 0;
      if not lastCharWasSpace then begin
        with charResults[ colNum, 0 ] do begin
          Letter := ' ';
          FontID := '';
          ConfPct := 100.0;
        end;
        numFound := 1;
      end;
      lastCharWasSpace := TRUE;
    end;
    if numFound > 0 then Inc( colNum );
  end;

  valueSoFar.OCRString := '';
  valueSoFar.ConfPct := 0.0;
  for colNum := Low( confRowKick ) to High( confRowKick ) do begin
    confFirstPass[ colNum ] := TRUE;
    confRowKick[ colNum ] := 0;
  end;
  Recurse( 0, valueSoFar );

  { Delete from list any results that do not clean up or fail confidence level }
  curPos := Low( strResults );
  for resNum := Low( strResults ) to High( strResults ) do begin
    if EnOCRClean( Params, typeOCR, charSet, pictureMask, strResults[resNum] )
    and ( strResults[resNum].ConfPct >= confThreshold ) then begin
      if curPos <> resNum then strResults[curPos] := strResults[resNum];
      Inc( curPos );
    end else if curPos <> resNum then begin
      strResults[curPos] := strResults[resNum];
    end;
  end;

  { Indicate if any results will be returned }
  if curPos <> 0 then Result := TRUE;

  { Remove any entries at the end }
  for resNum := curPos to High( strResults ) do begin
    strResults[resNum].OCRString := '';
    strResults[resNum].ConfPct := 0.0;
  end;
end;

function EnOCRCharSet( typeOCR : TImageTypeOCR ) : TOCRCharSet;
{******************************************************************************}
{ Returns the charset associated with the given "typeOCR".                     }
{******************************************************************************}
begin
  case typeOCR of
  itoNone :         Result := [ ];
  itoCustom :       Result := [ ];
  itoNumber :       Result := [ '0'..'9', '.', '-' ];
  itoAlpha :        Result := [ 'A'..'Z', '.', '-' ];
  itoAlphaNumeric : Result := [ '0'..'9', 'A'..'Z', '.', '-' ];
  itoMoney :        Result := [ '0'..'9', '$', '.' ];
  itoDate :         Result := [ '0'..'9', '-', '/', '.' ];
  itoFirstName :    Result := [ 'A'..'Z', '-', '/' ];
  itoMiddleName :   Result := [ 'A'..'Z', '-', '/' ];
  itoLastName :     Result := [ 'A'..'Z', '-', '/' ];
  itoName :         Result := [ 'A'..'Z', '-', '/', ',', '.' ];
  itoTFML :         Result := [ 'A'..'Z', '-', '/', ',' ];
  itoAddress :      Result := [ '0'..'9', 'A'..'Z', '-', '/', '.' ];
  itoCity :         Result := [ 'A'..'Z', '-' ];
  itoState :        Result := [ 'A'..'Z' ];
  itoZipCode :      Result := [ '0'..'9', '-' ];
  itoCSZ :          Result := [ '0'..'9', 'A'..'Z', '-', '/', '.' ];
  itoSSN :          Result := [ '0'..'9', '-' ];
  itoEMail :        Result := [ '0'..'9', '@', '-', '/', '.', '_' ];
  itoHcfaICD9 :     Result := [ '0'..'9', 'E', 'P', 'V', '.', '-' ];
  itoHcfaPOS :      Result := [ '0'..'9', 'A', 'Z' ];
  itoHcfaTOS :      Result := [ '0'..'9', 'A', 'Z' ];
  itoHcfaCPT :      Result := [ '0'..'9', 'A'..'Z' ];
  itoHcfaMod :      Result := [ '0'..'9', 'A'..'Z' ];
  itoHcfaDiag :     Result := [ '1', '2', '3', '4', '-', '.' ]; 
  itoHcfaUnits :    Result := [ '0'..'9' ];
  else              Result := [ ];
  end;
end;

function EnOCRPictureMask( typeOCR : TImageTypeOCR ) : AnsiString;
{******************************************************************************}
{ Returns the picture mask associated with the given "typeOCR".                }
{ These values should be flexable to pass poorly formatted values.             }
{******************************************************************************}
begin
  case typeOCR of
  itoNone :         Result := '';
  itoCustom :       Result := '';
  itoNumber :       Result := '';
  itoAlpha :        Result := '';
  itoAlphaNumeric : Result := '';
  itoMoney :        Result := '[$]#*#[.##][ *@]';
  itoDate :         Result := '#[#]{-#[#]-,.#[#].,/#[#]/,#[#]}##[##]';
  itoFirstName :    Result := '';
  itoMiddleName :   Result := '';
  itoLastName :     Result := '';
  itoName :         Result := '';
  itoTFML :         Result := '';
  itoAddress :      Result := '';
  itoCity :         Result := '';
  itoState :        Result := '';
  itoZipCode :      Result := '';
  itoCSZ :          Result := '';
  itoSSN :          Result := '';
  itoEMail :        Result := '';
  itoHcfaICD9 :     Result := '{#,&}##[ ,-,.][#][#][ *@]';
  itoHcfaPOS :      Result := '{#,&}[#,&][ *@]';
  itoHcfaTOS :      Result := '{#,&}[#,&][ *@]';
  itoHcfaCPT :      Result := '{#,&}{#,&}*4[#,&][ *@]';
  itoHcfaMod :      Result := '{#,&}{#,&}[{#,&}{#,&}][{#,&}{#,&}][{#,&}{#,&}][ *@]';
  itoHcfaDiag :     Result := '[ ][1,2,3,4][-,.][1,2,3,4][-,.][1,2,3,4][-,.][1,2,3,4][ *@]';
  itoHcfaUnits :    Result := '#[#][#][#][ *@]';
  else              Result := '';
  end;
end;

function EnOCRClean( const Params : AnsiString; typeOCR : TImageTypeOCR; charSet : TOCRCharSet; pictureMask : AnsiString; var strResults : TOCRStringResult ) : Boolean;
{******************************************************************************}
{ Returns TRUE if OCR results were cleaned ok, otherwise FALSE.                }
{                                                                              }
{ The result is formatted to fit "typeOCR" and to pass "pictureMask".          }
{******************************************************************************}

  procedure TruncateExtraChars( var str : AnsiString );
  var
    i, len : Integer;
  begin
    len := Length( str );
    for i := 1 to len do begin
      if str[i] = ' ' then begin
        Delete( str, i, len - i + 1 );
        break;
      end;
    end;
  end;

var
  str : AnsiString;
  conf : Double;
  i : Integer;
  year : Integer;
  errPos : Integer;
  len : Integer;
begin
  Result := FALSE;
  str := strResults.OCRString;
  conf := strResults.ConfPct;
  strResults.ConfPct := 0;
  try

    { DATE }
    if typeOCR = itoDate then begin
      str := AnsiString(Trim( EnStrReplace( str, '  ', ' ' ) ));                // Remove extra spaces
      if Length( str ) < 6 then Exit;                               // m/d/yy is smallest date
      if Pos( str, '~' ) > 0 then Exit;                             // No bad characters
      if not EnIsDigit( str[1] ) then Exit;                         // Must always start with digit
      if not EnIsDigit( str[2] ) then str := '0' + str;             // m/ -> 0m/
      if not EnIsDigit( str[3] ) then str[3] := '/';                // mm dd -> mm/dd
      if not EnIsDigit( str[4] ) then Exit;                         // mm/? or mmd?
      if not EnIsDigit( str[5] ) then Insert('0', str, 4 );         // mm/d/ -> mm/0d/
      if not EnIsDigit( str[6] ) then str[6] := '/';                // mm/dd yy -> mm/dd/yy
      { mmddyy -> mm/dd/yy }
      if Length( str ) = 6 then begin
        if EnIsDigit( str[3] ) and EnIsDigit( str[5] ) then begin
          Insert( '/', str, 5 );
          Insert( '/', str, 3 );
        end;
      end;
      { mm/dd/yy -> mm/dd/yyyy }
      { mmddyyyy -> mm/dd/yyyy }
      if Length( str ) = 8 then begin
        if EnIsDigit( str[3] ) and EnIsDigit( str[5] ) then begin
          Insert( '/', str, 5 );
          Insert( '/', str, 3 );
        end else begin
          year := StrToIntDef( Copy( str, 7, 2 ), 0 );
          if year < 10 then year := 2000 + year else year := 1900 + year;
          str := AnsiString(Copy( str, 1, 6 ) + Format( '%4.4d', [ year ] ));
        end;
      end;
      { See if the year is on the front }
      str := AnsiString(Trim( EnStrReplace( str, '/', '' ) ));
      year := StrToIntDef( Copy( str, 1, 4 ), 0 );
      if ( year >= 1900 ) and ( year < 2100 ) then begin
        str := Copy( str, 5, 4 ) + Copy( str, 1, 4 );
      end;
      { Final checking }
      if Length( str ) <> 8 then Exit;
      for i := 1 to Length( str ) do begin
        if not EnIsDigit( str[i] ) then Exit;
      end;
      { Final formatting }
      str := Copy( str, 1, 2 ) + '/' + Copy( str, 3, 2 ) + '/' + Copy( str, 5, 4 );
      { Valid date }
      try EncodeDate( StrToIntDef( Copy( str, 7, 4 ), 0 ), StrToIntDef( Copy( str, 1, 2 ), 0 ), StrToIntDef( Copy( str, 4, 2 ), 0 ) );
      except Exit; end;
    end;

    { MONEY }
    if typeOCR = itoMoney then begin
      str := AnsiString(Trim( EnStrReplace( str, '  ', ' ' ) ));                // Remove extra spaces
      str := EnStrReplace( str, '$', '' );                          // Remove dollar signs
      { See if units were picked up }
      len := Length( str );
      if ( len >= 2 ) and ( str[len-1] = ' ' ) and ( str[len] <> '' ) then begin
        Delete( str, len-1, 2 );
      end;
      { Convert decimal }
      len := Length( str );
      if ( len >= 3 ) and ( str[len-2] = ' ' ) then str[len-2] := '.';
      { Add decimal }
      i := Pos( '.', str );
      if i = 0 then Insert( '.', str, len - 1 );
      { Check decimal }
      if Pos( '.', str ) <> ( Length( str ) - 2 ) then Exit;
      { Final checking }
      for i := 1 to Length( str ) do begin
        if ( not EnIsDigit( str[i] ) ) and ( str[i] <> '.' ) then Exit;
      end;
    end;

    { ICD9 codes }
    if typeOCR = itoHcfaICD9 then begin
      { Make sure fourth character is decimal }
      len := Length( str );
      if len = 3 then str := str + '.';
      if len >= 4 then begin
        if EnIsDigit( str[4] ) then Insert( '.', str, 4 )
        else str[4] := '.';
      end;
      { Truncate any extra characters }
      TruncateExtraChars( str );
    end;

    { Diagnostic codes }
    if typeOCR = itoHcfaDiag then begin
      str := AnsiString(Trim( EnStrReplace( str, '-', '' ) ));    // Remove any separators
      str := AnsiString(Trim( EnStrReplace( str, '.', '' ) ));
      TruncateExtraChars( str );                      // Truncate any extra characters
    end;

    { Lots of other codes }
    if typeOCR in [ itoHcfaPOS, itoHcfaTOS, itoHcfaCPT, itoHcfaMod, itoHcfaUnits ] then begin
      TruncateExtraChars( str );
    end;

  finally
    strResults.OCRString := str;
  end;

  { Restore }
  strResults.ConfPct := conf;

  { See if it fits the mask }
  if EnPicture( pictureMask, strResults.OCRString, FALSE, errPos ) in [ prIncomplete, prError ] then Exit;

  Result := TRUE;
end;

end.
