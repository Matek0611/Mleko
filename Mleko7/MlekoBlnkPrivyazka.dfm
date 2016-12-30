object Privyazka: TPrivyazka
  Left = 512
  Top = 457
  Width = 850
  Height = 291
  Caption = 'Privyazka'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 11
    Top = 160
    Width = 3
    Height = 13
  end
  object Label2: TLabel
    Left = 9
    Top = 208
    Width = 3
    Height = 13
  end
  object Memo1: TMemo
    Left = 8
    Top = 16
    Width = 273
    Height = 129
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 304
    Top = 16
    Width = 521
    Height = 145
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
        Width = 241
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nabor'
        Width = 272
        Visible = True
      end>
  end
  object MSQuery1: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'Select a.ID,'
      #39'or vidname ='#39' + '#39'"'#39' + d.NAME + '#39'"'#39' as vidname,'
      'e.NAME as nabor,'
      'a.ARTICLE_GROUP_ID,'
      'a.SET_ARTICLE_GROUP_ID'
      'from  L_SET_ARTICLE_GROUP as a'
      'join D_ARTICLE_GROUP as d '
      'on a.ARTICLE_GROUP_ID = d.ID '
      'join D_SET_ARTICLE_GROUP as e'
      'on a.SET_ARTICLE_GROUP_ID = e.ID')
    Left = 192
    Top = 160
  end
  object DataSource1: TDataSource
    DataSet = MSQuery1
    Left = 232
    Top = 160
  end
end
