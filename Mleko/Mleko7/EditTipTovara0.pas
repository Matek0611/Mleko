unit EditTipTovara0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, DBCtrls, Mask, ExtCtrls, Buttons, DB, ActnList;

type
  TfmEditTipTovara = class(TMlekoForm)
    Panel1: TPanel;
    Label2: TLabel;
    deTipName: TDBEdit;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    DBCheckBox1: TDBCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmEditTipTovara: TfmEditTipTovara;
  procedure EditTipTovara;

implementation

uses Data;

{$R *.DFM}

procedure EditTipTovara;
begin
 fmEditTipTovara:=TfmEditTipTovara.Create(Application);
 try
 if fmEditTipTovara.ShowModal=mrOk then
  begin
   if dmDataModule.quTipTovara.State in [dsEdit,dsInsert] then
    dmDataModule.quTipTovara.Post;
  end
 else
  begin
   if dmDataModule.quTipTovara.State in [dsEdit,dsInsert] then
    dmDataModule.quTipTovara.Cancel;
  end
 finally
 fmEditTipTovara.Free;
 end;
end;

end.
