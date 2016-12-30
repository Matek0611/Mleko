unit EditOtdel0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CFLMLKPropCustomDialog, citCtrls, citmask, citDBComboEdit,
  MSAccess, DB, MemDS, DBAccess, ActnList, ComCtrls, ToolWin, StdCtrls,
  Mask, DBCtrls, DBGridEh, DBCtrlsEh, DBLookupEh;

type
  TEditOtdelForm = class(TCFLMLKPropCustomDialogDlg)
    DBText1: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    p_response_dept_id: TcitDBComboEdit;
    p_activity_type_id: TcitDBComboEdit;
    Label3: TLabel;
    quManager_Team: TMSQuery;
    lcManager_Team: TDBLookupComboboxEh;
    dsManager_Team: TMSDataSource;
    quManager_TeamID: TIntegerField;
    quManager_TeamName: TStringField;
    quManager_Teampkey: TLargeintField;
    procedure ActionOKExecute(Sender: TObject);
    procedure ActionApplyExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditOtdelForm: TEditOtdelForm;
  procedure EditOtdel;

implementation

uses OtdelForm0, data;

{$R *.dfm}
procedure EditOtdel;
begin
 EditOtdelForm:=TEditOtdelForm.Create(Application);
 EditOtdelForm.p_response_dept_id.text := dmDataModule.quVidOtdelD_RESPONSE_DEPT_NAME.Value;
 EditOtdelForm.p_activity_type_id.text := dmDataModule.quVidOtdelD_ACTIVITY_TYPE_NAME.value;
 EditOtdelForm.lcManager_Team.KeyValue := dmDataModule.quVidOtdelManager_Team_Id.Value;

// EditOtdelForm.lcManager_Team.text := dmDataModule.quVidOtdelNameManegerTeam.value;

 EditOtdelForm.quManager_Team.Open;
{
 EditOtdelForm.D_ACTIVITY_TYPE.text :=  dmDataModule.quVidOtdelD_ACTIVITY_TYPE_NAME.value;
 EditOtdelForm.ResponseDept.Text := dmDataModule.quVidOtdelD_RESPONSE_DEPT_NAME.Value;
}
 try
 if EditOtdelForm.ShowModal=mrOk then
  begin
   if dmDataModule.quVidOtdel.State in [dsInsert,dsEdit] then
    dmDataModule.quVidOtdel.Post;
   dmDataModule.quVidOtdel.Close;
   dmDataModule.quVidOtdel.Open;
  end
 else
  begin
   if dmDataModule.quVidOtdel.State in [dsInsert,dsEdit] then
    dmDataModule.quVidOtdel.Cancel;
  end
 finally
  EditOtdelForm.quManager_Team.Close;
  EditOtdelForm.Free;
 end;
end;
procedure TEditOtdelForm.ActionOKExecute(Sender: TObject);
begin
  inherited;
  if not (dmDataModule.quVidOtdel.State in [dsInsert,dsEdit]) then dmDataModule.quVidOtdel.Edit;

  dmDataModule.OpenSQL('select id from D_RESPONSE_DEPT where Name = :p1',[p_response_dept_id.text]);
  dmDataModule.quVidOtdelD_RESPONSE_DEPT_ID.Value := dmDataModule.QFO.FIeldByName('Id').AsInteger;

  dmDataModule.OpenSQL('select id from D_ACTIVITY_TYPE where Name = :p1',[p_activity_type_id.text]);
  dmDataModule.quVidOtdelD_ACTIVITY_TYPE_ID.Value := dmDataModule.QFO.FIeldByName('Id').AsInteger;

  dmDataModule.quVidOtdelManager_Team_Id.Value := quManager_TeamID.Value;
{
  dmDataModule.quVidOtdelD_ACTIVITY_TYPE_ID.Value := quD_ACTIVITY_TYPEid.Value;
  dmDataModule.quVidOtdelD_RESPONSE_DEPT_ID.Value := quResponseDeptID.Value;
}
end;

procedure TEditOtdelForm.ActionApplyExecute(Sender: TObject);
begin
  inherited;
  if not (dmDataModule.quVidOtdel.State in [dsInsert,dsEdit]) then dmDataModule.quVidOtdel.Edit;

  dmDataModule.OpenSQL('select id from D_RESPONSE_DEPT where Name = :p1',[p_response_dept_id.text]);
  dmDataModule.quVidOtdelD_RESPONSE_DEPT_ID.Value := dmDataModule.QFO.FIeldByName('Id').AsInteger;

  dmDataModule.OpenSQL('select id from D_ACTIVITY_TYPE where Name = :p1',[p_activity_type_id.text]);
  dmDataModule.quVidOtdelD_ACTIVITY_TYPE_ID.Value := dmDataModule.QFO.FIeldByName('Id').AsInteger;

  dmDataModule.quVidOtdelManager_Team_Id.Value := quManager_TeamID.Value;

  dmDataModule.quVidOtdel.Post;
end;

end.
