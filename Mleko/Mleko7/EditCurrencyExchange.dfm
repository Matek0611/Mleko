inherited EditCurrencyExchangeForm: TEditCurrencyExchangeForm
  Left = 710
  Top = 313
  Width = 228
  Height = 210
  Caption = ''
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel [0]
    Left = 0
    Top = 130
    Width = 212
    Height = 41
    Align = alBottom
    TabOrder = 0
    object bbOk: TBitBtn
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
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
    object bbCancel: TBitBtn
      Left = 96
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 0
    Width = 212
    Height = 130
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 11
      Top = 15
      Width = 44
      Height = 13
      Caption = #1042#1072#1083#1102#1090#1072': '
    end
    object Label2: TLabel
      Left = 11
      Top = 39
      Width = 32
      Height = 13
      Caption = #1044#1072#1090#1072': '
    end
    object Label3: TLabel
      Left = 11
      Top = 64
      Width = 30
      Height = 13
      Caption = #1050#1091#1088#1089': '
    end
    object cbIsActive: TDBCheckBoxEh
      Left = 16
      Top = 96
      Width = 97
      Height = 17
      Caption = #1040#1082#1090#1080#1074#1085#1086#1089#1090#1100
      DataField = 'IsActive'
      DataSource = dmDataModule.dsCurrencyExchange
      TabOrder = 0
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      OnClick = cbIsActiveClick
    end
    object DBDateTimeEditEh1: TDBDateTimeEditEh
      Left = 56
      Top = 37
      Width = 121
      Height = 21
      DataField = 'DateExchange'
      DataSource = dmDataModule.dsCurrencyExchange
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 1
      Visible = True
    end
    object DBNumberEditEh1: TDBNumberEditEh
      Left = 56
      Top = 64
      Width = 121
      Height = 21
      DataField = 'Rate'
      DataSource = dmDataModule.dsCurrencyExchange
      EditButtons = <>
      TabOrder = 2
      Visible = True
    end
    object DBLookupComboboxEh1: TDBLookupComboboxEh
      Left = 56
      Top = 10
      Width = 121
      Height = 21
      DataField = 'CurrencyId'
      DataSource = dmDataModule.dsCurrencyExchange
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = dmDataModule.dsCurrency
      TabOrder = 3
      Visible = True
    end
  end
end
