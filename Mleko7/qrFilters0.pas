unit qrFilters0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  QRExport, ActnList;

type
  TfmQrFilters = class(TMlekoForm)
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmQrFilters: TfmQrFilters;

implementation

{$R *.DFM}

end.
