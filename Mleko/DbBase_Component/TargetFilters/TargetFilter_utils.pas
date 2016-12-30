unit TargetFilter_utils;

interface
  uses windows,extctrls, controls, forms,sysutils,stdctrls,messages,classes;
  function CalcPanelFullBorderWidth (p : TPanel) : integer;

  function IsExtendedValue  (s : string;
                            IsMes : boolean = false;
                            CallerInfo : string = '';
                            PValue : Pointer = nil) : boolean; overload;
  function IsExtendedValue (s : string; var Value : extended) : boolean; overload;
  function PrepareSToConvertToFloat(S : string) : string;
  function IsIntValue      (s : string;
                            IsMes : boolean = false;
                            CallerInfo : string = '';
                            PValue : Pointer = nil) : boolean;
  procedure DecodeDateValue(s : string; var DateValue : TDate; var TimeValue : TTime; IsMes : boolean = false);
  function DecSep(S : string) : string;
  function HasParent(C, aParent: TWinControl): boolean;

var
  TF_M_SetTabStop : cardinal;

type
  TTargetFilter_ParamType =
    (fptString,fptFloat,fptDate);
  TTargetFilter_ParamRec = record
                             ParamName  : string;
                             ParamType  : TTargetFilter_ParamType;
                             ParamValue : Variant;
                           end;
  TTargetFilter_ParamRecArr = array of TTargetFilter_ParamRec;
  TTargetFilter_ParamInfo = record
                              ParamFilterStr : string;
                              Params : TTargetFilter_ParamRecArr;
                            end;
  procedure InitTargetFilter_ParamInfo (var R : TTargetFilter_ParamInfo);
  procedure AssignTargetFilter_ParamInfo(InR  : TTargetFilter_ParamInfo;
                                         var OutR : TTargetFilter_ParamInfo);
  function tf_ShortCutToText(ShCt : TShortCut) : string;
implementation
  function CalcPanelFullBorderWidth (p : TPanel) : integer;
    begin
      Result := 0;
      if p = nil then begin
        exit;
      end;
      Result := Result + p.BorderWidth;
      if p.BevelOuter <> bvNone then Result := Result + p.BevelWidth;
      if p.BevelInner <> bvNone then Result := Result + p.BevelWidth;
    end;

  function PrepareSToConvertToFloat(S : string) : string;
    begin
      Result := StringReplace (S     ,',',DecimalSeparator,[rfReplaceAll]);
      Result := StringReplace (Result,'.',DecimalSeparator,[rfReplaceAll]);
    end;

  function IsExtendedValue (s : string;
                            IsMes : boolean = false;
                            CallerInfo : string = '';
                            PValue : Pointer = nil) : boolean;
    var
      Value : extended;
    begin
      try
        s := PrepareSToConvertToFloat(s);
        Value := StrToFloat(s);
        if PValue <> nil then Extended(PValue^) := Value;
        Result := true;
      except
        on e : exception do begin
          if IsMes then begin
                          if CallerInfo <> #13 then CallerInfo := #13+CallerInfo;
                          Application.MessageBox(PChar('Неправильный формат числа:'#13+S+CallerInfo),
                                               'Ввод вещественного числа',0);
                        end;
          Result := false;
        end;
      end;
    end;

  function IsIntValue (s : string;
                       IsMes : boolean = false;
                       CallerInfo : string = '';
                       PValue : Pointer = nil) : boolean;
    var
      Value : integer;
    begin
      try
        Value := StrToInt(s);
        Result := true;
        if PValue <> nil then integer(PValue^) := Value;
      except
        on e : exception do begin
          if IsMes then begin
                          if CallerInfo <> #13 then CallerInfo := #13+CallerInfo;
                          Application.MessageBox(PChar('Неправильный формат числа:'#13+S+CallerInfo),
                                                 'Ввод целого числа',0);
                        end;
          Result := false;
        end;
      end;
    end;


  function IsExtendedValue (s : string; var Value : extended) : boolean;
    begin
      try
        s := PrepareSToConvertToFloat(s);
        Value := StrToFloat(s);
        Result := true;
      except
        Result := false;
      end;
    end;

  procedure DecodeDateValue(s : string; var DateValue : TDate; var TimeValue : TTime; IsMes : boolean = false);
    begin
      try
        (*DateValue := EncodeDate(StrToInt(Copy(DateValue,4,2)),
                                StrToInt(Copy(DateValue,4,2)),
                                StrToInt(Copy(DateValue,1,2))*);

      except
        on e : exception do begin
          if IsMes then Application.MessageBox(PChar('Введите дату в формате ''dd.mm.yyyy hh:nn:ss'''#13+
                                           'Введена дата: '''+s+'''')
                                    ,'Неправильный формат даты',MB_OK);
        end;
      end;
    end;

  function DecSep(S : string) : string;
    begin
      Result := StringReplace(S,     ',',DecimalSeparator,[]);
      Result := StringReplace(Result,'.',DecimalSeparator,[]);
    end;


procedure InitTargetFilter_ParamInfo (var R : TTargetFilter_ParamInfo);
  begin
    R.ParamFilterStr := '';
    R.Params := nil;
  end;

procedure AssignTargetFilter_ParamInfo(InR : TTargetFilter_ParamInfo;
                                       var OutR : TTargetFilter_ParamInfo);
  var
    i : integer;
  begin
    OutR.ParamFilterStr := InR.ParamFilterStr;
    SetLength(OutR.Params,Length(InR.Params));
    for i := 0 to high(OutR.Params) do
      OutR.Params[i] := InR.Params[i];
  end;

  function tf_ShortCutToText(ShCt : TShortCut) : string;
    begin
      Result := '';
      if ShCt = 0 then exit;
      if (WordRec(ShCt).Hi and (scShift shr 8)) <> 0 then Result := 'Shift+';
      if (WordRec(ShCt).Hi and (scCtrl  shr 8)) <> 0 then Result := 'Ctrl+';
      if (WordRec(ShCt).Hi and (scAlt   shr 8)) <> 0 then Result := 'Alt+';

      if WordRec(ShCt).Lo <> 0
        then Result := Result + Char(WordRec(ShCt).Lo);
    end;

  {TFilter_Rec = record
                  ParamName  : string;
                  ParamType  : TFilter_ParamType;
                  ParamValue : Variant;
                end;}

    function HasParent(C, aParent: TWinControl): boolean;
      begin
        Result := false;
        if C = nil then exit;
        if C.Parent = nil then exit;

        if C.Parent = aParent
          then begin
                 Result := true;
                 exit;
               end
          else Result := HasParent(C.Parent,aParent);
      end;

initialization
  TF_M_SetTabStop := RegisterWindowMessage('TargetFilter_M_SetTabStop');
end.
