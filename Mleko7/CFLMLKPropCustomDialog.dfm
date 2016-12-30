inherited CFLMLKPropCustomDialogDlg: TCFLMLKPropCustomDialogDlg
  Left = 1167
  Top = 567
  Caption = 'CFLMLKPropCustomDialogDlg'
  ClientHeight = 122
  ClientWidth = 310
  DesignSize = (
    310
    122)
  PixelsPerInch = 96
  TextHeight = 13
  inherited ButtonOK: TButton
    Left = 81
    Top = 99
    Height = 23
  end
  inherited ButtonCancel: TButton
    Left = 157
    Top = 99
    Height = 23
  end
  inherited ButtonApply: TButton
    Left = 233
    Top = 99
    Height = 23
  end
  inherited PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 308
    Height = 98
  end
  object ToolBar: TToolBar [4]
    Left = 0
    Top = 0
    Width = 310
    Height = 24
    AutoSize = True
    Caption = 'ToolBar'
    Flat = True
    Images = dmDataModule.ImageListToolBar
    TabOrder = 4
    Visible = False
    object BtnEditDlg: TToolButton
      Left = 0
      Top = 0
      Action = ActionViewAddSQL
    end
    object ToolBtnAdd: TToolButton
      Left = 23
      Top = 0
      Action = ActionViewEditSQL
    end
  end
  inherited ActionList: TActionList
    Left = 96
    Top = 8
    object ActionViewAddSQL: TAction
      Caption = 'ActionViewAddSQL'
      ImageIndex = 36
    end
    object ActionViewEditSQL: TAction
      Caption = 'ActionViewEditSQL'
      ImageIndex = 1
    end
    object ActionViewSysToolBar: TAction
      Caption = 'ActionViewSysToolBar'
      ShortCut = 49221
      OnExecute = ActionViewSysToolBarExecute
    end
  end
  object quAddBegParam: TMSQuery
    Connection = dmDataModule.DB
    Left = 200
    Top = 8
  end
  object quUpdBegParam: TMSQuery
    Connection = dmDataModule.DB
    Left = 232
    Top = 8
  end
  object spUpd: TMSStoredProc
    Connection = dmDataModule.DB
    Left = 128
    Top = 8
  end
  object spAdd: TMSStoredProc
    Connection = dmDataModule.DB
    Left = 160
    Top = 8
  end
end
