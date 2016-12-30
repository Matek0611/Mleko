unit MlekoPropCheckNakl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, MlekoDbChekBoxList, PropFilerEh, DB, DBAccess, MsAccess, ActnList, StdCtrls, CheckLst, ComCtrls,
  MemDS, ToolWin;

type
  TMlekoPropCheckNaklDlg = class(TMlekoDbChekBoxListForm)
    procedure ActionOKExecute(Sender: TObject);
  private
    { Private declarations }
  public
  class procedure ShowList;
  end;

var
  MlekoPropCheckNaklDlg: TMlekoPropCheckNaklDlg;

implementation

{$R *.dfm}

class procedure TMlekoPropCheckNaklDlg.ShowList;
var l_SQL: TStrings;
 a_RetList: TStringList;
 l_str: String;
 Year, Month, Day: Word;
begin

l_sql:=TStringList.Create;
l_sql.Clear;
l_sql.Add('select distinct doc_code,doc_type from v_closeNakl');
l_sql.Add(' Order by doc_type');

SetupList(a_RetList,l_SQL,'doc_type','doc_code','Выбор типа оплаты') ;
end;

procedure TMlekoPropCheckNaklDlg.ActionOKExecute(Sender: TObject);
var l_comp_list:string;
i:integer;
begin
  inherited;
  aResultList.QuoteChar:=' ';
  l_comp_list:='('+aResultList.CommaText+')';
end;

end.
