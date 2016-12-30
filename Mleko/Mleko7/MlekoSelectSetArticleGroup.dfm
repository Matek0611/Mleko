inherited MlekoSelectSetArticleGroupForm: TMlekoSelectSetArticleGroupForm
  Left = 705
  Top = 288
  Width = 462
  Height = 295
  Caption = #1053#1072#1073#1086#1088' '#1086#1090#1089#1088#1086#1095#1082#1080
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 446
    Height = 215
    Align = alClient
    TabOrder = 0
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 444
      Height = 213
      Align = alClient
      DataSource = dsSetArtGroupDelay
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
    Top = 215
    Width = 446
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btOk: TButton
      Left = 112
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1082
      ModalResult = 1
      TabOrder = 0
    end
    object BtCancel: TButton
      Left = 232
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
  end
  object dsSetArtGroupDelay: TMSDataSource
    DataSet = quSetArtGroupDelay
    Left = 408
    Top = 8
  end
  object quSetArtGroupDelay: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select  asag.id'
      '       ,asag.NAME'
      '       ,dbt.Buh_type_name'
      '       ,lpsagd.DAY_DELAY'
      '       ,lpsagd.DAY_DELAY_EXT'
      '       ,lpsagd.DAY_DELAY + lpsagd.DAY_DELAY_EXT as MainDayDelay '
      ' from D_SET_ARTICLE_GROUP asag left join'
      
        '      L_POST_SET_ARTGROUP_DELAY lpsagd on lpsagd.SET_ARTICLE_GRO' +
        'UP_ID = asag.ID left join'
      '      d_buh_type dbt on dbt.buh = lpsagd.BUH'
      
        '  where lpsagd.SET_ARTICLE_GROUP_ID = isnull(:SET_ARTICLE_GROUP_' +
        'ID,lpsagd.SET_ARTICLE_GROUP_ID)'
      '    and lpsagd.BUH = isnull(:Buh,lpsagd.BUH)'
      '    and lpsagd.PostNo = isnull(:PostNo,lpsagd.PostNo)')
    Left = 408
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SET_ARTICLE_GROUP_ID'
      end
      item
        DataType = ftUnknown
        Name = 'Buh'
      end
      item
        DataType = ftUnknown
        Name = 'PostNo'
      end>
  end
end
