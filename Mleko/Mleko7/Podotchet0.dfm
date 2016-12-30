inherited fmPodotchet: TfmPodotchet
  Left = 45
  Top = 207
  Width = 380
  Height = 291
  Caption = 'fmPodotchet'
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 223
    Width = 372
    Height = 41
    Align = alBottom
    TabOrder = 2
    object bbOk: TBitBtn
      Left = 144
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = bbOkClick
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
    object bbCancel: TBitBtn
      Left = 224
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 115
    Width = 372
    Height = 108
    Align = alBottom
    BevelInner = bvLowered
    BorderWidth = 4
    Caption = 'Panel2'
    TabOrder = 1
    object ScrollBox: TScrollBox
      Left = 6
      Top = 6
      Width = 360
      Height = 96
      HorzScrollBar.Margin = 6
      HorzScrollBar.Range = 331
      VertScrollBar.Margin = 6
      VertScrollBar.Range = 84
      Align = alClient
      AutoScroll = False
      BorderStyle = bsNone
      TabOrder = 0
      object Label4: TLabel
        Left = 8
        Top = 6
        Width = 26
        Height = 13
        Caption = #1044#1072#1090#1072
      end
      object Label5: TLabel
        Left = 104
        Top = 6
        Width = 34
        Height = 13
        Caption = #1057#1091#1084#1084#1072
      end
      object Label6: TLabel
        Left = 6
        Top = 44
        Width = 43
        Height = 13
        Caption = #1057#1087#1088#1072#1074#1082#1072
      end
      object Label1: TLabel
        Left = 208
        Top = 6
        Width = 53
        Height = 13
        Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
      end
      object lcSotrud: TDBLookupComboBox
        Left = 208
        Top = 22
        Width = 145
        Height = 21
        DataField = 'NameSotrud'
        DataSource = dsPlatP
        TabOrder = 0
      end
      object EditSpravka: TEdit
        Left = 7
        Top = 61
        Width = 344
        Height = 21
        TabOrder = 1
        Text = 'EditSpravka'
      end
      object EditSumma: TCurrencyEdit
        Left = 104
        Top = 22
        Width = 97
        Height = 21
        AutoSize = False
        DisplayFormat = ',0.00;-,0.00'
        TabOrder = 2
      end
      object EditDate: TDateEdit
        Left = 8
        Top = 22
        Width = 89
        Height = 21
        NumGlyphs = 2
        TabOrder = 3
      end
    end
  end
  object RxDBGrid1: TRxDBGrid [2]
    Left = 0
    Top = 0
    Width = 372
    Height = 115
    Align = alClient
    DataSource = dsDolg
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    MultiSelect = True
    OnGetCellParams = RxDBGrid1GetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'Nom'
        ReadOnly = True
        Title.Caption = #1053#1086#1084#1077#1088
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DateNakl'
        ReadOnly = True
        Title.Caption = #1044#1072#1090#1072
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Summa'
        ReadOnly = True
        Title.Caption = #1057#1091#1084#1084#1072
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SummaDolg'
        ReadOnly = True
        Title.Caption = #1044#1086#1083#1075
        Width = 96
        Visible = True
      end>
  end
  object quDolg: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'select NaklNo,Summa,SummaDolg,DateNakl,cast(0 as decimal(18,2)) ' +
        'SumOplat,'
      '       Nom,SotrudNo'
      'from NaklR'
      'where (SummaDolg<>0) and'
      '      (NaklR.PostNo=:PostNo) and'
      '      (Buh>=:BuhB)   and'
      '      (Buh<=:BuhE)'
      'order by DateNakl,NaklNo      '
      '')
    CachedUpdates = True
    AfterScroll = quDolgAfterScroll
    Left = 174
    Top = 38
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PostNo'
      end
      item
        DataType = ftSmallint
        Name = 'BuhB'
      end
      item
        DataType = ftSmallint
        Name = 'BuhE'
      end>
    object quDolgNaklNo: TIntegerField
      FieldName = 'NaklNo'
    end
    object quDolgNom: TIntegerField
      FieldName = 'Nom'
    end
    object quDolgSumma: TFloatField
      FieldName = 'Summa'
      DisplayFormat = '0.00'
    end
    object quDolgSummaDolg: TFloatField
      FieldName = 'SummaDolg'
      DisplayFormat = '0.00'
    end
    object quDolgDateNakl: TDateTimeField
      FieldName = 'DateNakl'
    end
    object quDolgSumOplat: TFloatField
      FieldName = 'SumOplat'
      DisplayFormat = '0.00'
    end
    object quDolgSotrudNo: TSmallintField
      FieldName = 'SotrudNo'
    end
  end
  object dsDolg: TDataSource
    DataSet = quDolg
    Left = 208
    Top = 40
  end
  object quNaklR: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select NaklNo,PostNo,Buh,RealDateOpl,DateNakl'
      'from NaklR'
      'where NaklNo=:NaklNo')
    CachedUpdates = True
    Left = 48
    Top = 40
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NaklNo'
      end>
    object quNaklRNaklNo: TIntegerField
      FieldName = 'NaklNo'
      Origin = 'NaklR.NaklNo'
    end
    object quNaklRPostNo: TSmallintField
      FieldName = 'PostNo'
      Origin = 'NaklR.PostNo'
    end
    object quNaklRBuh: TSmallintField
      FieldName = 'Buh'
      Origin = 'NaklR.Buh'
    end
    object quNaklRRealDateOpl: TDateTimeField
      FieldName = 'RealDateOpl'
      Origin = 'NaklR.RealDateOpl'
    end
    object quNaklRDateNakl: TDateTimeField
      FieldName = 'DateNakl'
      Origin = 'NaklR.DateNakl'
    end
  end
  object quPlatP: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'select PlatP.PlatNo,PlatP.DatePlat,PlatP.Nom,PlatP.PostNo,PlatP.' +
        'PostNoFirst,'
      '       PlatP.Summa,PlatP.Buh,PlatP.SotrudNo,PlatP.Spravka,'
      '       PlatP.UserNo'
      'from PlatP'
      'where (0=1) ')
    CachedUpdates = True
    UpdateObject = UpdatePlatP
    Left = 14
    Top = 211
    object quPlatPPlatNo: TIntegerField
      FieldName = 'PlatNo'
      Origin = 'PlatP.PlatNo'
    end
    object quPlatPDatePlat: TDateTimeField
      FieldName = 'DatePlat'
      Origin = 'PlatP.DatePlat'
      EditMask = '!99/99/0099;1;_'
    end
    object quPlatPNom: TIntegerField
      FieldName = 'Nom'
      Origin = 'PlatP.Nom'
    end
    object quPlatPPostNo: TSmallintField
      FieldName = 'PostNo'
      Origin = 'PlatP.PostNo'
    end
    object quPlatPPostNoFirst: TSmallintField
      FieldName = 'PostNoFirst'
      Origin = 'PlatP.PostNoFirst'
    end
    object quPlatPSumma: TFloatField
      FieldName = 'Summa'
      Origin = 'PlatP.Summa'
      DisplayFormat = '0.00'
    end
    object quPlatPBuh: TSmallintField
      FieldName = 'Buh'
      Origin = 'PlatP.Buh'
    end
    object quPlatPSotrudNo: TSmallintField
      FieldName = 'SotrudNo'
      Origin = 'PlatP.SotrudNo'
    end
    object quPlatPSpravka: TStringField
      FieldName = 'Spravka'
      Origin = 'PlatP.Spravka'
      Size = 55
    end
    object quPlatPUserNo: TSmallintField
      FieldName = 'UserNo'
      Origin = 'PlatP.UserNo'
    end
    object quPlatPNamePost: TStringField
      FieldKind = fkLookup
      FieldName = 'NamePost'
      LookupDataSet = quPost
      LookupKeyFields = 'PostNo'
      LookupResultField = 'Name'
      KeyFields = 'PostNo'
      Size = 30
      Lookup = True
    end
    object quPlatPNameSotrud: TStringField
      FieldKind = fkLookup
      FieldName = 'NameSotrud'
      LookupDataSet = quSotrud
      LookupKeyFields = 'SotrudNo'
      LookupResultField = 'SotrudName'
      KeyFields = 'SotrudNo'
      Lookup = True
    end
  end
  object quPost: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select PostNo,Name'
      'from Post'
      'order by Name')
    Left = 8
    Top = 40
    object quPostPostNo: TSmallintField
      FieldName = 'PostNo'
      Origin = 'Post.PostNo'
    end
    object quPostName: TStringField
      FieldName = 'Name'
      Origin = 'Post.Name'
      Size = 30
    end
  end
  object UpdatePlatP: TMSUpdateSQL
    InsertSQL.Strings = (
      'insert into PlatP'
      
        '  (PlatNo, DatePlat, Nom, PostNo, PostNoFirst, Summa, Buh, Sotru' +
        'dNo, Spravka, '
      '   UserNo)'
      'values'
      
        '  (:PlatNo, :DatePlat, :Nom, :PostNo, :PostNoFirst, :Summa, :Buh' +
        ', :SotrudNo, '
      '   :Spravka, :UserNo)')
    DeleteSQL.Strings = (
      'delete from PlatP'
      'where'
      '  PlatNo = :OLD_PlatNo')
    ModifySQL.Strings = (
      'update PlatP'
      'set'
      '  PlatNo = :PlatNo,'
      '  DatePlat = :DatePlat,'
      '  Nom = :Nom,'
      '  PostNo = :PostNo,'
      '  PostNoFirst = :PostNoFirst,'
      '  Summa = :Summa,'
      '  Buh = :Buh,'
      '  SotrudNo = :SotrudNo,'
      '  Spravka = :Spravka,'
      '  UserNo = :UserNo'
      'where'
      '  PlatNo = :OLD_PlatNo')
    Left = 80
    Top = 278
  end
  object quWork: TMSQuery
    Connection = dmDataModule.DB
    Left = 8
  end
  object quSotrud: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select SotrudNo, SotrudName'
      'from Sotrud'
      'order by SotrudName')
    Left = 8
    Top = 72
    object quSotrudSotrudNo: TSmallintField
      FieldName = 'SotrudNo'
      Origin = 'BASE.Sotrud.SotrudNo'
    end
    object quSotrudSotrudName: TStringField
      FieldName = 'SotrudName'
      Origin = 'BASE.Sotrud.SotrudName'
      FixedChar = True
      Size = 30
    end
  end
  object dsPlatP: TDataSource
    DataSet = quPlatP
    Left = 56
    Top = 206
  end
  object quPodotchetR: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'INSERT INTO PodotchetR'
      
        '                      (PodotchetRNo, SotrudNo, NaklNo, DatePodot' +
        'che, Summa, PodotchetNom, SummaPlat)'
      
        'VALUES     (:PodotchetRNo, :SotrudNo, :NaklNo, :DatePodotche, :S' +
        'umma, :PodotchetNom, :SummaPlat)')
    Left = 248
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PodotchetRNo'
      end
      item
        DataType = ftUnknown
        Name = 'SotrudNo'
      end
      item
        DataType = ftUnknown
        Name = 'NaklNo'
      end
      item
        DataType = ftUnknown
        Name = 'DatePodotche'
      end
      item
        DataType = ftUnknown
        Name = 'Summa'
      end
      item
        DataType = ftUnknown
        Name = 'PodotchetNom'
      end
      item
        DataType = ftUnknown
        Name = 'SummaPlat'
      end>
  end
  object frReportChek: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frReportChekGetValue
    Left = 288
    Top = 168
    ReportForm = {19000000}
  end
  object quPodotchetRPrint: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'SELECT     Podotchetr.PodotchetNom, Post.NameLong, Naklr.NaklNo,' +
        ' Naklr.DateNaklFirst, Podotchetr.Summa, Sotrud.SotrudName'
      'FROM         PodotchetR Podotchetr INNER JOIN'
      
        '                      NaklR Naklr ON Podotchetr.NaklNo = Naklr.N' +
        'aklNo INNER JOIN'
      
        '                      Post Post ON Naklr.PostNoFirst = Post.Post' +
        'No INNER JOIN'
      
        '                      Sotrud Sotrud ON Podotchetr.SotrudNo = Sot' +
        'rud.SotrudNo'
      'WHERE     (Podotchetr.PodotchetRNo = :PodotchetRNo)')
    Left = 320
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PodotchetRNo'
      end>
    object quPodotchetRPrintPodotchetNom: TStringField
      FieldName = 'PodotchetNom'
      FixedChar = True
      Size = 10
    end
    object quPodotchetRPrintNameLong: TStringField
      FieldName = 'NameLong'
      FixedChar = True
      Size = 80
    end
    object quPodotchetRPrintNaklNo: TIntegerField
      FieldName = 'NaklNo'
    end
    object quPodotchetRPrintDateNaklFirst: TDateTimeField
      FieldName = 'DateNaklFirst'
    end
    object quPodotchetRPrintSumma: TFloatField
      FieldName = 'Summa'
    end
    object quPodotchetRPrintSotrudName: TStringField
      FieldName = 'SotrudName'
      FixedChar = True
      Size = 30
    end
  end
end
