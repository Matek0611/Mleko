unit EditReasonForUnlocking0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, DBCtrls, Mask, ExtCtrls, Buttons, DB, ActnList, DBCtrlsEh;

type
  TfmEditReasonForUnlocking = class(TMlekoForm)
    Panel1: TPanel;
    Label2: TLabel;
    deReasonName: TDBEdit;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    DBCheckBox1: TDBCheckBox;
    Panel2: TPanel;
    deReasonLimit: TDBEdit;
    Label1: TLabel;
    Label3: TLabel;
    DBCheckBox2: TDBCheckBox;
    DBEdit1: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmEditReasonForUnlocking: TfmEditReasonForUnlocking;
  procedure EditReasonForUnlocking;

implementation

uses Data;

{$R *.DFM}

procedure EditReasonForUnlocking;
begin
 fmEditReasonForUnlocking:=TfmEditReasonForUnlocking.Create(Application);
 try
 if fmEditReasonForUnlocking.ShowModal=mrOk then
  begin
   if dmDataModule.quReasonForUnlocking.State in [dsEdit,dsInsert] then
    dmDataModule.quReasonForUnlocking.Post;
  end
 else
  begin
   if dmDataModule.quReasonForUnlocking.State in [dsEdit,dsInsert] then
    dmDataModule.quReasonForUnlocking.Cancel;
  end
 finally
 fmEditReasonForUnlocking.Free;
 end;
end;

end.
