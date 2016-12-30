inherited ServerCursorsFrame: TServerCursorsFrame
  Width = 441
  Height = 275
  Align = alClient
  object Splitter1: TSplitter
    Left = 0
    Top = 170
    Width = 441
    Height = 2
    Cursor = crVSplit
    Align = alTop
    Color = clGreen
    ParentColor = False
  end
  object DBGrid: TDBGrid
    Left = 0
    Top = 172
    Width = 441
    Height = 103
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
    Height = 90
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 570
      Height = 24
      BevelOuter = bvNone
      Color = clGreen
      TabOrder = 0
      object btOpen: TSpeedButton
        Left = 1
        Top = 1
        Width = 82
        Height = 22
        Caption = 'Open and Last'
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
      object btFillTables: TSpeedButton
        Left = 398
        Top = 1
        Width = 82
        Height = 22
        Caption = 'Fill Tables'
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
      object Panel3: TPanel
        Left = 481
        Top = 1
        Width = 88
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object edVal: TEdit
          Left = 8
          Top = 2
          Width = 73
          Height = 21
          TabOrder = 0
          Text = '1000'
        end
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 24
      Width = 570
      Height = 65
      BevelOuter = bvNone
      Color = clGreen
      TabOrder = 1
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 568
        Height = 63
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 355
          Top = 5
          Width = 91
          Height = 13
          Caption = 'Open = 0; Last = 0;'
        end
        object Label2: TLabel
          Left = 355
          Top = 23
          Width = 91
          Height = 13
          Caption = 'Open = 0; Last = 0;'
        end
        object Label3: TLabel
          Left = 355
          Top = 41
          Width = 91
          Height = 13
          Caption = 'Open = 0; Last = 0;'
        end
        object rbCientCursor1: TRadioButton
          Left = 10
          Top = 5
          Width = 330
          Height = 16
          Caption = 'Client cursor (CursorType = ctDefaultResultSet, FetchAll = True)'
          TabOrder = 0
          OnClick = rbCientCursor2Click
        end
        object rbCientCursor2: TRadioButton
          Left = 10
          Top = 23
          Width = 330
          Height = 17
          Caption = 
            'Client cursor (CursorType = ctDefaultResultSet, FetchAll = False' +
            ')'
          TabOrder = 1
          OnClick = rbCientCursor2Click
        end
        object rbServerCursor: TRadioButton
          Left = 10
          Top = 41
          Width = 330
          Height = 17
          Caption = 'Server cursor (CursorType = ctKeySet)'
          TabOrder = 2
          OnClick = rbCientCursor2Click
        end
      end
    end
  end
  object Memo: TMemo
    Left = 0
    Top = 90
    Width = 441
    Height = 80
    Align = alTop
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object DataSource: TDataSource
    DataSet = MSQuery
    Left = 278
    Top = 60
  end
  object MSQuery: TMSQuery
    Connection = SDACForm.MSConnection
    SQL.Strings = (
      'select TOP 100000 * from loaded1, loaded2')
    ReadOnly = True
    Left = 246
    Top = 60
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
    Left = 453
    Top = 28
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Cnt'
        ParamType = ptInput
        Value = 1000
      end>
  end
end
