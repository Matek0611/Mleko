unit MlekoSelectAddress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKSelect, DB, DBAccess, MsAccess, COMPSQLBuilder,   ActnList,
  citComponentProps, ExtCtrls, comp_TargetFilter_Panel, StdCtrls,
  ComCtrls, ToolWin, Grids, DBGrids, citDbGrid,
  comp_TargetFilter_CustomFilter, comp_TargetFilter_StringFilter,
  PropFilerEh, MemDS;

type
  TMlekoSelectAddressDlg = class(TCFLMLKSelectDlg)
    FilterName: TTargetFilter_StringFilter;
    TargetFilter_StringFilter1: TTargetFilter_StringFilter;
    QueryID: TIntegerField;
    QueryPostNo: TSmallintField;
    QueryAddress: TStringField;
    QueryRegionName: TStringField;
    QueryTimeBeg: TWideStringField;
    QueryTimeEnd: TWideStringField;
    QueryUnloading: TIntegerField;
    QueryAddressNo: TSmallintField;
    Querypkey: TLargeintField;
    Queryis_select: TIntegerField;
    procedure FilterNamea_OnBeforeGetString(
      Sender: TTargetFilter_StringFilter;
      ConditionType: TStringConditionType;
      ConditionGroup: TStringConditionGroup; var LikeStr: String);
    procedure TargetFilter_StringFilter1a_OnBeforeGetString(
      Sender: TTargetFilter_StringFilter;
      ConditionType: TStringConditionType;
      ConditionGroup: TStringConditionGroup; var LikeStr: String);      
    procedure SQLBuilderGetParams(Sender: TObject; var Params: TParams);
    function SQLBuilderGetOrderBy(Sender: TObject): String;
    function SQLBuilderGetWhere(Sender: TObject): String;
  private
    FPostNo: Int64;
    procedure SetPostNo(const Value: Int64);
    { Private declarations }
  public
    property PostNo: Int64 read FPostNo write SetPostNo;
    class function SelectAddress(var aFirmId:integer):boolean;
  end;

var
  MlekoSelectAddressDlg: TMlekoSelectAddressDlg;

implementation

uses UtilsCommon;

{$R *.dfm}

class function TMlekoSelectAddressDlg.SelectAddress(var aFirmId:integer):boolean;
Var lv_firmId: String;
begin
  inherited;
  if OpenSelect(aFirmId,true) then begin
      result:=true;
   end else result:=false;
end;

procedure TMlekoSelectAddressDlg.SetPostNo(const Value: Int64);
begin
  if FPostNo <> Value then FPostNo := Value;
end;

procedure TMlekoSelectAddressDlg.FilterNamea_OnBeforeGetString(
  Sender: TTargetFilter_StringFilter; ConditionType: TStringConditionType;
  ConditionGroup: TStringConditionGroup; var LikeStr: String);
begin
  inherited;
    LikeStr := '%'+LikeStr+'%';
end;

procedure TMlekoSelectAddressDlg.TargetFilter_StringFilter1a_OnBeforeGetString(
  Sender: TTargetFilter_StringFilter; ConditionType: TStringConditionType;
  ConditionGroup: TStringConditionGroup; var LikeStr: String);
begin
  inherited;
  LikeStr := '%' + LikeStr + '%';
end;

procedure TMlekoSelectAddressDlg.SQLBuilderGetParams(Sender: TObject;
  var Params: TParams);
begin
  inherited;
  UtilsCommon.SetParamValue(Params, 'PostNo', PostNo);
end;

function TMlekoSelectAddressDlg.SQLBuilderGetOrderBy(
  Sender: TObject): String;
begin
   result:=' Address ';
end;

function TMlekoSelectAddressDlg.SQLBuilderGetWhere(Sender: TObject): String;
begin
 //result := ' a.PostNo = isnull(:PostNo,a.PostNo) and a.Address not like ''%---%'' and Address not like ''%...%'' and a.Address is not null';
 result := ' (a.Address not like ''%---%'') and (Address not like ''%...%'') and (not a.Address is null) and (Len(Rtrim(a.Address))>0) ';
end;

initialization
 RegisterClass(TMlekoSelectAddressDlg);

finalization
 UnRegisterClass(TMlekoSelectAddressDlg);

end.
