unit comp_TargetFilter_DateFilter;

interface

uses
  math,Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  stdctrls,extctrls,
  comp_TargetFilter_CustomFilter,comp_TargetFilter_Edits,
  TargetFilter_utils, buttons, comctrls,variants;

type
  TTarget_DateFilter_DTP = class(TDateTimePicker)
                          private
                            PrevClick : TDateTime;
                          protected
                            procedure SetNow;
                            procedure WndProc(var Message: TMessage); override;
                          end;

  TDateConditionType = (dctNone,
                        dct_date_L,dct_date_LE,dct_date_E,dct_date_GE,dct_date_G,dct_date_NE,
                        dct_date_GE_LE,dct_date_G_L,{dct_date_GE_L,dct_date_G_LE,}

                        dct_datetime_L,dct_datetime_LE,dct_datetime_E,dct_datetime_GE,dct_datetime_G,dct_datetime_NE,
                        dct_datetime_GE_LE,dct_datetime_G_L,{dct_datetime_GE_L,dct_datetime_G_LE,}

                        dct_Parameter_LastNDays,
                        dct_Parameter_LastNWeeks,
                        dct_Parameter_LastNMonths,
                        dct_Parameter_LastNQuarters,
                        dct_Parameter_LastNYears,

                        dct_IsNull,
                        dct_IsNotNull);
  TDateConditionGroup = (dcgNone,
                         dcgDateCondition,dcgDateInterval,
                         dcgDateTimeCondition,dcgDateTimeInterval,
                         dcgParameter,
                         dcgNull);
  const
    dcGroup : array [dctNone .. dct_IsNotNull] of TDateConditionGroup =
      (dcgNone,//dctNone

       dcgDateCondition,//dct_date_L
       dcgDateCondition,//dct_date_LE
       dcgDateCondition,//dct_date_E
       dcgDateCondition,//dct_date_GE
       dcgDateCondition,//dct_date_G
       dcgDateCondition,//dct_date_NE
       dcgDateInterval,//dct_date_GE_LE
       dcgDateInterval,//dct_date_G_L
       //dcgDateInterval,//dct_date_GE_L
       //dcgDateInterval,//dct_date_G_LE

       dcgDateTimeCondition,//dct_datetime_L
       dcgDateTimeCondition,//dct_datetime_LE
       dcgDateTimeCondition,//dct_datetime_E
       dcgDateTimeCondition,//dct_datetime_GE
       dcgDateTimeCondition,//dct_datetime_G
       dcgDateTimeCondition,//dct_datetime_NE
       dcgDateTimeInterval,//dct_datetime_GE_LE
       dcgDateTimeInterval,//dct_datetime_G_L
       //dcgDateTimeInterval,//dct_datetime_GE_L
       //dcgDateTimeInterval,//dct_datetime_G_LE

       dcgParameter,//dct_Parameter_LastNDays
       dcgParameter,//dct_Parameter_LastNWeeks
       dcgParameter,//dct_Parameter_LastNMonths
       dcgParameter,//dct_Parameter_LastNQuarters
       dcgParameter,//dct_Parameter_LastNYears

       dcgNull,//dct_IsNull
       dcgNull);//dct_IsNotNull
