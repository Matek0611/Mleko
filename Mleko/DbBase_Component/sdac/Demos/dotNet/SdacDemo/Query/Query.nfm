inherited QueryFrame: TQueryFrame
  Width = 443
  Height = 277
  Align = alClient
  object Splitter1: TSplitter
    Left = 0
    Top = 160
    Width = 443
    Height = 1
    Cursor = crVSplit
    Align = alTop
    Color = clGreen
    ParentColor = False
  end
  object DBGrid: TDBGrid
    Left = 0
    Top = 187
    Width = 443
    Height = 90
    Align = alClient
    Constraints.MinWidth = 50
    DataSource = DataSource
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object TPanel
    Left = 0
    Top = 161
    Width = 443
    Height = 26
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Panel9: TPanel
      Left = 1
      Top = 1
      Width = 398
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
      object btSaveToXML: TSpeedButton
        Left = 315
        Top = 1
        Width = 82
        Height = 22
        Caption = 'SaveToXML'
        Flat = True
        Transparent = False
        OnClick = btSaveToXMLClick
      end
      object DBNavigator: TDBNavigator
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
  object ToolBar: TPanel
    Left = 0
    Top = 0
    Width = 443
    Height = 80
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Panel1: TPanel
      Left = -8
      Top = 0
      Width = 563
      Height = 78
      BevelOuter = bvNone
      Color = clGreen
      TabOrder = 0
      object btClose: TSpeedButton
        Left = 92
        Top = 1
        Width = 82
        Height = 22
        Caption = 'Close'
        Flat = True
        Transparent = False
        OnClick = btCloseClick
      end
      object btOpen: TSpeedButton
        Left = 9
        Top = 1
        Width = 82
        Height = 22
        Caption = 'Open'
        Flat = True
        Transparent = False
        OnClick = btOpenClick
      end
      object btPrepare: TSpeedButton
        Left = 175
        Top = 1
        Width = 82
        Height = 22
        Caption = 'Prepare'
        Flat = True
        Transparent = False
        OnClick = btPrepareClick
      end
      object btUnPrepare: TSpeedButton
        Left = 258
        Top = 1
        Width = 82
        Height = 22
        Caption = 'UnPrepare'
        Flat = True
        Transparent = False
        OnClick = btUnPrepareClick
      end
      object btExecute: TSpeedButton
        Left = 341
        Top = 1
        Width = 82
        Height = 22
        Caption = 'Execute'
        Flat = True
        Transparent = False
        OnClick = btExecuteClick
      end
      object Panel2: TPanel
        Left = 424
        Top = 25
        Width = 138
        Height = 52
        BevelOuter = bvNone
        TabOrder = 0
        object cbRefreshBeforeEdit: TCheckBox
          Left = 11
          Top = 1
          Width = 121
          Height = 17
          Caption = 'Refresh BeforeEdit'
          TabOrder = 0
          OnClick = cbRefreshBeforeEditClick
        end
        object cbRefreshAfterInsert: TCheckBox
          Left = 11
          Top = 18
          Width = 121
          Height = 17
          Caption = 'Refresh AfterInsert'
          TabOrder = 1
          OnClick = cbRefreshAfterInsertClick
        end
        object cbRefreshAfterUpdate: TCheckBox
          Left = 11
          Top = 35
          Width = 121
          Height = 17
          Caption = 'Refresh AfterUpdate'
          TabOrder = 2
          OnClick = cbRefreshAfterUpdateClick
        end
      end
      object Panel5: TPanel
        Left = 258
        Top = 24
        Width = 165
        Height = 26
        BevelOuter = bvNone
        TabOrder = 1
        object StaticText1: TLabel
          Left = 6
          Top = 7
          Width = 54
          Height = 13
          Caption = 'FetchRows'
        end
        object edFetchRows: TEdit
          Left = 67
          Top = 2
          Width = 91
          Height = 21
          TabOrder = 0
          OnExit = edFetchRowsExit
        end
      end
      object Panel6: TPanel
        Left = 9
        Top = 51
        Width = 414
        Height = 26
        BevelOuter = bvNone
        TabOrder = 2
        object Label5: TLabel
          Left = 7
          Top = 8
          Width = 22
          Height = 13
          Caption = 'Filter'
        end
        object edFilter: TEdit
          Left = 37
          Top = 3
          Width = 260
          Height = 21
          TabOrder = 0
          OnExit = edFetchRowsExit
        end
        object cbFiltered: TCheckBox
          Left = 328
          Top = 5
          Width = 58
          Height = 17
          Caption = 'Filtered'
          TabOrder = 1
          OnClick = cbFilteredClick
        end
      end
      object Panel7: TPanel
        Left = 9
        Top = 24
        Width = 248
        Height = 26
        BevelOuter = bvNone
        TabOrder = 3
        object Label2: TLabel
          Left = 5
          Top = 7
          Width = 73
          Height = 13
          Caption = 'Updating Table'
        end
        object edUpdatingTable: TEdit
          Left = 93
          Top = 3
          Width = 148
          Height = 21
          TabOrder = 0
          OnExit = edFetchRowsExit
        end
      end
      object Panel3: TPanel
        Left = 424
        Top = 1
        Width = 138
        Height = 23
        BevelOuter = bvNone
        TabOrder = 4
        object cbNonBlocking: TCheckBox
          Left = 11
          Top = 4
          Width = 90
          Height = 16
          Caption = 'NonBlocking'
          TabOrder = 0
          OnClick = cbNonBlockingClick
        end
      end
    end
  end
  object Memo: TMemo
    Left = 0
    Top = 80
    Width = 443
    Height = 80
    Align = alTop
    ScrollBars = ssVertical
    TabOrder = 3
    OnExit = edFetchRowsExit
  end
  object DataSource: TDataSource
    DataSet = MSQuery
    OnStateChange = DataSourceStateChange
    OnDataChange = DataSourceDataChange
    Left = 108
    Top = 105
  end
  object MSQuery: TMSQuery
    Connection = SDACForm.MSConnection
    SQL.Strings = (
      'SELECT dept.DeptNo, dept.DNAME, emp.EmpNo, emp.ENAME, emp.JOB '
      'FROM dept, emp'
      'WHERE dept.DEPTNO = emp.DEPTNO')
    Debug = True
    AfterOpen = MSQueryAfterOpen
    Left = 76
    Top = 105
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'xml'
    Filter = 'XML (*.xml)|*.xml'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 138
    Top = 103
  end
end
