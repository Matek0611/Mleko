inherited fmPostForRashod: TfmPostForRashod
  Left = 589
  Top = 117
  Width = 962
  Height = 380
  ActiveControl = DbGrid
  Anchors = [akLeft, akTop, akRight]
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1087#1072#1088#1090#1085#1077#1088#1086#1074
  Constraints.MaxWidth = 1000
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 286
    Width = 946
    Height = 55
    Align = alBottom
    BorderWidth = 2
    TabOrder = 0
    object lbl1: TLabel
      Left = 9
      Top = 6
      Width = 131
      Height = 13
      Caption = #1054#1090#1089#1088#1086#1095#1082#1072' '#1076#1086#1087#1091#1089#1090#1080#1084#1072#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl2: TLabel
      Left = 571
      Top = 6
      Width = 68
      Height = 13
      Caption = #1050#1086#1076' '#1092#1080#1088#1084#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl3: TLabel
      Left = 368
      Top = 6
      Width = 52
      Height = 13
      Caption = #1044#1086#1075#1086#1074#1086#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl4: TLabel
      Left = 194
      Top = 6
      Width = 114
      Height = 13
      Caption = #1047#1072#1076#1077#1088#1078#1082#1072' '#1087#1083#1072#1090#1077#1078#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object bbOk: TBitBtn
      Left = 634
      Top = 31
      Width = 75
      Height = 22
      Caption = #1054#1050
      TabOrder = 0
      Kind = bkOK
    end
    object bbCancel: TBitBtn
      Left = 714
      Top = 31
      Width = 75
      Height = 22
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
    object CBAllPost: TCheckBox
      Left = 5
      Top = 33
      Width = 228
      Height = 17
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1087#1072#1088#1090#1085#1077#1088#1086#1074' '#1073#1077#1079' '#1076#1086#1075#1086#1074#1086#1088#1086#1074
      TabOrder = 2
      OnClick = CBAllPostClick
    end
    object dbLbDelayPost: TcxDBLabel
      Left = 144
      Top = 2
      DataBinding.DataField = 'postdaydelay'
      DataBinding.DataSource = dsPost
      ParentColor = False
      Style.Color = clInfoBk
      Height = 21
      Width = 46
    end
    object dbLbDelayReal: TcxDBLabel
      Left = 312
      Top = 2
      DataBinding.DataField = 'realdaydelay'
      DataBinding.DataSource = dsPost
      ParentColor = False
      Style.Color = clInfoBk
      Height = 21
      Width = 52
    end
    object dbLbContract: TcxDBLabel
      Left = 424
      Top = 2
      DataBinding.DataField = 'contract_num'
      DataBinding.DataSource = dsPost
      ParentColor = False
      Style.Color = clInfoBk
      Height = 21
      Width = 143
    end
    object dbLbPosTNo: TcxDBLabel
      Left = 643
      Top = 2
      DataBinding.DataField = 'postno'
      DataBinding.DataSource = dsPost
      ParentColor = False
      Style.Color = clInfoBk
      Height = 21
      Width = 76
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 0
    Width = 946
    Height = 286
    Align = alClient
    TabOrder = 1
    object DbGrid: TcitDBGrid
      Left = 1
      Top = 1
      Width = 944
      Height = 284
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
      MultiPress = False
      EnableTitlePress = True
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
      TabOrder = 0
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyDown = DbGridKeyDown
      OnKeyPress = DbGridKeyPress
      OnTitleClick = DbGridTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'name'
          Title.Caption = #1055#1072#1088#1090#1085#1077#1088
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'sotrudname'
          ReadOnly = True
          Title.Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'address'
          Title.Caption = #1040#1076#1088#1077#1089' '#1076#1086#1089#1090#1072#1074#1082#1080
          Width = 270
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'otdelname'
          Title.Caption = #1054#1090#1076#1077#1083
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SET_ARTICLE_GROUP_NAME'
          Title.Caption = #1053#1072#1073#1086#1088
          Width = 169
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Buh_type_name'
          Title.Caption = #1041#1091#1093' '#1090#1080#1087
          Width = 54
          Visible = True
        end>
    end
  end
  inherited ActionList: TActionList
    Top = 56
  end
  object quPost: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'DECLARE  @DateNakl SMALLDATETIME'
      'DECLARE  @IS_ALL SMALLINT'
      'DECLARE  @POSTNO DTFkey'
      'DECLARE  @SotrudNo SMALLINT'
      'DECLARE  @SET_ARTICLE_GROUP_ID bigint'
      ''
      'SET @DateNakl = convert(smalldatetime,:DateNakl)'
      'SET @IS_ALL= :IS_ALL'
      'SET @POSTNO= :POSTNO'
      'SET @SotrudNo = :SotrudNo'
      'SET @SET_ARTICLE_GROUP_ID = :SET_ARTICLE_GROUP_ID'
      '--SET @DateNakl = GETDATE()'
      ''
      'SELECT   u.postno'
      '         ,u.name'
      '         ,u.namelong'
      '         ,u.addressno'
      '         ,u.address'
      '         ,u.sotrudno'
      '         ,u.sotrudname'
      '         ,u.otdelname'
      '         ,u.otdelno'
      '         ,u.contract_num'
      '         ,u.realdaydelay'
      '         ,u.postdaydelay'
      '         ,CASE when u.realdaydelay > u.postdaydelay THEN '#39'Y'#39
      
        '               when ((u.datenakl is not null) and (select isnull' +
        '(max(1),0) from l_firm_prop where postNo=u.PostNo and prop_id=22' +
        ')=1) '
      
        '                                              and (u.is_enable_s' +
        'top_period = 0) THEN '#39'Y'#39
      '                                                    else '#39'N'#39' '
      '          end  as is_stop'
      '         ,SET_ARTICLE_GROUP_NAME'
      '         ,SET_ARTICLE_GROUP_ID'
      '         ,BUH'
      '         ,DAY_DELAY'
      '         ,DAY_DELAY_EXT'
      '         ,Buh_type_name         '
      '         ,AddressID'
      'FROM     (SELECT p.postno'
      '                 ,p.name'
      '                 ,p.namelong'
      '                 ,ap.addressno'
      '                 ,ap.address'
      '                 ,s.sotrudno'
      '                 ,s.sotrudname'
      '                 ,o.otdelname'
      '                 ,o.otdelno'
      '                 ,(SELECT Max(num)'
      '                    FROM   d_firm_contract c'
      '                     WHERE  type_id = 1'
      
        '                       AND ourfirmno = (select PostNo from d_our' +
        '_firm)'
      '                       AND postno = p.postno'
      
        '                       AND (@DateNakl BETWEEN c.create_date AND ' +
        'c.expire_date)) AS contract_num'
      
        '                 ,Datediff(dd,isnull(pdel.DateNakl,@DateNakl),@D' +
        'ateNakl) AS realdaydelay'
      
        '--                 ,Isnull(pdel.DAY_DELAY,0)+isnull(pdel.DAY_DEL' +
        'AY_EXT,0) AS postdaydelay'
      '                 ,Isnull(pdel.DAY_DELAY,0) AS postdaydelay'
      '                 ,pdel.SET_ARTICLE_GROUP_NAME'
      '                 ,pdel.SET_ARTICLE_GROUP_ID'
      '                 ,pdel.BUH'
      '                 ,pdel.DAY_DELAY'
      '                 ,pdel.DAY_DELAY_EXT'
      '                 ,pdel.datenakl'
      
        '                 ,(select Buh_type_name from d_buh_type where bu' +
        'h=pdel.BUH) as Buh_type_name'
      '                 ,ap.id as AddressID'
      '                 ,pdel.is_stop'
      '                 ,pdel.is_start'
      '                 ,pdel.is_enable_stop_period'
      '          FROM   post p'
      
        '                 INNER JOIN dbo.fu_first_free_nakl(@DateNakl,@Po' +
        'stNo,-1) pdel on pdel.PostNo=p.PostNo'
      '                 INNER JOIN addresspost ap'
      '                   ON p.postno = ap.postno and ap.Active = 1'
      '                 LEFT OUTER JOIN d_sotrud_address a'
      '                   ON a.addresspost_id = ap.id and a.Active = 1'
      '                 LEFT OUTER JOIN sotrud s'
      '                   ON a.sotrudno = s.sotrudno'
      '                 LEFT OUTER JOIN vidotdel o'
      '                   ON s.sotrudotdel = o.otdelno'
      '          WHERE  (p.PostNo=@POSTNO or @POSTNO=-1)'
      '          AND (s.SotrudNo = @SotrudNo or @SotrudNo = 0)'
      
        '          AND (pdel.SET_ARTICLE_GROUP_ID = @SET_ARTICLE_GROUP_ID' +
        ' or @SET_ARTICLE_GROUP_ID = 0)'
      '          AND o.otdelno IS NOT NULL'
      '          AND ap.address IS NOT NULL'
      '          AND p.trash = 0) u'
      'WHERE    (u.contract_num IS NOT NULL OR @IS_ALL = 1)'
      ''
      'ORDER BY &_order'
      ''
      ''
      ''
      ''
      '/*OPTION (FAST 100)*/')
    BeforeOpen = quPostBeforeOpen
    AfterOpen = quPostAfterOpen
    BeforeClose = quPostBeforeClose
    Left = 48
    Top = 32
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DateNakl'
      end
      item
        DataType = ftSmallint
        Name = 'IS_ALL'
      end
      item
        DataType = ftInteger
        Name = 'POSTNO'
      end
      item
        DataType = ftInteger
        Name = 'SotrudNo'
      end
      item
        DataType = ftLargeint
        Name = 'SET_ARTICLE_GROUP_ID'
      end>
    MacroData = <
      item
        Name = '_order'
        Value = 'Name,address,otdelname,sotrudname,Buh_type_name'
      end>
    object quPostpostno: TSmallintField
      FieldName = 'postno'
    end
    object quPostname: TStringField
      FieldName = 'name'
      Size = 30
    end
    object quPostnamelong: TStringField
      FieldName = 'namelong'
      Size = 80
    end
    object quPostaddressno: TSmallintField
      FieldName = 'addressno'
    end
    object quPostaddress: TStringField
      FieldName = 'address'
      Size = 256
    end
    object quPostsotrudno: TSmallintField
      FieldName = 'sotrudno'
    end
    object quPostsotrudname: TStringField
      FieldName = 'sotrudname'
      Size = 30
    end
    object quPostotdelname: TStringField
      FieldName = 'otdelname'
      Size = 30
    end
    object quPostotdelno: TSmallintField
      FieldName = 'otdelno'
    end
    object quPostcontract_num: TStringField
      FieldName = 'contract_num'
      ReadOnly = True
      Size = 24
    end
    object quPostrealdaydelay: TIntegerField
      FieldName = 'realdaydelay'
      ReadOnly = True
    end
    object quPostpostdaydelay: TIntegerField
      FieldName = 'postdaydelay'
      ReadOnly = True
    end
    object quPostis_stop: TStringField
      FieldName = 'is_stop'
      ReadOnly = True
      Size = 1
    end
    object quPostSET_ARTICLE_GROUP_NAME: TStringField
      FieldName = 'SET_ARTICLE_GROUP_NAME'
      Size = 2000
    end
    object quPostSET_ARTICLE_GROUP_ID: TLargeintField
      FieldName = 'SET_ARTICLE_GROUP_ID'
    end
    object quPostBUH: TIntegerField
      FieldName = 'BUH'
    end
    object quPostDAY_DELAY: TIntegerField
      FieldName = 'DAY_DELAY'
    end
    object quPostDAY_DELAY_EXT: TIntegerField
      FieldName = 'DAY_DELAY_EXT'
    end
    object quPostBuh_type_name: TStringField
      FieldName = 'Buh_type_name'
      ReadOnly = True
    end
    object quPostAddressID: TIntegerField
      FieldName = 'AddressID'
    end
  end
  object dsPost: TDataSource
    DataSet = quPost
    Left = 48
    Top = 96
  end
end
