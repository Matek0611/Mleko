unit comp_TargetFilter_ScrollBox;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, ExtCtrls, ComCtrls,
  comp_TargetFilter_Panel,comp_TargetFilter_CustomFilter,comp_TargetFilter_NumberFilter,dialogs,
  forms, ActnList,graphics,ImgList,StdCtrls,menus,math,buttons,targetFilter_Utils;
  { TODO : Проверить при применённом фильтре изменение и/или }
type

  TTargetFilter_ScrollBox = class;
  TTargetFilter_ScrollBox_OnListOpen= procedure (Sender : TTargetFilter_ScrollBox;
                                                  IsBeforeCall : boolean;
                                                  IsOpen       : boolean) of object;

  TTargetFilter_ScrollBox_OnLoadFilterValue = function (Sender    : TTargetFilter_ScrollBox;
                                                        Filter    : TWinControl;
                                                        var Value : Variant) : boolean of object;
  TTargetFilter_ScrollBox_OnNeedActivateFilter    = function (Sender    : TTargetFilter_ScrollBox;
                                                              var TableName,ServerFieldName,FieldName : string) : boolean of object;
  TTargetFilter_ScrollBox_OnApplyFilter = procedure (Sender    : TTargetFilter_ScrollBox; NeedApply : boolean) of object;
  TTargetFilter_ScrollBox_OnUpdateApplyFilter = function (Sender    : TTargetFilter_ScrollBox) : boolean of object;
  TTargetFilter_ScrollBox_OnInsertFilter = function (Sender : TTargetFilter_ScrollBox;
                                                     F : TControl) : boolean of object;
  TTargetFilter_ScrollBox_NotifyEvent = procedure (Sender : TTargetFilter_ScrollBox; Action : TAction) of object;


  T_ScrollBox = class(TScrollBox)
                protected
                  procedure WndProc (var Message : TMessage); override;
                end;

  TTargetFilter_ScrollBox = class(TPanel)
  private
    Fa_MinimizedFilterCount: integer;
    FListOpen: boolean;
    Fa_ServerType: TTargetFilter_ServerType;
    fOnListOpen: TTargetFilter_ScrollBox_OnListOpen;
    fOnLoadFilterValue: TTargetFilter_ScrollBox_OnLoadFilterValue;
    fOnLoadFilterActionUpdate: TTargetFilter_ScrollBox_NotifyEvent;
    fa_OnApplyFilter: TTargetFilter_ScrollBox_OnApplyFilter;
    FFilterApplied: boolean;
    fa_OnUpdateApplyFilter: TTargetFilter_ScrollBox_OnUpdateApplyFilter;
    filterChanged : boolean;
    Fa_FiltersMask: integer;
    Fa_OnInsertFilter: TTargetFilter_ScrollBox_OnInsertFilter;
    Fa_AutoApplyOnExit: boolean;
    FDisableShortCuts: boolean;
    FOnNeedActivateFilter: TTargetFilter_ScrollBox_OnNeedActivateFilter;
    function Geta_FilterMemo: TMemo;
    procedure Seta_FilterMemo(const Value: TMemo);
    procedure SetListOpen(const Value: boolean);
    function GetFilter : string;
    procedure Seta_ServerType(const Value: TTargetFilter_ServerType);
    function GetPanelAutosize: boolean;
    procedure SetPanelAutosize(const Value: boolean);
    procedure TTargetFilter_ScrollBox_LoadFilterValue(Sender: TObject);
    function GetDatasetFilter: string;
    procedure SetFilterApplied(const Value: boolean);
    function GetTabControl(Index: integer): TWinControl;
    function GetTabControlCount: integer;
    procedure Seta_AutoApplyOnExit(const Value: boolean);
    procedure SetDisableShortCuts(const Value: boolean);
  private
    { Private declarations }
    Image_Img : TImage;
    Image_Pnl : TPanel;
    PrevImage_ImgResName : string;
    fActiveFilterStatus : integer;
    fImages    : TImageList;
    SB : T_ScrollBox;
    //TB : TToolBar;
    acList : TActionList;
    PrevScrollWndProc : TFNWndProc;
    BitBtn : array [0..3] of TBitBtn;
    procedure Loaded; override;
    procedure DoOnSetNewFilter(Sender : TTargetFilter_Panel; Filter : TWinControl);
  protected
    { Protected declarations }
    acTurnOff,acApply,acShowList,acLoadFilterValue,acUpdateActiveControl,
    acNext,acPrev : TAction;
    //tbAcApply,tbShowListButton : TToolButton;
    bbApply,bbShowList,bbTurnOff : TBitBtn;

    //bbApply : TSpeedButton;
    procedure DoOnFilterChanged (Sender : TtargetFilter_CustomFilter);
    procedure OnOrAndChange(Sender : TObject);
    procedure acShowListExecute(Sender: TObject);
    procedure acTurnOffExecute (Sender: TObject);
    procedure acShowListUpdate (Sender: TObject);
    procedure acApplyUpdate    (Sender: TObject);
    procedure acApplyExecute   (Sender: TObject);
    procedure acTurnOffUpdate  (Sender: TObject);
    procedure SetParent (AParent: TWinControl); override;
    procedure FinishCreation;
    procedure SetEnabled(Value : boolean); override;
    procedure acLoadFilterValue_Update  (Sender : TObject);
    procedure acLoadFilterValue_Execute (Sender : TObject);

    procedure acGotoFilterExecute (Sender : TObject);
    procedure acGotoFilterUpdate  (Sender : TObject);
    procedure ScrollPosChanged;
  //----------
  private
    PrevFilterStr : string;
  public
    property DisableShortCuts : boolean read FDisableShortCuts write SetDisableShortCuts;
  protected
    procedure DoEnter; override;
    procedure DoExit; override;
  //----------
  public
    { Public declarations }
    tf_Panel : TTargetFilter_Panel;
    OrAnd : TTargetFilter_OrAnd;
    property ActiveFilterStatus : integer read fActiveFilterStatus;
    property FilterApplied : boolean read FFilterApplied write SetFilterApplied;
    property ListOpen : boolean read FListOpen write SetListOpen;
    constructor Create (AOwner : TComponent); override;
    procedure UpdateVisualState;
    procedure InsertFilter(C : TWinControl; ChangePosition : boolean = true);
    procedure DoOnEnter (Sender : TObject);
    property Filter : string read GetFilter;
    property DatasetFilter : string read GetDatasetFilter;

    procedure DefineProperties(Filer: TFiler); override;
    procedure LoadControlsInScrollBox(Reader: TReader);
    procedure StoreControlsInScrollBox(Writer: TWriter);
    destructor Destroy; override;
    procedure ForceListClose;
    property TabControlCount : integer read GetTabControlCount;
    property TabControl[Index : integer] : TWinControl read GetTabControl;
  published
    { Published declarations }
    property a_OnApplyFilter : TTargetFilter_ScrollBox_OnApplyFilter read fa_OnApplyFilter write fa_OnApplyFilter;
    property a_OnUpdateApplyFilter : TTargetFilter_ScrollBox_OnUpdateApplyFilter read fa_OnUpdateApplyFilter write fa_OnUpdateApplyFilter;
    property a_FilterMemo : TMemo read Geta_FilterMemo write Seta_FilterMemo;
    property a_ServerType : TTargetFilter_ServerType read Fa_ServerType write Seta_ServerType;
    property a_PanelAutoSize : boolean read GetPanelAutosize write SetPanelAutosize stored false;
    property a_OnListOpen : TTargetFilter_ScrollBox_OnListOpen read fOnListOpen write fOnListOpen;
    property a_OnLoadFilterValue        : TTargetFilter_ScrollBox_OnLoadFilterValue read fOnLoadFilterValue write fOnLoadFilterValue;
    property a_OnLoadFilterActionUpdate : TTargetFilter_ScrollBox_NotifyEvent read fOnLoadFilterActionUpdate write fOnLoadFilterActionUpdate;
    property a_OnInsertFilter : TTargetFilter_ScrollBox_OnInsertFilter read Fa_OnInsertFilter write Fa_OnInsertFilter;
    property a_AutoApplyOnExit : boolean read Fa_AutoApplyOnExit write Seta_AutoApplyOnExit default true;
    property a_OnNeedActivateFilter : TTargetFilter_ScrollBox_OnNeedActivateFilter
      read FOnNeedActivateFilter write FOnNeedActivateFilter;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('TargetDB', [TTargetFilter_ScrollBox]);
