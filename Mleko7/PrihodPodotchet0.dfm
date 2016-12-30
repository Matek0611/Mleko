inherited fmEditPodotchet: TfmEditPodotchet
  Left = 943
  Top = 149
  Width = 575
  Height = 256
  Caption = 'fmEditPodotchet'
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 177
    Width = 559
    Height = 41
    Align = alBottom
    TabOrder = 1
    object bbOk: TBitBtn
      Left = 216
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
      Left = 296
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object RxDBGrid1: TRxDBGrid [1]
    Left = 0
    Top = 0
    Width = 559
    Height = 177
    Align = alClient
    DataSource = dsPodotchetR
    Options = [dgTitles, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'PodotchetRNo'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1053#1086#1084#1077#1088
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DatePodotche'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nom'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1082#1083
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DateNaklFirst'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1077' '#1085#1072#1082#1083
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Name'
        Title.Alignment = taCenter
        Title.Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100
        Width = 220
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SummaDolg'
        Title.Alignment = taCenter
        Title.Caption = #1057#1091#1084#1084#1072' '#1076#1086#1083#1075#1072
        Width = 77
        Visible = True
      end>
  end
  object dsPodotchetR: TDataSource
    DataSet = quPodotchetR
    Left = 32
    Top = 78
  end
  object quPodotchetR: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'SELECT     PodotchetR.PodotchetRNo, PodotchetR.DatePodotche, Nak' +
        'lR.Nom, Post.Name, NaklR.DateNaklFirst, '
      
        '                      PodotchetR.Summa - PodotchetR.SummaPlat AS' +
        ' SummaDolg, PodotchetR.SotrudNo'
      'FROM         PodotchetR INNER JOIN'
      
        '                      NaklR ON PodotchetR.NaklNo = NaklR.NaklNo ' +
        'INNER JOIN'
      '                      Post ON NaklR.PostNo = Post.PostNo'
      
        'WHERE     (PodotchetR.SummaPlat <> PodotchetR.Summa) AND (Podotc' +
        'hetR.SotrudNo = :SotrudNo)'
      'ORDER BY PodotchetR.DatePodotche')
    Left = 32
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SotrudNo'
      end>
    object quPodotchetRPodotchetRNo: TSmallintField
      FieldName = 'PodotchetRNo'
    end
    object quPodotchetRDatePodotche: TDateTimeField
      FieldName = 'DatePodotche'
    end
    object quPodotchetRNom: TIntegerField
      FieldName = 'Nom'
    end
    object quPodotchetRName: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 30
    end
    object quPodotchetRDateNaklFirst: TDateTimeField
      FieldName = 'DateNaklFirst'
    end
    object quPodotchetRSummaDolg: TFloatField
      FieldName = 'SummaDolg'
    end
    object quPodotchetRSotrudNo: TSmallintField
      FieldName = 'SotrudNo'
    end
  end
  object quWork: TMSQuery
    Connection = dmDataModule.DB
    Left = 248
    Top = 40
  end
  object quPodotchetP: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'INSERT INTO PodotchetP'
      
        '                      (PodotchetPNo, SotrudNo, PodotchetRNo, Dat' +
        'ePlat, Summa)'
      
        'VALUES     (:PodotchetPNo, :SotrudNo, :PodotchetRNo, :DatePlat, ' +
        ':Summa)')
    Left = 80
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PodotchetPNo'
      end
      item
        DataType = ftUnknown
        Name = 'SotrudNo'
      end
      item
        DataType = ftUnknown
        Name = 'PodotchetRNo'
      end
      item
        DataType = ftUnknown
        Name = 'DatePlat'
      end
      item
        DataType = ftUnknown
        Name = 'Summa'
      end>
  end
end
