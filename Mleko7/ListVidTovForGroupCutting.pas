unit ListVidTovForGroupCutting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, StdCtrls, ExtCtrls, DB, GridsEh, DBGridEh,
  MemDS, DBAccess, MSAccess, Buttons;

type
  TListVidTovForGroupCuttingForm = class(TMlekoForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    gbVidTov: TGroupBox;
    gbGroupCutting: TGroupBox;
    bOk: TButton;
    bCancel: TButton;
    dsListVidTovForGroupCutting: TMSDataSource;
    quListVidTovForGroupCutting: TMSQuery;
    dsL_ListVidTovForGroupCutting: TMSDataSource;
    quL_ListVidTovForGroupCutting: TMSQuery;
    DBGridEhVidTov: TDBGridEh;
    DBGridEhGroupCutting: TDBGridEh;
    quListVidTovForGroupCuttingId: TSmallintField;
    quListVidTovForGroupCuttingVidNo: TSmallintField;
    quListVidTovForGroupCuttingVidName: TStringField;
    quL_ListVidTovForGroupCuttingid: TLargeintField;
    quL_ListVidTovForGroupCuttingListVidTovForGroupCuttingId: TSmallintField;
    quL_ListVidTovForGroupCuttingGroupCuttingId: TSmallintField;
    quL_ListVidTovForGroupCuttingVidNo: TSmallintField;
    quL_ListVidTovForGroupCuttingPriorityGroupCutting: TIntegerField;
    quL_ListVidTovForGroupCuttingPercentGroupCutting: TIntegerField;
    quGroupCutting: TMSQuery;
    sbInsert: TSpeedButton;
    sbEdit: TSpeedButton;
    sbDel: TSpeedButton;
    Splitter1: TSplitter;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    MSDataSource1: TMSDataSource;
    quL_ListVidTovForGroupCuttingGroupCuttingName: TStringField;
    quGroupCuttingid: TIntegerField;
    quGroupCuttingNameGropCutting: TStringField;
    quGroupCuttingPriorityGroupCutting: TIntegerField;
    quGroupCuttingPercentGroupCutting: TIntegerField;
    quL_ListVidTovForGroupCuttingDefaultGroupCutting: TBooleanField;
    procedure DBGridEhVidTovCellClick(Column: TColumnEh);
    procedure DBGridEhVidTovKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbDelClick(Sender: TObject);
    procedure sbInsertClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure quL_ListVidTovForGroupCuttingBeforeOpen(DataSet: TDataSet);
    procedure quL_ListVidTovForGroupCuttingBeforePost(DataSet: TDataSet);
    procedure quL_ListVidTovForGroupCuttingAfterPost(DataSet: TDataSet);
    procedure bOkClick(Sender: TObject);
    procedure bCancelClick(Sender: TObject);
    procedure DBGridEhVidTovExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure quListVidTovForGroupCuttingBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    ListVidTovForGroupCuttingId : integer;
  public
    { Public declarations }
  end;

var
  ListVidTovForGroupCuttingForm: TListVidTovForGroupCuttingForm;

implementation

uses data;

{$R *.dfm}

procedure TListVidTovForGroupCuttingForm.DBGridEhVidTovCellClick(
  Column: TColumnEh);
begin
  inherited;
  quL_ListVidTovForGroupCutting.Close;
  quL_ListVidTovForGroupCutting.ParamByName('ListVidTovForGroupCuttingId').Value := quListVidTovForGroupCuttingId.Value;
  quL_ListVidTovForGroupCutting.Open;
end;

procedure TListVidTovForGroupCuttingForm.DBGridEhVidTovKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  quL_ListVidTovForGroupCutting.Close;
  quL_ListVidTovForGroupCutting.ParamByName('ListVidTovForGroupCuttingId').Value := quListVidTovForGroupCuttingId.Value;
  quL_ListVidTovForGroupCutting.Open;
end;

procedure TListVidTovForGroupCuttingForm.sbDelClick(Sender: TObject);
var
 id : integer;
begin
  inherited;
  if quListVidTovForGroupCuttingId.IsNull then id := ListVidTovForGroupCuttingId
                                          else id := quListVidTovForGroupCuttingId.Value;
  if Application.MessageBox('Вы уверены ?', 'Удаление', MB_YESNO or MB_DEFBUTTON2) = ID_YES then
   begin
     dmDataModule.ExecSQL('delete L_ListVidTovForGroupCutting where ListVidTovForGroupCuttingId = :p1_ListVidTovForGroupCuttingId ', [Id]);
     dmDataModule.ExecSQL('delete ListVidTovForGroupCutting where Id = :p1_Id ', [Id]);

     quListVidTovForGroupCutting.Close;
     quListVidTovForGroupCutting.Open;

     quL_ListVidTovForGroupCutting.Close;
     quL_ListVidTovForGroupCutting.Open;
   end;
end;

procedure TListVidTovForGroupCuttingForm.sbInsertClick(Sender: TObject);
begin
  inherited;
  quListVidTovForGroupCutting.Append; 
end;

procedure TListVidTovForGroupCuttingForm.sbEditClick(Sender: TObject);
begin
  inherited;
  quListVidTovForGroupCutting.Edit;
end;

procedure TListVidTovForGroupCuttingForm.SpeedButton3Click(
  Sender: TObject);
begin
  inherited;
  quL_ListVidTovForGroupCutting.Append;
end;

procedure TListVidTovForGroupCuttingForm.SpeedButton2Click(
  Sender: TObject);
begin
  inherited;
  quL_ListVidTovForGroupCutting.Edit;
end;

procedure TListVidTovForGroupCuttingForm.SpeedButton1Click(
  Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Вы уверены ?', 'Удаление', MB_YESNO or MB_DEFBUTTON2) = ID_YES then begin
                                                                                                   if quListVidTovForGroupCuttingId.IsNull then DmDataModule.OpenSQL('select * from L_ListVidTovForGroupCutting where ListVidTovForGroupCuttingId = :p1_ListVidTovForGroupCuttingId',[ListVidTovForGroupCuttingId])
                                                                                                                                           else DmDataModule.OpenSQL('select * from L_ListVidTovForGroupCutting where ListVidTovForGroupCuttingId = :p1_ListVidTovForGroupCuttingId',[quListVidTovForGroupCuttingId.value]);
                                                                                                   if DmDataModule.QFO.RecordCount > 0 then quL_ListVidTovForGroupCutting.Delete;
                                                                                                 end;
end;

procedure TListVidTovForGroupCuttingForm.quL_ListVidTovForGroupCuttingBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  if quListVidTovForGroupCuttingId.IsNull then quL_ListVidTovForGroupCutting.ParamByName('ListVidTovForGroupCuttingId').Value := ListVidTovForGroupCuttingId
                                          else quL_ListVidTovForGroupCutting.ParamByName('ListVidTovForGroupCuttingId').Value := quListVidTovForGroupCuttingId.value;

end;

procedure TListVidTovForGroupCuttingForm.quL_ListVidTovForGroupCuttingBeforePost(
  DataSet: TDataSet);

begin
  inherited;
  DmDataModule.OpenSQL('select PriorityGroupCutting from GroupCutting where id = :p1_id',[quGroupCuttingid.Value]);

  if not DmDataModule.QFO.FieldByName('PriorityGroupCutting').IsNull then quL_ListVidTovForGroupCuttingPriorityGroupCutting.Value := DmDataModule.QFO.FieldByName('PriorityGroupCutting').Value;

  if quListVidTovForGroupCuttingId.IsNull then quL_ListVidTovForGroupCuttingListVidTovForGroupCuttingId.Value := ListVidTovForGroupCuttingId
                                          else quL_ListVidTovForGroupCuttingListVidTovForGroupCuttingId.Value := quListVidTovForGroupCuttingId.value;
  quL_ListVidTovForGroupCuttingVidNo.Value := quListVidTovForGroupCuttingVidNo.Value;
end;

procedure TListVidTovForGroupCuttingForm.quL_ListVidTovForGroupCuttingAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  quL_ListVidTovForGroupCutting.Close;
  quL_ListVidTovForGroupCutting.Open;
end;

procedure TListVidTovForGroupCuttingForm.bOkClick(Sender: TObject);
begin
  inherited;
  if (quL_ListVidTovForGroupCutting.State in [dsInsert, dsEdit]) then quL_ListVidTovForGroupCutting.Post else quL_ListVidTovForGroupCutting.Cancel;
  if (quListVidTovForGroupCutting.State in [dsInsert, dsEdit]) then quListVidTovForGroupCutting.Post else quListVidTovForGroupCutting.Cancel;
end;

procedure TListVidTovForGroupCuttingForm.bCancelClick(Sender: TObject);
begin
  inherited;
  if (quL_ListVidTovForGroupCutting.State in [dsInsert, dsEdit]) then quL_ListVidTovForGroupCutting.Cancel;
  if (quListVidTovForGroupCutting.State in [dsInsert, dsEdit]) then quListVidTovForGroupCutting.Cancel;

end;

procedure TListVidTovForGroupCuttingForm.DBGridEhVidTovExit(
  Sender: TObject);
begin
  inherited;

  if quListVidTovForGroupCutting.State in [dsInsert] then begin
                                                            quListVidTovForGroupCutting.Post;
                                                            DmDataModule.OpenSQL('select isnull(max(id),1) as id from ListVidTovForGroupCutting');
                                                            ListVidTovForGroupCuttingId := DmDataModule.QFO.FieldByName('Id').Value;
//                                                            ShowMessage(DmDataModule.QFO.FieldByName('Id').AsString);
//                                                            ListVidTovForGroupCuttingId := quListVidTovForGroupCuttingId.Value;

                                                          end;
  if quListVidTovForGroupCutting.State in [dsEdit] then begin
                                                          quListVidTovForGroupCutting.Post;
                                                        end;


end;

procedure TListVidTovForGroupCuttingForm.FormCreate(Sender: TObject);
begin
  inherited;
  ListVidTovForGroupCuttingId := 0;
end;

procedure TListVidTovForGroupCuttingForm.quListVidTovForGroupCuttingBeforePost(
  DataSet: TDataSet);
begin
  inherited;
{
  if quListVidTovForGroupCutting.State in [dsInsert] then begin
                                                            DmDataModule.OpenSQL('select isnull(max(id),0) + 1 as id from ListVidTovForGroupCutting');
                                                            quListVidTovForGroupCuttingId.Value := DmDataModule.QFO.FieldByName('Id').Value;
                                                          end;
}
end;

end.
