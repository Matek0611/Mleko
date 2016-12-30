unit citDBComboEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls,db,Forms,GraPhics
  ,CitUtils,citCtrls,citCalDlg,citCalculatorDlg,Variants,citMask,Menus;

type
  TEditStyle=(edEdit,edCalc,edTime,edCombo,edDate,edSelect);
  TIsSelect = function (Sender: TObject): Boolean of object;
  TDialogStyle = (dsNoCaption, dsToolWindow);
  TDatePickMethod = (dmToday, dmLastEntered);
  TDateFormat = (dfShort, dfLong);

  TFieldDataLink = class(TDataLink)
  private
    FField: TField;
    FFieldName: string;
    FControl: TComponent;
    FEditing: Boolean;
    FModified: Boolean;
    FOnDataChange: TNotifyEvent;
    FOnEditingChange: TNotifyEvent;
    FOnUpdateData: TNotifyEvent;
    FOnActiveChange: TNotifyEvent;
    function GetCanModify: Boolean;
    procedure SetEditing(Value: Boolean);
    procedure SetField(Value: TField);
    procedure SetFieldName(const Value: string);
    procedure UpdateField;
  protected
    procedure ActiveChanged; override;
    procedure EditingChanged; override;
    procedure FocusControl(Field: TFieldRef); override;
    procedure LayoutChanged; override;
    procedure RecordChanged(Field: TField); override;
    procedure UpdateData; override;
  public
    function Edit: Boolean;
    procedure Modified;
    procedure Reset;
    property CanModify: Boolean read GetCanModify;
    property Control: TComponent read FControl write FControl;
    property Editing: Boolean read FEditing;
    property Field: TField read FField;
    property FieldName: string read FFieldName write SetFieldName;
    property OnDataChange: TNotifyEvent read FOnDataChange write FOnDataChange;
    property OnEditingChange: TNotifyEvent read FOnEditingChange write FOnEditingChange;
    property OnUpdateData: TNotifyEvent read FOnUpdateData write FOnUpdateData;
    property OnActiveChange: TNotifyEvent read FOnActiveChange write FOnActiveChange;
  end;

  TcitDBComboEdit = class(TcitMaskEdit)
  private
      CalendarForm : TcitCalendForm;
      FHeaderColor : TColor;
      FWeekEndColor : TColor;
      FPickFromField : Boolean;
      FDateFormat : TDateFormat;
      FCalendarColor : TColor;
      FDayBackgroundColor : TColor;
      FCalendarFont : TFont;
      FTodayShortCut : TShortCut;
      FDayTextColor : TColor;
      fDataSet:TdataSet;
      fDataSetLookTo:TdataSet;
      FHeaderFont : TFont;      
      fKeyField:String;
      fTextField:String;
      fOwner:String;
      fEntityName: String;
      fSqlFilter: AnsiString;
      fEntityCode:String;
      fLocateKey: boolean;
      fMultiSelect: boolean;      
      fKeyFieldValue: String;
      fOnSelectOk: TNotifyEvent;
      fOnSelectCancel: TNotifyEvent;
      fOnGetLocate: TNotifyEvent;
      fEditStyle:TEditStyle;
      fAutoTabControl:boolean;
      FOnIsSelect: TIsSelect;
      FDialogStyle : TDialogStyle;
      FFocused : boolean;
      procedure SelectListShow ;
      procedure CompleteEdit ;
      procedure CancelEdit ;
      procedure CalendEdit;
      procedure NumberEdit;
      function GetIsSelect: boolean;
      function GetDataFieldKeyTo: string;
      function GetDataFieldTextTo: string;
      procedure SetDataFieldKeyTo(const Value: string);
      procedure SetDataFieldTextTo(const Value: string);
      procedure SetDataFieldKeyFrom(const Value: string);
      procedure SetDataFieldTextFrom(const Value: string);
      function NewFormatDate(DateTime: TDateTime): string;
      procedure CMExit(var Message: TWMNoParams); message CM_EXIT;
      procedure UpdateData(Sender: TObject);
    procedure DataChange(Sender: TObject);
    procedure DataSetDataChange(DataLink:TFieldDataLink);    
    function GetDataFieldKeyFrom: string;
    function GetDataFieldTextFrom: string;
  protected
      FDataLinkTextTo: TFieldDataLink;
      FDataLinkKeyTo: TFieldDataLink;
      FDataLinkTextFrom: TFieldDataLink;
      FDataLinkKeyFrom: TFieldDataLink;
      procedure KeyPress(var Key: Char); override;
{Перенес пока сюда до состояния трезвости}
      property DataSetLookTo: TDataSet read fDataSetLookTo write fDataSetLookTo;
      property DataSetLookFrom: TDataSet read fDataSetLookTo write fDataSetLookTo;
      property DataFieldKeyTo: string read GetDataFieldKeyTo write SetDataFieldKeyTo;
      property DataFieldTextTo: string read GetDataFieldTextTo write SetDataFieldTextTo;
      property DataFieldKeyFrom: string read GetDataFieldKeyFrom write SetDataFieldKeyFrom;
      property DataFieldTextFrom: string read GetDataFieldTextFrom write SetDataFieldTextFrom;
  public
      procedure ButtonPushed(Sender : TObject); override;
      procedure FocusNextControl;
      procedure GetLocateKey;
      property IsSelect: Boolean read GetIsSelect;
      property DialogStyle : TDialogStyle read FDialogStyle write FDialogStyle;
      property HeaderColor : TColor read FHeaderColor write FHeaderColor;
      property DayBackgroundColor : TColor read FDayBackgroundColor write FDayBackgroundColor;
      property CalendarColor : TColor read FCalendarColor write FCalendarColor default clWindow;
      property DayTextColor : TColor read FDayTextColor write FDayTextColor;
      property WeekEndColor : TColor read FWeekEndColor write FWeekEndColor;
      property TodayShortCut: TShortCut read FTodayShortCut write FTodayShortCut;
      property PickFromField: Boolean read FPickFromField write FPickFromField;
      constructor Create(AOwner: TComponent); override;
  published
      property DataSet: TDataSet read fDataSet write fDataSet;
      property KeyFieldValue: String read fKeyFieldValue write fKeyFieldValue;
      property LocateKey: boolean read fLocateKey write fLocateKey default true;
      property KeyField: String read fKeyField write fKeyField ;
      property TextField: String read fTextField write fTextField ;
      property Owner: String read fOwner write fOwner ;
      property EntityCode: String read fEntityCode write fEntityCode ;
      property EntityName: String read fEntityName write fEntityName ;
      property SqlFilter: AnsiString read fSqlFilter write fSqlFilter ;
      property multiselect: boolean read fmultiselect write fmultiselect default false;
      property OnSelectOk: TNotifyEvent read FOnSelectOk write FOnSelectOk;
      property OnGetLocate: TNotifyEvent read FOnGetLocate write FOnGetLocate;
      property OnSelectCancel: TNotifyEvent read FOnSelectCancel write FOnSelectCancel;
      property OnIsSelect: TIsSelect read FOnIsSelect write FOnIsSelect;
      property EditStyle: TEditStyle read FEditStyle write FEditStyle default EdEdit;
      property AutoTabControl: boolean read fAutoTabControl write fAutoTabControl ;
  end;

