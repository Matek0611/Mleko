unit citCalculatorDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, Math, Menus, ClipBrd, citUtils;

type
  TOperation = (opPlus, opMinus, opDivide, opMultiply, opPercent, opNone);
  TCalculatorButton = class(TSpeedButton);
  TCalculatorForm = class(TForm)
    PanelMain: TPanel;
    PanelResult: TPanel;
    Btn1: TSpeedButton;
    Btn2: TSpeedButton;
    Btn5: TSpeedButton;
    Btn3: TSpeedButton;
    Btn4: TSpeedButton;
    Btn6: TSpeedButton;
    Btn7: TSpeedButton;
    Btn9: TSpeedButton;
    Btn8: TSpeedButton;
    Btn0: TSpeedButton;
    BtnComma: TSpeedButton;
    Label1: TLabel;
    BtnOK: TSpeedButton;
    BtnCancel: TSpeedButton;
    BtnPlus: TSpeedButton;
    BtnMinus: TSpeedButton;
    BtnMultiply: TSpeedButton;
    BtnDivide: TSpeedButton;
    BtnCalculate: TSpeedButton;
    BtnSignum: TSpeedButton;
    BtnPercent: TSpeedButton;
    BtnSQRT: TSpeedButton;
    BtnInverse: TSpeedButton;
    BtnMC: TSpeedButton;
    BtnMR: TSpeedButton;
    BtnMS: TSpeedButton;
    BtnMPlus: TSpeedButton;
    BtnBack: TSpeedButton;
    BtnC: TSpeedButton;
    BtnCE: TSpeedButton;
    menuClipbrd: TPopupMenu;
    miCopy: TMenuItem;
    miPaste: TMenuItem;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    procedure OKClick(Sender: TObject);
    procedure Btn0Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnPlusClick(Sender: TObject);
    procedure BtnMinusClick(Sender: TObject);
    procedure BtnMultiplyClick(Sender: TObject);
    procedure BtnDivideClick(Sender: TObject);
    procedure BtnCalculateClick(Sender: TObject);
    procedure BtnPercentClick(Sender: TObject);
    procedure BtnSQRTClick(Sender: TObject);
    procedure BtnInverseClick(Sender: TObject);
    procedure BtnSignumClick(Sender: TObject);
    procedure BtnCommaClick(Sender: TObject);
    procedure BtnBackClick(Sender: TObject);
    procedure BtnCClick(Sender: TObject);
    procedure BtnCEClick(Sender: TObject);
    procedure BtnMSClick(Sender: TObject);
    procedure BtnMCClick(Sender: TObject);
    procedure BtnMRClick(Sender: TObject);
    procedure BtnMPlusClick(Sender: TObject);
    procedure CancelClick(Sender: TObject);
    procedure menuClipbrdPopup(Sender: TObject);
    procedure miCopyClick(Sender: TObject);
    procedure miPasteClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    NewOperand : Boolean;
    OnlyZeros : Boolean;
    Stopped : Boolean;
    Operand1, Operand2 : Double;
    Memory : Double;
    LastOperation : TOperation;
    PercentOperation : TOperation;
    TotalDigits : integer;
    FormatStr : string;
    OldOnDeactivate : TNotifyEvent;
    procedure CMMouseLeave(var Message : TMessage); message CM_MOUSELEAVE;
    procedure WMMouseMove(var Message : TMessage); message WM_MOUSEMOVE;
    procedure WMLButtonDown(var Message : TMessage); message WM_LBUTTONDOWN;
    procedure CMMouseEnter(var Message : TMessage); message CM_MOUSEENTER;
    procedure ReleaseButton(Btn : TCalculatorButton);
    procedure SinkButton(Btn : TCalculatorButton);
    procedure PressButton(Btn : TCalculatorButton);
    procedure PerformOperation;
    procedure ValidateOutput;
    procedure StopCalculation(ErrorStr : string);
    function  DigitsCount(s : string) : integer;
  public
    MaxDigits : integer;
    function ShowMe(NumberStr : string; AMaxDigits : integer) : double;
  end;

