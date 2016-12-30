inherited Ostatok1HeadForm: TOstatok1HeadForm
  Left = 755
  Top = 283
  Width = 341
  Height = 272
  Caption = '1-'#1054#1089#1090#1072#1090#1086#1082
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 325
    Height = 41
    Align = alTop
    TabOrder = 0
    object ToolBarOstatok1: TToolBar
      Left = 1
      Top = 1
      Width = 323
      Height = 29
      ButtonHeight = 27
      ButtonWidth = 30
      Images = dmDataModule.ImageListToolBar
      TabOrder = 0
      object ToolButtonOstatok11: TToolButton
        Left = 0
        Top = 2
        Caption = 'ToolButtonOstatok11'
        ImageIndex = 0
        OnClick = ToolButtonOstatok11Click
      end
      object ToolButtonOstatok12: TToolButton
        Left = 30
        Top = 2
        Caption = 'ToolButtonOstatok12'
        ImageIndex = 1
        OnClick = ToolButtonOstatok12Click
      end
      object ToolButtonOstatok13: TToolButton
        Left = 60
        Top = 2
        Caption = 'ToolButtonOstatok13'
        ImageIndex = 2
        OnClick = ToolButtonOstatok13Click
      end
      object ToolButtonOstatok14: TToolButton
        Left = 90
        Top = 2
        Hint = #1057#1077#1090#1082#1072
        Caption = 'ToolButtonOstatok14'
        ImageIndex = 9
        ParentShowHint = False
        ShowHint = True
        OnClick = ToolButtonOstatok14Click
      end
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 173
    Width = 325
    Height = 60
    Align = alBottom
    TabOrder = 1
    object gBPeriod: TGroupBox
      Left = 20
      Top = 8
      Width = 273
      Height = 36
      Caption = #1055#1077#1088#1080#1086#1076
      TabOrder = 0
      object Label1: TLabel
        Left = 10
        Top = 18
        Width = 7
        Height = 13
        Caption = #1057
      end
      object Label2: TLabel
        Left = 141
        Top = 18
        Width = 14
        Height = 13
        Caption = #1055#1086
      end
      object EdDateBeg: TcxDateEdit
        Left = 21
        Top = 13
        Properties.ClearKey = 46
        Properties.SaveTime = False
        Properties.ShowTime = False
        Properties.WeekNumbers = True
        Properties.OnCloseUp = EdDateBegPropertiesCloseUp
        TabOrder = 0
        Width = 105
      end
      object EdDateEnd: TcxDateEdit
        Left = 159
        Top = 13
        Properties.ClearKey = 46
        Properties.SaveTime = False
        Properties.ShowTime = False
        Properties.WeekNumbers = True
        Properties.OnCloseUp = EdDateEndPropertiesCloseUp
        TabOrder = 1
        Width = 105
      end
    end
  end
  object Panel3: TPanel [2]
    Left = 0
    Top = 41
    Width = 325
    Height = 132
    Align = alClient
    TabOrder = 2
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 323
      Height = 130
      Align = alClient
      ColumnDefValues.Title.Alignment = taCenter
      DataSource = dsOstatok1Head
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 2
      OnDblClick = DBGridEh1DblClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'Id'
          Footers = <>
          Width = 86
        end
        item
          EditButtons = <>
          FieldName = 'DateOstatok1'
          Footers = <>
        end>
    end
  end
  object dsOstatok1Head: TMSDataSource
    DataSet = quOstatok1Head
    Left = 290
  end
  object quOstatok1Head: TMSQuery
    SQLUpdate.Strings = (
      '/*'
      'declare'
      '    @cnt int'
      '   ,@SummaRequest decimal(18,3)'
      ''
      'select @cnt = count(*) '
      ' from RequestForSupplyGoodsHead '
      '  where Id = :id'
      ''
      'if @cnt = 0'
      ' insert into RequestForSupplyGoodsHead (id,DateRequest)'
      '  values (:id, :DateRequest)'
      'else'
      ' select @SummaRequest = sum(SummaNakl)'
      ' from (select SUM(isnull(SummaNakl,0)) SummaNakl, NaklNo'
      '        from RequestForSupplyGoodsSpec'
      '         where RequestForSupplyGoods_Id = :id'
      '       group by NaklNo'
      #9'   ) s '
      ' update RequestForSupplyGoodsHead'
      '  set DateRequest = :DateRequest'
      '     ,SummaRequest = @SummaRequest'
      ' where id = :id'
      '*/')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      ' from work.dbo.Ostatok1Head'
      
        '  where DateOstatok1 between isnull(:DateBeg, DateOstatok1) and ' +
        'isnull(:DateEnd, DateOstatok1)'
      'order by id')
    Left = 264
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DateBeg'
      end
      item
        DataType = ftDateTime
        Name = 'DateEnd'
      end>
    object quOstatok1HeadId: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' 1-'#1054#1089#1090#1072#1090#1086#1082
      FieldName = 'Id'
    end
    object quOstatok1HeadDateOstatok1: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' 1-'#1054#1089#1090#1072#1090#1086#1082
      FieldName = 'DateOstatok1'
    end
  end
  object odLoadOstatok: TOpenDialog
    Left = 236
  end
  object quInsInOstatok1Spec: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'declare '
      '   @cnt int'
      ''
      
        'select @cnt = count(*) from Ostatok1Spec where TovarNo = :TovarN' +
        'o and Ostatok1Head_Id = :Ostatok1Head_Id'
      ''
      'if @cnt = 0'
      'insert into Ostatok1Spec (  Ostatok1Head_Id'
      '                          , TovarNo'
      '                          , BegVirtKol'
      '                          , KolZakUniv'
      '                          , KolZakItog'
      '                          , OstVirtKol'
      '                          , AvgPriceIn)'
      ' values (  :Ostatok1Head_Id'
      '         , :TovarNo'
      '         , :BegVirtKol'
      '         , :KolZakUniv'
      '         , :KolZakItog'
      '         , :OstVirtKol'
      '         , :AvgPriceIn)'
      'if @cnt > 0'
      'update Ostatok1Spec'
      ' set BegVirtKol = BegVirtKol + :BegVirtKol'
      'where TovarNo = :TovarNo and Ostatok1Head_Id = :Ostatok1Head_Id')
    Left = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TovarNo'
      end
      item
        DataType = ftUnknown
        Name = 'Ostatok1Head_Id'
      end
      item
        DataType = ftUnknown
        Name = 'Ostatok1Head_Id'
      end
      item
        DataType = ftUnknown
        Name = 'TovarNo'
      end
      item
        DataType = ftUnknown
        Name = 'BegVirtKol'
      end
      item
        DataType = ftUnknown
        Name = 'KolZakUniv'
      end
      item
        DataType = ftUnknown
        Name = 'KolZakItog'
      end
      item
        DataType = ftUnknown
        Name = 'OstVirtKol'
      end
      item
        DataType = ftUnknown
        Name = 'AvgPriceIn'
      end
      item
        DataType = ftUnknown
        Name = 'BegVirtKol'
      end
      item
        DataType = ftUnknown
        Name = 'TovarNo'
      end
      item
        DataType = ftUnknown
        Name = 'Ostatok1Head_Id'
      end>
  end
  object CorrectOstatoc1: TMSQuery
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
    Left = 177
    Top = 1
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
      end>
  end
end
