inherited MlekoSelectDayDeptDlg: TMlekoSelectDayDeptDlg
  Left = 1016
  Top = 278
  Width = 544
  Height = 404
  Caption = #1042#1099#1073#1086#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 303
    Top = 1
    Width = 189
    Height = 39
    Caption = 
      #1042#1085#1080#1084#1072#1085#1080#1077'! '#1056#1072#1073#1086#1095#1072#1103' '#1076#1072#1090#1072' '#1076#1086#1083#1078#1085#1072' '#1089#1086#1086#1090#1074#1077#1090#1089#1074#1086#1074#1072#1090#1100' '#1076#1072#1090#1077' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1103' '#1085 +
      #1072#1082#1083#1072#1076#1085#1099#1093
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  inherited PageControl: TPageControl
    Top = 32
    Width = 534
    Height = 280
    inherited TabSheet1: TTabSheet
      inherited Splitter: TSplitter
        Left = 304
        Height = 252
      end
      inherited PanelGrid: TPanel
        Width = 304
        Height = 252
        inherited DBGrid: TcitDBGrid
          Width = 302
          Height = 228
          OnDblClick = ActionFormSelectExecute
        end
        inherited ToolBar: TToolBar
          Width = 302
        end
      end
      inherited PanelSelect: TPanel
        Left = 307
        Height = 252
        inherited DBGridSelection: TcitDBGrid
          Height = 228
        end
      end
    end
  end
  inherited ButtonSelect: TButton
    Left = 382
    Top = 348
    Width = 72
  end
  inherited ButtonCancel: TButton
    Left = 458
    Top = 348
    Width = 71
  end
  inherited FilterPanel: TTargetFilter_Panel
    Top = 313
    Width = 369
    Height = 60
    object FilterName: TTargetFilter_StringFilter
      Left = 1
      Top = 1
      Width = 367
      Height = 31
      Align = alTop
      Constraints.MaxHeight = 31
      Constraints.MinHeight = 31
      Constraints.MinWidth = 143
      ParentColor = True
      TabOrder = 0
      a_Disable_ConditionType_Combo = True
      a_a_TableName = 'd'
      a_b_FieldName = 'OtdelName'
      a_b_ServerFieldName = 'OtdelName'
      a_Label = #1053#1072#1079#1074#1072#1085#1080#1077
      a_LabelWidth = 50
      a_ComboWidth = 0
      a_ShortCut = 16433
      a_ParamNames.Strings = (
        'FilterName_param_0')
      a_ServerType = tfst_MS_SQL
      a_ConditionType = sctLike
      DesignSize = (
        367
        31)
    end
    object cbOurFirm: TcitDBComboEdit
      Left = 88
      Top = 35
      Width = 253
      Height = 21
      Enabled = True
      OwnesLButton = True
      OwnesLLabel = True
      LBtnAlignment = baRight
      LBtnDown = False
      LBtnGroupIndex = 0
      LBtnAllowAllUp = False
      LBtnGlyphKind = gkArrow
      LBtnShortCut1 = 115
      LBtnShortCut2 = 40
      LBtnWidth = 25
      LLblAlignment = laLeft
      LLblCaption = #1053#1072#1096#1072' '#1092#1080#1088#1084#1072
      LLblWidth = 70
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
      DataSet = quOurFirm
      LocateKey = False
      KeyField = 'PostNo'
      TextField = 'Name'
      EditStyle = edCombo
      AutoTabControl = False
    end
  end
  object CBoxFilter: TCheckBox [5]
    Left = 66
    Top = 35
    Width = 193
    Height = 17
    Caption = #1055#1086#1080#1089#1082' '#1089' '#1085#1072#1095#1072#1083#1072' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1103
    TabOrder = 4
  end
  object citEditWorkDate: TcxDateEdit [6]
    Left = 11
    Top = 4
    Properties.SaveTime = False
    Properties.ShowTime = False
    Properties.WeekNumbers = True
    TabOrder = 5
    Width = 118
  end
  inherited ActionList: TActionList
    object ActionNameFilter: TAction
      Caption = 'ActionNameFilter'
      OnExecute = ActionNameFilterExecute
    end
  end
  inherited SQLBuilder: TTargetSQLBuilder
    Select.Strings = (
      'd.*,d.OtdelNo as ID')
    From.Strings = (
      'dbo.vidotdel d')
  end
  object ADOQuery1: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Persist Security Info=False;User ID=sa;Initi' +
      'al Catalog=Mleko;Data Source=Andrey'
    Parameters = <>
    Left = 77
    Top = 192
  end
  object quOurFirm: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select p.PostNo,p.Name'
      'from d_our_firm o, Post p'
      'where o.PostNo=p.PostNo')
    Left = 216
    Top = 280
  end
  object QuGetDayWeek: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SET DATEFIRST 7'
      'select DATEPART(dw, :p1_date) as day_of_week')
    AfterOpen = QueryAfterOpen
    AfterScroll = QueryAfterScroll
    AfterRefresh = QueryAfterRefresh
    Left = 175
    Top = 92
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'p1_date'
        ParamType = ptInput
      end>
  end
end
