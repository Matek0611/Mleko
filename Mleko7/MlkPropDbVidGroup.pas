unit MlkPropDbVidGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BCPropDb, DB, ActnList, cxPC, cxControls, StdCtrls, BCFrame,
  BCContainer, MlkListLinkVidTovGroup, BCCxList;

type
  TMlkPropDbVidGroupDlg = class(TBCPropDbDlg)
    FrmLinkVidTovGroup: TMlkListLinkVidTovGroupFrame;
  private
    { Private declarations }
  public
    procedure  OnSetModule; override;
    { Public declarations }
  end;

var
  MlkPropDbVidGroupDlg: TMlkPropDbVidGroupDlg;

implementation

{$R *.dfm}

procedure TMlkPropDbVidGroupDlg.OnSetModule;
begin
  DataModuleClassName := 'TMlekoDbDsMSSQLDm';
  ResourceModuleClassName := 'TMlekoResDm';
  inherited;
end;

initialization
  RegisterClass(TMlkPropDbVidGroupDlg);

finalization
  UnRegisterClass(TMlkPropDbVidGroupDlg);

end.
