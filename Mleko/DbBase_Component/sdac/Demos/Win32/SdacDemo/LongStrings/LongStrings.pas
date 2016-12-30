unit LongStrings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, ExtCtrls, Db, Grids, DBGrids,  StdCtrls, ToolWin, SdacVcl,
  ComCtrls, MemDS, DBAccess, MSAccess, Buttons, DemoFrame, SdacDemoForm;

type
  TLongStringsFrame = class(TDemoFrame)
    DBGrid: TDBGrid;
    DataSource: TDataSource;
    ToolBar: TPanel;
    meComments: TDBMemo;
    Splitter1: TSplitter;
    ToolBar1: TPanel;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Panel1: TPanel;
    Panel2: TPanel;
    DBNavigator: TDBNavigator;
    btClose: TSpeedButton;
    btOpen: TSpeedButton;
    cbLongStrings: TCheckBox;
    Panel3: TPanel;
    btClear: TSpeedButton;
    btSave: TSpeedButton;
    btLoad: TSpeedButton;
    MSQuery: TMSQuery;
    procedure btOpenClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure btLoadClick(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
    procedure cbLongStringsClick(Sender: TObject);
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

procedure TLongStringsFrame.btOpenClick(Sender: TObject);
begin
  MSQuery.Open;
end;

procedure TLongStringsFrame.btCloseClick(Sender: TObject);
begin
  MSQuery.Close;
end;

procedure TLongStringsFrame.btLoadClick(Sender: TObject);
var
  List: TStringList;
begin
  if MSQuery.Active and OpenDialog.Execute then begin
    if MSQuery.State = dsBrowse then
      MSQuery.Edit;

    if MSQuery.FieldByName('Value') is TBlobField then
      TBlobField(MSQuery.FieldByName('Value')).LoadFromFile(OpenDialog.FileName)
    else begin
      List := TStringList.Create;
      try
        List.LoadFromFile(OpenDialog.FileName);
        MSQuery.FieldByName('Value').AsString := List.Text;
      finally
        List.Free;
      end;
    end;
  end;
end;

procedure TLongStringsFrame.btSaveClick(Sender: TObject);
var
  List: TStringList;
begin
  if not (MSQuery.Eof and MSQuery.Bof) and SaveDialog.Execute then
    if MSQuery.FieldByName('Value') is TBlobField then
      TBlobField(MSQuery.FieldByName('Value')).SaveToFile(SaveDialog.FileName)
    else begin
      List := TStringList.Create;
      try
        List.Text := MSQuery.FieldByName('Value').AsString;
        List.SaveToFile(SaveDialog.FileName);
      finally
        List.Free;
      end;
    end;
end;

procedure TLongStringsFrame.cbLongStringsClick(Sender: TObject);
var
  OldActive: boolean;
begin
  OldActive := MSQuery.Active;
  MSQuery.Active := False;
  MSQuery.Options.LongStrings := cbLongStrings.Checked;
  MSQuery.Active := OldActive;
end;

procedure TLongStringsFrame.btClearClick(Sender: TObject);
begin
  if MSQuery.Active then begin
    if MSQuery.State = dsBrowse then
      MSQuery.Edit;
    MSQuery.FieldByName('Value').AsString := '';
  end;
end;

// Demo management
procedure TLongStringsFrame.Initialize;
begin
  inherited;
  MSQuery.Connection := Connection as TMSConnection;
  cbLongStrings.Checked := MSQuery.Options.LongStrings;
end;

procedure TLongStringsFrame.SetDebug(Value: boolean);
begin
  MSQuery.Debug := Value;
end;

end.
