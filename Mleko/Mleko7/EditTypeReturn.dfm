inherited EditTypeReturnForm: TEditTypeReturnForm
  Width = 366
  Height = 229
  Caption = ''
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 350
    Height = 191
    Align = alClient
    TabOrder = 0
    object DBTextTypeReturnNo: TDBText
      Left = 167
      Top = 16
      Width = 106
      Height = 13
      AutoSize = True
      DataField = 'TypeReturnNo'
      DataSource = TypeReturnForm.dsTypeReturn
    end
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 110
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1090#1080#1087#1072' '#1074#1086#1079#1074#1088#1072#1090#1072
    end
    object Label2: TLabel
      Left = 8
      Top = 49
      Width = 152
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1080#1087#1072' '#1074#1086#1079#1074#1088#1072#1090#1072
    end
    object Label3: TLabel
      Left = 11
      Top = 84
      Width = 135
      Height = 13
      Caption = #1040#1082#1090#1080#1074#1077#1085' / '#1085#1077' '#1072#1082#1090#1080#1074#1077#1085' (1/0)'
    end
    object DBEditTypeReturnName: TDBEdit
      Left = 167
      Top = 44
      Width = 177
      Height = 21
      DataField = 'TypeReturnName'
      DataSource = TypeReturnForm.dsTypeReturn
      TabOrder = 0
    end
    object DBEditActive: TDBEdit
      Left = 169
      Top = 80
      Width = 33
      Height = 21
      DataField = 'Active'
      DataSource = TypeReturnForm.dsTypeReturn
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
