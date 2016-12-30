unit MlekoPropDbPostAddress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKPropDb, DB, MemDS, DBAccess, MsAccess, ActnList, ComCtrls,
  ToolWin, StdCtrls;

type
  TMlekoPropDbPostAddressDlg = class(TCFLMLKPropDbDlg)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlekoPropDbPostAddressDlg: TMlekoPropDbPostAddressDlg;

implementation

{$R *.dfm}

end.
