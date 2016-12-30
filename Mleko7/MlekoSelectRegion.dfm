inherited MlekoSelectRegionDlg: TMlekoSelectRegionDlg
  Left = 617
  Top = 245
  Caption = 'MlekoSelectDlg'
  PixelsPerInch = 96
  TextHeight = 13
  inherited FilterPanel: TTargetFilter_Panel
    object TargetFilter_StringFilter1: TTargetFilter_StringFilter
      Left = 1
      Top = 1
      Width = 454
      Height = 31
      Align = alTop
      Constraints.MaxHeight = 31
      Constraints.MinHeight = 31
      Constraints.MinWidth = 173
      ParentColor = True
      TabOrder = 0
      a_Disable_ConditionType_Combo = True
      a_a_TableName = 'a'
      a_b_FieldName = 'RegionName'
      a_b_ServerFieldName = 'RegionName'
      a_Label = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      a_ComboWidth = 0
      a_ShortCut = 16433
      a_ParamNames.Strings = (
        'FilterName_param_0')
      a_ServerType = tfst_MS_SQL
      a_ConditionType = sctLike
      a_OnBeforeGetString = TargetFilter_StringFilter1a_OnBeforeGetString
      DesignSize = (
        454
        31)
    end
  end
  inherited SQLBuilder: TTargetSQLBuilder
    Select.Strings = (
      '*')
    From.Strings = (
      'Regions a')
    Where.Strings = (
      'visible=0')
    KeyFields.Strings = (
      'RegionNo')
  end
end
