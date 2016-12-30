unit CheckMeshCutting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, citCtrls, citmask, citDBCalendar, StdCtrls, DB,
  DBCtrlsEh, ActnList, Buttons, DBAccess, MSAccess, MemDS, Mask;

type
  TCheckMeshCuttingForm = class(TMlekoForm)
    GroupBox1: TGroupBox;
    DBCheckBoxEh1: TDBCheckBoxEh;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    mdDate: TcitDBDateEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CheckMeshCuttingForm: TCheckMeshCuttingForm;
  procedure CheckCuttingMesh;

implementation
uses data;

{$R *.dfm}
procedure CheckCuttingMesh;
begin
  CheckMeshCuttingForm := TCheckMeshCuttingForm.Create(Application);
  try
    dmDataModule.quCheckMeshCutting.Close;
    dmDataModule.quCheckMeshCutting.Open;
    CheckMeshCuttingForm.ShowModal;

    if CheckMeshCuttingForm.ModalResult = mrOk then if dmDataModule.quCheckMeshCutting.State in [dsEdit,dsInsert] then begin
//                                                                                                                         showmessage(dmDataModule.quCheckMeshCuttingDateCheck.AsString);
                                                                                                                         dmDataModule.quCheckMeshCutting.Post;
                                                                                                                       end
                                               else if dmDataModule.quCheckMeshCutting.State in [dsEdit,dsInsert] then dmDataModule.quCheckMeshCutting.Cancel;
  finally
    dmDataModule.quCheckMeshCutting.Close;
    CheckMeshCuttingForm.Free;
  end;
end;

end.
