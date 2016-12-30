inherited MlekoSelectFIrmSupplierDlg: TMlekoSelectFIrmSupplierDlg
  Left = 755
  Top = 210
  Width = 702
  Height = 606
  ActiveControl = TargetFilter_StringFilter1
  Caption = #1042#1099#1073#1086#1088' '#1092#1080#1088#1084#1099' - '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
  DesignSize = (
    686
    567)
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 692
    Height = 484
    inherited TabSheet1: TTabSheet
      inherited Splitter: TSplitter
        Left = 462
        Height = 456
      end
      inherited PanelGrid: TPanel
        Width = 462
        Height = 456
        inherited DBGrid: TcitDBGrid
          Width = 460
          Height = 432
        end
        inherited ToolBar: TToolBar
          Width = 460
        end
      end
      inherited PanelSelect: TPanel
        Left = 465
        Height = 456
        inherited DBGridSelection: TcitDBGrid
          Height = 432
        end
      end
    end
  end
  inherited ButtonSelect: TButton
    Left = 619
    Top = 488
    ParentShowHint = False
    ShowHint = True
  end
  inherited ButtonCancel: TButton
    Left = 619
    Top = 514
    ParentShowHint = False
    ShowHint = True
  end
  inherited FilterPanel: TTargetFilter_Panel
    Top = 481
    Width = 613
    Height = 97
    a_OrAnd = oaOr
    object FilterName: TTargetFilter_StringFilter
      Left = 1
      Top = 32
      Width = 611
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
        611
        31)
    end
    object TargetFilter_StringFilter1: TTargetFilter_StringFilter
      Left = 1
      Top = 1
      Width = 611
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
        611
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
      Left = 156
      Top = 64
      Width = 127
      Height = 17
      Caption = #1058#1086#1083#1100#1082#1086' '#1076#1086#1083#1078#1085#1080#1082#1080
      TabOrder = 3
    end
  end
  object Button1: TButton [4]
    Left = 618
    Top = 540
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1041#1077#1079' '#1074#1099#1073#1086#1088#1072
    ModalResult = 5
    TabOrder = 4
  end
  inherited SQLBuilder: TTargetSQLBuilder
    Select.Strings = (
      'a.postno    AS id'
      '       ,name     AS shortname'
      '       ,namelong'
      '       ,okpo'
      '       ,contact'
      '       ,address'
      '       ,a.postno'
      '       &_dolg_sql')
    From.Strings = (
      'post a  inner join'
      
        '(select distinct PostNo from TovarSupplier) ts on ts.PostNo = a.' +
        'PostNo')
    Where.Strings = (
      '1=1 &_only_dolg')
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
      ' FROM post a inner join'
      
        '      (select distinct PostNo from TovarSupplier) ts on ts.PostN' +
        'o = a.PostNo')
    BeforeOpen = QueryBeforeOpen
    MacroData = <
      item
        Name = '_dolg_sql'
      end>
  end
end
