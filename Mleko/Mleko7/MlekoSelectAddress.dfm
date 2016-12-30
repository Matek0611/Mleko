inherited MlekoSelectAddressDlg: TMlekoSelectAddressDlg
  Left = 557
  Top = 221
  Width = 547
  Height = 403
  ActiveControl = TargetFilter_StringFilter1
  Caption = #1042#1099#1073#1086#1088' '#1092#1080#1088#1084#1099' - '#1072#1076#1088#1077#1089#1072
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 537
    Height = 291
    inherited TabSheet1: TTabSheet
      inherited Splitter: TSplitter
        Left = 307
        Height = 263
      end
      inherited PanelGrid: TPanel
        Width = 307
        Height = 263
        inherited DBGrid: TcitDBGrid
          Width = 305
          Height = 239
        end
        inherited ToolBar: TToolBar
          Width = 305
        end
      end
      inherited PanelSelect: TPanel
        Left = 310
        Height = 263
        inherited DBGridSelection: TcitDBGrid
          Height = 239
        end
      end
    end
  end
  inherited ButtonSelect: TButton
    Left = 464
    Top = 302
  end
  inherited ButtonCancel: TButton
    Left = 464
    Top = 334
  end
  inherited FilterPanel: TTargetFilter_Panel
    Top = 300
    Width = 458
    Height = 64
    a_OrAnd = oaOr
    object FilterName: TTargetFilter_StringFilter
      Left = 1
      Top = 32
      Width = 456
      Height = 31
      Align = alTop
      Constraints.MaxHeight = 31
      Constraints.MinHeight = 31
      Constraints.MinWidth = 213
      ParentColor = True
      TabOrder = 0
      a_Disable_ConditionType_Combo = True
      a_a_TableName = 'a'
      a_b_FieldName = 'address'
      a_b_ServerFieldName = 'address'
      a_Label = #1040#1076#1088#1077#1089
      a_LabelWidth = 120
      a_ComboWidth = 0
      a_ShortCut = 16434
      a_ParamNames.Strings = (
        'FilterName_param_0')
      a_ServerType = tfst_MS_SQL
      a_ConditionType = sctLike
      a_OnBeforeGetString = FilterNamea_OnBeforeGetString
      DesignSize = (
        456
        31)
    end
    object TargetFilter_StringFilter1: TTargetFilter_StringFilter
      Left = 1
      Top = 1
      Width = 456
      Height = 31
      Align = alTop
      Constraints.MaxHeight = 31
      Constraints.MinHeight = 31
      Constraints.MinWidth = 213
      ParentColor = True
      TabOrder = 1
      a_Disable_ConditionType_Combo = True
      a_a_TableName = 'a'
      a_b_FieldName = 'PostName'
      a_b_ServerFieldName = 'PostName'
      a_Label = #1060#1080#1088#1084#1072
      a_LabelWidth = 120
      a_ComboWidth = 0
      a_ShortCut = 16433
      a_ParamNames.Strings = (
        'FilterName_param_0')
      a_ServerType = tfst_MS_SQL
      a_ConditionType = sctLike
      a_OnBeforeGetString = FilterNamea_OnBeforeGetString
      DesignSize = (
        456
        31)
    end
  end
  inherited SQLBuilder: TTargetSQLBuilder
    Select.Strings = (
      '*,null as is_select')
    From.Strings = (
      'v_address_Post a')
    Where.Strings = (
      'a.PostNo = isnull(:PostNo,a.PostNo)'
      'and a.Address not like '#39#39'%---%'#39#39
      'and Address not like '#39'%...%'#39' '
      'and a.Address is not null')
    OrderBy.Strings = (
      'AddressPost')
    OnGetParams = SQLBuilderGetParams
    Left = 285
    Top = 49
  end
  inherited Query: TMSQuery
    SQL.Strings = (
      'select *,null as is_select '
      ' from v_address_Post a'
      '  where a.PostNo = IsNull(:PostNo,a.PostNo)'
      '    and a.Address not like '#39'%---%'#39
      '    and Address not like '#39'%...%'#39' '
      '    and a.Address is not null')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PostNo'
      end>
    object QueryID: TIntegerField
      FieldName = 'ID'
      ReadOnly = True
    end
    object QueryPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object QueryAddress: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      DisplayWidth = 50
      FieldName = 'Address'
      Size = 256
    end
    object QueryRegionName: TStringField
      FieldName = 'RegionName'
      Size = 50
    end
    object QueryTimeBeg: TWideStringField
      FieldName = 'TimeBeg'
      Size = 16
    end
    object QueryTimeEnd: TWideStringField
      FieldName = 'TimeEnd'
      Size = 16
    end
    object QueryUnloading: TIntegerField
      FieldName = 'Unloading'
    end
    object QueryAddressNo: TSmallintField
      FieldName = 'AddressNo'
    end
    object Querypkey: TLargeintField
      FieldName = 'pkey'
    end
    object Queryis_select: TIntegerField
      FieldName = 'is_select'
      ReadOnly = True
    end
  end
end
