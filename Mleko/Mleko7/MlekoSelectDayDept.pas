unit MlekoSelectDayDept;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKSelect, DB, DBAccess, MsAccess, ADODB, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  StdCtrls, citCtrls, citmask, citDBComboEdit,
  comp_TargetFilter_CustomFilter, comp_TargetFilter_StringFilter, MemDS,
  COMPSQLBuilder, citComponentProps, ActnList, comp_TargetFilter_Panel,
  ComCtrls, ToolWin, Grids, DBGrids, citDbGrid, ExtCtrls,IniFiles;

type
  TMlekoSelectDayDeptDlg = class(TCFLMLKSelectDlg)
    FilterName: TTargetFilter_StringFilter;
    CBoxFilter: TCheckBox;
    ActionNameFilter: TAction;
    Label1: TLabel;
    ADOQuery1: TADOQuery;
    quOurFirm: TMSQuery;
    cbOurFirm: TcitDBComboEdit;
    citEditWorkDate: TCxDateEdit;
    QuGetDayWeek: TMSQuery;
    procedure FormShow(Sender: TObject);
    procedure ActionNameFilterExecute(Sender: TObject);
  private
    { Private declarations }
  public
    class function SelectDayDept:boolean;
  end;

var
  MlekoSelectDayDeptDlg: TMlekoSelectDayDeptDlg;

implementation

uses main, data ;

{$R *.dfm}

procedure TMlekoSelectDayDeptDlg.FormShow(Sender: TObject);
begin
  inherited;
  ActionNameFilter.Execute;
  citEditWorkDate.Date := Date()+1;
end;

class function TMlekoSelectDayDeptDlg.SelectDayDept:boolean;
Var lOtdelNo,l_our_firm: integer;
  Dlg: TMlekoSelectDayDeptDlg;
  Ini:TIniFile;
begin
  Dlg := Create(Application);
  Ini:=TIniFile.Create(ExtractFilePath(ParamStr(0))+'setup.ini');
  dlg.cbOurFirm.KeyFieldValue:=IntToStr(dmDataModule.FirmNo);
  dlg.cbOurFirm.GetLocateKey;
  try
    DLG.is_hold_form:=false;
    Result := Dlg.ShowModal = mrOk;
    if result then begin
        main.GlobalOtdelNo:=dlg.Query.FieldByName('id').AsInteger;
        main.GlobalDateNakl:=dlg.citEditWorkDate.Date;
        main.GlobalOurFirmNo := dlg.quOurFirm.FieldByName('PostNo').AsInteger;;
        dmDataModule.FirmNo:=dlg.quOurFirm.FieldByName('PostNo').AsInteger;
        dmDataModule.OurFirmName:=dlg.quOurFirm.FieldByName('Name').AsString;
        Dlg.QuGetDayWeek.Close;
        Dlg.QuGetDayWeek.ParamByName('p1_date').AsDate:=main.GlobalDateNakl;
        Dlg.QuGetDayWeek.Open;
        main.day_of_week:=Dlg.QuGetDayWeek.fieldByName('day_of_week').AsInteger;
        ini.WriteString('Options','LastOurFirm',IntToStr(dmDataModule.FirmNo));
     end;
  finally
    Ini.Free;
    Dlg.Free;
  end;
end;

procedure TMlekoSelectDayDeptDlg.ActionNameFilterExecute(Sender: TObject);
begin
  inherited;
  if CBoxFilter.Checked then FilterName.a_LikeStr_Prefix:=''
                        else FilterName.a_LikeStr_Prefix:='%';
end;

initialization
 RegisterClass(TMlekoSelectDayDeptDlg);

finalization
 UnRegisterClass(TMlekoSelectDayDeptDlg);

end.