type
  TTargetFilter_DateFilter = class;
  TTargetFilter_DateFilter_OnBeforeGetString = procedure (Sender : TTargetFilter_DateFilter;
                                                          ConditionType: TDateConditionType;
                                                          ConditionGroup : TDateConditionGroup;
                                                          var Value,Minimum,Maximum : TDateTime;
                                                          var Parameter : integer)
                                               of object;
  TTargetFilter_DateFilter = class(TTargetFilter_CustomFilter)
  private
    fConditionType : TDateConditionType;
    Fa_SetDateTimeToNow: boolean;
    Fa_DisableTime: boolean;
    fOnBeforeGetString: TTargetFilter_DateFilter_OnBeforeGetString;
    Fa_SetTodayOnLoad: boolean;

    function GetMaximum  : TDateTime;
    function GetMinimum  : TDateTime;
    function GetValue    : TDateTime;
    function GetParameter: integer;

    procedure SetMaximum  (const Value: TDateTime);
    procedure SetMinimum  (const Value: TDateTime);
    procedure SetValue    (const Value: TDateTime);
    procedure SetParameter(const Value: integer);

    procedure SetConditionType(const Value: TDateConditionType);
    function GetConditionGroup: TDateConditionGroup;
    procedure SetConditionGroup(const Value: TDateConditionGroup);
    procedure Seta_SetDateTimeToNow(const Value: boolean);
    procedure Seta_DisableTime(const Value: boolean);
    procedure Seta_SetTodayOnLoad(const Value: boolean);
  private
    Condition_Date : TTarget_DateFilter_DTP;
    Condition_Time : TTarget_DateFilter_DTP;
    IntervalCondition_Date1 : TTarget_DateFilter_DTP;
    IntervalCondition_Time1 : TTarget_DateFilter_DTP;
    IntervalCondition_Date2 : TTarget_DateFilter_DTP;
    IntervalCondition_Time2 : TTarget_DateFilter_DTP;
    Parameter_Edit : TTarget_IntEdit;

    procedure DoOnEdit(Sender : TObject);
    procedure RebuildConditionList;
    procedure SelectConditionTypeItemInCombo(aConditionType : TDateConditionType;
                                    NeedOnChange : boolean);
    { Private declarations }
  protected
    procedure UpdateControlStatus; override;
    function FilterValid(aErrorType : TTargetFilter_ErrorType): boolean; override;
    procedure FocusFilter (ForceFocus : boolean); override;
    function ParamCount : integer; override;
    procedure LoadValue(V: Variant); override;
    function EditAreaMinWidth: integer; override;
  protected
    { Protected declarations }
    procedure Seta_TabStop(const Value: boolean); override;
    function GetFilterStr: string; override;
    function GetDatasetFilterStr: string; override;
    function GetEditAreaHeight: integer; override;
    procedure SetEditAreaBounds(aLeft,aTop,aWidth : integer); override;
    procedure FinishCreation; override;

    function Op(WhichOne : integer = 1) : string;
    function GetParamInfo: TTargetFilter_ParamInfo; override;

    property  ConditionGroup : TDateConditionGroup  read GetConditionGroup write SetConditionGroup;
    procedure DoOnChangeCondition(Sender: TObject); override;
    procedure AutoChangeValue; override;
  public
    { Public declarations }
    function SetDefaultConditionTypeIfNone: boolean; override;
    constructor Create(AOwner:TComponent); override;
    function GetEditControlCount: integer; override;
    function GetEditControl(i: integer; outVisualColumn : Pointer): TWinControl; override;
  published
    property Width default 492;
    property a_ComboWidth default 160;
    property a_Minimum   : TDateTime read GetMinimum   write SetMinimum;
    property a_Maximum   : TDateTime read GetMaximum   write SetMaximum;
    property a_Value     : TDateTime read GetValue     write SetValue;
    property a_Parameter : integer   read GetParameter write SetParameter;
    property a_ConditionType : TDateConditionType read fConditionType write SetConditionType default dctNone;
    property a_SetDateTimeToNow : boolean read Fa_SetDateTimeToNow write Seta_SetDateTimeToNow;
    property a_DisableTime : boolean read Fa_DisableTime write Seta_DisableTime;
    property a_OnBeforeGetString : TTargetFilter_DateFilter_OnBeforeGetString
      read fOnBeforeGetString write fOnBeforeGetString;
    property a_SetTodayOnLoad : boolean read Fa_SetTodayOnLoad write Seta_SetTodayOnLoad default true;
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('TargetDB', [TTargetFilter_DateFilter]);
end;

{ TTargetFilter_DateFilter }


constructor TTargetFilter_DateFilter.Create(AOwner: TComponent);

  procedure SetControlEvents (C : TWinControl);
    begin
      if C is TDateTimePicker then
       With C as TDateTimePicker do begin
         OnChange := DoOnEdit;
         OnKeyDown := DoOnKeyDown;
       end;
      if C is TTarget_Edit then
       With C as TTarget_Edit do begin
         OnChange := DoOnEdit;
         OnKeyDown := DoOnKeyDown;
       end;
    end;

  begin
    inherited;
    Width       := 492;
    Height      := 20;

    fConditionType := dctNone;
    fCombowidth := 160;

    Condition_Date := TTarget_DateFilter_DTP.Create(self);
    SetControlEvents(Condition_Date);
    With Condition_Date do begin
       Time := 0;
       Parent := self;
       Width := 95;
       Kind := dtkDate;
    end;
    Condition_Time := TTarget_DateFilter_DTP.Create(self);
    SetControlEvents(Condition_Time);
    With Condition_Time do begin
       Date := 0;
       Parent := self;
       Width := 81;
       Kind := dtkTime;
    end;

    IntervalCondition_Date1 := TTarget_DateFilter_DTP.Create(self);
    SetControlEvents(IntervalCondition_Date1);
    With IntervalCondition_Date1 do begin
       Time := 0;
       Parent := self;
       Width := 95;
       Kind := dtkDate;
    end;
    IntervalCondition_Time1 := TTarget_DateFilter_DTP.Create(self);
    SetControlEvents(IntervalCondition_Time1);
    With IntervalCondition_Time1 do begin
       Date := 0;
       Parent := self;
       Width := 81;
       Kind := dtkTime;
    end;

    IntervalCondition_Date2 := TTarget_DateFilter_DTP.Create(self);
    SetControlEvents(IntervalCondition_Date2);
    With IntervalCondition_Date2 do begin
       Time := 0;
       Parent := self;
       Width := 95;
       Kind := dtkDate;
    end;
    IntervalCondition_Time2 := TTarget_DateFilter_DTP.Create(self);
    SetControlEvents(IntervalCondition_Time2);
    With IntervalCondition_Time2 do begin
       Date := 0;
       Parent := self;
       Width := 81;
       Kind := dtkTime;
    end;

    Parameter_Edit := TTarget_IntEdit.Create(self);
    SetControlEvents(Parameter_Edit);
    With Parameter_Edit do begin
      AutoSize := false;
      Anchors := [akLeft,akTop,akRight];
      Parent := nil;
    end;
    Fa_SetTodayOnLoad := true;
  end;

