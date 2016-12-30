unit targetStrList;
interface
   uses classes,sysutils;
   function GetNextVolume(var DescriptionList : string) : string;
   procedure FillStringListWithVolume(SL : TStringList; VolumeStr : string);
   function GetValue(SL : TStringList; Name : string; var Val : string; NeedLowerCase : boolean = false; Default : string = '') : boolean; overload;
   function GetBoolValue(SL : TStringList; Name : string; Default : boolean) : boolean;
   function GetIntValue(SL : TStringList; Name : string; var Val : integer) : boolean;
   function GetValue(SL : TStringList; Name : string; Default : integer) : integer; overload;
   function GetValue(SL : TStringList; Name : string; Default : boolean) : boolean; overload;
   function GetValue(SL : TStringList; DescriptionList : string; Volume,Name : string; Default : string; NeedLowerCase : boolean = false) : string; overload;
   function GetValueIndex(aValueStr,aValue : string; aDelimeter   : string; var aValID : integer) : boolean;
implementation
   function GetNextVolume(var DescriptionList : string) : string;
     var
       P : Integer;
     begin
       Result := '';
       if Copy(DescriptionList,1,5) = '<<@>>' then
         DescriptionList := Copy(DescriptionList,6,Length(DescriptionList));
       if DescriptionList = '' then exit;

       P := Pos('<<@>>',DescriptionList);
       if P = 0 then P := Length(DescriptionList)+1;
       Result := Copy(DescriptionList,1,P-1);
       DescriptionList := Copy(DescriptionList,P+length('<<@>>'),Length(DescriptionList));
     end;

   procedure FillStringListWithVolume(SL : TStringList; VolumeStr : string);
     begin
       if SL = nil then exit;
       VolumeStr := StringReplace(VolumeStr,'<<>>',#13#10,[rfReplaceAll]);
       SL.Text := VolumeStr;
     end;

    function GetValue(SL : TStringList; Name : string; var Val : string; NeedLowerCase : boolean = false; Default : string = '') : boolean;
      begin
        Result := false;
        Val := SL.Values[Name];
        if Val = '' then Val := Default;
        if Val = '' then exit;
        if NeedLowerCase then Val := AnsiLowerCase(Val);
        Result := true;
      end;

    function GetIntValue(SL : TStringList; Name : string; var Val : integer) : boolean;
      var
        SVal : string;
      begin
        Result := false;
        SVal := SL.Values[Name];
        if SVal = '' then exit;
        try
          Val := StrToInt(SVal);
          Result := true;
        except
        end;
      end;


    function GetNextItem (var StrList : string;
                          var Item    : string;
                          Delimeter   : string;
                          NeedUpperCase   : boolean = false) : boolean;
      var
        P : integer;
      begin
        P := Pos(Delimeter,StrList);
        if P = 0 then P := Length(StrList)+1;

        Item    := Copy(StrList,1,P-1);
        if NeedUpperCase
          then Item    := AnsiUpperCase(Item);
        StrList := Copy(StrList,P+Length(Delimeter),Length(StrList));
        Result := Item <> '';
      end;

    function GetValueIndex(aValueStr,aValue : string; aDelimeter   : string; var aValID : integer) : boolean;
      var
        i : integer;
        S : string;
      begin
        Result := aValue <> '';
        if not Result then exit;
        aValue := AnsiUpperCase(aValue);
        i := -1;
        repeat
          if not GetNextItem(aValueStr,S,aDelimeter,true) then break;
          inc(i);
          if S = aValue then begin
            aValID := i;
            exit;
          end;
        until false;

        Result := false;
      end;

     function GetBoolValue(SL : TStringList; Name : string; Default : boolean) : boolean;
       var
         S : string;
       begin
         Result := Default;
         if not GetValue(SL,Name,S,true) then exit;
         if (S = 'y') or (S = 't') or (S = 'yes') or (S = 'true')
           then Result := true;
         if (S = 'n') or (S = 'f') or (S = 'no')  or (S = 'false')
           then Result := false
       end;

     function GetValue(SL : TStringList; Name : string; Default : integer) : integer;
       var
         S : string;
       begin
         Result := Default;
         if not GetValue(SL,Name,S) then exit;
         try
           Result := StrToInt(S);
         except
         end;
       end;

   function GetValue(SL : TStringList; Name : string; Default : boolean) : boolean;
     begin
       Result := GetBoolValue(SL,Name,Default);
     end;

   function GetValue(SL : TStringList;
                     DescriptionList : string;
                     Volume,Name : string; Default : string; NeedLowerCase : boolean = false) : string; overload;
     var
       ValStr,VolumeStr : string;
     begin
       try
         Result := Default;
         while DescriptionList <> '' do begin
           VolumeStr := GetNextVolume(DescriptionList);
           FillStringListWithVolume(SL,VolumeStr);
           ValStr := SL.Values[Name];
           if ValStr <> '' then begin
             Result := ValStr;
             break;
           end;
         end;
       finally
          if NeedLowerCase then Result := AnsiLowerCase(Result);
       end;
     end;


end.
