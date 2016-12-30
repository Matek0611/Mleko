unit UpdateSQL;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, ExtCtrls, Db, Grids, DBGrids,  StdCtrls, ToolWin,
  ComCtrls, MemDS, DBAccess, MSAccess, SdacVcl,
  Buttons, DemoFrame, SdacDemoForm;

type
  TUpdateSQLFrame = class(TDemoFrame)
    MSQuery: TMSQuery;
    DataSource: TDataSource;
    MSUpdateSQL: TMSUpdateSQL;
    Panel5: TPanel;
    Panel2: TPanel;
    btOpen: TSpeedButton;
    btClose: TSpeedButton;
    btPrepare: TSpeedButton;
    btUnPrepare: TSpeedButton;
    btExecute: TSpeedButton;
    meSQL: TMemo;
    Splitter1: TSplitter;
    Panel3: TPanel;
    Panel1: TPanel;
    btRefreshRecord: TSpeedButton;
    DBNavigator1: TDBNavigator;
    DBGrid: TDBGrid;
    DeleteSQL: TMSSQL;
    InsertSQL: TMSSQL;
    ModifyQuery: TMSQuery;
    RefreshQuery: TMSQuery;
    Panel4: TPanel;
    cbDeleteObject: TCheckBox;
    cbInsertObject: TCheckBox;
    cbModifyObject: TCheckBox;
    cbRefreshObject: TCheckBox;
    procedure btOpenClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure btPrepareClick(Sender: TObject);
    procedure btUnPrepareClick(Sender: TObject);
    procedure btExecuteClick(Sender: TObject);
    procedure meSQLExit(Sender: TObject);
    procedure btRefreshRecordClick(Sender: TObject);
    procedure cbDeleteObjectClick(Sender: TObject);
  private
    { Private declarations }
    procedure ShowState;
    procedure AssignProperties;
  public
    // Demo management
    procedure Initialize; override;
    procedure SetDebug(Value: boolean); override;
  end;

implementation

{$IFDEF CLR}
{$R *.nfm}
{$ENDIF}
{$IFDEF WIN32}
{$R *.dfm}
{$ENDIF}

procedure TUpdateSQLFrame.ShowState;
var
  St:string;

  procedure AddSt(S:string);
  begin
    if St <> '' then
      St:= St + ', ';
    St:= St + S;
  end;

begin
  St:= '';

  if MSQuery.Prepared then begin
    AddSt('Prepared');

    if MSQuery.IsQuery then
      AddSt('IsQuery');
  end;

  if MSQuery.Active then
    AddSt('Active')
  else
    AddSt('Inactive');

  if MSQuery.Executing then
    AddSt('Executing');

  if MSQuery.Fetching then
    AddSt('Fetching');

  SdacForm.StatusBar.Panels[0].Text:= St;
end;

procedure TUpdateSQLFrame.AssignProperties;
begin
  if MSQuery.SQL.Text <> meSQL.Lines.Text then
    MSQuery.SQL.Assign(meSQL.Lines);
end;

procedure TUpdateSQLFrame.meSQLExit(Sender: TObject);
begin
  if Trim(MSQuery.SQL.Text) <> Trim(meSQL.Lines.Text) then
    MSQuery.SQL.Text:= meSQL.Lines.Text;
  ShowState;
end;

procedure TUpdateSQLFrame.btOpenClick(Sender: TObject);
begin
  try
    AssignProperties;
    MSQuery.Open;
  finally
    ShowState;
  end;
end;

procedure TUpdateSQLFrame.btCloseClick(Sender: TObject);
begin
  MSQuery.Close;
  ShowState;
end;

procedure TUpdateSQLFrame.btPrepareClick(Sender: TObject);
begin
  try
    AssignProperties;
    MSQuery.Prepare;
  finally
    ShowState;
  end;
end;

procedure TUpdateSQLFrame.btUnPrepareClick(Sender: TObject);
begin
  MSQuery.UnPrepare;
  ShowState;
end;

procedure TUpdateSQLFrame.btExecuteClick(Sender: TObject);
begin
  try
    AssignProperties;  
    MSQuery.Execute;
  finally
    ShowState;
  end;
end;

procedure TUpdateSQLFrame.btRefreshRecordClick(Sender: TObject);
begin
  MSQuery.RefreshRecord;
end;

// Demo management
procedure TUpdateSQLFrame.Initialize;
begin
  inherited;
  MSQuery.Connection := Connection as TMSConnection;
  meSQL.Lines.Assign(MSQuery.SQL);
  ShowState;
end;

procedure TUpdateSQLFrame.SetDebug(Value: boolean);
begin
  MSQuery.Debug:= Value;
end;

procedure TUpdateSQLFrame.cbDeleteObjectClick(Sender: TObject);
  function GetComponent(cbObject: TCheckBox; Component: TComponent): TComponent;
  begin
    if cbObject.Checked then
      Result := Component
    else
      Result := nil;
  end;
begin
  MSUpdateSQL.DeleteObject := GetComponent(cbDeleteObject, DeleteSQL);
  MSUpdateSQL.InsertObject := GetComponent(cbInsertObject, InsertSQL);
  MSUpdateSQL.ModifyObject := GetComponent(cbModifyObject, ModifyQuery);
  MSUpdateSQL.RefreshObject := GetComponent(cbRefreshObject, RefreshQuery);
end;

end.

