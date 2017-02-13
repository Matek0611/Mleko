unit UFastDatasetView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGrids, DB;

type
  TfrmFastDatasetView = class(TForm)
    dbgView: TDBGrid;
    sbStatus: TStatusBar;
    dsView: TDataSource;
  private
    procedure AcceptDataset(ADataset: TDataset);
    procedure ShowStatusMsg(Index: Integer; Msg: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFastDatasetView: TfrmFastDatasetView;

  procedure ViewDatasetFast(ADataset: TDataset);
implementation

{$R *.dfm}

procedure TfrmFastDatasetView.ShowStatusMsg(Index: Integer; Msg: string);
begin
  if (Index<0) or sbStatus.SimplePanel then
     sbStatus.SimpleText:= Msg else
     sbStatus.Panels[Index].Text := Msg;
end;

procedure TfrmFastDatasetView.AcceptDataset(ADataset: TDataset);
begin
  dsView.DataSet:= ADataset;
  ADataset.Open;
  ShowStatusMsg(-1, 'Records: ' + IntToStr(ADataset.RecordCount));
end;

procedure ViewDatasetFast(ADataset: TDataset);
begin
  frmFastDatasetView:= TfrmFastDatasetView.Create(Application);
  frmFastDatasetView.AcceptDataset(ADataset);
  frmFastDatasetView.ShowModal;
  frmFastDatasetView.dsView.DataSet.Close;
  frmFastDatasetView.Free;
end;


end.
