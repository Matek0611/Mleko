object fmClient: TfmClient
  Left = 250
  Top = 155
  Width = 841
  Height = 523
  Caption = 'MS Data Access Demo - MIDAS Client'
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
  object DBGrid: TDBGrid
    Left = 0
    Top = 48
    Width = 833
    Height = 429
    Align = alClient
    DataSource = DataSource
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 477
    Width = 833
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 833
    Height = 48
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Panel1: TPanel
      Left = 2
      Top = 1
      Width = 499
      Height = 46
      BevelOuter = bvNone
      Color = clGreen
      TabOrder = 0
      object btCancelUpd: TSpeedButton
        Left = 416
        Top = 1
        Width = 82
        Height = 22
        Caption = 'CancelUpd'
        Flat = True
        Transparent = False
        OnClick = btCancelUpdClick
      end
      object btApplyUpd: TSpeedButton
        Left = 334
        Top = 1
        Width = 81
        Height = 22
        Caption = 'ApplyUpd'
        Flat = True
        Transparent = False
        OnClick = btApplyUpdClick
      end
      object btClose: TSpeedButton
        Left = 252
        Top = 1
        Width = 81
        Height = 22
        Caption = 'Close'
        Flat = True
        Transparent = False
        OnClick = btCloseClick
      end
      object btOpen: TSpeedButton
        Left = 167
        Top = 1
        Width = 84
        Height = 22
        Caption = 'Open'
        Flat = True
        Transparent = False
        OnClick = btOpenClick
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
      object brConnect: TSpeedButton
        Left = 1
        Top = 1
        Width = 82
        Height = 22
        Caption = 'Connect'
        Flat = True
        Transparent = False
        OnClick = brConnectClick
      end
      object DBNavigator1: TDBNavigator
        Left = 1
        Top = 24
        Width = 250
        Height = 21
        DataSource = DataSource
        Flat = True
        TabOrder = 0
      end
      object ToolBar1: TPanel
        Left = 252
        Top = 24
        Width = 246
        Height = 21
        BevelOuter = bvNone
        TabOrder = 1
        object DeptNo: TLabel
          Left = 7
          Top = 1
          Width = 71
          Height = 21
          Alignment = taCenter
          AutoSize = False
          Caption = 'EmployeeID'
          Layout = tlCenter
        end
        object edEmployeeID: TEdit
          Left = 99
          Top = 1
          Width = 121
          Height = 21
          TabOrder = 0
          Text = '10'
        end
      end
    end
  end
  object DataSource: TDataSource
    DataSet = ClientDataSet
    Left = 408
    Top = 252
  end
  object ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'EmployeeID'
        ParamType = ptInput
        Value = 10
      end>
    ProviderName = 'MSDataSetProvider'
    RemoteServer = RemoteServer
    Left = 376
    Top = 252
  end
  object RemoteServer: TDCOMConnection
    ServerGUID = '{706739B2-FB40-49CC-9041-2B82CFFC520C}'
    ServerName = 'Server.Datas'
    Left = 344
    Top = 253
  end
end
