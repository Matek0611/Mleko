unit CFLMLKPropCustomDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKProp, ActnList, ComCtrls, StdCtrls, DB, DBAccess, MsAccess, StrUtils, citDBComboEdit,
  MemDS, ToolWin, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar;

type
  TCFLMLKPropCustomDialogDlg = class(TCFLMLKPropDlg)
    quAddBegParam: TMSQuery;
    quUpdBegParam: TMSQuery;
    spUpd: TMSStoredProc;
    spAdd: TMSStoredProc;
    ToolBar: TToolBar;
    BtnEditDlg: TToolButton;
    ToolBtnAdd: TToolButton;
    ActionViewAddSQL: TAction;
    ActionViewEditSQL: TAction;
    ActionViewSysToolBar: TAction;
    procedure ActionViewSysToolBarExecute(Sender: TObject);
    procedure ActionApplyExecute(Sender: TObject);
  private
    FEditType: string;
  public
    procedure set_begin_param(DataSet: TDataSet);
    procedure set_Execute_param(DataSet: TDataSet); virtual;
  protected
    Params: TParams;
    property EditType: string read FEditType write FEditType;
    class function ShowDlg(EditType: string; var Params: TParams): boolean; virtual;
  end;

implementation

uses data;

{$R *.dfm}

class function TCFLMLKPropCustomDialogDlg.ShowDlg(EditType: string;
  var Params: TParams): boolean;
var
  Dlg: TCFLMLKPropCustomDialogDlg;
  ShowDataSet: TDataSet;
begin
  Dlg := Create(Application);
  try
    Dlg.EditType := EditType;
    Dlg.Params := Params;
    if EditType = 'EDIT' then
    begin
      ShowDataSet := dlg.quUpdBegParam;
    end;
    if EditType = 'ADD' then
    begin
      ShowDataSet := dlg.quAddBegParam;
    end;

    ShowDataSet.Open;
    dlg.set_begin_param(ShowDataSet);
    Result := (Dlg.ShowModal = mrOk);
  finally
    Dlg.Free;
  end;
end;

procedure TCFLMLKPropCustomDialogDlg.set_begin_param(DataSet: TDataSet);
var
  len, i: integer;
  field_name, param_name, param_postfix: string;
  c: TCitDbComboEdit;
begin
  for i := 0 to DataSet.FieldCount - 1 do
  begin
    field_name := uppercase(Trim(DataSet.Fields[i].FieldName));
    len := Length(field_name);
    param_name := LeftStr(field_name, len - 4);
    param_postfix := RightStr(field_name, 4);

//    if param_name = 'P_RATECURRENCYACCOUNTING' then showmessage('p_CurrencyHead');

    c := (self.FindComponent(field_name) as TCitDbComboEdit);
    if c <> nil then
    begin
      c.Text := DataSet.Fields[i].AsString;
      c.KeyFieldValue := DataSet.Fields[i].AsString;
      c.OnIsSelect := ParamIsSelect;
      if c.EditStyle in [edCombo] then c.GetLocateKey;
    end;

    if param_postfix = '_TXT' then
    begin
      c := (self.FindComponent(param_name) as TCitDbComboEdit);
      if c <> nil then
      begin
        c.Text := DataSet.Fields[i].AsString;
        c.OnIsSelect := ParamIsSelect;
      end;
    end;

    if param_postfix = '_KEY' then
    begin
      c := (self.FindComponent(param_name) as TCitDbComboEdit);
      if c <> nil then
      begin
        c.KeyFieldValue := DataSet.Fields[i].AsString;
        c.OnIsSelect := ParamIsSelect;
        if c.EditStyle in [edCombo] then c.GetLocateKey;
      end;
    end;
  end;
end;

procedure TCFLMLKPropCustomDialogDlg.set_Execute_param(DataSet: TDataSet);
var
  p: TMSStoredProc;
  c: TCitDbComboEdit;
  i: integer;
  param_name: string;
begin
  p := (DataSet as TMSStoredProc);
//   p.Prepare;
  for i := 0 to p.Params.Count - 1 do
  begin
    param_name := trim(p.Params[i].Name);
    c := (self.FindComponent(param_name) as TCitDbComboEdit);
    if c <> nil then
      if c.KeyFieldValue = '' then
        p.Params[i].Value := null
      else
      begin
        case p.Params[i].DataType of
          ftString: p.Params[i].AsString := c.KeyFieldValue;
          ftSmallint, ftInteger: p.Params[i].AsInteger := StrToInt(c.KeyFieldValue);
          ftDate, ftDateTime: p.Params[i].AsDate := StrToDate(c.KeyFieldValue);
          ftFloat: p.Params[i].AsFloat := StrToFloat(c.KeyFieldValue);
        else
          p.Params[i].AsString := c.KeyFieldValue;
        end;
      end;
  end;
end;

procedure TCFLMLKPropCustomDialogDlg.ActionViewSysToolBarExecute(
  Sender: TObject);
begin
  inherited;
  ToolBar.Visible := not (ToolBar.Visible);
end;

procedure TCFLMLKPropCustomDialogDlg.ActionApplyExecute(Sender: TObject);
begin
  inherited;
  if Saved then
  begin
    if EditType = 'ADD' then
    begin
      set_Execute_param(spAdd);
      spAdd.ExecProc;
      //    TCFLViewSQLForm.ViewSql(spAdd);
    end;
    if EditType = 'EDIT' then
    begin
      set_Execute_param(spUpd);
      spUpd.ExecProc;
      //    TCFLViewSQLForm.ViewSql(spUpd);
    end;
  end;
end;

end.