procedure TTargetFilter_DateFilter.DoOnEdit(Sender: TObject);
  begin
    UpdateFilterStr;
  end;

function TTargetFilter_DateFilter.GetParamInfo: TTargetFilter_ParamInfo;
  var
    QuoteStr       : string;
    E : extended;
    i : integer;
    Y,M,D : word;
    FromDate : TDateTime;

    lValue,lMinimum,lMaximum : TDateTime;
    lParameter : integer;
    RealParamCount   : integer;

  function TRUNC_Column : string;
    begin
      if Fa_DisableTime
        then Result := GetColumn(true)
        else Result := ' TRUNC('+GetColumn(true)+') ';
    end;

  procedure SetRes(aResult_ParamFilterStr : string; aRealParamCount : integer; D1,D2 : Variant);
    begin
      Result.ParamFilterStr := aResult_ParamFilterStr;
      Result.Params[0].ParamValue := D1;
      Result.Params[1].ParamValue := D2;
      RealParamCount := aRealParamCount;
    end;

  begin
    InitTargetFilter_ParamInfo(Result);
    if not ReadyToGetFilterStr then begin
      exit;
    end;

    lValue     := a_Value;
    lMinimum   := a_Minimum;
    lMaximum   := a_Maximum;
    lParameter := a_Parameter;

    if Assigned (fOnBeforeGetString) and not (ConditionGroup in [dcgNone,dcgNull])
      then fOnBeforeGetString(self,a_ConditionType,ConditionGroup,lValue,lMinimum,lMaximum,lParameter);

    SetLength(Result.Params,ParamCount);
    case ConditionGroup of
        dcgDateCondition : SetRes(TRUNC_Column + Op    + ':'+a_ParamNames[0],1,trunc(lValue),0);
         dcgDateInterval : SetRes(TRUNC_Column + Op(1) + ':'+a_ParamNames[0]+
                                  ' and '+
                                  TRUNC_Column + Op(2) + ':'+a_ParamNames[1],2,trunc(lMinimum),trunc(lMaximum));
    dcgDateTimeCondition : SetRes(GetColumn(true) + Op    + ':'+a_ParamNames[0],1,lValue,0);
     dcgDateTimeInterval : SetRes(GetColumn(true) + Op(1) + ':'+a_ParamNames[0]+
                                  ' and '+
                                  GetColumn(true) + Op(2) + ':'+a_ParamNames[1],2,lMinimum,lMaximum);
            dcgParameter : begin
                             DecodeDate(Date,Y,M,D);
                             case a_ConditionType of
                               dct_Parameter_LastNDays     : FromDate := Trunc(Date) + 1 - a_Parameter;
                               dct_Parameter_LastNWeeks    : FromDate := Trunc(Date) + 1 - (DayOfWeek(Date)-1) - 7*(a_Parameter-1);
                               dct_Parameter_LastNMonths   : FromDate := IncMonth(EncodeDate(Y,M,1),   -(a_Parameter-1));
                               dct_Parameter_LastNQuarters : FromDate := IncMonth(EncodeDate(Y,((M-1)div 3) *3 + 1,1), -3*(a_Parameter-1));
                               dct_Parameter_LastNYears    : FromDate := IncMonth(EncodeDate(Y,1,1),-12*(a_Parameter-1));
                               else FromDate := Now;
                             end;
                             SetRes(GetColumn(true) + ' >= '+':'+a_ParamNames[0],1,FromDate,0);
                           end;
                 dcgNull : case a_ConditionType of
                              dct_IsNull    : SetRes(GetColumn(true) + ' IS NULL'   ,0,0,0);
                              dct_IsNotNull : SetRes(GetColumn(true) + ' IS NOT NULL',0,0,0);
                           end;
    end;

    SetLength(Result.Params,RealParamCount);
    for i := low(Result.Params) to high(Result.Params) do begin
      Result.Params[i].ParamName := a_ParamNames[i];
      Result.Params[i].ParamType := fptDate;
    end;
  end;

function TTargetFilter_DateFilter.Op(WhichOne : integer = 1) : string;
    const
      O : array [dctNone..dct_IsNotNull,1..2] of string =
        ((  '',  ''),//dctNone

         ( '<',  ''),//dct_date_L
         ('<=',  ''),//dct_date_LE
         ( '=',  ''),//dct_date_E
         ('>=',  ''),//dct_date_GE
         ( '>',  ''),//dct_date_G
         ('<>',  ''),//dct_date_NE

         ('>=','<='),//dct_date_GE_LE
         ( '>', '<'),//dct_date_G_L
         //('>=', '<'),//dct_date_GE_L
         //( '>','<='),//dct_date_G_LE

         ( '<',  ''),//dct_datetime_L
         ('<=',  ''),//dct_datetime_LE
         ( '=',  ''),//dct_datetime_E
         ('>=',  ''),//dct_datetime_GE
         ( '>',  ''),//dct_datetime_G
         ('<>',  ''),//dct_datetime_NE

         ('>=','<='),//dct_datetime_GE_LE
         ( '>', '<'),//dct_datetime_G_L
         //('>=', '<'),//dct_datetime_GE_L
         //( '>','<='),//dct_datetime_G_LE

         (  '',  ''),//dct_Parameter_LastNDays
         (  '',  ''),//dct_Parameter_LastNWeeks
         (  '',  ''),//dct_Parameter_LastNMonths
         (  '',  ''),//dct_Parameter_LastNQuarters
         (  '',  ''),//dct_Parameter_LastNYears

         (  '',  ''), //dct_IsNull
         (  '',  ''));//dct_IsNotNull

    begin
      Result := ' ' + O[a_ConditionType,WhichOne] + ' ';
    end;

