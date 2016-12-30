unit ServerCursors;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, ExtCtrls, Db, Grids, DBGrids,  StdCtrls, ToolWin,
  ComCtrls, Buttons, MemDS, DBAccess, MSAccess,
  OLEDBAccess, SdacVcl, DemoFrame, SdacDemoForm;

type
  TServerCursorsFrame = class(TDemoFrame)
    DBGrid: TDBGrid;
    DataSource: TDataSource;
    ToolBar: TPanel;
    Memo: TMemo;
    MSQuery: TMSQuery;
    Splitter1: TSplitter;
    Panel1: TPanel;
    btOpen: TSpeedButton;
    btClose: TSpeedButton;
    DBNavigator: TDBNavigator;
    btFillTables: TSpeedButton;
    Panel3: TPanel;
    edVal: TEdit;
    Panel2: TPanel;
    Panel4: TPanel;
    rbCientCursor1: TRadioButton;
    rbCientCursor2: TRadioButton;
    rbServerCursor: TRadioButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MSSQLFillTables: TMSSQL;
    procedure btOpenClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure btFillTablesClick(Sender: TObject);
    procedure rbCientCursor2Click(Sender: TObject);
  private

  public
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

{$IFDEF CLR}
uses
  Variants;
{$ENDIF}

procedure TServerCursorsFrame.btOpenClick(Sender: TObject);
var
  dt: TDateTime;
  s: string;
begin
  MSQuery.Connection.Open;
  MSQuery.SQL.Assign(Memo.Lines);

  dt := Now;
  MSQuery.Open;
  s := 'Open = ' + TimeToStr(Now - dt) + '; ';

  dt := Now;
  MSQuery.Last;
  s := s + 'Last = ' + TimeToStr(Now - dt) + ';';
  if rbCientCursor1.Checked then
    Label1.Caption := s
  else
  if rbCientCursor2.Checked then
    Label2.Caption := s
  else
  if rbServerCursor.Checked then
    Label3.Caption := s;
  SdacForm.StatusBar.Update;
end;

procedure TServerCursorsFrame.btCloseClick(Sender: TObject);
begin
  MSQuery.Close;
end;

procedure TServerCursorsFrame.btFillTablesClick(Sender: TObject);
begin
  MSSQLFillTables.ParamValues['cnt'] := edVal.Text;
  MSSQLFillTables.Execute;
end;

procedure TServerCursorsFrame.rbCientCursor2Click(Sender: TObject);
begin
  inherited;
  MSQuery.Close;
  if rbCientCursor1.Checked then begin
    MSQuery.CursorType := ctDefaultResultSet;
    MSQuery.FetchAll := True;
  end
  else
  if rbCientCursor2.Checked then begin
    MSQuery.CursorType := ctDefaultResultSet;
    MSQuery.FetchAll := False;
  end
  else
    MSQuery.CursorType := ctKeySet;
end;

// Demo management
procedure TServerCursorsFrame.Initialize;
begin
  inherited;
  MSQuery.Connection := Connection as TMSConnection;
  MSSQLFillTables.Connection := Connection as TMSConnection;
  Memo.Lines.Text := MSQuery.SQL.Text;

  if MSQuery.CursorType = ctDefaultResultSet then
    rbCientCursor1.Checked := True
  else
    rbServerCursor.Checked := True;
end;

procedure TServerCursorsFrame.SetDebug(Value: boolean);
begin
  MSQuery.Debug := Value;
  MSSQLFillTables.Debug := Value;
end;

end.

