unit StandartsOfGoods;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, DB, DBAccess, MSAccess, StdCtrls, MemDS,
  GridsEh, DBGridEh, ExtCtrls, Buttons;

type
  TStandartsOfGoodsForm = class(TMlekoForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    quGoodStandarts: TMSQuery;
    bbOk: TButton;
    bbCancel: TButton;
    dsGoodStandarts: TMSDataSource;
    quGoodStandartsStandartNo: TIntegerField;
    quGoodStandartsStandartName: TStringField;
    quGoodStandartsActive: TFloatField;
    StaticText1: TStaticText;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
//    procedure bbOkClick(Sender: TObject);
//    procedure bbCancelClick(Sender: TObject);
//    procedure SpeedButton3Click(Sender: TObject);
//    procedure SpeedButton2Click(Sender: TObject);
//    procedure sbInsertClick(Sender: TObject);
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
  StandartsOfGoodsForm: TStandartsOfGoodsForm;

implementation

uses data, EditStandarts;

{$R *.dfm}

{
procedure TStandartsOfGoodsForm.bbOkClick(Sender: TObject);
begin
  inherited;
  if dsGoodStandarts.State in [dsInsert, dsEdit] then quGoodStandarts.Post;
end;

procedure TStandartsOfGoodsForm.bbCancelClick(Sender: TObject);
begin
  inherited;
  if dsGoodStandarts.State in [dsInsert, dsEdit] then quGoodStandarts.Cancel;
end;

procedure TStandartsOfGoodsForm.SpeedButton3Click(Sender: TObject);
begin
  inherited;
   if not quGoodStandarts.Eof then
   if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
   quGoodStandarts.Delete;
 ActiveControl:=DBGridEh1;
end;

procedure TStandartsOfGoodsForm.SpeedButton2Click(Sender: TObject);
begin
  inherited;

end;

procedure TStandartsOfGoodsForm.sbInsertClick(Sender: TObject);
begin
  inherited;

end;
 }



procedure TStandartsOfGoodsForm.DBGridEh1DblClick(Sender: TObject);
begin
  inherited;
  EditStandartsOfGoodsForm := TEditStandartsOfGoodsForm.Create(Application);
  try

  EditStandartsOfGoodsForm.ShowModal;
  finally
  quGoodStandarts.Refresh;
  DBGridEh1.Refresh;
  EditStandartsOfGoodsForm.Free;
  end;
end;

procedure TStandartsOfGoodsForm.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
   case Key of
  VK_RETURN:DBGridEh1DblClick(Nil);
  VK_INSERT:begin
             quGoodStandarts.Append;
             DBGridEh1DblClick(Nil);
            end;
  VK_DELETE:if Application.MessageBox('Вы уверены?','Удаление',MB_YESNO)=IDYES then
             begin
               quGoodStandarts.Delete;
               quGoodStandarts.Refresh;

             end;
end;

end;

procedure TStandartsOfGoodsForm.bbOkClick(Sender: TObject);
begin
  inherited;
  if dsGoodStandarts.State in [dsInsert, dsEdit] then quGoodStandarts.Post;
  ModalResult := mrOk;
end;

procedure TStandartsOfGoodsForm.bbCancelClick(Sender: TObject);
begin
  inherited;
  if dsGoodStandarts.State in [dsInsert, dsEdit] then quGoodStandarts.Cancel;
  ModalResult := mrCancel;
end;

end.