var
  BtnArray : array[0..9] of TSpeedButton;

implementation

{$R *.DFM}

procedure TCalculatorForm.FormCreate(Sender: TObject);
var
   i : integer;
begin
  for i:=0 to 9 do BtnArray[i] := TSpeedButton(FindComponent('Btn'+IntToStr(i)));
  OldOnDeactivate := Application.OnDeactivate;
  Application.OnDeactivate := FormDeactivate;
end;

function TCalculatorForm.ShowMe(NumberStr : string; AMaxDigits : integer) : double;
begin
  MaxDigits := AMaxDigits;
  FormatStr := '0'+'.'+StringOfChar('#', MaxDigits-1);
  try
   Operand1 := StrToFloat(NumberStr);
   ValidateOutput;
  except
   on Exception do begin
                    Operand1 := 0;
                    PanelResult.Caption := '0';
                   end
  end;
  LastOperation := opNone;
  NewOperand := True;
  Stopped := False;
  TotalDigits := 0;
  Memory := 0;
  SetCursorPos(Left + Width div 2, Top + Height div 2);
  ShowModal;
  try
   Result := StrToFloat(PanelResult.Caption);
  except
   on Exception do Result := 0;
  end;
end;

procedure TCalculatorForm.OKClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TCalculatorForm.Btn0Click(Sender: TObject);
begin
  Stopped := False;
  if NewOperand then
    begin
      PanelResult.Caption := IntToStr((Sender as TSpeedButton).Tag);
      Inc(TotalDigits);
      NewOperand := False;
      if Sender = Btn0 then OnlyZeros := True;
    end
   else
    if TotalDigits < MaxDigits then
     begin
       if OnlyZeros then begin
                           if Sender <> Btn0 then OnlyZeros := False;
                           PanelResult.Caption := IntToStr((Sender as TSpeedButton).Tag);
                           TotalDigits := 1;
                         end
                    else
      begin
       PanelResult.Caption := PanelResult.Caption + IntToStr((Sender as TSpeedButton).Tag);
       Inc(TotalDigits)
      end;
     end
end;

procedure TCalculatorForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
   ord('0') .. ord('9') :   if Shift=[] then PressButton(TCalculatorButton(BtnArray[Key-ord('0')]))
                              else if (Shift=[ssShift]) then
                                case chr(Key) of
                                  '8' : PressButton(TCalculatorButton(BtnMultiply));
                                  '5' : PressButton(TCalculatorButton(BtnPercent));
                                  '2' : PressButton(TCalculatorButton(BtnSQRT));
                                end;
   VK_NUMPAD0..VK_NUMPAD9 : PressButton(TCalculatorButton(BtnArray[Key-VK_NUMPAD0]));
   VK_ADD :                 PressButton(TCalculatorButton(BtnPlus));
   VK_SUBTRACT, $BD :       PressButton(TCalculatorButton(BtnMinus));
   VK_MULTIPLY :            PressButton(TCalculatorButton(BtnMultiply));
   VK_DIVIDE :              PressButton(TCalculatorButton(BtnDivide));
   $BB :                    if Shift=[ssShift] then PressButton(TCalculatorButton(BtnPlus))
                                               else PressButton(TCalculatorButton(BtnCalculate));
   $BC, VK_DECIMAL :        PressButton(TCalculatorButton(BtnComma));
   VK_F9 :                  PressButton(TCalculatorButton(BtnSignum));
   VK_F10 :                 PressButton(TCalculatorButton(BtnC));
   $BF :                    PressButton(TCalculatorButton(BtnDivide));
   VK_DELETE :              PressButton(TCalculatorButton(BtnCE));
   VK_BACK :                PressButton(TCalculatorButton(BtnBack));
   ord('R') :               if Shift=[ssCtrl] then PressButton(TCalculatorButton(BtnMR))
                                              else PressButton(TCalculatorButton(BtnInverse));
   ord('L') :               if Shift=[ssCtrl] then PressButton(TCalculatorButton(BtnMC));
   ord('M') :               if Shift=[ssCtrl] then PressButton(TCalculatorButton(BtnMS));
   ord('P') :               if Shift=[ssCtrl] then PressButton(TCalculatorButton(BtnMPlus));
   VK_RETURN :              begin
                              BtnCalculate.Click;
                              ModalResult := mrOK;
                            end;
   VK_ESCAPE :              ModalResult := mrCancel;
  end;
