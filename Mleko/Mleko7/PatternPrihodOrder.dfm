inherited PatternPrihodOrderForm: TPatternPrihodOrderForm
  Left = 1030
  Top = 217
  Width = 303
  Height = 369
  Caption = #1057#1091#1097#1077#1089#1090#1074#1091#1102#1097#1080#1077' '#1096#1072#1073#1083#1086#1085#1099
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox [0]
    Left = 0
    Top = 0
    Width = 287
    Height = 331
    Align = alClient
    Caption = #1064#1072#1073#1083#1086#1085#1099
    TabOrder = 0
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 15
      Width = 283
      Height = 273
      Align = alClient
      DataSource = dsListShablonName
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
      OnKeyDown = DBGridEh1KeyDown
    end
    object Panel1: TPanel
      Left = 2
      Top = 288
      Width = 283
      Height = 41
      Align = alBottom
      TabOrder = 1
      object bbOK: TBitBtn
        Left = 40
        Top = 8
        Width = 77
        Height = 25
        Caption = #1054#1050
        ModalResult = 1
        TabOrder = 0
        OnClick = bbOKClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
      object bbcancel: TBitBtn
        Left = 164
        Top = 9
        Width = 77
        Height = 25
        Caption = #1054#1090#1084#1077#1085#1072
        TabOrder = 1
        OnClick = bbcancelClick
        Kind = bkCancel
      end
    end
  end
  object quListShablonName: TMSQuery
    SQLDelete.Strings = (
      'delete PrihodOrderShablon'
      'where NameShablon = :NameShablon')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select distinct /*ShablonNo,*/ NameShablon '
      ' from PrihodOrderShablon '
      '  where NameShablon is not null')
    Left = 1120
    Top = 32
    object quListShablonNameNameShablon: TStringField
      FieldName = 'NameShablon'
      Size = 30
    end
  end
  object dsListShablonName: TMSDataSource
    DataSet = quListShablonName
    Left = 1080
    Top = 32
  end
end
