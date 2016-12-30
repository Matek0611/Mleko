unit Employee;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, DB, MemDS, DBAccess, MSAccess, GridsEh,
  DBGridEh, ExtCtrls, StdCtrls, Buttons;

type
  TEmployee0 = class(TMlekoForm)
    dsEmployee: TDataSource;
    quEmployee: TMSQuery;
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    quEmployeeScope: TMSQuery;
    quEmployeeScopeScopeNo: TIntegerField;
    quEmployeeScopeEmployeeNo: TIntegerField;
    quEmployeeScopeScopeName: TStringField;
    quEmployeeScopeScopeLevel: TIntegerField;
    dsEmployeeScope: TDataSource;
    Panel2: TPanel;
    bbExit: TBitBtn;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    StaticText1: TStaticText;
    quEmployeeEmployeeNo: TIntegerField;
    quEmployeeName: TStringField;
    quEmployeeLastName: TStringField;
    quEmployeeMiddleName: TStringField;
    quEmployeeLogin: TStringField;
    quEmployeePassword: TStringField;
    quEmployeeTrash: TBooleanField;
    quEmployeeEmployeePostNo: TSmallintField;
    quEmployeeEmployeeSotrudNo: TSmallintField;
    quEmployeeEmployeeSetArticleGroupId: TLargeintField;
    quEmployeeTabletId: TIntegerField;
    quEmployeeEmploeeScopeNo: TIntegerField;
    quEmployeeEmploeeCarsNo: TSmallintField;
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Employee0: TEmployee0;

  procedure ShowEmployee;

implementation

uses data, EditEmployee0;

{$R *.dfm}

procedure ShowEmployee;
begin
 Employee0:=TEmployee0.Create(Application);
 try
 Employee0.quEmployee.Open;
 Employee0.quEmployeeScope.Open;
 Employee0.ShowModal;
 finally
 Employee0.quEmployee.Close;
 Employee0.quEmployeeScope.Close;
 Employee0.Free;
 end;
end;

procedure TEmployee0.DBGridEh1DblClick(Sender: TObject);
begin
  EditEmployee:=TEditEmployee.Create(Application);
  try

  quEmployeeScope.Close;
  quEmployeeScope.ParamByName('EmployeeNo').Value := quEmployeeEmployeeNo.Value;
  quEmployeeScope.Open;

  EditEmployee.ShowModal;
  finally
  EditEmployee.Free;
  end;
end;


procedure TEmployee0.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
  VK_RETURN:Employee0.DBGridEh1DblClick(Nil);
  VK_INSERT:begin
             quEmployee.Append;
             quEmployeeScope.Append;
             Employee0.DBGridEh1DblClick(Nil);
            end;
  VK_DELETE:if Application.MessageBox('Вы уверены?','Удаление',MB_YESNO)=IDYES then
             begin
               quEmployeeScope.Close;
               quEmployeeScope.ParamByName('EmployeeNo').Value := quEmployeeEmployeeNo.Value;
               quEmployeeScope.Open;
               quEmployee.Delete;
//               quEmployeeScope.Delete;
             end;
 end;

end;



end.
