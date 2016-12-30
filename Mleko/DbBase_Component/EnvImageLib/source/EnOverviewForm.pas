unit EnOverviewForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, EnOverviewPanel;

type
  TOverviewForm = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    Panel:TOverviewPanel;
  end;

implementation

{$R *.DFM}

procedure TOverviewForm.FormCreate(Sender: TObject);
begin
 Panel:=TOverviewPanel.Create(Self);
 Panel.Parent:=Self;
 Panel.Align:=alClient;
end;

procedure TOverviewForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 { prevent closing with Alt-F4 }
 Action:=caNone;
end;

end.
