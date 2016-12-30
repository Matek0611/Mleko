unit CangePriceList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList;

type
  TChangePriceList = class(TMlekoForm)
    od_PriceList: TOpenDialog;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChangePriceList: TChangePriceList;

implementation

{$R *.dfm}

end.
