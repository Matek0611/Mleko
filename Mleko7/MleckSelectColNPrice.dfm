inherited MleckSelectColNPriceForm: TMleckSelectColNPriceForm
  Left = 761
  Top = 303
  Width = 441
  Height = 326
  Caption = #1042#1099#1073#1086#1088' '#1082#1086#1083#1086#1085#1082#1080' '#1094#1077#1085#1099
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 425
    Height = 246
    Align = alClient
    TabOrder = 0
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 423
      Height = 244
      Align = alClient
      DataSource = dsSelectColNPrice
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
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 246
    Width = 425
    Height = 41
    Align = alBottom
    TabOrder = 1
    object BtOk: TButton
      Left = 56
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Ok'
      ModalResult = 1
      TabOrder = 0
    end
    object BtCancel: TButton
      Left = 152
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
  end
  object dsSelectColNPrice: TMSDataSource
    DataSet = quSelectColNPrice
    Left = 392
    Top = 8
  end
  object quSelectColNPrice: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select  lpsagp.POSTNO'
      '       ,lpsagp.COLNPRICE'
      '       ,asag.NAME'
      '       '
      ' from D_SET_ARTICLE_GROUP asag left join'
      
        '      L_POST_SET_ARTGROUP_PRICE lpsagp on lpsagp.SET_ARTICLE_GRO' +
        'UP_ID = asag.ID '
      
        '  where lpsagp.SET_ARTICLE_GROUP_ID = isnull(:SET_ARTICLE_GROUP_' +
        'ID,lpsagp.SET_ARTICLE_GROUP_ID)'
      '    and lpsagp.PostNo = isnull(:PostNo,lpsagp.PostNo)')
    Left = 392
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SET_ARTICLE_GROUP_ID'
      end
      item
        DataType = ftUnknown
        Name = 'PostNo'
      end>
  end
end
