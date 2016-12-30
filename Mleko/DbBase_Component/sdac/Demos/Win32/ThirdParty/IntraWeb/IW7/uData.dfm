object DM: TDM
  OldCreateOrder = False
  Height = 250
  Width = 225
  object Connection: TMSConnection
    Database = 'master'
    Authentication = auServer
    AfterConnect = ConnectionAfterConnect
    BeforeConnect = ConnectionBeforeConnect
    AfterDisconnect = ConnectionAfterDisconnect
    OnConnectionLost = ConnectionConnectionLost
    Left = 40
    Top = 24
  end
end
  OldCreateOrder = False
  Height = 250
  Width = 225
  object Connection: TMSConnection
    Database = 'master'
    Authentication = auServer
    AfterConnect = ConnectionAfterConnect
    BeforeConnect = ConnectionBeforeConnect
    AfterDisconnect = ConnectionAfterDisconnect
    OnConnectionLost = ConnectionConnectionLost
    Left = 40
    Top = 24
  end
end
