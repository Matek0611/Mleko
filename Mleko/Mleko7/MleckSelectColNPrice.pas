unit MleckSelectColNPrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, DB, MemDS, DBAccess, MSAccess, GridsEh, DBGridEh,
  StdCtrls, ExtCtrls, ActnList;

type
  TMleckSelectColNPriceForm = class(TMlekoForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BtOk: TButton;
    BtCancel: TButton;
    DBGridEh1: TDBGridEh;
    dsSelectColNPrice: TMSDataSource;
    quSelectColNPrice: TMSQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MleckSelectColNPriceForm: TMleckSelectColNPriceForm;

implementation
uses data;

{$R *.dfm}

end.
