inherited MlekoSelectTipTovaraDlg: TMlekoSelectTipTovaraDlg
  Left = 922
  Top = 409
  Width = 484
  Height = 354
  Caption = #1042#1099#1073#1086#1088' '#1074#1080#1076#1072' '#1090#1086#1074#1072#1088#1072
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 472
    Height = 258
    inherited TabSheet1: TTabSheet
      inherited Splitter: TSplitter
        Left = 242
        Height = 230
      end
      inherited PanelGrid: TPanel
        Width = 242
        Height = 230
        inherited DBGrid: TcitDBGrid
          Width = 240
          Height = 206
        end
        inherited ToolBar: TToolBar
          Width = 240
        end
      end
      inherited PanelSelect: TPanel
        Left = 245
        Height = 230
        inherited DBGridSelection: TcitDBGrid
          Height = 206
        end
      end
    end
  end
  inherited ButtonSelect: TButton
    Left = 393
    Top = 266
  end
  inherited ButtonCancel: TButton
    Left = 393
    Top = 298
  end
  inherited FilterPanel: TTargetFilter_Panel
    Top = 266
    Width = 376
    object TargetFilter_VidName: TTargetFilter_StringFilter
      Left = 1
      Top = 1
      Width = 374
      Height = 31
      Align = alTop
      Constraints.MaxHeight = 31
      Constraints.MinHeight = 31
      Constraints.MinWidth = 213
      ParentColor = True
      TabOrder = 0
      a_Disable_ConditionType_Combo = True
      a_a_TableName = 'a'
      a_b_FieldName = 'TipName'
      a_b_ServerFieldName = 'TipName'
      a_Label = #1042#1080#1076' '#1090#1086#1074#1072#1088#1072
      a_LabelWidth = 120
      a_ComboWidth = 0
      a_ShortCut = 16433
      a_ParamNames.Strings = (
        'FilterName_param_0')
      a_ServerType = tfst_MS_SQL
      a_ConditionType = sctLike
      a_OnBeforeGetString = TargetFilter_VidNamea_OnBeforeGetString
      DesignSize = (
        374
        31)
    end
  end
  inherited ActionList: TActionList
    Left = 116
  end
  inherited ComponentProps: TcitComponentProps
    Left = 32
  end
  inherited DS: TDataSource
    Left = 116
  end
  inherited SQLBuilder: TTargetSQLBuilder
    Select.Strings = (
      'TipNo  as id'
      ',TipNo '
      ',TipName')
    From.Strings = (
      'TipTovara a')
    KeyFields.Strings = (
      'TipNo')
    Left = 62
    Top = 41
  end
  inherited Query: TMSQuery
    SQL.Strings = (
      'select TipNo as id'
      '      ,TipNo'
      '      ,TipName'
      ' from TipTovara a')
    Left = 87
  end
  inherited QueryProp: TMSQuery
    Left = 31
  end
  inherited DSSelection: TDataSource
    Left = 88
  end
  inherited QuSelectList: TMSQuery
    Left = 55
    Top = 196
  end
end
