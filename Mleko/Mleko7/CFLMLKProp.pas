unit CFLMLKProp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm, CFLMLKCustom,
  Dialogs, ActnList, ComCtrls, StdCtrls, citComponentProps, citDBComboEdit,
  citCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TCFLMLKPropDlg = class(TCFLMLKCustomForm)
    ButtonOK: TButton;
    ButtonCancel: TButton;
    ButtonApply: TButton;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    ActionOK: TAction;
    ActionCancel: TAction;
    ActionApply: TAction;
    procedure FormCreate(Sender: TObject);
    procedure ActionApplyExecute(Sender: TObject);
    procedure ActionOKExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActionListExecute(Action: TBasicAction;
      var Handled: Boolean);
  private
    FDataChanged: boolean;
    FSaved: boolean;
    FFirstControl: TWinControl;
    OldActiveForm: AnsiString;
    FOwnerName: string;
  protected
    FActionExecRightList: TStringList;
    FOpenPage: integer;
    ActiveSession: string;
    procedure SetDataChanged(aDataChanged: boolean); virtual;
    procedure SetSaved(aSaved: boolean); virtual;
  public
    property DataChanged: boolean read FDataChanged write SetDataChanged;
    property Saved: boolean read FSaved write SetSaved;
    property FirstControl: TWinControl read FFirstControl write FFirstControl;
    property OwnerName: string read FOwnerName write FOwnerName;
  end;

var
  CFLMLKPropDlg: TCFLMLKPropDlg;

implementation

{$R *.dfm}

procedure TCFLMLKPropDlg.SetDataChanged(aDataChanged: boolean);
begin
  FDataChanged := aDataChanged;
  //    ActionApply.Enabled := aDataChanged;
end;

procedure TCFLMLKPropDlg.SetSaved(aSaved: boolean);
begin
  FSaved := aSaved;
end;

procedure TCFLMLKPropDlg.FormCreate(Sender: TObject);
var
  i: integer;
begin
  inherited;
  DataChanged := false;
  Saved := false;
  FOpenPage := 0;
  FActionExecRightList := TStringList.Create;
  FActionExecRightList.Sorted := True;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TActionList) then
      (Components[i] as TActionList).OnExecute := ActionListExecute;

  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TcitComponentProps) then
      if TcitComponentProps(Components[i]).Enabled then TcitComponentProps(Components[i]).RestoreFromStorage;
end;

procedure TCFLMLKPropDlg.ActionApplyExecute(Sender: TObject);
var
  i: integer;
begin
  try
    for i := 0 to ComponentCount - 1 do
    begin
      if Components[i].InheritsFrom(TcitCustomEdit) and
        (Components[i] as TcitCustomEdit).Required and
        ((Components[i] as TcitCustomEdit).Text = '') then
      begin
        if (Components[i] as TcitCustomEdit).CanFocus then (Components[i] as TcitCustomEdit).SetFocus;
        raise Exception.CreateFmt('Не заполнено обязательное поле (%s)', [(Components[i] as TcitCustomEdit).LLblCaption]);
        Saved := False;
        DataChanged := true;
      end;
    end;
    Saved := true;
    DataChanged := false;
  except
    on E: Exception do
    begin
      MessageDlg(E.Message, mtError, [mbOK], 0);
      DataChanged := true;
      Saved := false;
    end;
  end;
end;

procedure TCFLMLKPropDlg.ActionOKExecute(Sender: TObject);
begin
  ActionApply.Execute;
  if Saved then ModalResult := mrOk;
end;

procedure TCFLMLKPropDlg.ActionCancelExecute(Sender: TObject);
begin
  if Saved then
    ModalResult := mrOk
  else
    ModalResult := mrCancel;
end;

procedure TCFLMLKPropDlg.FormShow(Sender: TObject);
var
  i: integer;
begin
  inherited;
  PageControl.ActivePageIndex := FOpenPage;
  if Assigned(FirstControl) then
    with FirstControl do
      if CanFocus then SetFocus;
end;

procedure TCFLMLKPropDlg.ActionListExecute(Action: TBasicAction;
  var Handled: Boolean);
begin
  Handled := False; // продолжаем обработку Action'а
end;

end.

