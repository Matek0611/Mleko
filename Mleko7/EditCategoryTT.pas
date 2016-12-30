unit EditCategoryTT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ExtCtrls, ActnList, StdCtrls, DB, DBAccess, MSAccess,
  MemDS, DBCtrls, Mask;

type
  TEditCategoryTTForm = class(TMlekoForm)
    Panel1: TPanel;
    DBEditCategoryTTName: TDBEdit;
    DBTextCategoryTTNo: TDBText;
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
  EditCategoryTTForm: TEditCategoryTTForm;

implementation

uses data, CategoryTT;

{$R *.dfm}

procedure TEditCategoryTTForm.bbOkClick(Sender: TObject);
begin
  inherited;
    try
    DBEditCategoryTTName.Update;
    DBEditActive.Update;
    except
    SysUtils.Beep;
    exit;
 end;
 EditCategoryTTForm.Close;
end;

procedure TEditCategoryTTForm.bbCancelClick(Sender: TObject);
begin
  inherited;
  DBEditActive.Undo;
  DBEditCategoryTTName.Undo;
  EditCategoryTTForm.Close;
end;

end.
