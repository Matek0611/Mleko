unit CuttingMesh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, DB, GridsEh, DBGridEh, ExtCtrls, DBAccess, MSAccess,
  MemDS, ActnList, StdCtrls, Mask, DBCtrlsEh, DBLookupEh, ComCtrls, ToolWin,
  DBGridEhImpExp;

type
  TCuttingMeshForm = class(TMlekoForm)
    quKolCuttiungBlanks: TMSQuery;
    dsKolCuttiungBlanks: TMSDataSource;
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    quKolCuttiungBlanksid: TLargeintField;
    quKolCuttiungBlanksTovarNo: TIntegerField;
    quKolCuttiungBlanksVidTovForGroupCutting: TIntegerField;
    quKolCuttiungBlanksVidName: TStringField;
    quKolCuttiungBlanksPostNo: TIntegerField;
    quKolCuttiungBlanksPostName: TStringField;
    quKolCuttiungBlanksGroupCuttingId: TIntegerField;
    quKolCuttiungBlanksGroupCutting: TStringField;
    quKolCuttiungBlanksPercentGroupCutting: TIntegerField;
    quKolCuttiungBlanksKolOst: TFloatField;
    quKolCuttiungBlanksKolOrd: TFloatField;
    quKolCuttiungBlanksSumAllTovar: TFloatField;
    quKolCuttiungBlanksSumKolGroupCutting: TFloatField;
    quKolCuttiungBlanksSumKolGroupCuttingItog: TFloatField;
    quKolCuttiungBlanksCoefficientGroupCutting: TFloatField;
    quKolCuttiungBlanksKolCutting: TFloatField;
    quKolCuttiungBlanksKolGroupCutting: TIntegerField;
    quKolCuttiungBlanksKolZakazGroupCutting: TIntegerField;
    quKolCuttiungBlanksKolOstFirst: TFloatField;
    quKolCuttiungBlanksKolOstIter: TFloatField;
    quKolCuttiungBlanksKolCuttingIter: TFloatField;
    quKolCuttiungBlanksSumZakTovarNovGroupIter: TFloatField;
    quKolCuttiungBlanksis_weight: TBooleanField;
    quKolCuttiungBlanksNoPP_1: TIntegerField;
    quKolCuttiungBlanksKolOstIter1: TFloatField;
    quKolCuttiungBlanksCoeff1: TFloatField;
    quKolCuttiungBlanksKolCuttingIter1: TFloatField;
    quKolCuttiungBlanksSumKolOstIter1: TFloatField;
    quKolCuttiungBlanksSumKolOstIterPrev1: TFloatField;
    quKolCuttiungBlanksKolOstIter2: TFloatField;
    quKolCuttiungBlanksCoeff2: TFloatField;
    quKolCuttiungBlanksKolCuttingIter2: TFloatField;
    quKolCuttiungBlanksSumKolOstIter2: TFloatField;
    quKolCuttiungBlanksSumKolOstIterPrev2: TFloatField;
    quKolCuttiungBlanksKolOstIter3: TFloatField;
    quKolCuttiungBlanksCoeff3: TFloatField;
    quKolCuttiungBlanksKolCuttingIter3: TFloatField;
    quKolCuttiungBlanksSumKolOstIter3: TFloatField;
    quKolCuttiungBlanksSumKolOstIterPrev3: TFloatField;
    quKolCuttiungBlanksNameTovar: TStringField;
    quCuttingMashFilter: TMSQuery;
    dsCuttingMashFilter: TMSDataSource;
    quCuttingMashFilterGroupCuttingId: TIntegerField;
    quCuttingMashFilterGroupCutting: TStringField;
    ToolBar: TToolBar;
    ToolBtnRefresh: TToolButton;
    ToolButton5: TToolButton;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    ToolButton1: TToolButton;
    sdExportCuttingMeshInExel: TSaveDialog;
    dtFilterDate: TDBDateTimeEditEh;
    procedure ToolBtnRefreshClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure dtFilterDateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CuttingMeshForm: TCuttingMeshForm;

implementation

uses data, main;

{$R *.dfm}

procedure TCuttingMeshForm.ToolBtnRefreshClick(Sender: TObject);
begin
  inherited;
  quKolCuttiungBlanks.Close;
  if not quCuttingMashFilterGroupCuttingId.IsNull then quKolCuttiungBlanks.MacroByName('_where').Value := 'and GroupCuttingId = ' + quCuttingMashFilterGroupCuttingId.AsString
                                                  else quKolCuttiungBlanks.MacroByName('_where').Value := '';
  quKolCuttiungBlanks.Open;                                                  
end;

procedure TCuttingMeshForm.ToolButton1Click(Sender: TObject);
begin
  inherited;
  sdExportCuttingMeshInExel.DefaultExt := '.xls';   // Выбираем файл для экспорта данных
  sdExportCuttingMeshInExel.Filter := 'Excel (*.xls)|*.xls'; // Устанавливаем фильтер

  if sdExportCuttingMeshInExel.Execute then SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,DBGridEh1,sdExportCuttingMeshInExel.FileName,True);

  if FileExists(sdExportCuttingMeshInExel.FileName) then ShowMessage('Создан файл: '+sdExportCuttingMeshInExel.FileName)
                                                    else ShowMessage('Файл '+sdExportCuttingMeshInExel.FileName+' не создан!'+ #10#13 +
                                                                     'Обратитесь к системному администратору!');
end;

procedure TCuttingMeshForm.dtFilterDateChange(Sender: TObject);
begin
  inherited;
  quKolCuttiungBlanks.Close;
  quKolCuttiungBlanks.ParamByName('DateNakl').Value := dtFilterDate.Value;
  quKolCuttiungBlanks.Open;

end;

procedure TCuttingMeshForm.FormShow(Sender: TObject);
begin
  inherited;
  dtFilterDate.Value := GlobalDateNakl;
end;

end.
