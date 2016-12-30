unit EditRashoda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, Db, ActnList;

type
  TfmEditRashod = class(TMlekoForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    deVidRashodNo: TDBEdit;
    deVidRashodName: TDBEdit;
    Panel2: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    DBCheckBox1: TDBCheckBox;
    DBLookupComboBox1: TDBLookupComboBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmEditRashod: TfmEditRashod;
  procedure EditVidRashod;

implementation
uses data;
{$R *.DFM}

procedure EditVidRashod;
begin
 fmEditRashod:=TfmEditRashod.Create(Application);
 try
 if fmEditRashod.ShowModal=mrOk then
  begin
   if dmDataModule.quVidRashod.State in [dsEdit,dsInsert] then
    dmDataModule.quVidRashod.Post;
  end
 else
  begin
   if dmDataModule.quVidRashod.State in [dsEdit,dsInsert] then
    dmDataModule.quVidRashod.Cancel;
  end
 finally
 fmEditRashod.Free;
 end;

end;

end.