end;

{ TTargetFilter_ScrollBox }

{function ScrollWndProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
  var
    FSB : TTargetFilter_ScrollBox;
  begin
    FSB := TTargetFilter_ScrollBox(GetWindowLong(hWnd,GWL_USERDATA));
    Result := CallWindowProc(TTargetFilter_ScrollBox(FSB).prevScrollWndProc,hWnd,Msg,wParam,lParam);
  end;}


procedure TTargetFilter_ScrollBox.acShowListExecute(Sender: TObject);
  begin
    ListOpen := not ListOpen;
  end;

procedure TTargetFilter_ScrollBox.acShowListUpdate(Sender: TObject);
  begin
    TAction(Sender).Enabled := (tf_Panel.ControlCount > 1)
                               and CanFocus;
  end;

procedure TTargetFilter_ScrollBox.acTurnOffExecute(Sender: TObject);
  var
    i,j : integer;
    C  : TTargetFilter_CustomFilter;
    Cb : TTargetFilter_ComboBox;
    FFocused : boolean;
    PrevFocused : boolean;
  begin
    PrevFocused := bbTurnOff.Focused;
    for i := 0 to tf_Panel.ControlCount-1 do
      if tf_Panel.Controls[i] is TTargetFilter_CustomFilter then
        begin
          C := TTargetFilter_CustomFilter(tf_Panel.Controls[i]);
          for j := 0 to C.ControlCount - 1 do
            if C.Controls[j] is TTargetFilter_ComboBox then begin
              Cb := TTargetFilter_ComboBox(C.Controls[j]);
              FFocused := C.FilterFocused;
              Cb.ItemIndex := 0;
              Cb.OnChange(Cb);
              if FFocused and not C.FilterFocused then
                try
                  C.FocusFilter(false);
                except
                end;
              break;
            end;
        end;
    acTurnOffUpdate(acTurnOff);
    if PrevFocused and not bbTurnOff.Focused
      then if bbShowList.CanFocus then bbShowList.SetFocus;
  end;

