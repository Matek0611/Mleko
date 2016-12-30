inherited SqlFrame: TSqlFrame
  Width = 773
  Height = 494
  Align = alClient
  object Label1: TLabel
    Left = 456
    Top = 48
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object Splitter1: TSplitter
    Left = 0
    Top = 188
    Width = 773
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object ToolBar: TPanel
    Left = 0
    Top = 0
    Width = 773
    Height = 26
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object TPanel
      Left = 1
      Top = 1
      Width = 505
      Height = 24
      BevelOuter = bvNone
      Color = clGreen
      TabOrder = 0
      object btExecute: TSpeedButton
        Left = 1
        Top = 1
        Width = 100
        Height = 22
        Caption = 'Execute'
        Flat = True
        Transparent = False
        OnClick = btExecuteClick
      end
      object btBreakExec: TSpeedButton
        Left = 304
        Top = 1
        Width = 100
        Height = 22
        Caption = 'Break'
        Enabled = False
        Flat = True
        Transparent = False
        OnClick = btBreakExecClick
      end
      object btExecInThread: TSpeedButton
        Left = 203
        Top = 1
        Width = 100
        Height = 22
        Hint = 
          'Assing a long-drawn command to memo (e.g. `SELECT SLEEP(10);`) a' +
          'nd push this button.'
        Caption = 'Exec in thread'
        Flat = True
        ParentShowHint = False
        ShowHint = True
        Transparent = False
        OnClick = btExecInThreadClick
      end
      object btExecuteForXml: TSpeedButton
        Left = 102
        Top = 1
        Width = 100
        Height = 22
        Caption = 'Execute FOR XML'
        Flat = True
        Transparent = False
        OnClick = btExecuteForXmlClick
      end
      object Panel1: TPanel
        Left = 405
        Top = 1
        Width = 99
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object cbNonBlocking: TCheckBox
          Left = 7
          Top = 3
          Width = 86
          Height = 17
          Caption = 'NonBlocking'
          TabOrder = 0
          OnClick = cbNonBlockingClick
        end
      end
    end
  end
  object meSQL: TMemo
    Left = 0
    Top = 26
    Width = 773
    Height = 162
    Align = alTop
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnExit = meSQLExit
  end
  object meResult: TMemo
    Left = 0
    Top = 191
    Width = 773
    Height = 303
    TabStop = False
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Pitch = fpVariable
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object MSSQL: TMSSQL
    Connection = SDACForm.MSConnection
    SQL.Strings = (
      'SET :Cnt = (SELECT COUNT(*) FROM Emp);'
      'SELECT * FROM EMP FOR XML AUTO;')
    AfterExecute = MSSQLAfterExecute
    CommandTimeout = 0
    Left = 224
    Top = 40
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Cnt'
        ParamType = ptInputOutput
        Value = 830
      end>
  end
end
