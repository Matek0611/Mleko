inherited MlekoListPriceForm: TMlekoListPriceForm
  Left = 195
  Top = 155
  Width = 1305
  Height = 754
  Caption = 'MlekoListPriceForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TStatusBar
    Top = 708
    Width = 1297
  end
  inherited ToolBar: TToolBar
    Width = 1297
    Visible = False
  end
  object PanelTreePrice: TPanel [2]
    Left = 0
    Top = 29
    Width = 417
    Height = 679
    Align = alLeft
    Caption = 'PanelTreePrice'
    TabOrder = 2
  end
  object PanelTovarPrice: TPanel [3]
    Left = 425
    Top = 29
    Width = 872
    Height = 679
    Align = alClient
    Caption = 'PanelTovarPrice'
    TabOrder = 3
  end
  object Splitter: TcxSplitter [4]
    Left = 417
    Top = 29
    Width = 8
    Height = 679
    HotZoneClassName = 'TcxMediaPlayer9Style'
    Control = PanelTreePrice
  end
  inherited ActionList: TActionList
    Left = 404
    Top = 8
  end
end
