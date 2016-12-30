unit EditKOATUU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, StdCtrls, Buttons, ExtCtrls, ActnList, DBCtrls, Mask, DB;

type
  TEditKOATUUForm = class(TMlekoForm)
    Panel1: TPanel;
    Panel2: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEditKOATUU_ID_CODE: TDBEdit;
    DBEditKOATUU_L1_Name_Rus: TDBEdit;
    DBEditKOATUU_L2_Name_Rus: TDBEdit;
    DBEditKOATUU_L3_Name_Rus: TDBEdit;
    DBEditKOATUU_L4_Name_Rus: TDBEdit;
    Label6: TLabel;
    DBEditKOATUU_L1_Name_En: TDBEdit;
    DBEditKOATUU_L2_Name_En: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    DBEditKOATUU_L3_Name_En: TDBEdit;
    DBEditKOATUU_L4_Name_En: TDBEdit;
    Label9: TLabel;
    DBCheckBox1: TDBCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditKOATUUForm: TEditKOATUUForm;
  procedure ShowEditKOATUU;

implementation

uses data;

{$R *.dfm}

procedure ShowEditKOATUU;
begin
 EditKOATUUForm := TEditKOATUUForm.Create(Application);
 try
 if not dmDataModule.quKOATUU.Active then dmDataModule.quKOATUU.Open;
 if EditKOATUUForm.ShowModal = mrOk then
  begin
   if dmDataModule.quKOATUU.State in [dsEdit,dsInsert] then
    dmDataModule.quKOATUU.Post;
  end
 else
  begin
   if dmDataModule.quKOATUU.State in [dsEdit,dsInsert] then
    dmDataModule.quKOATUU.Cancel;
  end
 finally
 EditKOATUUForm.Free;
 end;

end;

end.
