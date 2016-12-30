unit ShablonName;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, StdCtrls, ActnList;

type
  TShablonNameForm = class(TMlekoForm)
    Button1: TButton;
    edShablonName: TEdit;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ShablonNameForm: TShablonNameForm;

implementation

{$R *.dfm}

end.
