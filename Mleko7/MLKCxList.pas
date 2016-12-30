unit MLKCxList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxEdit, cxGridCustomPopupMenu,
  cxGridPopupMenu, DB, MemDS, VirtualTable, Menus, cxPropertiesStore,
  dxBar, cxClasses, ActnList, cxVGrid, cxDBVGrid, Grids, ValEdit,
  cxInplaceContainer, cxSplitter, DBGrids, citDbGrid, ExtCtrls,
  cxFilterControl,  cxPC, cxControls,BCCxList,
  cxDataStorage, cxDBData, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxStyles, cxCustomData, cxFilter, cxData,
  cxNavigator,MlekoDbDsMSSQL,data,MlekoRes;

type
  TMLKCxListFrame = class(TBCCxListFrame)
  private
    { Private declarations }
  public
    MLKCustomDm: TMlekoDbDsMSSQLDm;
    MLKMainDm: TdmDataModule;
    MLKResDm: TMlekoResDm;
  protected
    procedure OnSetModule; override;
  end;

var
  MLKCxListFrame: TMLKCxListFrame;

implementation

{$R *.dfm}

{ TMLKCxListFrame }

procedure TMLKCxListFrame.OnSetModule;
begin
  DataModuleClassName := 'TMlekoDbDsMSSQLDm';
  ResourceModuleClassName := 'TMlekoResDm';
  inherited;
  if Assigned(MainDm) then
  begin
    MLKMainDm := TdmDataModule(MainDm);
  end;
  if Assigned(CustomDM) then MLKCustomDm := TMlekoDbDsMSSQLDm(CustomDM);
  if Assigned(ResourceModule) then MLKResDm := TMlekoResDm(ResourceModule);
end;

end.

