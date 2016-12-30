inherited fmUsers: TfmUsers
  Left = 748
  Top = 213
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
  ClientHeight = 233
  ClientWidth = 314
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object RxDBGrid1: TRxDBGrid [0]
    Left = 0
    Top = 0
    Width = 314
    Height = 192
    Align = alClient
    DataSource = dsUsers
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = RxDBGrid1DblClick
    OnKeyDown = RxDBGrid1KeyDown
    OnTitleClick = RxDBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'UserNo'
        Title.Caption = #1050#1086#1076
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UserName'
        Title.Caption = #1048#1084#1103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CodeAccess'
        Title.Caption = #1059#1088#1086#1074#1077#1085#1100' '#1076#1086#1089#1090#1091#1087#1072
        Visible = True
      end>
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 192
    Width = 314
    Height = 41
    Align = alBottom
    TabOrder = 1
    object bbExit: TBitBtn
      Left = 168
      Top = 8
      Width = 123
      Height = 25
      Caption = #1042#1099#1093#1086#1076
      ModalResult = 1
      TabOrder = 0
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  inherited ActionList: TActionList
    Left = 24
    Top = 56
  end
  object quUsers: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select u.UserNo'
      '      ,u.UserName'
      '      ,u.CodeAccess'
      '      ,u.Password'
      '      ,u.EditPost'
      '      ,lu.ChangePriceInInst'
      '      ,lub.ChangeBuhType'
      '      ,lurd.RequiredData'
      'from Users u left join '
      '     ListUsersForChange lu on u.UserNo = lu.UserNo left join'
      
        '     ListUsersForChangeBuh lub on lub.UserNo = u.UserNo left joi' +
        'n'
      '     ListUsersForRequiredData lurd on lurd.UserNo = u.UserNo'
      'order by u.UserNo')
    CachedUpdates = True
    UpdateObject = UpdateUsers
    BeforePost = quUsersBeforePost
    BeforeDelete = quUsersBeforeDelete
    OnNewRecord = quUsersNewRecord
    Left = 120
    Top = 88
    object quUsersUserNo: TIntegerField
      FieldName = 'UserNo'
    end
    object quUsersUserName: TStringField
      FieldName = 'UserName'
    end
    object quUsersCodeAccess: TSmallintField
      FieldName = 'CodeAccess'
    end
    object quUsersPassword: TStringField
      FieldName = 'Password'
      Size = 8
    end
    object quUsersEditPost: TBooleanField
      FieldName = 'EditPost'
    end
    object quUsersChangePriceInInst: TBooleanField
      FieldName = 'ChangePriceInInst'
    end
    object quUsersChangeBuhType: TBooleanField
      FieldName = 'ChangeBuhType'
    end
    object quUsersRequiredData: TBooleanField
      FieldName = 'RequiredData'
    end
  end
  object dsUsers: TDataSource
    DataSet = quUsers
    Left = 120
    Top = 136
  end
  object UpdateUsers: TMSUpdateSQL
    InsertSQL.Strings = (
      'insert into Users'
      '  (UserNo, UserName, CodeAccess, Password, EditPost)'
      'values'
      '  (:UserNo, :UserName, :CodeAccess, :Password, :EditPost)'
      ''
      'insert into ListUsersForChange'
      '  (UserNo, ChangePriceInInst)'
      'values'
      '  (:UserNo, :ChangePriceInInst)'
      ''
      'insert into ListUsersForChangeBuh'
      '  (UserNo, ChangeBuhType)'
      'values'
      '  (:UserNo, :ChangeBuhType)'
      ''
      'insert into ListUsersForRequiredData '
      '  (UserNo, RequiredData)'
      'values'
      '  (:UserNo, :RequiredData)')
    DeleteSQL.Strings = (
      'delete from Users'
      'where'
      '  UserNo = :OLD_UserNo'
      ''
      'delete from ListUsersForChange'
      'where'
      '  UserNo = :OLD_UserNo'
      ''
      'delete from ListUsersForChangeBuh'
      'where'
      '  UserNo = :OLD_UserNo'
      ''
      'delete ListUsersForRequiredData'
      ' where UserNo = :OLD_UserNo')
    ModifySQL.Strings = (
      'update Users'
      'set'
      '  UserNo = :UserNo,'
      '  UserName = :UserName,'
      '  CodeAccess = :CodeAccess,'
      '  Password = :Password,'
      '  EditPost =:EditPost'
      'where'
      '  UserNo = :OLD_UserNo'
      ''
      
        'if (select COUNT(*) from ListUsersForChange where UserNo = :User' +
        'No) = 0'
      ' insert into ListUsersForChange'
      '   (UserNo, ChangePriceInInst)'
      ' values'
      '   (:UserNo, :ChangePriceInInst)'
      'else'
      ' update ListUsersForChange'
      ' set'
      '   ChangePriceInInst = :ChangePriceInInst'
      ' where '
      '   UserNo = :UserNo'
      ''
      ''
      
        'if (select COUNT(*) from ListUsersForChangeBuh where UserNo = :U' +
        'serNo) = 0'
      ' insert into ListUsersForChangeBuh'
      '   (UserNo, ChangeBuhType)'
      ' values'
      '   (:UserNo, :ChangeBuhType)'
      'else'
      ' update ListUsersForChangeBuh'
      ' set'
      '   ChangeBuhType = :ChangeBuhType'
      ' where '
      '   UserNo = :UserNo'
      ''
      
        'if (select count(*) from ListUsersForRequiredData where UserNo =' +
        ' :UserNo) = 0'
      ' insert into ListUsersForRequiredData '
      '  (UserNo, RequiredData)'
      ' values'
      '  (:UserNo, :RequiredData)'
      'else'
      ' update ListUsersForRequiredData'
      '  set RequiredData = :RequiredData'
      ' where UserNo = :UserNo')
    Left = 208
    Top = 104
  end
  object quWork: TMSQuery
    Connection = dmDataModule.DB
    Left = 152
    Top = 24
  end
end
