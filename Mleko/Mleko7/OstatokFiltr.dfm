object Filter: TFilter
  Left = 815
  Top = 181
  Width = 777
  Height = 237
  Caption = 'Filter'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object FilterLabel: TLabel
    Left = 12
    Top = 161
    Width = 3
    Height = 13
  end
  object Memo1: TMemo
    Left = 8
    Top = 16
    Width = 249
    Height = 113
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 272
    Top = 8
    Width = 481
    Height = 120
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'vidname'
        Width = 218
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nabor'
        Width = 245
        Visible = True
      end>
  end
  object MSQuery1: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'Select  a.ID'
      '      , '#39'or vidname ='#39' + '#39'"'#39' + d.NAME + '#39'"'#39' as vidname'
      '      , e.NAME as nabor'
      '      , a.ARTICLE_GROUP_ID'
      '      , a.SET_ARTICLE_GROUP_ID'
      ' from  L_SET_ARTICLE_GROUP as a join '
      '       D_ARTICLE_GROUP as d on a.ARTICLE_GROUP_ID = d.ID join '
      '       D_SET_ARTICLE_GROUP as e on a.SET_ARTICLE_GROUP_ID = e.ID')
    Left = 288
    Top = 144
  end
  object DataSource1: TDataSource
    DataSet = MSQuery1
    Left = 336
    Top = 144
  end
end
