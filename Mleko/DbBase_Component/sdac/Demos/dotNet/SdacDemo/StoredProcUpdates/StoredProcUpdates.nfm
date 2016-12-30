inherited StoredProcUpdatesFrame: TStoredProcUpdatesFrame
  Width = 441
  Height = 275
  Align = alClient
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 441
    Height = 26
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 408
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        OnClick = btOpenClick
      end
      object DBNavigator1: TDBNavigator
        Left = 167
        Top = 1
        Width = 240
        Height = 22
        DataSource = DataSource
        Flat = True
        TabOrder = 0
      end
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 26
    Width = 441
    Height = 249
    Align = alClient
    DataSource = DataSource
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object MSQuery: TMSQuery
    SQLInsert.Strings = (
      '{:EmpNO = CALL SDAC_InsertEmp;1(:ENAME, :JOB)}')
    SQLDelete.Strings = (
      '{CALL SDAC_DeleteEmp;1(:EmpNO, :Result)}')
    SQLUpdate.Strings = (
      
        '{:RETURN_VALUE = CALL SDAC_UpdateEmp;1(:EMPNO, :ENAME, :JOB, :EM' +
        'PINFO)}')
    Connection = SDACForm.MSConnection
    SQL.Strings = (
      'SELECT EMPNO, ENAME, JOB FROM EMP')
    Debug = True
    BeforeUpdateExecute = MSQueryBeforeUpdateExecute
    AfterUpdateExecute = MSQueryAfterUpdateExecute
    Left = 48
    Top = 208
  end
  object DataSource: TDataSource
    DataSet = MSQuery
    Left = 80
    Top = 208
  end
end
