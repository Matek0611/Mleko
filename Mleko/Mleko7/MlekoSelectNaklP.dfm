inherited MlekoSelectNaklPDlg: TMlekoSelectNaklPDlg
  Left = 1000
  Top = 193
  Caption = 'MlekoSelectNaklPDlg'
  PixelsPerInch = 96
  TextHeight = 13
  inherited FilterPanel: TTargetFilter_Panel
    object ftDateNakl: TTargetFilter_DateFilter
      Left = 1
      Top = 1
      Width = 273
      Height = 31
      Align = alLeft
      Constraints.MaxHeight = 31
      Constraints.MinHeight = 31
      Constraints.MinWidth = 176
      Ctl3D = False
      ParentColor = True
      ParentCtl3D = False
      TabOrder = 0
      a_Disable_ConditionType_Combo = True
      a_a_TableName = 'np'
      a_b_FieldName = 'DateNakl'
      a_b_ServerFieldName = 'DateNakl'
      a_Label = #1055#1077#1088#1080#1086#1076
      a_LabelWidth = 38
      a_ComboWidth = 0
      a_OnFilterChanged = ftDateNakla_OnFilterChanged
      a_ShortCut = 0
      a_ParamNames.Strings = (
        'Inventory_date_beg '
        'Inventory_date_end')
      a_ServerType = tfst_MS_SQL
      a_Minimum = 40905.606051574080000000
      a_Maximum = 40905.606051574080000000
      a_Value = 40905.606051574080000000
      a_Parameter = 0
      a_ConditionType = dct_date_GE_LE
      a_SetDateTimeToNow = False
      a_DisableTime = True
    end
  end
  inherited SQLBuilder: TTargetSQLBuilder
    Select.Strings = (
      '*, np.NaklNo as id')
    From.Strings = (
      'NaklP np')
  end
end
