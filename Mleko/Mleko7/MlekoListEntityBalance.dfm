inherited MlekoListEntityBalanceForm: TMlekoListEntityBalanceForm
  Left = 318
  Top = 271
  Width = 1144
  Height = 604
  Caption = 'MlekoListEntityBalanceForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TStatusBar
    Top = 558
    Width = 1136
  end
  inherited ToolBar: TToolBar
    Width = 1136
  end
  object PanelLeft: TPanel [2]
    Left = 0
    Top = 29
    Width = 437
    Height = 529
    Align = alLeft
    Caption = 'PanelLeft'
    TabOrder = 2
    object PanelDebMain: TPanel
      Left = 1
      Top = 1
      Width = 435
      Height = 527
      Align = alClient
      Caption = 'PanelGridDebMain'
      TabOrder = 0
    end
  end
  object PanelRight: TPanel [3]
    Left = 445
    Top = 29
    Width = 691
    Height = 529
    Align = alClient
    Caption = 'PanelRight'
    TabOrder = 3
    object PanelGridKredMain: TPanel
      Left = 1
      Top = 1
      Width = 689
      Height = 527
      Align = alClient
      Caption = 'PanelGridKredMain'
      TabOrder = 0
    end
  end
  object Splitter: TcxSplitter [4]
    Left = 437
    Top = 29
    Width = 8
    Height = 529
    HotZoneClassName = 'TcxSimpleStyle'
    Control = PanelLeft
    OnMoved = SplitterMoved
  end
  object PS: TcxPropertiesStore
    Components = <>
    StorageName = 'PropertiesStore'
    Left = 448
    Top = 56
  end
end
