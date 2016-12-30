unit MLKList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BCList, cxStyles, cxGraphics, cxEdit, cxGridCustomPopupMenu,
  cxGridPopupMenu, DB, MemDS, VirtualTable, Menus, cxPropertiesStore,
  dxBar, cxClasses, ActnList, cxVGrid, cxDBVGrid, Grids, ValEdit,
  cxInplaceContainer, cxSplitter, DBGrids, citDbGrid, ExtCtrls,
  cxFilterControl,  cxPC, cxControls,data,MlekoDbDsMSSQL,MlekoRes;

type
  TMLKListFrame = class(TBCListFrame)
  private
    { Private declarations }
  protected
    GCustomDm: TMlekoDbDsMSSQLDm;
    GMainDm: TdmDataModule;
    GResDm: TMlekoResDm;
    procedure OnSetModule; override;
  end;

var
  MLKListFrame: TMLKListFrame;

implementation

uses main;

{$R *.dfm}

{ TMLKListFrame }

procedure TMLKListFrame.OnSetModule;
begin
  DataModuleClassName := 'TMlekoDbDsMSSQLDm';
  ResourceModuleClassName := 'TMlekoResDm';
  inherited;
  if Assigned(fmMain.MainDm) then
  begin
    if not Assigned(MainDM) then MainDM := fmMain.MainDm;
    GMainDm := TdmDataModule(MainDM);
  end;
  if Assigned(fmMain.CustomDM) then
  begin
    if not Assigned(CustomDM) then CustomDM := fmMain.CustomDM;
    GCustomDm := TMlekoDbDsMSSQLDm(CustomDM);
  end;
  if Assigned(fmMain.ResourceModule) then
  begin
    if not Assigned(ResourceModule) then ResourceModule := fmMain.ResourceModule;
    GResDm := TMlekoResDm(ResourceModule);
  end;

end;

end.

