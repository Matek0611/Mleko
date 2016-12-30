inherited UpdateSQLFrame: TUpdateSQLFrame
  Width = 443
  Height = 277
  Align = alClient
  object Splitter1: TSplitter
    Left = 0
    Top = 121
    Width = 443
    Height = 3
    Cursor = crVSplit
    Align = alTop
    Beveled = True
    Color = clGreen
    ParentColor = False
  end
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 443
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 416
      Height = 47
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
      object Panel4: TPanel
        Left = 1
        Top = 24
        Width = 414
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object cbDeleteObject: TCheckBox
          Left = 13
          Top = 3
          Width = 91
          Height = 17
          Caption = 'DeleteObject'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 0
          OnClick = cbDeleteObjectClick
        end
        object cbInsertObject: TCheckBox
          Left = 116
          Top = 3
          Width = 81
          Height = 17
          Caption = 'InsertObject'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 1
          OnClick = cbDeleteObjectClick
        end
        object cbModifyObject: TCheckBox
          Left = 212
          Top = 3
          Width = 91
          Height = 17
          Caption = 'ModifyObject'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 2
          OnClick = cbDeleteObjectClick
        end
        object cbRefreshObject: TCheckBox
          Left = 311
          Top = 3
          Width = 93
          Height = 17
          Caption = 'RefreshObject'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 3
          OnClick = cbDeleteObjectClick
        end
      end
    end
  end
  object meSQL: TMemo
    Left = 0
    Top = 49
    Width = 443
    Height = 72
    Align = alTop
    Anchors = []
    Constraints.MinHeight = 50
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
    OnExit = meSQLExit
  end
  object Panel3: TPanel
    Left = 0
    Top = 124
    Width = 443
    Height = 24
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Panel1: TPanel
      Left = 1
      Top = 0
      Width = 315
      Height = 24
      BevelOuter = bvNone
      Color = clGreen
      TabOrder = 0
      object btRefreshRecord: TSpeedButton
        Left = 232
        Top = 1
        Width = 82
        Height = 22
        Caption = 'RefreshRecord'
        Flat = True
        Transparent = False
        OnClick = btRefreshRecordClick
      end
      object DBNavigator1: TDBNavigator
        Left = 1
        Top = 1
        Width = 230
        Height = 22
        DataSource = DataSource
        Flat = True
        TabOrder = 0
      end
    end
  end
  object DBGrid: TDBGrid
    Left = 0
    Top = 148
    Width = 443
    Height = 129
    Align = alClient
    DataSource = DataSource
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object MSQuery: TMSQuery
    Connection = SDACForm.MSConnection
    SQL.Strings = (
      'SELECT * FROM Emp')
    Debug = True
    UpdateObject = MSUpdateSQL
    Left = 18
    Top = 42
  end
  object DataSource: TDataSource
    DataSet = MSQuery
    Left = 82
    Top = 42
  end
  object MSUpdateSQL: TMSUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO Emp'
      '  (ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)'
      'VALUES'
      '  (:ENAME, :JOB, :MGR, :HIREDATE, :SAL, :COMM, :DEPTNO)'
      'SET :EMPNO = SCOPE_IDENTITY()')
    DeleteSQL.Strings = (
      'DELETE FROM Emp'
      'WHERE'
      '  EMPNO = :Old_EMPNO')
    ModifySQL.Strings = (
      'UPDATE Emp'
      'SET'
      
        '  ENAME = :ENAME, JOB = :JOB, MGR = :MGR, HIREDATE = :HIREDATE, ' +
        'SAL = :SAL, COMM = :COMM, DEPTNO = :DEPTNO'
      'WHERE'
      '  EMPNO = :Old_EMPNO')
    RefreshSQL.Strings = (
      
        'SELECT Emp.ENAME, Emp.JOB, Emp.MGR, Emp.HIREDATE, Emp.SAL, Emp.C' +
        'OMM, Emp.DEPTNO FROM Emp'
      'WHERE Emp.EMPNO = :EMPNO ')
    Left = 50
    Top = 42
  end
  object DeleteSQL: TMSSQL
    Connection = SDACForm.MSConnection
    SQL.Strings = (
      'DELETE FROM Emp'
      'WHERE'
      '  EMPNO = :Old_EMPNO')
    CommandTimeout = 0
    Left = 120
    Top = 15
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Old_EMPNO'
      end>
  end
  object InsertSQL: TMSSQL
    Connection = SDACForm.MSConnection
    SQL.Strings = (
      'INSERT INTO Emp'
      '  (ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)'
      'VALUES'
      '  (:ENAME, :JOB, :MGR, :HIREDATE, :SAL, :COMM, :DEPTNO)'
      'SET :EMPNO = SCOPE_IDENTITY()')
    CommandTimeout = 0
    Left = 120
    Top = 45
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ENAME'
      end
      item
        DataType = ftUnknown
        Name = 'JOB'
      end
      item
        DataType = ftUnknown
        Name = 'MGR'
      end
      item
        DataType = ftUnknown
        Name = 'HIREDATE'
      end
      item
        DataType = ftUnknown
        Name = 'SAL'
      end
      item
        DataType = ftUnknown
        Name = 'COMM'
      end
      item
        DataType = ftUnknown
        Name = 'DEPTNO'
      end
      item
        DataType = ftUnknown
        Name = 'EMPNO'
      end>
  end
  object ModifyQuery: TMSQuery
    Connection = SDACForm.MSConnection
    SQL.Strings = (
      'UPDATE Emp'
      'SET'
      
        '  ENAME = :ENAME, JOB = :JOB, MGR = :MGR, HIREDATE = :HIREDATE, ' +
        'SAL = :SAL, COMM = :COMM, DEPTNO = :DEPTNO'
      'WHERE'
      '  EMPNO = :Old_EMPNO')
    Left = 120
    Top = 75
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ENAME'
      end
      item
        DataType = ftUnknown
        Name = 'JOB'
      end
      item
        DataType = ftUnknown
        Name = 'MGR'
      end
      item
        DataType = ftUnknown
        Name = 'HIREDATE'
      end
      item
        DataType = ftUnknown
        Name = 'SAL'
      end
      item
        DataType = ftUnknown
        Name = 'COMM'
      end
      item
        DataType = ftUnknown
        Name = 'DEPTNO'
      end
      item
        DataType = ftUnknown
        Name = 'Old_EMPNO'
      end>
  end
  object RefreshQuery: TMSQuery
    Connection = SDACForm.MSConnection
    SQL.Strings = (
      
        'SELECT Emp.ENAME, Emp.JOB, Emp.MGR, Emp.HIREDATE, Emp.SAL, Emp.C' +
        'OMM, Emp.DEPTNO FROM Emp'
      'WHERE Emp.EMPNO = :EMPNO ')
    Left = 120
    Top = 110
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'EMPNO'
      end>
  end
end
