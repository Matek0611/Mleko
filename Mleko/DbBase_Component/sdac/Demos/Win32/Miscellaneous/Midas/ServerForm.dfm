object fmServer: TfmServer
  Left = 219
  Top = 210
  Width = 876
  Height = 521
  Caption = 'MS Data Access Demo - MIDAS Server'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar: TPanel
    Left = 0
    Top = 0
    Width = 868
    Height = 48
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 477
      Height = 47
      BevelOuter = bvNone
      Color = clGreen
      TabOrder = 0
      object btConnect: TSpeedButton
        Left = 1
        Top = 1
        Width = 82
        Height = 22
        Caption = 'Connect'
        Flat = True
        Transparent = False
        OnClick = btConnectClick
      end
      object btDisconnect: TSpeedButton
        Left = 84
        Top = 1
        Width = 84
        Height = 22
        Caption = 'Disconnect'
        Flat = True
        Transparent = False
        OnClick = btDisconnectClick
      end
      object btOpen: TSpeedButton
        Left = 169
        Top = 1
        Width = 82
        Height = 22
        Caption = 'Open'
        Flat = True
        Transparent = False
        OnClick = btOpenClick
      end
      object btClose: TSpeedButton
        Left = 252
        Top = 1
        Width = 80
        Height = 22
        Caption = 'Close'
        Flat = True
        Transparent = False
        OnClick = btCloseClick
      end
      object DBNavigator: TDBNavigator
        Left = 1
        Top = 24
        Width = 250
        Height = 22
        DataSource = DataSource
        Flat = True
        TabOrder = 0
      end
      object ToolBar1: TPanel
        Left = 252
        Top = 24
        Width = 224
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object ToolButton2: TToolButton
          Left = 240
          Top = 2
          Width = 25
          Caption = 'ToolButton2'
          ImageIndex = 0
          Style = tbsSeparator
        end
        object rbDSResolve: TRadioButton
          Left = 5
          Top = 0
          Width = 120
          Height = 22
          Caption = 'Resolve to Dataset'
          TabOrder = 0
          OnClick = rbDSResolveClick
        end
        object rbSQLResolve: TRadioButton
          Left = 122
          Top = -1
          Width = 104
          Height = 22
          Caption = 'Resolve by SQL'
          TabOrder = 1
          OnClick = rbSQLResolveClick
        end
      end
      object Panel2: TPanel
        Left = 333
        Top = 1
        Width = 143
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object ToolButton1: TToolButton
          Left = 240
          Top = 2
          Width = 25
          Caption = 'ToolButton2'
          ImageIndex = 0
          Style = tbsSeparator
        end
        object cbDebug: TCheckBox
          Left = 43
          Top = 0
          Width = 64
          Height = 22
          Caption = 'Debug'
          TabOrder = 0
          OnClick = cbDebugClick
        end
      end
    end
  end
  object meSQL: TMemo
    Left = 0
    Top = 48
    Width = 868
    Height = 76
    Align = alTop
    TabOrder = 1
    OnExit = meSQLExit
  end
  object DBGrid: TDBGrid
    Left = 0
    Top = 124
    Width = 868
    Height = 344
    Align = alClient
    DataSource = DataSource
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 468
    Width = 868
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object DataSource: TDataSource
    Left = 8
    Top = 64
  end
end
