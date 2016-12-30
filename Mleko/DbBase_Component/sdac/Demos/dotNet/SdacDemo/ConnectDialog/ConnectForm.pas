
//////////////////////////////////////////////////
//  MS SQL Server Data Access Components
//  Copyright © 1998-2001 Core Lab. All right reserved.
//  Connect Form
//////////////////////////////////////////////////

unit ConnectForm;
interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBAccess, OLEDBAccess, OLEDBIntf, OLEDBC;

type
  TConnectForm = class(TForm)
    Panel: TPanel;
    lbUsername: TLabel;
    lbPassword: TLabel;
    lbServer: TLabel;
    edUsername: TEdit;
    btConnect: TButton;
    btCancel: TButton;
    edPassword: TEdit;
    edServer: TComboBox;
    procedure btConnectClick(Sender: TObject);

  private
    FConnectDialog: TCustomConnectDialog;
    FRetries: integer;
    FOldCreateOrder: boolean;
    FRetry: boolean;

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

{$IFDEF CLR}
{$R *.nfm}
{$ENDIF}
{$IFDEF WIN32}
{$R *.dfm}
{$ENDIF}

procedure TConnectForm.DoInit;
begin
  FRetry := False;
  FRetries := FConnectDialog.Retries;
  Caption := FConnectDialog.Caption;

  with FConnectDialog do begin
    lbUsername.Caption := UsernameLabel;
    lbPassword.Caption := PasswordLabel;
    lbServer.Caption := ServerLabel;
    btConnect.Caption := ConnectButton;
    btCancel.Caption := CancelButton;

    FConnectDialog.GetServerList(edServer.Items);
    edUsername.Text := Connection.Username;
    edPassword.Text := Connection.Password;
    edServer.Text := Connection.Server;

    if (edUsername.Text <> '') and (edPassword.Text = '') then
      ActiveControl := edPassword;
  end;
end;

procedure TConnectForm.DoConnect;
begin
  FConnectDialog.Connection.Password := edPassword.Text;
  FConnectDialog.Connection.Server := edServer.Text;
  FConnectDialog.Connection.UserName := edUsername.Text;
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

procedure TConnectForm.SetConnectDialog(Value: TCustomConnectDialog);
begin
  FConnectDialog := Value;
  DoInit;
end;

procedure TConnectForm.btConnectClick(Sender: TObject);
begin
  DoConnect;
end;

initialization
  if GetClass('TConnectForm') = nil then
    Classes.RegisterClass(TConnectForm);
//    Classes.GroupDescendentsWith(TConnectForm, TForm);  
end.

