object fmMain: TfmMain
  Left = 213
  Top = 374
  Width = 975
  Height = 417
  Caption = 
    'MSSQL Data Access Demo - using Compact Edition of the MS SQL Ser' +
    'ver'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid: TDBGrid
    Left = 0
    Top = 49
    Width = 967
    Height = 315
    Align = alClient
    DataSource = DataSource
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object ToolBar: TPanel
    Left = 0
    Top = 0
    Width = 967
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 700
      Height = 47
      BevelOuter = bvNone
      Color = clGreen
      TabOrder = 0
      object btOpen: TSpeedButton
        Left = 1
        Top = 24
        Width = 82
        Height = 22
        Caption = 'Open'
        Enabled = False
        Flat = True
        Transparent = False
        OnClick = btOpenClick
      end
      object btClose: TSpeedButton
        Left = 84
        Top = 24
        Width = 82
        Height = 22
        Caption = 'Close'
        Enabled = False
        Flat = True
        Transparent = False
        OnClick = btCloseClick
      end
      object btDisconnect: TSpeedButton
        Left = 84
        Top = 1
        Width = 82
        Height = 22
        Caption = 'Disconnect'
        Enabled = False
        Flat = True
        Transparent = False
        OnClick = btDisconnectClick
      end
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
      object DBNavigator: TDBNavigator
        Left = 469
        Top = 24
        Width = 230
        Height = 22
        DataSource = DataSource
        Flat = True
        TabOrder = 0
      end
      object Panel2: TPanel
        Left = 167
        Top = 1
        Width = 532
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object Label1: TLabel
          Left = 6
          Top = 4
          Width = 78
          Height = 13
          Caption = 'Database name:'
        end
        object SpeedButton2: TSpeedButton
          Left = 511
          Top = 0
          Width = 22
          Height = 22
          Caption = '...'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          OnClick = SpeedButton2Click
        end
        object edDBName: TEdit
          Left = 88
          Top = 1
          Width = 423
          Height = 21
          TabOrder = 0
          Text = '.\test.sdf'
        end
      end
      object pnTableName: TPanel
        Left = 167
        Top = 24
        Width = 301
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object lbTableName: TLabel
          Left = 6
          Top = 4
          Width = 59
          Height = 13
          Caption = 'Table name:'
          Enabled = False
        end
        object cbTableName: TComboBox
          Left = 88
          Top = 1
          Width = 211
          Height = 21
          Enabled = False
          ItemHeight = 13
          TabOrder = 0
          OnDropDown = cbTableNameDropDown
        end
      end
    end
    object Panel3: TPanel
      Left = 705
      Top = 0
      Width = 257
      Height = 24
      BevelOuter = bvNone
      Color = clGreen
      TabOrder = 1
      object btDrop: TSpeedButton
        Left = 84
        Top = 1
        Width = 82
        Height = 22
        Caption = 'Drop'
        Flat = True
        Transparent = False
        OnClick = btDropClick
      end
      object btCreate: TSpeedButton
        Left = 1
        Top = 1
        Width = 82
        Height = 22
        Caption = 'Create'
        Flat = True
        Transparent = False
        OnClick = btCreateClick
      end
      object Panel4: TPanel
        Left = 167
        Top = 1
        Width = 89
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object cbDebug: TCheckBox
          Left = 13
          Top = 3
          Width = 67
          Height = 17
          Caption = 'Debug'
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = cbDebugClick
        end
      end
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 364
    Width = 967
    Height = 19
    Panels = <
      item
        Text = 'State'
        Width = 50
      end>
    SimplePanel = False
  end
  object DataSource: TDataSource
    DataSet = MSTable
    Left = 320
    Top = 144
  end
  object MSTable: TMSTable
    TableName = 'EMP'
    Connection = MSConnection
    Debug = True
    Left = 288
    Top = 144
  end
  object scCreate: TMSScript
    SQL.Strings = (
      'CREATE TABLE EMP ('
      '  EMPNO INT PRIMARY KEY,'
      '  ENAME NVARCHAR(10),'
      '  JOB NVARCHAR(9),'
      '  MGR INT,'
      '  HIREDATE DATETIME,'
      '  SAL FLOAT,'
      '  COMM FLOAT'
      ');'
      ''
      ''
      'INSERT INTO EMP'
      '  (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM)'
      'VALUES '
      '  (7492, '#39'SMITH'#39','#39'CLERK'#39',7902,'#39'1980-12-17'#39',800,600);'
      ''
      'INSERT INTO EMP'
      '  (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM)'
      'VALUES '
      '  (7499,'#39'ALLEN'#39','#39'SALESMAN'#39',7698,'#39'1981-2-20'#39',1600,300);'
      ''
      'INSERT INTO EMP'
      '  (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM)'
      'VALUES '
      '  (7521,'#39'WARD'#39','#39'SALESMAN'#39',7698,'#39'1981-2-22'#39',1250,500);'
      ''
      'INSERT INTO EMP'
      '  (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM)'
      'VALUES '
      '  (7566,'#39'JONES'#39','#39'MANAGER'#39',7839,'#39'1981-4-2'#39',2975,NULL);'
      ''
      'INSERT INTO EMP'
      '  (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM)'
      'VALUES '
      '  (7654,'#39'MARTIN'#39','#39'SALESMAN'#39',7698,'#39'1981-9-28'#39',1250,1400);'
      ''
      'INSERT INTO EMP'
      '  (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM)'
      'VALUES '
      '  (7698,'#39'BLAKE'#39','#39'MANAGER'#39',7839,'#39'1981-5-1'#39',2850,NULL);'
      ''
      'INSERT INTO EMP'
      '  (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM)'
      'VALUES '
      '  (7782,'#39'CLARK'#39','#39'MANAGER'#39',7839,'#39'1981-6-9'#39',2450,NULL);'
      ''
      'INSERT INTO EMP'
      '  (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM)'
      'VALUES '
      '  (7788,'#39'SCOTT'#39','#39'ANALYST'#39',7566,'#39'1987-7-13'#39',3000,NULL);'
      ''
      'INSERT INTO EMP'
      '  (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM)'
      'VALUES '
      '  (7839,'#39'KING'#39','#39'PRESIDENT'#39',NULL,'#39'1981-11-17'#39',5000,NULL);'
      ''
      'INSERT INTO EMP'
      '  (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM)'
      'VALUES '
      '  (7844,'#39'TURNER'#39','#39'SALESMAN'#39',7698,'#39'1981-9-8'#39',1500,0);'
      ''
      'INSERT INTO EMP'
      '  (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM)'
      'VALUES '
      '  (7876,'#39'ADAMS'#39','#39'CLERK'#39',7788,'#39'1987-7-13'#39',1100,NULL);'
      ''
      'INSERT INTO EMP'
      '  (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM)'
      'VALUES '
      '  (7900,'#39'JAMES'#39','#39'CLERK'#39',7698,'#39'1981-12-3'#39',950,NULL);'
      ''
      'INSERT INTO EMP'
      '  (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM)'
      'VALUES '
      '  (7902,'#39'FORD'#39','#39'ANALYST'#39',7566,'#39'1981-12-3'#39',3000,NULL);'
      ''
      'INSERT INTO EMP'
      '  (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM)'
      'VALUES '
      '  (7934,'#39'MILLER'#39','#39'CLERK'#39',7782,'#39'1982-1-23'#39',1300,NULL);')
    Debug = True
    OnError = scError
    Connection = MSConnection
    Left = 735
    Top = 59
  end
  object OpenDialog: TOpenDialog
    Filter = 'MS SQL Database Files (*.sdf)|*.sdf|All Files|*.*'
    Options = [ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Left = 130
    Top = 145
  end
  object MSConnection: TMSConnection
    Options.Provider = prCompact
    AfterConnect = MSConnectionAfterConnect
    AfterDisconnect = MSConnectionAfterDisconnect
    Left = 210
    Top = 145
  end
  object scDrop: TMSScript
    SQL.Strings = (
      'DROP TABLE EMP;')
    Debug = True
    OnError = scError
    Connection = MSConnection
    Left = 805
    Top = 59
  end
end
