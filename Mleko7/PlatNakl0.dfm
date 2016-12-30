inherited fmPlatNakl: TfmPlatNakl
  Left = 272
  Top = 298
  VertScrollBar.Smooth = True
  VertScrollBar.Style = ssFlat
  VertScrollBar.Tracking = True
  BorderStyle = bsDialog
  Caption = 'fmPlatNakl'
  ClientHeight = 149
  ClientWidth = 285
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object dbgListPlatP: TDBGridEh [0]
    Left = 6
    Top = 4
    Width = 273
    Height = 93
    DataSource = dsListPlatP
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'Nom'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #8470
      end
      item
        EditButtons = <>
        FieldName = 'DatePlat'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = 'SummaPlat'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1057#1091#1084#1084#1072
        Width = 68
      end
      item
        EditButtons = <>
        FieldName = 'DayDolg'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1083'. '#1076#1085#1077#1081
        Width = 51
      end>
  end
  object BitBtn1: TBitBtn [1]
    Left = 105
    Top = 116
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object dsListPlatP: TDataSource
    DataSet = qListPlatP
    Left = 44
    Top = 68
  end
  object qListPlatP: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'SELECT     PlatP.PlatNo, PlatP.Nom, PlatP.PostNo, PlatP.PostNoFi' +
        'rst, PlatP.DatePlat, PlatP.Summa, PlatP.SummaDolg, PlatP.Buh, Pl' +
        'atP.Spravka, PlatP.TipPlat, '
      
        '                      PlatToNakl.Summa AS SummaPlat, DATEDIFF(Da' +
        'y, NaklR.DateOpl, PlatP.DatePlat) AS DayDolg, NaklR.DateOpl, Pla' +
        'tToNakl.NaklNo, '
      
        '                      NaklR.Nom AS NaklNom, NaklR.DateNakl, Nakl' +
        'R.Summa AS NaklSum, NaklR.SummaDolg AS NaklDolg, Post.Name, Post' +
        '.NameLong'
      'FROM         PlatP INNER JOIN'
      
        '                      PlatToNakl ON PlatP.PlatNo = PlatToNakl.Pl' +
        'atNo INNER JOIN'
      
        '                      NaklR ON PlatToNakl.NaklNo = NaklR.NaklNo ' +
        'INNER JOIN'
      '                      Post ON NaklR.PostNoFirst = Post.PostNo'
      'WHERE     (PlatToNakl.NaklNo = :NaklNo)'
      'ORDER BY PlatP.DatePlat')
    Left = 96
    Top = 68
    ParamData = <
      item
        DataType = ftString
        Name = 'NaklNo'
        Size = 5
        Value = '53981'
      end>
    object qListPlatPPlatNo: TIntegerField
      FieldName = 'PlatNo'
    end
    object qListPlatPNom: TIntegerField
      FieldName = 'Nom'
    end
    object qListPlatPPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object qListPlatPPostNoFirst: TSmallintField
      FieldName = 'PostNoFirst'
    end
    object qListPlatPDatePlat: TDateTimeField
      FieldName = 'DatePlat'
    end
    object qListPlatPSumma: TFloatField
      FieldName = 'Summa'
    end
    object qListPlatPSummaDolg: TFloatField
      FieldName = 'SummaDolg'
    end
    object qListPlatPBuh: TSmallintField
      FieldName = 'Buh'
    end
    object qListPlatPSpravka: TStringField
      FieldName = 'Spravka'
      FixedChar = True
      Size = 55
    end
    object qListPlatPTipPlat: TSmallintField
      FieldName = 'TipPlat'
    end
    object qListPlatPSummaPlat: TFloatField
      FieldName = 'SummaPlat'
    end
    object qListPlatPDayDolg: TIntegerField
      FieldName = 'DayDolg'
    end
    object qListPlatPDateOpl: TDateTimeField
      FieldName = 'DateOpl'
    end
    object qListPlatPNaklNo: TIntegerField
      FieldName = 'NaklNo'
    end
    object qListPlatPNaklNom: TIntegerField
      FieldName = 'NaklNom'
    end
    object qListPlatPDateNakl: TDateTimeField
      FieldName = 'DateNakl'
    end
    object qListPlatPNaklSum: TFloatField
      FieldName = 'NaklSum'
    end
    object qListPlatPNaklDolg: TFloatField
      FieldName = 'NaklDolg'
    end
    object qListPlatPName: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 30
    end
    object qListPlatPNameLong: TStringField
      FieldName = 'NameLong'
      FixedChar = True
      Size = 80
    end
  end
end
