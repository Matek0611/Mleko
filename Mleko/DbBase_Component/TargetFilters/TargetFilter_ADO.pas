unit TargetFilter_ADO;

interface
  uses TargetFilter_Utils,ADODb,sysutils,db;

procedure TargetFuilter_AddParameters(D : TCustomADODataSet;
                                      aParamInfo : TTargetFilter_ParamRecArr;
                                      ClearParams : boolean);

implementation
function GetParameters(D : TCustomADODataSet) : TParameters;
  begin
    if D is TADOQuery
      then Result := TADOQuery(D).Parameters
      else if D Is TADOStoredProc
                  then Result := TADOStoredProc(D).Parameters
                  else raise Exception.Create('TargetFilter_CreateParameters : некорректный тип класса данных!');
  end;

procedure TargetFilter_AddParameter(FR : TTargetFilter_ParamRec;
                                    Params : TParameters);
  begin
    With Params.AddParameter do begin
      Name := FR.ParamName;
      case FR.ParamType of
        fptString   : begin
                        DataType := ftString;
                        //Size     := 300;//???
                      end;
        fptFloat    : DataType := ftFloat;
        fptDate     : DataType := ftDate;
      end;
      Direction := pdInput;
      Value     := FR.ParamValue;
    end;
  end;

procedure TargetFuilter_AddParameters(D : TCustomADODataSet;
                                      aParamInfo : TTargetFilter_ParamRecArr;
                                      ClearParams : boolean);
  var
    Params : TParameters;
    i      : integer;
  begin
    Params := GetParameters(D);
    if ClearParams then Params.Clear;
    for i := low(aParamInfo) to high(aParamInfo) do begin
      TargetFilter_AddParameter(aParamInfo[i],Params);
    end;
  end;

end.
