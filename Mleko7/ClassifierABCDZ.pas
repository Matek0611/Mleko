unit ClassifierABCDZ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, DB, DBAccess, MSAccess, StdCtrls, MemDS,
  GridsEh, DBGridEh, ExtCtrls, Buttons;

type
  TClassifierABCDZForm = class(TMlekoForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    bbOk: TButton;
    bbCancel: TButton;
    StaticText1: TStaticText;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
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
  ClassifierABCDZForm: TClassifierABCDZForm;

implementation

uses data, EditClassifierABCDZ;

{$R *.dfm}

procedure TClassifierABCDZForm.DBGridEh1DblClick(Sender: TObject);
begin
  inherited;
  EditClassifierABCDZForm := TEditClassifierABCDZForm.Create(Application);
  try
    EditClassifierABCDZForm.ShowModal;
  finally
    dmDataModule.quClassifierABCDZ.Refresh;
    DBGridEh1.Refresh;
    EditClassifierABCDZForm.Free;
  end;
end;

procedure TClassifierABCDZForm.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
   case Key of
  VK_RETURN:DBGridEh1DblClick(Nil);
  VK_INSERT:begin
             dmDataModule.quClassifierABCDZ.Append;
             DBGridEh1DblClick(Nil);
            end;
  VK_DELETE:if Application.MessageBox('Вы уверены?','Удаление',MB_YESNO)=IDYES then
             begin
               dmDataModule.quClassifierABCDZ.Delete;
               dmDataModule.quClassifierABCDZ.Refresh;

             end;
end;

end;

procedure TClassifierABCDZForm.bbOkClick(Sender: TObject);
begin
  inherited;
  if dmDataModule.dsClassifierABCDZ.State in [dsInsert, dsEdit] then dmDataModule.quClassifierABCDZ.Post;
  ModalResult := mrOk;
end;

procedure TClassifierABCDZForm.bbCancelClick(Sender: TObject);
begin
  inherited;
  if dmDataModule.dsClassifierABCDZ.State in [dsInsert, dsEdit] then dmDataModule.quClassifierABCDZ.Cancel;
  ModalResult := mrCancel;
end;

end.
