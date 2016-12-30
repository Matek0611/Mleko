unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, ExtCtrls, Grids, DBGrids, StdCtrls, ToolWin, ComCtrls,
  DBAccess, DAScript, Buttons, MSAccess, MSScript, OLEDBAccess, DB, MemDS, SDACVcl;

type
  TfmMain = class(TForm)
    DBGrid: TDBGrid;
    DataSource: TDataSource;
    ToolBar: TPanel;
    StatusBar: TStatusBar;
    MSTable: TMSTable;
    scCreate: TMSScript;
    Panel1: TPanel;
    btOpen: TSpeedButton;
    btClose: TSpeedButton;
    DBNavigator: TDBNavigator;
    OpenDialog: TOpenDialog;
    MSConnection: TMSConnection;
    btDisconnect: TSpeedButton;
    btConnect: TSpeedButton;
    Panel2: TPanel;
    edDBName: TEdit;
    Label1: TLabel;
    pnTableName: TPanel;
    lbTableName: TLabel;
    cbTableName: TComboBox;
    SpeedButton2: TSpeedButton;
    Panel3: TPanel;
    Panel4: TPanel;
    btDrop: TSpeedButton;
    btCreate: TSpeedButton;
    cbDebug: TCheckBox;
    scDrop: TMSScript;
    procedure btOpenClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MSConnectionAfterConnect(Sender: TObject);
    procedure MSConnectionAfterDisconnect(Sender: TObject);
    procedure btConnectClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btDisconnectClick(Sender: TObject);
    procedure btCreateClick(Sender: TObject);
    procedure btDropClick(Sender: TObject);
    procedure cbDebugClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbTableNameDropDown(Sender: TObject);
    procedure scError(Sender: TObject; E: Exception; SQL: String;
      var Action: TErrorAction);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    Closing: boolean;
    procedure ShowState;
    procedure CheckConnected;
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

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

{$IFNDEF VER130}
{$IFNDEF VER140}
{$IFNDEF CLR}
  {$DEFINE XPMAN}
  {$R WindowsXP.res}
{$ENDIF}
{$ENDIF}
{$ENDIF}

{$IFDEF XPMAN}
uses
  UxTheme;
{$ENDIF}

procedure TfmMain.ShowState;
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

  if MSTable.Active then
    AddSt('Active')
  else
    AddSt('Inactive');

  StatusBar.Panels[0].Text:= St;
end;

procedure TfmMain.CheckConnected;
begin
  try
    MSConnection.Database := edDBName.Text;

    if not FileExists(MSConnection.Database) then
      if MessageDlg('Database file ' + MSConnection.Database + ' does not exists.'
        + #13#10+'Create database with this name?', mtConfirmation, [mbYes,mbNo,mbCancel], 0) <> mrYes then
        Exit;

    MSConnection.Open; // database file will be created automatically if it does not exist
  finally
    ShowState;
  end;
end;

procedure TfmMain.btOpenClick(Sender: TObject);
begin
  try
    MSTable.TableName := cbTableName.Text;
    MSTable.Open;
  finally
    ShowState;
  end;
end;

procedure TfmMain.btCloseClick(Sender: TObject);
begin
  MSTable.Close;
  ShowState;
end;

procedure TfmMain.FormShow(Sender: TObject);
begin
  ShowState;
end;

procedure TfmMain.MSConnectionAfterConnect(Sender: TObject);
begin
  btConnect.Enabled := False;
  btDisconnect.Enabled := True;
  cbTableName.Enabled := True;
  lbTableName.Enabled := True;
  btOpen.Enabled := True;
  btClose.Enabled := True;
  MSConnection.GetTableNames(cbTableName.Items);

  if cbTableName.Items.Count > 0 then
    cbTableName.ItemIndex := 0;
end;

procedure TfmMain.MSConnectionAfterDisconnect(Sender: TObject);
begin
  if Closing then                   // to prevent AV on form close
    Exit;

  btConnect.Enabled := True;
  btDisconnect.Enabled := False;
  cbTableName.Enabled := False;
  lbTableName.Enabled := False;
  btOpen.Enabled := False;
  btClose.Enabled := False;
end;

procedure TfmMain.btConnectClick(Sender: TObject);
begin
  CheckConnected;
end;

procedure TfmMain.SpeedButton2Click(Sender: TObject);
begin
  if OpenDialog.Execute then
    edDBName.Text := OpenDialog.FileName;
end;

procedure TfmMain.btDisconnectClick(Sender: TObject);
begin
  MSConnection.Close;
end;

procedure TfmMain.btCreateClick(Sender: TObject);
begin
  CheckConnected;
  scCreate.Execute;
end;

procedure TfmMain.btDropClick(Sender: TObject);
begin
  CheckConnected;
  scDrop.Execute;
end;

procedure TfmMain.cbDebugClick(Sender: TObject);
begin
  MSTable.Debug := cbDebug.Checked;
  scCreate.Debug := cbDebug.Checked;
  scDrop.Debug := cbDebug.Checked;
end;

procedure TfmMain.FormCreate(Sender: TObject);
{$IFDEF XPMAN}
  procedure UpdateStyle(Control: TWinControl);
  var
    Panel: TPanel;
    i: integer;
  begin
    for i := 0 to Control.ControlCount - 1 do begin
      if Control.Controls[i] is TSpeedButton then
        TSpeedButton(Control.Controls[i]).Flat := False
      else
      if Control.Controls[i] is TDBNavigator then
        TDBNavigator(Control.Controls[i]).Flat := False;
      if Control.Controls[i] is TWinControl then begin
        if (Control.Controls[i] is TPanel) then begin
            Panel := TPanel(Control.Controls[i]);
            Panel.ParentBackground := False;
            Panel.Color := clBtnFace;
          end;
        UpdateStyle(TWinControl(Control.Controls[i]));
      end;
    end;
  end;
{$ENDIF}
begin
  cbDebugClick(self);
  Closing := False;
{$IFDEF XPMAN}
  if UseThemes then
    UpdateStyle(Self);
{$ENDIF}
end;

procedure TfmMain.cbTableNameDropDown(Sender: TObject);
begin
  MSConnection.GetTableNames(cbTableName.Items);
end;

procedure TfmMain.scError(Sender: TObject; E: Exception; SQL: String;
  var Action: TErrorAction);
begin
  if MessageDlg('An error with the following message ocurred:' + #13#10
    + E.Message , mtError, [mbAbort,mbIgnore], 0) = mrAbort then
    Action := eaAbort
  else
    Action := eaContinue;

end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Closing := True;
end;

end.

