unit GetSpravka;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ActnList;

type
  TfmGetSpravka = class(TMlekoForm)
    edDogovor: TEdit;
    Label2: TLabel;
    Bevel1: TBevel;
    bbOk: TBitBtn;
    Label3: TLabel;
    cbForma: TComboBox;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmGetSpravka: TfmGetSpravka;

implementation

{$R *.DFM}

procedure TfmGetSpravka.FormShow(Sender: TObject);
begin
 cbForma.ItemIndex:=0;
end;

end.
