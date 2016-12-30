inherited CFLMLKPropDbDlg: TCFLMLKPropDbDlg
  Caption = 'CFLMLKPropDbDlg'
  ClientHeight = 338
  KeyPreview = True
  DesignSize = (
    317
    338)
  PixelsPerInch = 96
  TextHeight = 13
  inherited ButtonOK: TButton
    Left = 109
    Top = 314
    Width = 68
    Height = 23
  end
  inherited ButtonCancel: TButton
    Left = 179
    Top = 314
    Width = 68
    Height = 23
  end
  inherited ButtonApply: TButton
    Left = 249
    Top = 314
    Width = 68
    Height = 23
  end
  inherited PageControl: TPageControl
    Left = 0
    Top = 24
    Width = 317
    Height = 285
    Align = alTop
  end
  object ToolBar: TToolBar [4]
    Left = 0
    Top = 0
    Width = 317
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
      Action = ActionEditDlg
    end
  end
  inherited ActionList: TActionList
    Left = 184
    Top = 2
    object ActionDebugAll: TAction
      Caption = 'ActionDebugAll'
      ShortCut = 57412
      OnExecute = ActionDebugAllExecute
    end
    object ActionShowContextValues: TAction
      Caption = 'ActionShowContextValues'
      ShortCut = 57411
    end
    object ActionViewEditTollBar: TAction
      Caption = 'ActionViewEditTollBar'
      ShortCut = 49221
      OnExecute = ActionViewEditTollBarExecute
    end
    object ActionEditDlg: TAction
      Caption = 'ActionEditDlg'
      ImageIndex = 1
      OnExecute = ActionEditDlgExecute
    end
  end
  object Query: TMSQuery
    AfterInsert = QueryAfterInsert
    AfterEdit = QueryAfterEdit
    Options.StrictUpdate = False
    Left = 216
  end
  object DS: TDataSource
    DataSet = Query
    Left = 244
  end
  object quCMD: TMSQuery
    AfterInsert = QueryAfterInsert
    AfterEdit = QueryAfterEdit
    Options.StrictUpdate = False
    Left = 272
  end
end