function TTargetFilter_DateFilter.GetFilterStr: string;
  var
    FromDate : TDateTime;
    Y,M,D: Word;

  function TRUNC_Column : string;
    begin
      case a_ServerType of
        tfst_MS_SQL : Result := 'convert(smalldatetime,convert(char(10),'+GetColumn(true)+',120),120)';
        tfst_Oracle : begin
                        if Fa_DisableTime
                          then Result := GetColumn(true)
                          else Result := ' TRUNC('+GetColumn(true)+') ';
                      end;
      end;
    end;

  var
    lValue,lMinimum,lMaximum : TDateTime;
    lParameter : integer;
  begin
    Result := '';
    if not ReadyToGetFilterStr then exit;

    lValue     := a_Value;
    lMinimum   := a_Minimum;
    lMaximum   := a_Maximum;
    lParameter := a_Parameter;

    if Assigned (fOnBeforeGetString) and not (ConditionGroup in [dcgNone,dcgNull])
      then fOnBeforeGetString(self,a_ConditionType,ConditionGroup,lValue,lMinimum,lMaximum,lParameter);

    case ConditionGroup of
        dcgDateCondition : Result := TRUNC_Column + Op    + GetDateStr(lValue);
         dcgDateInterval : Result := TRUNC_Column + Op(1) + GetDateStr(lMinimum)+
                                     ' and '+
                                     TRUNC_Column + Op(2) + GetDateStr(lMaximum);
    dcgDateTimeCondition : Result := GetColumn(true) + Op    + GetDateStr(lValue,true);
     dcgDateTimeInterval : Result := GetColumn(true) + Op(1) + GetDateStr(lMinimum,true)+
                                     ' and '+
                                     GetColumn(true) + Op(2) + GetDateStr(lMaximum,true);
            dcgParameter : begin
                             DecodeDate(Date,Y,M,D);
                             case a_ConditionType of
                               dct_Parameter_LastNDays     : FromDate := Trunc(Date) + 1 - a_Parameter;
                               dct_Parameter_LastNWeeks    : FromDate := Trunc(Date) + 1 - (DayOfWeek(Date)-1) - 7*(a_Parameter-1);
                               dct_Parameter_LastNMonths   : FromDate := IncMonth(EncodeDate(Y,M,1),   -(a_Parameter-1));
                               dct_Parameter_LastNQuarters : FromDate := IncMonth(EncodeDate(Y,((M-1)div 3) *3 + 1,1), -3*(a_Parameter-1));
                               dct_Parameter_LastNYears    : FromDate := IncMonth(EncodeDate(Y,1,1),-12*(a_Parameter-1));
                               else FromDate := Now;
                             end;
                             Result := GetColumn(true) + ' >= '+  GetDateStr(FromDate);
                           end;
                 dcgNull : case a_ConditionType of
                              dct_IsNull    : Result := GetColumn(true) + ' IS NULL';
                              dct_IsNotNull : Result := GetColumn(true) + ' IS NOT NULL';
                           end;
                      else Result := '';
    end;
  end;


function TTargetFilter_DateFilter.GetDatasetFilterStr: string;
  var
    FromDate : TDateTime;
    Y,M,D: Word;

  function TRUNC_Field : string;
    begin
      Result := PreQuot+a_b_FieldName+PostQuot;
    end;

  var
    lValue,lMinimum,lMaximum : TDateTime;
    lParameter : integer;
  begin
    Result := '';
    exit;
    if not ReadyToGetFilterStr then exit;

    lValue     := a_Value;
    lMinimum   := a_Minimum;
    lMaximum   := a_Maximum;
    lParameter := a_Parameter;

    if Assigned (fOnBeforeGetString) and not (ConditionGroup in [dcgNone,dcgNull])
      then fOnBeforeGetString(self,a_ConditionType,ConditionGroup,lValue,lMinimum,lMaximum,lParameter);

    case ConditionGroup of
        dcgDateCondition : Result := TRUNC_Field + Op    + GetDatasetDateStr(lValue);
         dcgDateInterval : Result := TRUNC_Field + Op(1) + GetDatasetDateStr(lMinimum)+
                                     ' and '+
                                     TRUNC_Field + Op(2) + GetDatasetDateStr(lMaximum);
    dcgDateTimeCondition : Result := PreQuot+a_b_FieldName+PostQuot + Op    + GetDatasetDateStr(lValue,true);
     dcgDateTimeInterval : Result := PreQuot+a_b_FieldName+PostQuot + Op(1) + GetDatasetDateStr(lMinimum,true)+
                                     ' and '+
                                     PreQuot+a_b_FieldName+PostQuot + Op(2) + GetDatasetDateStr(lMaximum,true);
            dcgParameter : begin
                             DecodeDate(Date,Y,M,D);
                             case a_ConditionType of
                               dct_Parameter_LastNDays     : FromDate := Trunc(Date) + 1 - a_Parameter;
                               dct_Parameter_LastNWeeks    : FromDate := Trunc(Date) + 1 - (DayOfWeek(Date)-1) - 7*(a_Parameter-1);
                               dct_Parameter_LastNMonths   : FromDate := IncMonth(EncodeDate(Y,M,1),   -(a_Parameter-1));
                               dct_Parameter_LastNQuarters : FromDate := IncMonth(EncodeDate(Y,((M-1)div 3) *3 + 1,1), -3*(a_Parameter-1));
                               dct_Parameter_LastNYears    : FromDate := IncMonth(EncodeDate(Y,1,1),-12*(a_Parameter-1));
                               else FromDate := Now;
                             end;
                             Result := PreQuot+a_b_FieldName+PostQuot + ' >= '+  GetDatasetDateStr(FromDate);
                           end;
                 dcgNull : case a_ConditionType of
                              dct_IsNull    : Result := PreQuot+a_b_FieldName+PostQuot + ' = NULL';
                              dct_IsNotNull : Result := PreQuot+a_b_FieldName+PostQuot + ' <> NULL';
                           end;
                      else Result := '';
    end;
  end;


