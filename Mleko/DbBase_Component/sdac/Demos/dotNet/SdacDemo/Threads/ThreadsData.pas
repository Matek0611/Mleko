unit ThreadsData;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, MemDS, MSAccess, DBAccess;

type
  TdmThreadsData = class(TDataModule)
    MSConnection: TMSConnection;
    MSQuery: TMSQuery;
    MSSQL: TMSSQL;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmThreadsData: TdmThreadsData;

implementation

{$IFDEF CLR}
{$R *.nfm}
{$ENDIF}
{$IFDEF WIN32}
{$R *.dfm}
{$ENDIF}

end.

