unit TovarPrihForDateOfManufacture;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, StdCtrls, ExtCtrls, ActnList, ComCtrls, Mask,
  rxToolEdit, rxCurrEdit, DB, MemDS, DBAccess, MSAccess;

type
  TTovarPrihForDateOfManufactureForm = class(TMlekoForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    eTovarName: TEdit;
    bOk: TButton;
    bCancel: TButton;
    Label3: TLabel;
    eTovarNo: TEdit;
    Label4: TLabel;
    ceKol: TCurrencyEdit;
    spTovarDateOfManufacture: TMSStoredProc;
    procedure bOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TovarPrihForDateOfManufactureForm: TTovarPrihForDateOfManufactureForm;

implementation

{$R *.dfm}
uses data, main;

procedure TTovarPrihForDateOfManufactureForm.bOkClick(Sender: TObject);
begin
  inherited;
{
  spTovarDateOfManufacture.Close;
  spTovarDateOfManufacture.ParamByName('TovarNo').Value := StrToInt(eTovarNo.Text);
  spTovarDateOfManufacture.ParamByName('Date').Value := DateTimePicker1.Date;
  spTovarDateOfManufacture.ParamByName('Kol').Value := StrToFloat(ceKol.Text);
  spTovarDateOfManufacture.Execute;
}
  DateOfManufacture := DateTimePicker1.Date;
end;

end.
