inherited RequestForSupplyGoodsHeadForm: TRequestForSupplyGoodsHeadForm
  Left = 833
  Top = 182
  Width = 330
  Height = 291
  Caption = #1047#1072#1087#1088#1086#1089#1099' '#1085#1072' '#1087#1086#1089#1090#1072#1074#1082#1091' '#1090#1086#1074#1072#1088#1072
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 314
    Height = 41
    Align = alTop
    TabOrder = 0
    object ToolBarReguest: TToolBar
      Left = 1
      Top = 1
      Width = 312
      Height = 29
      ButtonHeight = 27
      ButtonWidth = 30
      Images = dmDataModule.ImageListToolBar
      TabOrder = 0
      object ToolButtonReguest1: TToolButton
        Left = 0
        Top = 2
        Caption = 'ToolButtonReguest1'
        ImageIndex = 0
        OnClick = ToolButtonReguest1Click
      end
      object ToolButtonReguest2: TToolButton
        Left = 30
        Top = 2
        Caption = 'ToolButtonReguest2'
        ImageIndex = 1
        OnClick = ToolButtonReguest2Click
      end
      object ToolButtonReguest3: TToolButton
        Left = 60
        Top = 2
        Caption = 'ToolButtonReguest3'
        ImageIndex = 2
        OnClick = ToolButtonReguest3Click
      end
      object ToolButtonReguest4: TToolButton
        Left = 90
        Top = 2
        Hint = #1057#1077#1090#1082#1072
        Caption = 'ToolButtonReguest4'
        ImageIndex = 9
        ParentShowHint = False
        ShowHint = True
        OnClick = ToolButtonReguest4Click
      end
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 192
    Width = 314
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
    Width = 314
    Height = 151
    Align = alClient
    TabOrder = 2
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 312
      Height = 149
      Align = alClient
      ColumnDefValues.Title.Alignment = taCenter
      DataSource = dsRequestForSupplyGoodsHead
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
          FieldName = 'DateRequest'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'SummaRequest'
          Footers = <>
          Width = 79
        end>
    end
  end
  inherited ActionList: TActionList
    Left = 179
    Top = 1
  end
  object dsRequestForSupplyGoodsHead: TMSDataSource
    DataSet = quRequestForSupplyGoodsHead
    Left = 290
  end
  object quRequestForSupplyGoodsHead: TMSQuery
    SQLUpdate.Strings = (
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
      ' where id = :id')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      ' from RequestForSupplyGoodsHead'
      
        '  where DateRequest between isnull(:DateBeg, DateRequest) and is' +
        'null(:DateEnd, DateRequest)'
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
    object quRequestForSupplyGoodsHeadId: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1079#1072#1087#1088#1086#1089#1072' '#1085#1072' '#1087#1086#1089#1090#1072#1074#1082#1091
      FieldName = 'Id'
    end
    object quRequestForSupplyGoodsHeadDateRequest: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1079#1072#1087#1088#1086#1089#1072' '#1085#1072' '#1087#1086#1089#1090#1072#1074#1082#1091
      FieldName = 'DateRequest'
    end
    object quRequestForSupplyGoodsHeadSummaRequest: TFloatField
      DisplayLabel = #1054#1073#1097#1072#1103' '#1089#1091#1084#1084#1072' '#1079#1072#1087#1088#1086#1089#1072' '#1075#1088#1085'.'
      FieldName = 'SummaRequest'
    end
  end
  object odLoadRequest: TOpenDialog
    Left = 236
  end
  object quInsInRequestSpec: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'insert into RequestForSupplyGoodsSpec (  RequestForSupplyGoods_I' +
        'd'
      '                                        , NaklNo'
      '                                        , DateNakl'
      '                                        , DeliveryGoodsName'
      '                                        , TovarNo'
      '                                        , NameTovar'
      '                                        , Qty'
      '                                        , QtyFirst'
      '                                        , PostNo'
      '                                        , PostName'
      '                                        , SummaNakl)'
      ' values (  :RequestForSupplyGoods_Id'
      '         , :NaklNo'
      '         , :DateNakl'
      '         , :DeliveryGoodsName'
      '         , :TovarNo'
      '         , :NameTovar'
      '         ,  cast(:Qty as decimal (18,3))'
      '         ,  cast(:QtyFirst as decimal (18,3))'
      '         , :PostNo'
      '         , :PostName'
      '         , cast(:SummaNakl as decimal (18,3)))')
    Left = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RequestForSupplyGoods_Id'
      end
      item
        DataType = ftUnknown
        Name = 'NaklNo'
      end
      item
        DataType = ftUnknown
        Name = 'DateNakl'
      end
      item
        DataType = ftUnknown
        Name = 'DeliveryGoodsName'
      end
      item
        DataType = ftUnknown
        Name = 'TovarNo'
      end
      item
        DataType = ftUnknown
        Name = 'NameTovar'
      end
      item
        DataType = ftUnknown
        Name = 'Qty'
      end
      item
        DataType = ftUnknown
        Name = 'QtyFirst'
      end
      item
        DataType = ftUnknown
        Name = 'PostNo'
      end
      item
        DataType = ftUnknown
        Name = 'PostName'
      end
      item
        DataType = ftUnknown
        Name = 'SummaNakl'
      end>
  end
end
