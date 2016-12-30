unit EnBlowupForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, EnBlowUpPanel;

type
  TBlowupForm = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    Panel:TBlowUpPanel;
  end;

var
  BlowupForm: TBlowupForm;

implementation

{$R *.DFM}

procedure TBlowupForm.FormCreate(Sender: TObject);
begin
 Panel:=TBlowUpPanel.Create(Self);
 Panel.Parent:=Self;
 Panel.Align:=alClient;
end;

procedure TBlowupForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 { prevent closing with Alt-F4 }
 Action:=caNone;
end;

end.
