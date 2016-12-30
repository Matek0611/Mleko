inherited MlekoDbChekBoxListForm: TMlekoDbChekBoxListForm
  Caption = 'MlekoDbChekBoxList'
  ClientHeight = 442
  ClientWidth = 261
  DesignSize = (
    261
    442)
  PixelsPerInch = 96
  TextHeight = 13
  inherited ButtonOK: TButton
    Left = 19
    Top = 410
  end
  inherited ButtonCancel: TButton
    Left = 99
    Top = 410
  end
  inherited ButtonApply: TButton
    Left = 179
    Top = 410
  end
  inherited PageControl: TPageControl
    Width = 261
    Height = 392
    inherited TabSheet1: TTabSheet
      object CheckList: TCheckListBox
        Left = 0
        Top = 0
        Width = 253
        Height = 364
        Align = alClient
        Ctl3D = True
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier'
        Font.Style = []
        ItemHeight = 14
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  inherited ToolBar: TToolBar
    Width = 261
  end
  inherited DS: TDataSource
    Left = 184
  end
end
