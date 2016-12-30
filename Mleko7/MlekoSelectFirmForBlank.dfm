inherited MlekoSelectFirmForBlankDlg: TMlekoSelectFirmForBlankDlg
  Left = 807
  Top = 215
  Width = 700
  Height = 489
  Caption = #1042#1099#1073#1086#1088' '#1087#1072#1088#1090#1085#1077#1088#1072
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 690
    Height = 394
    inherited TabSheet1: TTabSheet
      inherited Splitter: TSplitter
        Left = 460
        Height = 366
      end
      inherited PanelGrid: TPanel
        Width = 460
        Height = 366
        inherited DBGrid: TcitDBGrid
          Width = 458
          Height = 342
          PropStorage = nil
          ReadOnly = True
          Columns = <
            item
              Expanded = False
              FieldName = 'nameshort'
              Title.Caption = #1050#1088#1072#1090#1082#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'namelong'
              Title.Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              Width = 190
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'okpo'
              Title.Caption = #1054#1050#1055#1054
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'contract_num'
              Title.Caption = #1044#1086#1075#1086#1074#1086#1088
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Accept'
              Visible = True
            end>
        end
        inherited ToolBar: TToolBar
          Width = 458
        end
      end
      inherited PanelSelect: TPanel
        Left = 463
        Height = 366
        inherited DBGridSelection: TcitDBGrid
          Height = 342
        end
      end
    end
  end
  inherited ButtonSelect: TButton
    Left = 614
    Top = 430
  end
  inherited ButtonCancel: TButton
    Left = 614
    Top = 398
  end
  inherited FilterPanel: TTargetFilter_Panel
    Left = 2
    Top = 390
    Width = 607
    Height = 69
    object TargetFilter_StringFilter1: TTargetFilter_StringFilter
      Left = 1
      Top = 1
      Width = 605
      Height = 31
      Align = alTop
      Constraints.MaxHeight = 31
      Constraints.MinHeight = 31
      Constraints.MinWidth = 218
      ParentColor = True
      TabOrder = 0
      a_Disable_ConditionType_Combo = True
      a_a_TableName = 'u'
      a_b_FieldName = 'NameShort'
      a_b_ServerFieldName = 'NameShort'
      a_Label = #1050#1086#1088#1086#1090#1082#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      a_LabelWidth = 125
      a_ComboWidth = 0
      a_ShortCut = 16433
      a_ParamNames.Strings = (
        'FilterName_param_0')
      a_ServerType = tfst_MS_SQL
      a_ConditionType = sctLike
      a_OnBeforeGetString = TargetFilter_StringFilter1a_OnBeforeGetString
      DesignSize = (
        605
        31)
    end
    object FilterName: TTargetFilter_StringFilter
      Left = 1
      Top = 32
      Width = 605
      Height = 31
      Align = alTop
      Constraints.MaxHeight = 31
      Constraints.MinHeight = 31
      Constraints.MinWidth = 218
      ParentColor = True
      TabOrder = 1
      a_Disable_ConditionType_Combo = True
      a_a_TableName = 'u'
      a_b_FieldName = 'NameLong'
      a_b_ServerFieldName = 'NameLong'
      a_Label = #1055#1086#1083#1085#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      a_LabelWidth = 125
      a_ComboWidth = 0
      a_ShortCut = 16434
      a_ParamNames.Strings = (
        'FilterName_param_0')
      a_ServerType = tfst_MS_SQL
      a_ConditionType = sctLike
      a_OnBeforeGetString = FilterNamea_OnBeforeGetString
      DesignSize = (
        605
        31)
    end
  end
  inherited SQLBuilder: TTargetSQLBuilder
    Select.Strings = (
      ' u.postno'
      ',u.id'
      ',u.nameshort'
      ',u.namelong'
      ',u.contract_num'
      ',u.OKPO'
      ',u.Accept ')
    From.Strings = (
      ' (SELECT p.postno'
      '         ,p.PostNo as ID'
      '         ,p.name as nameshort'
      '         ,p.namelong'
      '         ,p.OKPO'
      '         ,p.Accept '
      '         ,(SELECT Max(num)'
      '            FROM   d_firm_contract c'
      '             WHERE  type_id in (1,2,3)'
      '               AND ourfirmno = (select PostNo from d_our_firm)'
      '               AND postno = p.postno'
      
        '               AND (:DateNakl BETWEEN c.create_date AND c.expire' +
        '_date)) AS contract_num'
      '          FROM post p'
      '           WHERE p.trash = 0'
      '             and exists(select 1 '
      '                         from  L_POST_SET_ARTGROUP_DELAY pdel'
      '                              ,D_SET_ARTICLE_GROUP g'
      '                          where pdel.POSTNO = p.PostNo '
      '                            and pdel.SET_ARTICLE_GROUP_ID=g.ID '
      '                            and g.ACTIVE='#39'Y'#39' )'
      '      ) u')
    Where.Strings = (
      ' u.contract_num IS NOT NULL')
    OrderBy.Strings = (
      'nameshort')
    OnGetParams = SQLBuilderGetParams
  end
  inherited Query: TMSQuery
    SQL.Strings = (
      'SELECT  u.postno'
      '         ,u.nameshort'
      '         ,u.namelong'
      '         ,u.contract_num'
      '         ,u.OKPO'
      '         ,u.Accept       '
      ' FROM  (SELECT p.postno'
      '                 ,p.name as nameshort'
      '                 ,p.namelong'
      '                 ,p.OKPO'
      '                 ,p.Accept '
      '                 ,(SELECT Max(num)'
      '                  FROM   d_firm_contract c'
      '                  WHERE  type_id in (1,2,3)'
      '                  AND ourfirmno = 490'
      '                  AND postno = p.postno'
      
        '                  AND (:DateNakl BETWEEN c.create_date AND c.exp' +
        'ire_date)) AS contract_num'
      '          FROM   post p'
      '          WHERE p.trash = 0'
      '          and exists(                 '
      '                 select 1 from  L_POST_SET_ARTGROUP_DELAY pdel'
      '                 INNER JOIN D_SET_ARTICLE_GROUP g'
      
        '                   ON pdel.SET_ARTICLE_GROUP_ID=g.ID and g.ACTIV' +
        'E='#39'Y'#39
      '                 INNER JOIN addresspost ap'
      '                   ON pdel.postno = ap.postno'
      '                 INNER JOIN d_sotrud_address a'
      '                   ON a.addresspost_id = ap.id'
      '                 INNER JOIN sotrud s'
      '                   ON a.sotrudno = s.sotrudno'
      '                 INNER JOIN vidotdel o'
      '                   ON s.sotrudotdel = o.otdelno'
      '                   WHERE p.postNo=pdel.PostNo )                 '
      '                   ) u'
      ' WHERE  u.contract_num IS NOT NULL'
      ' ORDER BY nameshort OPTION (FAST 100)')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DateNakl'
      end>
  end
end
