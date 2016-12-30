unit citCalculator;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  citmask, citCalculatorDlg, extctrls, citUtils;

type
  TDialogStyle = (dsNoCaption, dsToolWindow);
  TcitCalcEdit = class(TcitMaskEdit)
  private
    FDecimalsNumber : integer;
    FDialogStyle : TDialogStyle;
    citCalculatorForm : TCalculatorForm;
  protected
    procedure ButtonPushed(Sender : TObject); override;
    procedure KeyPress(var Key: Char); override;
    procedure WMPaste(var Message: TMessage); message WM_PASTE;
    procedure NumberEdit;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property DialogStyle : TDialogStyle read FDialogStyle write FDialogStyle;
    property DecimalsNumber : integer read FDecimalsNumber write FDecimalsNumber;
    property LLblFont;
    property LLblRequiredFont;
    property Required;
  end;

implementation

constructor TcitCalcEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csReplicatable];
  if (csDesigning in ComponentState) or not(csReading in ComponentState) then
   begin
     FDecimalsNumber := 10;
     Text := '0'; 
   end;
end;

procedure TcitCalcEdit.ButtonPushed(Sender : TObject);
begin
  if Assigned(FOnPushButton) and FOwnesLButton then FOnPushButton(Self)
                                               else NumberEdit;
  SetFocus;
end;

procedure TcitCalcEdit.NumberEdit;
var
   OldText : string;
   OutputNumber : double;
begin
  OldText := Text;
  citCalculatorForm := TCalculatorForm.Create(Self);
  if FDialogStyle = dsToolWindow then
   begin
     citCalculatorForm.BorderStyle := bsToolWindow;
     citCalculatorForm.PanelMain.BevelOuter := bvNone;
     citCalculatorForm.Height := citCalculatorForm.Height + GetSystemMetrics(SM_CYSMCAPTION) +
                        2*GetSystemMetrics(SM_CYDLGFRAME);
     citCalculatorForm.Caption := 'Калькулятор';
   end;
  SetFormPosByControl(citCalculatorForm, Self);
  OutputNumber := citCalculatorForm.ShowMe(Text, FDecimalsNumber);
  if citCalculatorForm.ModalResult = mrCancel then Text := OldText
                                              else Text := FloatToStr(OutputNumber);
  citCalculatorForm.Free;
  SelStart := Length(Text);
end;

procedure TcitCalcEdit.KeyPress(var Key: Char);
begin
  inherited;

  if not (Key in ['0'..'9','-','+','.',',']) and (Key > #32) then
  begin
    Key := #0;
    Exit;
  end;
  if Key = '.' then Key := ',';
end;

procedure TcitCalcEdit.WMPaste(var Message : TMessage);
var
  i : integer;
begin
  inherited;
  i := Pos('.', Text);
  if i > 0 then Text := Copy(Text, 1, i-1)+','+Copy(Text, i+1, Length(Text)-i);
  try
    StrToFloat(Text);
  except
    on EConvertError do
    begin
      Text := '';
      raise EConvertError.Create('Некорректное число');
    end;
  end;
end;
end.
