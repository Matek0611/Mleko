inherited MlekoSelectEntityTypeFromCloseReturnForm: TMlekoSelectEntityTypeFromCloseReturnForm
  Left = 566
  Top = 342
  Width = 292
  Height = 167
  Caption = #1042#1099#1073#1086#1088' '#1074#1079#1072#1080#1084#1086#1079#1072#1095#1077#1090#1072
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 276
    Height = 87
    Align = alClient
    TabOrder = 0
    object rbNaklR: TRadioButton
      Left = 48
      Top = 16
      Width = 153
      Height = 17
      Caption = #1042#1086#1079#1074#1088#1072#1090#1085#1099#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
      Checked = True
      TabOrder = 0
      TabStop = True
      OnKeyDown = rbNaklRKeyDown
    end
    object rbPlatP: TRadioButton
      Tag = 1
      Left = 48
      Top = 40
      Width = 113
      Height = 17
      Caption = #1055#1088#1080#1093#1086#1076#1099' '#1076#1077#1085#1077#1075
      TabOrder = 1
      OnKeyDown = rbPlatPKeyDown
    end
    object rbNaklP: TRadioButton
      Left = 48
      Top = 64
      Width = 145
      Height = 17
      Caption = #1055#1088#1080#1093#1086#1076#1085#1099#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
      TabOrder = 2
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 87
    Width = 276
    Height = 41
    Align = alBottom
    TabOrder = 1
    object bOk: TButton
      Tag = 2
      Left = 24
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1082
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Tag = 3
      Left = 120
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
  end
end
