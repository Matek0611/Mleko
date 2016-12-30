unit MlkListPostArticleGroupDelayPay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BCcxList, cxGraphics, cxTL, 
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomPopupMenu,
  cxGridPopupMenu, MemDS, VirtualTable, Menus, cxPropertiesStore, dxBar,
  cxClasses, ActnList, BCContainer, Grids, ValEdit,
  cxVGrid, cxSplitter, DBGrids, citDbGrid, cxDBVGrid, cxGridLevel,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxInplaceContainer, 
  ExtCtrls, cxFilterControl,  cxPC, cxDBLookupComboBox,
  cxCalc, cxSpinEdit, cxStyles, cxCustomData, cxFilter, cxData;

type
  TMlkListPostArticleGroupDelayPayFrame = class(TBCCxListFrame)
    ClnDay_delay: TcxGridDBColumn;
    ClnDay_delay_ext: TcxGridDBColumn;
    ClnVidtov_group_Name: TcxGridDBColumn;
    Clnbuh_name: TcxGridDBColumn;
    ClnPayBan: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    ClnCurrency: TcxGridDBColumn;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Open; override;
  end;

var
  MlkListPostArticleGroupDelayPayFrame: TMlkListPostArticleGroupDelayPayFrame;

implementation

uses MlekoDbDsMSSQL;

{$R *.dfm}

{ TMlkListPostArticleGroupDelayPayFrame }


procedure TMlkListPostArticleGroupDelayPayFrame.Open;
begin
  inherited;

  ClnPayBan.Properties.ReadOnly := false;
  if not TMlekoDbDsMSSQLDm(CustomDM).QuSetArticleGroup.Active then
                                                                begin
                                                                  TMlekoDbDsMSSQLDm(CustomDM).QuSetArticleGroup.Open;
                                                                end;

  if not TMlekoDbDsMSSQLDm(CustomDM).quCurrency.Active then begin
                                                              TMlekoDbDsMSSQLDm(CustomDM).quCurrency.Open;
                                                            end;
end;




end.
