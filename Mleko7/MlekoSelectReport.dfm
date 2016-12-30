inherited MlekoSelectReportDlg: TMlekoSelectReportDlg
  Width = 477
  Height = 367
  Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1086#1090#1095#1077#1090
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 465
    Height = 259
    inherited TabSheet1: TTabSheet
      inherited Splitter: TSplitter
        Left = 235
        Height = 231
      end
      inherited PanelGrid: TPanel
        Width = 235
        Height = 231
        inherited DBGrid: TcitDBGrid
          Width = 233
          Height = 207
        end
        inherited ToolBar: TToolBar
          Width = 233
        end
      end
      inherited PanelSelect: TPanel
        Left = 238
        Height = 231
        inherited DBGridSelection: TcitDBGrid
          Height = 207
        end
        inherited ToolBar1: TToolBar
          inherited ToolButton8: TToolButton
            Enabled = False
          end
          inherited ToolButton11: TToolButton
            Enabled = False
          end
          inherited ToolButton9: TToolButton
            Enabled = False
          end
          inherited ToolButton12: TToolButton
            Enabled = False
          end
        end
      end
    end
  end
  inherited ButtonSelect: TButton
    Left = 390
    Top = 274
    Height = 24
  end
  inherited ButtonCancel: TButton
    Left = 390
    Top = 303
    Height = 24
  end
  inherited FilterPanel: TTargetFilter_Panel
    Top = 272
    Width = 387
    Height = 64
    Color = 12701648
    a_OrAnd_AutoColors = True
    object TargetFilter_StringFilter1: TTargetFilter_StringFilter
      Left = 1
      Top = 1
      Width = 385
      Height = 31
      Align = alTop
      Constraints.MaxHeight = 31
      Constraints.MinHeight = 31
      Constraints.MinWidth = 173
      ParentColor = True
      TabOrder = 0
      a_Disable_ConditionType_Combo = True
      a_a_TableName = 'a'
      a_b_FieldName = 'report_name'
      a_b_ServerFieldName = 'report_name'
      a_Label = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      a_ComboWidth = 0
      a_ShortCut = 16433
      a_ParamNames.Strings = (
        'FilterName_param_0')
      a_ServerType = tfst_MS_SQL
      a_LikeStr_Prefix = '%'
      a_LikeStr_Suffix = '%'
      a_ConditionType = sctLike
      DesignSize = (
        385
        31)
    end
    object FilterName: TTargetFilter_StringFilter
      Left = 1
      Top = 32
      Width = 385
      Height = 31
      Align = alTop
      Constraints.MaxHeight = 31
      Constraints.MinHeight = 31
      Constraints.MinWidth = 213
      ParentColor = True
      TabOrder = 1
      a_Disable_ConditionType_Combo = True
      a_a_TableName = 'a'
      a_b_FieldName = 'num'
      a_b_ServerFieldName = 'num'
      a_Label = #1053#1086#1084#1077#1088
      a_LabelWidth = 120
      a_ComboWidth = 0
      a_ShortCut = 16434
      a_ParamNames.Strings = (
        'FilterName_param_0')
      a_ServerType = tfst_MS_SQL
      a_ConditionType = sctLike
      DesignSize = (
        385
        31)
    end
  end
  inherited ActionList: TActionList
    inherited ActionItemDel: TAction
      ShortCut = 8238
      OnExecute = ActionItemDelExecute
    end
  end
  inherited SQLBuilder: TTargetSQLBuilder
    Select.Strings = (
      '*')
    From.Strings = (
      'v_list_dlg a')
    Where.Strings = (
      'a.CodeAccess >= :p_CodeAccess'
      'and (a.active=1 or :is_show_all_active =1)')
    OnGetParams = SQLBuilderGetParams
    UseParams = False
    Left = 364
    Top = 46
  end
  object SpDelReport: TMSStoredProc
    StoredProcName = 'Sp_Del_Report;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      '{CALL Sp_Del_Report;1}')
    Left = 328
    Top = 48
  end
end
