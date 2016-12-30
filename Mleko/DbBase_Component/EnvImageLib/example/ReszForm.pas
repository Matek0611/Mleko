unit ReszForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TResizeForm = class(TForm)
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    WidthLbl: TLabel;
    WidthFld: TEdit;
    HeightLbl: TLabel;
    HeightFld: TEdit;
    InterpolatedCB: TCheckBox;
    FilterCB: TComboBox;
    Bevel: TBevel;
    FilterLbl: TLabel;
    DestFormatLbl: TLabel;
    DestFormatCB: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure InterpolatedCBClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

procedure TResizeForm.FormCreate(Sender: TObject);
begin
    FilterCB.ItemIndex := 0;
    InterpolatedCBClick(Self);
end;

procedure TResizeForm.InterpolatedCBClick(Sender: TObject);
begin
    FilterCB.Enabled      := InterpolatedCB.Checked;
    FilterLbl.Enabled     := InterpolatedCB.Checked;
    DestFormatCB.Enabled  := InterpolatedCB.Checked;
    DestFormatLbl.Enabled := InterpolatedCB.Checked;
end;

end.
