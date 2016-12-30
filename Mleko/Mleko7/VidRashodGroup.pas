unit VidRashodGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, ComCtrls, ToolWin, StdCtrls, GridsEh, Db,
  DBGridEh;

type
  TVidRashodGroupForm = class(TMlekoForm)
    GroupBox1: TGroupBox;
    ToolBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolBtnRefresh: TToolButton;
    DBGridEh1: TDBGridEh;
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolBtnRefreshClick(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VidRashodGroupForm: TVidRashodGroupForm;
  function ShowVidRashodGroup(Visible: Boolean): integer;

implementation

uses data, EditVidRashodGroup;

{$R *.dfm}

function ShowVidRashodGroup(Visible: Boolean): integer;
begin
 VidRashodGroupForm := TVidRashodGroupForm.Create(Application);
 try

 if Visible then dmDataModule.quVidRashodGroup1.MacroByName('_where').Value:= ' and isnull(isTrash,0) = 0 '
            else dmDataModule.quVidRashodGroup1.MacroByName('_where').Value:=' ';

 dmDataModule.quVidRashodGroup1.Open;

 if VidRashodGroupForm.ShowModal=mrOk then
  Result:=dmDataModule.quVidRashodGroup1Id.AsInteger
 finally
  dmDataModule.quVidRashodGroup1.Close;
  VidRashodGroupForm.Free;
 end;
end;

procedure TVidRashodGroupForm.ToolButton1Click(Sender: TObject);
begin
  inherited;
  dmDataModule.quVidRashodGroup1.Append;

//  showmessage(dmDataModule.quVidRashodGroup1id.AsString);

  EditVidRashGroup;
end;

procedure TVidRashodGroupForm.ToolButton2Click(Sender: TObject);
begin
  inherited;
  EditVidRashGroup;
end;

procedure TVidRashodGroupForm.ToolButton3Click(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
  dmDataModule.quVidRashodGroup1.Delete;
{
  showmessage(dmDataModule.quVidRashodGroup1id.AsString);

  dmDataModule.quVidRashodGroup1.Close;
  dmDataModule.quVidRashodGroup1.Open;
}
end;

procedure TVidRashodGroupForm.ToolBtnRefreshClick(Sender: TObject);
begin
  inherited;
  dmDataModule.quVidRashodGroup1.Close;
  dmDataModule.quVidRashodGroup1.MacroByName('_where').Value:=' ';
  dmDataModule.quVidRashodGroup1.Open;
end;

procedure TVidRashodGroupForm.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
  if dmDataModule.quVidRashodGroup1IsTrash.AsBoolean then
    DBGridEh1.Canvas.Font.Color := clRed;
  DBGridEh1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

end.
