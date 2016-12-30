inherited AnalisCuttingMeshForm: TAnalisCuttingMeshForm
  Left = 514
  Top = 268
  Width = 1009
  Height = 458
  Caption = 'AnalisCuttingMeshForm'
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox [0]
    Left = 0
    Top = 0
    Width = 993
    Height = 419
    Align = alClient
    Caption = #1040#1085#1072#1083#1080#1079' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1086#1081' '#1087#1086#1088#1077#1079#1082#1080' '#1089#1077#1090#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 39
      Width = 989
      Height = 378
      Align = alClient
      DataSource = dsAnalisCuttingMesh
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = [fsBold]
      FooterRowCount = 1
      ReadOnly = True
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 3
      OnTitleBtnClick = DBGridEh1TitleBtnClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'PostNo'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'PostName'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'TovarNo'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'NameTovar'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'KolFirst'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'KolOst'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'PercentFact'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'GroupCutting'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'PercentGroupCutting'
          Footers = <>
          Title.Alignment = taCenter
        end>
    end
    object ToolBar: TToolBar
      Left = 2
      Top = 15
      Width = 989
      Height = 24
      AutoSize = True
      Caption = 'ToolBar'
      Flat = True
      Images = dmDataModule.ImageListToolBar
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      object ToolBtnRefresh: TToolButton
        Left = 0
        Top = 0
        ImageIndex = 3
        OnClick = ToolBtnRefreshClick
      end
      object ToolButton5: TToolButton
        Left = 23
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 31
        Style = tbsSeparator
      end
      object Label1: TLabel
        Left = 31
        Top = 0
        Width = 45
        Height = 22
        Alignment = taCenter
        Caption = #1041#1088#1077#1085#1076': '
      end
      object cbBrandFilter: TDBLookupComboboxEh
        Left = 76
        Top = 0
        Width = 121
        Height = 22
        EditButtons = <>
        KeyField = 'id'
        ListField = 'VidName'
        ListSource = dsAnalisCuttingMeshBrandFilter
        ShowHint = True
        TabOrder = 0
        Visible = True
      end
      object Label2: TLabel
        Left = 197
        Top = 0
        Width = 55
        Height = 22
        Caption = '    '#1044#1072#1090#1072': '
      end
      object DataFilter: TDBDateTimeEditEh
        Left = 252
        Top = 0
        Width = 121
        Height = 22
        EditButtons = <>
        Kind = dtkDateEh
        ShowHint = True
        TabOrder = 1
        Visible = True
        OnChange = DataFilterChange
      end
      object Label3: TLabel
        Left = 373
        Top = 0
        Width = 61
        Height = 22
        Caption = '    '#1058#1086#1074#1072#1088': '
      end
      object cbTovarFilter: TDBLookupComboboxEh
        Left = 434
        Top = 0
        Width = 271
        Height = 22
        EditButtons = <>
        KeyField = 'id'
        ListField = 'NameTovar'
        ListSource = dsAnalisCuttingMeshTovarFilter
        ShowHint = True
        TabOrder = 2
        Visible = True
      end
      object Label4: TLabel
        Left = 705
        Top = 0
        Width = 50
        Height = 22
        Caption = #1043#1088#1091#1087#1087#1072': '
      end
      object cbGroupFilter: TDBLookupComboboxEh
        Left = 755
        Top = 0
        Width = 121
        Height = 22
        EditButtons = <>
        KeyField = 'GroupCuttingId'
        ListField = 'GroupCutting'
        ListSource = dsAnalisCuttingMeshGroupFilter
        ShowHint = True
        TabOrder = 3
        Visible = True
      end
    end
  end
  object quAnalisCuttingMesh: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'declare  @DateNakl smalldatetime'
      '       , @VidNo int'
      '       , @TovarNo int'
      '       , @GroupCuttingId int'
      ''
      'set @DateNakl = :DateNakl'
      'set @VidNo = :VidNo'
      'set @TovarNo = :TovarNo'
      'set @GroupCuttingId = :GroupCuttingId'
      ''
      'select  k.PostNo'
      '      , k.PostName'
      '      , k.TovarNo'
      '      , k.NameTovar'
      '      , kf.KolFirst'
      '      , k.KolOst'
      '      , floor (case when k.KolOst = kf.KolFirst then 0'
      #9'            when k.KolOst = 0 and kf.KolFirst <> 0 then 100'
      
        #9'            when kf.KolFirst <> 0 then 100 - k.KolOst*100/kf.Ko' +
        'lFirst'
      '        end) as PercentFact'
      ''
      '      , k.GroupCutting'
      '      , k.PercentGroupCutting'
      '      '
      ' from (select   PostNo'
      '              , PostName'
      #9'      , TovarNo'
      
        #9'      , (select NameTovar from Tovar where TovarNo = k.TovarNo)' +
        ' as NameTovar'
      #9'      , sum(KolOstIter) KolOst'
      #9'      , GroupCutting'
      #9'      , PercentGroupCutting'
      '              , GroupCuttingId'
      '        from KolCuttiungBlanks k'
      '         where k.id in (select id'
      '                         from e_blanks --TMP'
      #9#9#9'  where DateNakl = isnull(@Datenakl,DateNakl)'
      #9'   '#9#9'    and TovarNo in (select TovarNo '
      '                                             from Tovar '
      
        #9#9#9'                      where (VidNo = isnull(@VidNo,VidNo) or ' +
        '@VidNo = -1))'
      #9#9#9'   '#9#9'        and status <> -1 '
      #9#9#9#9#9#9'and VidNaklNo = 1)'
      
        '                            and TovarNo = isnull(@TovarNo,TovarN' +
        'o)'
      
        '           and k.GroupCuttingId = isnull(@GroupCuttingId,GroupCu' +
        'ttingId)  '
      '       group by   PostNo'
      '                , PostName'
      '      '#9'        , TovarNo'
      #9#9', GroupCutting'
      #9'        , PercentGroupCutting'
      '                , GroupCuttingId) k left join'
      '      (select  ebht.PostNo'
      
        '             , (select name from Post where PostNo = ebht.PostNo' +
        ') as PostName'
      #9'     , ebt.TovarNo'
      
        #9'     , (select NameTovar from Tovar where TovarNo = ebt.TovarNo' +
        ') as NameTovar'
      #9'     , sum(KolOrd) KolFirst'
      '        from e_blanksTMP ebt left join'
      
        '             e_blank_headTMP ebht on ebht.ID = ebt.Document_id  ' +
        '  '
      '         where ebht.DateNakl = isnull(@DateNakl,ebht.DateNakl)'
      '           and TovarNo in (select TovarNo '
      '                            from Tovar '
      
        #9#9'             where (VidNo = isnull(@VidNo,VidNo) or @VidNo = -' +
        '1))'
      '           and TovarNo = isnull(@TovarNo,TovarNo) '
      '           and ebht.Status <> -1 '
      #9'   and ebht.VidNaklNo = 1'
      
        #9'   and ebht.reserve = case when @GroupCuttingId = 0 then 1 else' +
        ' 0 end'
      '       group by  PostNo'
      
        '               , TovarNo) kf on kf.PostNo = k.PostNo and kf.Tova' +
        'rNo = k.TovarNo left join'
      '      (select  ebh.PostNo'
      
        '             , (select name from Post where PostNo = ebh.PostNo)' +
        ' as PostName'
      #9'     , eb.TovarNo'
      
        #9'     , (select NameTovar from Tovar where TovarNo = eb.TovarNo)' +
        ' as NameTovar'
      #9'     , sum(KolOrd) KolFirst'
      '        from e_blanks eb left join'
      '             e_blank_head ebh on ebh.ID = eb.Document_id    '
      '         where ebh.DateNakl = isnull(@DateNakl,ebh.DateNakl)'
      '           and TovarNo in (select TovarNo '
      '                            from Tovar '
      
        #9#9'             where (VidNo = isnull(@VidNo,VidNo) or @VidNo = -' +
        '1))'
      '           and TovarNo = isnull(@TovarNo,TovarNo)'
      '           and eb.status <> -1 '
      #9'   and eb.VidNaklNo = 1'
      '       group by  PostNo'
      
        '               , TovarNo) ko on ko.PostNo = k.PostNo and ko.Tova' +
        'rNo = k.TovarNo'
      ''
      'order by &_order')
    Left = 24
    Top = 128
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DateNakl'
      end
      item
        DataType = ftInteger
        Name = 'VidNo'
      end
      item
        DataType = ftInteger
        Name = 'TovarNo'
      end
      item
        DataType = ftInteger
        Name = 'GroupCuttingId'
      end>
    MacroData = <
      item
        Name = '_order'
        Value = '   k.PostName'#13#10' , k.NameTovar'
      end>
    object quAnalisCuttingMeshPostNo: TIntegerField
      DisplayLabel = #1050#1086#1085#1090#1088#1072#1075'. '#8470
      FieldName = 'PostNo'
    end
    object quAnalisCuttingMeshPostName: TStringField
      DisplayLabel = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
      FieldName = 'PostName'
      Size = 30
    end
    object quAnalisCuttingMeshTovarNo: TIntegerField
      DisplayLabel = #8470' '#1090#1086#1074#1072#1088#1072
      FieldName = 'TovarNo'
    end
    object quAnalisCuttingMeshNameTovar: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
      DisplayWidth = 50
      FieldName = 'NameTovar'
      ReadOnly = True
      Size = 128
    end
    object quAnalisCuttingMeshKolFirst: TFloatField
      DisplayLabel = #1041#1099#1083#1086' '#1079#1072#1082#1072#1079#1072#1085#1086
      FieldName = 'KolFirst'
      ReadOnly = True
    end
    object quAnalisCuttingMeshKolOst: TFloatField
      DisplayLabel = #1055#1086#1089#1083#1077' '#1087#1086#1088#1077#1079#1082#1080
      FieldName = 'KolOst'
      ReadOnly = True
    end
    object quAnalisCuttingMeshGroupCutting: TStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072' '#1087#1086#1088#1077#1079#1082#1080
      DisplayWidth = 10
      FieldName = 'GroupCutting'
      Size = 30
    end
    object quAnalisCuttingMeshPercentGroupCutting: TIntegerField
      DisplayLabel = '% '#1087#1086#1088#1077#1079#1082#1080' '#1087#1086' '#1075#1088#1091#1087#1087#1077
      FieldName = 'PercentGroupCutting'
    end
    object quAnalisCuttingMeshPercentFact: TFloatField
      DisplayLabel = '% '#1087#1086#1088#1077#1079#1082#1080' '#1092#1072#1082#1090
      FieldName = 'PercentFact'
      ReadOnly = True
    end
  end
  object dsAnalisCuttingMesh: TMSDataSource
    DataSet = quAnalisCuttingMesh
    Left = 24
    Top = 152
  end
  object dsAnalisCuttingMeshBrandFilter: TMSDataSource
    DataSet = quAnalisCuttingMeshBrandFilter
    Left = 69
    Top = 152
  end
  object quAnalisCuttingMeshBrandFilter: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select distinct VidTovForGroupCutting as id'
      '              , VidName'
      ' from KolCuttiungBlanks')
    Left = 69
    Top = 128
    object quAnalisCuttingMeshBrandFilterid: TIntegerField
      FieldName = 'id'
    end
    object quAnalisCuttingMeshBrandFilterVidName: TStringField
      DisplayWidth = 25
      FieldName = 'VidName'
      Size = 50
    end
  end
  object quAnalisCuttingMeshTovarFilter: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select distinct TovarNo as id'
      
        '              , (select NameTovar from Tovar where TovarNo = k.T' +
        'ovarNo) as NameTovar '
      ' from KolCuttiungBlanks k')
    Left = 113
    Top = 128
    object quAnalisCuttingMeshTovarFilterid: TIntegerField
      FieldName = 'id'
    end
    object quAnalisCuttingMeshTovarFilterNameTovar: TStringField
      FieldName = 'NameTovar'
      ReadOnly = True
      Size = 128
    end
  end
  object dsAnalisCuttingMeshTovarFilter: TMSDataSource
    DataSet = quAnalisCuttingMeshTovarFilter
    Left = 113
    Top = 152
  end
  object quAnalisCuttingMeshGroupFilter: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select distinct GroupCuttingId'
      '              , GroupCutting'
      ' from KolCuttiungBlanks')
    Left = 156
    Top = 128
    object quAnalisCuttingMeshGroupFilterGroupCuttingId: TIntegerField
      FieldName = 'GroupCuttingId'
    end
    object quAnalisCuttingMeshGroupFilterGroupCutting: TStringField
      FieldName = 'GroupCutting'
      Size = 30
    end
  end
  object dsAnalisCuttingMeshGroupFilter: TMSDataSource
    DataSet = quAnalisCuttingMeshGroupFilter
    Left = 156
    Top = 152
  end
end
