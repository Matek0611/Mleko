inherited KassaForm: TKassaForm
  Left = 550
  Top = 621
  Width = 269
  Height = 156
  Caption = #1050#1072#1089#1089#1072
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 253
    Height = 117
    Align = alClient
    TabOrder = 0
    object lbName: TLabel
      Left = 8
      Top = 16
      Width = 76
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    end
    object lbDate: TLabel
      Left = 8
      Top = 35
      Width = 26
      Height = 13
      Caption = #1044#1072#1090#1072
    end
    object lbSummaRest: TLabel
      Left = 8
      Top = 59
      Width = 77
      Height = 13
      Caption = #1057#1091#1084#1084#1072' '#1086#1089#1090#1072#1090#1082#1072
    end
    object DBEditEhName: TDBEditEh
      Left = 112
      Top = 8
      Width = 121
      Height = 21
      DataField = 'Name'
      DataSource = dmDataModule.dsKassa
      EditButtons = <>
      TabOrder = 0
      Visible = True
    end
    object DBEditEhDate: TDBEditEh
      Left = 112
      Top = 32
      Width = 121
      Height = 21
      DataField = 'Date'
      DataSource = dmDataModule.dsKassa
      EditButtons = <>
      TabOrder = 1
      Visible = True
    end
    object DBEditEhSummaRest: TDBEditEh
      Left = 112
      Top = 56
      Width = 121
      Height = 21
      DataField = 'SummaRest'
      DataSource = dmDataModule.dsKassa
      EditButtons = <>
      TabOrder = 2
      Visible = True
    end
    object Panel2: TPanel
      Left = 1
      Top = 75
      Width = 251
      Height = 41
      Align = alBottom
      TabOrder = 3
      object btOk: TButton
        Left = 24
        Top = 8
        Width = 75
        Height = 25
        Caption = 'OK'
        ModalResult = 1
        TabOrder = 0
        OnClick = btOkClick
      end
      object btCancel: TButton
        Left = 128
        Top = 8
        Width = 75
        Height = 25
        Caption = #1054#1090#1084#1077#1085#1072
        ModalResult = 2
        TabOrder = 1
        OnClick = btCancelClick
      end
    end
  end
end
