unit EditCompany0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, DB, ActnList;

type
  TfmEditCompay = class(TMlekoForm)
    Panel1: TPanel;
    Panel2: TPanel;
    deCompanyNo: TDBEdit;
    deNameCompany: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    dePercentSalary: TDBEdit;
    Label3: TLabel;
    DBCheckBox1: TDBCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmEditCompay: TfmEditCompay;
  procedure EditCompany;
implementation

uses data;

{$R *.DFM}

procedure EditCompany;
begin
 fmEditCompay:=TfmEditCompay.Create(Application);
 try
 if fmEditCompay.ShowModal=mrOk then
  begin
   if dmDataModule.quCompany.State in [dsInsert,dsEdit] then
    dmDataModule.quCompany.Post;
  end
 else
  begin
   if dmDataModule.quCompany.State in [dsInsert,dsEdit] then
    dmDataModule.quCompany.Cancel;
  end
 finally
 fmEditCompay.Free;
 end;
end;

end.
