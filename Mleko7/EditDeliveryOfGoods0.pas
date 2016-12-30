unit EditDeliveryOfGoods0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, DBCtrls, Mask, ExtCtrls, Buttons, DB, ActnList;

type
  TfmEditDeliveryOfGoods = class(TMlekoForm)
    Panel1: TPanel;
    Label2: TLabel;
    deTipName: TDBEdit;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmEditDeliveryOfGoods: TfmEditDeliveryOfGoods;
  procedure EditDeliveryOfGoods;

implementation

uses Data;

{$R *.DFM}

procedure EditDeliveryOfGoods;
begin
 fmEditDeliveryOfGoods:=TfmEditDeliveryOfGoods.Create(Application);
 try
 if fmEditDeliveryOfGoods.ShowModal=mrOk then
  begin
   if dmDataModule.quDeliveryOfGoods.State in [dsEdit,dsInsert] then
    dmDataModule.quDeliveryOfGoods.Post;
  end
 else
  begin
   if dmDataModule.quDeliveryOfGoods.State in [dsEdit,dsInsert] then
    dmDataModule.quDeliveryOfGoods.Cancel;
  end
 finally
 fmEditDeliveryOfGoods.Free;
 end;
end;

end.
