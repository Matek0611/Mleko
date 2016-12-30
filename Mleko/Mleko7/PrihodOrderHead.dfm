inherited PrihodOrderHeadForm: TPrihodOrderHeadForm
  Left = 518
  Top = 481
  Width = 932
  Height = 390
  Caption = #1055#1088#1080#1093#1086#1076#1085#1099#1077' '#1079#1072#1082#1072#1079#1099
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel [0]
    Left = 0
    Top = 29
    Width = 916
    Height = 262
    Align = alClient
    TabOrder = 3
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 914
      Height = 260
      Align = alClient
      DataSource = dsPrihodOrderHead
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGridEh1DblClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'Id'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'OrderNo'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'OrderDate'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'PostNo'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'PostName'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'Buh'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'BuhName'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'Summa'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'DocType'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'DocTypeName'
          Footers = <>
          Width = 193
        end
        item
          EditButtons = <>
          FieldName = 'AnalisDateBeg'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'AnalisDateEnd'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'UserNo'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'UserName'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'EditUserNo'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'EditUserName'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'EditOrderDate'
          Footers = <>
        end>
    end
  end
  object Panel3: TPanel [1]
    Left = 0
    Top = 291
    Width = 916
    Height = 41
    Align = alBottom
    TabOrder = 1
  end
  inherited StatusBar: TStatusBar
    Top = 332
    Width = 916
  end
  inherited ToolBar: TToolBar
    Width = 916
    TabOrder = 0
    object NewPrihodOrder: TToolButton
      Left = 0
      Top = 0
      Hint = #1053#1086#1074#1099#1081' '#1079#1072#1082#1072#1079
      ImageIndex = 0
      OnClick = NewPrihodOrderClick
    end
    object EditPrihodOrder: TToolButton
      Left = 23
      Top = 0
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088'/'#1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      ImageIndex = 1
      OnClick = EditPrihodOrderClick
    end
    object DelPrihodOrder: TToolButton
      Left = 46
      Top = 0
      Hint = #1059#1076#1072#1083#1077#1085#1080#1077
      Caption = 'DelPrihodOrder'
      ImageIndex = 2
      OnClick = DelPrihodOrderClick
    end
    object Refresh: TToolButton
      Left = 69
      Top = 0
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      Caption = 'Refresh'
      ImageIndex = 3
      OnClick = RefreshClick
    end
    object ExitForm: TToolButton
      Left = 92
      Top = 0
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
      Caption = 'ExitForm'
      ImageIndex = 45
      OnClick = ExitFormClick
    end
  end
  inherited ActionList: TActionList
    Left = 256
  end
  object dsPrihodOrderHead: TMSDataSource
    DataSet = quPrihodOrderHead
    Left = 736
    Top = 97
  end
  object quPrihodOrderHead: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select  epoh.Id'
      '       ,epoh.OrderNo'
      '       ,epoh.OrderDate'
      '       ,epoh.PostNo'
      '       ,p.Name as PostName'
      '       ,epoh.Buh'#9
      '       ,dbt.Buh_type_name as BuhName'
      '       ,epoh.Summa'
      '       ,rtrim(ltrim(epoh.Doc_Type)) as DocType'
      '       ,ddt.name as DocTypeName'
      '       ,epoh.AnalisDateBeg'
      '       ,epoh.AnalisDateEnd'
      '       ,epoh.UserNo'
      '       ,u.UserName'
      '       ,epoh.EditUserNo'
      
        '       ,(select UserName from Users where UserNo = epoh.EditUser' +
        'No) as EditUserName'
      '       ,epoh.EditOrderDate'
      '       ,epoh.Pkey'
      ' from E_PrihodOrderHead epoh left join'
      '      Post p on p.PostNo = epoh.PostNo left join'
      #9'  Users u on u.UserNo = epoh.UserNo left join'
      #9'  d_buh_type dbt on dbt.buh = epoh.Buh left join'
      #9'  d_doc_type ddt on ddt.ID = epoh.Doc_Type'
      '  where &_where'
      '    and epoh.OurFirmNo = (select PostNo from d_our_firm)')
    Left = 800
    Top = 105
    MacroData = <
      item
        Name = '_where'
        Value = '0=1'
      end>
    object quPrihodOrderHeadId: TIntegerField
      FieldName = 'Id'
      ReadOnly = True
    end
    object quPrihodOrderHeadOrderNo: TIntegerField
      FieldName = 'OrderNo'
    end
    object quPrihodOrderHeadOrderDate: TDateTimeField
      FieldName = 'OrderDate'
    end
    object quPrihodOrderHeadPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object quPrihodOrderHeadPostName: TStringField
      FieldName = 'PostName'
      Size = 30
    end
    object quPrihodOrderHeadBuh: TSmallintField
      FieldName = 'Buh'
    end
    object quPrihodOrderHeadBuhName: TStringField
      FieldName = 'BuhName'
    end
    object quPrihodOrderHeadSumma: TFloatField
      FieldName = 'Summa'
    end
    object quPrihodOrderHeadDocTypeName: TStringField
      FieldName = 'DocTypeName'
      Size = 256
    end
    object quPrihodOrderHeadAnalisDateBeg: TDateTimeField
      FieldName = 'AnalisDateBeg'
    end
    object quPrihodOrderHeadAnalisDateEnd: TDateTimeField
      FieldName = 'AnalisDateEnd'
    end
    object quPrihodOrderHeadUserNo: TIntegerField
      FieldName = 'UserNo'
    end
    object quPrihodOrderHeadUserName: TStringField
      FieldName = 'UserName'
    end
    object quPrihodOrderHeadEditUserNo: TIntegerField
      FieldName = 'EditUserNo'
    end
    object quPrihodOrderHeadEditUserName: TStringField
      FieldName = 'EditUserName'
      ReadOnly = True
    end
    object quPrihodOrderHeadEditOrderDate: TDateTimeField
      FieldName = 'EditOrderDate'
    end
    object quPrihodOrderHeadDocType: TStringField
      FieldName = 'DocType'
      ReadOnly = True
      Size = 12
    end
    object quPrihodOrderHeadPkey: TLargeintField
      FieldName = 'Pkey'
    end
  end
end
