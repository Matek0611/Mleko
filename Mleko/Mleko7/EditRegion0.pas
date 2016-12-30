unit EditRegion0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, DB, ActnList;

type
  TfmEditRegion = class(TMlekoForm)
    Panel1: TPanel;
    Panel2: TPanel;
    deRegionNo: TDBEdit;
    deRegionName: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    DBCheckBox1: TDBCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmEditRegion: TfmEditRegion;
  procedure EditRegion;
implementation

uses data;

{$R *.DFM}

procedure EditRegion;
begin
 fmEditRegion:=TfmEditRegion.Create(Application);
 try
 if fmEditRegion.ShowModal=mrOk then
  begin
   if dmDataModule.quRegions.State in [dsInsert,dsEdit] then
    dmDataModule.quRegions.Post;
  end
 else
  begin
   if dmDataModule.quRegions.State in [dsInsert,dsEdit] then
    dmDataModule.quRegions.Cancel;
  end
 finally
 fmEditRegion.Free;
 end;
end;

end.
