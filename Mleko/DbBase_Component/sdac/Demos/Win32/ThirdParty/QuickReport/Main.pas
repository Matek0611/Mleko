unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, SdacVcl,
  ExtCtrls, QuickRpt, Db, MemDS,  StdCtrls, QRPrntr, DBAccess, MSAccess;

type
  TfmMain = class(TForm)
    MSConnection: TMSConnection;
    btPreview: TButton;
    Connect: TButton;
    Disconnect: TButton;
    procedure btPreviewClick(Sender: TObject);
    procedure ConnectClick(Sender: TObject);
    procedure DisconnectClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

uses Report1;

{$R *.DFM}

procedure TfmMain.btPreviewClick(Sender: TObject);
begin
  qrReport1.Preview;
end;

procedure TfmMain.ConnectClick(Sender: TObject);
begin
  MSConnection.Connect;
end;

procedure TfmMain.DisconnectClick(Sender: TObject);
begin
  MSConnection.Disconnect;
end;

end.

