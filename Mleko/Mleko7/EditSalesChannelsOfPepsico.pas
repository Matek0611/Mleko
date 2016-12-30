unit EditSalesChannelsOfPepsico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, StdCtrls, Mask, DBCtrls, ExtCtrls, DB,
  Buttons;

type
  TEditSalesChannelsOfPepsicoForm = class(TMlekoForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBCheckBox1: TDBCheckBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditSalesChannelsOfPepsicoForm: TEditSalesChannelsOfPepsicoForm;
  procedure EditSalesChannelsPepsico;

implementation

uses data;

{$R *.dfm}

procedure EditSalesChannelsPepsico;
begin
 EditSalesChannelsOfPepsicoForm := TEditSalesChannelsOfPepsicoForm.Create(Application);
 try
 if not dmDataModule.quSalesChannelsOfPepsico.Active then dmDataModule.quSalesChannelsOfPepsico.Open;
 if EditSalesChannelsOfPepsicoForm.ShowModal = mrOk then
  begin
   if dmDataModule.quSalesChannelsOfPepsico.State in [dsEdit,dsInsert] then
    dmDataModule.quSalesChannelsOfPepsico.Post;
  end
 else
  begin
   if dmDataModule.quSalesChannelsOfPepsico.State in [dsEdit,dsInsert] then
    dmDataModule.quSalesChannelsOfPepsico.Cancel;
  end
 finally
 EditSalesChannelsOfPepsicoForm.Free;
 end;

end;

end.
