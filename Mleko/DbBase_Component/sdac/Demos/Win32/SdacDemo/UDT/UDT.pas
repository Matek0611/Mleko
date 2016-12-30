unit UDT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, ExtCtrls, Db, Grids, DBGrids,  StdCtrls, ToolWin,
  ComCtrls, ExtDlgs, Buttons, MemDS, DBAccess, MSAccess,
  DemoFrame, SdacDemoForm;

type
  TUDTFrame = class(TDemoFrame)
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    DataSource: TDataSource;
    MSQuery: TMSQuery;
    btOpen: TSpeedButton;
    btClose: TSpeedButton;
    DBNavigator1: TDBNavigator;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    sSquare: TShape;
    Panel7: TPanel;
    Panel8: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edBaseX: TEdit;
    edBaseY: TEdit;
    edSide: TEdit;
    Panel9: TPanel;
    btApply: TSpeedButton;
    Panel11: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    EdPerimeter: TEdit;
    edArea: TEdit;
    Panel10: TPanel;
    Label6: TLabel;
    edCoefficient: TEdit;
    Panel12: TPanel;
    btApplyByMeth: TSpeedButton;
    eddY: TEdit;
    eddX: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    procedure btOpenClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
    procedure btApplyClick(Sender: TObject);
    procedure btApplyByMethClick(Sender: TObject);
    procedure edBaseXChange(Sender: TObject);
    procedure edBaseYChange(Sender: TObject);
    procedure edSideChange(Sender: TObject);
    procedure eddXChange(Sender: TObject);
    procedure edCoefficientChange(Sender: TObject);
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

{ TUDTFrame }

procedure TUDTFrame.btOpenClick(Sender: TObject);
begin
  MSQuery.Open;
end;

procedure TUDTFrame.btCloseClick(Sender: TObject);
begin
  MSQuery.Close;
end;

procedure TUDTFrame.DataSourceDataChange(Sender: TObject; Field: TField);
var
  Square: variant;
begin
  if not (MSQuery.State in dsEditModes) then begin
    Square := (MSQuery.FieldByName('c_square') as TMSUDTField).AsUDT;

    edBaseX.Text := IntToStr(Square.BaseX);
    edBaseY.Text := IntToStr(Square.BaseY);
    edSide.Text := IntToStr(Square.Side);
    edPerimeter.Text := IntToStr(Square.Perimeter);
    edArea.Text := IntToStr(Square.Area);

    sSquare.Left := Screen.PixelsPerInch * (Square.BaseX / 100 / 2.54);
    sSquare.Top := Screen.PixelsPerInch * (Square.BaseY / 100 / 2.54);
    sSquare.Width := Screen.PixelsPerInch * (Square.Side / 100 / 2.54);
    sSquare.Height := sSquare.Width;
  end;
end;

procedure TUDTFrame.btApplyClick(Sender: TObject);
var
  Square: variant;
begin
  MSQuery.Edit;
  Square := (MSQuery.FieldByName('c_square') as TMSUDTField).AsUDT;
  Square.BaseX := StrToInt(edBaseX.Text);
  Square.BaseY := StrToInt(edBaseY.Text);
  Square.Side := StrToInt(edSide.Text);
  MSQuery.Post;
  edBaseX.Font.Style := [];
  edBaseY.Font.Style := [];
  edSide.Font.Style := [];
end;

procedure TUDTFrame.btApplyByMethClick(Sender: TObject);
var
  Square: variant;
begin
  MSQuery.Edit;
  Square := (MSQuery.FieldByName('c_square') as TMSUDTField).AsUDT;
  Square.Move(StrToInt(eddX.Text), StrToInt(eddY.Text));
  Square.Resize(StrToInt(edCoefficient.Text));
  MSQuery.Post;
  eddX.Font.Style := [];
  eddX.Text := '0';
  eddY.Font.Style := [];
  eddY.Text := '0';
  edCoefficient.Font.Style := [];
  edCoefficient.Text := '1';
end;

procedure TUDTFrame.edBaseXChange(Sender: TObject);
begin
  if (Sender as TEdit).Text <> IntToStr((MSQuery.FieldByName('c_square') as TMSUDTField).AsUDT.BaseX) then
    (Sender as TEdit).Font.Style := [fsBold]
  else
    (Sender as TEdit).Font.Style := [];
end;

procedure TUDTFrame.edBaseYChange(Sender: TObject);
begin
  if (Sender as TEdit).Text <> IntToStr((MSQuery.FieldByName('c_square') as TMSUDTField).AsUDT.BaseY) then
    (Sender as TEdit).Font.Style := [fsBold]
  else
    (Sender as TEdit).Font.Style := [];
end;

procedure TUDTFrame.edSideChange(Sender: TObject);
begin
  if (Sender as TEdit).Text <> IntToStr((MSQuery.FieldByName('c_square') as TMSUDTField).AsUDT.Side) then
    (Sender as TEdit).Font.Style := [fsBold]
  else
    (Sender as TEdit).Font.Style := [];
end;

procedure TUDTFrame.eddXChange(Sender: TObject);
begin
  if (Sender as TEdit).Text <> '0' then
    (Sender as TEdit).Font.Style := [fsBold]
  else
    (Sender as TEdit).Font.Style := [];
end;

procedure TUDTFrame.edCoefficientChange(Sender: TObject);
begin
  if (Sender as TEdit).Text <> '1' then
    (Sender as TEdit).Font.Style := [fsBold]
  else
    (Sender as TEdit).Font.Style := [];
end;

// Demo management
procedure TUDTFrame.Initialize;
begin
  inherited;
  MSQuery.Connection := Connection as TCustomMSConnection;
end;

procedure TUDTFrame.SetDebug(Value: boolean);
begin
  MSQuery.Debug := Value;
end;

end.
