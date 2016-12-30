unit MlkListSetArticleGroup;

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
  TMlkListSetArticleGroupFrame = class(TBCCxListFrame)
    ClnDBCxGridDBTableView1ID: TcxGridDBColumn;
    ClnDBCxGridDBTableView1NAME: TcxGridDBColumn;
    ClnDBCxGridDBTableView1ACTIVE: TcxGridDBColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlkListSetArticleGroupFrame: TMlkListSetArticleGroupFrame;

implementation

uses MlekoDbDsMSSQL;

{$R *.dfm}

end.
