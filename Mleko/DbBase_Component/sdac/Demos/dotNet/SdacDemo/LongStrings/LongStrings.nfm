inherited LongStringsFrame: TLongStringsFrame
  Width = 443
  Height = 277
  Align = alClient
  object Splitter1: TSplitter
    Left = 0
    Top = 193
    Width = 443
    Height = 2
    Cursor = crVSplit
    Align = alTop
  end
  object DBGrid: TDBGrid
    Left = 0
    Top = 25
    Width = 443
    Height = 168
    Align = alTop
    DataSource = DataSource
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object ToolBar: TPanel
    Left = 0
    Top = 0
    Width = 443
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 390
      Top = 2
      Width = 17
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object Panel1: TPanel
      Left = 1
      Top = 0
      Width = 498
      Height = 24
      BevelOuter = bvNone
      Color = clGreen
      TabOrder = 0
      object btClose: TSpeedButton
        Left = 84
        Top = 1
        Width = 82
        Height = 22
        Caption = 'Close'
        Flat = True
        Transparent = False
        OnClick = btCloseClick
      end
      object btOpen: TSpeedButton
        Left = 1
        Top = 1
        Width = 82
        Height = 22
        Caption = 'Open'
        Flat = True
        Transparent = False
        OnClick = btOpenClick
      end
      object Panel2: TPanel
        Left = 398
        Top = 1
        Width = 99
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object cbLongStrings: TCheckBox
          Left = 7
          Top = 4
          Width = 97
          Height = 17
          Caption = 'LongStrings'
          TabOrder = 0
          OnClick = cbLongStringsClick
        end
      end
      object DBNavigator: TDBNavigator
        Left = 167
        Top = 1
        Width = 230
        Height = 22
        DataSource = DataSource
        Flat = True
        TabOrder = 1
      end
    end
  end
  object meComments: TDBMemo
    Left = 0
    Top = 221
    Width = 443
    Height = 56
    Align = alClient
    DataField = 'VALUE'
    DataSource = DataSource
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object ToolBar1: TPanel
    Left = 0
    Top = 195
    Width = 443
    Height = 26
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object ToolButton2: TToolButton
      Left = 150
      Top = 2
      Width = 25
      Caption = 'ToolButton2'
      Style = tbsSeparator
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 250
      Height = 24
      BevelOuter = bvNone
      Color = clGreen
      TabOrder = 0
      object btClear: TSpeedButton
        Left = 167
        Top = 1
        Width = 82
        Height = 22
        Caption = 'Clear'
        Flat = True
        Transparent = False
        OnClick = btClearClick
      end
      object btSave: TSpeedButton
        Left = 84
        Top = 1
        Width = 82
        Height = 22
        Caption = 'Save to file'
        Flat = True
        Transparent = False
        OnClick = btSaveClick
      end
      object btLoad: TSpeedButton
        Left = 1
        Top = 1
        Width = 82
        Height = 22
        Caption = 'Load from file'
        Flat = True
        Transparent = False
        OnClick = btLoadClick
      end
    end
  end
  object DataSource: TDataSource
    DataSet = MSQuery
    Left = 440
    Top = 88
  end
  object OpenDialog: TOpenDialog
    Left = 264
    Top = 219
  end
  object SaveDialog: TSaveDialog
    Left = 296
    Top = 219
  end
  object MSQuery: TMSQuery
    Connection = SDACForm.MSConnection
    SQL.Strings = (
      'SELECT * FROM SDAC_Long_char')
    Debug = True
    FetchRows = 1
    Left = 408
    Top = 88
  end
end
