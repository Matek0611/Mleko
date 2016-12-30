unit EditVidSotrudInPepsico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, StdCtrls, Buttons, DBCtrls, Mask, ExtCtrls, DB;

type
  TEditVidSotrudInPepsicoForm = class(TMlekoForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    DBEditLevel: TDBEdit;
    DBEditLevelName: TDBEdit;
    DBCheckBoxActive: TDBCheckBox;
    DBEditSubLevelAbb: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditVidSotrudInPepsicoForm: TEditVidSotrudInPepsicoForm;
  procedure EditVidSotrudInPepsi;

implementation

uses data;

{$R *.dfm}

procedure EditVidSotrudInPepsi;
begin
 EditVidSotrudInPepsicoForm := TEditVidSotrudInPepsicoForm.Create(Application);
 try
 if not dmDataModule.quVidSotrudInPepsico.Active then dmDataModule.quVidSotrudInPepsico.Open;
 if EditVidSotrudInPepsicoForm.ShowModal=mrOk then
  begin
   if dmDataModule.quVidSotrudInPepsico.State in [dsEdit,dsInsert] then
    dmDataModule.quVidSotrudInPepsico.Post;
  end
 else
  begin
   if dmDataModule.quVidSotrudInPepsico.State in [dsEdit,dsInsert] then
    dmDataModule.quVidSotrudInPepsico.Cancel;
  end
 finally
 EditVidSotrudInPepsicoForm.Free;
 end;

end;

end.
