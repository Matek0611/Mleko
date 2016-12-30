unit MlekoListPrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKMDIChild, ActnList, ToolWin, ComCtrls, ExtCtrls,
  cxControls, cxSplitter, 
  Menus;

type
  TMlekoListPriceForm = class(TCFLMLKMDIChildForm)
    PanelTreePrice: TPanel;
    PanelTovarPrice: TPanel;
    Splitter: TcxSplitter;
    procedure FRMTreeFrame1ActionItemAddExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlekoListPriceForm: TMlekoListPriceForm;

implementation



{$R *.dfm}

procedure TMlekoListPriceForm.FRMTreeFrame1ActionItemAddExecute(
  Sender: TObject);
var ln_colnprice: Integer;
begin
  inherited;
end;

end.
