inherited TableFrame: TTableFrame
  Width = 441
  Height = 275
  Align = alClient
  object DBGrid: TDBGrid
    Left = 0
    Top = 76
    Width = 441
    Height = 199
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
    Height = 76
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Panel3: TPanel
      Left = 1
      Top = 0
      Width = 657
      Height = 75
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
      object btPrepare: TSpeedButton
        Left = 167
        Top = 1
        Width = 82
        Height = 22
        Caption = 'Prepare'
        Flat = True
        Transparent = False
        OnClick = btPrepareClick
      end
      object btUnPrepare: TSpeedButton
        Left = 250
        Top = 1
        Width = 82
        Height = 22
        Caption = 'UnPrepare'
        Flat = True
        Transparent = False
        OnClick = btUnPrepareClick
      end
      object btExecute: TSpeedButton
        Left = 333
        Top = 1
        Width = 82
        Height = 22
        Caption = 'Execute'
        Flat = True
        Transparent = False
        OnClick = btExecuteClick
      end
      object DBNavigator: TDBNavigator
        Left = 416
        Top = 1
        Width = 240
        Height = 22
        DataSource = DataSource
        Flat = True
        TabOrder = 0
      end
      object Panel7: TPanel
        Left = 416
        Top = 24
        Width = 240
        Height = 50
        BevelOuter = bvNone
        TabOrder = 1
        object Label3: TLabel
          Left = 6
          Top = 4
          Width = 53
          Height = 13
          Caption = 'OrderFields'
        end
        object edOrderFields: TEdit
          Left = 6
          Top = 20
          Width = 219
          Height = 21
          TabOrder = 0
          OnExit = edTableNameExit
        end
      end
      object Panel5: TPanel
        Left = 1
        Top = 24
        Width = 165
        Height = 50
        BevelOuter = bvNone
        TabOrder = 2
        object Label1: TLabel
          Left = 6
          Top = 4
          Width = 56
          Height = 13
          Caption = 'Table name'
        end
        object edTableName: TComboBox
          Left = 6
          Top = 20
          Width = 140
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          OnDropDown = edTableNameDropDown
          OnExit = edTableNameExit
        end
      end
      object Panel8: TPanel
        Left = 167
        Top = 24
        Width = 248
        Height = 50
        BevelOuter = bvNone
        TabOrder = 3
        object Label4: TLabel
          Left = 6
          Top = 4
          Width = 43
          Height = 13
          Caption = 'FilterSQL'
        end
        object edFilterSQL: TEdit
          Left = 6
          Top = 20
          Width = 226
          Height = 21
          TabOrder = 0
          OnExit = edTableNameExit
        end
      end
    end
  end
  object DataSource: TDataSource
    DataSet = MSTable
    Left = 128
    Top = 32
  end
  object MSTable: TMSTable
    TableName = 'Emp'
    OrderFields = 'EName'
    Connection = SDACForm.MSConnection
    Debug = True
    Left = 96
    Top = 32
  end
end