procedure Register;

var LastEnteredDate : TDate;

implementation

uses CitComboSelect;


procedure Register;
begin
  RegisterComponents('CIT Db', [TcitDBComboEdit]);
end;

procedure TcitDBComboEdit.ButtonPushed(Sender : TObject);
begin
   if Assigned(fOnPushButton) then fOnPushButton(Self);
   if fEditStyle=edCombo then  SelectListShow;
   if fEditStyle=edDate then
   begin
     Text:=DateToStr(StrToDate(Text));
     CalendEdit;
   end;
   if fEditStyle=edCalc then  NumberEdit;
   if fEditStyle=edEdit then  CompleteEdit;
   if fEditStyle=edSelect then
   begin
     if IsSelect then CompleteEdit else CancelEdit;
   end;
end;

procedure TcitDBComboEdit.KeyPress(var Key: Char);
begin
   inherited KeyPress(Key);
   if Key = Char(VK_RETURN) then
   begin
     if fEditStyle in [edCalc] then CompleteEdit else ButtonPushed(self)
   end else
   begin
     if fEditStyle in [edCalc,edEdit,edDate] then KeyFieldValue:=Text;
   end;
end;

procedure TcitDBComboEdit.SelectListShow;
var
   OldText : string;
   i:integer;
   l_width: integer;
   SelectForm:TCitComboSelectDlg;
