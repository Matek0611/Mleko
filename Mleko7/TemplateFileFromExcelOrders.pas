unit TemplateFileFromExcelOrders;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, StdCtrls, GridsEh, DBGridEh, ExtCtrls, ActnList;

type
  TTemplateFileFromExcelOrdersForm = class(TMlekoForm)
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TemplateFileFromExcelOrdersForm: TTemplateFileFromExcelOrdersForm;

implementation

{$R *.dfm}



end.
