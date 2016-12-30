unit citHttpLabel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TcitHttpLabel = class(TCustomLabel)
  private
    fURL:        string;
    fURLclVLink: TColor;
    fURLclALink: TColor;
    URLclTemp:   TColor;
  protected
    procedure Click; override;
    procedure MouseDown(
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure SetURL(Value: string);
  public
    constructor Create(AOwner: TComponent); override;
  published
    property URL: string read fURL write SetURL;
    property URLclVLink: TColor read fURLclVLink write fURLclVLink;
    property URLclALink: TColor read fURLclALink write fURLclALink;
    // Standard for TLabel ...
    property Align;
    property Alignment;
    property AutoSize;
    property Caption;
    property Color;
    property DragCursor;
    property DragMode;
    property Enabled;
    property FocusControl;
    property Font;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowAccelChar;
    property ShowHint;
    property Transparent;
    property Layout;
    property Visible;
    property WordWrap;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
  end;

implementation

uses ShellAPI;

constructor TcitHttpLabel.Create(AOwner: TComponent);
begin
  inherited;
  Cursor     := crHandPoint;
  Font.Style := Font.Style + [fsUnderline];
  Font.Color := clNavy;
  URLclVLink := clPurple;
  URLclALink := clRed;
end;

procedure TcitHttpLabel.SetURL(Value: string);
begin
  if Caption = fURL then Caption := Value;
  fURL := Value;
end;

procedure TcitHttpLabel.Click;
begin
  inherited;
  Font.Color := URLclVLink;
  ShellExecute(Parent.Handle, 'open', PChar(URL), nil, nil, SW_SHOWNORMAL);
end;

procedure TcitHttpLabel.MouseDown(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  URLclTemp  := Font.Color;
  Font.Color := URLclALink;
end;

end.
