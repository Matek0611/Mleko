unit CheckPrice0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, Buttons, ActnList;

type
  TfmCheckPrice = class(TMlekoForm)
    GroupBox1: TGroupBox;
    cbPrice: TCheckBox;
    cbPrice1: TCheckBox;
    cbPrice2: TCheckBox;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCheckPrice: TfmCheckPrice;

implementation

{$R *.DFM}

end.
