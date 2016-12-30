inherited CFLMLKPropDlg: TCFLMLKPropDlg
  Left = 1164
  Top = 344
  BorderStyle = bsDialog
  Caption = 'CFLMLKPropDlg'
  ClientHeight = 330
  ClientWidth = 317
  Position = poMainFormCenter
  DesignSize = (
    317
    330)
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonOK: TButton [0]
    Left = 75
    Top = 298
    Width = 75
    Height = 25
    Action = ActionOK
    Anchors = [akRight, akBottom]
    TabOrder = 0
  end
  object ButtonCancel: TButton [1]
    Left = 155
    Top = 298
    Width = 75
    Height = 25
    Action = ActionCancel
    Anchors = [akRight, akBottom]
    Cancel = True
    ModalResult = 2
    TabOrder = 1
  end
  object ButtonApply: TButton [2]
    Left = 235
    Top = 298
    Width = 75
    Height = 25
    Action = ActionApply
    Anchors = [akRight, akBottom]
    TabOrder = 2
  end
  object PageControl: TPageControl [3]
    Left = 8
    Top = 8
    Width = 301
    Height = 280
    ActivePage = TabSheet1
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    object TabSheet1: TTabSheet
      Caption = #1057#1074#1086#1081#1089#1090#1074#1072
    end
  end
  inherited ActionList: TActionList
    Left = 8
    Top = 296
    object ActionOK: TAction
      Caption = 'OK'
      OnExecute = ActionOKExecute
    end
    object ActionCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      OnExecute = ActionCancelExecute
    end
    object ActionApply: TAction
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      OnExecute = ActionApplyExecute
    end
  end
end
