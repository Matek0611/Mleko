unit MyConnectForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, OLEDBIntf,
  OLEDBC, StdCtrls, Mask, ExtCtrls, Buttons,  MSAccess, OLEDBAccess, DBAccess, SdacVcl;

type
  TfmMyConnect = class(TForm)
    Panel: TPanel;
    lbUsername: TLabel;
    lbPassword: TLabel;
    lbServer: TLabel;
    edUsername: TEdit;
    edPassword: TMaskEdit;
    edServer: TComboBox;
    btConnect: TBitBtn;
    btCancel: TBitBtn;
    Bevel1: TBevel;
    edDatabase: TEdit;
    lbDatabase: TLabel;
    procedure btConnectClick(Sender: TObject);
  private
    FConnectDialog: TMSConnectDialog;
    FRetries:integer;
    FRetry: boolean;

    procedure SetConnectDialog(Value: TMSConnectDialog);

  protected
    procedure DoInit; virtual;
    procedure DoConnect; virtual;

  public

  published
    property ConnectDialog: TMSConnectDialog read FConnectDialog write SetConnectDialog;

  end;

var
  fmMyConnect: TfmMyConnect;

implementation

{$IFDEF CLR}
{$R *.nfm}
{$ENDIF}
{$IFDEF WIN32}
{$R *.dfm}
{$ENDIF}

procedure TfmMyConnect.DoInit;
begin
  FRetry := False;
  FRetries := FConnectDialog.Retries;
  Caption := FConnectDialog.Caption;

  lbUsername.Caption := FConnectDialog.UsernameLabel;
  lbPassword.Caption := FConnectDialog.PasswordLabel;
  lbServer.Caption := FConnectDialog.ServerLabel;
  btConnect.Caption := FConnectDialog.ConnectButton;
  btCancel.Caption := FConnectDialog.CancelButton;

  FConnectDialog.GetServerList(edServer.Items);
  edUsername.Text := FConnectDialog.Connection.Username;
  edPassword.Text := FConnectDialog.Connection.Password;
  edServer.Text := FConnectDialog.Connection.Server;
  edDatabase.Text := FConnectDialog.Connection.Database;

  if (edUsername.Text <> '') and (edPassword.Text = '') then
    ActiveControl := edPassword;
end;

procedure TfmMyConnect.DoConnect;
begin
  FConnectDialog.Connection.Password := edPassword.Text;
  FConnectDialog.Connection.Server := edServer.Text;
  FConnectDialog.Connection.UserName := edUsername.Text;
  FConnectDialog.Connection.Database := edDatabase.Text;
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

procedure TfmMyConnect.SetConnectDialog(Value: TMSConnectDialog);
begin
  FConnectDialog:= Value;
  DoInit;
end;

procedure TfmMyConnect.btConnectClick(Sender: TObject);
begin
  DoConnect;
end;

initialization
  if GetClass('TfmMyConnect') = nil then begin
    {$IFDEF VER6P}
    Classes.StartClassGroup(TfmMyConnect);
    {$ENDIF}
    Classes.RegisterClass(TfmMyConnect);
    {$IFDEF VER6P}
    ActivateClassGroup(TfmMyConnect);
    {$ENDIF}
  end;

end.

