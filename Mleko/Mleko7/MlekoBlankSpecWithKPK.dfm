inherited MlekoBlankSpecWithKPKForm: TMlekoBlankSpecWithKPKForm
  Left = 588
  Top = 165
  Width = 751
  Height = 468
  Caption = #1057#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1103' '#1074#1085#1077#1096#1085#1077#1075#1086' '#1079#1072#1082#1072#1079#1072
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 735
    Height = 429
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    object DBGridEhe_blanks_online: TDBGridEh
      Left = 1
      Top = 1
      Width = 733
      Height = 427
      Align = alClient
      DataSource = dse_blanks_online
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
    end
  end
  object dse_blanks_online: TDataSource
    DataSet = que_blanks_online
    Left = 56
  end
  object que_blanks_online: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select   ebo.RasNo'
      '       , ebo.Document_id'
      '       , ebo.TovarNo'
      #9'   , t.NameTovar'
      #9'   , ebo.Boss_price'
      #9'   , ebo.weight'
      #9'   , ebo.KolOrd'
      #9'   , ebo.DateNakl'
      #9'   , ebo.Status'
      #9'   , ebo.CreateUser'
      
        #9'   , (select SotrudName from Sotrud where SotrudNo = ebo.Create' +
        'User) as CreateUserName'
      #9'   , ebo.LastEditUser'
      
        #9'   , (select SotrudName from Sotrud where SotrudNo = ebo.LastEd' +
        'itUser) as LastEditUserName'
      #9'   , ebo.KolBegin'
      #9'   , ebo.AvgPriceIn'
      #9'   , ebo.KolOst'
      #9'   , ebo.vidNaklNo'
      
        #9'   , (select VidNaklName from VidNakl where VidNaklNo = ebo.vid' +
        'NaklNo) as VidNaklName'
      #9'   , ebo.EmployeeNo'
      
        #9'   , (select LastName+'#39' '#39'+Name+'#39' '#39'+MiddleName from Employee whe' +
        're EmployeeNo = ebo.EmployeeNo) as EmploeeName'
      #9'   , ebo.HostName'
      ' from e_blanks_online ebo left join'
      '      Tovar t on t.TovarNo = ebo.TovarNo'
      '  where document_id = :Document_id')
    Left = 85
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Document_id'
      end>
    object que_blanks_onlineRasNo: TIntegerField
      FieldName = 'RasNo'
    end
    object que_blanks_onlineDocument_id: TIntegerField
      FieldName = 'Document_id'
    end
    object que_blanks_onlineTovarNo: TSmallintField
      FieldName = 'TovarNo'
    end
    object que_blanks_onlineNameTovar: TStringField
      FieldName = 'NameTovar'
      Size = 128
    end
    object que_blanks_onlineBoss_price: TFloatField
      FieldName = 'Boss_price'
    end
    object que_blanks_onlineweight: TFloatField
      FieldName = 'weight'
    end
    object que_blanks_onlineKolOrd: TFloatField
      FieldName = 'KolOrd'
    end
    object que_blanks_onlineDateNakl: TDateTimeField
      FieldName = 'DateNakl'
    end
    object que_blanks_onlineStatus: TSmallintField
      FieldName = 'Status'
    end
    object que_blanks_onlineCreateUser: TSmallintField
      FieldName = 'CreateUser'
    end
    object que_blanks_onlineCreateUserName: TStringField
      FieldName = 'CreateUserName'
      ReadOnly = True
      Size = 30
    end
    object que_blanks_onlineLastEditUser: TSmallintField
      FieldName = 'LastEditUser'
    end
    object que_blanks_onlineLastEditUserName: TStringField
      FieldName = 'LastEditUserName'
      ReadOnly = True
      Size = 30
    end
    object que_blanks_onlineKolBegin: TFloatField
      FieldName = 'KolBegin'
    end
    object que_blanks_onlineAvgPriceIn: TFloatField
      FieldName = 'AvgPriceIn'
    end
    object que_blanks_onlineKolOst: TFloatField
      FieldName = 'KolOst'
    end
    object que_blanks_onlinevidNaklNo: TIntegerField
      FieldName = 'vidNaklNo'
    end
    object que_blanks_onlineVidNaklName: TStringField
      FieldName = 'VidNaklName'
      ReadOnly = True
    end
    object que_blanks_onlineEmployeeNo: TSmallintField
      FieldName = 'EmployeeNo'
    end
    object que_blanks_onlineEmploeeName: TStringField
      FieldName = 'EmploeeName'
      ReadOnly = True
      Size = 152
    end
    object que_blanks_onlineHostName: TStringField
      FieldName = 'HostName'
      Size = 50
    end
  end
end
