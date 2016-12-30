unit KartRas0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ToolWin, ComCtrls, 
  DBGridEh, GridsEh, ActnList;

type
  TfmKartRas = class(TMlekoForm)
    RxDBGrid1: TDBGridEh;
    CoolBar1: TCoolBar;
    sbInsert: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmKartRas: TfmKartRas;

implementation

{$R *.dfm}

end.
