unit PatternPrihodOrderSpec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CFLMLKCustom, ActnList, ExtCtrls, StdCtrls, DB, MemDS, DBAccess,
  MSAccess, citCtrls, citmask, citDBComboEdit, GridsEh, DBGridEh;

type
  TPatternPrihodOrderSpecForm = class(TCFLMLKCustomForm)
    gbPatternSpec: TGroupBox;
    Panel1: TPanel;
    dsPatternSpec: TMSDataSource;
    quPatternSpec: TMSQuery;
    DBGridEh1: TDBGridEh;
    EdTovar: TcitDBComboEdit;
    spCreatePrihodOrderShablon: TMSStoredProc;
    quPatternSpecTovarNOPP: TIntegerField;
    quPatternSpecTovarNo: TSmallintField;
    quPatternSpecNameTovar: TStringField;
    quPatternSpecNameShablon: TStringField;
    function EdTovarIsSelect(Sender: TObject): Boolean;
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdTovarSelectOk(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PatternPrihodOrderSpecForm: TPatternPrihodOrderSpecForm;

implementation

uses data;


{$R *.dfm}

function TPatternPrihodOrderSpecForm.EdTovarIsSelect(
  Sender: TObject): Boolean;
var
  quEdit : TMSQuery;
begin
  inherited;
  spCreatePrihodOrderShablon.Close;
  spCreatePrihodOrderShablon.ParamByName('SPID').AsInteger := dmDataModule.SPID;
  spCreatePrihodOrderShablon.ParamByName('UserNo').AsInteger := data.UserNo;
  spCreatePrihodOrderShablon.ParamByName('NameShablon').AsString := quPatternSpec.ParamByName('NameShablon').AsString;
  spCreatePrihodOrderShablon.Execute;
  quPatternSpec.Refresh;
  DBGridEh1.Refresh;
end;

procedure TPatternPrihodOrderSpecForm.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
   VK_DELETE:if Application.MessageBox('Вы уверены?','Удаление',MB_YESNO)=IDYES then
             begin
               quPatternSpec.Delete;
               quPatternSpec.Refresh;
             end;
  end;
end;

procedure TPatternPrihodOrderSpecForm.EdTovarSelectOk(Sender: TObject);
begin
  inherited;
  spCreatePrihodOrderShablon.Close;
  spCreatePrihodOrderShablon.ParamByName('SPID').AsInteger := dmDataModule.SPID;
  spCreatePrihodOrderShablon.ParamByName('UserNo').AsInteger := data.UserNo;
  spCreatePrihodOrderShablon.ParamByName('NameShablon').AsString := quPatternSpec.ParamByName('NameShablon').AsString;
  spCreatePrihodOrderShablon.Execute;
  quPatternSpec.Refresh;
  DBGridEh1.Refresh;
end;

end.
