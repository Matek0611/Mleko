unit MlekoSelectBankInvoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKSelect, DBAccess, MsAccess, DB, COMPSQLBuilder, ActnList, 
  citComponentProps, ExtCtrls, comp_TargetFilter_Panel, StdCtrls, ComCtrls,
  ToolWin, Grids, DBGrids, citDbGrid, MemDS ;

type
  TMlekoSelectBankInvoiceDlg = class(TCFLMLKSelectDlg)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlekoSelectBankInvoiceDlg: TMlekoSelectBankInvoiceDlg;

implementation

{$R *.dfm}

initialization
 RegisterClass(TMlekoSelectBankInvoiceDlg);

finalization
 UnRegisterClass(TMlekoSelectBankInvoiceDlg);

end.
