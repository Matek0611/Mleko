inherited TimetableForDriver0: TTimetableForDriver0
  Left = 597
  Top = 73
  Width = 845
  Height = 447
  Caption = #1043#1088#1072#1092#1080#1082' '#1074#1099#1077#1079#1076#1086#1074' '#1074#1086#1076#1080#1090#1077#1083#1077#1081
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 829
    Height = 328
    Align = alClient
    TabOrder = 0
    object dbListTimeTable: TDBGridEh
      Left = 1
      Top = 1
      Width = 827
      Height = 326
      Align = alClient
      DataSource = dsListTimeTable
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'DateDeparture'
          Footers = <>
          ReadOnly = True
        end
        item
          EditButtons = <>
          FieldName = 'PostNo'
          Footers = <>
          ReadOnly = True
        end
        item
          EditButtons = <>
          FieldName = 'NameLong'
          Footers = <>
          ReadOnly = True
          Width = 200
        end
        item
          EditButtons = <>
          FieldName = 'Address'
          Footers = <>
          ReadOnly = True
          Width = 200
        end
        item
          EditButtons = <>
          FieldName = 'ApId'
          Footers = <>
          Title.Caption = 'idAddress'
        end
        item
          EditButtons = <>
          FieldName = 'Driver'
          Footers = <>
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'Car'
          Footers = <>
          Width = 80
        end>
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 328
    Width = 829
    Height = 81
    Align = alBottom
    TabOrder = 1
    object lbTimeTable: TLabel
      Left = 8
      Top = 49
      Width = 183
      Height = 16
      Caption = #1043#1088#1072#1092#1080#1082' '#1074#1099#1093#1086#1076#1072' '#1074#1086#1076#1080#1090#1077#1083#1077#1081' '#1089
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 408
      Top = 49
      Width = 16
      Height = 16
      Caption = #1087#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 16
      Width = 43
      Height = 13
      Caption = #1055#1072#1088#1090#1085#1077#1088
    end
    object DateTimePickerEnd: TDateTimePicker
      Left = 444
      Top = 44
      Width = 186
      Height = 21
      Date = 41358.681435625000000000
      Time = 41358.681435625000000000
      TabOrder = 0
      OnChange = DateTimePickerEndChange
    end
    object DateTimePickerBeg: TDateTimePicker
      Left = 200
      Top = 44
      Width = 186
      Height = 21
      Date = 41358.681232905100000000
      Time = 41358.681232905100000000
      TabOrder = 1
      OnChange = DateTimePickerBegChange
    end
    object bb_OpenFile: TBitBtn
      Left = 680
      Top = 16
      Width = 129
      Height = 25
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1075#1088#1072#1092#1080#1082
      TabOrder = 2
      OnClick = bb_OpenFileClick
    end
    object DBLookupComboboxEhForPost: TDBLookupComboboxEh
      Left = 64
      Top = 16
      Width = 321
      Height = 21
      EditButtons = <>
      KeyField = 'PostNo'
      ListField = 'NameLong'
      ListSource = dsFilterPost
      TabOrder = 3
      Visible = True
      OnChange = DBLookupComboboxEhForPostChange
    end
    object bb_ListTimeTable: TBitBtn
      Left = 680
      Top = 48
      Width = 129
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1075#1088#1072#1092#1080#1082
      TabOrder = 4
      OnClick = bb_ListTimeTableClick
    end
  end
  object od_TimetableForDriver: TOpenDialog
    Left = 48
  end
  object quListTimeTable: TMSQuery
    SQLInsert.Strings = (
      'insert into CarForAdressPost'
      '      (PostNo,AddressNo,AddressId,Car,Driver,DateDeparture)'
      '   values'
      
        '      (:PostNo,:AddressNo,:AddressId,:Car,:Driver,:DateDeparture' +
        ')'
      '   set :id = scope_identity()')
    SQLUpdate.Strings = (
      'update CarForAdressPost'
      'set'
      
        '    PostNo = :PostNo, AddressNo = :AddressNo, Car = :Car, Driver' +
        ' = :Driver, AddressId = :AddressId, DateDeparture = :DateDepartu' +
        're'
      'where Id = :Old_Id')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select cfap.DateDeparture'
      '      ,cfap.PostNo'
      '      ,p.NameLong'
      '      ,ap.Address'
      '      ,cfap.AddressNo'
      '      ,cfap.AddressId'
      '      ,ap.id as ApId'
      '      ,cfap.Driver'
      '      ,cfap.Car'
      '      ,cfap.Id'
      ' from CarForAdressPost cfap left join'
      '      Post p on p.PostNo = cfap.PostNo left join'
      
        '      AddressPost ap on ap.AddressNo = cfap.AddressNo and ap.Pos' +
        'tNo = cfap.PostNo'
      
        '  where isnull(cfap.DateDeparture,'#39'01.01.1900'#39') between coalesce' +
        '(:DateBeg,cfap.DateDeparture,'#39'01.01.1900'#39') and coalesce(:DateEnd' +
        ',cfap.DateDeparture,'#39'01.01.1900'#39')'
      '    and cfap.PostNo = isnull (:PostNo,cfap.PostNo)'
      '    and cfap.DateDeparture is not null')
    Left = 80
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DateBeg'
      end
      item
        DataType = ftDateTime
        Name = 'DateEnd'
      end
      item
        DataType = ftInteger
        Name = 'PostNo'
      end>
    object quListTimeTableDateDeparture: TDateTimeField
      FieldName = 'DateDeparture'
    end
    object quListTimeTablePostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object quListTimeTableNameLong: TStringField
      FieldName = 'NameLong'
      Size = 80
    end
    object quListTimeTableAddress: TStringField
      FieldName = 'Address'
      Size = 256
    end
    object quListTimeTableDriver: TStringField
      FieldName = 'Driver'
      FixedChar = True
      Size = 50
    end
    object quListTimeTableCar: TStringField
      FieldName = 'Car'
      FixedChar = True
      Size = 50
    end
    object quListTimeTableAddressId: TIntegerField
      FieldName = 'AddressId'
    end
    object quListTimeTableAddressNo: TSmallintField
      FieldName = 'AddressNo'
    end
    object quListTimeTableApId: TIntegerField
      FieldName = 'ApId'
      ReadOnly = True
    end
    object quListTimeTableId: TLargeintField
      FieldName = 'Id'
      ReadOnly = True
    end
  end
  object dsListTimeTable: TMSDataSource
    DataSet = quListTimeTable
    Left = 112
  end
  object quTmpTimeTable: TMSQuery
    SQLInsert.Strings = (
      'if (:PostNo is not null) and (:PostNo <> '#39#39')'
      'INSERT INTO CarForAdressPostTMP'
      '  (DateDeparture, PostNo, AddressNo, Driver, Car)'
      'VALUES'
      '  (:DateDeparture, :PostNo, :AddressNo, :Driver, :Car)'
      'SET :ID = SCOPE_IDENTITY()')
    SQLUpdate.Strings = (
      'if (:PostNo is not null) and (:PostNo <> '#39#39')'
      'UPDATE CarForAdressPostTMP'
      'SET'
      '   Driver = :Driver , Car = :Car'
      'WHERE PostNo = :old_PostNo'
      '  and AddressNo = :old_AddressNo'
      '  and DateDeparture = :Old_DateDeparture')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      ' from CarForAdressPostTMP')
    Left = 176
    object quTmpTimeTableId: TLargeintField
      FieldName = 'Id'
      ReadOnly = True
    end
    object quTmpTimeTablePostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object quTmpTimeTableAddressNo: TSmallintField
      FieldName = 'AddressNo'
    end
    object quTmpTimeTableCar: TStringField
      FieldName = 'Car'
      FixedChar = True
      Size = 50
    end
    object quTmpTimeTableDriver: TStringField
      FieldName = 'Driver'
      FixedChar = True
      Size = 50
    end
    object quTmpTimeTableDateDeparture: TDateTimeField
      FieldName = 'DateDeparture'
    end
  end
  object dsTmpTimeTable: TMSDataSource
    DataSet = quTmpTimeTable
    Left = 208
  end
  object spInsInCarForAdressPost: TMSStoredProc
    StoredProcName = 'InsInCarForAdressPost;1'
    Connection = dmDataModule.DB
    Left = 248
  end
  object dsFilterPost: TMSDataSource
    DataSet = quFilterPost
    Left = 312
  end
  object quFilterPost: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select distinct p.PostNo'
      '               ,p.NameLong '
      ' from CarForAdressPost cfap inner join'
      '      Post p on p.PostNo = cfap.PostNo')
    Left = 344
  end
end
