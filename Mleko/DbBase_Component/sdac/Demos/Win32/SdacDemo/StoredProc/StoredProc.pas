unit StoredProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, ExtCtrls, Db, Grids, DBGrids,  StdCtrls, ToolWin,
  ComCtrls, MemDS, DBAccess, MSAccess, SdacVcl,
  Buttons, DemoFrame, SdacDemoForm, DAScript, MSScript;

type
  TStoredProcFrame = class(TDemoFrame)
    DataSource: TDataSource;
    MSStoredProc: TMSStoredProc;
    DBGrid: TDBGrid;
    ToolBar: TPanel;
    Panel1: TPanel;
    btOpen: TSpeedButton;
    btClose: TSpeedButton;
    btPrepare: TSpeedButton;
    btUnPrepare: TSpeedButton;
    btExecute: TSpeedButton;
    btPrepareSQL: TSpeedButton;
    Panel2: TPanel;
    DBNavigator: TDBNavigator;
    Panel3: TPanel;
    Label1: TLabel;
    edStoredProcName: TComboBox;
    procedure btOpenClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure btPrepareClick(Sender: TObject);
    procedure btUnPrepareClick(Sender: TObject);
    procedure btExecuteClick(Sender: TObject);
    procedure btPrepareSQLClick(Sender: TObject);
    procedure edStoredProcNameExit(Sender: TObject);
    procedure edStoredProcNameDropDown(Sender: TObject);
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

procedure TStoredProcFrame.AssignProperties;
begin
  if Trim(MSStoredProc.StoredProcName) <> Trim(edStoredProcName.Text) then
    MSStoredProc.StoredProcName := edStoredProcName.Text;
  ShowState;  
end;

procedure TStoredProcFrame.ShowState;
var
  St: string;

  procedure AddSt(S:string);
  begin
    if St <> '' then
      St := St + ', ';
    St := St + S;
  end;

begin
  St := '';

  if MSStoredProc.Prepared then begin
    AddSt('Prepared');

    if MSStoredProc.IsQuery then
      AddSt('IsQuery');

  end;

  if MSStoredProc.Active then
    AddSt('Active')
  else
    AddSt('Inactive');

  SdacForm.StatusBar.Panels[2].Text := St;
end;

procedure TStoredProcFrame.btOpenClick(Sender: TObject);
begin
  try
    AssignProperties;
    MSStoredProc.Open;
  finally
    ShowState;
  end;
end;

procedure TStoredProcFrame.btCloseClick(Sender: TObject);
begin
  MSStoredProc.Close;
  ShowState;
end;

procedure TStoredProcFrame.btPrepareClick(Sender: TObject);
begin
  try
    AssignProperties;
    MSStoredProc.Prepare;
  finally
    ShowState;
  end;
end;

procedure TStoredProcFrame.btUnPrepareClick(Sender: TObject);
begin
  MSStoredProc.UnPrepare;
  ShowState;
end;

procedure TStoredProcFrame.btExecuteClick(Sender: TObject);
begin
  try
    AssignProperties;
    MSStoredProc.Execute;
  finally
    ShowState;
  end;
end;

procedure TStoredProcFrame.btPrepareSQLClick(Sender: TObject);
begin
  try
    AssignProperties;
    MSStoredProc.PrepareSQL;
  finally
    ShowState;
  end;
end;

procedure TStoredProcFrame.edStoredProcNameExit(Sender: TObject);
begin
  AssignProperties;
end;

procedure TStoredProcFrame.edStoredProcNameDropDown(Sender: TObject);
begin
  MSStoredProc.Connection.GetStoredProcNames(edStoredProcName.Items);
end;

// Demo management
procedure TStoredProcFrame.Initialize;
begin
  inherited;
  MSStoredProc.Connection := Connection as TMSConnection;
  edStoredProcName.Text := MSStoredProc.StoredProcName;
  ShowState;
end;

procedure TStoredProcFrame.SetDebug(Value: boolean);
begin
  MSStoredProc.Debug := Value;
end;

end.

