
//////////////////////////////////////////////////
//  SQL Server Data Access Components
//  Copyright © 1998-2007 Core Lab. All right reserved.
//  Connect Form
//////////////////////////////////////////////////

{$IFNDEF CLR}

unit MSConnectForm;
{$ENDIF}
interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ExtCtrls, DBAccess, OLEDBAccess, OLEDBC, MSAccess, TypInfo;

type
  TMSConnectForm = class(TForm)
    Panel: TPanel;
    lbUsername: TLabel;
    lbPassword: TLabel;
    lbServer: TLabel;
    edUsername: TEdit;
    btConnect: TButton;
    btCancel: TButton;
    edPassword: TEdit;
    edServer: TComboBox;
    edDatabase: TComboBox;
    lbDatabase: TLabel;
    procedure btConnectClick(Sender: TObject);
    procedure edServerDropDown(Sender: TObject);
    procedure edDatabaseDropDown(Sender: TObject);

  private
    FConnectDialog: TCustomConnectDialog;
    FRetries: integer;
    FOldCreateOrder: boolean;
    FRetry: boolean;

    FListGot: boolean;

    procedure SetConnectDialog(Value: TCustomConnectDialog);

  protected
    procedure DoInit; virtual;
    procedure DoConnect; virtual;

  public

  published
    property ConnectDialog: TCustomConnectDialog read FConnectDialog write SetConnectDialog;

    property OldCreateOrder: boolean read FOldCreateOrder write FOldCreateOrder;
  end;

implementation

{$IFDEF IDE}
{$R *.dfm}
{$ENDIF}
{$R MSConnectForm.dfm}

procedure TMSConnectForm.DoInit;
var
  PropInfo: PPropInfo;
begin
  FRetry := False;
  FRetries := FConnectDialog.Retries;
  Caption := FConnectDialog.Caption;
  FListGot := False;

  with FConnectDialog do begin
    lbUsername.Caption := UsernameLabel;
    lbPassword.Caption := PasswordLabel;
    lbServer.Caption := ServerLabel;
    btConnect.Caption := ConnectButton;
    btCancel.Caption := CancelButton;

    edUsername.Text := Connection.Username;
    edPassword.Text := Connection.Password;
    edServer.Text := Connection.Server;

    if (edUsername.Text <> '') and (edPassword.Text = '') then
      ActiveControl := edPassword;
  end;

  PropInfo := GetPropInfo(FConnectDialog, 'DatabaseLabel');
  if PropInfo <> nil then
    lbDatabase.Caption := GetStrProp(FConnectDialog, PropInfo);
  if FConnectDialog.Connection is TCustomMSConnection then
    edDatabase.Text := TCustomMSConnection(FConnectDialog.Connection).Database;
  if TCustomMSConnection(FConnectDialog.Connection).Options.Provider = prCompact then begin
    lbUsername.Enabled := False;
    edUsername.Text := '';
    edUsername.Enabled := False;
    lbServer.Enabled := False;
    edServer.Text := '';
    edServer.Enabled := False;
    edDatabase.Style := csSimple;
  end;
end;

procedure TMSConnectForm.DoConnect;
begin
  FConnectDialog.Connection.Password := edPassword.Text;
  FConnectDialog.Connection.Server := edServer.Text;
  FConnectDialog.Connection.UserName := edUsername.Text;
  if (FConnectDialog.Connection is TCustomMSConnection) then
    TCustomMSConnection(FConnectDialog.Connection).Database := edDatabase.Text;
  try
    FConnectDialog.Connection.PerformConnect(FRetry);
    ModalResult := mrOk;
  except
    on E: EMSError do begin
      Dec(FRetries);
      FRetry := True;
      if FRetries = 0 then
        ModalResult := mrCancel;

      if E.MSSQLErrorCode <= NE_MAX_NETERROR then
        ActiveControl := edServer
      else
      if E.OLEDBErrorCode = DB_SEC_E_AUTH_FAILED then
        if ActiveControl <> edUsername then
          ActiveControl := edPassword;
      raise;
    end
    else
      raise;
  end;
end;

procedure TMSConnectForm.SetConnectDialog(Value: TCustomConnectDialog);
begin
  FConnectDialog := Value;
  DoInit;
end;

procedure TMSConnectForm.btConnectClick(Sender: TObject);
begin
  DoConnect;
end;

procedure TMSConnectForm.edServerDropDown(Sender: TObject);
var
  OldCursor: TCursor;
begin
  if FListGot then
    Exit;
    
  FListGot := True;
  OldCursor := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  try
    FConnectDialog.GetServerList(edServer.Items);
  finally
    Screen.Cursor := OldCursor;
  end;
end;

procedure TMSConnectForm.edDatabaseDropDown(Sender: TObject);
var
  OldCursor: TCursor;
  OldLoginPrompt: boolean;
  OldConnected: boolean;
begin
  if not (FConnectDialog.Connection is TMSConnection) then
    Exit;

  edDatabase.Items.Clear;
  OldLoginPrompt := FConnectDialog.Connection.LoginPrompt;
  OldCursor := Screen.Cursor;
  OldConnected := FConnectDialog.Connection.Connected;
  Screen.Cursor := crSQLWait;

  FConnectDialog.Connection.Password := edPassword.Text;
  FConnectDialog.Connection.Server := edServer.Text;
  FConnectDialog.Connection.UserName := edUsername.Text;

  try
    FConnectDialog.Connection.LoginPrompt := False;
    GetDatabasesList(TMSConnection(FConnectDialog.Connection), edDatabase.Items);
  finally
    FConnectDialog.Connection.Connected := OldConnected;
    FConnectDialog.Connection.LoginPrompt := OldLoginPrompt;
    Screen.Cursor := OldCursor;
  end;
end;

initialization
{  if GetClass('TMSConnectForm') = nil then
    Classes.RegisterClass(TMSConnectForm);}
end.

