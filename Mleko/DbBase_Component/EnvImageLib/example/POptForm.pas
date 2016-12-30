{ form to select graphic printing options }
unit POptForm;

interface

uses
    EnPrint, { for TEnvisionPrintMode }
    
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TPrintOptionForm = class(TForm)
    OkBtn: TBitBtn;
    BitBtn1: TBitBtn;
    FullPageRB: TRadioButton;
    OriginalSizeRB: TRadioButton;
    StetchToPageRB: TRadioButton;
    SpecificWidthRB: TRadioButton;
    SpecificHeightRB: TRadioButton;
    SpecificWidthAndHeightRB: TRadioButton;
    Bevel: TBevel;
    WidthFld: TEdit;
    WidthLbl: TLabel;
    HeightLbl: TLabel;
    HeightFld: TEdit;
    WidthUpDown: TUpDown;
    HeightUpDown: TUpDown;
    procedure RBClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function GetPrintMode : TEnvisionPrintMode;
  public
    { Public declarations }
    property PrintMode : TEnvisionPrintMode read GetPrintMode;

  end;

implementation

{$R *.DFM}

procedure TPrintOptionForm.FormCreate(Sender: TObject);
begin
    RBClick(Self);
end;

function TPrintOptionForm.GetPrintMode : TEnvisionPrintMode;
begin
    if FullPageRB.Checked then
        Result := pmFullPage
    else if OriginalSizeRB.Checked then
        Result := pmOriginalSize
    else if StetchToPageRB.Checked then
        Result := pmStretchToPage
    else if SpecificWidthRB.Checked then
        Result := pmSpecificWidth
    else if SpecificHeightRB.Checked then
        Result := pmSpecificHeight
    else if SpecificWidthAndHeightRB.Checked then
        Result := pmSpecificWidthAndHeight
    else
        Result := pmFullPage;
end;

procedure TPrintOptionForm.RBClick(Sender: TObject);
begin
    WidthFld.Enabled     := SpecificWidthRB.Checked or
                            SpecificWidthAndHeightRB.Checked;
    WidthLbl.Enabled     := WidthFld.Enabled;
    WidthUpDown.Enabled  := WidthFld.Enabled;

    HeightFld.Enabled    := SpecificHeightRB.Checked or
                            SpecificWidthAndHeightRB.Checked;
    HeightLbl.Enabled    := HeightFld.Enabled;
    HeightUpDown.Enabled := HeightFld.Enabled;
end;

end.