function TTargetFilter_DateFilter.GetEditAreaHeight: integer;
  begin
    Result := Condition_ComboBox.Height;
    if (Condition_Date <> nil) then Result := Max(Result,Condition_Date.Height);
    if (Parameter_Edit <> nil) then Result := Max(Result,Parameter_Edit.Height);
  end;

procedure TTargetFilter_DateFilter.SetEditAreaBounds(aLeft,aTop,aWidth : integer);
  begin
    if Parameter_Edit = nil then exit;
    With Condition_Date do SetBounds(aLeft,aTop,Width,Height);
    With Condition_Time do SetBounds(Condition_Date.BoundsRect.Right+1,aTop,Width,Height);

    With IntervalCondition_Date1 do SetBounds(aLeft,aTop,Width,Height);
    With IntervalCondition_Time1 do SetBounds(IntervalCondition_Date1.BoundsRect.Right+1,aTop,Width,Height);
    if a_DisableTime
      then With IntervalCondition_Date2 do SetBounds(IntervalCondition_Date1.BoundsRect.Right+3,aTop,Width,Height)
      else With IntervalCondition_Date2 do SetBounds(IntervalCondition_Time1.BoundsRect.Right+3,aTop,Width,Height);
    With IntervalCondition_Time2 do SetBounds(IntervalCondition_Date2.BoundsRect.Right+1,aTop,Width,Height);

    With Parameter_Edit do SetBounds(aLeft,Atop,Condition_Date.Width,Height);
 end;

function TTargetFilter_DateFilter.GetMinimum: TDateTime;
  begin
    Result := IntervalCondition_Date1.Date+IntervalCondition_Time1.Time;
  end;

function TTargetFilter_DateFilter.GetMaximum: TDateTime;
  begin
    Result := IntervalCondition_Date2.Date+IntervalCondition_Time2.Time;
  end;

function TTargetFilter_DateFilter.GetValue: TDateTime;
  begin
    Result := Condition_Date.Date+Condition_Time.Time;
  end;

function TTargetFilter_DateFilter.GetParameter: integer;
  begin
    Result := Parameter_Edit.Value;
  end;

procedure TTargetFilter_DateFilter.SetMinimum(const Value: TDateTime);
  begin
    IntervalCondition_Date1.DateTime := trunc(Value);
    IntervalCondition_Time1.DateTime := Value - trunc(Value);
    UpdateFilterStr;
  end;

procedure TTargetFilter_DateFilter.SetMaximum(const Value: TDateTime);
  begin
    IntervalCondition_Date2.DateTime := trunc(Value);
    IntervalCondition_Time2.DateTime := Value - trunc(Value);
    UpdateFilterStr;
  end;

procedure TTargetFilter_DateFilter.SetValue(const Value: TDateTime);
  begin
    Condition_Date.DateTime := trunc(Value);
    Condition_Time.DateTime := Value - trunc(Value);
    UpdateFilterStr;
  end;

procedure TTargetFilter_DateFilter.SetParameter(const Value: integer);
  begin
    Parameter_Edit.Text := IntToStr(Value);
    UpdateFilterStr;
  end;

procedure TTargetFilter_DateFilter.SetConditionType(const Value: TDateConditionType);
begin
  if a_DisableTime and (Value in [dct_datetime_L .. dct_datetime_G_L]) then begin
    Application.MessageBox(PChar('При установленном свойстве ''a_DisableTime'''#13+
                           'условия на времена запрещены'),
                           'Запрещённый тип условия',MB_ICONWARNING + MB_OK);
    exit;
  end;
  fConditionType := Value;
  if csLoading in ComponentState then exit;
  SelectConditionTypeItemInCombo(Value,false);
  ConditionGroup := ConditionGroup;
  UpdateFilterStr;
end;

