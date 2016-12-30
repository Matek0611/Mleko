unit MlkListVidTovGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BCCxList, cxGraphics, cxTL, 
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomPopupMenu,
  cxGridPopupMenu, MemDS, VirtualTable, Menus, cxPropertiesStore, dxBar,
  cxClasses, ActnList, Grids, ValEdit, cxVGrid, cxSplitter, DBGrids,
  citDbGrid, cxDBVGrid, cxGridLevel, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxInplaceContainer, ExtCtrls, cxFilterControl,
   cxPC, cxStyles, cxCustomData, cxFilter, cxData;

type
  TMlkListVidTovGroupFrame = class(TBCCxListFrame)
    Clnid: TcxGridDBColumn;
    Clnname: TcxGridDBColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlkListVidTovGroupFrame: TMlkListVidTovGroupFrame;

implementation

uses MlekoDbDsMSSQL;

{$R *.dfm}

end.