procedure TTargetFilter_ScrollBox.acTurnOffUpdate(Sender: TObject);
  var
    i : Integer;
    C : TWinControl;
    FStr : string;
    s   : string;
  begin
    FStr := tf_Panel.Filter;

    TAction(Sender).Enabled := (FStr <> '') and Enabled;
    fActiveFilterStatus := 0;
    if FStr <> '' then
      for i := 0 to tf_Panel.FilterCount-1 do begin
        C := tf_Panel.FilterControl[i];
        if C is TTargetFilter_CustomFilter then begin
          if TTargetFilter_CustomFilter(C).FilterStr <> '' then inc(fActiveFilterStatus);
        end;
        if fActiveFilterStatus = 2 then break;
      end;
    if fActiveFilterStatus > 0
      then begin
             if fActiveFilterStatus > 1
               then begin
                      s := 'TARGETFILTER_FILTERS';
                      Hint := 'Имеется несколько активных фильтров';
                    end
               else begin
                      s := 'TARGETFILTER_FILTERS_1';
                      Hint := 'Имеется один активный фильтр';
                    end;
             if s <> PrevImage_ImgResName then begin
               PrevImage_ImgResName := s;
               Image_Img.Hint  := Hint;
               Image_Img.Picture.Bitmap.LoadFromResourceName(HInstance,PrevImage_ImgResName);
               Image_Img.Parent := Image_Pnl;
               //bbApply.Glyph.LoadFromResourceName(HInstance,PrevImage_ImgResName);
             end;
           end
      else begin
             if PrevImage_ImgResName <> '' then begin
               PrevImage_ImgResName := '';
               //bbApply.Glyph := nil;
               Image_Img.Parent := nil;
             end;
           end;
    bbTurnOff.Enabled := TAction(Sender).Enabled;
  end;

procedure TTargetFilter_ScrollBox.OnOrAndChange(Sender : TObject);
  begin
    filterChanged := true;
    if FFilterApplied and not ListOpen then
      if Assigned(fa_OnApplyFilter)
       then begin
              FilterChanged := false;
              fa_OnApplyFilter(self,true);
            end;
  end;