function TTargetFilter_DateFilter.EditAreaMinWidth: integer;
  begin
    Result := 50;
    if (Condition_Date <> nil) and (Condition_Time <> nil) then
      if a_DisableTime
        then Result := (Condition_Date.Width)
        else Result := (Condition_Date.Width + Condition_Time.Width)+2;
    (*case ConditionGroup of
        dcgDateCondition : ;
         dcgDateInterval : ;
    dcgDateTimeCondition : ;
     dcgDateTimeInterval : ;
            dcgParameter : ;
                      else Result := 10;
    end;*)
  end;

procedure TTargetFilter_DateFilter.FinishCreation;
  var
    DT : TDateTime;
  begin
    Inherited;
    if Parent = nil then exit;
    RebuildConditionList;

    if a_SetDateTimeToNow then AutoChangeValue;
    Parameter_Edit.Height := Condition_ComboBox.Height;
    if Parameter_Edit.Text = '' then Parameter_Edit.Text := '0';

    if Fa_SetTodayOnLoad then begin
      DT := Now;
      Condition_Date.Date     := Trunc(DT);
      Condition_Time.Time     := DT - Trunc(DT) ;

      IntervalCondition_Date1.Date := Trunc(DT);
      IntervalCondition_Time1.Time := DT - Trunc(DT) ;

      IntervalCondition_Date2.Date := Trunc(DT);
      IntervalCondition_Time2.Time := DT - Trunc(DT) ;
    end;
  end;

procedure TTargetFilter_DateFilter.DoOnChangeCondition(Sender: TObject);
  begin
    a_ConditionType := TDateConditionType(Condition_ComboBox.Items.Objects[Condition_ComboBox.ItemIndex]);
    inherited;
  end;

function TTargetFilter_DateFilter.GetConditionGroup: TDateConditionGroup;
  begin
    try
      Result := dcGroup[a_ConditionType];
    except
      Result := dcgNone;
    end;
  end;

procedure TTargetFilter_DateFilter.UpdateControlStatus;
  begin
    Inherited;
    SetControlStatus(Condition_Date,
                     ConditionGroup in [dcgDateCondition,dcgDateTimeCondition],
                     (ConditionGroup in [dcgDateCondition,dcgDateTimeCondition]) or
                     (ConditionGroup in [dcgNone,dcgNull]) and (Condition_Date.Parent <> nil));
    SetControlStatus(Condition_Time,
                     ConditionGroup in [dcgDateTimeCondition],
                     not a_DisableTime and
                     ((ConditionGroup in [dcgDateCondition,dcgDateTimeCondition]) or
                     (ConditionGroup in [dcgNone,dcgNull]) and (Condition_Time.Parent <> nil)));
    SetControlStatus(IntervalCondition_Date1,
                     ConditionGroup in [dcgDateInterval,dcgDateTimeInterval],
                     (ConditionGroup in [dcgDateInterval,dcgDateTimeInterval]) or
                     (ConditionGroup in [dcgNone,dcgNull]) and (IntervalCondition_Date1.Parent <> nil));
    SetControlStatus(IntervalCondition_Time1,
                     ConditionGroup in [dcgDateTimeInterval],
                     not a_DisableTime and
                     ((ConditionGroup in [dcgDateInterval,dcgDateTimeInterval,dcgParameter]) or
                     (ConditionGroup in [dcgNull,dcgNone]) and ((IntervalCondition_Time1.Parent <> nil) or (Condition_Time.Parent = nil))));
    SetControlStatus(IntervalCondition_Date2,
                     ConditionGroup in [dcgDateInterval,dcgDateTimeInterval],
                     (ConditionGroup in [{dcgDateCondition,dcgDateTimeCondition,}
                               dcgDateInterval,dcgDateTimeInterval
                               {dcgParameter,dcgNone}]) {or}
                     {(ConditionGroup in [dcgNone,dcgNull]) and (IntervalCondition_Date2.Parent <> nil)});
    SetControlStatus(IntervalCondition_Time2,
                     ConditionGroup in [dcgDateTimeInterval],
                     not a_DisableTime and (ConditionGroup in [{dcgDateCondition,dcgDateTimeCondition,}
                                            dcgDateInterval,dcgDateTimeInterval]));
    SetControlStatus(Parameter_Edit,
                      ConditionGroup in [dcgParameter],
                     (ConditionGroup in [dcgParameter]) or
                     (ConditionGroup in [dcgNone,dcgNull]) and (Parameter_Edit.Parent <> nil));
  end;

procedure TTargetFilter_DateFilter.SetConditionGroup(const Value: TDateConditionGroup);
  var
    CurTabOrder : integer;

    procedure RestoreTabOrder (W : TWinControl);
      begin
        if (W.Parent <> nil) and W.Enabled then begin
          W.TabOrder := CurTabOrder;
          inc(CurTabOrder);
        end;
      end;
  begin
    if csLoading in ComponentState then exit;
    CurTabOrder := 1;
    RestoreTabOrder(Condition_Date          );
    RestoreTabOrder(Condition_Time          );
    RestoreTabOrder(IntervalCondition_Date1 );
    RestoreTabOrder(IntervalCondition_Time1 );
    RestoreTabOrder(IntervalCondition_Date2 );
    RestoreTabOrder(IntervalCondition_Time2 );
    RestoreTabOrder(Parameter_Edit          );
    UpdateControlStatus;
    //PositionEditArea;
    //UpdateFilterStr;
  end;