begin
  OldText := Text;
  SelectForm := TCitComboSelectDlg.Create(Self);
  SelectForm.Tag := LongInt(Self);
  with SelectForm do
   begin
     BorderStyle := bsToolWindow;
     BorderIcons := [biSystemMenu];
     if MaxLength=0 then Height := 150 else Height:=MaxLength;
     Caption := 'Выбор';
     SetFormPosByControl(SelectForm, Self);
     DS.DataSet:=fDataSet;
     DBGrid.Reopen;
     l_width:=0;
     for i := 0 to DS.DataSet.FieldCount-1 do
     begin
        if DS.DataSet.Fields[i].Visible then l_width:=l_width+(7*DS.DataSet.Fields[i].DisplayWidth);
     end;
     width:=l_width;
     GetLocateKey;
     ShowModal;
     if ModalResult = mrCancel then begin
        Text := OldText;
        CancelEdit;
     end  else
     begin
         if fTextField<>'' then  begin
            Text := DS.DataSet.FieldByName(fTextField).AsString;
         end else begin
            Text := OldText;
         end;
         fKeyFieldValue:=DS.DataSet.FieldByName(fKeyField).Value;
         CompleteEdit;
     end;
     SelectForm.Free;
   end;
  SelectAll;
end;

procedure TcitDBComboEdit.CompleteEdit ;
var  lControl: TWinControl;
//OwnerForm: TForm;
i: integer;
begin
  case fEditStyle of
   edCalc,edEdit : fKeyFieldValue:=Text;
   edDate: fKeyFieldValue:=DateToStr(StrToDate(Text));
  end;
  if Assigned(fOnSelectOk) then fOnSelectOk(Self);
  if fAutoTabControl  then begin
   FocusNextControl;
//    lControl:=FindNextControl(Self,True,True,True);
//    if lControl.CanFocus then lControl.SetFocus;
  end;
end;

procedure TcitDBComboEdit.CancelEdit ;
begin
  if Assigned(fOnSelectCancel) then fOnSelectCancel(Self);
end;

procedure TcitDBComboEdit.GetLocateKey ;
begin
   if Assigned(fOnGetLocate) then fOnGetLocate(Self)
   else if fEditStyle=edCombo then
   begin
     if (KeyField<>'') and (KeyFieldValue<>'') then
     begin
      if not fDataSet.Active then fDataSet.Open;
      fDataSet.Locate(fKeyField,fKeyFieldValue,[]);
      Text:=fDataSet.FieldByName(fTextField).AsString;
     end else
     begin
      if not fDataSet.Active then fDataSet.Open;
      fDataSet.First;
      Text:=fDataSet.FieldByName(fTextField).AsString;
     end;
   end;
end;

procedure TcitDBComboEdit.CalendEdit;
var
   OldText : string;
begin
  OldText := Text;
  CalendarForm := TcitCalendForm.Create(Self);
  ControlStyle := ControlStyle + [csReplicatable];
  FHeaderFont := TFont.Create;
  FCalendarFont := TFont.Create;
  HeaderColor := clBtnFace;
  CalendarColor := clWindow;
  DayTextColor := clCaptionText;
  WeekEndColor := clRed;
  DayBackgroundColor := clActiveCaption;
  TodayShortCut := TextToShortCut('F5');
  CalendarForm.Tag := LongInt(Self);
    with CalendarForm do
     begin
       if FDialogStyle = dsToolWindow then
        begin
          BorderStyle := bsToolWindow;
          BorderIcons := [biSystemMenu];
          Height := Height + GetSystemMetrics(SM_CYSMCAPTION) + 2*GetSystemMetrics(SM_CYDLGFRAME);
          Width := Width + 2*GetSystemMetrics(SM_CXDLGFRAME);
          Caption := 'Введите дату'
        end;
       PickFromField:= true;
       SetFormPosByControl(CalendarForm, Self);
       PanelText.Color := FHeaderColor;
       PanelText.Font.Assign(FHeaderFont);
       Grid.FixedColor := FDayBackgroundColor;
       Grid.Font.Assign(FCalendarFont);
       Grid.Color := FCalendarColor;
       FixedTextColor := FDayTextColor;
       RedColor := WeekEndColor;
       ShowModal;
       if ModalResult = mrCancel then
       begin
        Text := OldText;
        KeyFieldValue:=OldText;
        CancelEdit;        
       end
         else begin
                LastEnteredDate := EncodeDate(Year, Month, Day);
                Text := NewFormatDate(LastEnteredDate);
                KeyFieldValue:=Text;
                CompleteEdit;
              end;
       CalendarForm.Free;
     end;
    SelectAll;