constructor TTargetFilter_ScrollBox.Create(AOwner: TComponent);
  var
    BM : graphics.TBitmap;

    procedure StoreBMInImages(BmpResourceName : string);
      begin
        BM.LoadFromResourceName(HInstance,BmpResourceName);
        fImages.Add(BM,nil);
      end;
  var
    PseudoTBLeftTop : TPoint;
  begin
    inherited;
    SetBounds(0,0,680,38);
    Constraints.MinHeight := 38;

    Image_Img := TImage.Create(self);
    With Image_Img do begin
      SetBounds(3,4,16,24);
      AutoSize := True;
      Transparent := True;
      Visible := true;
    end;

    fImages := TImageList.Create(self);
      fImages.ResInstLoad(HInstance,rtBitmap,'TARGETFILTER_APPLYFILTER'    ,clFuchsia);
      fImages.ResInstLoad(HInstance,rtBitmap,'TARGETFILTER_DOWNARROW',clFuchsia);
      fImages.ResInstLoad(HInstance,rtBitmap,'TARGETFILTER_UPARROW'  ,clFuchsia);
      fImages.ResInstLoad(HInstance,rtBitmap,'TARGETFILTER_TURNOFF'  ,clFuchsia);
      fImages.ResInstLoad(HInstance,rtBitmap,'TARGETFILTER_LOADVALUE'  ,clFuchsia);
      fImages.ResInstLoad(HInstance,rtBitmap,'TARGETFILTER_APPLIED'    ,clFuchsia);

    Image_Pnl := TPanel.Create(self);
    //bbApply := TSpeedButton.Create(self);
    with Image_Pnl do begin
      SetBounds(3,3,21,31);
      BevelInner := bvLowered;
      //AllowAllUp := true;
      Parent := self;
      //Flat := true;
      //GroupIndex := 1;
    end;

    SB := T_ScrollBox.Create(self);
    With SB do begin
      //SetBounds(73,3,500,63);
      SetBounds(Image_Pnl.BoundsRect.Right+3,3,516,31);
      BevelInner := bvNone;
      BorderStyle := bsNone;
      Anchors := [akLeft,akRight,akTop,akBottom];
      Parent := self;
      //VertScrollBar.Range := 1;
      //HorzScrollBar.Range := 1;
    end;
    //SetWindowLong(SB.VertScrollBar Handle,SWL_WNDPROC,integer(@ScrollWndProc));

    tf_Panel := TTargetFilter_Panel.Create(self);
    with tf_Panel do begin
      //Color := clBlue;
      tf_Panel.a_Filter_MultilineFilter := false;
      if csDesigning in ComponentState
        then tf_Panel.OnSetNewFilter := DoOnSetNewFilter;
      Parent := SB;
      SetBounds(0,0,1,1);
      if csDesigning in ComponentState
        then begin
               align := alClient;
               Color := clBtnShadow;
             end
        else begin
                AutoSize := true;
             end;
      BevelOuter := bvNone;
    end;

    acList := TActionList.Create(self);
    //acList.Images := fImages;

    acShowList := TAction.Create(acList);
    with acShowList do begin
      ActionList := acList;
      //Caption := 'Открыть список фильтров';
      Hint := 'Открыть список фильтров';
      ImageIndex := 1;
      ShortCut := menus.ShortCut(word('J'),[ssCtrl]);
      SecondaryShortCuts.Add('Ctrl+О');
      OnExecute := acShowListExecute;
      OnUpdate  := acShowListUpdate;
    end;

    acLoadFilterValue := TAction.Create(acList);
    with acLoadFilterValue do begin
      ActionList := acList;
      //Caption := 'Получить значение текущего фильтра из программы';
      Hint := 'Получить значение текущего фильтра из программы';
      ImageIndex := 4;
      ShortCut := menus.ShortCut(word('G'),[ssCtrl]);
      SecondaryShortCuts.Add('Ctrl+П');
      OnExecute := acLoadFilterValue_Execute;
      OnUpdate := acLoadFilterValue_Update;
    end;

    acApply := TAction.Create(acList);
    with acApply do begin
      ActionList := acList;
      //Caption := 'Применить активные фильтры';
      Hint := 'Применить активные фильтры';
      //ImageIndex := 0;

      ShortCut := menus.ShortCut(word('A'),[ssCtrl,ssAlt]);
      SecondaryShortCuts.Add('Ctrl+Alt+Ф');
      OnExecute := acApplyExecute;
      OnUpdate := acApplyUpdate;
    end;

    {acUpdateActiveControl := TAction.Create(acList);
    With acUpdateActiveControl do begin
      ActionList := acList;
      OnUpdate := acUpdateActiveControl_Update;
    end;}

    acTurnOff := TAction.Create(acList);
    with acTurnOff do begin
      ActionList := acList;
      //Caption := 'Выключить все фильтры';
      Hint := 'Выключить все фильтры';
      ImageIndex := 3;
      ShortCut := menus.ShortCut(vk_Subtract,[ssCtrl]);
      OnExecute := acTurnOffExecute;
      OnUpdate  := acTurnOffUpdate;
    end;

    acNext  := TAction.Create(acList);
    With acNext do begin
      ActionList := acList;
      Hint := 'Следующий фильтр';
      Tag  := 1;
      ShortCut := menus.ShortCut(vk_Next,[ssAlt]);
      OnExecute := acGotoFilterExecute;
      OnUpdate  := acGotoFilterUpdate;
    end;

    acPrev  := TAction.Create(acList);
    With acPrev do begin
      ActionList := acList;
      Hint := 'Предыдущий фильтр';
      Tag  := -1;
      ShortCut := menus.ShortCut(vk_Prior,[ssAlt]);
      OnExecute := acGotoFilterExecute;
      OnUpdate  := acGotoFilterUpdate;
    end;

    {bbApply := TSpeedButton.Create(self);
    with bbApply do begin
      Action := acApply;
      SetBounds(3,3,21,31);
      //BevelInner := bvLowered;
      AllowAllUp := true;
      Parent := self;
      Flat := true;
      //GroupIndex := 1;
    end;}

    PseudoTBLeftTop := Point(SB.BoundsRect.Right + 6,
                             7);
    {TB := TToolBar.Create(self);
    With TB do begin
      Parent := self;
      Align := alNone;
      //SetBounds(580,5,96,26);
      SetBounds(SB.BoundsRect.Right + 3,5,96,26);
      Anchors := [akRight,akTop];
      EdgeBorders := [];
      BorderWidth := 1;
      Flat := True;
    end;}

    {With TToolButton.Create(TB) do begin
      SetBounds(0,0,Width,Height);
      Action  := acLoadFilterValue;
    end;

    With TToolButton.Create(TB) do begin
      SetBounds(23,0,Width,Height);
      Action  := acTurnOff;
    end;

    bbApply := TToolButton.Create(TB);
    With bbApply do begin
      SetBounds(46,0,Width,Height);
      AllowAllup := true;
      Action  := acApply;
      ImageIndex := 0;
    end;

    bbShowList := TToolButton.Create(TB);
    With bbShowList do begin
      SetBounds(69,0,Width,Height);
      Action  := acShowList;
      AllowAllUp := true;
    end;}

    BitBtn[0] := TBitBtn.Create(Self);
    With BitBtn[0] do begin
      SetBounds(PseudoTBLeftTop.X + 0,
                PseudoTBLeftTop.Y,
                21,21);
      Anchors := [akRight,akTop];
      Action  := acLoadFilterValue;
      fImages.GetBitMap(4,Glyph);
      Margin  := 0;
      Layout  := blGlyphTop;
      Parent  := self;
    end;

    BitBtn[1] := TBitBtn.Create(Self);
    bbTurnOff := BitBtn[1];
    With bbTurnOff do begin
      SetBounds(PseudoTBLeftTop.X + 21,
                PseudoTBLeftTop.Y,
                21,21);
      Anchors := [akRight,akTop];
      Action  := acTurnOff;
      fImages.GetBitMap(3,Glyph);
      Margin  := 0;
      Layout  := blGlyphTop;
      Parent  := self;
    end;

    BitBtn[2] := TBitBtn.Create(Self);
    bbApply := BitBtn[2];
    With bbApply do begin
      SetBounds(PseudoTBLeftTop.X + 21*2,
                PseudoTBLeftTop.Y,
                21,21);
      //AllowAllup := true;
      Anchors := [akRight,akTop];
      Action  := acApply;
      Margin  := 0;
      Layout  := blGlyphTop;
      fImages.GetBitmap(0,bbApply.Glyph);
      Parent  := self;
      //ImageIndex := 0;
    end;

    BitBtn[3] := TBitBtn.Create(Self);
    bbShowList := BitBtn[3];
    With bbShowList do begin
      SetBounds(PseudoTBLeftTop.X + 21*3,
                PseudoTBLeftTop.Y,
                21,21);
      Anchors := [akRight,akTop];
      Action  := acShowList;
      Margin  := 0;
      Layout  := blGlyphTop;
      Parent  := self;
      //AllowAllUp := true;
    end;

    OrAnd := TTargetFilter_OrAnd.Create(self);
    With OrAnd do begin
      //SetBounds(28,3,43,31);
      //SetBounds(TB.BoundsRect.Right + 3,3,40,31);
      SetBounds(PseudoTBLeftTop.X + 21*4+4 + 1,3,40,31);
      Anchors := [akRight,akTop];
      BevelOuter := bvNone;
      a_OrAnd := oaAnd;
      Parent := self;
      a_RadioButton_FromBorderShift := 0;
      a_OrAndChange := OnOrAndChange;
    end;

    OrAnd.a_TargetFilter_Panel := tf_Panel;
    FListOpen := true;
    ListOpen  := false;
    fa_AutoApplyOnExit := true;
  end;

