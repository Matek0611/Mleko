inherited MlekoEmployee0: TMlekoEmployee0
  Left = 1019
  Top = 220
  Width = 434
  Height = 334
  Caption = #1057#1087#1080#1089#1086#1082' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074' '#1076#1083#1103' '#1088#1072#1073#1086#1090#1099' '#1089' '#1090#1077#1088#1084#1080#1085#1072#1083#1072#1084#1080
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh [0]
    Left = 8
    Top = 8
    Width = 409
    Height = 225
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
  inherited ActionList: TActionList
    Left = 8
  end
  object dsEmployee: TDataSource
    Left = 48
  end
  object quEmployee: TMSQuery
    SQL.Strings = (
      'select *'
      ' from Employee')
    Left = 80
  end
end
