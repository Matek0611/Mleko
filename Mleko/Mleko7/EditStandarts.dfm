inherited EditStandartsOfGoodsForm: TEditStandartsOfGoodsForm
  Left = 1179
  Top = 268
  Width = 346
  Caption = 'EditStandartsOfGoodsForm'
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 330
    Height = 181
    Align = alClient
    TabOrder = 0
    object DBTextStandartNo: TDBText
      Left = 152
      Top = 16
      Width = 97
      Height = 17
      DataField = 'StandartNo'
      DataSource = StandartsOfGoodsForm.dsGoodStandarts
    end
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 89
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1089#1090#1072#1085#1076#1072#1088#1090#1072
    end
    object Label2: TLabel
      Left = 8
      Top = 52
      Width = 131
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1089#1090#1072#1085#1076#1072#1088#1090#1072
    end
    object Label3: TLabel
      Left = 11
      Top = 84
      Width = 135
      Height = 13
      Caption = #1040#1082#1090#1080#1074#1077#1085' / '#1085#1077' '#1072#1082#1090#1080#1074#1077#1085' (1/0)'
    end
    object DBEditStandartName: TDBEdit
      Left = 152
      Top = 44
      Width = 177
      Height = 21
      DataField = 'StandartName'
      DataSource = StandartsOfGoodsForm.dsGoodStandarts
      TabOrder = 0
    end
    object DBEditActive: TDBEdit
      Left = 154
      Top = 80
      Width = 33
      Height = 21
      DataField = 'Active'
      DataSource = StandartsOfGoodsForm.dsGoodStandarts
      TabOrder = 1
    end
    object bbOk: TButton
      Left = 56
      Top = 152
      Width = 75
      Height = 25
      Caption = #1054#1050
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
