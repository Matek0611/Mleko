inherited LoaderFrame: TLoaderFrame
  Width = 443
  Height = 277
  Align = alClient
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 443
    Height = 64
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object ToolBar: TPanel
      Left = 1
      Top = 1
      Width = 586
      Height = 62
      BevelOuter = bvNone
      Color = clGreen
      TabOrder = 0
      object btOpen: TSpeedButton
        Left = 1
        Top = 1
        Width = 85
        Height = 24
        Caption = 'Open'
        Flat = True
        Transparent = False
        OnClick = btOpenClick
      end
      object btClose: TSpeedButton
        Left = 87
        Top = 1
        Width = 85
        Height = 24
        Caption = 'Close'
        Flat = True
        Transparent = False
        OnClick = btCloseClick
      end
      object btLoad: TSpeedButton
        Left = 173
        Top = 1
        Width = 85
        Height = 24
        Caption = 'Load'
        Flat = True
        Transparent = False
        OnClick = btLoadClick
      end
      object btDeleteAll: TSpeedButton
        Left = 259
        Top = 1
        Width = 85
        Height = 24
        Caption = 'Delete All'
        Flat = True
        Transparent = False
        OnClick = btDeleteAllClick
      end
      object DBNavigator: TDBNavigator
        Left = 345
        Top = 1
        Width = 240
        Height = 24
        DataSource = DataSource
        Flat = True
        TabOrder = 0
      end
      object Panel1: TPanel
        Left = 1
        Top = 26
        Width = 171
        Height = 35
        BevelOuter = bvNone
        TabOrder = 1
        object Label1: TLabel
          Left = 6
          Top = 14
          Width = 49
          Height = 13
          Caption = 'Load rows'
        end
        object edRows: TEdit
          Left = 66
          Top = 10
          Width = 87
          Height = 21
          TabOrder = 0
          Text = '1000'
        end
      end
      object Panel3: TPanel
        Left = 173
        Top = 26
        Width = 412
        Height = 35
        BevelOuter = bvNone
        TabOrder = 2
        object rgEvent: TRadioGroup
          Left = 9
          Top = -1
          Width = 225
          Height = 32
          Columns = 2
          Items.Strings = (
            'GetColumnData'
            'PutData')
          TabOrder = 0
          OnClick = rgEventClick
        end
      end
    end
  end
  object DBGrid: TDBGrid
    Left = 0
    Top = 64
    Width = 443
    Height = 213
    Align = alClient
    DataSource = DataSource
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DataSource: TDataSource
    DataSet = Query
    Left = 440
    Top = 64
  end
  object Query: TMSQuery
    Connection = SDACForm.MSConnection
    SQL.Strings = (
      'SELECT * FROM Sdac_Loaded ORDER BY CODE')
    AfterOpen = QueryAfterOpen
    BeforeClose = QueryBeforeClose
    AfterRefresh = QueryAfterOpen
    Left = 408
    Top = 64
  end
  object MSLoader: TMSLoader
    Connection = SDACForm.MSConnection
    TableName = 'Sdac_Loaded'
    Columns = <
      item
        Name = 'Code'
        FieldType = ftInteger
        Size = 0
      end
      item
        Name = 'Num'
        FieldType = ftInteger
        Size = 0
      end
      item
        Name = 'Num1'
        FieldType = ftFloat
        Size = 0
        Precision = 15
      end
      item
        Name = 'Str'
        Size = 50
      end
      item
        Name = 'Dat'
        FieldType = ftDateTime
        Size = 0
      end>
    OnGetColumnData = MSLoaderGetColumnData
    Left = 408
    Top = 96
  end
  object TruncCommand: TMSSQL
    Connection = SDACForm.MSConnection
    SQL.Strings = (
      'TRUNCATE TABLE SDAC_Loaded')
    CommandTimeout = 0
    Left = 408
    Top = 128
  end
end
