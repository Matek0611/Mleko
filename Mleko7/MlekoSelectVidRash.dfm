inherited MlekoSelectVidRashDlg: TMlekoSelectVidRashDlg
  Left = 1124
  Width = 556
  Height = 394
  Caption = #1042#1099#1073#1086#1088' '#1089#1090#1072#1090#1100#1080' '#1088#1072#1089#1093#1086#1076#1072
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Top = 7
    Width = 544
    Height = 291
    inherited TabSheet1: TTabSheet
      inherited Splitter: TSplitter
        Left = 314
        Height = 263
      end
      inherited PanelGrid: TPanel
        Width = 314
        Height = 263
        inherited DBGrid: TcitDBGrid
          Width = 312
          Height = 239
        end
        inherited ToolBar: TToolBar
          Width = 312
        end
      end
      inherited PanelSelect: TPanel
        Left = 317
        Height = 263
        inherited DBGridSelection: TcitDBGrid
          Height = 239
        end
      end
    end
  end
  inherited ButtonSelect: TButton
    Left = 459
    Top = 306
  end
  inherited ButtonCancel: TButton
    Left = 459
    Top = 338
  end
  inherited FilterPanel: TTargetFilter_Panel
    Left = 2
    Top = 303
    Width = 437
    Height = 62
    a_OrAnd = oaOr
    object TargetFilter_StringFilter1: TTargetFilter_StringFilter
      Left = 1
      Top = 1
      Width = 435
      Height = 31
      Align = alTop
      Constraints.MaxHeight = 31
      Constraints.MinHeight = 31
      Constraints.MinWidth = 153
      ParentColor = True
      TabOrder = 0
      a_Disable_ConditionType_Combo = True
      a_a_TableName = 'a'
      a_b_FieldName = 'VidRashodName'
      a_b_ServerFieldName = 'VidRashodName'
      a_Label = #1057#1090#1072#1090#1100#1103
      a_LabelWidth = 60
      a_ComboWidth = 0
      a_ShortCut = 16433
      a_ParamNames.Strings = (
        'FilterName_param_0')
      a_ServerType = tfst_MS_SQL
      a_ConditionType = sctLike
      a_OnBeforeGetString = FilterNamea_OnBeforeGetString
      DesignSize = (
        435
        31)
    end
    object ftOtdel: TcitDBComboEdit
      Left = 100
      Top = 36
      Width = 309
      Height = 21
      Enabled = True
      OwnesLButton = True
      OwnesLLabel = True
      LBtnAlignment = baRight
      LBtnDown = False
      LBtnGroupIndex = 0
      LBtnAllowAllUp = False
      LBtnGlyphKind = gkDots
      LBtnShortCut1 = 115
      LBtnShortCut2 = 40
      LBtnWidth = 25
      LLblAlignment = laLeft
      LLblCaption = #1043#1088#1091#1087#1087#1072' '#1089#1090#1072#1090#1077#1081
      LLblWidth = 80
      LLblFont.Charset = DEFAULT_CHARSET
      LLblFont.Color = clWindowText
      LLblFont.Height = -11
      LLblFont.Name = 'MS Sans Serif'
      LLblFont.Style = []
      LLblRequiredFont.Charset = DEFAULT_CHARSET
      LLblRequiredFont.Color = clWindowText
      LLblRequiredFont.Height = -11
      LLblRequiredFont.Name = 'MS Sans Serif'
      LLblRequiredFont.Style = [fsBold]
      Required = False
      TabOrder = 1
      Visible = True
      DataSet = quRashGroup
      LocateKey = False
      KeyField = 'id'
      TextField = 'Name'
      OnSelectOk = ftOtdelSelectOk
      EditStyle = edCombo
      AutoTabControl = False
    end
  end
  inherited SQLBuilder: TTargetSQLBuilder
    Select.Strings = (
      '*')
    From.Strings = (
      'v_select_vidrash a')
    Where.Strings = (
      ' (a.Group_id= :P_GROUP_ID or :P_SHOW_ALL = -1)')
    OrderBy.Strings = (
      ' a.Group_Name,a.VidRashodName')
    OnGetParams = SQLBuilderGetParams
    Left = 364
    Top = 78
  end
  inherited Query: TMSQuery
    SQL.Strings = (
      'select * from v_postList')
  end
  object DSOtdels: TDataSource
    DataSet = quOtdels
    Left = 392
    Top = 215
  end
  object quOtdels: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from vidotdel')
    AfterOpen = QueryAfterOpen
    AfterScroll = QueryAfterScroll
    AfterRefresh = QueryAfterRefresh
    Left = 423
    Top = 218
  end
  object quRashGroup: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      'from d_vidrash_Group')
    
    Left = 352
    Top = 336
    object quRashGroupid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object quRashGroupname: TStringField
      DisplayWidth = 50
      FieldName = 'name'
      Size = 256
    end
  end
end
