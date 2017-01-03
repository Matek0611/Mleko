inherited MlekoClosePlatRForm: TMlekoClosePlatRForm
  Left = 275
  Top = 163
  Width = 1337
  Height = 844
  Caption = #1046#1091#1088#1085#1072#1083' '#1056#1072#1089#1093#1086#1076#1086#1074
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter [0]
    Left = 900
    Top = 132
    Width = 4
    Height = 654
    Align = alRight
  end
  inherited StatusBar: TStatusBar
    Top = 786
    Width = 1321
    Panels = <
      item
        Text = #1055#1086#1084#1077#1095#1077#1085#1085#1072#1103' '#1089#1091#1084#1084#1072' '#1082' '#1079#1072#1082#1088#1099#1090#1080#1102':'
        Width = 180
      end
      item
        Bevel = pbRaised
        Text = '0.00'
        Width = 100
      end
      item
        Width = 50
      end
      item
        Text = #1055#1086#1084#1077#1095#1077#1085#1085#1072#1103' '#1089#1091#1084#1084#1072':'
        Width = 120
      end
      item
        Bevel = pbRaised
        Text = '0.00'
        Width = 80
      end
      item
        Width = 50
      end>
  end
  inherited ToolBar: TToolBar
    Width = 1321
    object ToolButton2: TToolButton
      Left = 146
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 29
      Style = tbsSeparator
    end
    object ToolButton13: TToolButton
      Left = 154
      Top = 0
      Action = ActionCopyRow
    end
    object ToolButton6: TToolButton
      Left = 177
      Top = 0
      Action = ActionGoExcel
    end
    object ToolButton15: TToolButton
      Left = 200
      Top = 0
      Width = 7
      Caption = 'ToolButton15'
      ImageIndex = 29
      Style = tbsSeparator
    end
    object ToolButton1: TToolButton
      Left = 207
      Top = 0
      Action = ActionShowLink
      Caption = #1055#1088#1080#1074#1103#1079#1082#1072' '#1086#1087#1083#1072#1090
      Style = tbsCheck
    end
    object ToolButton19: TToolButton
      Left = 230
      Top = 0
      Action = ActionShowFreeNakl
    end
    object ToolButton10: TToolButton
      Left = 253
      Top = 0
      Width = 8
      Caption = 'ToolButton10'
      ImageIndex = 21
      Style = tbsSeparator
    end
    object ToolButton9: TToolButton
      Left = 261
      Top = 0
      Action = ActionRecalcSum
    end
    object ToolButton12: TToolButton
      Left = 284
      Top = 0
      Action = ActionRecoverDolg
    end
    object ToolButton14: TToolButton
      Left = 307
      Top = 0
      Action = ActionAutoClose
    end
    object ToolButton8: TToolButton
      Left = 330
      Top = 0
      Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1090#1072#1073#1083#1080#1094#1099' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1081' '#1074#1099#1075#1088#1091#1079#1082#1080' '#1074' '#1045#1082#1089#1077#1083#1100
      Caption = 'ToolButton8'
      ImageIndex = 9
      OnClick = ToolButton8Click
    end
    object ToolButton18: TToolButton
      Left = 353
      Top = 0
      Hint = #1057#1087#1077#1094#1074#1099#1075#1088#1091#1079#1082#1072' '#1074' '#1045#1082#1089#1077#1083#1100
      Caption = 'ToolButton18'
      ImageIndex = 21
      OnClick = ToolButton18Click
    end
    object ToolButton21: TToolButton
      Left = 376
      Top = 0
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080' '#1089#1086#1079#1076#1072#1090#1100' '#1055#1088#1080#1093#1086#1076#1099'/'#1056#1072#1089#1093#1086#1076#1099' '#1076#1077#1085#1077#1075' '
      Caption = 'ToolButton21'
      ImageIndex = 43
      OnClick = ToolButton21Click
    end
  end
  inherited PageControlTop: TPageControl
    Width = 1321
    Height = 108
    inherited TabSheet1: TTabSheet
      Caption = #1054#1089#1085#1086#1074#1085#1099#1077' '#1092#1080#1083#1100#1090#1088#1099
      TabVisible = True
      inherited FilterPanel: TTargetFilter_Panel
        Width = 1313
        Height = 80
        BevelInner = bvNone
        a_OrAnd = oaAnd
        object FilterSum: TTargetFilter_NumberFilter
          Left = 279
          Top = 15
          Width = 273
          Height = 23
          BorderWidth = 0
          Constraints.MaxHeight = 23
          Constraints.MinHeight = 23
          Constraints.MinWidth = 169
          ParentColor = True
          TabOrder = 0
          a_Disable_ConditionType_Combo = False
          a_a_TableName = 'a'
          a_b_FieldName = 'FreeSumma'
          a_b_ServerFieldName = 'FreeSumma'
          a_Label = #1057#1074' '#1089#1091#1084#1084#1072
          a_LabelWidth = 50
          a_ComboWidth = 74
          a_ShortCut = 16435
          a_ParamNames.Strings = (
            'tfSum_0'
            'tfSum_1')
          a_ServerType = tfst_MS_SQL
          a_EditAreaMinWidth = 10
          a_b_FieldName_Txt = 'FreeSumma'
        end
        object flt_Buh: TcitDBComboEdit
          Left = 558
          Top = 16
          Width = 250
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
          LLblAlignment = laTop
          LLblCaption = #1041#1091#1093#1075#1072#1083#1090' '#1092#1086#1088#1084#1072
          LLblWidth = 85
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
          KeyFieldValue = '2'
          LocateKey = False
          KeyField = 'buh'
          TextField = 'Buh_type_name'
          Owner = 'MlekoClosePlatRForm'
          EntityCode = 'D_BUH_TYPE'
          EntityName = 'BUH_TYPE'
          multiselect = True
          EditStyle = edSelect
          AutoTabControl = True
        end
        object flt_entity_type: TcitDBComboEdit
          Left = 558
          Top = 57
          Width = 250
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
          LLblAlignment = laTop
          LLblCaption = #1042#1080#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          LLblWidth = 85
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
          TabOrder = 2
          Visible = True
          KeyFieldValue = '4'
          LocateKey = False
          KeyField = 'id'
          TextField = 'name'
          Owner = 'MlekoClosePlatRForm'
          EntityCode = 'D_ENTITY_TYPE'
          EntityName = 'ENTITY_TYPE'
          SqlFilter = 'code in ('#39'NAKLP'#39','#39'NAKLR'#39','#39'PLATP'#39','#39'PLATR'#39')'
          multiselect = True
          EditStyle = edSelect
          AutoTabControl = True
        end
        object Flt_Post: TcitDBComboEdit
          Left = 0
          Top = 57
          Width = 250
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
          LLblAlignment = laTop
          LLblCaption = #1060#1080#1088#1084#1072' '#1091#1095#1077#1090#1085#1072#1103
          LLblWidth = 85
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
          TabOrder = 3
          Visible = True
          LocateKey = False
          KeyField = 'PostNo'
          Owner = 'MlekoClosePlatRForm'
          EntityCode = 'POST'
          EntityName = 'POST_FIRST'
          multiselect = True
          EditStyle = edSelect
          AutoTabControl = True
        end
        object Flt_Post_buh: TcitDBComboEdit
          Left = 280
          Top = 57
          Width = 250
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
          LLblAlignment = laTop
          LLblCaption = #1060#1080#1088#1084#1072' '#1073#1091#1093#1075#1072#1083#1090
          LLblWidth = 85
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
          TabOrder = 4
          Visible = True
          LocateKey = False
          KeyField = 'PostNo'
          Owner = 'MlekoClosePlatRForm'
          EntityCode = 'POST'
          EntityName = 'POST_BUH'
          multiselect = True
          EditStyle = edSelect
          AutoTabControl = True
        end
        object gBPeriod: TGroupBox
          Left = 0
          Top = 4
          Width = 273
          Height = 36
          Caption = #1055#1077#1088#1080#1086#1076
          TabOrder = 5
          object Label1: TLabel
            Left = 10
            Top = 18
            Width = 7
            Height = 13
            Caption = #1057
          end
          object Label2: TLabel
            Left = 141
            Top = 18
            Width = 14
            Height = 13
            Caption = #1055#1086
          end
          object EdDateBeg: TcxDateEdit
            Left = 21
            Top = 13
            Properties.ClearKey = 46
            Properties.SaveTime = False
            Properties.ShowTime = False
            Properties.WeekNumbers = True
            TabOrder = 0
            Width = 105
          end
          object EdDateEnd: TcxDateEdit
            Left = 159
            Top = 13
            Properties.ClearKey = 46
            Properties.SaveTime = False
            Properties.ShowTime = False
            Properties.WeekNumbers = True
            TabOrder = 1
            Width = 105
          end
        end
        object Button1: TButton
          Left = 848
          Top = 12
          Width = 209
          Height = 25
          Caption = #1047#1072#1076#1072#1090#1100' '#1080#1089#1082#1083#1102#1095#1072#1077#1084#1099#1077' '#1090#1080#1087#1099' '#1087#1083#1072#1090#1077#1078#1077#1081
          TabOrder = 6
          OnClick = Button1Click
        end
        object cb_isNotTypePayment: TCheckBox
          Left = 848
          Top = 56
          Width = 257
          Height = 17
          Caption = #1053#1077' '#1091#1095#1080#1090#1099#1074#1072#1090#1100' '#1080#1089#1082#1083#1102#1095#1072#1077#1084#1099#1077' '#1090#1080#1087#1099' '#1087#1083#1072#1090#1077#1078#1077#1081
          Checked = True
          State = cbChecked
          TabOrder = 7
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1092#1080#1083#1100#1090#1088#1099
      ImageIndex = 1
      object cbUncorect: TCheckBox
        Left = 565
        Top = 20
        Width = 97
        Height = 17
        Caption = #1053#1077#1082#1086#1088#1088#1077#1082#1090#1085#1099#1077
        TabOrder = 0
      end
      object cb_is_econom: TCheckBox
        Left = 565
        Top = 57
        Width = 53
        Height = 17
        AllowGrayed = True
        Caption = #1059#1095#1077#1090
        State = cbGrayed
        TabOrder = 1
      end
      object flt_Tip: TcitDBComboEdit
        Left = 280
        Top = 17
        Width = 250
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
        LLblAlignment = laTop
        LLblCaption = #1058#1080#1087' '#1087#1083#1072#1090#1077#1078#1072
        LLblWidth = 100
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
        TabOrder = 2
        Visible = True
        LocateKey = False
        KeyField = 'id'
        Owner = 'MlekoClosePlatRForm'
        EntityCode = 'D_PLAT_TYPE'
        EntityName = 'PLAT_TYPE'
        multiselect = True
        EditStyle = edSelect
        AutoTabControl = True
      end
      object flt_Otdel: TcitDBComboEdit
        Left = 0
        Top = 56
        Width = 250
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
        LLblAlignment = laTop
        LLblCaption = #1054#1090#1076#1077#1083
        LLblWidth = 100
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
        TabOrder = 3
        Visible = True
        LocateKey = False
        KeyField = 'OtdelNo'
        Owner = 'MlekoClosePlatRForm'
        EntityCode = 'VIDOTDEL'
        EntityName = 'VIDOTDEL'
        multiselect = True
        EditStyle = edSelect
        AutoTabControl = True
      end
      object flt_OurFirm: TcitDBComboEdit
        Left = 0
        Top = 17
        Width = 250
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
        LLblAlignment = laTop
        LLblCaption = #1053#1072#1096#1072' '#1092#1080#1088#1084#1072
        LLblWidth = 100
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
        TabOrder = 4
        Visible = True
        LocateKey = False
        KeyField = 'PostNo'
        TextField = 'Name'
        Owner = 'MlekoClosePlatRForm'
        EntityCode = 'POST'
        EntityName = 'OURFIRMNO'
        SqlFilter = 'PostNo in (select PostNo from d_our_firm)'
        EditStyle = edSelect
        AutoTabControl = False
      end
      object Flt_vidrash: TcitDBComboEdit
        Left = 280
        Top = 56
        Width = 250
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
        LLblAlignment = laTop
        LLblCaption = #1057#1090#1072#1090#1100#1103' '#1088#1072#1089#1093#1086#1076#1086#1074
        LLblWidth = 100
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
        TabOrder = 5
        Visible = True
        LocateKey = False
        KeyField = 'VidRashNo'
        Owner = 'MlekoClosePlatRForm'
        EntityCode = 'VIDRASHOD'
        EntityName = 'VIDRASHOD'
        multiselect = True
        EditStyle = edSelect
        AutoTabControl = True
      end
    end
  end
  inherited PanelGrid: TPanel
    Top = 132
    Width = 900
    Height = 654
    object Splitter: TSplitter [0]
      Left = 3
      Top = 516
      Width = 894
      Height = 6
      Cursor = crVSplit
      Align = alBottom
    end
    inherited DBGrid: TcitDBGrid
      Width = 894
      Height = 513
      LightedColor = 8421631
      DisabledColor = clInfoBk
      OnGetKey = DBGridGetKey
      OnIsLighted = DBGridIsLighted
      OnTestBeforeMark = DBGridTestBeforeMark
      ImageFields.Strings = (
        'image_check')
      MarkShortCut = 115
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    end
    object PanelPaymentLink: TPanel
      Left = 3
      Top = 522
      Width = 894
      Height = 129
      Align = alBottom
      BorderWidth = 2
      Caption = 'PanelGrid'
      Constraints.MinHeight = 100
      TabOrder = 1
      object ToolBarSerialNum: TToolBar
        Left = 3
        Top = 3
        Width = 888
        Height = 30
        AutoSize = True
        BorderWidth = 1
        Caption = 'ToolBarSerialNum'
        EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
        Flat = True
        Images = dmDataModule.ImageListToolBar
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object ToolBtnLinkAdd: TToolButton
          Left = 0
          Top = 0
          Action = ActionLinkAdd
        end
        object ToolBtnLinkProp: TToolButton
          Left = 23
          Top = 0
          Action = ActionLinkProp
        end
        object ToolBtnLinkDel: TToolButton
          Left = 46
          Top = 0
          Action = ActionLinkDel
        end
        object ToolButton5: TToolButton
          Left = 69
          Top = 0
          Width = 8
          Caption = 'ToolButton5'
          ImageIndex = 6
          Style = tbsSeparator
        end
        object ToolBtnLinkRefresh: TToolButton
          Left = 77
          Top = 0
          Action = ActionLinkRefresh
        end
        object ToolBtnLinkLayout: TToolButton
          Left = 100
          Top = 0
          Action = ActionLinkLayout
        end
        object ToolButton7: TToolButton
          Left = 123
          Top = 0
          Action = GoExelLink
        end
      end
      object DBGridPaymentLink: TcitDBGrid
        Left = 3
        Top = 33
        Width = 888
        Height = 93
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
        OnGetKey = DBGridPaymentLinkGetKey
        MultiPress = True
        EnableTitlePress = True
        MarkShortCut = 115
        SaveOnClose = False
        PropStorage = CompPropsLink
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
        SQLBuilder = SQLBuilderLink
        TitleHeight = 17
        TitleColor = clBtnFace
        Align = alClient
        DataSource = dsLink
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = PopupMenuLinkGrid
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
  end
  object PanelFreeNakl: TPanel [5]
    Left = 904
    Top = 132
    Width = 417
    Height = 654
    Align = alRight
    BorderWidth = 2
    Caption = 'PanelGrid'
    Constraints.MinHeight = 100
    TabOrder = 4
    object ToolBar1: TToolBar
      Left = 3
      Top = 3
      Width = 411
      Height = 26
      AutoSize = True
      Caption = 'ToolBarSerialNum'
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      Flat = True
      Images = dmDataModule.ImageListToolBar
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object ToolButton16: TToolButton
        Left = 0
        Top = 0
        Action = ActionFreeNaklRefresh
      end
      object ToolButton17: TToolButton
        Left = 23
        Top = 0
        Action = ActionFreeNaklChLayot
      end
      object ToolButton20: TToolButton
        Left = 46
        Top = 0
        Width = 8
        Caption = 'ToolButton20'
        ImageIndex = 27
        Style = tbsSeparator
      end
      object ToolButton3: TToolButton
        Left = 54
        Top = 0
        Action = ActionLinkPlat
      end
      object ToolButton11: TToolButton
        Left = 77
        Top = 0
        Action = ActionRecalLinkSum
      end
    end
    object DBGridFreeNakl: TcitDBGrid
      Left = 3
      Top = 177
      Width = 411
      Height = 474
      MarkDisabled = False
      MarkColor = clAqua
      MarkFont.Charset = DEFAULT_CHARSET
      MarkFont.Color = clNavy
      MarkFont.Height = -11
      MarkFont.Name = 'MS Sans Serif'
      MarkFont.Style = []
      LightedFont.Charset = DEFAULT_CHARSET
      LightedFont.Color = clRed
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
      OnGetKey = DBGridFreeNaklGetKey
      OnIsLighted = DBGridFreeNaklIsLighted
      OnTestBeforeMark = DBGridFreeNaklTestBeforeMark
      MultiPress = True
      EnableTitlePress = True
      MarkShortCut = 115
      SaveOnClose = False
      PropStorage = CompPropsFreeNakl
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
      SQLBuilder = SQLBuilderFreeNakl
      TitleHeight = 17
      TitleColor = clBtnFace
      Align = alClient
      DataSource = DsFreeNakl
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = PopupMenuFreeGrid
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGridFreeNaklDrawColumnCell
    end
    object Panel2: TPanel
      Left = 3
      Top = 29
      Width = 411
      Height = 116
      Align = alTop
      TabOrder = 2
      object DBGridEh1: TDBGridEh
        Left = 1
        Top = 1
        Width = 409
        Height = 114
        TabStop = False
        Align = alClient
        AllowedOperations = [alopUpdateEh]
        ColumnDefValues.Title.Orientation = tohVertical
        ColumnDefValues.Title.TitleButton = True
        Ctl3D = True
        DataSource = DSLinkSumma
        EditActions = [geaCutEh, geaCopyEh, geaPasteEh, geaDeleteEh, geaSelectAllEh]
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        FooterColor = 16776176
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clNavy
        FooterFont.Height = -11
        FooterFont.Name = 'Arial'
        FooterFont.Style = [fsBold]
        FooterRowCount = 1
        HorzScrollBar.Tracking = True
        HorzScrollBar.Visible = False
        OptionsEh = [dghFixed3D, dghFrozen3D, dghFooter3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghDialogFind]
        ParentCtl3D = False
        ParentFont = False
        PopupMenu = PopupMenuFreeGrid
        RowHeight = 15
        SortLocal = True
        SumList.Active = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Arial Narrow'
        TitleFont.Style = []
        UseMultiTitle = True
        VertScrollBar.Tracking = True
        VertScrollBar.VisibleMode = sbNeverShowEh
        VTitleMargin = 0
        OnCellClick = DBGridEh1CellClick
        OnDrawFooterCell = DBGridEh1DrawFooterCell
        OnGetCellParams = DBGridEh1GetCellParams
        OnKeyPress = DBGridEh1KeyPress
        Columns = <
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'OtdelName'
            Footer.Value = #1048#1090#1086#1075#1086
            Footer.ValueType = fvtStaticText
            Footers = <>
            ReadOnly = True
            Title.Caption = #1054#1090#1076#1077#1083
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'Arial Narrow'
            Title.Font.Style = []
            Title.Orientation = tohHorizontal
            Width = 65
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'SummaLink'
            Footer.FieldName = 'SummaLink'
            Footer.ValueType = fvtSum
            Footers = <>
            ReadOnly = True
            Title.Caption = #1057#1091#1084' '#1087#1086#1084#1077#1095
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'Arial Narrow'
            Title.Font.Style = []
            Title.Orientation = tohHorizontal
            Width = 78
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'BeforeSumma'
            Footer.FieldName = 'BeforeSumma'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1050' '#1047#1072#1082#1088#1099#1090#1080#1102
            Title.Orientation = tohHorizontal
            Width = 69
            OnGetCellParams = DBGridEh1Columns2GetCellParams
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'OtdelDolg'
            Footers = <>
            Title.Caption = #1044#1086#1083#1075' '#1087#1086' '#1086#1090#1076
            Title.Orientation = tohHorizontal
            Width = 62
          end
          item
            AutoFitColWidth = False
            Checkboxes = True
            EditButtons = <>
            FieldName = 'OtdFlt'
            Footers = <>
            Title.Caption = 'V'
            Title.Orientation = tohHorizontal
            Width = 21
          end
          item
            EditButtons = <>
            FieldName = 'BeforeSummaAccauntCurrency'
            Footers = <>
            Title.Caption = #1057#1091#1084#1084#1072' '#1074' '#1074#1072#1083#1102#1090#1077' '#1091#1095#1077#1090#1072
            Title.Orientation = tohHorizontal
            Width = 88
          end>
      end
    end
    object Panel1: TPanel
      Left = 3
      Top = 145
      Width = 411
      Height = 32
      Align = alTop
      TabOrder = 3
      object cbIsNaklR: TCheckBox
        Left = 16
        Top = 8
        Width = 97
        Height = 17
        Caption = #1058#1086#1083#1100#1082#1086' '#1056#1053
        TabOrder = 0
        OnClick = cbIsNaklRClick
      end
      object cbIsDolgNaklR: TCheckBox
        Left = 152
        Top = 8
        Width = 129
        Height = 17
        Caption = #1058#1086#1083#1100#1082#1086' '#1076#1086#1083#1075#1080' '#1087#1086' '#1056#1053
        TabOrder = 1
        OnClick = cbIsDolgNaklRClick
      end
    end
  end
  inherited ActionList: TActionList
    Left = 110
    Top = 220
    inherited ActionItemAdd: TAction
      OnExecute = ActionItemAddExecute
    end
    inherited ActionItemProp: TAction
      OnExecute = ActionItemPropExecute
    end
    inherited ActionItemDel: TAction
      OnExecute = ActionItemDelExecute
    end
    object ActionGoExcel: TAction [14]
      Caption = #1042' Excel'
      Hint = #1042' '#1069#1082#1089#1077#1083#1100
      ImageIndex = 14
      ShortCut = 16453
      OnExecute = ActionGoExcelExecute
    end
    object ActionSpecPrint: TAction [15]
      Category = 'Item'
      Caption = #1055#1077#1095#1072#1090#1100' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1080
      ImageIndex = 15
      ShortCut = 16464
    end
    object ActionShowLink: TAction [16]
      Category = 'View'
      Caption = 'ActionShowLink'
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100'/'#1089#1082#1088#1099#1090#1100' '#1087#1088#1080#1074#1103#1079#1082#1091' '#1086#1087#1083#1072#1090
      ImageIndex = 18
      OnExecute = ActionShowLinkExecute
    end
    object ActionShowFreeNakl: TAction [17]
      Caption = 'ActionShowFreeNakl'
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100'/'#1089#1082#1088#1099#1090#1100' '#1089#1074#1086#1073#1086#1076#1085#1099#1077' '#1085#1082#1083#1072#1076#1085#1099#1077
      ImageIndex = 8
      OnExecute = ActionShowFreeNaklExecute
    end
    object ActionFreeNaklRefresh: TAction [18]
      Caption = 'ActionFreeNaklRefresh'
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 3
      ShortCut = 116
      OnExecute = ActionFreeNaklRefreshExecute
    end
    object ActionFreeNaklChLayot: TAction [19]
      Caption = 'ActionFreeNaklChLayot'
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1082#1086#1083#1086#1085#1082#1080
      ImageIndex = 4
      OnExecute = ActionFreeNaklChLayotExecute
    end
    object ActionLinkPlat: TAction
      Category = 'Item'
      Caption = 'ActionLinkPlat'
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
      ImageIndex = 11
      OnExecute = ActionLinkPlatExecute
    end
    object ActionMarkLinkRefresh: TAction
      Caption = 'ActionMarkLinkRefresh'
      ShortCut = 115
      OnExecute = ActionMarkLinkRefreshExecute
    end
    object ActionScroll: TAction
      Caption = 'ActionScroll'
      OnExecute = ActionScrollExecute
    end
    object ActionRecalcSum: TAction
      Category = 'Item'
      Caption = 'ActionRecalcSum'
      Hint = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1076#1086#1083#1075
      ImageIndex = 26
      OnExecute = ActionRecalcSumExecute
    end
    object ActionRecalLinkSum: TAction
      Caption = 'ActionRecalLinkSum'
      Hint = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1076#1086#1083#1075
      ImageIndex = 26
      OnExecute = ActionRecalLinkSumExecute
    end
    object ActionRecoverDolg: TAction
      Category = 'Item'
      Caption = 'ActionRecoverDolg'
      Hint = #1040#1074#1090#1086#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1076#1086#1083#1075#1072
      ImageIndex = 27
      OnExecute = ActionRecoverDolgExecute
    end
    object ActionCopyRow: TAction
      Category = 'Item'
      Caption = 'ActionCopyRow'
      Hint = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 24
      ShortCut = 8237
      OnExecute = ActionCopyRowExecute
    end
    object ActionAutoClose: TAction
      Category = 'Item'
      Caption = #1040#1074#1090#1086#1079#1072#1082#1088#1099#1090#1080#1077
      Hint = #1040#1074#1090#1086#1079#1072#1082#1088#1099#1090#1080#1077
      ImageIndex = 28
      OnExecute = ActionAutoCloseExecute
    end
    object ActionMarkMainGrid: TAction
      Caption = #1055#1086#1084#1077#1090#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      Hint = #1055#1086#1084#1077#1090#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ShortCut = 115
      OnExecute = ActionMarkMainGridExecute
    end
  end
  inherited SQLBuilder: TTargetSQLBuilder
    Select.Strings = (
      '*')
    From.Strings = (
      'dbo.V_List_entity a')
    Where.Strings = (
      'DateEntity between :p_date_beg and :p_date_end'
      'and ((abs(Summa-CloseSumma-FreeSumma)>0.02) or :is_uncorect =0)'
      'and (is_econom= :is_econom or :is_all_econom =1)'
      'AND (a.PostNoFirst in (select cast(Param_Value as int)'
      '                      from e_Session_Params'
      '                     where Userno = <USERNO>'
      '                       and Owner_Name = <OWNERNAME>'
      '                       and Param_Name = '#39'FLT_POST'#39
      '                       and Spid = <SPID>) or :is_all_post = 1)'
      'AND (a.PostNo in (select cast(Param_Value as int)'
      '                      from e_Session_Params'
      '                     where Userno = <USERNO>'
      '                       and Owner_Name = <OWNERNAME>'
      '                       and Param_Name = '#39'FLT_POST_BUH'#39
      
        '                       and Spid = <SPID>) or :is_all_post_buh = ' +
        '1)'
      'AND (a.Entity_type_id in (select cast(Param_Value as int)'
      '                      from e_Session_Params'
      '                     where Userno = <USERNO>'
      '                       and Owner_Name = <OWNERNAME>'
      '                       and Param_Name = '#39'FLT_ENTITY_TYPE'#39
      
        '                       and Spid = <SPID>) or :is_all_entity_type' +
        ' = 1)'
      'AND (a.buh in (select cast(Param_Value as int)'
      '                      from e_Session_Params'
      '                     where Userno = <USERNO>'
      '                       and Owner_Name = <OWNERNAME>'
      '                       and Param_Name = '#39'FLT_BUH'#39
      '                       and Spid = <SPID>) or :is_all_buh = 1)'
      'AND (a.OurFirmNo in (select cast(Param_Value as int)'
      '                      from e_Session_Params'
      '                     where Userno = <USERNO>'
      '                       and Owner_Name = <OWNERNAME>'
      '                       and Param_Name = '#39'FLT_OURFIRM'#39
      
        '                       and Spid = <SPID>) or :is_all_ourfirm = 1' +
        ')'
      'AND (a.OtdelNo in (select cast(Param_Value as int)'
      '                      from e_Session_Params'
      '                     where Userno = <USERNO>'
      '                       and Owner_Name = <OWNERNAME>'
      '                       and Param_Name = '#39'FLT_OTDEL'#39
      '                       and Spid = <SPID>) or :is_all_Otdel = 1)'
      'AND (a.tip in (select cast(Param_Value as int)'
      '                      from e_Session_Params'
      '                     where Userno = <USERNO>'
      '                       and Owner_Name = <OWNERNAME>'
      '                       and Param_Name = '#39'FLT_TIP'#39
      '                       and Spid = <SPID>) or :is_all_Tip = 1)'
      'AND (a.VidNo in (select cast(Param_Value as int)'
      '                      from e_Session_Params'
      '                     where Userno = <USERNO>'
      '                       and Owner_Name = <OWNERNAME>'
      '                       and Param_Name = '#39'FLT_VIDRASH'#39
      
        '                       and Spid = <SPID>) or :is_all_vidrash = 1' +
        ')'
      
        'and ((a.tip not in (select TipNo from ListMinusPaymentForJournal' +
        'OfExpenses where CheckMinus = 1) or a.tip is null) or :isNotType' +
        'Payment = 0)'
      
        '---AND ((a.tip not in(select TipNo from ListMinusPaymentForJourn' +
        'alOfExpenses where CheckMinus = 1)  or a.tip is not null ):isNot' +
        'TypePayment = 0)'
      '')
    OnGetParams = SQLBuilderGetParams
    KeyFields.Strings = (
      'table_key')
    Left = 208
    Top = 364
  end
  inherited Query: TMSQuery
    SQL.Strings = (
      'select * from'
      'dbo.v_ListNakl a')
    Left = 110
    Top = 316
  end
  inherited DS: TDataSource
    Left = 208
    Top = 268
  end
  inherited ComponentProps: TcitComponentProps
    TableName = 'dbo.Profile'
    Left = 208
    Top = 220
  end
  inherited QueryStorage: TMSQuery
    Left = 600
    Top = 268
  end
  inherited PopupMenuGrid: TPopupMenu
    Left = 12
    Top = 364
    object ActionMarkMainGrid1: TMenuItem
      Action = ActionMarkMainGrid
    end
  end
  inherited spCopyProfile: TMSStoredProc
    Left = 698
    Top = 316
  end
  object quDepts: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      'from dbo.vidOtdel')
    Left = 12
    Top = 316
  end
  object PopupMenuLinkGrid: TPopupMenu
    Left = 406
    Top = 468
    object pmiLinkAdd: TMenuItem
      Action = ActionLinkAdd
    end
    object pmiLinkProp: TMenuItem
      Action = ActionLinkProp
    end
    object pmiLinkDel: TMenuItem
      Action = ActionLinkDel
    end
    object N23: TMenuItem
      Caption = '-'
    end
    object pmiLinkRefresh: TMenuItem
      Action = ActionLinkRefresh
    end
    object pmiLinkLayout: TMenuItem
      Action = ActionLinkLayout
    end
    object ActionLinkMark1: TMenuItem
      Action = ActionLinkMark
    end
  end
  object ActionListLink: TActionList
    Images = dmDataModule.ImageListToolBar
    Left = 204
    Top = 468
    object ActionLinkAdd: TAction
      Category = 'Item'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 0
    end
    object ActionLinkProp: TAction
      Category = 'Item'
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1080#1083#1080' '#1080#1079#1084#1077#1085#1077#1085#1080#1077' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 1
    end
    object ActionLinkDel: TAction
      Category = 'Item'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1077#1085#1080#1077' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 2
      ShortCut = 16430
      OnExecute = ActionLinkDelExecute
    end
    object ActionLinkRefresh: TAction
      Category = 'View'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1080#1079' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093
      ImageIndex = 3
      ShortCut = 116
      OnExecute = ActionLinkRefreshExecute
    end
    object ActionLinkLayout: TAction
      Category = 'View'
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072
      Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1074#1085#1077#1096#1085#1077#1075#1086' '#1074#1080#1076#1072' '#1090#1072#1073#1083#1080#1094#1099
      ImageIndex = 4
      OnExecute = ActionLinkLayoutExecute
    end
    object ActionLinkMenuItemVisible: TAction
      Category = 'View'
      Caption = #1055#1088#1080#1074#1103#1079#1082#1072' '#1086#1087#1083#1072#1090
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1087#1088#1080#1074#1103#1079#1082#1080' '#1086#1087#1083#1072#1090
    end
    object ActionRestoreLink: TAction
      Category = 'Item'
      Caption = 'ActionRestoreLink'
      Hint = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1076#1086#1083#1075
      ImageIndex = 18
    end
    object ActionUnlink: TAction
      Category = 'Item'
      Caption = 'ActionUnlink'
      Hint = #1059#1084#1077#1085#1100#1096#1080#1090#1100' '#1076#1086#1083#1075' '#1085#1072' '#1089#1091#1084#1084#1091' '#1087#1088#1080#1074#1103#1079#1082#1080
      ImageIndex = 19
    end
    object GoExelLink: TAction
      Category = 'View'
      Caption = 'GoExelLink'
      Hint = #1042' '#1101#1082#1089#1077#1083#1100
      ImageIndex = 14
      OnExecute = GoExelLinkExecute
    end
    object ActionLinkMark: TAction
      Category = 'View'
      Caption = #1055#1086#1084#1077#1090#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      Hint = #1055#1086#1084#1077#1090#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ShortCut = 115
      OnExecute = ActionLinkMarkExecute
    end
  end
  object dsLink: TDataSource
    DataSet = qryLink
    Left = 600
    Top = 220
  end
  object qryLink: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from V_PlaT_Nakl_Link where 1=2')
    AfterOpen = qryLinkAfterOpen
    Left = 698
    Top = 268
  end
  object QuFreeNakl: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      '/* '
      'select * from v_listNakl where id=1'
      '*/')
    AfterOpen = QuFreeNaklAfterOpen
    Left = 208
    Top = 316
  end
  object DsFreeNakl: TDataSource
    DataSet = QuFreeNakl
    Left = 502
    Top = 220
  end
  object spAddPlatToNakl: TMSStoredProc
    StoredProcName = 'sp_Modify_Plat_Nakl_link'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_Modify_Plat_Nakl_link (:p_ID, :p_entity' +
        'No_1, :p_entityNo_2, :p_Entity_Type_1, :p_Entity_Type_2, :p_Link' +
        '_Summa, :p_UserNo, :p_Link_SummaCurrencyAccounting)}')
    Left = 504
    Top = 316
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'p_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_entityNo_1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_entityNo_2'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_Entity_Type_1'
        ParamType = ptInput
        Size = 5
      end
      item
        DataType = ftString
        Name = 'p_Entity_Type_2'
        ParamType = ptInput
        Size = 5
      end
      item
        DataType = ftFloat
        Name = 'p_Link_Summa'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_UserNo'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'p_Link_SummaCurrencyAccounting'
        ParamType = ptInput
      end>
  end
  object quLinkSumma: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'select sum(summadolg) as SummaLink ,o.OtdelName ,0.00 as BeforeS' +
        'umma from vidotdel o left outer join NaklR r on r.otdelNo = o.ot' +
        'delNo where o.OtdelNo in (1,2,6)'
      'Group by o.OtdelName')
    AutoCalcFields = False
    Left = 404
    Top = 268
  end
  object spDelEntity: TMSStoredProc
    StoredProcName = 'sp_DelEntity;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      '{:RETURN_VALUE = CALL sp_DelEntity;1(:Pkey)}')
    Left = 600
    Top = 316
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftLargeint
        Name = 'Pkey'
        ParamType = ptInput
      end>
  end
  object QuMrkNkl: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from v_ListNakl'
      'where  PostNo= :p_PostNo'
      'and SummaDolg>0'
      'and Buh = :p_buh')
    Left = 306
    Top = 268
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'p_PostNo'
      end
      item
        DataType = ftSmallint
        Name = 'p_buh'
      end>
  end
  object DSLinkSumma: TDataSource
    DataSet = dmDataModule.SpGenTmpTable
    OnDataChange = DSLinkSummaDataChange
    Left = 110
    Top = 268
  end
  object SQLBuilderFreeNakl: TTargetSQLBuilder
    Select.Strings = (
      '*')
    From.Strings = (
      'dbo.v_List_Entity a')
    Where.Strings = (
      '/*'
      'where case when :IsNaklR = 1 and Entity_Type = '#39'NaklR'#39' then 1'
      '           when :IsNaklR is null then 1'
      '                                 else 0'
      '      end = 1'
      
        '  and case when :IsDolgNaklR = 1 and (DateEntity < (dateadd (day' +
        ',-(DAY_DELAY + DAY_DELAY_EXT),getdate())+1) and Entity_Type = '#39'N' +
        'aklR'#39') then 1'
      '           when :IsDolgNaklR is null then 1'
      '       end = 1'
      '*/')
    OrderBy.Strings = (
      'DateEntity')
    OnGetWhere = SQLBuilderFreeNaklGetWhere
    Query = QuFreeNakl
    AutoLocate = False
    Left = 404
    Top = 364
  end
  object SQLBuilderLink: TTargetSQLBuilder
    Select.Strings = (
      '        l.link_date'
      '       ,l.link_userno'
      '       ,l.delta'
      '       ,l.entity_type'
      '       ,l.entity_type_plat'
      '       ,l.entityno_plat'
      '       ,l.entityno'
      '       ,l.id'
      '       ,(SELECT username'
      '        FROM   users'
      '        WHERE  userno = l.link_userno) AS link_username'
      '       ,h.post_name          AS postname'
      '       ,h.dateentity'
      '       ,h.summa'
      '       ,h.freesumma'
      '       ,h.buh_type_name      buhname'
      '       ,h.DESCRIPTION'
      '       ,h.sotrudname'
      '       ,h.doc_type_name      AS vidname'
      '       ,h.username'
      '       ,h.bank_name'
      '       ,h.activity_type_name'
      '       ,h.otdel_name         AS otdelname'
      '       ,h.is_econom'
      '       ,l.Link_SummaCurrencyAccounting'
      '       ,CurrencyHead'
      '       ,Rate'
      '       ')
    From.Strings = (
      '(SELECT l1.id'
      
        '               ,l1.entityno_1                                   ' +
        'AS entityno'
      
        '               ,l1.entity_type_1                                ' +
        'AS entity_type'
      
        '               ,l1.entityno_2                                   ' +
        'AS entityno_plat'
      
        '               ,l1.entity_type_2                                ' +
        'AS entity_type_plat'
      '               ,l1.link_summa'
      '               ,l1.link_date'
      
        '               ,l1.userno                                       ' +
        'AS link_userno'
      
        '               ,l1.sign_2                                       ' +
        'AS plat_sign'
      '               ,l1.factor_direction'
      
        '               ,l1.factor_direction * l1.sign_2 * l1.link_summa ' +
        'AS delta'
      '               ,l1.pkey'
      '               ,l1.Link_SummaCurrencyAccounting'
      '        FROM   e_plat_nakl_link l1'
      '        WHERE  l1.entityno_1 = :p_PlatNo1'
      '        AND l1.entity_type_1 = :p_LinkNaklType1'
      '        UNION ALL'
      '        SELECT l2.id'
      
        '               ,l2.entityno_2                                   ' +
        'AS entityno'
      
        '               ,l2.entity_type_2                                ' +
        'AS entity_type'
      
        '               ,l2.entityno_1                                   ' +
        'AS entityno_plat'
      
        '               ,l2.entity_type_1                                ' +
        'AS entity_type_plat'
      '               ,l2.link_summa'
      '               ,l2.link_date'
      
        '               ,l2.userno                                       ' +
        'AS link_userno'
      
        '               ,l2.sign_1                                       ' +
        'AS plat_sign'
      '               ,l2.factor_direction'
      
        '               ,l2.factor_direction * l2.sign_1 * l2.link_summa ' +
        'AS delta'
      '               ,l2.pkey'
      '               ,l2.Link_SummaCurrencyAccounting'
      '        FROM   e_plat_nakl_link l2'
      '        WHERE  l2.entityno_2 = :p_PlatNo2'
      '        AND l2.entity_type_2 = :p_LinkNaklType2'
      ') l'
      '       LEFT OUTER JOIN v_entity h'
      '         ON l.entityno_plat = h.id'
      '            AND l.entity_type_plat = h.entity_type')
    OnGetParams = SQLBuilderLinkGetParams
    Query = qryLink
    AutoLocate = False
    Left = 306
    Top = 464
  end
  object Sprecalc_entity_free_sum: TMSStoredProc
    StoredProcName = 'pr_recalc_entity_free_sum;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      '{:RETURN_VALUE = CALL pr_recalc_entity_free_sum;1(:Pkey)}')
    Left = 306
    Top = 316
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftLargeint
        Name = 'Pkey'
        ParamType = ptInput
      end>
  end
  object sprecover_dolg_naklR: TMSStoredProc
    StoredProcName = 'pr_recover_dolg_naklR'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL pr_recover_dolg_naklR (:Pkey, :p_UserNo, :' +
        'p_PlatNo_out)}')
    Left = 404
    Top = 316
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftLargeint
        Name = 'Pkey'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_UserNo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_PlatNo_out'
        ParamType = ptInputOutput
      end>
  end
  object DsDepts: TDataSource
    DataSet = quDepts
    Left = 12
    Top = 268
  end
  object quVidRash: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'select VidrashodNo as VidNo,VidRashodName as VidName from vidras' +
        'hod')
    Left = 502
    Top = 268
  end
  object dsVidRash: TDataSource
    DataSet = quVidRash
    Left = 698
    Top = 220
  end
  object CompPropsFreeNakl: TcitComponentProps
    RootKey = -2147483647
    HandleCloseQuery = True
    Enabled = True
    LoadOnlySelected = False
    DefaultUser = 'DEFAULT_USER'
    Query = QueryStorage
    TableName = 'dbo.Profile'
    IniSection = 'MlekoCloseNaklFreeNakl'
    StorageType = sDatabase
    FormParams = [fpSize, fpPos, fpState]
    RestoreOnly = False
    RestoreOnlyDefault = False
    Left = 306
    Top = 220
  end
  object CompPropsLink: TcitComponentProps
    RootKey = -2147483647
    HandleCloseQuery = True
    Enabled = True
    LoadOnlySelected = False
    DefaultUser = 'DEFAULT_USER'
    Query = QueryStorage
    TableName = 'dbo.Profile'
    IniSection = 'MlekoCloseNaklLinkNakl'
    StorageType = sDatabase
    FormParams = []
    RestoreOnly = False
    RestoreOnlyDefault = False
    Left = 404
    Top = 220
  end
  object PopupMenuFreeGrid: TPopupMenu
    Left = 654
    Top = 404
    object MenuItem5: TMenuItem
      Action = ActionFreeNaklRefresh
    end
    object MenuItem6: TMenuItem
      Action = ActionFreeNaklChLayot
    end
    object MenuItem7: TMenuItem
      Action = ActionMarkLinkRefresh
    end
  end
  object sd_SaveExelFile: TSaveDialog
    Left = 512
  end
  object od_InputOrderWithExcel: TOpenDialog
    Left = 480
  end
  object sp_AddEntity: TMSStoredProc
    StoredProcName = 'sp_AddEntityForClosePlatRestore;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_AddEntityForClosePlatRestore;1(:p_Entit' +
        'y_type, :p_Nom, :p_PostNo, :p_PostNoFirst, :p_DatePlat, :p_Summa' +
        ', :p_FreeSumma, :p_Buh, :p_Spravka, :p_TipPlat, :p_UserNo, :p_So' +
        'trudNo, :p_bank_invoice_id, :p_activity_type_id, :p_response_dep' +
        't_id, :p_VidRashodNo, :p_OtdelNo, :p_our_firmNo, :p_is_econom, :' +
        'p_DataLoad, :p_SummaLoad, :p_FreeSummaLoad, :p_EntityTypeLoad, :' +
        'p_AddressLoad, :p_SetArticleGroupName, :p_DayDeley, :p_Pkey)}')
    Left = 552
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'p_Entity_type'
        ParamType = ptInput
        Size = 5
      end
      item
        DataType = ftInteger
        Name = 'p_Nom'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_PostNo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_PostNoFirst'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'p_DatePlat'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'p_Summa'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'p_FreeSumma'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'p_Buh'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_Spravka'
        ParamType = ptInput
        Size = 200
      end
      item
        DataType = ftSmallint
        Name = 'p_TipPlat'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'p_UserNo'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'p_SotrudNo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_bank_invoice_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_activity_type_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_response_dept_id'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'p_VidRashodNo'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'p_OtdelNo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_our_firmNo'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'p_is_econom'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'p_DataLoad'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'p_SummaLoad'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'p_FreeSummaLoad'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_EntityTypeLoad'
        ParamType = ptInput
        Size = 5
      end
      item
        DataType = ftString
        Name = 'p_AddressLoad'
        ParamType = ptInput
        Size = 256
      end
      item
        DataType = ftString
        Name = 'p_SetArticleGroupName'
        ParamType = ptInput
        Size = 512
      end
      item
        DataType = ftInteger
        Name = 'p_DayDeley'
        ParamType = ptInput
      end
      item
        DataType = ftLargeint
        Name = 'p_Pkey'
        ParamType = ptInputOutput
      end>
  end
end
