unit CFLEHList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKMDIChild, ActnList, Menus, ToolWin, ComCtrls, 
  ExtCtrls, comp_TargetFilter_NumberFilter,
  comp_TargetFilter_CustomFilter, comp_TargetFilter_DateFilter,
  comp_TargetFilter_Panel, COMPSQLBuilder, DB,     DBAccess,
  citComponentProps, comp_TargetFilter_StringFilter,
  comp_TargetFilter_BooleanFilter, comp_TargetFilter_LookupFilter,
  comp_TargetFilter_DictionaryFilter, citDbGrid,   
  DBGridEh, PrViewEh,DBGridEhImpExp, PrnDbgeh, PropStorageEh, PropFilerEh,
  MemDS, MsAccess, GridsEh;

type
  TSearchParamRec = record
    sSearchText : string;
    sSearchFieldName : string;
    bForward : boolean;
    bCaseSensitive : boolean;
  end;

  TCFLEHListForm = class(TCFLMLKMDIChildForm)
    ActionItemAdd: TAction;
    ActionItemProp: TAction;
    ActionItemDel: TAction;
    ActionViewRefresh: TAction;
    ActionViewLayout: TAction;
    ToolBtnAdd: TToolButton;
    ToolBtnProp: TToolButton;
    ToolBtnDel: TToolButton;
    ToolButton4: TToolButton;
    ToolBtnRefresh: TToolButton;
    ToolBtnLayout: TToolButton;
    PageControlTop: TPageControl;
    TabSheet1: TTabSheet;
    PanelGrid: TPanel;
    FilterPanel: TTargetFilter_Panel;
    Query: TMSQuery;
    ActionViewFilter: TAction;
    ActionViewFilterOff: TAction;
    ToolButton8: TToolButton;
    PopupMenuGrid: TPopupMenu;
    pmiInsert: TMenuItem;
    pmiProp: TMenuItem;
    pmiDelete: TMenuItem;
    pmiDiv1: TMenuItem;
    pmiRefresh: TMenuItem;
    pmiLayout: TMenuItem;
    pmiDiv2: TMenuItem;
    pmiClearFilter: TMenuItem;
    ActionRowSelect: TAction;
    pmiRowSelect: TMenuItem;
    ActionDebugAll: TAction;
    ActionFind: TAction;
    ActionFindNext: TAction;
    ActionFindReverse: TAction;
    ActionShowContextValues: TAction;
    IniPropStorageMan: TIniPropStorageManEh;
    DS: TDataSource;
    DBGrid: TDBGridEh;
    PrintDBGridEh1: TPrintDBGridEh;
    ActionPrint: TAction;
    ToolButton2: TToolButton;
    ToolButton1: TToolButton;
    ActionSave: TAction;
    SaveDialog1: TSaveDialog;
    procedure ActionViewRefreshExecute(Sender: TObject);
    procedure ActionViewLayoutExecute(Sender: TObject);
    function SQLBuilderGetOrderBy(Sender: TObject): String;
    procedure ActionViewFilterOffExecute(Sender: TObject);
    procedure ActionViewFilterExecute(Sender: TObject);
    procedure DBGridTitlePressed(Sender: TcitDBGrid; Field: TField);
    procedure ActionRowSelectExecute(Sender: TObject);
    procedure QueryAfterOpen(DataSet: TDataSet);
    procedure QueryAfterRefresh(DataSet: TDataSet);
    procedure ActionDebugAllExecute(Sender: TObject);
    procedure QueryAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ActionPrintExecute(Sender: TObject);
    procedure ActionSaveExecute(Sender: TObject);
  private
    FIsDatasetEmpty: boolean;
  protected
    SearchParamRec : TSearchParamRec;
    property IsDatasetEmpty: boolean read FIsDatasetEmpty;
    procedure SetActionsEnabled; virtual;
  public
    class procedure ShowForm(const MultiCopy: boolean); overload; override;
    class procedure ShowForm(const MultiCopy: boolean; var NewForm: TCFLMLKMDIChildForm; var IsNew: boolean); overload; override;
  end;

var
  CFLEHListForm: TCFLEHListForm;

implementation

uses data;


{$R *.dfm}

class procedure TCFLEHListForm.ShowForm(const MultiCopy: boolean);
var
    NewForm: TCFLMLKMDIChildForm;
    IsNew: boolean;
