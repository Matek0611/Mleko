unit MLKPropDb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BCPropDb, DB, ActnList, cxPC, cxControls, StdCtrls,MlekoDbDsMSSQL,MlekoRes,data;

type
  TMLKPropDbDlg = class(TBCPropDbDlg)
  protected
    procedure OnSetModule; override;
    { Private declarations }
  public
    MLKCustomDm: TMlekoDbDsMSSQLDm;
    MLKMainDm: TdmDataModule;
    MLKResDm: TMlekoResDm;
  end;

var
  MLKPropDbDlg: TMLKPropDbDlg;

implementation

{$R *.dfm}

procedure TMLKPropDbDlg.OnSetModule;
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
