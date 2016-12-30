unit EditVidRashodGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, DBCtrlsEh, StdCtrls, Mask, Buttons, Db,
  ExtCtrls, DBCtrls;

type
  TEditVidRashodGroupForm = class(TMlekoForm)
    Panel2: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    DBEditEh1: TDBEditEh;
    DBCheckBoxEh1: TDBCheckBoxEh;
    Label2: TLabel;
    deVidRashodGroupId: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditVidRashodGroupForm: TEditVidRashodGroupForm;
  procedure EditVidRashGroup;

implementation

uses data;

{$R *.dfm}

procedure EditVidRashGroup;
begin
 EditVidRashodGroupForm := TEditVidRashodGroupForm.Create(Application);
 try
  if EditVidRashodGroupForm.ShowModal = mrOk then
   begin
     if dmDataModule.quVidRashodGroup1.State in [dsEdit,dsInsert] then
      dmDataModule.quVidRashodGroup1.Post;
   end
  else
   begin
     if dmDataModule.quVidRashodGroup1.State in [dsEdit,dsInsert] then
      dmDataModule.quVidRashodGroup1.Cancel;
   end
 finally
  EditVidRashodGroupForm.Free;
 end;
end;

end.
