unit MlkListLinkArticleGroup;

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
  cxFilter, cxData, MLKCxList, cxCheckBox, cxButtonEdit;

type
  TMlkListLinkArticleGroupFrame = class(TMLKCxListFrame)
    tblvwGroupName: TcxGridDBTableView;
    ClnLArtGrId: TcxGridDBColumn;
    ClnLArtGrACTIVE: TcxGridDBColumn;
  private
    FIsParentArticle: Boolean;
    FIsParentGroup: Boolean;
    { Private declarations }
  public
    procedure Open; override;
  end;

var
  MlkListLinkArticleGroupFrame: TMlkListLinkArticleGroupFrame;

implementation

uses MlekoDbDsMSSQL;

{$R *.dfm}

{ TMlkListLinkArticleGroupFrame }

procedure TMlkListLinkArticleGroupFrame.Open;
begin
  inherited;
  with TMlekoDbDsMSSQLDm(CustomDM) do
  begin
    if not quTovar.Active then quTovar.Open;
    if not QuArticleGroup.Active then QuArticleGroup.Open;
  end;
end;


end.

