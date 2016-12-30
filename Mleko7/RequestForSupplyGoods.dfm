inherited RequestForSupplyGoodsForm: TRequestForSupplyGoodsForm
  Left = 606
  Top = 284
  Width = 923
  Height = 389
  Caption = #1055#1086#1089#1090#1072#1074#1082#1072' '#1090#1086#1074#1072#1088#1072
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 907
    Height = 309
    Align = alClient
    TabOrder = 0
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 905
      Height = 307
      Align = alClient
      DataSource = dsRequestForSupplyGoods
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
      Columns = <
        item
          EditButtons = <>
          FieldName = 'NaklNo'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'DeliveryGoodsName'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'TovarNo'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'NameTovar'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'QTY'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'Name'
          Footers = <>
        end>
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 309
    Width = 907
    Height = 41
    Align = alBottom
    TabOrder = 1
    object ExportInFile: TButton
      Left = 344
      Top = 9
      Width = 113
      Height = 25
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074' '#1092#1072#1081#1083
      TabOrder = 0
      OnClick = ExportInFileClick
    end
  end
  object dsRequestForSupplyGoods: TMSDataSource
    DataSet = quRequestForSupplyGoods
    Left = 312
  end
  object quRequestForSupplyGoods: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select   ds.NaklNo'
      '       , ds.DOC_DATE'
      '       , dog.DeliveryGoodsName'
      '       , t.TovarNo'
      '       , t.NameTovar'
      '       , ds.QTY'
      '       , p.PostNo'
      '       , p.Name'
      '       , (select convert(numeric(18,3),sum(Qty*PRICE_ECO)) '
      '           from DSPEC s inner join '
      
        #9'        TovarFromDeliveryOfGoods td on td.TovarNo = s.ARTICLE_I' +
        'D '
      #9'    where NaklNo = ds.NaklNo ) as SummaNakl'
      ' from Dspec ds left join'
      '      Tovar t on t.TovarNo = ds.ARTICLE_ID left join'
      
        '      TovarFromDeliveryOfGoods tfdog on tfdog.TovarNo = t.TovarN' +
        'o left join'
      
        '      DeliveryOfGoods dog on dog.DeliveryTovarNo = tfdog.Deliver' +
        'yTovarNo and dog.Visible = 0 left join'
      #9'  Post p on p.PostNo = ds.CONTRACTOR_ID'
      '  where ds.ENTITY_TYPE = '#39'RASHOD'#39
      '    and dog.DeliveryTovarNo = :DeliveryTovarNo'
      '&_where')
    Left = 312
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'DeliveryTovarNo'
      end>
    MacroData = <
      item
        Name = '_where'
      end>
    object quRequestForSupplyGoodsNaklNo: TIntegerField
      DisplayLabel = #8470' '#1053#1072#1082#1083#1072#1076#1085#1086#1081
      FieldName = 'NaklNo'
    end
    object quRequestForSupplyGoodsDeliveryGoodsName: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1082#1072
      DisplayWidth = 30
      FieldName = 'DeliveryGoodsName'
      Size = 50
    end
    object quRequestForSupplyGoodsTovarNo: TSmallintField
      DisplayLabel = #1050#1086#1076' '#1090#1086#1074#1072#1088#1072
      FieldName = 'TovarNo'
    end
    object quRequestForSupplyGoodsNameTovar: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
      DisplayWidth = 50
      FieldName = 'NameTovar'
      Size = 128
    end
    object quRequestForSupplyGoodsQTY: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'QTY'
    end
    object quRequestForSupplyGoodsName: TStringField
      DisplayLabel = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
      FieldName = 'Name'
      Size = 30
    end
    object quRequestForSupplyGoodsDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object quRequestForSupplyGoodsPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object quRequestForSupplyGoodsSummaNakl: TFloatField
      FieldName = 'SummaNakl'
      ReadOnly = True
    end
  end
  object sdRequestForSupply: TSaveDialog
    Left = 360
  end
end
