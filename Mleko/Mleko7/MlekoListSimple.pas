unit MlekoListSimple;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MSAccess, Menus, citComponentProps, DB, MemDS,
  DBAccess, COMPSQLBuilder, ActnList, citDbGrid, ExtCtrls,
  comp_TargetFilter_Panel, ComCtrls, ToolWin, CFLMLKMDIChild, 
  cxGraphics, cxDataStorage, cxEdit,
  cxDBData, cxTextEdit, cxCalc, cxSpinEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, StdCtrls, cxStyles, cxCustomData,
  cxFilter, cxData;

type
  TMlekoListSimpleForm = class(TCFLMLKMDIChildForm)
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Label1: TLabel;
    Label2: TLabel;
    DBGrid: TcxGrid;
    DBGridDBTableView1: TcxGridDBTableView;
    DBGridLevel1: TcxGridLevel;
    DS: TDataSource;
    Query: TMSQuery;
    DBGridDBTableView1ID: TcxGridDBColumn;
    DBGridDBTableView1NAME: TcxGridDBColumn;
    ActionViewRefresh: TAction;
    ToolButton1: TToolButton;
    procedure ActionViewRefreshExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  protected
    GridDataSetAfterRefresh: TDataSetNotifyEvent;
    GridDataSetAfterOpen: TDataSetNotifyEvent;
    GridDataSetAfterScroll: TDataSetNotifyEvent;
    Params:TParams;
    KeyFields:TStrings;
    procedure OnSetKeyFieds; virtual;
  public
    class procedure ShowForm(var aParams:TParams);
  end;

var
  MlekoListSimpleForm: TMlekoListSimpleForm;

implementation

uses data,UtilsCommon;

{$R *.dfm}

class procedure TMlekoListSimpleForm.ShowForm(var aParams:TParams);
begin
  With Create(Application) do
  begin
     Params:= aParams;
     OnSetKeyFieds;
     ActionViewRefresh.Execute;
  end;
end;


procedure TMlekoListSimpleForm.ActionViewRefreshExecute(
  Sender: TObject);
begin
  inherited;
  OnViewRefresh(TDataSet(Query),GridDataSetAfterRefresh,GridDataSetAfterOpen,GridDataSetAfterScroll,KeyFields);
end;

procedure TMlekoListSimpleForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if Assigned(KeyFields) then KeyFields.Free;
end;

procedure TMlekoListSimpleForm.OnSetKeyFieds;
begin
//virtual;
end;

procedure TMlekoListSimpleForm.FormCreate(Sender: TObject);
begin
  inherited;
  KeyFields:=TStringList.Create;
end;

end.
