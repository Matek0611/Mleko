inherited CuttingMeshForm: TCuttingMeshForm
  Left = 282
  Top = 311
  Width = 1278
  Height = 353
  Caption = #1055#1086#1088#1077#1079#1082#1072' '#1090#1086#1074#1072#1088#1072
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 24
    Width = 1262
    Height = 290
    Align = alClient
    TabOrder = 0
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 1260
      Height = 288
      Align = alClient
      DataSource = dsKolCuttiungBlanks
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
      Columns = <
        item
          EditButtons = <>
          FieldName = 'id'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'TovarNo'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'NameTovar'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'VidTovForGroupCutting'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'VidName'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'PostNo'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'PostName'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'GroupCuttingId'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'GroupCutting'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'PercentGroupCutting'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'KolOst'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'KolOrd'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'SumAllTovar'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'SumKolGroupCutting'
          Footers = <>
          Width = 126
        end
        item
          EditButtons = <>
          FieldName = 'SumKolGroupCuttingItog'
          Footers = <>
          Width = 115
        end
        item
          EditButtons = <>
          FieldName = 'CoefficientGroupCutting'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'KolCutting'
          Footer.ValueType = fvtSum
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'KolZakazGroupCutting'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'KolOstFirst'
          Footer.ValueType = fvtSum
          Footers = <>
          Width = 82
        end
        item
          EditButtons = <>
          FieldName = 'KolCuttingIter'
          Footer.ValueType = fvtSum
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'is_weight'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'NoPP_1'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'KolOstIter1'
          Footer.ValueType = fvtSum
          Footers = <>
          Width = 73
        end
        item
          EditButtons = <>
          FieldName = 'Coeff1'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'KolCuttingIter1'
          Footer.ValueType = fvtSum
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'SumKolOstIter1'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'SumKolOstIterPrev1'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'KolOstIter2'
          Footer.ValueType = fvtSum
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'Coeff2'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'KolCuttingIter2'
          Footer.ValueType = fvtSum
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'SumKolOstIter2'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'SumKolOstIterPrev2'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'KolOstIter3'
          Footer.ValueType = fvtSum
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'Coeff3'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'KolCuttingIter3'
          Footer.ValueType = fvtSum
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'SumKolOstIter3'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'SumKolOstIterPrev3'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'KolOstIter'
          Footer.ValueType = fvtSum
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'KolGroupCutting'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'SumZakTovarNovGroupIter'
          Footers = <>
        end>
    end
  end
  object ToolBar: TToolBar [1]
    Left = 0
    Top = 0
    Width = 1262
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
    object ToolButton1: TToolButton
      Left = 31
      Top = 0
      Caption = 'ToolButton1'
      ImageIndex = 14
      OnClick = ToolButton1Click
    end
    object DBLookupComboboxEh1: TDBLookupComboboxEh
      Left = 54
      Top = 0
      Width = 121
      Height = 22
      EditButtons = <>
      KeyField = 'GroupCuttingId'
      ListField = 'GroupCutting'
      ListSource = dsCuttingMashFilter
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object dtFilterDate: TDBDateTimeEditEh
      Left = 175
      Top = 0
      Width = 121
      Height = 22
      EditButtons = <>
      Kind = dtkDateEh
      ShowHint = True
      TabOrder = 1
      Visible = True
      OnChange = dtFilterDateChange
    end
  end
  inherited ActionList: TActionList
    Left = 0
    Top = 40
  end
  object quKolCuttiungBlanks: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'declare @TovarNo int'
      ''
      'set @TovarNo = :TovarNo'
      ''
      'select * '
      ' from KolCuttiungBlanks kcb left join'
      '      Tovar t on t.TovarNo = kcb.TovarNo'
      '  where kcb.TovarNo = @TovarNo'
      '    and kcb.DateNakl = isnull(:DateNakl,kcb.DateNakl)'
      '&_where'
      'order by NoPP_1')
    Left = 208
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TovarNo'
      end
      item
        DataType = ftDateTime
        Name = 'DateNakl'
      end>
    MacroData = <
      item
        Name = '_where'
      end>
    object quKolCuttiungBlanksid: TLargeintField
      DisplayLabel = 'id '#1057#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1080
      FieldName = 'id'
    end
    object quKolCuttiungBlanksTovarNo: TIntegerField
      DisplayLabel = #8470' '#1058#1086#1074#1072#1088#1072
      FieldName = 'TovarNo'
    end
    object quKolCuttiungBlanksNameTovar: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      DisplayWidth = 30
      FieldName = 'NameTovar'
      Size = 128
    end
    object quKolCuttiungBlanksVidTovForGroupCutting: TIntegerField
      DisplayLabel = #8470' '#1041#1088#1077#1085#1076#1072
      FieldName = 'VidTovForGroupCutting'
    end
    object quKolCuttiungBlanksVidName: TStringField
      DisplayLabel = #1041#1088#1077#1085#1076
      DisplayWidth = 25
      FieldName = 'VidName'
      Size = 50
    end
    object quKolCuttiungBlanksPostNo: TIntegerField
      DisplayLabel = #8470' '#1050#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
      FieldName = 'PostNo'
    end
    object quKolCuttiungBlanksPostName: TStringField
      DisplayLabel = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
      FieldName = 'PostName'
      Size = 30
    end
    object quKolCuttiungBlanksGroupCuttingId: TIntegerField
      DisplayLabel = #8470' '#1043#1088#1091#1087#1087#1099' '#1087#1086#1088#1077#1079#1082#1080
      FieldName = 'GroupCuttingId'
    end
    object quKolCuttiungBlanksGroupCutting: TStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072' '#1087#1086#1088#1077#1079#1082#1080
      DisplayWidth = 25
      FieldName = 'GroupCutting'
      Size = 30
    end
    object quKolCuttiungBlanksPercentGroupCutting: TIntegerField
      DisplayLabel = '% '#1055#1086#1088#1077#1079#1082#1080
      FieldName = 'PercentGroupCutting'
    end
    object quKolCuttiungBlanksKolOst: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      FieldName = 'KolOst'
    end
    object quKolCuttiungBlanksKolOrd: TFloatField
      DisplayLabel = #1047#1072#1082#1072#1079
      FieldName = 'KolOrd'
    end
    object quKolCuttiungBlanksSumAllTovar: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1079#1072#1082#1072#1079#1086#1074' '#1085#1072' '#1076#1072#1090#1091
      FieldName = 'SumAllTovar'
    end
    object quKolCuttiungBlanksSumKolGroupCutting: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1079#1072#1082#1072#1079#1086#1074' '#1087#1086' '#1075#1088#1091#1087#1087#1077' '#1085#1072' '#1076#1072#1090#1091
      FieldName = 'SumKolGroupCutting'
    end
    object quKolCuttiungBlanksSumKolGroupCuttingItog: TFloatField
      DisplayLabel = #1050#1086#1083'.'#1054#1089#1090'.'#1074' '#1075#1088'.'
      FieldName = 'SumKolGroupCuttingItog'
    end
    object quKolCuttiungBlanksCoefficientGroupCutting: TFloatField
      DisplayLabel = #1050#1086#1101#1092'.'#1087#1086#1088#1077#1079#1082#1080' '#1087#1086' '#1075#1088'.'
      FieldName = 'CoefficientGroupCutting'
    end
    object quKolCuttiungBlanksKolCutting: TFloatField
      DisplayLabel = #1050#1086#1083'.'#1089#1088#1077#1079#1072' 1'
      FieldName = 'KolCutting'
    end
    object quKolCuttiungBlanksKolZakazGroupCutting: TIntegerField
      DisplayLabel = #1050#1086#1083'.'#1079#1072#1082#1072#1079#1086#1074' '#1085#1072' '#1076#1072#1090#1077
      FieldName = 'KolZakazGroupCutting'
    end
    object quKolCuttiungBlanksKolOstFirst: TFloatField
      DisplayLabel = #1050#1086#1083'.'#1087#1086#1089#1083#1077' '#1087#1077#1088#1074#1086#1081' '#1080#1090#1077#1088#1072#1094#1080#1080
      FieldName = 'KolOstFirst'
    end
    object quKolCuttiungBlanksKolCuttingIter: TFloatField
      DisplayLabel = #1057#1088#1077#1079#1072#1077#1084#1086#1077' '#1082#1086#1083'.'
      FieldName = 'KolCuttingIter'
    end
    object quKolCuttiungBlanksSumZakTovarNovGroupIter: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1079#1072#1082'. '#1087#1086#1089#1083'. '#1087#1086#1088#1077#1079#1082#1072
      FieldName = 'SumZakTovarNovGroupIter'
    end
    object quKolCuttiungBlanksis_weight: TBooleanField
      DisplayLabel = #1042#1077#1089#1086#1074#1086#1081' '#1090#1086#1074#1072#1088
      FieldName = 'is_weight'
    end
    object quKolCuttiungBlanksNoPP_1: TIntegerField
      DisplayLabel = #8470#1055#1055' '#1077#1076#1077#1085#1080#1094
      FieldName = 'NoPP_1'
    end
    object quKolCuttiungBlanksKolOstIter1: TFloatField
      DisplayLabel = #1050#1086#1083'. '#1087#1086#1089#1083#1077' 2-'#1081' '#1080#1090#1077#1088'.'
      FieldName = 'KolOstIter1'
    end
    object quKolCuttiungBlanksCoeff1: TFloatField
      DisplayLabel = #1050#1086#1101#1092'. '#1087#1086#1089#1083#1077' 2-'#1081' '#1080#1090#1077#1088'.'
      FieldName = 'Coeff1'
    end
    object quKolCuttiungBlanksKolCuttingIter1: TFloatField
      DisplayLabel = #1050#1086#1083'.'#1089#1088#1077#1079#1072' 2'
      FieldName = 'KolCuttingIter1'
    end
    object quKolCuttiungBlanksSumKolOstIter1: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1079#1072#1082#1072#1079#1072' '#1087#1086#1089#1083#1077' 1 '#1087#1086#1088#1077#1079#1082#1080
      FieldName = 'SumKolOstIter1'
    end
    object quKolCuttiungBlanksSumKolOstIterPrev1: TFloatField
      DisplayLabel = #1055#1088#1086#1074#1077#1088#1082#1072' 2-'#1081' '#1087#1086#1088#1077#1079#1082#1080
      FieldName = 'SumKolOstIterPrev1'
    end
    object quKolCuttiungBlanksKolOstIter2: TFloatField
      DisplayLabel = #1050#1086#1083'. '#1087#1086#1089#1083#1077' 3-'#1081' '#1080#1090#1077#1088'.'
      FieldName = 'KolOstIter2'
    end
    object quKolCuttiungBlanksCoeff2: TFloatField
      DisplayLabel = #1050#1086#1101#1092'. '#1087#1086#1089#1083#1077' 3-'#1081' '#1080#1090#1077#1088'.'
      FieldName = 'Coeff2'
    end
    object quKolCuttiungBlanksKolCuttingIter2: TFloatField
      DisplayLabel = #1050#1086#1083'.'#1089#1088#1077#1079#1072' 3'
      FieldName = 'KolCuttingIter2'
    end
    object quKolCuttiungBlanksSumKolOstIter2: TFloatField
      DisplayLabel = #1050#1086#1083' '#1079#1072#1082#1072#1079#1072#1085#1085#1086#1075#1086' '#1090#1086#1074#1072#1088#1072' '#1087#1086' '#1075#1088#1091#1087#1087#1077' '#1087#1086#1089#1083#1077' 3-'#1081' '#1087#1086#1088#1077#1079#1082#1080
      FieldName = 'SumKolOstIter2'
    end
    object quKolCuttiungBlanksSumKolOstIterPrev2: TFloatField
      DisplayLabel = #1055#1088#1086#1074#1077#1088#1082#1072' 3-'#1081' '#1087#1086#1088#1077#1079#1082#1080
      FieldName = 'SumKolOstIterPrev2'
    end
    object quKolCuttiungBlanksKolOstIter3: TFloatField
      DisplayLabel = #1050#1086#1083'. '#1087#1086#1089#1083#1077' 4-'#1081' '#1080#1090#1077#1088'.'
      FieldName = 'KolOstIter3'
    end
    object quKolCuttiungBlanksCoeff3: TFloatField
      DisplayLabel = #1050#1086#1101#1092'. '#1087#1086#1089#1083#1077' 4-'#1081' '#1080#1090#1077#1088'.'
      FieldName = 'Coeff3'
    end
    object quKolCuttiungBlanksKolCuttingIter3: TFloatField
      DisplayLabel = #1050#1086#1083'.'#1089#1088#1077#1079#1072' 4'
      FieldName = 'KolCuttingIter3'
    end
    object quKolCuttiungBlanksSumKolOstIter3: TFloatField
      DisplayLabel = #1050#1086#1083' '#1079#1072#1082#1072#1079#1072#1085#1085#1086#1075#1086' '#1090#1086#1074#1072#1088#1072' '#1087#1086' '#1075#1088#1091#1087#1087#1077' '#1087#1086#1089#1083#1077' 4-'#1081' '#1087#1086#1088#1077#1079#1082#1080
      FieldName = 'SumKolOstIter3'
    end
    object quKolCuttiungBlanksSumKolOstIterPrev3: TFloatField
      DisplayLabel = #1055#1088#1086#1074#1077#1088#1082#1072' 4-'#1081' '#1087#1086#1088#1077#1079#1082#1080
      FieldName = 'SumKolOstIterPrev3'
    end
    object quKolCuttiungBlanksKolOstIter: TFloatField
      DisplayLabel = #1047#1072#1082#1072#1079'_'#1082#1086#1083'_'#1080#1090#1086#1075
      FieldName = 'KolOstIter'
    end
    object quKolCuttiungBlanksKolGroupCutting: TIntegerField
      DisplayLabel = #1057#1088#1077#1079'_'#1082#1086#1083'_'#1080#1090#1086#1075
      FieldName = 'KolGroupCutting'
    end
  end
  object dsKolCuttiungBlanks: TMSDataSource
    DataSet = quKolCuttiungBlanks
    Left = 208
    Top = 40
  end
  object quCuttingMashFilter: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'declare @TovarNo int'
      ''
      'set @TovarNo = :TovarNo'
      ''
      'select distinct GroupCuttingId,GroupCutting'
      ' from KolCuttiungBlanks kcb left join'
      '      Tovar t on t.TovarNo = kcb.TovarNo'
      '  where kcb.TovarNo = @TovarNo')
    Left = 253
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TovarNo'
      end>
    object quCuttingMashFilterGroupCuttingId: TIntegerField
      FieldName = 'GroupCuttingId'
    end
    object quCuttingMashFilterGroupCutting: TStringField
      FieldName = 'GroupCutting'
      Size = 30
    end
  end
  object dsCuttingMashFilter: TMSDataSource
    DataSet = quCuttingMashFilter
    Left = 253
    Top = 40
  end
  object sdExportCuttingMeshInExel: TSaveDialog
    Left = 312
  end
end
