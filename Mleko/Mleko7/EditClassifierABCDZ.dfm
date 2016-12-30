inherited EditClassifierABCDZForm: TEditClassifierABCDZForm
  Left = 1178
  Top = 312
  Width = 387
  Caption = 'EditClassifierABCDZForm'
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 371
    Height = 181
    Align = alClient
    TabOrder = 0
    object DBTextClassifierNo: TDBText
      Left = 184
      Top = 16
      Width = 97
      Height = 17
      DataField = 'ClassifierNo'
      DataSource = dmDataModule.dsClassifierABCDZ
    end
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 122
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1082#1083#1072#1089#1089#1080#1092#1080#1082#1072#1090#1086#1088#1072
    end
    object Label2: TLabel
      Left = 8
      Top = 46
      Width = 164
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1082#1083#1072#1089#1089#1080#1092#1080#1082#1072#1090#1086#1088#1072
    end
    object Label3: TLabel
      Left = 11
      Top = 84
      Width = 135
      Height = 13
      Caption = #1040#1082#1090#1080#1074#1077#1085' / '#1085#1077' '#1072#1082#1090#1080#1074#1077#1085' (1/0)'
    end
    object DBEditClassifierName: TDBEdit
      Left = 183
      Top = 44
      Width = 177
      Height = 21
      DataField = 'ClassifierName'
      DataSource = dmDataModule.dsClassifierABCDZ
      TabOrder = 0
    end
    object DBEditActive: TDBEdit
      Left = 184
      Top = 80
      Width = 33
      Height = 21
      DataField = 'Active'
      DataSource = dmDataModule.dsClassifierABCDZ
      TabOrder = 1
    end
    object bbOk: TButton
      Left = 56
      Top = 152
      Width = 75
      Height = 25
      Caption = #1054#1050
      ModalResult = 1
      TabOrder = 2
      OnClick = bbOkClick
    end
    object bbCancel: TButton
      Left = 184
      Top = 152
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 3
      OnClick = bbCancelClick
    end
  end
end
