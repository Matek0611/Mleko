unit MlekoSelectEntityTypeFromCloseReturn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, StdCtrls, ExtCtrls, ActnList;

type
  TMlekoSelectEntityTypeFromCloseReturnForm = class(TMlekoForm)
    Panel1: TPanel;
    rbNaklR: TRadioButton;
    rbPlatP: TRadioButton;
    Panel2: TPanel;
    bOk: TButton;
    Button2: TButton;
    rbNaklP: TRadioButton;
    procedure rbNaklRKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rbPlatPKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlekoSelectEntityTypeFromCloseReturnForm: TMlekoSelectEntityTypeFromCloseReturnForm;

implementation

{$R *.dfm}

procedure TMlekoSelectEntityTypeFromCloseReturnForm.rbNaklRKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
   VK_RETURN:bOk.Click;
  end;
end;

procedure TMlekoSelectEntityTypeFromCloseReturnForm.rbPlatPKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
   VK_RETURN:bOk.Click;
  end;
end;

end.
