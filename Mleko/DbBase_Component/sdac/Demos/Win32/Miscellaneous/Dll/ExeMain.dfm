object fmExeMain: TfmExeMain
  Left = 387
  Top = 220
  Width = 625
  Height = 336
  Caption = 'MS Data Access Demo - Application'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnToolBar: TPanel
    Left = 0
    Top = 0
    Width = 617
    Height = 48
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 2
      Top = 23
      Width = 574
      Height = 24
      BevelOuter = bvNone
      Color = clGreen
      TabOrder = 0
      object btFreeDLL: TSpeedButton
        Left = 250
        Top = 1
        Width = 82
        Height = 22
        Caption = '4. Free DLL'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        OnClick = btFreeDLLClick
      end
      object btLoadDLL: TSpeedButton
        Left = 1
        Top = 1
        Width = 82
        Height = 22
        Caption = '1. Load DLL'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        OnClick = btLoadDLLClick
      end
      object btShowForm: TSpeedButton
        Left = 84
        Top = 1
        Width = 82
        Height = 22
        Caption = '2. Show Form'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        OnClick = btShowFormClick
      end
      object btHideForms: TSpeedButton
        Left = 167
        Top = 1
        Width = 82
        Height = 22
        Caption = '3. Hide Form'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        OnClick = btHideFormsClick
      end
      object DBNavigator: TDBNavigator
        Left = 333
        Top = 1
        Width = 240
        Height = 22
        DataSource = DataSource
        Flat = True
        TabOrder = 0
      end
    end
    object Panel1: TPanel
      Left = 2
      Top = 1
      Width = 333
      Height = 24
      BevelOuter = bvNone
      Color = clGreen
      TabOrder = 1
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
        Width = 82
        Height = 22
        Caption = 'Disconnect'
        Flat = True
        Transparent = False
        OnClick = btDisconnectClick
      end
      object btOpen: TSpeedButton
        Left = 167
        Top = 1
        Width = 82
        Height = 22
        Caption = 'Open'
        Flat = True
        Transparent = False
        OnClick = btOpenClick
      end
      object btClose: TSpeedButton
        Left = 250
        Top = 1
        Width = 82
        Height = 22
        Caption = 'Close'
        Flat = True
        Transparent = False
        OnClick = btCloseClick
      end
    end
  end
  object DBGrid: TDBGrid
    Left = 0
    Top = 48
    Width = 617
    Height = 261
    Align = alClient
    DataSource = DataSource
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object MSConnection: TMSConnection
    Database = 'SDACDemos'
    Username = 'Sa'
    ConnectDialog = MSConnectDialog
    Left = 16
    Top = 88
  end
  object MSConnectDialog: TMSConnectDialog
    SavePassword = True
    Caption = 'Connect'
    UsernameLabel = 'User Name'
    PasswordLabel = 'Password'
    ServerLabel = 'Server'
    DatabaseLabel = 'Database'
    ConnectButton = 'Connect'
    CancelButton = 'Cancel'
    Left = 48
    Top = 88
  end
  object MSQuery: TMSQuery
    Connection = MSConnection
    SQL.Strings = (
      'SELECT * FROM Emp')
    Left = 16
    Top = 120
  end
  object DataSource: TDataSource
    DataSet = MSQuery
    Left = 48
    Top = 120
  end
end
