unit CropForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, EnBmpGr, ExtCtrls;

type
  TCropForm = class(TForm)
    OkBtn: TBitBtn;
    BitBtn1: TBitBtn;
    LeftLbl: TLabel;
    LeftFld: TEdit;
    TopLbl: TLabel;
    TopFld: TEdit;
    RightLbl: TLabel;
    RightFld: TEdit;
    BottomFld: TEdit;
    BottomLbl: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

end.
