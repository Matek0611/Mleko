inherited MlekoSelectTovarDlg: TMlekoSelectTovarDlg
  Left = 1032
  Top = 139
  Width = 552
  Height = 472
  Caption = 'MlekoSelectTovarDlg'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 542
    Height = 350
    inherited TabSheet1: TTabSheet
      inherited Splitter: TSplitter
        Left = 312
        Height = 322
      end
      inherited PanelGrid: TPanel
        Width = 312
        Height = 322
        inherited DBGrid: TcitDBGrid
          Width = 310
          Height = 298
        end
        inherited ToolBar: TToolBar
          Width = 310
        end
      end
      inherited PanelSelect: TPanel
        Left = 315
        Height = 322
        inherited DBGridSelection: TcitDBGrid
          Height = 298
        end
      end
    end
  end
  inherited ButtonSelect: TButton
    Left = 468
    Top = 391
    Height = 27
  end
  inherited ButtonCancel: TButton
    Left = 468
    Top = 418
  end
  inherited FilterPanel: TTargetFilter_Panel
    Top = 350
    Width = 463
    Height = 95
    object ftVidName: TTargetFilter_StringFilter
      Left = 1
      Top = 32
      Width = 264
      Height = 31
      Constraints.MaxHeight = 31
      Constraints.MinHeight = 31
      Constraints.MinWidth = 113
      ParentColor = True
      TabOrder = 0
      a_Disable_ConditionType_Combo = True
      a_a_TableName = 'v'
      a_b_FieldName = 'vidName'
      a_b_ServerFieldName = 'vidName'
      a_Label = #1042#1080#1076
      a_LabelWidth = 20
      a_ComboWidth = 0
      a_ShortCut = 16434
      a_ParamNames.Strings = (
        'ftVidName_param_0')
      a_ServerType = tfst_MS_SQL
      a_ConditionType = sctLike
      a_OnBeforeGetString = ftVidNamea_OnBeforeGetString
      DesignSize = (
        264
        31)
    end
    object ftTovar: TTargetFilter_StringFilter
      Left = 1
      Top = 1
      Width = 461
      Height = 31
      Align = alTop
      Constraints.MaxHeight = 31
      Constraints.MinHeight = 31
      Constraints.MinWidth = 173
      ParentColor = True
      TabOrder = 1
      a_Disable_ConditionType_Combo = True
      a_a_TableName = 'a'
      a_b_FieldName = 'NameTovar'
      a_b_ServerFieldName = 'NameTovar'
      a_Label = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      a_ComboWidth = 0
      a_ShortCut = 16433
      a_ParamNames.Strings = (
        'FilterName_param_0')
      a_ServerType = tfst_MS_SQL
      a_ConditionType = sctLike
      a_OnBeforeGetString = ftTovara_OnBeforeGetString
      DesignSize = (
        461
        31)
    end
    object ftTovarNo: TTargetFilter_StringFilter
      Left = 265
      Top = 32
      Width = 190
      Height = 31
      Constraints.MaxHeight = 31
      Constraints.MinHeight = 31
      Constraints.MinWidth = 113
      ParentColor = True
      TabOrder = 2
      a_Disable_ConditionType_Combo = True
      a_a_TableName = 'a'
      a_b_FieldName = 'TovarNo'
      a_b_ServerFieldName = 'TovarNo'
      a_Label = #1050#1086#1076
      a_LabelWidth = 20
      a_ComboWidth = 0
      a_ShortCut = 16435
      a_ParamNames.Strings = (
        'ftVidName_param_0')
      a_ServerType = tfst_MS_SQL
      a_ConditionType = sctLike
      a_OnBeforeGetString = ftTovarNoa_OnBeforeGetString
      DesignSize = (
        190
        31)
    end
    object ftCompany: TTargetFilter_StringFilter
      Left = 1
      Top = 63
      Width = 454
      Height = 31
      Constraints.MaxHeight = 31
      Constraints.MinHeight = 31
      Constraints.MinWidth = 173
      ParentColor = True
      TabOrder = 3
      a_Disable_ConditionType_Combo = True
      a_a_TableName = 'c'
      a_b_FieldName = 'namecompany'
      a_b_ServerFieldName = 'namecompany'
      a_Label = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
      a_ComboWidth = 0
      a_ShortCut = 16436
      a_ParamNames.Strings = (
        'ftVidName_param_0')
      a_ServerType = tfst_MS_SQL
      a_ConditionType = sctLike
      a_OnBeforeGetString = ftCompanya_OnBeforeGetString
      DesignSize = (
        454
        31)
    end
  end
  inherited SQLBuilder: TTargetSQLBuilder
    Select.Strings = (
      'tovarno      AS id'
      '       ,tovarno'
      '       ,nametovar'
      '       ,v.VidName'
      '       ,a.companyno'
      '       ,c.namecompany')
    From.Strings = (
      'tovar a'
      'left outer join dbo.vidtov v on v.vidno = a.vidno'
      'left outer join dbo.company c on c.companyno = a.companyno')
  end
  inherited Query: TMSQuery
    SQL.Strings = (
      'select * from v_postList')
    Filter = 'vidname = '#39' '#39
    BeforeOpen = QueryBeforeOpen
  end
end
