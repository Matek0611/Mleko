inherited ThreadsFrame: TThreadsFrame
  Width = 441
  Height = 275
  Align = alClient
  object Panel3: TPanel
    Left = 0
    Top = 80
    Width = 441
    Height = 143
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Splitter2: TSplitter
      Left = 261
      Top = 0
      Height = 143
    end
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 261
      Height = 143
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object meSQL: TMemo
        Left = 0
        Top = 0
        Width = 261
        Height = 73
        Align = alTop
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object meLog: TMemo
        Left = 0
        Top = 73
        Width = 261
        Height = 70
        Align = alClient
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
    object DBGrid1: TDBGrid
      Left = 264
      Top = 0
      Width = 177
      Height = 143
      Align = alClient
      DataSource = MSDataSource
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 441
    Height = 80
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Panel5: TPanel
      Left = 0
      Top = 23
      Width = 418
      Height = 24
      BevelOuter = bvNone
      Color = clGreen
      TabOrder = 0
      object btStart: TSpeedButton
        Left = 1
        Top = 1
        Width = 82
        Height = 22
        Caption = 'Start'
        Flat = True
        Transparent = False
        OnClick = btStartClick
      end
      object btStop: TSpeedButton
        Left = 84
        Top = 1
        Width = 82
        Height = 22
        Caption = 'Stop'
        Flat = True
        Transparent = False
        OnClick = btStopClick
      end
      object btRun: TSpeedButton
        Left = 167
        Top = 1
        Width = 82
        Height = 22
        Caption = 'Run'
        Flat = True
        Transparent = False
        OnClick = btRunClick
      end
      object btRunMax: TSpeedButton
        Left = 250
        Top = 1
        Width = 83
        Height = 22
        Caption = 'RunMax'
        Flat = True
        Transparent = False
        OnClick = btRunMaxClick
      end
      object btClearLog: TSpeedButton
        Left = 334
        Top = 1
        Width = 83
        Height = 22
        Caption = 'ClearLog'
        Flat = True
        Transparent = False
        OnClick = btClearLogClick
      end
    end
    object Panel6: TPanel
      Left = 0
      Top = 0
      Width = 418
      Height = 24
      BevelOuter = bvNone
      Color = clGreen
      TabOrder = 1
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
      object btDeleteAll: TSpeedButton
        Left = 84
        Top = 1
        Width = 82
        Height = 22
        Caption = 'Delete All'
        Flat = True
        Transparent = False
        OnClick = btDeleteAllClick
      end
      object DBNavigator1: TDBNavigator
        Left = 167
        Top = 1
        Width = 250
        Height = 22
        Flat = True
        TabOrder = 0
      end
    end
    object Panel11: TPanel
      Left = 417
      Top = 0
      Width = 244
      Height = 47
      BevelOuter = bvNone
      Color = clGreen
      TabOrder = 2
      object Panel10: TPanel
        Left = 1
        Top = 1
        Width = 120
        Height = 45
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 5
          Top = 23
          Width = 92
          Height = 16
          Caption = 'Thread count'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 5
          Top = 2
          Width = 89
          Height = 16
          Caption = 'Except count'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbThreadCount: TLabel
          Left = 104
          Top = 23
          Width = 9
          Height = 16
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbExceptCount: TLabel
          Left = 104
          Top = 2
          Width = 9
          Height = 16
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object Panel12: TPanel
        Left = 122
        Top = 1
        Width = 121
        Height = 45
        BevelOuter = bvNone
        TabOrder = 1
        object lbInterval: TLabel
          Left = 57
          Top = 23
          Width = 6
          Height = 13
          Caption = '0'
        end
        object lbTime: TLabel
          Left = 57
          Top = 2
          Width = 6
          Height = 13
          Caption = '0'
        end
        object Label5: TLabel
          Left = 6
          Top = 2
          Width = 23
          Height = 13
          Caption = 'Time'
        end
        object Label6: TLabel
          Left = 6
          Top = 23
          Width = 35
          Height = 13
          Caption = 'Interval'
        end
      end
    end
    object Panel13: TPanel
      Left = 0
      Top = 46
      Width = 342
      Height = 30
      BevelOuter = bvNone
      Color = clGreen
      TabOrder = 3
      object Panel14: TPanel
        Left = 1
        Top = 1
        Width = 164
        Height = 28
        BevelOuter = bvNone
        TabOrder = 0
        object Label3: TLabel
          Left = 6
          Top = 6
          Width = 54
          Height = 13
          Caption = 'MaxThread'
        end
        object edCount: TEdit
          Left = 68
          Top = 3
          Width = 89
          Height = 21
          TabOrder = 0
          Text = 'edCount'
          OnChange = edCountChange
        end
      end
      object Panel9: TPanel
        Left = 166
        Top = 1
        Width = 175
        Height = 28
        BevelOuter = bvNone
        TabOrder = 1
        object Label4: TLabel
          Left = 7
          Top = 7
          Width = 27
          Height = 13
          Caption = 'Mode'
        end
        object rbInsert: TRadioButton
          Left = 41
          Top = 6
          Width = 63
          Height = 17
          Caption = 'INSERT'
          TabOrder = 0
          OnClick = rgModeClick
        end
        object rbSelect: TRadioButton
          Left = 105
          Top = 6
          Width = 81
          Height = 17
          Caption = 'SELECT'
          TabOrder = 1
          OnClick = rgModeClick
        end
      end
    end
  end
  object meErrorLog: TMemo
    Left = 0
    Top = 223
    Width = 441
    Height = 52
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object Timer: TTimer
    Enabled = False
    OnTimer = TimerTimer
    Left = 48
    Top = 80
  end
  object MSDataSource: TDataSource
    DataSet = MSQuery
    Left = 48
    Top = 112
  end
  object scDeleteAll: TMSSQL
    Connection = SDACForm.MSConnection
    SQL.Strings = (
      'DELETE FROM ThreadTable')
    Debug = True
    CommandTimeout = 0
    Left = 116
    Top = 113
  end
  object MSQuery: TMSQuery
    Connection = SDACForm.MSConnection
    SQL.Strings = (
      'SELECT * FROM ThreadTable')
    Left = 16
    Top = 112
  end
end
