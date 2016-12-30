unit MlekoPropTovWeightPos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKPropDb, DB, DBAccess, MsAccess, ActnList, ComCtrls, StdCtrls,
  citCtrls, citDBComboEdit, citmask,CFLMLKPropCustomDialog, 
  PropFilerEh, MemDS, ToolWin;

type
  TMlekoPropTovWeightPosDlg = class(TCFLMLKPropCustomDialogDlg)
    p_TovarNo: TcitDBComboEdit;
    p_Prihod_NaklNo: TcitDBComboEdit;
    p_Rashod_id: TcitDBComboEdit;
    p_item_kol: TcitDBComboEdit;
    p_item_num: TcitDBComboEdit;
    p_pack_num: TcitDBComboEdit;
    procedure quAddBegParamBeforeOpen(DataSet: TDataSet);
    procedure quUpdBegParamBeforeOpen(DataSet: TDataSet);
    procedure p_Rashod_idPushButton(Sender: TObject);
    procedure p_TovarNoSelectOk(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  public
   procedure set_Execute_param(DataSet: TDataSet); override;
   class function Add_Dlg(var p_id: integer; p_TovarNo:integer ;p_Prihod_NaklNo:integer;p_Rashod_id:integer
;p_TovarNo_Enable:boolean=true ;p_Prihod_NaklNo_Enable:boolean=true;p_Rashod_id_Enable:boolean=true):boolean;
   class function Upd_Dlg(var p_id: integer; p_TovarNo:integer ;p_Prihod_NaklNo:integer;p_Rashod_id:integer
;p_TovarNo_Enable:boolean=true ;p_Prihod_NaklNo_Enable:boolean=true;p_Rashod_id_Enable:boolean=true):boolean;
  end;

var
ln_id: integer;
ln_TovarNo:integer;
ln_Prihod_NaklNo:integer;
ln_Rashod_id:integer;
lb_TovarNo_Enable,lb_Prihod_NaklNo_Enable,lb_Rashod_id_Enable:boolean;

implementation


{$R *.dfm}
class function TMlekoPropTovWeightPosDlg.Add_Dlg(var p_id: integer; p_TovarNo:integer ;p_Prihod_NaklNo:integer;p_Rashod_id:integer
;p_TovarNo_Enable:boolean=true ;p_Prihod_NaklNo_Enable:boolean=true;p_Rashod_id_Enable:boolean=true):boolean;
var params:TParams;
begin
inherited;
ln_id:=p_id;
ln_TovarNo:=p_TovarNo;
ln_Prihod_NaklNo:=p_Prihod_NaklNo;
ln_Rashod_id:=p_Rashod_id;
lb_TovarNo_Enable:=p_TovarNo_Enable;
lb_Prihod_NaklNo_Enable:=p_Prihod_NaklNo_Enable;
lb_Rashod_id_Enable:=p_Rashod_id_Enable;

params := TParams.Create(TParam);
try
 result:=ShowDlg('ADD',params);
finally
  params.Free;
end;

end;

class function TMlekoPropTovWeightPosDlg.Upd_Dlg(var p_id: integer; p_TovarNo:integer ;p_Prihod_NaklNo:integer;p_Rashod_id:integer
;p_TovarNo_Enable:boolean=true ;p_Prihod_NaklNo_Enable:boolean=true;p_Rashod_id_Enable:boolean=true):boolean;
var ls_query_filter:String;
    params:TParams;
begin
inherited;
ln_id:=p_id;
ln_TovarNo:=p_TovarNo;
ln_Prihod_NaklNo:=p_Prihod_NaklNo;
ln_Rashod_id:=p_Rashod_id;
lb_TovarNo_Enable:=p_TovarNo_Enable;
lb_Prihod_NaklNo_Enable:=p_Prihod_NaklNo_Enable;
lb_Rashod_id_Enable:=p_Rashod_id_Enable;

params := TParams.Create(TParam);
try
 result:=ShowDlg('EDIT',params);
finally
  params.Free;
end;

end;

procedure TMlekoPropTovWeightPosDlg.quAddBegParamBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
//  (DataSet as TMSQuery).Params.ParamByName('p_id').Value:=ln_id;
  (DataSet as TMSQuery).Params.ParamByName('p_TovarNo').Value:=ln_TovarNo;
  (DataSet as TMSQuery).Params.ParamByName('p_Prihod_NaklNo').Value:=ln_Prihod_NaklNo;
  (DataSet as TMSQuery).Params.ParamByName('p_Rashod_id').Value:=ln_Rashod_id;
end;

procedure TMlekoPropTovWeightPosDlg.quUpdBegParamBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  (DataSet as TMSQuery).Params.ParamByName('p_id').Value:=ln_id;
end;

procedure TMlekoPropTovWeightPosDlg.set_Execute_param(DataSet: TDataSet);
begin
inherited;
 (DataSet as TMSStoredProc).Params.ParamByName('p_id').Value:=ln_id;
end;

procedure TMlekoPropTovWeightPosDlg.p_Rashod_idPushButton(Sender: TObject);
begin
  (Sender as TcitDBComboEdit).SqlFilter:=' exists(select 1 from rashod rs where rs.document_id=a.document_id and rs.tovarNo='+IntToStr(ln_TovarNo)
   +' union all select 1 from e_blanks bs where bs.document_id=a.document_id and bs.tovarNo='+IntToStr(ln_TovarNo)
   +') ';
  inherited;
end;

procedure TMlekoPropTovWeightPosDlg.p_TovarNoSelectOk(Sender: TObject);
begin
  inherited;
  ln_TovarNo:=StrToInt(p_TovarNo.KeyFieldValue);
end;

procedure TMlekoPropTovWeightPosDlg.FormShow(Sender: TObject);
begin
  inherited;
  p_TovarNo.Enabled:=lb_TovarNo_Enable;
//  p_Prihod_NaklNo.Enabled:=lb_Prihod_NaklNo_Enable;
  p_Rashod_id.Enabled:=lb_Rashod_id_Enable;
end;

end.
