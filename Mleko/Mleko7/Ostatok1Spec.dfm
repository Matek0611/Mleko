inherited Ostatok1SpecForm: TOstatok1SpecForm
  Left = 533
  Top = 221
  Width = 817
  Height = 462
  Caption = ''
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 336
    Width = 801
    Height = 87
    Align = alBottom
    TabOrder = 0
    object btAddAddressPostListForOstatok1NaklR: TButton
      Left = 178
      Top = 35
      Width = 369
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1072#1088#1090#1085#1077#1088#1072' '#1080' '#1072#1076#1088#1077#1089' '#1074' '#1089#1087#1080#1089#1086#1082' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1088#1072#1089#1093#1086#1076#1085#1099#1093' '#1085#1072#1082#1083#1072#1076#1085#1099#1093
      TabOrder = 0
      OnClick = btAddAddressPostListForOstatok1NaklRClick
    end
    object btCreateOstatok1Nakl: TButton
      Left = -4
      Top = 9
      Width = 177
      Height = 51
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1074#1088#1077#1084#1077#1085#1085#1099#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
      TabOrder = 1
      WordWrap = True
      OnClick = btCreateOstatok1NaklClick
    end
    object btAddAdderessPostListForCreateNaklP: TButton
      Left = 178
      Top = 8
      Width = 369
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1072#1088#1090#1085#1077#1088#1072' '#1080' '#1072#1076#1088#1077#1089' '#1074' '#1089#1087#1080#1089#1086#1082' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1087#1088#1080#1093#1086#1076#1072
      TabOrder = 2
      OnClick = btAddAdderessPostListForCreateNaklPClick
    end
    object Button1: TButton
      Left = 552
      Top = 8
      Width = 249
      Height = 52
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1085#1077' '#1089#1086#1079#1076#1072#1085#1085#1099#1077' '#1074#1088#1077#1084#1077#1085#1085#1099#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
      TabOrder = 3
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 177
      Top = 60
      Width = 370
      Height = 25
      Hint = #1041#1045#1047' '#1053#1045#1054#1041#1061#1054#1044#1048#1052#1054#1057#1058#1048' '#1053#1045' '#1053#1040#1046#1048#1052#1040#1058#1068' !!!!'
      Caption = #1059#1085#1080#1074#1077#1088#1089#1072#1083#1100#1085#1086#1077' '#1082#1086#1083'-'#1074#1086' = '#1085#1072#1095#1072#1083#1100#1085#1086#1077' '#1082#1086#1083'-'#1074#1086
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = Button2Click
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 0
    Width = 801
    Height = 336
    Align = alClient
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 799
      Height = 334
      Align = alClient
      DataSource = dsOstatok1Spec
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      FooterRowCount = 1
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 2
      OnKeyDown = DBGridEh1KeyDown
      OnKeyPress = DBGridEh1KeyPress
      OnTitleBtnClick = DBGridEh1TitleBtnClick
      Columns = <
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'TovarNo'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          Alignment = taLeftJustify
          BiDiMode = bdRightToLeft
          EditButtons = <>
          FieldName = 'NameTovar'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'BegVirtKol'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'AvgPriceIn'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'KolZakUniv'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          DropDownBox.ColumnDefValues.Title.TitleButton = True
          EditButtons = <>
          FieldName = 'Summa'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'KolZakItog'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'OstVirtKol'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Title.TitleButton = True
        end>
    end
  end
  object quOstatok1Spec: TMSQuery
    SQLUpdate.Strings = (
      '-- declare'
      '  '
      ''
      'update Ostatok1Spec'
      ' set   KolZakUniv = :KolZakUniv'
      
        '     , OstVirtKol = case when (:OstVirtKol = 0 and BegVirtKol<> ' +
        'KolZakItog) then null else :OstVirtKol end'
      '     , KolZakItog = :KolZakItog  '
      'where id = :id')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select  t.TovarNo'
      '      , t.NameTovar'
      '      , os.BegVirtKol'
      
        '--      , convert(decimal(18,2),isnull(o.AvgPriceIn, os.AvgPrice' +
        'In)) as AvgPriceIn'
      '      , isnull(os.AvgPriceIn,0) as AvgPriceIn'
      '      , os.KolZakUniv'
      '      , isnull(os.AvgPriceIn,0) * os.KolZakUniv as Summa'
      '      , os.KolZakItog'
      '      , os.BegVirtKol - os.KolZakItog as OstVirtKol'
      '      , os.Id'
      ' from Ostatok1Spec os left join'
      '      Tovar t on t.TovarNo = os.TovarNo --left join'
      '--      Ostatok o on o.TovarNo = os.TovarNo'
      '  where Ostatok1Head_Id = :Ostatok1Head_Id'
      'order by &_order')
    AfterPost = quOstatok1SpecAfterPost
    Options.AutoRefresh = True
    Left = 472
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Ostatok1Head_Id'
      end>
    MacroData = <
      item
        Name = '_order'
        Value = 't.TovarNo'
      end>
    object quOstatok1SpecTovarNo: TSmallintField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1090#1086#1074#1072#1088#1072
      FieldName = 'TovarNo'
    end
    object quOstatok1SpecNameTovar: TStringField
      Alignment = taCenter
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
      DisplayWidth = 50
      FieldName = 'NameTovar'
      Size = 128
    end
    object quOstatok1SpecBegVirtKol: TFloatField
      DisplayLabel = #1053#1072#1095#1072#1083#1100#1085#1086#1077' '#1082#1086#1083'-'#1074#1086
      FieldName = 'BegVirtKol'
    end
    object quOstatok1SpecAvgPriceIn: TFloatField
      DisplayLabel = #1042#1093'. '#1094#1077#1085#1072
      FieldName = 'AvgPriceIn'
    end
    object quOstatok1SpecKolZakUniv: TFloatField
      DisplayLabel = #1059#1085#1080#1074#1077#1088#1089'. '#1082#1086#1083'-'#1074#1086
      FieldName = 'KolZakUniv'
    end
    object quOstatok1SpecSumma: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'Summa'
      ReadOnly = True
    end
    object quOstatok1SpecKolZakItog: TFloatField
      DisplayLabel = #1048#1090#1086#1075#1086' '#1079#1072#1082#1072#1079#1072#1085#1086
      FieldName = 'KolZakItog'
    end
    object quOstatok1SpecOstVirtKol: TFloatField
      DisplayLabel = #1042#1080#1088#1090'. '#1086#1089#1090#1072#1090#1086#1082
      FieldName = 'OstVirtKol'
    end
    object quOstatok1SpecId: TLargeintField
      FieldName = 'Id'
      ReadOnly = True
    end
  end
  object dsOstatok1Spec: TMSDataSource
    DataSet = quOstatok1Spec
    Left = 440
    Top = 32
  end
  object sp_CreateOstatok1Nakl: TMSStoredProc
    StoredProcName = 'CreateOstatok1Nakl;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      '{:RETURN_VALUE = CALL CreateOstatok1Nakl;1(:Ostatok1Id)}')
    Left = 640
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'Ostatok1Id'
        ParamType = ptInput
      end>
  end
  object CorrectError: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'declare @id int'
      ''
      'set @id = :id'
      ''
      'update Ostatok1Spec  '
      '  set  KolZakItog = Itog.KolZakItog'
      '     , OstVirtKol = os.BegVirtKol - Itog.KolZakItog'
      #9' , KolZakNow = isnull(Nov.KolZakNow,0)'
      'from Ostatok1Spec os left join'
      '      (select o.Ostatok1Id, TovarNo, sum(Qty) as KolZakItog'
      '        from Ostatok1Nakl o'
      
        '       group by Ostatok1Id, TovarNo) Itog on Itog.TovarNo = os.T' +
        'ovarNo and os.Ostatok1Head_Id = Itog.Ostatok1Id left join'
      '      (select o.Ostatok1Id, TovarNo, sum(Qty) as KolZakNow'
      '        from Ostatok1Nakl o'
      #9#9' where NaklNo is null'
      
        '       group by Ostatok1Id, TovarNo) Nov on nov.Ostatok1Id = os.' +
        'Ostatok1Head_Id and nov.TovarNo = os.TovarNo'
      '  where Itog.TovarNo is not null'
      '    and os.Ostatok1Head_Id = @id'
      ''
      'update Ostatok1Spec'
      ' set  KolZakItog = null'
      '    , OstVirtKol = null'
      #9', KolZakNow = null'
      'where id in (select id '
      '              from Ostatok1Spec'
      '               where Ostatok1Head_Id = @id'
      
        '                 and TovarNo not in (select TovarNo from Ostatok' +
        '1Nakl where Ostatok1Id = @id))')
    Left = 768
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
      end>
  end
  object quSetKolZakUniv: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'update Ostatok1Spec'
      ' set KolZakUniv = BegVirtKol'
      'where Ostatok1Head_Id = :Ostatok1Head_Id')
    Left = 768
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Ostatok1Head_Id'
      end>
  end
end
