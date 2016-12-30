unit SelOtdel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKPropDb, DB, DBAccess, ActnList, CheckLst, StdCtrls, MemDS,
  MsAccess, ComCtrls, ToolWin;

type
  TfmSelectOtdel = class(TCFLMLKPropDbDlg)
    CheckList: TCheckListBox;
  private
    { Private declarations }
  public
    aResultList: TStringList;
    class procedure SetupList(var ResultList: TStringList; SQLTExt: TStrings; ShowField: string; ResultField: string; FormTitle: string);

  end;

var
  lResultField: string;
  fmSelectOtdel: TfmSelectOtdel;
function SelectOtdel: string;

implementation

uses data;

{$R *.dfm}

class procedure TfmSelectOtdel.SetupList(
  var ResultList: TStringlist; SQLTExt: TStrings; ShowField: string; ResultField: string; FormTitle: string
  );
var
  Dlg: TfmSelectOtdel;
  index: integer;
begin
  dlg := Create(Application);
  try
    with dlg do
    begin
      Caption := FOrmTitle;
      Query.Close;
      Query.SQL.Clear;
      Query.SQL := SqlText;
      CheckList.Clear;
      Query.Open;
      lResultField := ResultField;
      while not Query.Eof do
      begin
        index := CheckList.Items.Add(Query.FieldByName(ShowField).AsString);
        CheckList.Checked[index] := false;
        Query.Next;
      end;
      ShowModal;
    end;
  finally
    ResultList := dlg.aResultList;
    Dlg.Free;
  end;
end;

function SelectOtdel: string;
var
  Dlg: TfmSelectOtdel;
  index, c: integer;
  aResultList: TStrings;
begin
  dlg := TfmSelectOtdel.Create(Application);
  aResultList := TstringList.Create;
  Result := '';
  try
    dlg.Query.Close;
    dlg.Query.Open;
    while not dlg.Query.Eof do
    begin
      index := dlg.CheckList.Items.Add(dlg.Query.FieldByName('OtdelName').AsString);
      dlg.CheckList.Checked[index] := true;
      dlg.Query.Next;
    end;
    if dlg.ShowModal = mrOK then
    begin
      c := 0;
      if not dlg.Query.Active then dlg.Query.Open;
      dlg.Query.First;
      while not dlg.Query.Eof do
      begin
        if dlg.CheckList.Checked[c] then
        begin
          aResultList.Add(dlg.Query.FieldByName('OtdelNo').AsString);
        end;
        c := c + 1;
        dlg.Query.Next;
      end;
      dlg.Query.Close;
      Result := '(' + aResultList.CommaText + ')';
    end;
  finally
    aResultList.Free;
    Dlg.Free;
  end;
end;

end.

