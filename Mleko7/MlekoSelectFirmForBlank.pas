unit MlekoSelectFirmForBlank;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoSelectFIrm, MSAccess, DB, MemDS, DBAccess, COMPSQLBuilder,
  citComponentProps, ActnList, StdCtrls, comp_TargetFilter_CustomFilter,
  comp_TargetFilter_StringFilter, comp_TargetFilter_Panel, ComCtrls,
  ToolWin, Grids, DBGrids, citDbGrid, ExtCtrls, CFLMLKSelect;

type
  TMlekoSelectFirmForBlankDlg = class(TCFLMLKSelectDlg)
    TargetFilter_StringFilter1: TTargetFilter_StringFilter;
    FilterName: TTargetFilter_StringFilter;
    procedure QueryBeforeOpen(DataSet: TDataSet);
    function SQLBuilderGetOrderBy(Sender: TObject): String;
    procedure QueryAfterOpen(DataSet: TDataSet);
    procedure SQLBuilderGetParams(Sender: TObject; var Params: TParams);
    procedure TargetFilter_StringFilter1a_OnBeforeGetString(
      Sender: TTargetFilter_StringFilter;
      ConditionType: TStringConditionType;
      ConditionGroup: TStringConditionGroup; var LikeStr: String);
    procedure FilterNamea_OnBeforeGetString(
      Sender: TTargetFilter_StringFilter;
      ConditionType: TStringConditionType;
      ConditionGroup: TStringConditionGroup; var LikeStr: String);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlekoSelectFirmForBlankDlg: TMlekoSelectFirmForBlankDlg;

implementation

uses data, main,UtilsCommon,Meko_Blanc_Price;

{$R *.dfm}

procedure TMlekoSelectFirmForBlankDlg.QueryBeforeOpen(DataSet: TDataSet);
begin
//  inherited;
end;

function TMlekoSelectFirmForBlankDlg.SQLBuilderGetOrderBy(
  Sender: TObject): String;
begin
//  inherited;
   result:='NameShort OPTION (FAST 100)';
end;

procedure TMlekoSelectFirmForBlankDlg.QueryAfterOpen(DataSet: TDataSet);
begin
//  inherited;
  DBGrid.Columns[0].Width:=300;
  DBGrid.Columns[1].Width:=250;
  DBGrid.Columns[2].Width:=70;
end;

procedure TMlekoSelectFirmForBlankDlg.SQLBuilderGetParams(Sender: TObject;
  var Params: TParams);
begin
  inherited;
  UtilsCommon.SetParamValue(Params, 'DateNakl', main.GlobalDateNakl);
//  showmessage(datetostr(main.GlobalDateNakl));
end;

procedure TMlekoSelectFirmForBlankDlg.TargetFilter_StringFilter1a_OnBeforeGetString(
  Sender: TTargetFilter_StringFilter; ConditionType: TStringConditionType;
  ConditionGroup: TStringConditionGroup; var LikeStr: String);
begin
  inherited;
  LikeStr := '%' + LikeStr + '%';
end;

procedure TMlekoSelectFirmForBlankDlg.FilterNamea_OnBeforeGetString(
  Sender: TTargetFilter_StringFilter; ConditionType: TStringConditionType;
  ConditionGroup: TStringConditionGroup; var LikeStr: String);
begin
  inherited;
  LikeStr := '%' + LikeStr + '%';
end;

procedure TMlekoSelectFirmForBlankDlg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if Query.FieldValues['Accept'] = null then
  Meko_Blanc_Price.BLANC_PRICE.Y_N_Label.Caption:='' else
  Meko_Blanc_Price.BLANC_PRICE.Y_N_Label.Caption:=Query.FieldValues['Accept'];
end;






initialization
  RegisterClass(TMlekoSelectFirmForBlankDlg);

finalization
  UnRegisterClass(TMLEKOSELECTFIRMFORBLANKDLG);

end.