end;

procedure TCalculatorForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
   ord('0') .. ord('9') :   begin
                              if Shift=[] then ReleaseButton(TCalculatorButton(BtnArray[Key-ord('0')]));
                              case chr(Key) of
                                '8' : ReleaseButton(TCalculatorButton(BtnMultiply));
                                '5' : ReleaseButton(TCalculatorButton(BtnPercent));
                                '2' : ReleaseButton(TCalculatorButton(BtnSQRT));
                              end;
                            end;
   VK_NUMPAD0..VK_NUMPAD9 : ReleaseButton(TCalculatorButton(BtnArray[Key-VK_NUMPAD0]));
   VK_ADD :                 ReleaseButton(TCalculatorButton(BtnPlus));
   VK_SUBTRACT, $BD :       ReleaseButton(TCalculatorButton(BtnMinus));
   VK_MULTIPLY :            ReleaseButton(TCalculatorButton(BtnMultiply));
   VK_DIVIDE :              ReleaseButton(TCalculatorButton(BtnDivide));
   $BB :                    begin
                               ReleaseButton(TCalculatorButton(BtnPlus));
                               ReleaseButton(TCalculatorButton(BtnCalculate));
                            end;
   $BC, VK_DECIMAL :        ReleaseButton(TCalculatorButton(BtnComma));
   VK_F9 :                  ReleaseButton(TCalculatorButton(BtnSignum));
   VK_F10 :                 ReleaseButton(TCalculatorButton(BtnC));
   $BF :                    ReleaseButton(TCalculatorButton(BtnDivide));
   VK_DELETE :              ReleaseButton(TCalculatorButton(BtnCE));
   VK_BACK :                ReleaseButton(TCalculatorButton(BtnBack));
   ord('R') :               begin
                              ReleaseButton(TCalculatorButton(BtnInverse));
                              ReleaseButton(TCalculatorButton(BtnMR));
                            end;
   ord('L') :               ReleaseButton(TCalculatorButton(BtnMC));
   ord('M') :               ReleaseButton(TCalculatorButton(BtnMS));
   ord('P') :               ReleaseButton(TCalculatorButton(BtnMPlus));
  end;
end;

procedure TCalculatorForm.ReleaseButton(Btn : TCalculatorButton);
begin
  if Btn.FState <> bsUp then
    begin
     Btn.FState := bsUp;
     Btn.Invalidate
    end;
end;

procedure TCalculatorForm.SinkButton(Btn : TCalculatorButton);
begin
  if Btn.FState <> bsDown then
    begin
     Btn.FState := bsDown;
     Btn.Invalidate
    end;
end;

procedure TCalculatorForm.PressButton(Btn : TCalculatorButton);
begin
  SinkButton(Btn);
  Btn.Click
end;

procedure TCalculatorForm.PerformOperation;
begin
  if LastOperation <> opNone then
    try
       begin
         Operand2 := StrToFloat(PanelResult.Caption);
         case LastOperation of
           opPlus  : Operand1 := Operand1 + Operand2;
           opMinus : Operand1 := Operand1 - Operand2;
           opDivide : Operand1 := Operand1 / Operand2;
           opMultiply : Operand1 := Operand1 * Operand2;
           opPercent : case PercentOperation of
                        opPlus   : Operand1 := Operand1 * (1 + Operand2 / 100);
                        opMinus  : Operand1 := Operand1 * (1 - Operand2 / 100);
                        opDivide : Operand1 := Operand1 / Operand2 * 100;
                        else       Operand1 := Operand1 * Operand2 / 100;
                       end
         end;
         ValidateOutput;
       end;
    except
       on Exception do StopCalculation('Ошибка !');
    end
   else Operand1 := StrToFloat(PanelResult.Caption);
  NewOperand := True;
  TotalDigits := 0;
