object dmThreadsData: TdmThreadsData
  OldCreateOrder = False
  Left = 202
  Top = 164
  Height = 477
  Width = 739
  object MSConnection: TMSConnection
    Database = 'SDACDemos'
    Username = 'Sa'
    LoginPrompt = False
    Left = 24
    Top = 8
  end
  object MSQuery: TMSQuery
    Connection = MSConnection
    SQL.Strings = (
      'SELECT * FROM ThreadTable')
    FetchRows = 1
    Left = 88
    Top = 8
  end
  object MSSQL: TMSSQL
    Connection = MSConnection
    SQL.Strings = (
      'INSERT INTO ThreadTable(ID, NAME)'
      'VALUES (:ID, '#39'Some name'#39')')
    CommandTimeout = 0
    Left = 144
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
      end>
  end
end
