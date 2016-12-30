inherited ConnectDialogFrame: TConnectDialogFrame
  Width = 441
  Height = 275
  Align = alClient
  object DBGrid: TDBGrid
    Left = 0
    Top = 54
    Width = 441
    Height = 221
    Align = alClient
    DataSource = DataSource
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
    Height = 54
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 398
      Height = 52
      BevelOuter = bvNone
      Color = clGreen
      TabOrder = 0
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
      object DBNavigator: TDBNavigator
        Left = 167
        Top = 1
        Width = 230
        Height = 22
        DataSource = DataSource
        Flat = True
        TabOrder = 0
      end
      object Panel3: TPanel
        Left = 1
        Top = 24
        Width = 396
        Height = 27
        BevelOuter = bvNone
        TabOrder = 1
        object rbInherited: TRadioButton
          Left = 216
          Top = 5
          Width = 113
          Height = 17
          Caption = 'Inherited connect'
          TabOrder = 0
          OnClick = rbInheritedClick
        end
        object rbMy: TRadioButton
          Left = 112
          Top = 5
          Width = 81
          Height = 17
          Caption = 'My connect'
          TabOrder = 1
          OnClick = rbMyClick
        end
        object rbDefault: TRadioButton
          Left = 8
          Top = 5
          Width = 65
          Height = 17
          Caption = 'Default'
          Checked = True
          TabOrder = 2
          TabStop = True
          OnClick = rbDefaultClick
        end
      end
    end
  end
  object DataSource: TDataSource
    DataSet = MSQuery
    Left = 464
    Top = 32
  end
  object MSQuery: TMSQuery
    Connection = SDACForm.MSConnection
    SQL.Strings = (
      'SELECT * FROM Emp')
    Left = 432
    Top = 32
  end
end