end;

procedure TCalculatorForm.BtnPlusClick(Sender: TObject);
begin
  if not Stopped then
   begin
    PerformOperation;
    LastOperation := opPlus;
   end
end;

procedure TCalculatorForm.BtnMinusClick(Sender: TObject);
begin
  if not Stopped then
   begin
     PerformOperation;
     LastOperation := opMinus;
   end
end;

procedure TCalculatorForm.BtnMultiplyClick(Sender: TObject);
begin
  if not Stopped then
   begin
     PerformOperation;
     LastOperation := opMultiply;
   end
end;

procedure TCalculatorForm.BtnDivideClick(Sender: TObject);
begin
  if not Stopped then
   begin
     PerformOperation;
     LastOperation := opDivide;
   end;
end;

procedure TCalculatorForm.BtnCalculateClick(Sender: TObject);
begin
  if not Stopped then
   begin
     PerformOperation;
     LastOperation := opNone
   end  
end;

procedure TCalculatorForm.BtnPercentClick(Sender: TObject);
begin
  if not Stopped then
   begin
     PercentOperation := LastOperation;
     LastOperation := opPercent;
     PerformOperation;
     LastOperation := opNone
   end  
end;

procedure TCalculatorForm.BtnSQRTClick(Sender: TObject);
begin
 if not Stopped then
  try
   Operand1 := sqrt(StrToFloat(PanelResult.Caption));
   ValidateOutput;
  except
   on Exception do StopCalculation('Комплексное число!');
  end;
end;

procedure TCalculatorForm.BtnInverseClick(Sender: TObject);
begin
 if not Stopped then
  try
   Operand1 := 1/StrToFloat(PanelResult.Caption);
   ValidateOutput;
  except
   on Exception do StopCalculation('Ошибка деления!');
  end;
end;

procedure TCalculatorForm.BtnSignumClick(Sender: TObject);
begin
  if not Stopped and (PanelResult.Caption <> '0') then
   if PanelResult.Caption[1]='-'
     then PanelResult.Caption := Copy(PanelResult.Caption, 2, Length(PanelResult.Caption)-1)
     else PanelResult.Caption := '-' + PanelResult.Caption
end;

procedure TCalculatorForm.BtnCommaClick(Sender: TObject);
begin
  if NewOperand then Btn0.Click;

  if (Pos(DecimalSeparator, PanelResult.Caption) = 0) and
    not(NewOperand and (PanelResult.Caption<>'0')) and not Stopped and (TotalDigits <> MaxDigits)
   then begin
          PanelResult.Caption := PanelResult.Caption + DecimalSeparator;
          OnlyZeros := False;
          NewOperand := False;
        end;
end;

function TCalculatorForm.DigitsCount(s : string) : integer;
var
   i : integer;
begin
  Result := 0;
  for i:=1 to Length(s) do if s[i] in ['0'..'9'] then Inc(Result)
end;

procedure TCalculatorForm.ValidateOutput;
var
   TmpStr : string;
begin
  if (abs(Operand1)<IntPower(10, MaxDigits)) and (abs(Operand1)>IntPower(10, 1-MaxDigits))
    then begin
           TmpStr := FormatFloat(FormatStr, Operand1);
           if DigitsCount(TmpStr) > MaxDigits then
              SetLength(TmpStr, Length(TmpStr) - DigitsCount(TmpStr) + MaxDigits);
           PanelResult.Caption := TmpStr
         end
    else if abs(Operand1)<1 then PanelResult.Caption := '0'
                            else PanelResult.Caption := 'Переполнение';
  NewOperand := True;                          
end;

procedure TCalculatorForm.BtnBackClick(Sender: TObject);
begin
  if not NewOperand and not Stopped then
   begin
     PanelResult.Caption := Copy(PanelResult.Caption, 1, Length(PanelResult.Caption)-1);
     if PanelResult.Caption = '' then begin
                                       PanelResult.Caption := '0';
                                       OnlyZeros := True
                                      end
        else if PanelResult.Caption[Length(PanelResult.Caption)]<>DecimalSeparator
           then Dec(TotalDigits)
   end
