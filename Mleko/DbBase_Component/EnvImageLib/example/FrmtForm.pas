unit FrmtForm;

interface

uses
    EnMisc,  { for TImageFormat }

  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TFormatConversionForm = class(TForm)
    OkBtn: TBitBtn;
    BitBtn1: TBitBtn;
    DitherCB: TCheckBox;
    QuantizeCB: TCheckBox;
    BlackWhiteRB: TRadioButton;
    Gray16RB: TRadioButton;
    Gray256RB: TRadioButton;
    Color16RB: TRadioButton;
    Color256RB: TRadioButton;
    TrueColorRB: TRadioButton;
    FormatBevel: TBevel;
    OptionsBevel: TBevel;
  private
    { Private declarations }
    procedure SetSourceFormat( const Format : TImageFormat );
    function GetDestFormat : TImageFormat;
  public
    { Public declarations }
    property SourceFormat : TImageFormat write SetSourceFormat;
    property DestFormat : TImageFormat read GetDestFormat;

  end;

implementation

{$R *.DFM}

procedure TFormatConversionForm.SetSourceFormat( const Format : TImageFormat );
begin
    case Format of
        ifBlackWhite  : BlackWhiteRB.Enabled := False;
        ifGray16      : Gray16RB.Enabled := False;
        ifGray256     : Gray256RB.Enabled := False;
        ifColor16     : Color16RB.Enabled := False;
        ifColor256    : Color256RB.Enabled := False;
        ifTrueColor   : TrueColorRB.Enabled := False;
    end;
end;

function TFormatConversionForm.GetDestFormat : TImageFormat;
begin
    if BlackWhiteRB.Checked then
        Result := ifBlackWhite
    else if Gray16RB.Checked then
        Result := ifGray16
    else if Gray256RB.Checked then
        Result := ifGray256
    else if Color16RB.Checked then
        Result := ifColor16
    else if Color256RB.Checked then
        Result := ifColor256
    else
        Result := ifTrueColor;
end;

end.
