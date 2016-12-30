unit citDBCalculator;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  citdbctrls, citCalculatorDlg, extctrls, citUtils;

type
  TCloseDialogEvent = procedure(Sender : TObject; AText : string)
    of object;
  TDialogStyle = (dsNoCaption, dsToolWindow);
  TcitDBCalcEdit = class(TcitDBEdit)
  private
    FDecimalsNumber : integer;
    FDialogStyle : TDialogStyle;
    citCalculatorForm : TCalculatorForm;
    FAlwaysShowDialog : boolean;
    FOnCloseDialog : TCloseDialogEvent;
  protected
    procedure ButtonPushed(Sender : TObject); override;
    procedure KeyPress(var Key: Char); override;
    procedure WMPaste(var Message: TMessage); message WM_PASTE;
    function NumberEdit : string;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property DecimalsNumber : integer read FDecimalsNumber write FDecimalsNumber;
    property DialogStyle : TDialogStyle read FDialogStyle write FDialogStyle;
    property AlwaysShowDialog : boolean read FAlwaysShowDialog write FAlwaysShowDialog;
    property OnCloseDialog : TCloseDialogEvent read FOnCloseDialog write FOnCloseDialog;
    property LLblFont;
    property LLblRequiredFont;
    property Required;
  end;

implementation

constructor TcitDBCalcEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csReplicatable];
  if (csDesigning in ComponentState) or not(csReading in ComponentState) then
   begin
     FDecimalsNumber := 10;
     Text := '0';
   end;
end;

procedure TcitDBCalcEdit.ButtonPushed(Sender : TObject);
var
  s : string;
begin
  if FDataLink.CanModify or AlwaysShowDialog then
    if Assigned(FOnPushButton) and FOwnesLButton then
    begin
      if FDataLink.CanModify then FDataLink.Edit;
      FOnPushButton(Self);
      if FDataLink.CanModify then
        if not Focused then FDataLink.UpdateRecord;
      s := NumberEdit;
      if Assigned(FOnCloseDialog) then FOnCloseDialog(Self, s)
    end
    else
    begin
      s := NumberEdit;
      if Assigned(FOnCloseDialog) then FOnCloseDialog(Self, s);
    end;
  SetFocus;
end;

function TcitDBCalcEdit.NumberEdit : string;
var
   OldText : string;
   OutputNumber : double;
begin
  OldText := Field.AsString;
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
  if FDataLink.CanModify then FDataLink.Edit;
  OutputNumber := citCalculatorForm.ShowMe(Field.AsString, FDecimalsNumber);
  if citCalculatorForm.ModalResult = mrCancel then Result := OldText
                                              else Result := FloatToStr(OutputNumber);
  if FDataLink.CanModify then Field.AsString := Result;

  citCalculatorForm.Free;
  if not Focused and FDataLink.CanModify then FDataLink.UpdateRecord;
  SelStart := Length(Text);
end;

procedure TcitDBCalcEdit.KeyPress(var Key: Char);
begin
  if Key = '.' then Key := ',';
  inherited;

  if not (Key in ['0'..'9','-','+','.',',']) and (Key > #32) then
  begin
    Key := #0;
    Exit;
  end;
end;

procedure TcitDBCalcEdit.WMPaste(var Message : TMessage);
var
  i : integer;
begin
  inherited;
  i := Pos('.', Text);
  if (i > 0) and FDataLink.CanModify then
  begin
    FDataLink.Edit;
    Field.AsString := Copy(Field.AsString, 1, i-1)+','+
                      Copy(Field.AsString, i+1, Length(Field.AsString)-i);
  end;
  if FDataLink.CanModify then
  try
    StrToFloat(Text);
  except
    on EConvertError do
    begin
      FDataLink.Edit;
      Field.AsString := '';
      raise EConvertError.Create('Некорректное число');
    end;
  end;
end;

end.
