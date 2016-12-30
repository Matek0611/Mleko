unit About;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, MlekoForm, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TAboutBox = class(TMlekoForm)
    OKButton: TButton;
    ProgramIcon: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

end.

