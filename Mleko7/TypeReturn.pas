unit TypeReturn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, DB, DBAccess, MSAccess, MemDS, StdCtrls,
  GridsEh, DBGridEh, ExtCtrls;

type
  TTypeReturnForm = class(TMlekoForm)
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    StaticText1: TStaticText;
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    bbOk: TButton;
    bbCancel: TButton;
    quTypeReturn: TMSQuery;
    dsTypeReturn: TMSDataSource;
    quTypeReturnTypeReturnNo: TIntegerField;
    quTypeReturnTypeReturnName: TStringField;
    quTypeReturnActive: TFloatField;
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbOkClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TypeReturnForm: TTypeReturnForm;

implementation

uses data, EditTypeReturn;

{$R *.dfm}

procedure TTypeReturnForm.DBGridEh1DblClick(Sender: TObject);
begin
  inherited;
  EditTypeReturnForm := TEditTypeReturnForm.Create(Application);
  try

  EditTypeReturnForm.ShowModal;
  finally
  quTypeReturn.Refresh;
  DBGridEh1.Refresh;
  EditTypeReturnForm.Free;
  end;
end;

procedure TTypeReturnForm.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
  VK_RETURN:DBGridEh1DblClick(Nil);
  VK_INSERT:begin
              quTypeReturn.Append;
//              dsTypeReturn.State := dsInsert;
              DBGridEh1DblClick(Nil);
            end;
  VK_DELETE:if Application.MessageBox('Вы уверены?','Удаление',MB_YESNO)=IDYES then
             begin
               quTypeReturn.Delete;
               quTypeReturn.Refresh;

             end;
end;
end;

procedure TTypeReturnForm.bbOkClick(Sender: TObject);
begin
  inherited;
  if dsTypeReturn.State in [dsInsert, dsEdit] then quTypeReturn.Post;
  ModalResult := mrOk;
end;

procedure TTypeReturnForm.bbCancelClick(Sender: TObject);
begin
  inherited;
  if dsTypeReturn.State in [dsInsert, dsEdit] then quTypeReturn.Cancel;
  ModalResult := mrCancel;
end;

end.