end;


procedure TCalculatorForm.BtnCClick(Sender: TObject);
begin
  PanelResult.Caption := '0';
  TotalDigits := 0;
  LastOperation := opNone;
  NewOperand := True;
  Stopped := False;
end;

procedure TCalculatorForm.BtnCEClick(Sender: TObject);
begin
  PanelResult.Caption := '0';
  TotalDigits := 0;
  NewOperand := True;
  Stopped := False;
end;

procedure TCalculatorForm.BtnMSClick(Sender: TObject);
begin
  if not Stopped then
   begin
     Memory := StrToFloat(PanelResult.Caption);
     NewOperand := True;
   end
end;

procedure TCalculatorForm.BtnMCClick(Sender: TObject);
begin
  Memory := 0;
end;

procedure TCalculatorForm.BtnMRClick(Sender: TObject);
var
   TmpStr : string;
begin
  Stopped := False;
  TmpStr := FormatFloat(FormatStr, Memory);
  if DigitsCount(TmpStr) > MaxDigits then
     SetLength(TmpStr, Length(TmpStr) - DigitsCount(TmpStr) + MaxDigits);
  PanelResult.Caption := TmpStr;
  NewOperand := True;
end;

procedure TCalculatorForm.BtnMPlusClick(Sender: TObject);
begin
  if not Stopped then
   begin
     Memory := Memory + StrToFloat(PanelResult.Caption);
     NewOperand := True;
   end  
end;

procedure TCalculatorForm.CancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TCalculatorForm.StopCalculation(ErrorStr : string);
begin
  PanelResult.Caption := ErrorStr;
  Stopped := True;
end;
procedure TCalculatorForm.menuClipbrdPopup(Sender: TObject);
begin
  miCopy.Enabled := not Stopped;
end;

procedure TCalculatorForm.miCopyClick(Sender: TObject);
begin
  Clipboard.AsText := PanelResult.Caption
end;

procedure TCalculatorForm.miPasteClick(Sender: TObject);
var
   TmpStr : string;
   TmpDouble : double;
begin
  if Clipboard.HasFormat(CF_TEXT) then
    try
      TmpDouble := StrToFloat(Clipboard.AsText);
      Stopped := False;
      TmpStr := FormatFloat(FormatStr, TmpDouble);
      if DigitsCount(TmpStr) > MaxDigits then
         SetLength(TmpStr, Length(TmpStr) - DigitsCount(TmpStr) + MaxDigits);
      PanelResult.Caption := TmpStr;
      NewOperand := True;
    except
      on Exception do exit
    end
end;

procedure TCalculatorForm.FormDeactivate(Sender: TObject);
var
   i : integer;
begin
  for i:=0 to ComponentCount-1 do
   if Components[i] is TSpeedButton then ReleaseButton(TCalculatorButton(Components[i]));
  if Assigned(OldOnDeactivate) then OldOnDeactivate(Sender)
end;

procedure TCalculatorForm.FormDestroy(Sender: TObject);
begin
  Application.OnDeactivate := OldOnDeactivate;
end;

procedure TCalculatorForm.CMMouseLeave(var Message : TMessage);
begin
  if not MouseCapture then MouseCapture := True
                      else inherited;
end;

procedure TCalculatorForm.CMMouseEnter(var Message : TMessage);
begin
  if MouseCapture then MouseCapture := False
                  else inherited;
end;

procedure TCalculatorForm.WMMouseMove(var Message : TMessage);
var
  P : TPoint;
begin
  GetCursorPos(P);
  if MouseCapture and PointInRect(ScreenToClient(P), ClientRect) then MouseCapture := False
  else inherited;
end;

procedure TCalculatorForm.WMLButtonDown(var Message : TMessage);
var
  P : TPoint;
begin
  GetCursorPos(P);
  if MouseCapture and not PointInRect(P, Rect(Left, Top, Left+Width, Top+Height)) then
  begin
    MouseCapture := False;
    Close;
  end
  else inherited;
end;

end.
