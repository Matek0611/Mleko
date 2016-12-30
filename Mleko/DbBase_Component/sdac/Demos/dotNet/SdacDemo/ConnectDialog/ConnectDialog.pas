unit ConnectDialog;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, MemDS, Grids, DBGrids, DBCtrls, StdCtrls, ExtCtrls, DBAccess,
  MSAccess, SdacVcl, Buttons, DemoFrame,
  InheritedConnectForm, MyConnectForm;

type
  TConnectDialogFrame = class(TDemoFrame)
    DataSource: TDataSource;
    MSQuery: TMSQuery;
    DBGrid: TDBGrid;
    ToolBar: TPanel;
    Panel1: TPanel;
    btOpen: TSpeedButton;
    btClose: TSpeedButton;
    DBNavigator: TDBNavigator;
    Panel3: TPanel;
    rbInherited: TRadioButton;
    rbMy: TRadioButton;
    rbDefault: TRadioButton;
    procedure btOpenClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure rbDefaultClick(Sender: TObject);
    procedure rbMyClick(Sender: TObject);
    procedure rbInheritedClick(Sender: TObject);
  private
    { Private declarations }
  public
    destructor Destroy; override;
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

destructor TConnectDialogFrame.Destroy;
begin
  MSQuery.Connection.ConnectDialog.DialogClass := '';
  inherited;
end;


procedure TConnectDialogFrame.btOpenClick(Sender: TObject);
begin
  MSQuery.Open;
end;

procedure TConnectDialogFrame.btCloseClick(Sender: TObject);
begin
  MSQuery.Close;
end;

procedure TConnectDialogFrame.rbDefaultClick(Sender: TObject);
begin
  MSQuery.Connection.ConnectDialog.DialogClass := '';
end;

procedure TConnectDialogFrame.rbMyClick(Sender: TObject);
begin                                                         
  MSQuery.Connection.ConnectDialog.DialogClass := 'TfmMyConnect';
end;

procedure TConnectDialogFrame.rbInheritedClick(Sender: TObject);
begin
  MSQuery.Connection.ConnectDialog.DialogClass := 'TfmInheritedConnect';
end;

// Demo management
procedure TConnectDialogFrame.Initialize;
begin
  inherited;
  MSQuery.Connection := Connection as TMSConnection;
end;

procedure TConnectDialogFrame.SetDebug(Value: boolean);
begin
  MSQuery.Debug:= Value;
end;

end.