procedure TTargetFilter_ScrollBox.UpdateVisualState;
  begin
    //SB.VertScrollBar.Range := tf_Panel.Height;
    //SB.HorzScrollBar.Range := tf_Panel.Width;
  end;

procedure TTargetFilter_ScrollBox.InsertFilter(C: TWinControl; ChangePosition : boolean = true);
  var
    LastControlBottom : integer;
    PrevOnListOpen : TTargetFilter_ScrollBox_OnListOpen;
    P : TPoint;
  begin
    //MessageBox(0,'InsertFilter','InsertFilter',MB_OK);
    if C = nil then exit;
    if not (csDesigning in ComponentState)
      then begin
              if @Fa_OnInsertFilter <> nil then
                if not Fa_OnInsertFilter(self,C) then begin
                  C.Parent := nil;
                  exit;
                end;
              if tf_Panel.ControlCount = 0
                then LastControlBottom := 0
                else LastControlBottom := tf_Panel.Controls[tf_Panel.ControlCount-1].BoundsRect.Bottom;
              C.Parent := tf_Panel;
              if (LastControlBottom = 0) and (C is TTargetFilter_CustomFilter)
                 then begin
                        tf_Panel.SetActiveFilter(C,C);
                        SB.VertScrollBar.Increment := C.Height;
                        try
                          PrevOnListOpen := fOnListOpen;
                          fOnListOpen := nil;
                          fListOpen := true;
                          ListOpen  := false;
                        finally
                          fOnListOpen := PrevOnListOpen;
                        end;
                      end;
              C.SetBounds(0,LastControlBottom,C.Width,C.Height);
              tf_Panel.Height := C.BoundsRect.Bottom;

              if C is TTargetFilter_CustomFilter
                then begin
                       TTargetFilter_CustomFilter(C).FTargetFilter_Panel := tf_Panel;
                       TTargetFilter_CustomFilter(C).a_ServerType := a_ServerType;
                       TTargetFilter_CustomFilter(C).OnEnter := DoOnEnter;
                       TTargetFilter_CustomFilter(C).a_OnFilterChanged := DoOnFilterChanged;

                       if C is TTargetFilter_NumberFilter then begin
                         TTargetFilter_NumberFilter(C).SetDefaultAlignment;
                       end;
                     end;
              UpdateVisualState;
              //tf_Panel.SetFilterTabStop_OnlyIfActive(true);
           end
      else begin
             if C is TTargetFilter_CustomFilter
                then begin
                       TTargetFilter_CustomFilter(C).a_ServerType := a_ServerType;
                       TTargetFilter_CustomFilter(C).OnEnter := DoOnEnter;
                     end;

             if C.Parent <> nil then begin
               P := C.Parent.ClientToScreen(Point(C.Left,C.Top));
               P := self.ScreenToClient(P);
               C.SetBounds(P.X,P.Y,C.Width,C.Height);
             end;

             C.Parent := self;
           end;
  end;

procedure TTargetFilter_ScrollBox.DoOnEnter (Sender : TObject);
  begin
    if Sender = nil then exit;
    if (TWinControl(Sender).Top < SB.VertScrollBar.Position) or
       (TWinControl(Sender).BoundsRect.Bottom > SB.VertScrollBar.Position + SB.Height)
      then SB.VertScrollBar.Position := TWinControl(Sender).Top;
  end;

procedure TTargetFilter_ScrollBox.FinishCreation;
  var
    i : Integer;
  begin
    {if not (csDestroying in ComponentState)
      then SB.SetBounds(SB.Left,SB.Top,Width - 160,Height - 7);}

    {if TB.Images <> nil then exit;
    for i := 0 to TB.ComponentCount - 1 do
      if TB.Components[i] is TToolButton then
        TToolButton(TB.Components[i]).Parent := TB;
    if TB.Images = nil then TB.Images := fImages;}
    if acList.Images <> nil then exit;
    acList.Images := fImages;

    if not (csDesigning in ComponentState) then begin
      for i := 0 to ControlCount -1 do
        if (Controls[i] is TTargetFilter_CustomFilter)
          then begin
                 Controls[i].SetBounds(Controls[i].Left-tf_Panel.Left - Sb.Left,
                                       Controls[i].Top -tf_Panel.Top  - Sb.Top,
                                       Controls[i].Width,Controls[i].Height);
                 Controls[i].Parent := tf_Panel;
               end;
    end;
  end;

procedure TTargetFilter_ScrollBox.Loaded;
  begin
    inherited;
    FinishCreation;
  end;

procedure TTargetFilter_ScrollBox.Seta_FilterMemo(const Value: TMemo);
  begin
    tf_Panel.a_FilterMemo := Value;
  end;

function TTargetFilter_ScrollBox.Geta_FilterMemo: TMemo;
  begin
    Result := tf_Panel.a_FilterMemo;
  end;


procedure TTargetFilter_ScrollBox.SetParent(AParent: TWinControl);
  var
    PF : TCustomForm;
  begin
    inherited;
    if [csDesigning,csDestroying] * ComponentState = [] then begin
      if AParent = nil
        then PF := nil
        else PF := GetParentForm(AParent);
      if PF <> acList.Owner then begin
        if acList.Owner <> nil then acList.Owner.RemoveComponent(acList);
        if PF <> nil
          then PF.InsertComponent(acList)
      end;
    end;
    FinishCreation;
  end;

