inherited fmReadMenuFromIni: TfmReadMenuFromIni
  Left = 200
  Top = 108
  Width = 544
  Height = 375
  Caption = 'fmReadMenuFromIni'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object quMenu: TMSQuery
    CachedUpdates = True
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'if exists(select * from Menu where UserNo=:UserNo and ItemName=:' +
        'ItemName)'
      ' begin'
      '  update Menu set Enabled=:Enabled'
      '  where UserNo=:UserNo and'
      '        ItemName=:ItemName'
      ' end'
      'else'
      ' begin'
      '  insert into Menu'
      '   (UserNo,ItemName,Enabled)'
      '  values'
      '   (:UserNo,:ItemName,:Enabled)'
      ' end'
      '')
    Left = 88
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'UserNo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ItemName'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Enabled'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserNo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ItemName'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserNo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ItemName'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Enabled'
        ParamType = ptUnknown
      end>
    object quMenuUserNo: TSmallintField
      FieldName = 'UserNo'
      Origin = 'Menu.UserNo'
    end
    object quMenuItemName: TStringField
      FieldName = 'ItemName'
      Origin = 'Menu.ItemName'
    end
    object quMenuEnabled: TBooleanField
      FieldName = 'Enabled'
      Origin = 'Menu.Enabled'
    end
  end
  object quUsers: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select UserNo,CodeAccess'
      'from Users')
    Left = 160
    Top = 32
    object quUsersUserNo: TIntegerField
      FieldName = 'UserNo'
      Origin = 'Users.UserNo'
    end
    object quUsersCodeAccess: TSmallintField
      FieldName = 'CodeAccess'
      Origin = 'Users.CodeAccess'
    end
  end
end