begin
    inherited ShowForm(MultiCopy, NewForm, IsNew);
    if IsNew then begin
        (NewForm as TCFLEHListForm).DS.DataSet.Open;
        (NewForm as TCFLEHListForm).DBGrid.Refresh;
    end;
end;

class procedure TCFLEHListForm.ShowForm(const MultiCopy: boolean; var NewForm: TCFLMLKMDIChildForm; var IsNew: boolean);
begin
    inherited ShowForm(MultiCopy, NewForm, IsNew);
    if IsNew then begin
        (NewForm as TCFLEHListForm).DS.DataSet.Open;
        (NewForm as TCFLEHListForm).DBGrid.Refresh;
    end;
end;

procedure TCFLEHListForm.ActionViewRefreshExecute(Sender: TObject);
var l_old_id: integer;
is_locate: boolean;
begin
    inherited;
  is_locate:=false;
  if DBGrid.DataSource.DataSet.Active then begin
    l_old_id:=DBGrid.DataSource.DataSet.FieldByName('ID').AsInteger;
    is_locate:=true;
  end;
    DBGrid.DataSource.DataSet.Close;
    DBGrid.DataSource.DataSet.Open;    
    DBGrid.Refresh;    
  if is_locate then DBGrid.DataSource.DataSet.Locate('ID',l_old_id,[]);
end;

procedure TCFLEHListForm.ActionViewLayoutExecute(Sender: TObject);
begin
    inherited;
//    DBGrid.ChangeLayout;
end;

function TCFLEHListForm.SQLBuilderGetOrderBy(Sender: TObject): String;
begin
    inherited;
//    Result := DBGrid.OrderBy;
end;

procedure TCFLEHListForm.ActionViewFilterOffExecute(Sender: TObject);
var
    i: integer;
begin
    inherited;
    //Выключение фильтров
    for i:=0 to ComponentCount - 1 do
        if Components[i].InheritsFrom(TtargetFilter_CustomFilter) then begin
            //По дате
            if Components[i].ClassNameIs('TTargetFilter_DateFilter') then
                (Components[i] as TTargetFilter_DateFilter).a_ConditionType := dctNone;
            //По строке
            if Components[i].ClassNameIs('TTargetFilter_StringFilter') then
                (Components[i] as TTargetFilter_StringFilter).a_LikeStr := '';
            //Логические фильтры
            if Components[i].ClassNameIs('TTargetFilter_BooleanFilter') then
                (Components[i] as TTargetFilter_BooleanFilter).a_ConditionType := bctNone;
            //По числовым полям
            if Components[i].ClassNameIs('TTargetFilter_NumberFilter') then
                (Components[i] as TTargetFilter_NumberFilter).a_ConditionType := nctNone;
            //Lookup фильтры
            if Components[i].ClassNameIs('TTargetFilter_LookupFilter') then
                (Components[i] as TTargetFilter_LookupFilter).a_KeyValue := null;
            //Dictionary фильтры
            if Components[i].ClassNameIs('TTargetFilter_DictionaryFilter') then begin
                (Components[i] as TTargetFilter_DictionaryFilter).a_Value := Unassigned;
                (Components[i] as TTargetFilter_DictionaryFilter).a_Text := '';
                end;
        end;
    DBGrid.Refresh;
end;

procedure TCFLEHListForm.ActionViewFilterExecute(Sender: TObject);
var
    i, j: integer;
    LastOrder: integer;
    FirstFilter: TtargetFilter_CustomFilter;
begin
    inherited;
    //Вся эта х...ня нужна, чтобы найти первый фильтр на активной панели
    LastOrder := 10000;
    if DBGrid.Focused then begin
        for i:=0 to ComponentCount - 1 do begin
            if Components[i].ClassNameIs('TTargetFilter_Panel') and ((Components[i] as TTargetFilter_Panel).Parent = PageControlTop.ActivePage) then
                for j:=0 to ComponentCount - 1 do begin
                    if Components[j].InheritsFrom(TtargetFilter_CustomFilter)
                       and ((Components[j] as TtargetFilter_CustomFilter).Parent = Components[i])
                       and ((Components[j] as TtargetFilter_CustomFilter).TabOrder < LastOrder) then begin
                        FirstFilter := (Components[j] as TtargetFilter_CustomFilter);
                        LastOrder := (Components[j] as TtargetFilter_CustomFilter).TabOrder;
                    end;
            end;
        end;
        if (LastOrder < 10000) and FirstFilter.CanFocus then FirstFilter.SetFocus;
    end
    else if DBGrid.CanFocus then DBGrid.SetFocus;
