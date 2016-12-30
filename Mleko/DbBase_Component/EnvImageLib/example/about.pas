unit About;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    OKButton: TBitBtn;
    UrlLbl: TLabel;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure UrlLblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

uses
    UrlJmp,   { for JumpToUrl }
    Cursors;  { for crHand }

{--------------------------------------------------------------------------}

procedure TAboutBox.FormCreate(Sender: TObject);
begin
    UrlLbl.Cursor := crHand;
end;

{--------------------------------------------------------------------------}

procedure TAboutBox.UrlLblClick(Sender: TObject);
begin
     JumpToUrl('http://www.intervalsoftware.com');
end;

{--------------------------------------------------------------------------}

end.

