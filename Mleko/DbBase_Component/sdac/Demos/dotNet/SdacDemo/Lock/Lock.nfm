inherited LockFrame: TLockFrame
  Width = 747
  Height = 398
  Align = alClient
  object ToolBar: TPanel
    Left = 0
    Top = 0
    Width = 747
    Height = 142
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Panel5: TPanel
      Left = 2
      Top = 1
      Width = 687
      Height = 119
      BevelOuter = bvNone
      Color = clGreen
      TabOrder = 0
      object Memo1: TMemo
        Left = 1
        Top = 1
        Width = 685
        Height = 45
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          
            'To see how this demo works you should open two instances of it. ' +
            'In the first instance of demo start editing any record, '
          'then try to edit the same record in the second instance.')
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        WantTabs = True
      end
      object meSQL: TMemo
        Left = 1
        Top = 47
        Width = 685
        Height = 71
        ScrollBars = ssVertical
        TabOrder = 1
        OnChange = btCloseClick
        OnExit = meSQLExit
      end
    end
    object Panel3: TPanel
      Left = 2
      Top = 119
      Width = 167
      Height = 24
      BevelOuter = bvNone
      Color = clGreen
      TabOrder = 1
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
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 143
    Width = 747
    Height = 255
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel6'
    TabOrder = 1
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 747
      Height = 26
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Panel2: TPanel
        Left = 0
        Top = 1
        Width = 489
        Height = 24
        BevelOuter = bvNone
        Color = clGreen
        TabOrder = 0
        object Panel4: TPanel
          Left = 252
          Top = 1
          Width = 236
          Height = 22
          BevelOuter = bvNone
          TabOrder = 0
          object Label1: TLabel
            Left = 8
            Top = 4
            Width = 47
            Height = 13
            Caption = 'Lock type'
          end
          object rbExclusiveLock: TRadioButton
            Left = 151
            Top = 4
            Width = 67
            Height = 17
            Caption = 'Exclusive'
            TabOrder = 0
          end
          object rbUpdateLock: TRadioButton
            Left = 74
            Top = 4
            Width = 61
            Height = 17
            Caption = 'Update'
            Checked = True
            TabOrder = 1
            TabStop = True
          end
        end
        object Panel12: TPanel
          Left = 1
          Top = 1
          Width = 250
          Height = 22
          BevelOuter = bvNone
          Caption = 'Panel12'
          TabOrder = 1
          object DBNavigator1: TDBNavigator
            Left = 0
            Top = 0
            Width = 250
            Height = 22
            DataSource = DataSource1
            Flat = True
            TabOrder = 0
          end
        end
      end
    end
    object DBGrid: TDBGrid
      Left = 0
      Top = 26
      Width = 747
      Height = 229
      Align = alClient
      DataSource = DataSource1
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object Panel11: TPanel
    Left = 0
    Top = 142
    Width = 747
    Height = 1
    Align = alTop
    BevelOuter = bvNone
    Color = clGreen
    TabOrder = 2
  end
  object MSQuery1: TMSQuery
    SQL.Strings = (
      'SELECT * FROM EMP')
    AfterExecute = MSQuery1AfterExecute
    BeforeEdit = MSQuery1BeforeEdit
    AfterPost = MSQuery1AfterPost
    AfterCancel = MSQuery1AfterCancel
    CommandTimeout = 30
    Left = 173
    Top = 101
  end
  object DataSource1: TDataSource
    DataSet = MSQuery1
    Left = 205
    Top = 101
  end
end
