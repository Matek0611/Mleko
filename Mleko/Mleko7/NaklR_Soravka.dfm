object Spravka: TSpravka
  Left = 386
  Top = 171
  BorderStyle = bsDialog
  Caption = #1057#1087#1088#1072#1074#1082#1072
  ClientHeight = 163
  ClientWidth = 493
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object citDBGrid1: TcitDBGrid
    Left = 0
    Top = 0
    Width = 493
    Height = 163
    MarkDisabled = False
    MarkColor = clAqua
    MarkFont.Charset = DEFAULT_CHARSET
    MarkFont.Color = clNavy
    MarkFont.Height = -11
    MarkFont.Name = 'MS Sans Serif'
    MarkFont.Style = []
    LightedFont.Charset = DEFAULT_CHARSET
    LightedFont.Color = clMaroon
    LightedFont.Height = -11
    LightedFont.Name = 'MS Sans Serif'
    LightedFont.Style = []
    LightedColor = clWindow
    DisabledFont.Charset = DEFAULT_CHARSET
    DisabledFont.Color = clSilver
    DisabledFont.Height = -11
    DisabledFont.Name = 'MS Sans Serif'
    DisabledFont.Style = []
    DisabledColor = clWindow
    MultiPress = False
    EnableTitlePress = False
    MarkShortCut = 116
    SaveOnClose = True
    TitleHeight = 17
    TitleColor = clBtnFace
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'PostName'
        Title.Alignment = taCenter
        Title.Caption = #1048#1084#1103
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Set_Name'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1073#1086#1088
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Buh_type_name'
        Title.Alignment = taCenter
        Title.Caption = #1041#1091#1093' '#1090#1080#1087
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 70
        Visible = True
      end>
  end
  object SpravkaQuery: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT  pdel.id '
      ',a.PostNo'
      ',a.name as PostName'
      ',pdel.SET_ARTICLE_GROUP_NAME as Set_Name'
      
        ',(select Buh_type_name from d_buh_type where buh=pdel.BUH) as Bu' +
        'h_type_name'
      ' FROM post a INNER JOIN (select id'
      '                          ,SET_ARTICLE_GROUP_NAME'
      '                          ,BUH'
      '                          ,PostNo'
      
        '                          from v_first_free_nakl) pdel on pdel.P' +
        'ostNo=a.PostNo')
    Filtered = True
    Left = 136
    Top = 72
  end
  object DataSource1: TDataSource
    DataSet = SpravkaQuery
    Left = 208
    Top = 80
  end
end