procedure TTargetFilter_DateFilter.Seta_SetDateTimeToNow(const Value: boolean);
  begin
    Fa_SetDateTimeToNow := Value;
  end;

procedure TTargetFilter_DateFilter.Seta_DisableTime(const Value: boolean);
  begin
    Fa_DisableTime := Value;
    RebuildConditionList;
  end;

procedure TTargetFilter_DateFilter.RebuildConditionList;
  begin
    if csLoading in ComponentState then exit;
    With Condition_ComboBox do begin
     if a_DisableTime and (fConditionType in [dct_datetime_L .. dct_datetime_G_L])
       then fConditionType := dct_date_G_L;
     Items.Clear;

     Items.AddObject('выкл.'                ,TObject(dctNone                    ));

     Items.AddObject('<  /дата'                  ,TObject(dct_date_L                 ));
     Items.AddObject('<= /дата'                 ,TObject(dct_date_LE                ));
     Items.AddObject('=  /дата'                  ,TObject(dct_date_E                 ));
     Items.AddObject('>= /дата'                 ,TObject(dct_date_GE                ));
     Items.AddObject('>  /дата'                  ,TObject(dct_date_G                 ));
     Items.AddObject('не равно /дата'           ,TObject(dct_date_NE                ));
     Items.AddObject('с(вкл)  … по(вкл)  /дата'  ,TObject(dct_date_GE_LE             ));
     Items.AddObject('с(искл) … по(искл) /дата' ,TObject(dct_date_G_L               ));
     //Items.AddObject('с(вкл)  … по(искл) /дата' ,TObject(dct_date_GE_L              ));
     //Items.AddObject('с(искл) … по(вкл)  /дата'  ,TObject(dct_date_G_LE              ));

     if not a_DisableTime then begin
       Items.AddObject('<  /время'                 ,TObject(dct_datetime_L             ));
       Items.AddObject('<= /время'                ,TObject(dct_datetime_LE            ));
       Items.AddObject('=  /время'                 ,TObject(dct_datetime_E             ));
       Items.AddObject('>= /время'                ,TObject(dct_datetime_GE            ));
       Items.AddObject('>  /время'                 ,TObject(dct_datetime_G             ));
       Items.AddObject('не равно /время'                ,TObject(dct_datetime_NE            ));
       Items.AddObject('с(вкл)  … по(вкл)  /время' ,TObject(dct_datetime_GE_LE         ));
       Items.AddObject('с(искл) … по(искл) /время',TObject(dct_datetime_G_L           ));
       //Items.AddObject('с(вкл)  … по(искл) /время',TObject(dct_datetime_GE_L          ));
       //Items.AddObject('с(искл) … по(вкл)  /время' ,TObject(dct_datetime_G_LE          ));
     end;

     Items.AddObject('посл. N дней'      ,TObject(dct_Parameter_LastNDays    ));
     Items.AddObject('посл. N недель'    ,TObject(dct_Parameter_LastNWeeks   ));
     Items.AddObject('посл. N месяцев'   ,TObject(dct_Parameter_LastNMonths  ));
     Items.AddObject('посл. N кварталов' ,TObject(dct_Parameter_LastNQuarters));
     Items.AddObject('посл. N лет'       ,TObject(dct_Parameter_LastNYears   ));

     Items.AddObject('пусто'             ,TObject(dct_IsNull                 ));
     Items.AddObject('заполнено'         ,TObject(dct_IsNotNull              ));

     PositionEditArea;
     SelectConditionTypeItemInCombo(fConditionType,true);
    end;
  end;

  procedure TTargetFilter_DateFilter.SelectConditionTypeItemInCombo(aConditionType : TDateConditionType;
                                                                    NeedOnChange : boolean);
    var
      i : integer;
    begin
      With Condition_ComboBox do
      for i := 0 to Items.Count -1 do
        if TDateConditionType(Items.Objects[i]) = aConditionType then begin
          ItemIndex := i;
          if NeedOnChange then OnChange(Condition_ComboBox);
          break;
        end;
    end;

procedure TTargetFilter_DateFilter.AutoChangeValue;
  begin
    inherited;
    Condition_Date         .SetNow;
    Condition_Time         .SetNow;
    IntervalCondition_Date1.SetNow;
    IntervalCondition_Time1.SetNow;
    IntervalCondition_Date2.SetNow;
    IntervalCondition_Time2.SetNow;
    UpdateFilterStr;
  end;

function TTargetFilter_DateFilter.FilterValid(aErrorType : TTargetFilter_ErrorType): boolean;
  begin
    Result := false;
    if not Inherited FilterValid(aErrorType) then exit;
    case aErrorType of
      fetDesignTimeError: begin
                          end;
      fetRealTimeError  : begin
                            case ConditionGroup of
                              dcgParameter : if not TrueThat(Parameter_Edit.IsValueValid,
                                               aErrorType,'Неправильно введен параметр!') then exit;
                            end;                   
                          end;
    end;
    Result := true;
  end;