procedure TTargetFilter_ScrollBox.SetListOpen(const Value: boolean);
  var
    i,j : integer;
    C  : TTargetFilter_CustomFilter;
    Cb : TTargetFilter_ComboBox;
    cc : TWinControl;
    h : integer;
  begin
    if FListOpen = Value then exit;
    try
      FListOpen := Value;
      //SB.VertScrollBar.Visible := FListOpen;
      if Assigned(fOnListOpen) then fOnListOpen(self,true,Value);

      if tf_Panel.ControlCount = 0
        then h := Height
        else if ListOpen
               then begin
                      if Parent <> nil
                        then h := Parent.ClientHeight - top//tf_Panel.Controls[tf_Panel.ControlCount-1].BoundsRect.Bottom + 7
                        else h := tf_Panel.Controls[tf_Panel.ControlCount-1].BoundsRect.Bottom + 7;
                    end
               else h := tf_Panel.ActiveFilter.Height+7;
      if Parent <> nil then
        h := Min(h,Parent.ClientHeight - top);

      Height := Max(Constraints.MinHeight,h);
      //SB.SetBounds(SB.Left,SB.Top,SB.Width,Height);
      //bbShowList.Down := ListOpen;
      bbShowList.Glyph := nil;
      if ListOpen
        then begin
               acShowList.ImageIndex := 2;
               fImages.GetBitmap(2,bbShowList.Glyph);
               acShowList.Hint := 'Закрыть список фильтров';
               tf_Panel.a_TabStop := true;
               if (tf_Panel.ActiveFilter <> nil) then
                  if (tf_Panel.ActiveFilter is TTargetFilter_CustomFilter)
                    then TTargetFilter_CustomFilter(tf_Panel.ActiveFilter).FocusFilter(false)
                    else tf_Panel.ActiveFilter.SetFocus;
             end
        else begin
               acShowList.ImageIndex := 1;
               fImages.GetBitmap(1,bbShowList.Glyph);
               acShowList.Hint := 'Открыть список фильтров';
               //tf_Panel.SetFilterTabStop_OnlyIfActive(true);
               DoOnEnter(tf_Panel.ActiveFilter);
             end;
       tf_Panel.SetEnableOnlyActiveFilter(nil,not ListOpen);
    finally
      if Assigned(fOnListOpen) then fOnListOpen(self,false,Value);
    end;
    if filterChanged then DoOnFilterChanged(nil);
  end;

function TTargetFilter_ScrollBox.GetFilter: string;
  begin
    Result := tf_Panel.Filter;
  end;

function TTargetFilter_ScrollBox.GetDatasetFilter: string;
  begin
    Result := tf_Panel.DatasetFilter;
  end;


procedure TTargetFilter_ScrollBox.Seta_ServerType(const Value: TTargetFilter_ServerType);
  begin
    Fa_ServerType := Value;
  end;

procedure TTargetFilter_ScrollBox.SetEnabled(Value : boolean);
var
  i,j : integer;
begin
  inherited;
  SB.Enabled := Value;
  for i := 0 to SB.ControlCount-1 do
    SB.Controls[i].Enabled := Value;
  for i := 0 to ControlCount-1 do
    Controls[i].Enabled := Value;
end;

procedure TTargetFilter_ScrollBox.DoOnSetNewFilter(Sender: TTargetFilter_Panel; Filter: TWinControl);
  begin
    InsertFilter(Filter);
  end;

function TTargetFilter_ScrollBox.GetPanelAutosize: boolean;
  begin
    Result := tf_Panel.AutoSize
  end;

procedure TTargetFilter_ScrollBox.SetPanelAutosize(const Value: boolean);
  begin
    {tf_Panel.AutoSize := Value;
    if tf_Panel.AutoSize
      then begin
             tf_Panel.Align := alNone;
             tf_Panel.Color := clBlue;
             tf_Panel.SetBounds(0,0,1,1);
           end
      else begin
             tf_Panel.Align := alClient;
             tf_Panel.Color := clBtnShadow;
           end;}
  end;

type
  TTarget_CustomFilter_CollectionItem = class(TCollectionItem)
                                          private
                                            fF : TTargetFilter_CustomFilter;
                                          published
                                            property F : TTargetFilter_CustomFilter read fF write fF;
                                        end;

procedure TTargetFilter_ScrollBox.StoreControlsInScrollBox(Writer: TWriter);
  var
    C : TCollection;
    i : integer;
  begin
    C := TCollection.Create(TTarget_CustomFilter_CollectionItem);
    With C do
    try
      for i := 0 to tf_Panel.ControlCount -1 do
        if (tf_Panel.Controls[i] is TTargetFilter_CustomFilter) then
          With TTarget_CustomFilter_CollectionItem(C.Add) do begin
            F := TTargetFilter_CustomFilter(tf_Panel.Controls[i]);
          end;
      Writer.WriteCollection(C);
    finally
      FreeAndNil(C);
    end;
  end;

procedure TTargetFilter_ScrollBox.LoadControlsInScrollBox(Reader: TReader);
  var
    C : TCollection;
    i : integer;
  begin
    C := TCollection.Create(TTarget_CustomFilter_CollectionItem);
    With C do
    try
      Reader.ReadValue;
      Reader.ReadCollection(C);
      for i := 0 to C.Count-1 do
        InsertFilter(TtargetFilter_CustomFilter(C.Items[i]))
    finally
      FreeAndNil(C);
    end;
  end;

