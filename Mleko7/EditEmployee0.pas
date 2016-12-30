unit EditEmployee0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, StdCtrls, Mask, DBCtrlsEh, ExtCtrls, DB,
  Buttons;

type
  TEditEmployee = class(TMlekoForm)
    Panel1: TPanel;
    DBEditEhLastName: TDBEditEh;
    DBEditEhName: TDBEditEh;
    DBEditEhMiddleName: TDBEditEh;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEditEhPassword: TDBEditEh;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEditEhScopeName: TDBEditEh;
    DBEditEhScopeLevel: TDBEditEh;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    Label7: TLabel;
    DBEditEhLogin: TDBEditEh;
    Panel2: TPanel;
    Label8: TLabel;
    DBEditEhEmploeeCarsNo: TDBEditEh;
    DBEditEhEmployeePostNo: TDBEditEh;
    DBEditEhEmployeeSotrudNo: TDBEditEh;
    Label9: TLabel;
    Label10: TLabel;
    procedure bbOkClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure DBEditEhEmployeePostNoDblClick(Sender: TObject);
    procedure DBEditEhEmployeePostNoEnter(Sender: TObject);
    procedure DBEditEhEmployeeSotrudNoDblClick(Sender: TObject);
    procedure DBEditEhEmployeeSotrudNoEnter(Sender: TObject);
    procedure DBEditEhEmploeeCarsNoDblClick(Sender: TObject);
    procedure DBEditEhEmploeeCarsNoEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditEmployee: TEditEmployee;

implementation

uses  Employee, data, MlekoSelectFirmForBlank, MlekoSelectFIrm, Sotrud0, Cars0;

{$R *.dfm}

procedure TEditEmployee.bbOkClick(Sender: TObject);
begin
 try
 if not (Employee0.quEmployee.State in [dsEdit,dsInsert]) then
   Employee0.quEmployee.Edit;

 if Employee0.quEmployee.State in [dsEdit,dsInsert] then
   Employee0.quEmployee.Post;

 if Employee0.quEmployeeScope.State in [dsEdit,dsInsert] then
   Employee0.quEmployeeScope.Edit;

 if Employee0.quEmployeeScope.State in [dsEdit,dsInsert] then
  begin
    Employee0.quEmployeeScopeEmployeeNo.Value := Employee0.quEmployeeEmployeeNo.Value;
    Employee0.quEmployeeScope.Post;
  end
 except
  SysUtils.Beep;
  exit;
 end;
 Employee0.quEmployee.Refresh;
 Employee0.quEmployeeScope.Refresh;
 end;

{
  inherited;
  if not (Employee0.quEmployee.State in [dsEdit,dsInsert]) then
  Employee0.quEmployee.Edit;

  if (Employee0.quEmployee.State in [dsEdit,dsInsert]) then
  Employee0.quEmployee.Post;
end;
 }

procedure TEditEmployee.bbCancelClick(Sender: TObject);
begin
  Employee0.quEmployee.Cancel;
  Employee0.quEmployeeScope.Cancel;
end;

procedure TEditEmployee.DBEditEhEmployeePostNoDblClick(Sender: TObject);
var
  Dlg:TMlekoSelectFIrmDlg;
begin
  inherited;
  ShowMessage('Выберите Контрагента из списка');
  Dlg := TMlekoSelectFIrmDlg.Create(Application);
  try
   if Dlg.ShowModal = mrok Then
    begin // Dlg.ShowModal = mrok
      Employee0.quEmployee.Edit;
      Employee0.quEmployeeEmployeePostNo.Value := Dlg.Query.FieldByName('PostNo').Value;
    end; // Dlg.ShowModal = mrok
  finally
   Dlg.Query.Close;
   Dlg.Free;
  end;
end;

procedure TEditEmployee.DBEditEhEmployeePostNoEnter(Sender: TObject);
var
  Dlg:TMlekoSelectFIrmDlg;
begin
  inherited;
  ShowMessage('Выберите Контрагента из списка');
  Dlg := TMlekoSelectFIrmDlg.Create(Application);
  try
   if Dlg.ShowModal = mrok Then
    begin // Dlg.ShowModal = mrok
      Employee0.quEmployee.Edit;
      Employee0.quEmployeeEmployeePostNo.Value := Dlg.Query.FieldByName('PostNo').Value;
    end; // Dlg.ShowModal = mrok
  finally
   Dlg.Query.Close;
   Dlg.Free;
  end;

end;

procedure TEditEmployee.DBEditEhEmployeeSotrudNoDblClick(Sender: TObject);
var
  Dlg:TfmSotrud;
begin
  inherited;
  ShowMessage('Выберите сотрудника из списка');
  Dlg := TfmSotrud.Create(Application);
  Dlg.sbInsert.Enabled := false;
  Dlg.SpeedButton2.Enabled := false;
  Dlg.SpeedButton3.Enabled := false;
  Dlg.SpeedButton4.Enabled := False;
  Dlg.RxDBGrid1.EditorMode := false;
  Dlg.RxDBGrid1.ReadOnly := true;
//  Dlg.RxDBGrid1.OnDblClick = '';
  try
   if Dlg.ShowModal = mrok Then
    begin // Dlg.ShowModal = mrok
      Employee0.quEmployeeEmployeeSotrudNo.Value := dmDataModule.quSotrudSotrudNo.Value;
    end; // Dlg.ShowModal = mrok
  finally
   Dlg.Free;
  end;
end;

procedure TEditEmployee.DBEditEhEmployeeSotrudNoEnter(Sender: TObject);
var
  Dlg:TfmSotrud;
begin
  inherited;
  ShowMessage('Выберите сотрудника из списка');
  Dlg := TfmSotrud.Create(Application);
  try
   if Dlg.ShowModal = mrok Then
    begin // Dlg.ShowModal = mrok
      Employee0.quEmployeeEmployeeSotrudNo.Value := dmDataModule.quSotrudSotrudNo.Value;
    end; // Dlg.ShowModal = mrok
  finally
   Dlg.Free;
  end;
end;

procedure TEditEmployee.DBEditEhEmploeeCarsNoDblClick(Sender: TObject);
var
  Dlg:TfmCars;
begin
  inherited;
  ShowMessage('Выберите автомобиль из списка');
  Dlg := TfmCars.Create(Application);
  dmDataModule.quCars.MacroByName('_where').Value:= 'AND (Visible=0) AND (CarsDelete=0)';
  dmDataModule.quCars.Open;
  try
   if Dlg.ShowModal = mrok Then
    begin // Dlg.ShowModal = mrok
      Employee0.quEmployeeEmploeeCarsNo.Value := dmDataModule.quCarsCarsNo.Value;
    end; // Dlg.ShowModal = mrok
  finally
   dmDataModule.quCars.Close;
   Dlg.Free;
  end;
end;

procedure TEditEmployee.DBEditEhEmploeeCarsNoEnter(Sender: TObject);
var
  Dlg:TfmCars;
begin
  inherited;
  ShowMessage('Выберите автомобиль из списка');
  Dlg := TfmCars.Create(Application);
  dmDataModule.quCars.MacroByName('_where').Value:= 'AND (Visible=0) AND (CarsDelete=0)';
  dmDataModule.quCars.Open;
  try
   if Dlg.ShowModal = mrok Then
    begin // Dlg.ShowModal = mrok
      Employee0.quEmployeeEmploeeCarsNo.Value := dmDataModule.quCarsCarsNo.Value;
    end; // Dlg.ShowModal = mrok
  finally
   dmDataModule.quCars.Close;
   Dlg.Free;
  end;
end;

end.
