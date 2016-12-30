unit Fetch;

interface

uses
{$IFDEF LINUX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls,
  QDBCtrls, QComCtrls, QExtCtrls, QGrids, QButtons,
{$ELSE}
  Windows, Messages,Graphics, Controls, Forms, Dialogs, Buttons,
  DBCtrls, ExtCtrls, Grids, DBGrids, StdCtrls, ToolWin, ComCtrls,
{$ENDIF}
{$IFDEF CLR}
  System.ComponentModel,
{$ENDIF}
  SysUtils, Classes;

type
  TFetchForm = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    btCancel: TSpeedButton;
    ProgressBar: TProgressBar;
    procedure btCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    CancelLoad: boolean;
  end;

var
  FetchForm: TFetchForm;

implementation

{$IFDEF CLR}
{$R *.nfm}
{$ENDIF}
{$IFDEF WIN32}
{$R *.dfm}
{$ENDIF}
{$IFDEF LINUX}
{$R *.xfm}
{$ENDIF}

procedure TFetchForm.btCancelClick(Sender: TObject);
begin
  CancelLoad := True;
  Hide;
end;

procedure TFetchForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

{$IFDEF LINUX}
const
  VK_ESCAPE = 27;
{$ENDIF}
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TFetchForm.FormShow(Sender: TObject);
begin
  ProgressBar.Position := 0;
end;

end.
