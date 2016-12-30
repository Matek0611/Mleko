unit EditDolgNakl0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  Grids, DBGrids, RXDBCtrl;

type
  TfmEditDolgNakl = class(TMlekoForm)
    grPlat: TRxDBGrid;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmEditDolgNakl: TfmEditDolgNakl;

implementation

uses DolgNam;

{$R *.DFM}

procedure TfmEditDolgNakl.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=VK_ESCAPE then
  fmEditDolgNakl.Close;
end;

end.
