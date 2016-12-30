unit ListGoodStandart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, DB, DBAccess, MSAccess, MemDS, GridsEh,
  DBGridEh;

type
  TListGoodStandartForm = class(TMlekoForm)
    dsSetGoodStandartes: TMSDataSource;
    quSetGoodStandartes: TMSQuery;
    spGoodStandartes: TMSStoredProc;
    DBGridEh: TDBGridEh;
    quSetGoodStandartesStandartName: TStringField;
    quSetGoodStandartesis_chesk: TBooleanField;
    quSetGoodStandartesStandartNo: TIntegerField;
    quSetGoodStandartesTovarNo: TIntegerField;
    procedure DBGridEhColumns1UpdateData(Sender: TObject;
      var Text: String; var Value: Variant; var UseText, Handled: Boolean);
    procedure DBGridEhExit(Sender: TObject);
    procedure DBGridEhCellClick(Column: TColumnEh);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListGoodStandartForm: TListGoodStandartForm;

implementation

uses data, EditTovar0;

{$R *.dfm}

procedure TListGoodStandartForm.DBGridEhColumns1UpdateData(
  Sender: TObject; var Text: String; var Value: Variant; var UseText,
  Handled: Boolean);
var
  prop: Integer;
begin
  inherited;
    if Value then
    prop := 1
  else
    prop := 0;
  spGoodStandartes.Close;
  spGoodStandartes.ParamByName('p_TovarNo').Value := quSetGoodStandartesTovarNo.Value;
  spGoodStandartes.ParamByName('p_Standart_id').Value := quSetGoodStandartesStandartNo.Value;
  spGoodStandartes.ParamByName('p_Check').Value := prop;
  spGoodStandartes.ExecProc;

end;

procedure TListGoodStandartForm.DBGridEhExit(Sender: TObject);
begin
  inherited;
  if quSetGoodStandartes.State in [dsInsert, dsEdit] then quSetGoodStandartes.Post;
end;

procedure TListGoodStandartForm.DBGridEhCellClick(Column: TColumnEh);
var
  prop : integer;
begin
  inherited;
{
  showmessage('quListGoodStandartsStandartName '+quSetGoodStandartesStandartName.AsString);
  if quSetGoodStandartesis_chesk.Value = true then showmessage('quListGoodStandartsis_chesk = 1')
                                               else showmessage('quListGoodStandartsis_chesk = 0');
  showmessage('quListGoodStandartsStandartNo: TIntegerField; '+    quSetGoodStandartesStandartNo.AsString);
  showmessage('quListGoodStandartsTovarNo: TIntegerField; '+quSetGoodStandartesTovarNo.AsString);

//  quSetGoodStandartes.DisableControls;

//  quSetGoodStandartes.Edit;
}
  if quSetGoodStandartesis_chesk.Value = true then prop :=0 else prop := 1;


  spGoodStandartes.Close;
  spGoodStandartes.ParamByName('p_TovarNo').Value := quSetGoodStandartesTovarNo.Value;
  spGoodStandartes.ParamByName('p_Standart_id').Value := quSetGoodStandartesStandartNo.Value;
  spGoodStandartes.ParamByName('p_Check').Value := prop;
  spGoodStandartes.ExecProc;

  quSetGoodStandartes.Refresh;

//  quSetGoodStandartes.EnableControls;


end;

end.
