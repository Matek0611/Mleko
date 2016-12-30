
//////////////////////////////////////////////////
//  SQL Server Data Access Components
//  Copyright © 1998-2007 Core Lab. All right reserved.
//  MS Parser
//////////////////////////////////////////////////

{$IFNDEF CLR}

{$I Sdac.inc}

unit MSParser;
{$ENDIF}

interface
uses
  CRParser;

const
  lxALTER    = 7 {MSSymbolCount} + 1;
  lxAND      = lxALTER;
  lxAS       = lxAND + 1;
  lxBEGIN    = lxAS + 1;
  lxBY       = lxBEGIN + 1;
  lxCOMPUTE  = lxBY + 1;
  lxCREATE   = lxCOMPUTE + 1;
  lxCROSS    = lxCREATE + 1;
  lxDECLARE  = lxCROSS + 1;
  lxDEFAULT  = lxDECLARE + 1;
  lxDELETE   = lxDEFAULT + 1;
  lxEND      = lxDELETE + 1;
  lxFOR      = lxEND + 1;
  lxFROM     = lxFOR + 1;
  lxFULL     = lxFROM + 1;
  lxFUNCTION = lxFULL + 1;
  lxGO       = lxFUNCTION + 1;
  lxGROUP    = lxGO + 1;
  lxHAVING   = lxGROUP + 1;
  lxINNER    = lxHAVING + 1;
  lxINSERT   = lxINNER + 1;
  lxINTO     = lxINSERT + 1;
  lxIS       = lxINTO + 1;
  lxJOIN     = lxIS + 1;
  lxLEFT     = lxJOIN + 1;
  lxOPTION   = lxLEFT + 1;
  lxOR       = lxOPTION + 1;
  lxORDER    = lxOR + 1;
  lxOUTER    = lxORDER + 1;
  lxPROCEDURE = lxOUTER + 1;
  lxREPLACE  = lxPROCEDURE + 1;
  lxRIGHT    = lxREPLACE + 1;
  lxRULE     = lxRIGHT + 1;
  lxSELECT   = lxRULE + 1;
  lxTABLE    = lxSELECT + 1;
  lxTRIGGER  = lxTABLE + 1;
  lxUPDATE   = lxTRIGGER + 1;
  lxUNION    = lxUPDATE + 1;
  lxVIEW     = lxUNION + 1;
  lxWHERE    = lxVIEW + 1;
  lxWITH     = lxWHERE + 1;

type
  TMSParser = class (TParser)
  protected
    function IsAlpha(Ch: char): boolean; override;
    function IsStringQuote(Ch: char): boolean; override;
    function IsIdentQuote(Ch: char): boolean; override;
    function IsInlineComment(Pos: integer): boolean; override;
    procedure ToRightQuote(LeftQuote: Char); override; // Search right quote of quoted string value or quoted identifier

    procedure InitParser; override;
  public
    function IsSemicolon(Code: integer): boolean; override;
  end;

implementation

uses
  Classes, SysUtils;

var
  MSSymbolLexems, MSKeywordLexems: TStringList;

{ TMSParser }

procedure TMSParser.InitParser;
begin
  inherited;
(*
SELECT statement ::=
    < query_expression >
    [ ORDER BY { order_by_expression | column_position [ ASC | DESC ] }
        [ ,...n ]    ]
    [ COMPUTE
        { { AVG | COUNT | MAX | MIN | SUM } ( expression ) } [ ,...n ]
        [ BY expression [ ,...n ] ]
    ]
    [ FOR { BROWSE | XML { RAW | AUTO | EXPLICIT }
            [ , XMLDATA ]
            [ , ELEMENTS ]
            [ , BINARY base64 ]
        }
]
    [ OPTION ( < query_hint > [ ,...n ]) ]

< query expression > ::=
    { < query specification > | ( < query expression > ) }
    [ UNION [ ALL ] < query specification | ( < query expression > ) [...n ] ]

< query specification > ::=
    SELECT [ ALL | DISTINCT ]
        [ { TOP integer | TOP integer PERCENT } [ WITH TIES ] ]
        < select_list >
    [ INTO new_table ]
    [ FROM { < table_source > } [ ,...n ] ]
    [ WHERE < search_condition > ]
    [ GROUP BY [ ALL ] group_by_expression [ ,...n ]
        [ WITH { CUBE | ROLLUP } ]
    ]
    [ HAVING < search_condition > ]

*)

  SetLength(FClauses, 7);
  FClauses[0] := lxWHERE;
  FClauses[1] := lxGROUP;
  FClauses[2] := lxHAVING;
  FClauses[3] := lxORDER;
  FClauses[4] := lxCOMPUTE;
  FClauses[5] := lxFOR;
  FClauses[6] := lxOPTION;

  FSymbolLexems := MSSymbolLexems;
  FKeywordLexems := MSKeywordLexems;

  CommentBegin := '/*';
  CommentEnd := '*/';

  DecSeparator := '.'; // To avoid 'INSERT INTO t(f1, f2) VALUES(:1,2)' 
end;

function TMSParser.IsAlpha(Ch: char): boolean;
begin
  Result := inherited IsAlpha(Ch) or (Ch = '$') or (Ch = '#');
end;

