inherited CFLMLKSelectDlg: TCFLMLKSelectDlg
  Left = 970
  Top = 83
  Width = 545
  Height = 340
  ActiveControl = DBGrid
  Caption = 'CFLMLKSelectDlg'
  Position = poMainFormCenter
  OnClose = FormClose
  DesignSize = (
    529
    301)
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl [0]
    Left = 1
    Top = 0
    Width = 535
    Height = 254
    ActivePage = TabSheet1
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1057#1087#1080#1089#1086#1082
      object Splitter: TSplitter
        Left = 305
        Top = 0
        Height = 226
        Align = alRight
        Visible = False
      end
      object PanelGrid: TPanel
        Left = 0
        Top = 0
        Width = 305
        Height = 226
        Align = alClient
        Caption = 'PanelGrid'
        TabOrder = 0
        object DBGrid: TcitDBGrid
          Left = 1
          Top = 23
          Width = 303
          Height = 202
          MarkDisabled = False
          MarkColor = clAqua
          MarkFont.Charset = DEFAULT_CHARSET
          MarkFont.Color = clNavy
          MarkFont.Height = -11
          MarkFont.Name = 'MS Sans Serif'
          MarkFont.Style = []
          LightedFont.Charset = DEFAULT_CHARSET
          LightedFont.Color = clNavy
          LightedFont.Height = -11
          LightedFont.Name = 'MS Sans Serif'
          LightedFont.Style = [fsBold]
          LightedColor = clWindow
          DisabledFont.Charset = DEFAULT_CHARSET
          DisabledFont.Color = clSilver
          DisabledFont.Height = -11
          DisabledFont.Name = 'MS Sans Serif'
          DisabledFont.Style = []
          DisabledColor = clWindow
          OnIsLighted = DBGridIsLighted
          MultiPress = False
          EnableTitlePress = True
          MarkShortCut = 115
          SaveOnClose = False
          PropStorage = ComponentProps
          OnReleaseGroup = DBGridReleaseGroup
          TitleGlyph.Data = {
            36010000424D360100000000000076000000280000001C0000000C0000000100
            040000000000C000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0088FFFFFFFFFF
            88888880F888888800007088888888F8888888088F8888880000870888888F88
            8888808888F88888000088708888F88888880888888F888800008887088F8888
            888088888888F8880000888870F888888808888888888F880000888887888888
            8877777777777788000088888888888888888888888888880000888888888888
            8888888888888888000088888888888888888888888888880000888888888888
            8888888888888888000088888888888888888888888888880000}
          SQLBuilder = SQLBuilder
          TitleHeight = 17
          TitleColor = clBtnFace
          Align = alClient
          Ctl3D = False
          DataSource = DS
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = DBGridDblClick
          OnKeyDown = DBGridKeyDown
          OnKeyPress = DBGridKeyPress
        end
        object ToolBar: TToolBar
          Left = 1
          Top = 1
          Width = 303
          Height = 22
          AutoSize = True
          Caption = 'ToolBar'
          Ctl3D = False
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          Images = dmDataModule.ImageListToolBar
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          object ToolButtonRefresh: TToolButton
            Left = 0
            Top = 0
            Action = ActionViewRefresh
          end
          object ToolButtonLayout: TToolButton
            Left = 23
            Top = 0
            Action = ActionViewLayout
          end
          object ToolButton6: TToolButton
            Left = 46
            Top = 0
            Action = ActionCopyProfile
          end
          object ToolButton5: TToolButton
            Left = 69
            Top = 0
            Width = 8
            Caption = 'ToolButton5'
            ImageIndex = 26
            Style = tbsSeparator
          end
          object btnViewSql: TToolButton
            Left = 77
            Top = 0
            Action = ActionViewBuilderSQL
          end
          object ToolButton1: TToolButton
            Left = 100
            Top = 0
            Action = ActionViewDataSetSQL
          end
          object ToolButton2: TToolButton
            Left = 123
            Top = 0
            Action = ActionViewSelectedSQL
          end
        end
      end
      object PanelSelect: TPanel
        Left = 308
        Top = 0
        Width = 219
        Height = 226
        Align = alRight
        Caption = 'PanelSelect'
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        Visible = False
        object DBGridSelection: TcitDBGrid
          Left = 1
          Top = 23
          Width = 217
          Height = 202
          MarkDisabled = False
          MarkColor = clAqua
          MarkFont.Charset = DEFAULT_CHARSET
          MarkFont.Color = clNavy
          MarkFont.Height = -11
          MarkFont.Name = 'MS Sans Serif'
          MarkFont.Style = []
          LightedFont.Charset = DEFAULT_CHARSET
          LightedFont.Color = clMaroon
          LightedFont.Height = -11
          LightedFont.Name = 'MS Sans Serif'
          LightedFont.Style = []
          LightedColor = clWindow
          DisabledFont.Charset = DEFAULT_CHARSET
          DisabledFont.Color = clSilver
          DisabledFont.Height = -11
          DisabledFont.Name = 'MS Sans Serif'
          DisabledFont.Style = []
          DisabledColor = clWindow
          OnGetKey = DBGridSelectionGetKey
          MultiPress = True
          EnableTitlePress = True
          MarkShortCut = 116
          SaveOnClose = False
          TitleGlyph.Data = {
            36010000424D360100000000000076000000280000001C0000000C0000000100
            040000000000C000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0088FFFFFFFFFF
            88888880F888888800007088888888F8888888088F8888880000870888888F88
            8888808888F88888000088708888F88888880888888F888800008887088F8888
            888088888888F8880000888870F888888808888888888F880000888887888888
            8877777777777788000088888888888888888888888888880000888888888888
            8888888888888888000088888888888888888888888888880000888888888888
            8888888888888888000088888888888888888888888888880000}
          TitleHeight = 15
          TitleColor = clBtnFace
          Align = alClient
          Color = 16776176
          Ctl3D = False
          DataSource = DSSelection
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
        object ToolBar1: TToolBar
          Left = 1
          Top = 1
          Width = 217
          Height = 22
          AutoSize = True
          Caption = 'ToolBar'
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          Images = dmDataModule.ImageListToolBar
          Indent = 3
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          object ToolButton8: TToolButton
            Left = 3
            Top = 0
            Action = ActionMark
          end
          object ToolButton11: TToolButton
            Left = 26
            Top = 0
            Action = ActionUnMark
          end
          object ToolButton10: TToolButton
            Left = 49
            Top = 0
            Width = 8
            Caption = 'ToolButton7'
            ImageIndex = 20
            Style = tbsSeparator
          end
          object ToolButton9: TToolButton
            Left = 57
            Top = 0
            Action = ActionMarkAll
          end
          object ToolButton12: TToolButton
            Left = 80
            Top = 0
            Action = ActionUnMarkAll
          end
          object ToolButton4: TToolButton
            Left = 103
            Top = 0
            Width = 8
            Caption = 'ToolButton4'
            ImageIndex = 37
            Style = tbsSeparator
          end
          object ToolButton3: TToolButton
            Left = 111
            Top = 0
            Action = ActionRefreshSelected
          end
        end
      end
    end
  end
  object ButtonSelect: TButton [1]
    Left = 462
    Top = 257
    Width = 75
    Height = 25
    Action = ActionFormSelect
    Anchors = [akRight, akBottom]
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object ButtonCancel: TButton [2]
    Left = 462
    Top = 285
    Width = 75
    Height = 25
    Action = ActionFormCancel
    Anchors = [akRight, akBottom]
    Cancel = True
    ModalResult = 2
    TabOrder = 2
  end
  object FilterPanel: TTargetFilter_Panel [3]
    Left = 1
    Top = 256
    Width = 456
    Height = 54
    Anchors = [akLeft, akRight, akBottom]
    BevelOuter = bvLowered
    TabOrder = 3
    a_OrAnd_AutoColors = False
  end
  inherited ActionList: TActionList
    Left = 244
    Top = 96
    object ActionViewRefresh: TAction
      Category = 'View'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1083#1103#1077#1090' '#1080' '#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1085#1072' '#1101#1082#1088#1072#1085#1077
      ImageIndex = 3
      ShortCut = 116
      OnExecute = ActionViewRefreshExecute
    end
    object ActionViewLayout: TAction
      Category = 'View'
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072
      Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1074#1085#1077#1096#1085#1077#1075#1086' '#1074#1080#1076#1072' '#1101#1082#1088#1072#1085#1072
      ImageIndex = 4
      ShortCut = 118
      OnExecute = ActionViewLayoutExecute
    end
    object ActionGridFirst: TAction
      Category = 'Grid'
      Caption = #1055#1077#1088#1074#1099#1081
      Hint = #1055#1077#1088#1077#1093#1086#1076' '#1085#1072' '#1087#1077#1088#1074#1091#1102' '#1089#1090#1088#1086#1082#1091' '#1074' '#1089#1087#1080#1089#1082#1077
      ImageIndex = 2
      OnExecute = ActionGridFirstExecute
    end
    object ActionGridPrior: TAction
      Category = 'Grid'
      Caption = #1055#1088#1077#1076#1099#1076#1091#1097#1080#1081
      Hint = #1055#1077#1088#1077#1093#1086#1076' '#1085#1072' '#1087#1088#1077#1076#1099#1076#1091#1097#1091#1102' '#1089#1090#1088#1086#1082#1091' '#1074' '#1089#1087#1080#1089#1082#1077
      ImageIndex = 3
      OnExecute = ActionGridPriorExecute
    end
    object ActionGridNext: TAction
      Category = 'Grid'
      Caption = #1057#1083#1077#1076#1091#1102#1097#1080#1081
      Hint = #1055#1077#1088#1077#1093#1086#1076' '#1085#1072' '#1089#1083#1077#1076#1091#1102#1097#1091#1102' '#1089#1090#1088#1086#1082#1091' '#1074' '#1089#1087#1080#1089#1082#1077
      ImageIndex = 4
      OnExecute = ActionGridNextExecute
    end
    object ActionGridLast: TAction
      Category = 'Grid'
      Caption = #1055#1086#1089#1083#1077#1076#1085#1080#1081
      Hint = #1055#1077#1088#1077#1093#1086#1076' '#1085#1072' '#1087#1086#1089#1083#1077#1076#1085#1102#1102' '#1089#1090#1088#1086#1082#1091' '#1074' '#1089#1087#1080#1089#1082#1077
      ImageIndex = 5
      OnExecute = ActionGridLastExecute
    end
    object ActionFormSelect: TAction
      Category = 'Form'
      Caption = #1042#1099#1073#1086#1088
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1086#1090#1084#1077#1095#1077#1085#1085#1091#1102' '#1089#1090#1088#1086#1082#1091
      OnExecute = ActionFormSelectExecute
    end
    object ActionFormCancel: TAction
      Category = 'Form'
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1047#1072#1082#1088#1099#1090#1080#1077' '#1092#1086#1088#1084#1099' '#1073#1077#1079' '#1074#1099#1073#1086#1088#1072
      OnExecute = ActionFormCancelExecute
    end
    object ActionItemAdd: TAction
      Category = 'Item'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Enabled = False
      Hint = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 0
      ShortCut = 45
    end
    object ActionItemProp: TAction
      Category = 'Item'
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Enabled = False
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1080#1083#1080' '#1080#1079#1084#1077#1085#1077#1085#1080#1077' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 1
      ShortCut = 113
    end
    object ActionItemDel: TAction
      Category = 'Item'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Enabled = False
      Hint = #1059#1076#1072#1083#1077#1085#1080#1077' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 2
      ShortCut = 16430
    end
    object ActionViewSelectedSQL: TAction
      Caption = 'ActionViewSelectedSQL'
      ImageIndex = 25
      ShortCut = 49239
    end
    object ActionMark: TAction
      Category = 'Item'
      Caption = #1055#1086#1084#1077#1090#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      Hint = #1055#1086#1084#1077#1090#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 36
      ShortCut = 115
      OnExecute = ActionMarkExecute
    end
    object ActionUnMark: TAction
      Category = 'Item'
      Caption = #1057#1085#1103#1090#1100' '#1087#1086#1084#1077#1090#1082#1091' '#1079#1072#1087#1080#1089#1080
      Hint = #1057#1085#1103#1090#1100' '#1087#1086#1084#1077#1090#1082#1091' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 34
      ShortCut = 114
      OnExecute = ActionUnMarkExecute
    end
    object ActionViewBuilderSQL: TAction
      Caption = 'ActionViewBuilderSQL'
      Hint = 'Builder'
      ImageIndex = 20
      ShortCut = 24644
    end
    object ActionCopyProfile: TAction
      Category = 'View'
      Caption = 'ActionCopyProfile'
      Hint = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      ImageIndex = 19
      OnExecute = ActionCopyProfileExecute
    end
    object ActionUnMarkAll: TAction
      Category = 'Item'
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1074#1089#1077
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1074#1089#1077
      ImageIndex = 35
      ShortCut = 16450
      OnExecute = ActionUnMarkAllExecute
    end
    object ActionMarkAll: TAction
      Category = 'Item'
      Caption = #1055#1086#1084#1077#1090#1080#1090#1100' '#1074#1089#1077
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1089#1077
      ImageIndex = 33
      ShortCut = 16449
      OnExecute = ActionMarkAllExecute
    end
    object ActionViewDataSetSQL: TAction
      Caption = 'ActionViewDataSetSQL'
      Hint = 'DataSet Query'
      ImageIndex = 13
    end
    object ActionRefreshSelected: TAction
      Category = 'View'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 3
      OnExecute = ActionRefreshSelectedExecute
    end
  end
  object ComponentProps: TcitComponentProps
    RootKey = 2147483649
    HandleCloseQuery = True
    Enabled = True
    LoadOnlySelected = False
    DefaultUser = 'DEFAULT_USER'
    Query = QueryProp
    TableName = 'dbo.PROFILE'
    StorageType = sDatabase
    FormParams = [fpPos]
    RestoreOnly = False
    RestoreOnlyDefault = False
    Left = 40
    Top = 152
  end
  object DS: TDataSource
    DataSet = Query
    Left = 124
    Top = 148
  end
  object SQLBuilder: TTargetSQLBuilder
    OnGetWhere = SQLBuilderGetWhere
    OnGetOrderBy = SQLBuilderGetOrderBy
    FilterPanel = FilterPanel
    Query = Query
    UseParams = True
    KeyFields.Strings = (
      'ID')
    AutoLocate = False
    Left = 70
    Top = 125
  end
  object Query: TMSQuery
    Connection = dmDataModule.DB
    AfterOpen = QueryAfterOpen
    AfterScroll = QueryAfterScroll
    AfterRefresh = QueryAfterRefresh
    Left = 95
    Top = 148
  end
  object QueryProp: TMSQuery
    Connection = dmDataModule.DB
    Left = 39
    Top = 124
  end
  object DSSelection: TDataSource
    DataSet = QuSelectList
    Left = 472
    Top = 105
  end
  object QuSelectList: TMSQuery
    Connection = dmDataModule.DB
    AfterOpen = QuSelectListAfterOpen
    Left = 442
    Top = 105
  end
  object spCopyProfile: TMSStoredProc
    StoredProcName = 'sp_Copy_Profile'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_Copy_Profile (:p_owner_from, :p_owner_t' +
        'o, :p_section)}')
    Left = 472
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'p_owner_from'
        ParamType = ptInput
        Size = 32
      end
      item
        DataType = ftString
        Name = 'p_owner_to'
        ParamType = ptInput
        Size = 32
      end
      item
        DataType = ftString
        Name = 'p_section'
        ParamType = ptInput
        Size = 128
      end>
  end
end
