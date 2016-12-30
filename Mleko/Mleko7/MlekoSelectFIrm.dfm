inherited MlekoSelectFIrmDlg: TMlekoSelectFIrmDlg
  Left = 658
  Top = 172
  Width = 683
  Height = 533
  ActiveControl = TargetFilter_StringFilter1
  Caption = #1042#1099#1073#1086#1088' '#1092#1080#1088#1084#1099
  DesignSize = (
    667
    494)
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 673
    Height = 411
    inherited TabSheet1: TTabSheet
      inherited Splitter: TSplitter
        Left = 443
        Height = 383
      end
      inherited PanelGrid: TPanel
        Width = 443
        Height = 383
        inherited DBGrid: TcitDBGrid
          Width = 441
          Height = 359
        end
        inherited ToolBar: TToolBar
          Width = 441
        end
      end
      inherited PanelSelect: TPanel
        Left = 446
        Height = 383
        inherited DBGridSelection: TcitDBGrid
          Height = 359
        end
      end
    end
  end
  inherited ButtonSelect: TButton
    Left = 594
    Top = 413
    ParentShowHint = False
    ShowHint = True
  end
  inherited ButtonCancel: TButton
    Left = 594
    Top = 442
    ParentShowHint = False
    ShowHint = True
  end
  inherited FilterPanel: TTargetFilter_Panel
    Top = 408
    Width = 584
    Height = 97
    a_OrAnd = oaOr
    object FilterName: TTargetFilter_StringFilter
      Left = 1
      Top = 32
      Width = 582
      Height = 31
      Align = alTop
      Constraints.MaxHeight = 31
      Constraints.MinHeight = 31
      Constraints.MinWidth = 213
      ParentColor = True
      TabOrder = 0
      a_Disable_ConditionType_Combo = True
      a_a_TableName = 'a'
      a_b_FieldName = 'NameLong'
      a_b_ServerFieldName = 'NameLong'
      a_Label = #1055#1086#1083#1085#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      a_LabelWidth = 120
      a_ComboWidth = 0
      a_ShortCut = 16434
      a_ParamNames.Strings = (
        'FilterName_param_0')
      a_ServerType = tfst_MS_SQL
      a_ConditionType = sctLike
      a_OnBeforeGetString = FilterNamea_OnBeforeGetString
      DesignSize = (
        582
        31)
    end
    object TargetFilter_StringFilter1: TTargetFilter_StringFilter
      Left = 1
      Top = 1
      Width = 582
      Height = 31
      Align = alTop
      Constraints.MaxHeight = 31
      Constraints.MinHeight = 31
      Constraints.MinWidth = 213
      ParentColor = True
      TabOrder = 1
      a_Disable_ConditionType_Combo = True
      a_a_TableName = 'a'
      a_b_FieldName = 'Name'
      a_b_ServerFieldName = 'Name'
      a_Label = #1050#1086#1088#1086#1090#1082#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      a_LabelWidth = 120
      a_ComboWidth = 0
      a_ShortCut = 16433
      a_ParamNames.Strings = (
        'FilterName_param_0')
      a_ServerType = tfst_MS_SQL
      a_ConditionType = sctLike
      a_OnBeforeGetString = FilterNamea_OnBeforeGetString
      DesignSize = (
        582
        31)
    end
    object chkShowDolg: TCheckBox
      Left = 3
      Top = 65
      Width = 127
      Height = 17
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1076#1086#1083#1075
      TabOrder = 2
    end
    object chkOnlyDolg: TCheckBox
      Left = 131
      Top = 64
      Width = 127
      Height = 17
      Caption = #1058#1086#1083#1100#1082#1086' '#1076#1086#1083#1078#1085#1080#1082#1080
      TabOrder = 3
    end
    object chkOnlyZatrati: TCheckBox
      Left = 276
      Top = 64
      Width = 127
      Height = 17
      Caption = #1058#1086#1083#1100#1082#1086' '#1079#1072#1090#1088#1072#1090#1099
      TabOrder = 4
    end
  end
  object BtNone: TButton [4]
    Left = 594
    Top = 469
    Width = 75
    Height = 25
    Hint = #1055#1088#1086#1076#1086#1083#1078#1080#1090#1100' '#1073#1077#1079' '#1074#1099#1073#1086#1088#1072
    Action = ActionFormCancel
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1041#1077#1079' '#1074#1099#1073#1086#1088#1072
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Visible = False
  end
  inherited SQLBuilder: TTargetSQLBuilder
    Select.Strings = (
      'a.postno    AS id'
      '       ,name     AS shortname'
      
        '       ,case when (select prop_id from l_firm_prop where PostNo ' +
        '= a.PostNo and prop_id = 11) is null then '#39#1053#1077#1090#39' else '#39#1044#1072#39' end as' +
        ' Zatrati'
      '       ,namelong'
      '       ,okpo'
      '       ,contact'
      '       ,address'
      '       ,a.postno '
      '       '
      '       &_dolg_sql')
    From.Strings = (
      'post a')
    Where.Strings = (
      '1=1 &_only_dolg &_only_zatrati')
    OrderBy.Strings = (
      'Order by Name')
  end
  inherited Query: TMSQuery
    SQL.Strings = (
      'SELECT a.postno    AS id'
      '       ,name     AS shortname'
      '       ,namelong'
      '       ,okpo'
      '       ,contact'
      '       ,address'
      '       ,a.postno'
      '       &_dolg_sql'
      ' FROM post a')
    BeforeOpen = QueryBeforeOpen
    MacroData = <
      item
        Name = '_dolg_sql'
      end>
  end
end