function TMSParser.IsStringQuote(Ch: char): boolean;
begin
  Result := Ch = '''';
end;

function TMSParser.IsIdentQuote(Ch: char): boolean;
begin
  case Ch of
    '"', '[', ']':
      Result := True;
    else
      Result := False;
  end;
end;

function TMSParser.IsInlineComment(Pos: integer): boolean;
begin
  // cr 7788 Result := (TextLength >= Pos + 3) and (Text[Pos] = '-') and (Text[Pos + 1] = '-') and (Text[Pos + 2] = ' ');
  Result := (TextLength >= Pos + 2) and (Text[Pos] = '-') and (Text[Pos + 1] = '-');
end;

procedure TMSParser.ToRightQuote(LeftQuote: Char);
begin
  if LeftQuote = '[' then
    inherited ToRightQuote(']')
  else
    inherited;
end;

function TMSParser.IsSemicolon(Code: integer): boolean;
begin
  Result := Code = 7; {';'}
end;

initialization
  MSSymbolLexems := TStringList.Create;
  MSKeywordLexems := TStringList.Create;

  MSSymbolLexems.AddObject('*', TObject(Integer(1)));
  MSSymbolLexems.AddObject('=', TObject(Integer(2)));
  MSSymbolLexems.AddObject(':', TObject(Integer(3)));
  MSSymbolLexems.AddObject(',', TObject(Integer(4)));
  MSSymbolLexems.AddObject('.', TObject(Integer(5)));
  MSSymbolLexems.AddObject('/', TObject(Integer(6)));
  MSSymbolLexems.AddObject(';', TObject(Integer(7)));
  MSSymbolLexems.CustomSort(CRCmpStrings);

  MSKeywordLexems.AddObject('SELECT', TObject(Integer(lxSELECT)));            
  MSKeywordLexems.AddObject('FROM', TObject(Integer(lxFROM)));                
  MSKeywordLexems.AddObject('WHERE', TObject(Integer(lxWHERE)));              
  MSKeywordLexems.AddObject('ORDER', TObject(Integer(lxORDER)));              
  MSKeywordLexems.AddObject('BY', TObject(Integer(lxBY)));                    
  MSKeywordLexems.AddObject('GROUP', TObject(Integer(lxGROUP)));              
  MSKeywordLexems.AddObject('PROCEDURE', TObject(Integer(lxPROCEDURE)));      
  MSKeywordLexems.AddObject('IS', TObject(Integer(lxIS)));                    
  MSKeywordLexems.AddObject('AS', TObject(Integer(lxAS)));                    
  MSKeywordLexems.AddObject('AND', TObject(Integer(lxAND)));                  
  MSKeywordLexems.AddObject('OR', TObject(Integer(lxOR)));                    
  MSKeywordLexems.AddObject('CREATE', TObject(Integer(lxCREATE)));            
  MSKeywordLexems.AddObject('REPLACE', TObject(Integer(lxREPLACE)));          
  MSKeywordLexems.AddObject('INTO', TObject(Integer(lxINTO)));                
  MSKeywordLexems.AddObject('UPDATE', TObject(Integer(lxUPDATE)));            
  MSKeywordLexems.AddObject('DELETE', TObject(Integer(lxDELETE)));            
  MSKeywordLexems.AddObject('INSERT', TObject(Integer(lxINSERT)));            
  MSKeywordLexems.AddObject('COMPUTE', TObject(Integer(lxCOMPUTE)));          
  MSKeywordLexems.AddObject('CROSS', TObject(Integer(lxCROSS)));              
  MSKeywordLexems.AddObject('FOR', TObject(Integer(lxFOR)));                  
  MSKeywordLexems.AddObject('FULL', TObject(Integer(lxFULL)));                
  MSKeywordLexems.AddObject('HAVING', TObject(Integer(lxHAVING)));            
  MSKeywordLexems.AddObject('INNER', TObject(Integer(lxINNER)));              
  MSKeywordLexems.AddObject('JOIN', TObject(Integer(lxJOIN)));                
  MSKeywordLexems.AddObject('LEFT', TObject(Integer(lxLEFT)));                
  MSKeywordLexems.AddObject('OPTION', TObject(Integer(lxOPTION)));            
  MSKeywordLexems.AddObject('OUTER', TObject(Integer(lxOUTER)));              
  MSKeywordLexems.AddObject('RIGHT', TObject(Integer(lxRIGHT)));              
  MSKeywordLexems.AddObject('UNION', TObject(Integer(lxUNION)));              
  MSKeywordLexems.AddObject('WITH', TObject(Integer(lxWITH)));                
  MSKeywordLexems.AddObject('BEGIN', TObject(Integer(lxBEGIN)));
  MSKeywordLexems.AddObject('END', TObject(Integer(lxEND)));
  MSKeywordLexems.AddObject('DECLARE', TObject(Integer(lxDECLARE)));
  MSKeywordLexems.AddObject('FUNCTION', TObject(Integer(lxFUNCTION)));
  MSKeywordLexems.AddObject('GO', TObject(Integer(lxGO)));
  MSKeywordLexems.AddObject('TABLE', TObject(Integer(lxTABLE)));
  MSKeywordLexems.AddObject('DEFAULT', TObject(Integer(lxDEFAULT)));
  MSKeywordLexems.AddObject('RULE', TObject(Integer(lxRULE)));
  MSKeywordLexems.AddObject('VIEW', TObject(Integer(lxVIEW)));

  MSKeywordLexems.CustomSort(CRCmpStrings);

finalization
  MSSymbolLexems.Free;
  MSKeywordLexems.Free;

end.
