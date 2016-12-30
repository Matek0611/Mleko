unit Dump;

interface

uses
  Classes, SysUtils, Db, Windows, Messages, Graphics, 
  Controls, Forms, Dialogs, Buttons, DBCtrls, ExtCtrls, 
  Grids, DBGrids, StdCtrls, ToolWin, ComCtrls, SdacVcl,
  MemDS, DBAccess, MSAccess, MSDump, DADump, DemoFrame;

type
  TDumpFrame = class(TDemoFrame)
    MSDump: TMSDump;
    meSQL: TMemo;
    Panel2: TPanel;
    Panel3: TPanel;
    btBackup: TSpeedButton;
    btBackupSQL: TSpeedButton;
    btRestore: TSpeedButton;
    Panel6: TPanel;
    edTbNames: TEdit;
    Label1: TLabel;
    Panel7: TPanel;
    Label2: TLabel;
    edQuery: TEdit;
    pnResult: TPanel;
    ProgressBar: TProgressBar;
    lbTableName: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel4: TPanel;
    cbIdentityInsert: TCheckBox;
    Panel5: TPanel;
    cbQuoteNames: TCheckBox;
    procedure btBackupClick(Sender: TObject);
    procedure btRestoreClick(Sender: TObject);
    procedure btBackupSQLClick(Sender: TObject);
    procedure MSDumpRestoreProgress(Sender: TObject; Percent: Integer);
    procedure MSDumpBackupProgress(Sender: TObject; TableName: String;
      ObjectNum, TableCount, Percent: Integer);
  private
    { Private declarations }
  public
    procedure SetOptions;

    // Demo management
    procedure Initialize; override;
  end;

var
  fmMSDumpDemo: TDumpFrame;

implementation

{$IFDEF CLR}
{$R *.nfm}
{$ENDIF}
{$IFDEF WIN32}
{$R *.dfm}
{$ENDIF}
{$IFDEF LINUX}
{$R *.xfm}
{$ENDIF}

uses
  SdacDemoForm;

procedure TDumpFrame.SetOptions;
begin
  MSDump.TableNames := edTbNames.Text;
  MSDump.Options.IdentityInsert := cbIdentityInsert.Checked;
  MSDump.Options.QuoteNames := cbQuoteNames.Checked;
end;

procedure TDumpFrame.btBackupClick(Sender: TObject);
begin
  try
    SetOptions;
    MSDump.SQL.Clear;
    MSDump.Backup;
  finally
    ProgressBar.Position := 0;
    lbTableName.Caption := '';
    lbTableName.Parent.Repaint;
    meSQL.Lines.Assign(MSDump.SQL);
  end;
end;

procedure TDumpFrame.btRestoreClick(Sender: TObject);
begin
  ProgressBar.Position := 0;
  lbTableName.Caption := '';
  lbTableName.Parent.Repaint;
  MSDump.SQL.Assign(meSQL.Lines);
  try
    MSDump.Restore;
  finally
    ProgressBar.Position := 0;
  end;
end;

procedure TDumpFrame.btBackupSQLClick(Sender: TObject);
begin
  try
    SetOptions;
    MSDump.BackupQuery(edQuery.Text);
  finally
    ProgressBar.Position := 0;
    lbTableName.Caption := '';
    lbTableName.Parent.Repaint;
    meSQL.Lines.Assign(MSDump.SQL);
  end;
end;

procedure TDumpFrame.MSDumpRestoreProgress(Sender: TObject; Percent: Integer);
begin
  ProgressBar.Position := Percent;
end;

procedure TDumpFrame.MSDumpBackupProgress(Sender: TObject;
  TableName: String; ObjectNum, TableCount, Percent: Integer);
begin
  if lbTableName.Caption <> TableName then begin
    lbTableName.Caption := TableName;
    pnResult.Repaint;
  end;
  ProgressBar.Position := Percent;
end;

// Demo management
procedure TDumpFrame.Initialize;
begin
  MSDump.Connection := Connection as TMSConnection;
end;

end.
