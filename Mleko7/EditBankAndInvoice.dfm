inherited EditBankAndInvoiceForm: TEditBankAndInvoiceForm
  Left = 1012
  Top = 234
  Width = 566
  Height = 329
  Caption = 'EditBankAndInvoiceForm'
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 550
    Height = 249
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 0
      Top = 16
      Width = 25
      Height = 13
      Caption = #1041#1072#1085#1082
    end
    object Label2: TLabel
      Left = 0
      Top = 48
      Width = 23
      Height = 13
      Caption = #1057#1095#1077#1090
    end
    object Label3: TLabel
      Left = 0
      Top = 80
      Width = 107
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1089#1095#1077#1090#1072
    end
    object Label4: TLabel
      Left = 0
      Top = 144
      Width = 26
      Height = 13
      Caption = #1044#1072#1090#1072
    end
    object Label5: TLabel
      Left = 0
      Top = 176
      Width = 77
      Height = 13
      Caption = #1057#1091#1084#1084#1072' '#1086#1089#1090#1072#1090#1082#1072
    end
    object Label6: TLabel
      Left = 292
      Top = 13
      Width = 28
      Height = 13
      Caption = #1052#1060#1054
    end
    object Label7: TLabel
      Left = 197
      Top = 13
      Width = 31
      Height = 13
      Caption = #1054#1050#1055#1054
    end
    object Label8: TLabel
      Left = 0
      Top = 112
      Width = 81
      Height = 13
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1089#1095#1077#1090#1072
    end
    object DBCheckBoxEhIsMain: TDBCheckBoxEh
      Left = 8
      Top = 216
      Width = 97
      Height = 17
      Caption = #1054#1089#1085#1086#1074#1085#1086#1081
      DataField = 'IsMain'
      DataSource = dmDataModule.dsBanks
      TabOrder = 0
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      OnExit = DBCheckBoxEhIsMainExit
    end
    object DBEditEhNAME: TDBEditEh
      Left = 40
      Top = 8
      Width = 153
      Height = 21
      DataField = 'NAME'
      DataSource = dmDataModule.dsBanks
      EditButtons = <>
      TabOrder = 1
      Visible = True
    end
    object DBEditEhOKPO: TDBEditEh
      Left = 232
      Top = 8
      Width = 57
      Height = 21
      DataField = 'OKPO'
      DataSource = dmDataModule.dsBanks
      EditButtons = <>
      TabOrder = 2
      Visible = True
    end
    object DBEditEhMFO: TDBEditEh
      Left = 328
      Top = 8
      Width = 57
      Height = 21
      DataField = 'MFO'
      DataSource = dmDataModule.dsBanks
      EditButtons = <>
      TabOrder = 3
      Visible = True
    end
    object DBEditEhinvoice_num: TDBEditEh
      Left = 40
      Top = 40
      Width = 121
      Height = 21
      DataField = 'invoice_num'
      DataSource = dmDataModule.dsBanks
      EditButtons = <>
      TabOrder = 4
      Visible = True
    end
    object DBEditEhName_Invoice: TDBEditEh
      Left = 112
      Top = 72
      Width = 121
      Height = 21
      DataField = 'Name_Invoice'
      DataSource = dmDataModule.dsBanks
      EditButtons = <>
      TabOrder = 5
      Visible = True
    end
    object DBEditEhDescription: TDBEditEh
      Left = 96
      Top = 112
      Width = 121
      Height = 21
      DataField = 'Description'
      DataSource = dmDataModule.dsBanks
      EditButtons = <>
      TabOrder = 6
      Visible = True
    end
    object DBEditEhDate: TDBEditEh
      Left = 48
      Top = 141
      Width = 121
      Height = 21
      DataField = 'Date'
      DataSource = dmDataModule.dsBanks
      EditButtons = <>
      TabOrder = 7
      Visible = True
    end
    object DBEditEhSummaRest: TDBEditEh
      Left = 88
      Top = 176
      Width = 121
      Height = 21
      DataField = 'SummaRest'
      DataSource = dmDataModule.dsBanks
      EditButtons = <>
      TabOrder = 8
      Visible = True
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 249
    Width = 550
    Height = 41
    Align = alBottom
    TabOrder = 1
    object bbOk: TBitBtn
      Left = 144
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Yes'
      Default = True
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
      Left = 232
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
  end
  inherited ActionList: TActionList
    Left = 472
  end
end
