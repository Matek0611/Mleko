unit MlkListPostArticleGroupPriceType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BCCxList, cxGraphics, cxTL, 
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomPopupMenu,
  cxGridPopupMenu, MemDS, VirtualTable, Menus, cxPropertiesStore, dxBar,
  cxClasses, ActnList, BCContainer, Grids, ValEdit,
  cxVGrid, cxSplitter, DBGrids, citDbGrid, cxDBVGrid, cxGridLevel,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxInplaceContainer, 
  ExtCtrls, cxFilterControl,  cxPC, cxDBLookupComboBox,
  cxCalc, cxSpinEdit, cxStyles, cxCustomData, cxFilter, cxData;

type
  TMlkListPostArticleGroupPriceTypeFrame = class(TBCCxListFrame)
    ClnVidtov_group_Name: TcxGridDBColumn;
    ClnDBCxGridDBTableView1COLNPRICE: TcxGridDBColumn;
  private
    { Private declarations }
  public
    { Public declarations }
    is_One_Post:boolean;
    procedure Open; override;
  end;

var
  MlkListPostArticleGroupPriceTypeFrame: TMlkListPostArticleGroupPriceTypeFrame;

implementation

uses MlekoDbDsMSSQL;

{$R *.dfm}

{ TMlkListPostArticleGroupPriceTypeFrame }

procedure TMlkListPostArticleGroupPriceTypeFrame.Open;
begin
  inherited;
  if not TMlekoDbDsMSSQLDm(CustomDM).QuSetArticleGroup.Active then  TMlekoDbDsMSSQLDm(CustomDM).QuSetArticleGroup.Open;
  if not TMlekoDbDsMSSQLDm(CustomDM).QuPriceType.Active then  TMlekoDbDsMSSQLDm(CustomDM).QuPriceType.Open;
end;


end.