end;

procedure TcitDBComboEdit.NumberEdit ;
var
   OldText : string;
   OutputNumber : double;
   citCalculatorForm: TCalculatorForm;
begin
  citCalculatorForm := TCalculatorForm.Create(Self);
  SetFormPosByControl(citCalculatorForm, Self);
  OutputNumber := citCalculatorForm.ShowMe(Text, 6);
  if citCalculatorForm.ModalResult = mrCancel then begin
                                Text := OldText;
                                CancelEdit;
                               end else
                               begin
                                 Text := FloatToStr(OutputNumber);
                                 CompleteEdit;
                               end;
  citCalculatorForm.Free;
  SelStart := Length(Text);
end;

function TcitDBComboEdit.GetIsSelect: Boolean;
begin
  Result := false;
  if Assigned(OnIsSelect) then begin
    Result := OnIsSelect(Self);
  end;
end;

procedure TcitDBComboEdit.CMExit(var Message: TWMNoParams);
begin
   If fEditStyle=edDate then LastEnteredDate := StrToDate(EditText);
   if fEditStyle in [edCalc,edEdit] then KeyFieldValue:=Text;
   inherited;
end;

function TcitDBComboEdit.NewFormatDate(DateTime: TDateTime): string;
var
  NewFormat : string;
begin
  NewFormat := ShortDateFormat;
  SetLength(NewFormat, Pos('yy', NewFormat)-1);
  Result := FormatDateTime(NewFormat+'yyyy', DateTime)
end;

procedure TcitDBComboEdit.FocusNextControl;
var
  i,c,min_tabOrder,min_index,cur_index,cur_taborder: Integer;
  CurControl:TControl;
  FocControl,ParentControl,SearchControl:TWinControl;
  not_found: boolean;
begin
 not_found:=true;
 ParentControl:=Self.Parent;
 CurControl:=Self;
 cur_taborder:=Self.TabOrder;
 min_index:=-1;
 cur_index:=-1;
 min_tabOrder:=ParentControl.ControlCount;
 for i := 0 to ParentControl.ControlCount-1 do
 begin
  if ParentControl.Controls[i].Name=Self.Name then cur_index:=i;
 end;

 for c := 0 to ParentControl.ControlCount-1 do
 begin
   if ParentControl.Controls[c] is TWinControl then
   begin
       SearchControl:= (ParentControl.Controls[c] as TWinControl);
       if SearchControl.TabStop and SearchControl.Enabled then
         if (SearchControl.TabOrder<min_tabOrder) and (SearchControl.TabOrder>cur_taborder) then
         begin
           min_tabOrder:=SearchControl.TabOrder;
           min_index:=c;
           FocControl:=SearchControl;
         end;
   end;
 end;

 if min_index>0 then
 begin
   FocControl.SetFocus;
   not_found:=false;
 end;

while not_found and ParentControl.HasParent do
begin
 ParentControl:=ParentControl.Parent;
 for i:=0 to ParentControl.ControlCount-1 do begin
    CurControl:=ParentControl.Controls[i];
    if CurControl is TWinControl then begin
       FocControl:=(CurControl as TWinControl);
       if FocControl.CanFocus and FocControl.TabStop and FocControl.Enabled and not_found then begin
          FocControl.SetFocus;
          not_found:=false;
       end
     end;
 end;
end;
end;


constructor TcitDBComboEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  {Закоментарил до состояния трезвости}
{  FDataLinkTextFrom:= TFieldDataLink.Create;
  FDataLinkTextFrom.Control := Self;
  FDataLinkTextFrom.OnDataChange := DataChange;
  FDataLinkTextFrom.OnUpdateData := UpdateData;
}
end;

function TcitDBComboEdit.GetDataFieldKeyTo: string;
begin
  Result := FDataLinkKeyTo.FieldName;
end;

function TcitDBComboEdit.GetDataFieldTextTo: string;
begin
  Result := FDataLinkTextTo.FieldName;
end;

