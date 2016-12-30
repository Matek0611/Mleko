unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, ExtCtrls, Grids, DBGrids, StdCtrls, ToolWin, ComCtrls, Db, SdacVcl,
  DBTables, Wwquery, Wwdatsrc, DBAccess, MSAccess, wwSpeedButton,
  wwDBNavigator, wwclearpanel, Buttons, Wwdbigrd, Wwdbgrid, MemDS, MSIP;

type
  TfmMain = class(TForm)
    wwDBGrid1: TwwDBGrid;
    MSConnection1: TMSConnection; 
    wwDataSource1: TwwDataSource;
    wwMSQuery: TwwMSQuery;
    wwDBGrid1IButton: TwwIButton;
    ToolBar: TPanel;
    btOpen: TButton;
    btClose: TButton;
    wwDBNavigator1: TwwDBNavigator;
    wwDBNavigator1First: TwwNavButton;
    wwDBNavigator1PriorPage: TwwNavButton;
    wwDBNavigator1Prior: TwwNavButton;
    wwDBNavigator1Next: TwwNavButton;
    wwDBNavigator1NextPage: TwwNavButton;
    wwDBNavigator1Last: TwwNavButton;
    wwDBNavigator1Insert: TwwNavButton;
    wwDBNavigator1Delete: TwwNavButton;
    wwDBNavigator1Edit: TwwNavButton;
    wwDBNavigator1Post: TwwNavButton;
    wwDBNavigator1Cancel: TwwNavButton;
    wwDBNavigator1Refresh: TwwNavButton;
    wwDBNavigator1SaveBookmark: TwwNavButton;
    wwDBNavigator1RestoreBookmark: TwwNavButton;
    wwMSQueryEMPNO: TIntegerField;
    wwMSQueryENAME: TStringField;
    wwMSQueryJOB: TStringField;
    wwMSQueryMGR: TIntegerField;
    wwMSQueryHIREDATE: TDateTimeField;
    wwMSQuerySAL: TFloatField;
    wwMSQueryCOMM: TFloatField;
    wwMSQueryDEPTNO: TIntegerField;
    procedure btOpenClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

{$R *.DFM}

procedure TfmMain.btOpenClick(Sender: TObject);
begin
  wwMSQuery.Open;  
end;

procedure TfmMain.btCloseClick(Sender: TObject);
begin
  wwMSQuery.Close;
end;

end.
