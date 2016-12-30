unit Sql;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, ExtCtrls, Db, Grids, DBGrids, StdCtrls, ToolWin,
  ComCtrls, MSAccess, DBAccess, SdacVcl, Buttons,
  DemoFrame, SdacDemoForm, OLEDBAccess, ActiveX;

type
  TSqlFrame = class(TDemoFrame)
    ToolBar: TPanel;
    meSQL: TMemo;
    MSSQL: TMSSQL;
    Label1: TLabel;
    Splitter1: TSplitter;
    meResult: TMemo;
    btExecute: TSpeedButton;
    btBreakExec: TSpeedButton;
    Panel1: TPanel;
    cbNonBlocking: TCheckBox;
    btExecInThread: TSpeedButton;
    btExecuteForXml: TSpeedButton;
    procedure btExecuteClick(Sender: TObject);
    procedure meSQLExit(Sender: TObject);
    procedure MSSQLAfterExecute(Sender: TObject; Result: Boolean);
    procedure cbNonBlockingClick(Sender: TObject);
    procedure btBreakExecClick(Sender: TObject);
    procedure btExecInThreadClick(Sender: TObject);
    procedure btExecuteForXmlClick(Sender: TObject);
  private
    { Private declarations }
    FExecThread: TThread;
    procedure AssignProperties;
    procedure TerminateThread;
  public
    destructor Destroy; override;
    // Demo management
    procedure Initialize; override;
    procedure SetDebug(Value: boolean); override;
  end;

  { TExecThread }

  TExecThread = class(TThread)
  protected
    procedure Execute; override;
    procedure Terminate;
  end;

var
  SqlFrame: TSqlFrame;

implementation

uses ComObj;

{$IFDEF CLR}
{$R *.nfm}
{$ENDIF}
{$IFDEF WIN32}
{$R *.dfm}
{$ENDIF}

procedure LogError(EMessage: string);
begin
  SqlFrame.meResult.Lines.Add('An error with the following message has beein raised during query execution:' + #13#10 + EMessage);
end;

{ TExecThread }

procedure TExecThread.Execute;
begin
  CoInitialize(nil);
  if SqlFrame.MSSQL <> nil then
    try
      SqlFrame.btBreakExec.Enabled := True;
      SqlFrame.MSSQL.Execute;
    except
      on e: Exception do begin
        LogError(e.Message);
      end;
    end;
  Terminate;
end;

procedure TExecThread.Terminate;
begin
  inherited;
  SqlFrame.btBreakExec.Enabled := False;
  CoUninitialize;
end;

{ TSqlFrame }

procedure TSqlFrame.AssignProperties;
begin
  if Trim(MSSQL.SQL.Text) <> Trim(meSQL.Lines.Text) then
    MSSQL.SQL.Assign(meSQL.Lines);
  MSSQL.NonBlocking := cbNonBlocking.Checked;
  if MSSQL.NonBlocking then
    btBreakExec.Enabled := False;
end;

procedure TSqlFrame.TerminateThread;
begin
  if FExecThread <> nil then begin
    FExecThread.Terminate;
    MSSQL.BreakExec;
    FExecThread.WaitFor;
    FExecThread.Free;
    FExecThread := nil;
  end;
end;

procedure TSqlFrame.btExecuteClick(Sender: TObject);
begin
  AssignProperties;
  meResult.Lines.Clear;
  SdacForm.StatusBar.Panels[2].Text := 'Executing...';
  if MSSQL.NonBlocking then
    btBreakExec.Enabled := True;
  MSSQL.Execute;
end;

procedure TSqlFrame.meSQLExit(Sender: TObject);
begin
  AssignProperties;
end;

procedure TSqlFrame.MSSQLAfterExecute(Sender: TObject; Result: Boolean);
var
  s: string;
  i: integer;
begin
  btBreakExec.Enabled := False;
  if btBreakExec.Enabled then
    btBreakExec.Enabled := False;
  if Result then
    s := 'Success' + '  (' + IntToStr(MSSQL.RowsAffected) + ' rows processed)'
  else
    s := 'Execution failed';
  SdacForm.StatusBar.Panels[2].Text := s;

  for i := 0 to MSSQL.Params.Count-1 do
    meResult.Lines.Add(MSSQL.Params[i].Name + ' = ' + MSSQL.Params[i].AsString);

  meResult.Lines.Add(s);
end;

procedure TSqlFrame.cbNonBlockingClick(Sender: TObject);
begin
  try
    if cbNonBlocking.Checked and(MSSQL.Connection.ClientVersion[1] <> '9') then begin
      cbNonBlocking.Checked := False;
      MessageDlg('Note, NonBlocking mode is available only with SQL Native Client installed', mtInformation, [mbOK], 0);
    end;
    MSSQL.NonBlocking := cbNonBlocking.Checked;
  finally
    cbNonBlocking.Checked := MSSQL.NonBlocking;
    btExecInThread.Enabled := not cbNonBlocking.Checked;
  end;
end;

procedure TSqlFrame.btBreakExecClick(Sender: TObject);
begin
  MSSQL.BreakExec;
end;

destructor TSqlFrame.Destroy;
begin
  TerminateThread;
  if (self <> nil) and MSSQL.Executing then
    MSSQL.BreakExec;

  inherited;
end;

procedure TSqlFrame.btExecInThreadClick(Sender: TObject);
begin
  MSSQL.SQL := meSQL.Lines;
  SDACForm.StatusBar.Panels[2].Text := 'Executing...';
  meResult.Lines.Clear;
  TerminateThread;
  FExecThread := TExecThread.Create(False)
end;

// Demo management
procedure TSqlFrame.Initialize;
begin
  inherited;
  
  FExecThread := nil;
  SqlFrame := Self;
  MSSQL.Connection := Connection as TMSConnection;
  meSQL.Lines := MSSQL.SQL;
end;

procedure TSqlFrame.SetDebug(Value: boolean);
begin
  MSSQL.Debug := Value;
end;

procedure TSqlFrame.btExecuteForXmlClick(Sender: TObject);
var
  Output: string;
begin
  AssignProperties;
  meResult.Lines.Clear;
  SdacForm.StatusBar.Panels[2].Text := 'Executing...';
  if MSSQL.NonBlocking then
    btBreakExec.Enabled := True;
  MSSQL.ExecuteForXML(Output);
  meResult.Lines.Add('Output:');
  meResult.Lines.Add(Output);
end;

end.