procedure TTargetFilter_DateFilter.FocusFilter(ForceFocus : boolean);
  begin
    Enabled := true;
    if not FilterFocused or ForceFocus then
      if Condition_Date.CanFocus
        then begin
               Condition_Date.SetFocus;
               ForceFocus := false;
             end
        else if IntervalCondition_Date1.CanFocus
               then begin
                      IntervalCondition_Date1.SetFocus;
                      ForceFocus := false;
                    end
               else if Parameter_Edit.CanFocus
                       then begin
                              Parameter_Edit.SetFocus;
                              ForceFocus := false;
                            end;
    inherited;
  end;

procedure TTargetFilter_DateFilter.Seta_TabStop(const Value: boolean);
  begin
    inherited;
    Condition_Date         .TabStop := Value;
    Condition_Time         .TabStop := Value;
    IntervalCondition_Date1.TabStop := Value;
    IntervalCondition_Time1.TabStop := Value;
    IntervalCondition_Date2.TabStop := Value;
    IntervalCondition_Time2.TabStop := Value;
    Parameter_Edit         .TabStop := Value;
  end;

function TTargetFilter_DateFilter.ParamCount: integer;
  begin
    Result := 2;
  end;

procedure TTargetFilter_DateFilter.Seta_SetTodayOnLoad(const Value: boolean);
  begin
    Fa_SetTodayOnLoad := Value;
  end;

function TTargetFilter_DateFilter.GetEditControlCount: integer;
  begin
    Result := Inherited GetEditControlCount + 7;
  end;

function TTargetFilter_DateFilter.GetEditControl(i: integer;outVisualColumn: Pointer): TWinControl;
  var
    vc : integer;
  begin
    Result := Inherited GetEditControl(i,outVisualColumn);
    if Result <> nil then exit;
    case (i - (Inherited GetEditControlCount-1)) of
      1: begin
           Result := Condition_Date;
           vc := 1;
         end;
      2: begin
           Result := Condition_Time;
           vc := 2;
         end;
      3: begin
           Result := IntervalCondition_Date1;
           vc := 1;
         end;
      4: begin
           Result := IntervalCondition_Time1;
           vc := 2;
         end;
      5: begin
           Result := IntervalCondition_Date2;
           vc := 3;
           if ConditionGroup in [dcgDateInterval] then vc := vc - 1;
         end;
      6: begin
           Result := IntervalCondition_Time2;
           vc := 4;
         end;
      7: begin
           Result := Parameter_Edit;
           vc := 1;
         end;
    end;

    if (Result <> nil) and (outVisualColumn <> nil)
      then integer(outVisualColumn^) := vc;
  end;

procedure TTargetFilter_DateFilter.LoadValue(V: Variant);
  var
    i : integer;
  begin
    if not VarIsArray(V) then exit;
    for i := VarArrayLowBound(V,1) to VarArrayHighBound(V,1) do
        case i of
        0 : begin
              if not (VarIsNull(V[i]) or VarIsEmpty(V[i]))
                then begin
                       Condition_Date.DateTime := trunc(V[i]);
                       Condition_Time.DateTime := V - trunc(V[i]);
                     end
                else begin
                       Condition_ComboBox.ItemIndex := 0;
                       Condition_ComboBox.OnChange(Condition_ComboBox);
                     end;
            end;
        1 : if not (VarIsNull(V[i]) or VarIsEmpty(V[i]))
                then begin
                       IntervalCondition_Date1.DateTime := trunc(V[i]);
                       IntervalCondition_Time1.DateTime := V - trunc(V[i]);
                     end;
        2 : if not (VarIsNull(V[i]) or VarIsEmpty(V[i]))
                then begin
                      IntervalCondition_Date2.DateTime := trunc(V[i]);
                      IntervalCondition_Time2.DateTime := V - trunc(V[i]);
                    end;

        4 : if not (VarIsNull(V[i]) or VarIsEmpty(V[i]))
                then begin
                       Parameter_Edit.Value := round(V[i]);
                     end;
        end;
    if Condition_ComboBox.ItemIndex <> 0 then inherited;
  end;

function TTargetFilter_DateFilter.SetDefaultConditionTypeIfNone: boolean;
  begin
    if not Inherited SetDefaultConditionTypeIfNone then exit;
    a_ConditionType := dct_date_E;
  end;

{ TTarget_DateFilter_DTP }
procedure TTarget_DateFilter_DTP.SetNow;
  begin
    if Kind = dtkTime
      then DateTime := sysutils.Time
      else DateTime := sysutils.Date;
  end;

procedure TTarget_DateFilter_DTP.WndProc(var Message: TMessage);
  var
    tc : TDateTime;
  begin
    if (Message.Msg = WM_LBUTTONDOWN) and (Parent is TTargetFilter_DateFilter) then begin
       tc := Now;
       if (tc - PrevClick) < (GetDoubleClickTime/(24*60*60*1000))
         then (Parent as TTargetFilter_DateFilter).AutoChangeValue;
       PrevClick := tc;
    end;
    inherited;
  end;

initialization
  RegisterClass(TTargetFilter_DateFilter);
end.


