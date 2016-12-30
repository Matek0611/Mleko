unit MlekoListTovarWieght;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKList, DBAccess, MsAccess, Menus, citComponentProps, DB,  
  COMPSQLBuilder, ActnList, Grids, DBGrids, citDbGrid, ExtCtrls,
  comp_TargetFilter_Panel, ComCtrls, ToolWin,
  comp_TargetFilter_DictionaryFilter,
  StdCtrls, MemDS;

type
  TMlekoListTovarWieghtForm = class(TCFLMLKListForm)
    Label1: TLabel;
    ftTovar: TLabel;
    ftPrihod: TLabel;
    Label3: TLabel;
    ftRashod: TLabel;
    Label4: TLabel;
    spDelTovWeightPos: TMSStoredProc;
    procedure ActionItemAddExecute(Sender: TObject);
    function SQLBuilderGetWhere(Sender: TObject): String;
    procedure ActionItemPropExecute(Sender: TObject);
    function DBGridIsDisabled(Sender: TObject; DataSet: TDataSet): Boolean;
    procedure DBGridDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure ActionItemDelExecute(Sender: TObject);
  protected
    procedure SetActionsEnabled; override;
  private
   lb_TovarNo_Enable,lb_Prihod_NaklNo_Enable,lb_Rashod_id_Enable:boolean;
  public
    class procedure ShowForm(p_TovarNo: integer; p_Prihod_NaklNo: integer; p_Rashod_id:Integer;
p_TovarNo_Enable:boolean=true; p_Prihod_NaklNo_Enable: boolean=true; p_Rashod_id_Enable:boolean=true);
  end;

var gn_TovarNo,gn_Prihod_NaklNo,gn_Rashod_id : Integer;
implementation

uses data,MlekoPropTovWeightPos;


{$R *.dfm}
class procedure TMlekoListTovarWieghtForm.ShowForm(p_TovarNo: integer; p_Prihod_NaklNo: integer; p_Rashod_id:Integer;
p_TovarNo_Enable:boolean=true; p_Prihod_NaklNo_Enable: boolean=true; p_Rashod_id_Enable:boolean=true);
var frm: TMlekoListTovarWieghtForm;
begin
    with Create(Application) do begin
     dmDataModule.quWork.SQL.Clear;
     dmDataModule.quWork.SQL.Add('select NameTovar from Tovar where TovarNo='+IntToStr(p_TovarNo));
     dmDataModule.quWork.Open;
     ftTovar.Caption := ' '+dmDataModule.quWork.FieldByName('NameTovar').AsString;

     dmDataModule.quWork.SQL.Clear;
     dmDataModule.quWork.SQL.Add('select RashodNum from v_blanklist where document_id='+IntToStr(p_Rashod_id));
     dmDataModule.quWork.Open;
     ftRashod.Caption := ' '+dmDataModule.quWork.FieldByName('RashodNum').AsString;

     dmDataModule.quWork.SQL.Clear;
     dmDataModule.quWork.SQL.Add('select num from v_listNaklP where NaklNo='+IntToStr(p_Prihod_NaklNo));
     dmDataModule.quWork.Open;
     ftPrihod.Caption := ' '+dmDataModule.quWork.FieldByName('Num').AsString;

     gn_TovarNo:=p_TovarNo;
     gn_Prihod_NaklNo:=p_Prihod_NaklNo;
     gn_Rashod_id:=p_Rashod_id;
     lb_TovarNo_Enable:=p_TovarNo_Enable;
     lb_Prihod_NaklNo_Enable:=p_Prihod_NaklNo_Enable;
     lb_Rashod_id_Enable:=p_Rashod_id_Enable;
     showmodal;
    end;
end;

function TMlekoListTovarWieghtForm.SQLBuilderGetWhere(
  Sender: TObject): String;
var s:String;
begin
  inherited;
  s:=' 1=1 ';
  if gn_TovarNo<>-1 then s:=s+' and TovarNo='+IntToStr(gn_TovarNo);
  if gn_Rashod_id<>-1 then s:=s+' and Rashod_id='+IntToStr(gn_Rashod_id);
  if gn_Prihod_NaklNo<>-1 then s:=s+' and Prihod_NaklNo='+IntToStr(gn_Prihod_NaklNo);
  result:=s;
end;

procedure TMlekoListTovarWieghtForm.ActionItemAddExecute(Sender: TObject);
var ln_id:Integer;
begin
  inherited;
  ln_id:=-1;
  if TMlekoPropTovWeightPosDlg.Add_Dlg(ln_id,gn_TovarNo ,gn_Prihod_NaklNo,gn_Rashod_id,lb_TovarNo_Enable,lb_Prihod_NaklNo_Enable,lb_Rashod_id_Enable) then ActionViewRefreshExecute(Self);
end;

procedure TMlekoListTovarWieghtForm.ActionItemPropExecute(Sender: TObject);
var ln_TovarNo,ln_Prihod_NaklNo,ln_Rashod_id,ln_id : Integer;
begin
  inherited;
  ln_id:=Query.FieldByName('ID').AsInteger;
  ln_TovarNo:=Query.FieldByName('TovarNo').AsInteger;
  ln_Prihod_NaklNo:=Query.FieldByName('Prihod_NaklNo').AsInteger;
  ln_Rashod_id:=Query.FieldByName('Rashod_id').AsInteger;
  if TMlekoPropTovWeightPosDlg.Upd_Dlg(ln_id,ln_TovarNo ,ln_Prihod_NaklNo,ln_Rashod_id,lb_TovarNo_Enable,lb_Prihod_NaklNo_Enable,lb_Rashod_id_Enable) then ActionViewRefreshExecute(Self);
end;

function TMlekoListTovarWieghtForm.DBGridIsDisabled(Sender: TObject;
  DataSet: TDataSet): Boolean;
begin
  inherited;
  result:=Trim(ds.DataSet.FieldByName('Rashodnum').AsString)<>'';
end;

procedure TMlekoListTovarWieghtForm.SetActionsEnabled;
var
  ne, c, aEditEnabled: boolean;
  status: Integer;
begin
  inherited;
  ne := not Query.IsEmpty;
  ActionItemProp.Enabled:=Trim(ds.DataSet.FieldByName('Rashodnum').AsString)='';
end;

procedure TMlekoListTovarWieghtForm.DBGridDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;

 if (Field.FieldName='kol_Prih_ext') then
   if (ds.dataSet.FieldByName('kol_Prih_ext').AsFloat<>ds.dataSet.FieldByName('Prihod_kol').AsFloat)
   then DbGrid.Canvas.Brush.Color:=clRed;

end;

procedure TMlekoListTovarWieghtForm.ActionItemDelExecute(Sender: TObject);
begin
  inherited;
 if Application.MessageBox(Pchar(ds.dataSet.FieldByName('NameTovar').asString),'Удалить из спискa?',MB_YESNO)=IDYES then begin
  spDelTovWeightPos.Close;
  spDelTovWeightPos.Params.ParamByName('p_id').Value:=ds.dataSet.FieldByName('ID').AsInteger;
  spDelTovWeightPos.ExecProc;
  ActionViewRefresh.Execute;
 end;
end;

end.
