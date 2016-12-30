unit targetFilter_ScrollBox_Load;

interface
  uses
    typinfo,classes,controls,comp_TargetFilter_CustomFilter,comp_TargetFilter_ScrollBox,sysutils, forms,
    targetStrList,comp_TargetFilter_LookupFilter,db,windows;

   procedure AddFiltersWithDescription (SB : TTargetFilter_ScrollBox; DescriptionList : string);
   function CreateTargetFilter(AOwner : TWinControl; Description : string) : TTargetFilter_CustomFilter;

implementation

   procedure AddFiltersWithDescription (SB : TTargetFilter_ScrollBox; DescriptionList : string);
     var
       Descr : string;
       F     : TTargetFilter_CustomFilter;
     begin
       Descr := GetNextVolume(DescriptionList);
       try
         while not (Descr = '') do begin
           {try}
             F := CreateTargetFilter(SB,Descr);
             if F <> nil then SB.InsertFilter(F);
           {except
             On e : Exception do begin
               exit;
             end;
           end;}
           Descr := GetNextVolume(DescriptionList);
         end;
       finally
         SB.ForceListClose;
       end;
     end;

   function CreateTargetFilter(AOwner : TWinControl; Description : string) : TTargetFilter_CustomFilter;
     var
       SL : TStringList;
       P  : TPersistentClass;
       i  : integer;
       S,Name,Value : string;
       Stage : string;

       function DecodeProp(S : string; var N,V : string) : boolean;
         var
           P : integer;
         begin
           Result := false;
           P := Pos('=',S);
           if P = 0 then exit;
           if P = Length(S) then exit;

           N := Copy(S,1,P-1);
           V := Copy(S,P+1,Length(S));
           Result := true;
         end;

     begin
       Result := nil;
       if Description = '' then exit;
       SL := TStringList.Create;
       try
         try
           With SL do begin
             Stage := 'FillStringListWithVolume';
             FillStringListWithVolume(SL,Description);
             S := SL.Values['class'];
             if S = '' then exit;
             Stage := 'GetClass';
             P := GetClass(S);
             if P = nil then exit;
             if not (P.InheritsFrom(TTargetFilter_CustomFilter))
               then raise exception.Create('Неправильный класс фильтра!');
             Stage := 'NewInstance';
             Result := P.NewInstance as TTargetFilter_CustomFilter;
             Stage := 'Create';
             Result.Create(AOwner);
             Stage := 'Parent';
             Result.Parent := TWinControl(AOwner);
             Stage := 'Свойства';
             for i := 1 to SL.Count-1 do
                 if DecodeProp(SL[i],Name,Value) then begin
                   Stage := 'Свойство '+Name +' = '+Value;
                   if (Result is TTargetFilter_LookupFilter) and (AnsiLowerCase(Name) = 'a_listsource')
                     then begin
                            TTargetFilter_LookupFilter(Result).a_ListSource := TDataSource(StrToInt(Value));
                          end
                     else SetPropValue(Result,Name,Value);
                 end;
           end;
         finally
           FreeAndNil(SL);
         end;
       except
         On E : Exception do begin
           raise Exception.Create('Ошибка построения фильтра на этапе'#13+
                                  Stage+#13+
                                  E.Message+#13+
                                  '<<@>>Строка описания:'+#13+Description+#13#13+'Обратитесь к разработчикам');
         end;
       end;
     end;


end.