procedure TTargetFilter_ScrollBox.DefineProperties(Filer: TFiler);

  function DoWrite: Boolean;
  begin
    //Заглушка
    result := true;
    (*if Filer.Ancestor <> nil then { check Ancestor for an inherited value }
    begin
      if TTargetFilter_ScrollBox(Filer.Ancestor).MyControlsInScrollBox = nil then
        Result := MyControlsInScrollBox <> nil
      else if MyControlsInScrollBox = nil or
         TSampleComponent(Filer.Ancestor).MyControlsInScrollBox.Name <> MyControlsInScrollBox.Name then
        Result := True

      else Result := False;
    end
    else { no inherited value -- check for default (nil) value }
      Result := MyControlsInScrollBox <> nil;*)
  end;
begin
  inherited; { allow base classes to define properties }
  //Filer.DefineProperty('ControlsInFilterPanel', LoadControlsInScrollBox, StoreControlsInScrollBox, DoWrite);
end;

destructor TTargetFilter_ScrollBox.Destroy;

  procedure ClearActionComponents;
    var
      i : integer;
    begin
      for i := 0 to acList.ActionCount - 1 do
        With acList.Actions[i] do
          if Assigned(ActionComponent) then begin
            ActionComponent.RemoveFreeNotification(acList.Actions[i]);
            ActionComponent := nil;
          end;
    end;

begin
  ClearActionComponents;
  inherited;
end;

procedure TTargetFilter_ScrollBox.TTargetFilter_ScrollBox_LoadFilterValue(Sender: TObject);
  begin

  end;

procedure TTargetFilter_ScrollBox.acLoadFilterValue_Execute(Sender: TObject);
  var
    V : Variant;
    F : TCustomForm;

  var
    TName,SFName,Fname : string;
    FilterOk : boolean;
    i : integer;
    PrevActiveControl : TWinControl;
    CFToSetDefaultConditionTypeIfNone : TTargetFilter_CustomFilter;
    ValueLoaded : boolean;
  begin
    FilterOk := true;
    CFToSetDefaultConditionTypeIfNone := nil;
    if Assigned(FOnNeedActivateFilter) then begin
      F := GetParentForm(self);
      PrevActiveControl := F.ActiveControl;
      TName  := '';
      SFName := '';
      Fname  := '';
      if (F <> nil) and not targetFilter_Utils.HasParent(PrevActiveControl,self) then begin
        FilterOk := false;
        if FOnNeedActivateFilter(self,TName,SFName,Fname) then begin
          TName  := AnsiLowerCase(TName);
          SFName := AnsiLowerCase(SFName);
          FName  := AnsiLowerCase(FName);

          for i := 0 to tf_Panel.FilterCount - 1 do
            if tf_Panel.FilterControl[i] is TTargetFilter_CustomFilter then
              With TTargetFilter_CustomFilter(tf_Panel.FilterControl[i]) do
                begin
                  FilterOk := ((TName = '') or (TName <> '') and (a_a_TableName <> '') and (AnsiLowerCase(a_a_TableName) = Tname))
                              and
                              ((SFName = '') or (SFName <> '') and (a_b_ServerFieldName <> '') and (AnsiLowerCase(a_b_ServerFieldName) = SFname))
                              and
                              ((FName = '') or (FName <> '') and (a_b_FieldName <> '') and (AnsiLowerCase(a_b_FieldName) = Fname));
                  if FilterOk then begin
                    FocusFilter(false);
                    CFToSetDefaultConditionTypeIfNone := TTargetFilter_CustomFilter(tf_Panel.FilterControl[i]);
                    F.ActiveControl := PrevActiveControl;
                    break;
                  end;
                end;
        end;
      end;
    end;

    if not FilterOk then exit;


    ValueLoaded := assigned(fOnLoadFilterValue) and fOnLoadFilterValue(self,tf_Panel.ActiveFilter,V);

    if CFToSetDefaultConditionTypeIfNone <> nil
      then CFToSetDefaultConditionTypeIfNone.SetDefaultConditionTypeIfNone;

    if ValueLoaded
      then begin
        if tf_Panel.ActiveFilter is TTargetFilter_CustomFilter then
          TTargetFilter_CustomFilter(tf_Panel.ActiveFilter).LoadValue(V);
      end;


    if not FilterApplied then begin
      acApplyUpdate(acApply);
      if acApply.Enabled then acApplyExecute(acApply);
    end;
  end;

procedure TTargetFilter_ScrollBox.acLoadFilterValue_Update(Sender: TObject);
  var
    lEnabled : boolean;
  begin
    lEnabled := Enabled and assigned(fOnLoadFilterValue)
                        and (tf_Panel.ActiveFilter <> nil)
                        and Visible;
    if not lEnabled
      then Taction(Sender).Enabled := false
      else if Assigned(fOnLoadFilterActionUpdate) then fOnLoadFilterActionUpdate(self,TAction(Sender));
  end;

procedure TTargetFilter_ScrollBox.acApplyExecute(Sender: TObject);
  var
    PrevFocused : boolean;
  begin
    PrevFocused := bbApply.Focused;
    FilterApplied := not FilterApplied;
    acApplyUpdate(acApply);
    if PrevFocused and not bbApply.Focused
      then if bbShowList.CanFocus then bbShowList.SetFocus;
  end;

