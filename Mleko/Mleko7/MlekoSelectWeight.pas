unit MlekoSelectWeight;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKSelect, DBAccess, MsAccess, DB, COMPSQLBuilder,   ActnList, 
  citComponentProps, ExtCtrls, comp_TargetFilter_Panel, StdCtrls, ComCtrls,
  ToolWin, Grids, DBGrids, citDbGrid, MemDS;

type
  TMlekoSelectWeightDlg = class(TCFLMLKSelectDlg)
    spEditTovWeightPos: TMSStoredProc;
    quSelectedRashod: TMSQuery;
    spClearWeightRash: TMSStoredProc;
    procedure ActionFormSelectExecute(Sender: TObject);
    procedure DBGridDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
  private
  public
    class function SelectWeight(p_document_id:integer;p_tovarNo:integer; var p_weight: real):boolean;
  end;

var
  MlekoSelectWeightDlg: TMlekoSelectWeightDlg;
  ln_document_id: Integer;
  ln_TovarNo: Integer;
  ln_weight:real;

implementation

uses data;

{$R *.dfm}

class function TMlekoSelectWeightDlg.SelectWeight(p_document_id:integer;p_tovarNo:integer; var p_weight: real):boolean;
var i:integer;
    l_res_sql,l_owner_name,l_param_name,l_query_filter:String;
    l_text_field,l_key_field:TStrings;
    is_multiselect: boolean;
begin
    ln_weight:=0;
    ln_document_id:=p_document_id;
    ln_TovarNo:=p_tovarNo;
    l_param_name:='p_weight_pos';
    l_owner_name:='SPEC_SELECT_WEIGHT';
    l_query_filter:=' (a.Rashod_id is null or a.Rashod_id='+IntToStr(ln_document_id)+') and a.TovarNo='+IntToStr(ln_TovarNo);
    is_multiselect:=true;
    l_key_field.Add('ID');
    l_text_field.Add('WEIGHT');
    result:= OpenHoldSelect(l_owner_name,l_param_name,'v_list_Tovar_weight',is_multiselect,l_query_filter);
    if result then p_weight:=ln_weight;
end;

procedure TMlekoSelectWeightDlg.ActionFormSelectExecute(Sender: TObject);
var i:integer;
begin
  inherited;
  spClearWeightRash.Close;
  spClearWeightRash.Prepare;
  spClearWeightRash.Params.ParamByName('p_TovarNo').Value:=ln_TovarNo;
  spClearWeightRash.Params.ParamByName('p_Rashod_id').Value:=ln_document_id;
  spClearWeightRash.ExecProc;

  ln_weight:=0;
  QuSelectList.First;
  while not QuSelectList.Eof do
  begin
   spEditTovWeightPos.Close;
   spEditTovWeightPos.Prepare;
   spEditTovWeightPos.Params.ParamByName('p_id').Value:=QuSelectList.FieldByName('id').AsInteger;
   spEditTovWeightPos.Params.ParamByName('p_TovarNo').Value:=ln_TovarNo;
   spEditTovWeightPos.Params.ParamByName('p_Prihod_NaklNo').Value:=QuSelectList.FieldByName('Prihod_NaklNo').AsInteger;
   spEditTovWeightPos.Params.ParamByName('p_Rashod_id').Value:=ln_document_id;
   spEditTovWeightPos.Params.ParamByName('p_item_kol').Value:=QuSelectList.FieldByName('weight').AsFLoat;
   spEditTovWeightPos.Params.ParamByName('p_item_num').Value:=QuSelectList.FieldByName('item_num').AsInteger;
   spEditTovWeightPos.Params.ParamByName('p_pack_num').Value:=QuSelectList.FieldByName('box_num').AsInteger;
   spEditTovWeightPos.ExecProc;
   ln_weight:=ln_weight+QuSelectList.FieldByName('weight').AsFLoat;
   QuSelectList.Next;
  end;
end;

procedure TMlekoSelectWeightDlg.DBGridDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
 if (Field.FieldName='kol_Prih_ext') then
   if (ds.dataSet.FieldByName('kol_Prih_ext').AsFloat<>ds.dataSet.FieldByName('Prihod_kol').AsFloat)
   then DbGrid.Canvas.Brush.Color:=clRed;
end;

procedure TMlekoSelectWeightDlg.FormShow(Sender: TObject);
begin
  inherited;
  ActionUnMarkAll.Execute;
  quSelectedRashod.Close;
  quSelectedRashod.Params.ParamByName('p_tovarNo').Value:=ln_TovarNo;
  quSelectedRashod.Params.ParamByName('p_document_id').Value:=ln_document_id;
  quSelectedRashod.Open;
  quSelectedRashod.First;

  while not quSelectedRashod.Eof do
  begin
   dmDataModule.Add_session_params(owner_name,entity_name,quSelectedRashod.FieldByName('ID').AsString);
   quSelectedRashod.Next;
  end;
  ActionViewRefresh.Execute;
  DBGridSelection.SetFocus;
end;

initialization
 RegisterClass(TMlekoSelectWeightDlg);

finalization
 UnRegisterClass(TMlekoSelectWeightDlg);

end.

