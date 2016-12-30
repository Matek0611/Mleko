inherited fmPostForNaklR: TfmPostForNaklR
  Left = 424
  Top = 268
  Width = 900
  Height = 459
  ActiveControl = DbGrid
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1087#1072#1088#1090#1085#1077#1088#1086#1074
  Constraints.MaxWidth = 900
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 395
    Width = 884
    Height = 25
    Align = alBottom
    TabOrder = 0
    object bbOk: TBitBtn
      Left = 635
      Top = 2
      Width = 75
      Height = 22
      Caption = #1054#1050
      TabOrder = 0
      Kind = bkOK
    end
    object bbCancel: TBitBtn
      Left = 715
      Top = 2
      Width = 75
      Height = 22
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
    object CBAllPost: TCheckBox
      Left = 5
      Top = 5
      Width = 228
      Height = 17
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1087#1072#1088#1090#1085#1077#1088#1086#1074' '#1073#1077#1079' '#1076#1086#1075#1086#1074#1086#1088#1086#1074
      TabOrder = 2
      OnClick = CBAllPostClick
    end
  end
  object DbGrid: TcitDBGrid [1]
    Left = 0
    Top = 0
    Width = 884
    Height = 395
    MarkDisabled = False
    MarkColor = clAqua
    MarkFont.Charset = DEFAULT_CHARSET
    MarkFont.Color = clNavy
    MarkFont.Height = -11
    MarkFont.Name = 'MS Sans Serif'
    MarkFont.Style = []
    LightedFont.Charset = RUSSIAN_CHARSET
    LightedFont.Color = clTeal
    LightedFont.Height = -11
    LightedFont.Name = 'MS Sans Serif'
    LightedFont.Style = []
    LightedColor = clWindow
    DisabledFont.Charset = RUSSIAN_CHARSET
    DisabledFont.Color = clRed
    DisabledFont.Height = -11
    DisabledFont.Name = 'MS Sans Serif'
    DisabledFont.Style = []
    DisabledColor = clWindow
    OnGetKey = DbGridGetKey
    OnIsDisabled = DbGridIsDisabled
    OnIsLighted = DbGridIsLighted
    MultiPress = False
    EnableTitlePress = False
    MarkShortCut = 116
    SaveOnClose = True
    TitleHeight = 17
    TitleColor = clBtnFace
    Align = alClient
    DataSource = dsPost
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyDown = DbGridKeyDown
    OnKeyPress = DbGridKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'PostNo'
        Title.Caption = #1050#1086#1076
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OtdelName'
        Title.Caption = #1054#1090#1076#1077#1083
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Name'
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 163
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Address'
        Title.Caption = #1040#1076#1088#1077#1089' '#1076#1086#1089#1090#1072#1074#1082#1080
        Width = 295
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SotrudName'
        ReadOnly = True
        Title.Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
        Width = 147
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'contract_num'
        Title.Caption = #1044#1086#1075#1086#1074#1086#1088
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'postdaydelay'
        Title.Caption = #1044#1086#1075'.'#1076#1085
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'realdaydelay'
        Title.Caption = #1044#1085#1077#1081
        Width = 37
        Visible = True
      end>
  end
  inherited ActionList: TActionList
    Top = 40
  end
  object quPost: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'DECLARE  @DateNakl SMALLDATETIME'
      ''
      'SET @DateNakl = :DateNakl'
      ''
      'SELECT   u.postno'
      '         ,u.name'
      '         ,u.namelong'
      '         ,u.addressno'
      '         ,u.address'
      '         ,u.sotrudno'
      '         ,u.daydelay'
      '         ,u.sotrudname'
      '         ,u.otdelname'
      '         ,u.otdelno'
      '         ,u.contract_num'
      '         ,u.realdaydelay'
      '         ,u.postdaydelay'
      '         ,CASE '
      '            WHEN u.realdaydelay > u.postdaydelay THEN '#39'Y'#39
      '                                                 ELSE '#39'N'#39
      '          END AS is_strem'
      '         ,CASE '
      '                     WHEN EXISTS (SELECT 1'
      '                                  FROM   d_firm_prop p'
      '                                         ,l_firm_prop l'
      '                                  WHERE  l.prop_id = p.id'
      '                                  AND p.id IN (14)'
      
        '                                  AND l.postno IN (SELECT otdelp' +
        'ostno'
      
        '                                                   FROM   vidotd' +
        'el'
      
        '                                                   WHERE  otdeln' +
        'o = u.OtdelNo'
      '                                                   UNION ALL'
      
        '                                                   SELECT u.Post' +
        'no)) THEN '#39'Y'#39
      '                     WHEN EXISTS (SELECT 1'
      '                                  FROM   d_firm_prop p'
      '                                         ,l_firm_prop l'
      '                                  WHERE  l.prop_id = p.id'
      '                                  AND p.id IN (20,21)'
      
        '                                  AND l.postno IN (SELECT otdelp' +
        'ostno'
      
        '                                                   FROM   vidotd' +
        'el'
      
        '                                                   WHERE  otdeln' +
        'o = u.OtdelNo'
      '                                                   UNION ALL'
      
        '                                                   SELECT u.Post' +
        'no)) THEN '#39'N'#39
      
        '                     WHEN u.realdaydelay > u.postdaydelay + 1 TH' +
        'EN '#39'Y'#39'                                                   '
      '                     else '#39'N'#39' end  as is_stop'
      'FROM     (SELECT p.postno'
      '                 ,p.name'
      '                 ,p.namelong'
      '                 ,ap.addressno'
      '                 ,ap.address'
      '                 ,s.sotrudno'
      '                 ,p.daydelay'
      '                 ,s.sotrudname'
      '                 ,o.otdelname'
      '                 ,o.otdelno'
      '                 ,(SELECT Max(num)'
      '                  FROM   d_firm_contract c'
      '                  WHERE  type_id = 1'
      
        '                  AND ourfirmno = (select PostNo from d_our_firm' +
        ')'
      '                  AND postno = p.postno'
      
        '                  AND (@DateNakl BETWEEN c.create_date AND c.exp' +
        'ire_date)) AS contract_num'
      
        '                 ,Datediff(dd,(SELECT Isnull(Min(datenakl),@Date' +
        'Nakl)'
      '                              FROM   naklr h1'
      '                              WHERE h1.summadolg > 0'
      '                              and  h1.postno = p.postno'
      
        '                              AND h1.ourfirmno = (select PostNo ' +
        'from d_our_firm)'
      
        '                              AND h1.vidnaklno = 1),@DateNakl) A' +
        'S realdaydelay'
      
        '                 ,Isnull(p.daydelay,0)                          ' +
        'AS postdaydelay'
      '          FROM post p INNER JOIN '
      
        '               addresspost ap ON p.postno = ap.postno LEFT OUTER' +
        ' JOIN '
      
        '               d_sotrud_address a ON a.addresspost_id = ap.id LE' +
        'FT OUTER JOIN '
      
        '               sotrud s ON a.sotrudno = s.sotrudno LEFT OUTER JO' +
        'IN '
      '               vidotdel o ON s.sotrudotdel = o.otdelno'
      '          WHERE  p.visible = 0'
      '          AND o.otdelno IS NOT NULL'
      '          AND ap.address IS NOT NULL'
      '          AND p.trash = 0'
      '          and ((ap.Active = 1) and (a.Active = 1))) u'
      'WHERE    (u.contract_num IS NOT NULL '
      '           OR :IS_ALL = 1)'
      'ORDER BY &_order'
      '/*OPTION (FAST 100)*/')
    BeforeOpen = quPostBeforeOpen
    AfterOpen = quPostAfterOpen
    BeforeClose = quPostBeforeClose
    Left = 48
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DateNakl'
      end
      item
        DataType = ftUnknown
        Name = 'IS_ALL'
      end>
    MacroData = <
      item
        Name = '_order'
        Value = 'Name'
      end>
    object quPostPostNo: TSmallintField
      FieldName = 'PostNo'
      Origin = 'post.postno'
    end
    object quPostName: TStringField
      FieldName = 'Name'
      Origin = 'post.name'
      Size = 30
    end
    object quPostNameLong: TStringField
      FieldName = 'NameLong'
      Origin = 'post.namelong'
      Size = 80
    end
    object quPostAddressNo: TSmallintField
      FieldName = 'AddressNo'
      Origin = 'addresspost.addressno'
    end
    object quPostAddress: TStringField
      FieldName = 'Address'
      Origin = 'addresspost.address'
      Size = 256
    end
    object quPostSotrudNo: TSmallintField
      FieldName = 'SotrudNo'
      Origin = 'sotrud.sotrudno'
    end
    object quPostDayDelay: TSmallintField
      FieldName = 'DayDelay'
      Origin = 'post.daydelay'
    end
    object quPostSotrudName: TStringField
      FieldName = 'SotrudName'
      Origin = 'sotrud.sotrudname'
      FixedChar = True
      Size = 30
    end
    object quPostOtdelName: TStringField
      FieldName = 'OtdelName'
      Origin = 'vidotdel.otdelname'
      FixedChar = True
      Size = 30
    end
    object quPostOtdelNo: TSmallintField
      FieldName = 'OtdelNo'
      Origin = 'vidotdel.otdelno'
    end
    object quPostcontract_num: TStringField
      FieldName = 'contract_num'
      Origin = '.'
      ReadOnly = True
      Size = 24
    end
    object quPostrealdaydelay: TIntegerField
      FieldName = 'realdaydelay'
      Origin = '.'
      ReadOnly = True
    end
    object quPostpostdaydelay: TSmallintField
      FieldName = 'postdaydelay'
      Origin = '.'
      ReadOnly = True
    end
    object quPostis_strem: TStringField
      FieldName = 'is_strem'
      Origin = '.'
      ReadOnly = True
      Size = 1
    end
    object quPostis_stop: TStringField
      FieldName = 'is_stop'
      Origin = '.'
      ReadOnly = True
      Size = 1
    end
  end
  object dsPost: TDataSource
    DataSet = quPost
    Left = 48
    Top = 96
  end
end