procedure TTargetFilter_ScrollBox.acApplyUpdate(Sender: TObject);
  var
    a_enabled : boolean;
  begin
    a_enabled := (tf_Panel.ControlCount > 0) and Enabled and not ListOpen and
                 ((FilterApplied) or (Filter <> ''));
    if a_enabled then
      if Assigned(fa_OnUpdateApplyFilter) then a_enabled := fa_OnUpdateApplyFilter(self);
    TAction(Sender).Enabled := a_enabled;
    bbApply.Enabled := TAction(Sender).Enabled;
  end;

procedure TTargetFilter_ScrollBox.SetFilterApplied(const Value: boolean);
  begin
   if FFilterApplied = Value then exit;
   FFilterApplied := Value;
   bbApply.Glyph := nil;
   if Value
     then fImages.GetBitMap(5,bbApply.Glyph)
     else fImages.GetBitMap(0,bbApply.Glyph);
   //
   //bbApply.Down := Value;
   filterChanged := true;
   if not ListOpen and Assigned(fa_OnApplyFilter)
     then begin
              FilterChanged := false;
              fa_OnApplyFilter(self,Value);
            end;
  end;

procedure TTargetFilter_ScrollBox.DoOnFilterChanged(Sender: TtargetFilter_CustomFilter);
  begin
    filterChanged := true;
    if FFilterApplied and not ListOpen then
      if Assigned(fa_OnApplyFilter)
       then begin
              FilterChanged := false;
              fa_OnApplyFilter(self,true);
            end;
  end;

procedure TTargetFilter_ScrollBox.ScrollPosChanged;
  var
    i : integer;

    function GetEnabled(C : TWinControl) : boolean;
      begin
        Result := true;
        if C = nil then exit;
        Result := C.Enabled and C.Visible and GetEnabled(C.Parent);
      end;

  begin
    if not GetEnabled(self) then exit;

    if not ListOpen and (tf_Panel.ActiveFilter <> nil) and (SB.VertScrollBar.Position <>  tf_Panel.ActiveFilter.Top) then
       for i := 0 to tf_Panel.FilterCount - 1 do
         if SB.VertScrollBar.Position = tf_Panel.FilterControl[i].Top
           then begin
                  tf_Panel.FilterControl[i].Enabled := true;
                  tf_Panel.FilterControl[i].SetFocus;
                  tf_Panel.SetEnableOnlyActiveFilter(nil,true);
                end;
  end;

{ T_ScrollBox }

procedure T_ScrollBox.WndProc(var Message: TMessage);
  begin
    inherited;
    if Message.Msg = WM_VSCROLL then begin
      TTargetFilter_ScrollBox(Parent).ScrollPosChanged;
    end;
  end;

procedure TTargetFilter_ScrollBox.ForceListClose;
  begin
    FListOpen := true;
    ListOpen  := false;
  end;

function TTargetFilter_ScrollBox.GetTabControl(Index: integer): TWinControl;
  begin
    case Index of
     0..3 : Result := BitBtn[index];
        4 : Result := OrAnd;
       else Result := nil;
    end;
  end;

function TTargetFilter_ScrollBox.GetTabControlCount: integer;
  begin
    Result := 5;
  end;

procedure TTargetFilter_ScrollBox.DoEnter;
  begin
    inherited;
    PrevFilterStr := tf_Panel.Filter;
  end;

procedure TTargetFilter_ScrollBox.DoExit;
  begin
    inherited;
    if (a_AutoApplyOnExit) and (tf_Panel.Filter <> PrevFilterStr)
      then FilterApplied := true;
  end;

procedure TTargetFilter_ScrollBox.Seta_AutoApplyOnExit(const Value: boolean);
  begin
    Fa_AutoApplyOnExit := Value;
  end;

procedure TTargetFilter_ScrollBox.SetDisableShortCuts(const Value: boolean);

  procedure DoDisableShortCut(A : array of tAction);
    var
      i  : integer;
    begin
      for i := low(A) to high(A) do begin
        A[i].ShortCut := 0;
        A[i].SecondaryShortCuts.Clear;
      end;
    end;

  procedure DoSetShortCut(A : tAction;
                          ShC : TShortCut; secShC : string);
    begin
      A.ShortCut  := ShC;
      A.SecondaryShortCuts.Clear;
      if SecShC <> '' then A.SecondaryShortCuts.Add(secShC);
    end;

  begin
    FDisableShortCuts := Value;
    if Value
      then begin
             DoDisableShortCut([acShowList,acLoadFilterValue,acApply,acTurnOff]);
           end
      else begin
             DoSetShortCut(acShowList,       menus.ShortCut(word('J')  ,[ssCtrl]),'Ctrl+О');
             DoSetShortCut(acLoadFilterValue,menus.ShortCut(word('G')  ,[ssCtrl]),'Ctrl+П');
             DoSetShortCut(acApply          ,menus.ShortCut(word('A')  ,[ssCtrl]),'Ctrl+Ф');
             DoSetShortCut(acTurnOff        ,menus.ShortCut(vk_Subtract,[ssCtrl]),'');
             DoSetShortCut(acNext           ,menus.ShortCut(vk_Next    ,[ssAlt]),'');
             DoSetShortCut(acPrev           ,menus.ShortCut(vk_Prior   ,[ssAlt]),'');
           end;
  end;

procedure TTargetFilter_ScrollBox.acGotoFilterExecute(Sender: TObject);
  begin
    tf_Panel.GetNextFilter(TAction(Sender).Tag = 1);
  end;

procedure TTargetFilter_ScrollBox.acGotoFilterUpdate(Sender: TObject);
  begin
    TAction(Sender).Enabled := Enabled;
  end;

end.
