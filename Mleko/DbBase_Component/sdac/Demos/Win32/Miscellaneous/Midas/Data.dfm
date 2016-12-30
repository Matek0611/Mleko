object Datas: TDatas
  OldCreateOrder = False
  OnCreate = DatasCreate
  Left = 246
  Top = 272
  Height = 485
  Width = 694
  object MSConnection: TMSConnection
    Database = 'Northwind'
    AfterConnect = ConnectionChange
    AfterDisconnect = ConnectionChange
    ConnectDialog = MSConnectDialog
    Left = 24
    Top = 16
  end
  object Query: TMSQuery
    Connection = MSConnection
    SQL.Strings = (
      'SELECT *'
      'FROM Employees'
      'WHERE EmployeeID < :EmployeeID')
    Debug = True
    Left = 72
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EmployeeID'
        ParamType = ptInput
      end>
  end
  object DataSetProvider: TDataSetProvider
    DataSet = Query
    ResolveToDataSet = True
    Options = [poNoReset]
    Left = 128
    Top = 64
  end
  object MSConnectDialog: TMSConnectDialog
    SavePassword = True
    Caption = 'Connect'
    UsernameLabel = 'User Name'
    PasswordLabel = 'Password'
    ServerLabel = 'Server'
    ConnectButton = 'Connect'
    CancelButton = 'Cancel'
    Left = 24
    Top = 64
  end
  object MSDataSetProvider: TDataSetProvider
    DataSet = Query
    Left = 128
    Top = 16
  end
end
