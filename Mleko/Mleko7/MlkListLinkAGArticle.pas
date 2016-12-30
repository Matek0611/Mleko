unit MlkListLinkAGArticle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlkListLinkArticleGroup, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxDBLookupComboBox, cxGridCustomPopupMenu, cxGridPopupMenu, MemDS,
  VirtualTable, Menus, cxPropertiesStore, dxBar, cxClasses, ActnList,
  cxVGrid, cxDBVGrid, Grids, ValEdit, cxInplaceContainer, cxSplitter,
  DBGrids, citDbGrid, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxControls, cxGridCustomView, cxGrid, ExtCtrls,
  cxFilterControl,  cxPC, cxCheckBox;

type
  TMlkListLinkAGArticleFrame = class(TMlkListLinkArticleGroupFrame)
    ClnArticle: TcxGridDBColumn;
  private
    { Private declarations }
  public

  end;

var
  MlkListLinkAGArticleFrame: TMlkListLinkAGArticleFrame;

implementation

uses MlekoDbDsMSSQL;

{$R *.dfm}


end.
