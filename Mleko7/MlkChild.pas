unit MlkChild;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BCChild, ActnList,MlekoDbDsMSSQL,Data,MlekoRes;

type
  TMlkChildForm = class(TBCChildForm)
  private
    { Private declarations }
  protected
    MLKCustomDm: TMlekoDbDsMSSQLDm;
    MLKMainDm: TdmDataModule;
    MLKResDm: TMlekoResDm;
    procedure OnSetModule; override;
  end;

implementation

{$R *.dfm}
procedure TMlkChildForm.OnSetModule;
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
