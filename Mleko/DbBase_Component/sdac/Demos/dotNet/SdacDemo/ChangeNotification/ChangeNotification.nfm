inherited ChangeNotificationFrame: TChangeNotificationFrame
  Width = 965
  Height = 532
  Align = alClient
  object Splitter1: TSplitter
    Left = 380
    Top = 0
    Height = 399
    Color = clBtnFace
    ParentColor = False
  end
  object Splitter2: TSplitter
    Left = 0
    Top = 399
    Width = 965
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 380
    Height = 399
    Align = alLeft
    BevelOuter = bvNone
    Color = clGreen
    TabOrder = 0
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 380
      Height = 75
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 3
        Top = 5
        Width = 260
        Height = 13
        Caption = 'Connection 1 (for tracking data modifications)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel5: TPanel
        Left = 1
        Top = 50
        Width = 250
        Height = 24
        BevelOuter = bvNone
        Color = clGreen
        TabOrder = 0
        object btClose1: TSpeedButton
          Left = 84
          Top = 1
          Width = 82
          Height = 22
          Caption = 'Close'
          Flat = True
          Transparent = False
          OnClick = btClose1Click
        end
        object btRefresh1: TSpeedButton
          Left = 167
          Top = 1
          Width = 82
          Height = 22
          Caption = 'Refresh'
          Flat = True
          Transparent = False
          OnClick = btRefresh1Click
        end
        object btOpen1: TSpeedButton
          Left = 1
          Top = 1
          Width = 82
          Height = 22
          Caption = 'Open'
          Flat = True
          Transparent = False
          OnClick = btOpen1Click
        end
      end
      object cbReadOnly: TCheckBox
        Left = 8
        Top = 26
        Width = 201
        Height = 17
        Caption = 'ReadOnly'
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = cbReadOnlyClick
      end
      object cbReflectChanges: TCheckBox
        Left = 128
        Top = 27
        Width = 107
        Height = 16
        Caption = 'Reflect changes'
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = cbReflectChangesClick
      end
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 75
      Width = 380
      Height = 324
      Align = alClient
      DataSource = DataSource1
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object Panel2: TPanel
    Left = 383
    Top = 0
    Width = 582
    Height = 399
    Align = alClient
    BevelOuter = bvNone
    Color = clGreen
    TabOrder = 1
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 582
      Height = 75
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label2: TLabel
        Left = 3
        Top = 6
        Width = 254
        Height = 13
        Caption = 'Connection 2 (for making data modifications)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel6: TPanel
        Left = 1
        Top = 50
        Width = 408
        Height = 24
        BevelOuter = bvNone
        Color = clGreen
        TabOrder = 0
        object btClose2: TSpeedButton
          Left = 84
          Top = 1
          Width = 82
          Height = 22
          Caption = 'Close'
          Flat = True
          Transparent = False
          OnClick = btClose2Click
        end
        object btOpen2: TSpeedButton
          Left = 1
          Top = 1
          Width = 82
          Height = 22
          Caption = 'Open'
          Flat = True
          Transparent = False
          OnClick = btOpen2Click
        end
        object DBNavigator2: TDBNavigator
          Left = 167
          Top = 1
          Width = 240
          Height = 22
          DataSource = DataSource2
          Flat = True
          TabOrder = 0
        end
      end
    end
    object DBGrid2: TDBGrid
      Left = 0
      Top = 75
      Width = 582
      Height = 324
      Align = alClient
      DataSource = DataSource2
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object meLog: TMemo
    Left = 0
    Top = 402
    Width = 965
    Height = 130
    Align = alBottom
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object Connection2: TMSConnection
    LoginPrompt = False
    Left = 467
    Top = 82
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 148
    Top = 82
  end
  object DataSource2: TDataSource
    DataSet = Query2
    Left = 531
    Top = 82
  end
  object Query1: TMSQuery
    SQL.Strings = (
      'select DeptNo, DName, Loc from dbo.Dept')
    Options.ReflectChangeNotify = True
    ChangeNotification = MSChangeNotification
    Left = 116
    Top = 82
  end
  object Query2: TMSQuery
    Connection = Connection2
    SQL.Strings = (
      'select * from Dept')
    Left = 499
    Top = 82
  end
  object MSChangeNotification: TMSChangeNotification
    OnChange = MSChangeNotificationChange
    Left = 84
    Top = 82
  end
end
