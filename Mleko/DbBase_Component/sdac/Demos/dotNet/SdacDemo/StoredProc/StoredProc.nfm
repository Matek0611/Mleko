inherited StoredProcFrame: TStoredProcFrame
  Width = 441
  Height = 275
  Align = alClient
  object DBGrid: TDBGrid
    Left = 0
    Top = 49
    Width = 441
    Height = 226
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
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 499
      Height = 24
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
      object btPrepareSQL: TSpeedButton
        Left = 416
        Top = 1
        Width = 82
        Height = 22
        Caption = 'PrepareSQL'
        Flat = True
        Transparent = False
        OnClick = btPrepareSQLClick
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 24
      Width = 499
      Height = 24
      BevelOuter = bvNone
      Color = clGreen
      TabOrder = 1
      object DBNavigator: TDBNavigator
        Left = 278
        Top = 1
        Width = 220
        Height = 22
        DataSource = DataSource
        Flat = True
        TabOrder = 0
      end
      object Panel3: TPanel
        Left = 1
        Top = 1
        Width = 276
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object Label1: TLabel
          Left = 4
          Top = 6
          Width = 82
          Height = 13
          Caption = 'StoredProc name'
        end
        object edStoredProcName: TComboBox
          Left = 95
          Top = 1
          Width = 173
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          OnDropDown = edStoredProcNameDropDown
          OnExit = edStoredProcNameExit
        end
      end
    end
  end
  object DataSource: TDataSource
    DataSet = MSStoredProc
    Left = 432
    Top = 72
  end
  object MSStoredProc: TMSStoredProc
    StoredProcName = 'Ten Most High-Paid Employees;1'
    SQLRefresh.Strings = (
      'WHERE'
      '  DEPTNO = :DEPTNO')
    Connection = SDACForm.MSConnection
    SQL.Strings = (
      '{CALL "Ten Most High-Paid Employees";1}')
    Debug = True
    Left = 400
    Top = 72
  end
end