procedure TcitDBComboEdit.SetDataFieldKeyTo(const Value: string);
begin
  FDataLinkKeyTo.FieldName := Value;
end;

procedure TcitDBComboEdit.SetDataFieldTextTo(const Value: string);
begin
  FDataLinkTextTo.FieldName := Value;
end;

procedure TcitDBComboEdit.UpdateData(Sender: TObject);
begin
  ValidateEdit;
  FDataLinkTextFrom.Field.Text := Text;
end;

{ TFieldDataLink }

procedure TFieldDataLink.SetEditing(Value: Boolean);
begin
  if FEditing <> Value then
  begin
    FEditing := Value;
    FModified := False;
    if Assigned(FOnEditingChange) then FOnEditingChange(Self);
  end;
end;

procedure TFieldDataLink.SetFieldName(const Value: string);
begin
  if FFieldName <> Value then
  begin
    FFieldName :=  Value;
    UpdateField;
  end;
end;

procedure TFieldDataLink.SetField(Value: TField);
begin
  if FField <> Value then
  begin
    FField := Value;
    EditingChanged;
    RecordChanged(nil);
  end;
end;

procedure TFieldDataLink.UpdateField;
begin
  SetField(nil);
  if Active and (FFieldName <> '') then
  begin
    if Assigned(FControl) then
      SetField(GetFieldProperty(DataSource.DataSet, FControl, FFieldName)) else
      SetField(DataSource.DataSet.FieldByName(FFieldName));
  end;
end;

function TFieldDataLink.Edit: Boolean;
begin
  if CanModify then inherited Edit;
  Result := FEditing;
end;

function TFieldDataLink.GetCanModify: Boolean;
begin
  Result := not ReadOnly and (Field <> nil) and Field.CanModify;
end;

procedure TFieldDataLink.Modified;
begin
  FModified := True;
end;

procedure TFieldDataLink.Reset;
begin
  RecordChanged(nil);
end;

procedure TFieldDataLink.ActiveChanged;
begin
  UpdateField;
  if Assigned(FOnActiveChange) then FOnActiveChange(Self);
end;

procedure TFieldDataLink.EditingChanged;
begin
  SetEditing(inherited Editing and CanModify);
end;

procedure TFieldDataLink.FocusControl(Field: TFieldRef);
begin
  if (Field^ <> nil) and (Field^ = FField) and (FControl is TWinControl) then
    if TWinControl(FControl).CanFocus then
    begin
      Field^ := nil;
      TWinControl(FControl).SetFocus;
    end;
end;

procedure TFieldDataLink.RecordChanged(Field: TField);
begin
  if (Field = nil) or (Field = FField) then
  begin
    if Assigned(FOnDataChange) then FOnDataChange(Self);
    FModified := False;
  end;
end;

procedure TFieldDataLink.LayoutChanged;
begin
  UpdateField;
end;

procedure TFieldDataLink.UpdateData;
begin
  if FModified then
  begin
    if (Field <> nil) and Assigned(FOnUpdateData) then FOnUpdateData(Self);
    FModified := False;
  end;
end;

function TcitDBComboEdit.GetDataFieldKeyFrom: string;
begin
  Result := FDataLinkKeyFrom.FieldName;
end;

function TcitDBComboEdit.GetDataFieldTextFrom: string;
begin
  Result := FDataLinkTextFrom.FieldName;
end;

procedure TcitDBComboEdit.SetDataFieldKeyFrom(const Value: string);
begin
  FDataLinkKeyFrom.FieldName := Value;
end;

procedure TcitDBComboEdit.SetDataFieldTextFrom(const Value: string);
begin
  FDataLinkTextFrom.FieldName := Value;
end;

procedure TcitDBComboEdit.DataChange(Sender: TObject);
begin
  DataSetDataChange(FDataLinkTextFrom);
end;

procedure TcitDBComboEdit.DataSetDataChange(DataLink: TFieldDataLink);
begin
  if DataLink.Field <> nil then
  begin
    EditMask := DataLink.Field.EditMask;
    if FFocused and DataLink.CanModify then
      Text := DataLink.Field.Text
    else
    begin
      EditText := DataLink.Field.DisplayText;
      if DataLink.Editing and DataLink.FModified then
        Modified := True;
    end;
  end else
  begin
    EditMask := '';
    if csDesigning in ComponentState then
      EditText := Name else
      EditText := '';
  end;
end;


end.
