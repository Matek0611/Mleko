inherited MlekoPropFindTovDlg: TMlekoPropFindTovDlg
  Top = 180
  ActiveControl = edName
  Caption = #1042#1099#1073#1086#1088
  ClientHeight = 117
  PixelsPerInch = 96
  TextHeight = 13
  inherited ButtonOK: TButton
    Left = 172
    Top = 97
    Width = 72
    Height = 20
    Default = True
  end
  inherited ButtonCancel: TButton
    Left = 245
    Top = 97
    Width = 72
    Height = 20
  end
  inherited ButtonApply: TButton
    Left = 18
    Top = 97
    Width = 72
    Height = 20
    Visible = False
  end
  inherited PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 317
    Height = 96
    Align = alTop
    inherited TabSheet1: TTabSheet
      Caption = #1055#1086#1080#1089#1082' '#1090#1086#1074#1072#1088#1072
      Font.Color = clBlue
      ParentFont = False
      object edName: TLabeledEdit
        Left = 80
        Top = 10
        Width = 225
        Height = 21
        EditLabel.Width = 76
        EditLabel.Height = 13
        EditLabel.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        LabelPosition = lpLeft
        TabOrder = 0
      end
      object edVid: TLabeledEdit
        Left = 80
        Top = 39
        Width = 225
        Height = 21
        EditLabel.Width = 57
        EditLabel.Height = 13
        EditLabel.Caption = #1042#1080#1076' '#1090#1086#1074#1072#1088#1072
        LabelPosition = lpLeft
        TabOrder = 1
      end
    end
  end
  inherited ActionList: TActionList
    Left = 16
    Top = 88
  end
end
