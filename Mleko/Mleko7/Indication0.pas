unit Indication0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, ComCtrls;

type
  TfmIndication = class(TMlekoForm)
    ProgressBar1: TProgressBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmIndication: TfmIndication;

implementation

{$R *.dfm}

end.
