inherited MlekoSelectNaklRDlg: TMlekoSelectNaklRDlg
  Left = 1009
  Top = 177
  Height = 329
  Caption = #1042#1099#1073#1086#1088' '#1088#1072#1089#1093#1086#1076#1085#1086#1081' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Height = 243
    inherited TabSheet1: TTabSheet
      inherited Splitter: TSplitter
        Height = 215
      end
      inherited PanelGrid: TPanel
        Height = 215
        inherited DBGrid: TcitDBGrid
          Height = 191
        end
      end
      inherited PanelSelect: TPanel
        Height = 215
        inherited DBGridSelection: TcitDBGrid
          Height = 191
        end
      end
    end
  end
  inherited ButtonSelect: TButton
    Top = 246
  end
  inherited ButtonCancel: TButton
    Top = 274
  end
  inherited FilterPanel: TTargetFilter_Panel
    Top = 245
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
      a_a_TableName = 'nr'
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
      a_Minimum = 40905.555946446760000000
      a_Maximum = 40905.555946446760000000
      a_Value = 40905.555946446760000000
      a_Parameter = 0
      a_ConditionType = dct_date_GE_LE
      a_SetDateTimeToNow = False
      a_DisableTime = True
    end
  end
  inherited SQLBuilder: TTargetSQLBuilder
    Select.Strings = (
      '*'
      '')
    From.Strings = (
      'NaklR nr')
  end
  inherited Query: TMSQuery
    SQL.Strings = (
      'select * from NaklR')
  end
end
