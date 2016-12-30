inherited FetchAllFrame: TFetchAllFrame
  Width = 691
  Height = 277
  Align = alClient
  object Splitter1: TSplitter
    Left = 0
    Top = 105
    Width = 691
    Height = 2
    Cursor = crVSplit
    Align = alTop
    Color = clGreen
    ParentColor = False
  end
  object DBGrid: TDBGrid
    Left = 0
    Top = 107
    Width = 691
    Height = 170
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
    Width = 691
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Panel1: TPanel
      Left = 1
      Top = 0
      Width = 727
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
      object btFillTables: TSpeedButton
        Left = 480
        Top = 1
        Width = 82
        Height = 22
        Caption = 'Fill tables'
        Flat = True
        Transparent = False
        OnClick = btFillTablesClick
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
      object Panel2: TPanel
        Left = 398
        Top = 1
        Width = 81
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object FetchAllCB: TCheckBox
          Left = 9
          Top = 4
          Width = 70
          Height = 17
          Caption = 'FetchAll'
          TabOrder = 0
          OnClick = FetchAllCBClick
        end
      end
      object Panel3: TPanel
        Left = 563
        Top = 1
        Width = 163
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object Label1: TLabel
          Left = 6
          Top = 5
          Width = 52
          Height = 13
          Caption = 'Row count'
        end
        object edRowCount: TEdit
          Left = 68
          Top = 2
          Width = 91
          Height = 21
          TabOrder = 0
          Text = '3000'
        end
      end
    end
  end
  object Memo: TMemo
    Left = 0
    Top = 25
    Width = 691
    Height = 80
    Align = alTop
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object DataSource: TDataSource
    DataSet = MSQuery
    Left = 528
    Top = 120
  end
  object MSQuery: TMSQuery
    Connection = SDACForm.MSConnection
    SQL.Strings = (
      'select TOP 100000 * from Loaded1, Loaded2')
    ReadOnly = True
    FetchAll = False
    Left = 496
    Top = 120
  end
  object MSSQLFillTables: TMSSQL
    Connection = SDACForm.MSConnection
    SQL.Strings = (
      'declare'
      '  @i INTEGER;'
      'begin'
      '  SET @i = 0'
      '  WHILE @i <= :Cnt'
      '  BEGIN'
      '    SET @i = @i + 1'
      '    INSERT INTO Loaded1 ('
      '       Field1,'
      '       Field2,'
      '       Field3)'
      '    VALUES ('
      '       '#39'01234567890123456789'#39','
      '       '#39'12345678901234567890'#39','
      '       '#39'23456789012345678901'#39');'
      '    INSERT INTO Loaded2 ('
      '       Field1,'
      '       Field2,'
      '       Field3)'
      '    VALUES ('
      '       '#39'01234567890123456789'#39','
      '       '#39'12345678901234567890'#39','
      '       '#39'23456789012345678901'#39');'
      '  END;'
      'end;')
    CommandTimeout = 0
    Left = 525
    Top = 60
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Cnt'
        ParamType = ptInput
        Value = 1000
      end>
  end
end
