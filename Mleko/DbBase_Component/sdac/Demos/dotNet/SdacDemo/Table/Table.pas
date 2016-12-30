unit Table;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, ExtCtrls, Db, Grids, DBGrids, StdCtrls, ToolWin,
  ComCtrls, MemDS, DBAccess, MSAccess, SdacVcl,
  Buttons, DemoFrame, SdacDemoForm;

type
  TTableFrame = class(TDemoFrame)
    DataSource: TDataSource;
    MSTable: TMSTable;
    DBGrid: TDBGrid;
    ToolBar: TPanel;
    Panel3: TPanel;
    btOpen: TSpeedButton;
    btClose: TSpeedButton;
    btPrepare: TSpeedButton;
    btUnPrepare: TSpeedButton;
    btExecute: TSpeedButton;
    DBNavigator: TDBNavigator;
    Panel7: TPanel;
    Label3: TLabel;
    edOrderFields: TEdit;
    Panel5: TPanel;
    Label1: TLabel;
    edTableName: TComboBox;
    Panel8: TPanel;
    Label4: TLabel;
    edFilterSQL: TEdit;
    procedure btOpenClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure btPrepareClick(Sender: TObject);
    procedure btUnPrepareClick(Sender: TObject);
    procedure btExecuteClick(Sender: TObject);
    procedure edTableNameExit(Sender: TObject);
    procedure edTableNameDropDown(Sender: TObject);
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

procedure TTableFrame.AssignProperties;
begin
  try
    if Trim(MSTable.TableName) <> Trim(edTableName.Text) then
      MSTable.TableName := edTableName.Text;

    MSTable.FilterSQL := edFilterSQL.Text;

    try
      MSTable.OrderFields:= edOrderFields.Text;
    except
      edOrderFields.SetFocus;
      raise;
    end;
  finally
    ShowState;
  end;

end;

procedure TTableFrame.ShowState;
var
  St: string;

  procedure AddSt(S: string);
  begin
    if St <> '' then
      St:= St + ', ';
    St:= St + S;
  end;

begin
  St:= '';

  if MSTable.Prepared then begin
    AddSt('Prepared');

    if MSTable.IsQuery then
      AddSt('IsQuery');
  end;

  if MSTable.Active then
    AddSt('Active')
  else
    AddSt('Inactive');

  SdacForm.StatusBar.Panels[2].Text:= St;
end;

procedure TTableFrame.btOpenClick(Sender: TObject);
begin
  try
    AssignProperties;
    MSTable.Open;
  finally
    ShowState;
  end;
end;

procedure TTableFrame.btCloseClick(Sender: TObject);
begin
  MSTable.Close;
  ShowState;
end;

procedure TTableFrame.btPrepareClick(Sender: TObject);
begin
  try
    AssignProperties;
    MSTable.Prepare;
  finally
    ShowState;
  end;
end;

procedure TTableFrame.btUnPrepareClick(Sender: TObject);
begin
  MSTable.UnPrepare;
  ShowState;
end;

procedure TTableFrame.btExecuteClick(Sender: TObject);
begin
  try
    AssignProperties;
    MSTable.Execute;
  finally
    ShowState;
  end;
end;

procedure TTableFrame.edTableNameExit(Sender: TObject);
begin
  AssignProperties;
end;

procedure TTableFrame.edTableNameDropDown(Sender: TObject);
begin
  MSTable.Connection.GetTableNames(edTableName.Items);
end;

// Demo management
procedure TTableFrame.Initialize;
begin
  inherited;
  MSTable.Connection := Connection as TMSConnection;
  edTableName.Text:= MSTable.TableName;
  edOrderFields.Text:= MSTable.OrderFields;
  ShowState;
end;

procedure TTableFrame.SetDebug(Value: boolean);
begin
  MSTable.Debug:= Value;
end;

end.

