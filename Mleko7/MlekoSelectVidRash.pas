unit MlekoSelectVidRash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKSelect, DB, DBAccess, MsAccess, COMPSQLBuilder,   ActnList,
  citComponentProps, ExtCtrls, comp_TargetFilter_Panel, StdCtrls,
  ComCtrls, ToolWin, Grids, DBGrids, citDbGrid,
  comp_TargetFilter_CustomFilter, comp_TargetFilter_StringFilter,
  comp_Target_DBCtrls, citCtrls, citmask, citDBComboEdit, PropFilerEh,
  MemDS;

type
  TMlekoSelectVidRashDlg = class(TCFLMLKSelectDlg)
    TargetFilter_StringFilter1: TTargetFilter_StringFilter;
    DSOtdels: TDataSource;
    quOtdels: TMSQuery;
    ftOtdel: TcitDBComboEdit;
    quRashGroup: TMSQuery;
    quRashGroupid: TAutoIncField;
    quRashGroupname: TStringField;
    procedure FilterNamea_OnBeforeGetString(
      Sender: TTargetFilter_StringFilter;
      ConditionType: TStringConditionType;
      ConditionGroup: TStringConditionGroup; var LikeStr: String);
    procedure SQLBuilderGetParams(Sender: TObject; var Params: TParams);
    procedure ftOtdelSelectOk(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    class function SelectVidRash(var aVidRashodNo:integer):boolean;
  end;

var
  ln_Group_id: integer;
  MlekoSelectVidRashDlg: TMlekoSelectVidRashDlg;


implementation

uses data;

{$R *.dfm}

class function TMlekoSelectVidRashDlg.SelectVidRash(var aVidRashodNo:integer):boolean;
begin
  inherited;
  if OpenSelect(aVidRashodNo,true) then begin
      result:=true;
   end else result:=false;
end;

procedure TMlekoSelectVidRashDlg.FilterNamea_OnBeforeGetString(
  Sender: TTargetFilter_StringFilter; ConditionType: TStringConditionType;
  ConditionGroup: TStringConditionGroup; var LikeStr: String);
begin
  inherited;
    LikeStr := '%'+LikeStr+'%';
end;

procedure TMlekoSelectVidRashDlg.SQLBuilderGetParams(Sender: TObject;
  var Params: TParams);
begin
  inherited;
    with Params.CreateParam(ftInteger, 'P_GROUP_ID', ptInput) do AsInteger := ln_Group_id;
    with Params.CreateParam(ftInteger, 'P_SHOW_ALL', ptInput) do AsInteger := ln_Group_id;
end;

procedure TMlekoSelectVidRashDlg.ftOtdelSelectOk(Sender: TObject);
begin
  inherited;
  IF ftOtdel.Text='' then ln_Group_id:=-1 else ln_Group_id:=StrToInt(ftOtdel.KeyFieldValue);
end;

procedure TMlekoSelectVidRashDlg.FormCreate(Sender: TObject);
begin
  inherited;
  ln_Group_id:=-1;
end;

initialization
 RegisterClass(TMlekoSelectVidRashDlg);

finalization
 UnRegisterClass(TMlekoSelectVidRashDlg);
 
end.
