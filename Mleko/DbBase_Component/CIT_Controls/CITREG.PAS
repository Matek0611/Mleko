unit citReg;

interface

uses citCtrls, citMask, citCalendar, citCalculator, citTimeEdit, Classes, Forms, Controls,
  citText, citHttpLabel, {citFilter, citDateFilterDlg, DsgnIntf,} TypInfo, SysUtils,
  {citTray,} citRichEdit, citRichEditDlg;
{
type

  TDateFilterStateProperty = class(TClassProperty)
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;


  TDateFilterEditor = class(TDefaultEditor)
  protected
    procedure EditProperty(PropertyEditor: TPropertyEditor;
      var Continue, FreeEditor: Boolean); override;
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

  TTokenGroupsProperty = class(TClassProperty)
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;

  TRichEditEditor = class(TDefaultEditor)
  protected
    procedure EditProperty(PropertyEditor: TPropertyEditor;
      var Continue, FreeEditor: Boolean); override;
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;
}

procedure Register;

implementation

{
procedure TDateFilterStateProperty.Edit;
var
  Dlg : TcitDateFilterStateDlg;
begin
  Dlg := TcitDateFilterStateDlg.Create(Application);
  with TcitDateFilter(GetComponent(0)) do
  try
    Dlg.citDateFilter.Caption := Caption;
    Dlg.citDateFilter.Checked := Checked;
    Dlg.citDateFilter.CurrentState := CurrentState;
    if Dlg.ShowModal = mrOK then
    begin
      Checked := Dlg.citDateFilter.Checked;
      CurrentState := Dlg.citDateFilter.CurrentState;
    end;
    Modified;
  finally
    Dlg.Free;
  end;
end;

function TDateFilterStateProperty.GetAttributes: TPropertyAttributes;
begin
  Result := inherited GetAttributes + [paDialog] - [paSubProperties];
end;

procedure TDateFilterEditor.EditProperty(PropertyEditor: TPropertyEditor;
  var Continue, FreeEditor: Boolean);
var
  PropName: string;
begin
  PropName := PropertyEditor.GetName;
  if (CompareText(PropName, 'CurrentState') = 0) then
  begin
    PropertyEditor.Edit;
    Continue := False;
  end;
end;

function TDateFilterEditor.GetVerbCount: Integer;
begin
  Result := 3;
end;

function TDateFilterEditor.GetVerb(Index: Integer): string;
begin
  case Index of
    0 : Result := 'Date Filter by CIT';
    1 : Result := '-';
    2 : Result := 'Edit Initial State'
    else  Result := '';
  end;
end;

procedure TDateFilterEditor.ExecuteVerb(Index: Integer);
begin
  if Index = 2 then Edit;
end;

procedure TTokenGroupsProperty.Edit;
var
  Dlg : TRichEditDlg;
begin
  Dlg := TRichEditDlg.Create(Application);
  with TcitRichEdit(GetComponent(0)) do
  try
    Dlg.Component := TcitRichEdit(GetComponent(0));
    if Dlg.ShowModal = mrOK then
    with TcitRichEdit(GetComponent(0)) do
    begin
      TokenGroups.Assign(Dlg.TokenGroups);
      CommentLeft := Dlg.EditLeftComment.Text;
      CommentRight := Dlg.EditRightComment.Text;
      CommentSingleLine := Dlg.EditComment.Text;
      QuotationMarks := Dlg.EditQuotas.Text;
      StringFont.Assign(Dlg.StringFont);
      CommentFont.Assign(Dlg.CommentFont);
    end;
    Modified;
  finally
    Dlg.Free;
  end;
end;

function TTokenGroupsProperty.GetAttributes: TPropertyAttributes;
begin
  Result := inherited GetAttributes + [paDialog] - [paSubProperties];
end;

procedure TRichEditEditor.EditProperty(PropertyEditor: TPropertyEditor;
  var Continue, FreeEditor: Boolean);
var
  PropName: string;
begin
  PropName := PropertyEditor.GetName;
  if (CompareText(PropName, 'TokenGroups') = 0) then
  begin
    PropertyEditor.Edit;
    Continue := False;
  end;
end;

function TRichEditEditor.GetVerbCount: Integer;
begin
  Result := 3;
end;

function TRichEditEditor.GetVerb(Index: Integer): string;
begin
  case Index of
    0 : Result := 'Rich Edit by CIT';
    1 : Result := '-';
    2 : Result := 'Edit syntax highlighting params'
    else  Result := '';
  end;
end;

procedure TRichEditEditor.ExecuteVerb(Index: Integer);
begin
  if Index = 2 then Edit;
end;
 }

procedure Register;
begin
  RegisterComponents('CIT Controls',[
    TcitText, TcitEdit, TcitMaskEdit, TcitDateEdit, TcitTimeEdit,
    TcitCalcEdit, TcitHttpLabel, {TcitDateFilter, TcitNumberFilter,
    TcitStringFilter, TcitBooleanFilter,} TcitRichEdit]);
 {
  RegisterComponentEditor(TcitDateFilter, TDateFilterEditor);
  RegisterPropertyEditor(TypeInfo(string), TcitDateFilter, 'CurrentState',
                         TDateFilterStateProperty);
  RegisterComponentEditor(TcitRichEdit, TRichEditEditor);
  RegisterPropertyEditor(TypeInfo(TTokenGroups), nil, 'TokenGroups',
                         TTokenGroupsProperty);
  }
end;

end.

