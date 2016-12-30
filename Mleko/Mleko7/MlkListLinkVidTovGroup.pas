unit MlkListLinkVidTovGroup;

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
  TMlkListLinkVidTovGroupFrame = class(TBCCxListFrame)
    Clnid: TcxGridDBColumn;
    ClnVidName: TcxGridDBColumn;
    tblvwGroupName: TcxGridDBTableView;
    ClnGroupNameid: TcxGridDBColumn;
    ClnGroupNameVidName: TcxGridDBColumn;
  private
    { Private declarations }
  public
  end;

var
  MlkListLinkVidTovGroupFrame: TMlkListLinkVidTovGroupFrame;

implementation

uses MlekoDbDsMSSQL;

{$R *.dfm}

{ TMlkListLinkVidTovGroupFrame }


end.

