unit EditStandarts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ExtCtrls, ActnList, StdCtrls, DB, DBAccess, MSAccess,
  MemDS, DBCtrls, Mask;

type
  TEditStandartsOfGoodsForm = class(TMlekoForm)
    Panel1: TPanel;
    DBEditStandartName: TDBEdit;
    DBTextStandartNo: TDBText;
    DBEditActive: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    bbOk: TButton;
    bbCancel: TButton;
    procedure bbOkClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditStandartsOfGoodsForm: TEditStandartsOfGoodsForm;

//  procedure EditStandartsOfGoods(StandartNo:integer);

implementation

uses data, StandartsOfGoods;

{$R *.dfm}
{
procedure EditStandartsOfGoods(StandartNo:integer);
begin
  EditStandartsOfGoodsForm := TEditStandartsOfGoodsForm.Create(Application);

end;
}

procedure TEditStandartsOfGoodsForm.bbOkClick(Sender: TObject);
begin
  inherited;
  try
//  ActiveControl := DBEditStandartName;
//  if (DBEditActive.Text = 'Y') then StandartsOfGoodsForm.quGoodStandartsActive.Value := 1;
//  if (DBEditActive.Text = 'N') then StandartsOfGoodsForm.quGoodStandartsActive.Value := 0;
{
  if not (StandartsOfGoodsForm.quGoodStandarts.State in [dsEdit,dsInsert]) then
    StandartsOfGoodsForm.quGoodStandarts.Edit;
}
{
  if StandartsOfGoodsForm.quGoodStandarts.State in [dsEdit,dsInsert] then
    StandartsOfGoodsForm.quGoodStandarts.Post;
}
  except
  SysUtils.Beep;
  exit;
 end;
// StandartsOfGoodsForm.quGoodStandarts.Refresh;
 EditStandartsOfGoodsForm.Close;
end;

procedure TEditStandartsOfGoodsForm.bbCancelClick(Sender: TObject);
begin
  inherited;
//  EditStandartsOfGoodsForm.quGoodStandarts.Cancel;
  DBEditActive.Undo;
  DBEditStandartName.Undo;
  EditStandartsOfGoodsForm.Close;
end;


end.
