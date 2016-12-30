unit MlekoEditRepParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKProp, ActnList, ComCtrls, StdCtrls, DB, DBAccess, MsAccess, citCtrls,
  citDBComboEdit, citmask, MemDS;

type
  TMlekoEditRepParamDlg = class(TCFLMLKPropDlg)
    SpAddReportParam: TMSStoredProc;
    edName: TcitDBComboEdit;
    edType: TcitDBComboEdit;
    quParamType: TMSQuery;
    edCaption: TcitDBComboEdit;
    edTop: TcitDBComboEdit;
    edLeft: TcitDBComboEdit;
    edHeight: TcitDBComboEdit;
    edWidth: TcitDBComboEdit;
    MultiSelect: TCheckBox;
    quParamTypecode: TStringField;
    quParamTypeID: TIntegerField;
    quParamTypedescription: TStringField;
  private
    FPROP_DLG_ID: integer;
    FPARAM_ID: integer;
    { Private declarations }
  public
    property PROP_DLG_ID: integer read FPROP_DLG_ID write FPROP_DLG_ID;
    property PARAM_ID: integer read FPARAM_ID write FPARAM_ID;
    class function AddRepParam(PROP_DLG_ID: integer; var ID: Integer): boolean;
  end;

var
  MlekoEditRepParamDlg: TMlekoEditRepParamDlg;

implementation

uses data;

{$R *.dfm}

class function TMlekoEditRepParamDlg.AddRepParam(PROP_DLG_ID: integer; var ID: Integer): boolean;
var
  Dlg: TMlekoEditRepParamDlg;
begin
  Dlg := TMlekoEditRepParamDlg.Create(Application);
  Dlg.PROP_DLG_ID := PROP_DLG_ID;
  try
    Result := (Dlg.ShowModal = mrOk);
    if Result then
    begin
      with dlg do
      begin
        SpAddReportParam.Close;
        SpAddReportParam.Params.ParamByName('p_prop_dlg_id').Value := PROP_DLG_ID;
        SpAddReportParam.Params.ParamByName('p_name').Value := edName.Text;
        SpAddReportParam.Params.ParamByName('p_entity_type_id').Value := edType.KeyFieldValue;
        SpAddReportParam.Params.ParamByName('p_caption').Value := edCaption.Text;
        SpAddReportParam.Params.ParamByName('p_pos_left').Value := StrToInt(edLeft.Text);
        SpAddReportParam.Params.ParamByName('p_pos_top').Value := StrToInt(edTop.Text);
        SpAddReportParam.Params.ParamByName('p_width').Value := StrToInt(edwidth.Text);
        SpAddReportParam.Params.ParamByName('p_height').Value := StrToInt(edheight.Text);
        SpAddReportParam.Params.ParamByName('p_is_multiselect').AsBoolean := MultiSelect.Checked;
        SpAddReportParam.Params.ParamByName('p_style').Value := 'DEFAULT';
        SpAddReportParam.ExecProc;
      end;
      ID := Dlg.SpAddReportParam.Params.ParamByName('p_id').AsInteger;
    end;
  finally
    Dlg.Free;
  end;
end;


end.

