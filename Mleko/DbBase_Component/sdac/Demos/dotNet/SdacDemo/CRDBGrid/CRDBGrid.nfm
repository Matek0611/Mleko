inherited CRDBGridFrame: TCRDBGridFrame
  Width = 441
  Height = 275
  Align = alClient
  object CRDBGrid: TCRDBGrid
    Left = 0
    Top = 51
    Width = 441
    Height = 224
    OptionsEx = [dgeLocalFilter, dgeLocalSorting]
    Align = alClient
    DataSource = DataSource
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Caption = 'PERSON|NAME'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COUNTRY'
        Title.Caption = 'PERSON|ADDRESS|COUNTRY'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CITY'
        Title.Caption = 'PERSON|ADDRESS|CITY'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STREET'
        Title.Caption = 'PERSON|ADDRESS|STREET'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BIRTHDATE'
        Title.Caption = 'PERSON|BIRTHDATE'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JOB'
        Title.Caption = 'JOB|JOB NAME'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HIREDATE'
        Title.Caption = 'JOB|HIREDATE'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SAL'
        Title.Caption = 'JOB|SAL'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REMARKS'
        Width = 63
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 441
    Height = 51
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 438
      Height = 49
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
      object Panel3: TPanel
        Left = 1
        Top = 24
        Width = 436
        Height = 24
        BevelOuter = bvNone
        TabOrder = 0
        object chkFiltered: TCheckBox
          Left = 5
          Top = 4
          Width = 65
          Height = 17
          Caption = 'Filtered'
          TabOrder = 0
          OnClick = chkFilteredClick
        end
        object chkFilterBar: TCheckBox
          Left = 91
          Top = 4
          Width = 65
          Height = 17
          Action = actFilterBar
          TabOrder = 1
        end
        object chkSearchBar: TCheckBox
          Left = 178
          Top = 4
          Width = 81
          Height = 17
          Action = actSearchBar
          TabOrder = 2
        end
        object chkRecCount: TCheckBox
          Left = 265
          Top = 4
          Width = 89
          Height = 17
          Caption = 'Record Count'
          TabOrder = 3
          OnClick = chkRecCountClick
        end
        object chkStretch: TCheckBox
          Left = 368
          Top = 4
          Width = 57
          Height = 17
          Caption = 'Stretch'
          TabOrder = 4
          OnClick = chkStretchClick
        end
      end
      object DBNavigator1: TDBNavigator
        Left = 167
        Top = 1
        Width = 270
        Height = 22
        Flat = True
        TabOrder = 1
      end
    end
  end
  object MSQuery: TMSQuery
    Connection = SDACForm.MSConnection
    SQL.Strings = (
      'SELECT * FROM crgrid_test')
    Left = 8
    Top = 88
  end
  object DataSource: TDataSource
    DataSet = MSQuery
    Left = 40
    Top = 88
  end
  object ActionList1: TActionList
    Left = 72
    Top = 96
    object actSearchBar: TAction
      Caption = 'Search Bar'
      OnExecute = actSearchBarExecute
      OnUpdate = actSearchBarUpdate
    end
    object actFilterBar: TAction
      Caption = 'Filter Bar'
      OnExecute = actFilterBarExecute
      OnUpdate = actFilterBarUpdate
    end
  end
  object scCreate: TMSSQL
    SQL.Strings = (
      'CREATE TABLE CRGRID_TEST('
      '  Id int PRIMARY KEY,'
      '  Name VARCHAR(10),'
      '  Country VARCHAR(30),'
      '  City VARCHAR(30),'
      '  Street VARCHAR(30),'
      '  BirthDate DATETIME,'
      '  Job VARCHAR(9),'
      '  Hiredate DATETIME,'
      '  Sal NUMERIC(7, 2),'
      '  Remarks TEXT'
      ');'
      ''
      'INSERT INTO CRGRID_TEST '
      
        '  (Id, Name, Country, City, Street, BirthDate, Job, HireDate, Sa' +
        'l)'
      'VALUES '
      
        '  (5001, '#39'SMITH'#39', '#39'ENGLAND'#39', '#39'LONDON'#39', '#39'BOND st.'#39', '#39'12-OCT-63'#39', ' +
        #39'CLERK'#39','#39'17-DEC-80'#39', 800);'
      ''
      'INSERT INTO CRGRID_TEST'
      
        '  (Id, Name, Country, City, Street, BirthDate, Job, HireDate, Sa' +
        'l)'
      'VALUES '
      
        '  (5002, '#39'ALLEN'#39', '#39'ENGLAND'#39', '#39'LONDON'#39', '#39'BAKER st.'#39', '#39'04-MAR-61'#39',' +
        ' '#39'SALESMAN'#39','#39'20-FEB-81'#39', 1600);'
      ''
      'INSERT INTO CRGRID_TEST '
      
        '  (Id, Name, Country, City, Street, BirthDate, Job, HireDate, Sa' +
        'l)'
      'VALUES '
      
        '  (5003, '#39'MARTIN'#39', '#39'FRANCE'#39', '#39'LION'#39', '#39'WEAVER st.'#39', '#39'23-JAN-57'#39', ' +
        #39'MANAGER'#39','#39'02-APR-81'#39', 2900);')
    CommandTimeout = 0
    Left = 448
    Top = 8
  end
  object scDrop: TMSSQL
    SQL.Strings = (
      'DROP TABLE CRGRID_TEST')
    CommandTimeout = 0
    Left = 488
    Top = 8
  end
end
