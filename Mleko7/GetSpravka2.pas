unit GetSpravka2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ActnList;

type
  TfmGetSpravka2 = class(TMlekoForm)
    edDogovor: TEdit;
    Label2: TLabel;
    Bevel1: TBevel;
    bbOk: TBitBtn;
    edTransport: TEdit;
    Label1: TLabel;
    bbCancel: TBitBtn;
    cbTitle: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmGetSpravka2: TfmGetSpravka2;

implementation


{$R *.DFM}

end.
