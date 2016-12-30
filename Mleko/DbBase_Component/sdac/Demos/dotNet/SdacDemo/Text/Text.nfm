inherited TextFrame: TTextFrame
  Width = 441
  Height = 275
  Align = alClient
  object Splitter1: TSplitter
    Left = 0
    Top = 208
    Width = 441
    Height = 2
    Cursor = crVSplit
    Align = alTop
  end
  object DBGrid: TDBGrid
    Left = 0
    Top = 26
    Width = 441
    Height = 182
    Align = alTop
    DataSource = DataSource
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object ToolBar: TPanel
    Left = 0
    Top = 0
    Width = 441
    Height = 26
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object ToolButton1: TToolButton
      Left = 362
      Top = 2
      Width = 16
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 398
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
      object DBNavigator: TDBNavigator
        Left = 167
        Top = 1
        Width = 230
        Height = 22
        DataSource = DataSource
        Flat = True
        TabOrder = 0
      end
    end
  end
  object meText: TDBMemo
    Left = 0
    Top = 236
    Width = 441
    Height = 39
    Align = alClient
    DataField = 'TextField'
    DataSource = DataSource
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object ToolBar1: TPanel
    Left = 0
    Top = 210
    Width = 441
    Height = 26
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    object Panel2: TPanel
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
    Top = 32
  end
  object MSQuery: TMSQuery
    Connection = SDACForm.MSConnection
    SQL.Strings = (
      'SELECT * FROM SDAC_Text')
    Debug = True
    Left = 408
    Top = 32
  end
  object OpenDialog: TOpenDialog
    Left = 240
    Top = 259
  end
  object SaveDialog: TSaveDialog
    Left = 272
    Top = 259
  end
end
