unit EditAddressPost_CODE_Commerce_Network;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, StdCtrls, Buttons, ExtCtrls, ActnList, DBCtrls, Mask, DB;

type
  TEditAddressPost_CODE_Commerce_NetworkForm = class(TMlekoForm)
    Panel1: TPanel;
    Panel2: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    Label1: TLabel;
    DBEditAddressPost_CODE_Commerce_Network_ID_CODE: TDBEdit;
    Label8: TLabel;
    DBEditAddressPost_CODE_Commerce_Network_L3_Name_En: TDBEdit;
    DBEditAddressPost_CODE_Commerce_Network_L4_Name_En: TDBEdit;
    Label9: TLabel;
    DBCheckBox1: TDBCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditAddressPost_CODE_Commerce_NetworkForm: TEditAddressPost_CODE_Commerce_NetworkForm;
  procedure ShowEditAddressPost_CODE_Commerce_Network;

implementation

uses data;

{$R *.dfm}

procedure ShowEditAddressPost_CODE_Commerce_Network;
begin
 EditAddressPost_CODE_Commerce_NetworkForm := TEditAddressPost_CODE_Commerce_NetworkForm.Create(Application);
 try
 if not dmDataModule.quAddressPost_CODE_Commerce_Network.Active then dmDataModule.quAddressPost_CODE_Commerce_Network.Open;
 if EditAddressPost_CODE_Commerce_NetworkForm.ShowModal = mrOk then
  begin
   if dmDataModule.quAddressPost_CODE_Commerce_Network.State in [dsEdit,dsInsert] then
    dmDataModule.quAddressPost_CODE_Commerce_Network.Post;
  end
 else
  begin
   if dmDataModule.quAddressPost_CODE_Commerce_Network.State in [dsEdit,dsInsert] then
    dmDataModule.quAddressPost_CODE_Commerce_Network.Cancel;
  end
 finally
 EditAddressPost_CODE_Commerce_NetworkForm.Free;
 end;

end;

end.
