unit GetSpravka3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ActnList;

type
  TfmGetSpravka3 = class(TMlekoForm)
    edDogovor: TEdit;
    Label2: TLabel;
    Bevel1: TBevel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmGetSpravka3: TfmGetSpravka3;

implementation


{$R *.DFM}

end.
