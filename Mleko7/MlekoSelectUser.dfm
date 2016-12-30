inherited MlekoSelectUserDlg: TMlekoSelectUserDlg
  Width = 511
  Caption = #1042#1099#1073#1086#1088' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 499
    inherited TabSheet1: TTabSheet
      inherited Splitter: TSplitter
        Left = 269
      end
      inherited PanelGrid: TPanel
        Width = 269
        inherited DBGrid: TcitDBGrid
          Width = 267
        end
        inherited ToolBar: TToolBar
          Width = 267
        end
      end
      inherited PanelSelect: TPanel
        Left = 272
      end
    end
  end
  inherited ButtonSelect: TButton
    Left = 420
  end
  inherited ButtonCancel: TButton
    Left = 420
  end
  inherited FilterPanel: TTargetFilter_Panel
    Width = 403
    object TargetFilter_StringFilter1: TTargetFilter_StringFilter
      Left = 1
      Top = 1
      Width = 401
      Height = 31
      Align = alTop
      Constraints.MaxHeight = 31
      Constraints.MinHeight = 31
      Constraints.MinWidth = 173
      ParentColor = True
      TabOrder = 0
      a_Disable_ConditionType_Combo = True
      a_a_TableName = 'a'
      a_b_FieldName = 'UserName'
      a_b_ServerFieldName = 'UserName'
      a_Label = #1048#1084#1103
      a_ComboWidth = 0
      a_ShortCut = 16433
      a_ParamNames.Strings = (
        'FilterName_param_0')
      a_ServerType = tfst_MS_SQL
      a_LikeStr_Prefix = '%'
      a_LikeStr_Suffix = '%'
      a_ConditionType = sctLike
      DesignSize = (
        401
        31)
    end
  end
  inherited SQLBuilder: TTargetSQLBuilder
    Select.Strings = (
      ' a.UserNo,a.UserNo as ID,a.UserName,a.CodeAccess')
    From.Strings = (
      'Users a')
    Left = 365
    Top = 43
  end
  inherited spCopyProfile: TMSStoredProc
    Left = 464
    Top = 40
  end
end
