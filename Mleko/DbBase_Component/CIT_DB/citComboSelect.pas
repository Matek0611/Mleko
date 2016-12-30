unit CitComboSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, citDbGrid, DB, ActnList;

type
  TCitComboSelectDlg = class(TForm)
    DBGrid: TcitDBGrid;
    DS: TDataSource;
    ActionList: TActionList;
    ActionFormSelect: TAction;
    ActionFormCancel: TAction;
    procedure ActionFormSelectExecute(Sender: TObject);
    procedure ActionFormCancelExecute(Sender: TObject);
    procedure DBGridCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CitComboSelectDlg: TCitComboSelectDlg;

implementation

{$R *.dfm}

procedure TCitComboSelectDlg.ActionFormSelectExecute(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TCitComboSelectDlg.ActionFormCancelExecute(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure TCitComboSelectDlg.DBGridCellClick(Column: TColumn);
begin
ActionFormSelectExecute(nil);
end;

end.