end;

procedure TCFLEHListForm.DBGridTitlePressed(Sender: TcitDBGrid; Field: TField);
begin
    inherited;
    DBGrid.Refresh;
end;

procedure TCFLEHListForm.ActionRowSelectExecute(Sender: TObject);
begin
    inherited;
    ActionRowSelect.Checked := not ActionRowSelect.Checked;
    if ActionRowSelect.Checked then DBGrid.Options := DBGrid.Options + [dgRowSelect]
                               else DBGrid.Options := DBGrid.Options - [dgRowSelect];
end;

procedure TCFLEHListForm.SetActionsEnabled;
var
  en: boolean;
begin
  en := not Query.IsEmpty;
  ActionItemProp.Enabled := en;
  ActionItemDel.Enabled := en;
end;

procedure TCFLEHListForm.QueryAfterOpen(DataSet: TDataSet);
begin
    inherited;
    FIsDatasetEmpty := (Query.Bof and Query.Eof);
    SetActionsEnabled;
end;

procedure TCFLEHListForm.QueryAfterRefresh(DataSet: TDataSet);
begin
    inherited;
    FIsDatasetEmpty := (Query.Bof and Query.Eof);
    SetActionsEnabled;
end;

procedure TCFLEHListForm.QueryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  SetActionsEnabled;
end;

procedure TCFLEHListForm.ActionDebugAllExecute(Sender: TObject);
var
    i: integer;
begin
    inherited;
    ActionDebugAll.Checked := not ActionDebugAll.Checked;
    for i:=0 to ComponentCount - 1 do begin
        if Components[i].InheritsFrom(TCustomDADataSet) then
            (Components[i] as TCustomDADataSet).Debug := ActionDebugAll.Checked;
    end;
end;

procedure TCFLEHListForm.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  with SearchParamRec do
    begin
      sSearchFieldName := '';
      sSearchText := '';
      bForward := true;
      bCaseSensitive := false;
    end;
end;

procedure TCFLEHListForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
//  ComponentProps.DefaultUser:=IntToStr(data.UserNo);
//  DBGrid.SaveFormatToStorage;
end;

procedure TCFLEHListForm.FormShow(Sender: TObject);
begin
  inherited;
//  ActionViewRefreshExecute(Self);
//  ComponentProps.DefaultUser:=IntToStr(data.UserNo);
//  DBGrid.RestoreFormatFromStorage;
end;

procedure TCFLEHListForm.ActionPrintExecute(Sender: TObject);
begin
  inherited;
  PrintDBGridEh1.SetSubstitutes(['%[Today]',DateToStr(Now)]);
  PrintDBGridEh1.Preview;
end;

procedure TCFLEHListForm.ActionSaveExecute(Sender: TObject);
var ExpClass:TDBGridEhExportClass;
    Ext:String;
begin
  inherited;
  SaveDialog1.FileName := 'file1';
  if SaveDialog1.Execute then
    begin
      case SaveDialog1.FilterIndex of
        1: begin ExpClass := TDBGridEhExportAsText; Ext := 'txt'; end;
        2: begin ExpClass := TDBGridEhExportAsCSV; Ext := 'csv'; end;
        3: begin ExpClass := TDBGridEhExportAsHTML; Ext := 'htm'; end;
        4: begin ExpClass := TDBGridEhExportAsRTF; Ext := 'rtf'; end;
        5: begin ExpClass := TDBGridEhExportAsXLS; Ext := 'xls'; end;
      else
        ExpClass := nil; Ext := '';
      end;
      if ExpClass <> nil then
      begin
        if UpperCase(Copy(SaveDialog1.FileName,Length(SaveDialog1.FileName)-2,3)) <>
           UpperCase(Ext) then  SaveDialog1.FileName := SaveDialog1.FileName + '.' + Ext;
        SaveDBGridEhToExportFile(ExpClass,DBGrid, SaveDialog1.FileName,True);
      end;
   end;
end;

end.
