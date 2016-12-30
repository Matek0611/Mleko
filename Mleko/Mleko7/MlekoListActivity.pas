unit MlekoListActivity;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoListSimpleDict, cxGraphics,
  cxDataStorage, cxEdit, DB, cxDBData, MemDS, DBAccess,
  MSAccess, ActnList, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  ToolWin, ComCtrls, StdCtrls, cxStyles, cxCustomData, cxFilter, cxData;

type
  TMlekoListActivityForm = class(TMlekoListSimpleDictForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlekoListActivityForm: TMlekoListActivityForm;

implementation

{$R *.dfm}

end.
