unit MlkListArticleGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BCTree, cxGraphics, cxTL, 
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomPopupMenu,
  cxGridPopupMenu, MemDS, VirtualTable, Menus, cxPropertiesStore, dxBar,
  cxClasses, ActnList, Grids, ValEdit, cxVGrid, cxSplitter, DBGrids,
  citDbGrid, cxDBVGrid, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxInplaceContainer, cxTLData, cxDBTL, ExtCtrls, cxFilterControl,
   cxPC, cxMaskEdit, cxCustomData, cxStyles, cxNavigator;

type
  TMlkListArticleGroupFrame = class(TBCTreeFrame)
    DBTrColDBTreeListID: TcxDBTreeListColumn;
    DBTrColDBTreeListCODE_NUM: TcxDBTreeListColumn;
    DBTrColDBTreeListNAME: TcxDBTreeListColumn;
    DBTrColDBTreeListParentId: TcxDBTreeListColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlkListArticleGroupFrame: TMlkListArticleGroupFrame;

implementation

uses MlekoDbDsMSSQL;

{$R *.dfm}

end.
