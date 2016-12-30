unit citText;

{$R-}

interface

uses Messages, Windows, SysUtils, Classes, Controls, Forms, Menus, Graphics, StdCtrls;

type
  TcitText = class(TCustomLabel)
  private
    FLines: TStrings;
  protected
    function GetLabelText: string; override;
    procedure SetLines(Value: TStrings);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Align;
    property Alignment;
    property AutoSize;
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
// ----------------------------------------------
    property Lines: TStrings read FLines write SetLines;
// ----------------------------------------------
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

constructor TcitText.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FLines := TStringList.Create;
  AutoSize := False;
end;

destructor TcitText.Destroy;
begin
  FLines.Free;
  inherited Destroy;
end;

function TcitText.GetLabelText: string;
begin
  Result := FLines.Text;
end;

procedure TcitText.SetLines(Value: TStrings);
begin
  FLines.Assign(Value);
  Invalidate;
end;

end.
