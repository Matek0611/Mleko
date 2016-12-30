unit CategoryTT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, DB, DBAccess, MSAccess, MemDS, StdCtrls,
  GridsEh, DBGridEh, ExtCtrls;

type
  TCategoryTTForm = class(TMlekoForm)
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    StaticText1: TStaticText;
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    bbOk: TButton;
    bbCancel: TButton;
    quCategoryTT: TMSQuery;
    dsCategoryTT: TMSDataSource;
    quCategoryTTCategoryTTNo: TIntegerField;
    quCategoryTTCategoryTTName: TStringField;
    quCategoryTTActive: TFloatField;
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
  CategoryTTForm: TCategoryTTForm;
  EnabledEvents : bool;

implementation

uses data, EditCategoryTT;

{$R *.dfm}

procedure TCategoryTTForm.DBGridEh1DblClick(Sender: TObject);
begin
  inherited;
  if EnabledEvents then begin
                          EditCategoryTTForm := TEditCategoryTTForm.Create(Application);
                          try

                            EditCategoryTTForm.ShowModal;
                          finally
                            quCategoryTT.Refresh;
                            DBGridEh1.Refresh;
                            EditCategoryTTForm.Free;
                          end;
                        end;
end;

procedure TCategoryTTForm.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if EnabledEvents then begin
                          case Key of
                               VK_RETURN:DBGridEh1DblClick(Nil);
                               VK_INSERT:begin
                                           quCategoryTT.Append;
//                                           dsCategoryTT.State := dsInsert;
                                           DBGridEh1DblClick(Nil);
                                         end;
                               VK_DELETE:if Application.MessageBox('Вы уверены?','Удаление',MB_YESNO)=IDYES then
                                          begin
                                            quCategoryTT.Delete;
                                            quCategoryTT.Refresh;

                                          end;
                          end;
                        end;
end;

procedure TCategoryTTForm.bbOkClick(Sender: TObject);
begin
  inherited;
  if dsCategoryTT.State in [dsInsert, dsEdit] then quCategoryTT.Post;
  ModalResult := mrOk;
end;

procedure TCategoryTTForm.bbCancelClick(Sender: TObject);
begin
  inherited;
  if dsCategoryTT.State in [dsInsert, dsEdit] then quCategoryTT.Cancel;
  ModalResult := mrCancel;
end;

end.
