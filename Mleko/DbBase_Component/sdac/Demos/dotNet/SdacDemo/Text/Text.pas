unit Text;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, ExtCtrls, Db, Grids, DBGrids, StdCtrls, ToolWin,
  ComCtrls, MemDS, DBAccess, MSAccess, SdacVcl,
  Buttons, DemoFrame, DAScript, MSScript;

type
  TTextFrame = class(TDemoFrame)
    DBGrid: TDBGrid;
    DataSource: TDataSource;
    ToolBar: TPanel;
    meText: TDBMemo;
    MSQuery: TMSQuery;
    Splitter1: TSplitter;
    ToolBar1: TPanel;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    ToolButton1: TToolButton;
    Panel1: TPanel;
    DBNavigator: TDBNavigator;
    btClose: TSpeedButton;
    btOpen: TSpeedButton;
    Panel2: TPanel;
    btClear: TSpeedButton;
    btSave: TSpeedButton;
    btLoad: TSpeedButton;
    procedure btOpenClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure btLoadClick(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
    procedure btClearClick(Sender: TObject);
  private
    { Private declarations }
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

procedure TTextFrame.btOpenClick(Sender: TObject);
begin
  MSQuery.Open;
end;

procedure TTextFrame.btCloseClick(Sender: TObject);
begin
  MSQuery.Close;
end;

procedure TTextFrame.btLoadClick(Sender: TObject);
begin
  if MSQuery.Active and OpenDialog.Execute then begin
    if MSQuery.State = dsBrowse then
      MSQuery.Edit;

    TBlobField(MSQuery.FieldByName('TextField')).LoadFromFile(OpenDialog.FileName);
  end;
end;

procedure TTextFrame.btSaveClick(Sender: TObject);
begin
  if not (MSQuery.Eof and MSQuery.Bof) and SaveDialog.Execute then
    TBlobField(MSQuery.FieldByName('TextField')).SaveToFile(SaveDialog.FileName);
end;

procedure TTextFrame.btClearClick(Sender: TObject);
begin
  if MSQuery.Active then begin
    if MSQuery.State = dsBrowse then
      MSQuery.Edit;
    MSQuery.FieldByName('TextField').Clear;
  end;
end;

// Demo management
procedure TTextFrame.Initialize;
begin
  inherited;
  MSQuery.Connection := Connection as TMSConnection;
end;

procedure TTextFrame.SetDebug(Value: boolean);
begin
  MSQuery.Debug := Value;
end;

end.
