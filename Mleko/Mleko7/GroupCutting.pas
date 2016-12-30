unit GroupCutting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, DB, DBAccess, MSAccess, MemDS, GridsEh, DBGridEh,
  StdCtrls, Buttons, ExtCtrls, ActnList;

type
  TGroupCuttingForm = class(TMlekoForm)
    Panel1: TPanel;
    Panel2: TPanel;
    sbInsert: TSpeedButton;
    sbEdit: TSpeedButton;
    sbDel: TSpeedButton;
    GroupBox1: TGroupBox;
    DBGridEh1: TDBGridEh;
    quGroupCutting: TMSQuery;
    dsGroupCutting: TMSDataSource;
    quGroupCuttingid: TIntegerField;
    quGroupCuttingNameGropCutting: TStringField;
    quGroupCuttingPriorityGroupCutting: TIntegerField;
    Panel3: TPanel;
    bbCancel: TButton;
    bbOk: TButton;
    quGroupCuttingPercentGroupCutting: TIntegerField;
    procedure sbInsertClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject);
    procedure quGroupCuttingAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  GroupCuttingForm: TGroupCuttingForm;

implementation

uses data;

{$R *.dfm}

procedure TGroupCuttingForm.sbInsertClick(Sender: TObject);
begin
  inherited;
  quGroupCutting.Append;
end;

procedure TGroupCuttingForm.sbDelClick(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Вы уверены ?', 'Удаление', MB_YESNO or MB_DEFBUTTON2) = ID_YES then quGroupCutting.Delete;
end;

procedure TGroupCuttingForm.sbEditClick(Sender: TObject);
begin
  inherited;
  quGroupCutting.Edit;
end;

procedure TGroupCuttingForm.quGroupCuttingAfterPost(DataSet: TDataSet);
begin
  inherited;
  quGroupCutting.Refresh;
end;

end.
