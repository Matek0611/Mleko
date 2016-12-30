object fmMain: TfmMain
  Left = 271
  Top = 274
  Width = 814
  Height = 600
  Caption = 'MS SQL Data Access Demos - SDAC performance'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 631
    Top = 66
    Height = 507
    Align = alRight
  end
  object Chart: TChart
    Left = 0
    Top = 66
    Width = 631
    Height = 507
    BackWall.Brush.Color = clWhite
    BackWall.Color = clSilver
    Gradient.EndColor = 12615808
    MarginBottom = 2
    MarginLeft = 2
    MarginRight = 2
    Title.Text.Strings = (
      'SDAC Performance')
    BackColor = clSilver
    BottomAxis.Automatic = False
    BottomAxis.AutomaticMaximum = False
    BottomAxis.AutomaticMinimum = False
    BottomAxis.ExactDateTime = False
    BottomAxis.Maximum = 5.000000000000000000
    BottomAxis.Title.Caption = 'record count'
    Chart3DPercent = 20
    LeftAxis.Title.Caption = 'seconds'
    MaxPointsPerPage = 10
    TopAxis.Automatic = False
    TopAxis.AutomaticMaximum = False
    TopAxis.AutomaticMinimum = False
    TopAxis.Visible = False
    View3D = False
    View3DOptions.Elevation = 360
    View3DOptions.Perspective = 100
    View3DOptions.Rotation = 354
    View3DOptions.Zoom = 99
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvLowered
    TabOrder = 0
    object Series1: TLineSeries
      HorizAxis = aBothHorizAxis
      Marks.ArrowLength = 8
      Marks.BackColor = clRed
      Marks.Style = smsValue
      Marks.Visible = True
      SeriesColor = clRed
      Title = 'SDAC'
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
    object Series2: TLineSeries
      Marks.ArrowLength = 8
      Marks.BackColor = clGreen
      Marks.Style = smsValue
      Marks.Visible = True
      SeriesColor = clGreen
      Title = 'BDE'
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
    object Series3: TLineSeries
      Marks.ArrowLength = 20
      Marks.Style = smsValue
      Marks.Visible = True
      SeriesColor = clYellow
      Title = 'ADO'
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
    object Series4: TLineSeries
      Marks.ArrowLength = 20
      Marks.BackColor = clBlue
      Marks.Style = smsValue
      Marks.Visible = True
      SeriesColor = clBlue
      Title = 'dbExpress'
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
    object Series5: TLineSeries
      Marks.ArrowLength = 20
      Marks.BackColor = clFuchsia
      Marks.Style = smsValue
      Marks.Visible = True
      SeriesColor = clFuchsia
      Title = 'dbExpSda'
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
  end
  object Tollbar: TPanel
    Left = 0
    Top = 0
    Width = 806
    Height = 66
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 352
      Top = 37
      Width = 83
      Height = 13
      Caption = 'Fetch Block Size:'
      Layout = tlCenter
    end
    object lbSDAC: TLabel
      Left = 27
      Top = 50
      Width = 8
      Height = 13
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbBDE: TLabel
      Left = 87
      Top = 50
      Width = 8
      Height = 13
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbADO: TLabel
      Left = 139
      Top = 50
      Width = 8
      Height = 13
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbdbExpress: TLabel
      Left = 191
      Top = 50
      Width = 8
      Height = 13
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 154
      Top = 0
      Width = 2
      Height = 25
    end
    object Bevel2: TBevel
      Left = 639
      Top = 0
      Width = 2
      Height = 25
    end
    object Bevel3: TBevel
      Left = 0
      Top = 24
      Width = 800
      Height = 2
    end
    object Bevel4: TBevel
      Left = 0
      Top = 64
      Width = 800
      Height = 2
    end
    object Bevel5: TBevel
      Left = 334
      Top = 26
      Width = 2
      Height = 39
    end
    object lbdbExpSda: TLabel
      Left = 263
      Top = 50
      Width = 8
      Height = 13
      Caption = '0'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clFuchsia
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object btFetchTest: TButton
      Left = 160
      Top = 0
      Width = 75
      Height = 25
      Caption = 'Fetch Test'
      TabOrder = 0
      OnClick = btFetchTestClick
    end
    object btConnect: TButton
      Left = 0
      Top = 0
      Width = 75
      Height = 25
      Caption = 'Connect'
      TabOrder = 1
      OnClick = btConnectClick
    end
    object btDisconnect: TButton
      Left = 75
      Top = 0
      Width = 75
      Height = 25
      Caption = 'Disconnect'
      TabOrder = 2
      OnClick = btDisconnectClick
    end
    object btMasterDetailTest: TButton
      Left = 235
      Top = 0
      Width = 80
      Height = 25
      Caption = 'Master/Detail '
      TabOrder = 3
      OnClick = btMasterDetailTestClick
    end
    object btSPCallTest: TButton
      Left = 315
      Top = 0
      Width = 80
      Height = 25
      Caption = 'StoredProc Call'
      TabOrder = 4
      OnClick = btSPCallTestClick
    end
    object cbSDAC: TCheckBox
      Left = 8
      Top = 29
      Width = 57
      Height = 17
      Caption = 'SDAC'
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
    object cbBDE: TCheckBox
      Left = 68
      Top = 29
      Width = 49
      Height = 17
      Caption = 'BDE'
      Checked = True
      State = cbChecked
      TabOrder = 6
    end
    object cbADO: TCheckBox
      Left = 120
      Top = 29
      Width = 49
      Height = 17
      Caption = 'ADO'
      Checked = True
      State = cbChecked
      TabOrder = 7
    end
    object edFetchRows: TEdit
      Left = 438
      Top = 35
      Width = 70
      Height = 21
      Hint = 'FetchRows for SDAC, ROWSET SIZE for BDE, ADO always uses 64'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      Text = 'edFetchRows'
      OnExit = edFetchRowsExit
    end
    object btCreate: TButton
      Left = 645
      Top = 0
      Width = 73
      Height = 25
      Caption = 'Create'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      OnClick = btCreateClick
    end
    object btDrop: TButton
      Left = 718
      Top = 0
      Width = 73
      Height = 25
      Caption = 'Drop'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
      OnClick = btDropClick
    end
    object cbMark: TCheckBox
      Left = 664
      Top = 37
      Width = 48
      Height = 17
      Caption = 'Marks'
      Checked = True
      State = cbChecked
      TabOrder = 11
      OnClick = cbMarkClick
    end
    object cbdbExpress: TCheckBox
      Left = 172
      Top = 29
      Width = 73
      Height = 17
      Caption = 'dbExpress'
      TabOrder = 12
    end
    object btnMultiExecuting: TButton
      Left = 395
      Top = 0
      Width = 80
      Height = 25
      Caption = 'Multi Executing'
      TabOrder = 13
      OnClick = btnMultiExecutingClick
    end
    object btnInsertPost: TButton
      Left = 475
      Top = 0
      Width = 80
      Height = 25
      Caption = 'Insert/Post'
      TabOrder = 14
      OnClick = btnInsertPostClick
    end
    object cbResultLog: TCheckBox
      Left = 716
      Top = 37
      Width = 75
      Height = 17
      Caption = 'Result Log'
      Checked = True
      State = cbChecked
      TabOrder = 15
      OnClick = cbResultLogClick
    end
    object cbdbExpSda: TCheckBox
      Left = 244
      Top = 29
      Width = 73
      Height = 17
      Caption = 'dbExpSda'
      Checked = True
      State = cbChecked
      TabOrder = 16
    end
    object btEditPost: TButton
      Left = 555
      Top = 0
      Width = 81
      Height = 25
      Caption = 'Edit/Post'
      TabOrder = 17
      OnClick = btEditPostClick
    end
  end
  object meResult: TMemo
    Left = 634
    Top = 66
    Width = 172
    Height = 507
    Align = alRight
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object MSConnection: TMSConnection
    Database = 'SDACDemos'
    Username = 'Sa'
    Left = 72
    Top = 112
  end
  object MSQuery: TMSQuery
    Connection = MSConnection
    FetchRows = 64
    Left = 104
    Top = 112
  end
  object scCreate: TMSSQL
    Connection = MSConnection
    SQL.Strings = (
      'CREATE TABLE Master ('
      '  Code INT,'
      '  Field1 VARCHAR(100),'
      '  Field2 VARCHAR(100),'
      '  Field3 VARCHAR(100)'
      ');'
      ''
      'CREATE TABLE Detail ('
      '  Code INT,'
      '  Master INT,'
      '  Field1 VARCHAR(100),'
      '  Field2 VARCHAR(100)'
      ');'
      ''
      'CREATE TABLE Loaded ('
      '  Code INT,'
      '  Field1 VARCHAR(100),'
      '  Field2 VARCHAR(100),'
      '  Field3 VARCHAR(100),'
      '  Field4 VARCHAR(100),'
      '  Field5 VARCHAR(100)'
      ');'
      ''
      'declare'
      '  @i INTEGER;'
      'begin'
      '  SET @i = 0'
      '  WHILE @i < 1000'
      '  BEGIN'
      '    SET @i = @i + 1'
      '    INSERT INTO Master ('
      '       Code,'
      '       Field1,'
      '       Field2,'
      '       Field3)'
      '    VALUES ('
      '       @i,'
      '       '#39'01234567890123456789'#39','
      '       '#39'12345678901234567890'#39','
      '       '#39'23456789012345678901'#39');'
      '  END;'
      ''
      '  SET @i = 0'
      '  WHILE @i < 100000 '
      '  BEGIN'
      '    SET @i = @i + 1'
      '    INSERT INTO Detail ('
      '       Code,'
      '       Master,'
      '       Field1,'
      '       Field2)'
      '    VALUES ('
      '       @i,'
      '       @i % 1000 + 1,'
      '       '#39'01234567890123456789'#39','
      '       '#39'12345678901234567890'#39');'
      '  END;'
      'end;'
      ''
      ''
      'CREATE INDEX Detail_IND ON Detail (Master);')
    Debug = True
    CommandTimeout = 0
    Left = 648
    Top = 80
  end
  object scDrop: TMSSQL
    Connection = MSConnection
    SQL.Strings = (
      
        'if exists (SELECT * FROM dbo.sysobjects WHERE id = object_id('#39'Ma' +
        'ster_Insert'#39'))'
      'DROP PROCEDURE Master_Insert'
      ''
      
        'if exists (SELECT * FROM dbo.sysobjects WHERE id = object_id('#39'De' +
        'tail'#39'))'
      'DROP TABLE Detail;'
      ''
      
        'if exists (SELECT * FROM dbo.sysobjects WHERE id = object_id('#39'Ma' +
        'ster'#39'))'
      'DROP TABLE Master;'
      ''
      
        'if exists (SELECT * FROM dbo.sysobjects WHERE id = object_id('#39'Lo' +
        'aded'#39'))'
      'DROP TABLE Loaded;')
    Debug = True
    CommandTimeout = 0
    Left = 680
    Top = 80
  end
  object Database: TDatabase
    DatabaseName = 'db'
    DriverName = 'MSSQL'
    LoginPrompt = False
    Params.Strings = (
      'USER NAME=Sa'
      'PASSWORD='
      'SERVER NAME=ORA'
      'ROWSET SIZE=64')
    SessionName = 'Default'
    Left = 168
    Top = 112
  end
  object BDEQuery: TQuery
    DatabaseName = 'db'
    Left = 200
    Top = 112
  end
  object ADOConnection: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB'
    Left = 264
    Top = 112
  end
  object ADOQuery: TADOQuery
    CacheSize = 64
    Connection = ADOConnection
    Parameters = <>
    Left = 296
    Top = 112
  end
  object MSQuery1: TMSQuery
    Connection = MSConnection
    FetchRows = 64
    Left = 104
    Top = 144
  end
  object BDEQuery1: TQuery
    DatabaseName = 'db'
    Left = 200
    Top = 144
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    Left = 296
    Top = 144
  end
  object ADOStoredProc: TADOStoredProc
    Connection = ADOConnection
    Parameters = <>
    Left = 328
    Top = 144
  end
  object MSStoredProc: TMSStoredProc
    Connection = MSConnection
    Left = 136
    Top = 144
  end
  object BDEStoredProc: TStoredProc
    DatabaseName = 'db'
    Left = 232
    Top = 144
  end
  object MSSQL: TMSSQL
    Connection = MSConnection
    CommandTimeout = 0
    Left = 136
    Top = 176
  end
  object BorlandSQLConnection: TSQLConnection
    ConnectionName = 'MSSQLConnection'
    DriverName = 'MSSQL'
    GetDriverFunc = 'getSQLDriverMSSQL'
    LibraryName = 'dbexpmss.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=MSSQL'
      'HostName=ServerName'
      'DataBase=Database Name'
      'User_Name=user'
      'Password=password'
      'BlobSize=-1'
      'LocaleCode=0000'
      'MSSQL TransIsolation=ReadCommited'
      'OS Authentication=False')
    VendorLib = 'oledb'
    Left = 360
    Top = 112
  end
  object BorlandSQLQuery: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = BorlandSQLConnection
    Left = 392
    Top = 112
  end
  object BorlandSQLQuery1: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = BorlandSQLConnection
    Left = 392
    Top = 144
  end
  object BorlandSQLStoredProc: TSQLStoredProc
    MaxBlobSize = -1
    Params = <>
    SQLConnection = BorlandSQLConnection
    Left = 424
    Top = 144
  end
  object MSTable: TMSTable
    Connection = MSConnection
    Left = 136
    Top = 112
  end
  object BDETable: TTable
    DatabaseName = 'db'
    SessionName = 'Default'
    Left = 232
    Top = 112
  end
  object ADOTable: TADOTable
    Connection = ADOConnection
    Left = 328
    Top = 112
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = BorlandSQLTable
    Left = 456
    Top = 144
  end
  object BorlandClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 456
    Top = 176
  end
  object BorlandSQLTable: TSQLTable
    MaxBlobSize = -1
    SQLConnection = BorlandSQLConnection
    Left = 424
    Top = 176
  end
  object CrLabSQLConnection: TSQLConnection
    ConnectionName = 'SQLServerConnection'
    DriverName = 'SQLServer'
    GetDriverFunc = 'getSQLDriverSQLServer'
    LibraryName = 'dbexpsda.dll'
    LoginPrompt = False
    Params.Strings = (
      'BlobSize=-1'
      'HostName=Core'
      'DataBase=Northwind'
      'DriverName=SQLServer'
      'User_Name=sa'
      'Password='
      'LongStrings=True'
      'EnableBCD=True'
      'FetchAll=True')
    VendorLib = 'sqloledb.dll'
    AfterConnect = CrLabSQLConnectionAfterConnect
    Left = 360
    Top = 240
  end
  object CrLabSQLQuery: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = CrLabSQLConnection
    Left = 392
    Top = 240
  end
  object CrLabSQLQuery1: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = CrLabSQLConnection
    Left = 392
    Top = 272
  end
  object CrLabSQLTable: TSQLTable
    MaxBlobSize = -1
    SQLConnection = CrLabSQLConnection
    Left = 424
    Top = 304
  end
  object CrLabClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider2'
    Left = 456
    Top = 304
  end
  object DataSetProvider2: TDataSetProvider
    DataSet = CrLabSQLTable
    Left = 456
    Top = 272
  end
  object CrLabSQLStoredProc: TSQLStoredProc
    MaxBlobSize = -1
    Params = <>
    SQLConnection = CrLabSQLConnection
    Left = 424
    Top = 272
  end
  object scCreate2: TMSSQL
    Connection = MSConnection
    SQL.Strings = (
      'CREATE PROCEDURE Master_Insert '
      '  @p_Code INT,'
      '  @p_Field1 VARCHAR(100),'
      '  @p_Field2 VARCHAR(100),'
      '  @p_Field3 VARCHAR(100)'
      'AS'
      'begin'
      '  INSERT INTO Master ('
      '     Code,'
      '     Field1,'
      '     Field2,'
      '     Field3)'
      '  VALUES ('
      '     @p_Code,'
      '     @p_Field1,'
      '     @p_Field2,'
      '     @p_Field3);'
      'end;')
    Debug = True
    CommandTimeout = 0
    Left = 648
    Top = 112
  end
  object MSTable1: TMSTable
    Connection = MSConnection
    Left = 545
    Top = 186
  end
end
