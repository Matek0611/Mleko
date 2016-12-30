unit ExeMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, Db, MemDS, DBCtrls, DBAccess, SdacVcl,
  MSAccess, Buttons;

type
  TfmExeMain = class(TForm)
    MSConnection: TMSConnection;
    MSConnectDialog: TMSConnectDialog;
    pnToolBar: TPanel;
    DBGrid: TDBGrid;
    MSQuery: TMSQuery;
    DataSource: TDataSource;
    Panel2: TPanel;
    btFreeDLL: TSpeedButton;
    btLoadDLL: TSpeedButton;
    btShowForm: TSpeedButton;
    btHideForms: TSpeedButton;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    btConnect: TSpeedButton;
    btDisconnect: TSpeedButton;
    btOpen: TSpeedButton;
    btClose: TSpeedButton;
    procedure btLoadDLLClick(Sender: TObject);
    procedure btFreeDLLClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btConnectClick(Sender: TObject);
    procedure btDisconnectClick(Sender: TObject);
    procedure btOpenClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btShowFormClick(Sender: TObject);
    procedure btHideFormsClick(Sender: TObject);
  private
    hDLL:HModule;

  public

  end;

  TAssignMSConnection = procedure (MSConnection: TMSConnection); cdecl;
  TShowForm = procedure; cdecl;
  THideForms = procedure; cdecl;

var
  fmExeMain: TfmExeMain;

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

{$IFNDEF VER130}
{$IFNDEF VER140}
{$IFNDEF CLR}
  {$DEFINE XPMAN}
  {$R WindowsXP.res}
{$ENDIF}
{$ENDIF}
{$ENDIF}

{$IFDEF XPMAN}
uses
  UxTheme;
{$ENDIF}

procedure TfmExeMain.btLoadDLLClick(Sender: TObject);
var
  AssignMSConnection: TAssignMSConnection;
begin
  if hDLL = 0 then begin
    hDLL := LoadLibrary('MS_DLL.dll');
    if hDLL <> 0 then begin
      @AssignMSConnection := GetProcAddress(hDLL, 'AssignConnection');
      if @AssignMSConnection <> nil then
        AssignMSConnection(MSConnection);
      MessageDlg('DLL is loaded', mtInformation, [mbOk], 0);
    end
    else
      MessageDlg('Cannot load DLL', mtError, [mbOk], 0);
  end;
end;

procedure TfmExeMain.btShowFormClick(Sender: TObject);
var
  ShowForm: TShowForm;
begin
  if hDLL <> 0 then begin
    @ShowForm := GetProcAddress(hDLL, 'ShowForm');
    if @ShowForm <> nil then
      ShowForm;
    SetFocus;
  end
  else
    MessageDlg('DLL is not loaded', mtError, [mbOk], 0);
end;

procedure TfmExeMain.btHideFormsClick(Sender: TObject);
var
  HideForms: THideForms;
begin
  if hDLL <> 0 then begin
    @HideForms := GetProcAddress(hDLL, 'HideForms');
    if @HideForms <> nil then
      HideForms;
  end
  else
    MessageDlg('DLL is not loaded', mtError, [mbOk], 0);
end;

procedure TfmExeMain.btFreeDLLClick(Sender: TObject);
begin
  if hDLL <> 0 then begin
    FreeLibrary(hDLL);
    hDLL:= 0;
  end
  else
    MessageDlg('DLL is not loaded', mtError, [mbOk], 0);
end;

procedure TfmExeMain.FormCreate(Sender: TObject);
{$IFDEF XPMAN}
  procedure UpdateStyle(Control: TWinControl);
  var
    Panel: TPanel;
    i: integer;
  begin
    for i := 0 to Control.ControlCount - 1 do begin
      if Control.Controls[i] is TSpeedButton then
        TSpeedButton(Control.Controls[i]).Flat := False
      else
      if Control.Controls[i] is TDBNavigator then
        TDBNavigator(Control.Controls[i]).Flat := False;
      if Control.Controls[i] is TWinControl then begin
        if (Control.Controls[i] is TPanel) then begin
            Panel := TPanel(Control.Controls[i]);
            Panel.ParentBackground := False;
            Panel.Color := clBtnFace;
          end;
        UpdateStyle(TWinControl(Control.Controls[i]));
      end;
    end;
  end;
{$ENDIF}

begin
{$IFDEF XPMAN}
  if UseThemes then
    UpdateStyle(Self);
{$ENDIF}
  hDLL:= 0;
end;

procedure TfmExeMain.btConnectClick(Sender: TObject);
begin
  MSConnection.Connect;
end;

procedure TfmExeMain.btDisconnectClick(Sender: TObject);
begin
  MSConnection.Disconnect;
end;

procedure TfmExeMain.btOpenClick(Sender: TObject);
begin
  MSQuery.Open;
end;

procedure TfmExeMain.btCloseClick(Sender: TObject);
begin
  MSQuery.Close;
end;

procedure TfmExeMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if hDLL <> 0 then
    FreeLibrary(hDLL);
end;

end.

