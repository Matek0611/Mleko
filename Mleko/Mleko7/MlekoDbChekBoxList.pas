unit MlekoDbChekBoxList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKPropDb, DB, DBAccess, MsAccess, ActnList, ComCtrls, StdCtrls, CheckLst,
  MemDS, ToolWin ;

type
  TMlekoDbChekBoxListForm = class(TCFLMLKPropDbDlg)
    CheckList: TCheckListBox;
    procedure ActionOKExecute(Sender: TObject);
  private
    { Private declarations }
  public
  aResultList: TStringList;
   class procedure SetupList(
  var ResultList:  TStringList; SQLTExt: TStrings ; ShowField: String; ResultField: String; FormTitle:String
  );

  end;

var
  lResultField: String;
  MlekoDbChekBoxListForm: TMlekoDbChekBoxListForm;

implementation

{$R *.dfm}
class procedure TMlekoDbChekBoxListForm.SetupList(
  var ResultList:  TStringlist; SQLTExt: TStrings ; ShowField: String; ResultField: String; FormTitle:String
);
var
Dlg: TMlekoDbChekBoxListForm;
index: integer;
begin
dlg := Create(Application);
try
    with dlg do begin
        Caption := FOrmTitle;
        Query.Close;
        Query.SQL.Clear;
        Query.SQL:=SqlText;
        CheckList.Clear;
        Query.Open;
        lResultField:=ResultField;
        while not Query.Eof do begin
            index:=CheckList.Items.Add(Query.FieldByName(ShowField).AsString);
            CheckList.Checked[index]:=false;
            Query.Next;
          end;
         ShowModal;
    end;
finally
  ResultList:=dlg.aResultList;
  Dlg.Free;
end;
end;

procedure TMlekoDbChekBoxListForm.ActionOKExecute(Sender: TObject);
var c:integer;
begin
  aResultList:=TstringList.Create;
  aResultList.Clear;
  c:=0;
  IF not Query.Active then  Query.Open;
  Query.First;
  while not Query.Eof do begin
    If CheckList.Checked[c] then begin
      aResultList.Add(Query.FieldByName(lResultField).AsString);
    end;
    c:=c+1;
    Query.Next;
  end;
  Query.Close;
  Saved:=true;
  inherited;
end;

end.
