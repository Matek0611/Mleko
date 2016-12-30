unit Data;

interface

uses
  Classes, SysUtils, Windows, Menus, ImgList, StdCtrls, ComCtrls, Buttons,
  ExtCtrls, Graphics, Controls, Forms, DB,
  MemData, DBAccess, MSAccess, MemDS, SdacVcl, DAScript, MSScript;

type
  TDM = class(TDataModule)
    Connection: TMSConnection;
    quDetail: TMSQuery;
    quMaster: TMSQuery;
    dsMaster: TDataSource;
    dsDetail: TDataSource;
    scCreate: TMSScript;
    scDrop: TMSScript;
  private
  public
    procedure KillSession;
    function InTransaction: boolean;
    procedure StartTransaction;
    procedure RollbackTransaction;
    procedure CommitTransaction;
  end;

const
  ProductColor: TColor = $5D5DCC;

var
  DM: TDM;

implementation

{$IFDEF CLR}
{$R *.nfm}
{$ENDIF}
{$IFDEF WIN32}
{$R *.dfm}
{$ENDIF}

uses
  Main;

{ TDM }

procedure TDM.KillSession;
var
  KillConnection: TMSConnection;
  Query: TMSQuery;
  SPID: string;
begin
  Query := TMSQuery.Create(nil);
  try
    Query.Connection := Connection;
    Query.SQL.Text := 'SELECT @@SPID AS ''SPID''';
    Query.Open;
    SPID := Query.FieldByName('SPID').AsString;
  finally
    Query.Free;
  end;
  KillConnection := TMSConnection.Create(nil);
  try
    KillConnection.Server := Connection.Server;
    KillConnection.Username := Connection.Username;
    KillConnection.Password := Connection.Password;
    KillConnection.Database := Connection.Database;
    KillConnection.LoginPrompt := False;
    KillConnection.ExecSQL(Format('KILL %s', [SPID]), []);
  finally
    KillConnection.Free;
  end;
end;

function TDM.InTransaction: boolean;
begin
  Result := Connection.InTransaction;
end;

procedure TDM.StartTransaction;
begin
  Connection.StartTransaction;
end;

procedure TDM.CommitTransaction;
begin
  Connection.Commit;
end;

procedure TDM.RollbackTransaction;
begin
  Connection.Rollback;
end;

end.
