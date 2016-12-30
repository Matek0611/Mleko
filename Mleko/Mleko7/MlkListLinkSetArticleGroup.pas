unit MlkListLinkSetArticleGroup;

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
   cxPC, cxDBLookupComboBox, cxStyles, cxCustomData,
  cxFilter, cxData;

type
  TMlkListLinkSetArticleGroupFrame = class(TBCCxListFrame)
    ClnDBCxGridDBTableView1ARTICLE_GROUP_ID: TcxGridDBColumn;
  private
    { Private declarations }
  public
    procedure Open; override;
  end;

var
  MlkListLinkSetArticleGroupFrame: TMlkListLinkSetArticleGroupFrame;

implementation

uses MlekoDbDsMSSQL;

{$R *.dfm}

{ TMlkListLinkSetArticleGroupFrame }

procedure TMlkListLinkSetArticleGroupFrame.Open;
begin
  inherited;
  if not TMlekoDbDsMSSQLDm(CustomDM).QuArticleGroup.Active then TMlekoDbDsMSSQLDm(CustomDM).QuArticleGroup.Open;
end;

end.
