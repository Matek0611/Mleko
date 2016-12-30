inherited ListTipNoIncrementRateForPlanProdagForm: TListTipNoIncrementRateForPlanProdagForm
  Left = 875
  Top = 257
  Width = 407
  Height = 346
  Caption = #1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1087#1088#1086#1094#1077#1085#1090#1072' '#1087#1088#1080#1088#1086#1089#1090#1072
  PixelsPerInch = 96
  TextHeight = 13
  object ListTipNoIncrementRateForPlanProdag: TPanel [0]
    Left = 0
    Top = 0
    Width = 391
    Height = 266
    Align = alClient
    TabOrder = 0
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 389
      Height = 264
      Align = alClient
      DataSource = dsListTipNoIncrementRateForPlanProdag
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
          FieldName = 'TipNo'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'TipName'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'IncrementRate'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'Checket'
          Footers = <>
          Title.Alignment = taCenter
        end>
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 266
    Width = 391
    Height = 41
    Align = alBottom
    TabOrder = 1
    object bbOK: TBitBtn
      Left = 106
      Top = 10
      Width = 77
      Height = 25
      TabOrder = 0
      OnClick = bbOKClick
      Kind = bkOK
    end
    object bbcancel: TBitBtn
      Left = 206
      Top = 10
      Width = 77
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = bbcancelClick
      Kind = bkCancel
    end
  end
  inherited ActionList: TActionList
    Left = 0
    Top = 40
  end
  object quListTipNoIncrementRateForPlanProdag: TMSQuery
    SQLInsert.Strings = (
      'declare'
      '   @cnt int'
      ''
      
        'select @cnt = count(*) from ListTipNoIncrementRateForPlanProdag ' +
        'where TipNo = :TipNo and UserNo = :UserNo'
      ''
      'if @cnt = 0'
      
        ' insert into ListTipNoIncrementRateForPlanProdag (TipNo, Increme' +
        'ntRate, Checket, UserNo)'
      '   values (:TipNo, :IncrementRate, 1, :UserNo)'
      ''
      'if @Cnt = 1'
      ' update ListTipNoIncrementRateForPlanProdag'
      '  set  IncrementRate = :IncrementRate'
      '     , Checket = :Checket'
      ' where TipNo = :TipNo'
      '   and UserNo = :UserNo')
    SQLDelete.Strings = (
      
        'delete ListTipNoIncrementRateForPlanProdag where TipNo = :TipNo ' +
        'and UserNo = :UserNo')
    SQLUpdate.Strings = (
      'declare'
      '   @cnt int'
      ''
      
        'select @cnt = count(*) from ListTipNoIncrementRateForPlanProdag ' +
        'where TipNo = :TipNo and UserNo = :UserNo'
      ''
      'if @cnt = 0'
      
        ' insert into ListTipNoIncrementRateForPlanProdag (TipNo, Increme' +
        'ntRate, Checket, UserNo)'
      '   values (:TipNo, :IncrementRate, 1, :UserNo)'
      ''
      'if @Cnt = 1'
      ' update ListTipNoIncrementRateForPlanProdag'
      '  set  IncrementRate = :IncrementRate'
      '     , Checket = :Checket'
      ' where TipNo = :TipNo'
      '   and UserNo = :UserNo')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'declare'
      '  @UserNo int'
      ''
      'set @UserNo = :UserNo'
      ''
      'select distinct  tp.TipNo '
      '               , tp.TipName'
      #9'       , isnull(l.IncrementRate,0) as IncrementRate'
      '               , l.Checket'
      '               , @UserNo as UserNo'
      ' from Tovar t left join'
      '      VidTov vt on vt.VidNo = t.VidNo left join'
      '      TipTovara tp on tp.TipNo = t.TipNo left join'
      
        '      ListTipNoIncrementRateForPlanProdag l on l.TipNo = t.TipNo' +
        ' and UserNo = @UserNo'
      
        '  where vt.VidNo in (select VidNo from ListMinusVidTovForPlannin' +
        'gOrder where CheckMinus = 1 and UserNo = @UserNo)'
      '--    and l.UserNo = @UserNo')
    Left = 144
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'UserNo'
      end>
    object quListTipNoIncrementRateForPlanProdagTipNo: TSmallintField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1090#1080#1087#1072
      FieldName = 'TipNo'
    end
    object quListTipNoIncrementRateForPlanProdagTipName: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1080#1087#1072
      FieldName = 'TipName'
      Size = 30
    end
    object quListTipNoIncrementRateForPlanProdagIncrementRate: TIntegerField
      DisplayLabel = #1055#1088#1080#1088#1086#1089#1090' %'
      FieldName = 'IncrementRate'
    end
    object quListTipNoIncrementRateForPlanProdagChecket: TBooleanField
      DisplayLabel = 'V'
      FieldName = 'Checket'
    end
    object quListTipNoIncrementRateForPlanProdagUserNo: TIntegerField
      FieldName = 'UserNo'
      ReadOnly = True
    end
  end
  object dsListTipNoIncrementRateForPlanProdag: TMSDataSource
    DataSet = quListTipNoIncrementRateForPlanProdag
    Left = 120
    Top = 120
  end
end
