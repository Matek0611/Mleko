unit MLKListD_POST_DELAY_STOP_CONTROL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MLKList, cxStyles, cxGraphics, cxEdit, cxGridCustomPopupMenu,
  cxGridPopupMenu, DB, MemDS, VirtualTable, Menus, cxPropertiesStore,
  dxBar, cxClasses, ActnList, cxVGrid, cxDBVGrid, Grids, ValEdit,
  cxInplaceContainer, DBGrids, citDbGrid, cxSplitter, cxFilterControl,
  cxPC, cxControls, ExtCtrls, MLKCxList, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxCheckBox, DBAccess, MSAccess;

type
  TMLKListD_POST_DELAY_STOP_CONTROLFrame = class(TMLKCxListFrame)
    DBCxGridDBTableView1USER_ID: TcxGridDBColumn;
    DBCxGridDBTableView1DATE_BEG: TcxGridDBColumn;
    DBCxGridDBTableView1DATE_END: TcxGridDBColumn;
    DBCxGridDBTableView1ACTION_DATE: TcxGridDBColumn;
    ClnActive: TcxGridDBColumn;
    QuD_POST_DELAY_STOP_CONTROL: TMSQuery;
    DBCxGridDBTableView1ReasonName: TcxGridDBColumn;
    DBCxGridDBTableView1Day_Prosr_group: TcxGridDBColumn;
    DBCxGridDBTableView1Day_Prosr: TcxGridDBColumn;
    DBCxGridDBTableView1SummaDolg: TcxGridDBColumn;
    DBCxGridDBTableView1SummaCollection: TcxGridDBColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MLKListD_POST_DELAY_STOP_CONTROLFrame: TMLKListD_POST_DELAY_STOP_CONTROLFrame;

implementation

uses MlekoDbDsMSSQL;

{$R *.dfm}

end.
