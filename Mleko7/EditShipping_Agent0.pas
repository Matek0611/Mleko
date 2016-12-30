unit EditShipping_Agent0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, DB, ActnList;

type
  TfmEditShipping_Agent = class(TMlekoForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    deShipping_AgentNo: TDBEdit;
    deShipping_AgentName: TDBEdit;
    Panel2: TPanel;
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
  fmEditShipping_Agent: TfmEditShipping_Agent;
  procedure EditShipping_Agent;

implementation
uses data;

{$R *.dfm}

procedure EditShipping_Agent;
begin
 fmEditShipping_Agent:=TfmEditShipping_Agent.Create(Application);
 try
 if fmEditShipping_Agent.ShowModal=mrOk then
  begin
   if dmDataModule.quShipping_Agent.State in [dsEdit,dsInsert] then
    dmDataModule.quShipping_Agent.Post;
  end
 else
  begin
   if dmDataModule.quShipping_Agent.State in [dsEdit,dsInsert] then
    dmDataModule.quShipping_Agent.Cancel;
  end
 finally
 fmEditShipping_Agent.Free;
 end;
end;

end.
