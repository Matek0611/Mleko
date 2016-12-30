inherited fmAccountCashRashod: TfmAccountCashRashod
  Left = 327
  Top = 130
  Width = 462
  Height = 294
  Caption = 'fmAccountCashRashod'
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 226
    Width = 454
    Height = 41
    Align = alBottom
    TabOrder = 2
    object bbOk: TBitBtn
      Left = 208
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
      Left = 320
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
    Top = 116
    Width = 454
    Height = 110
    Align = alBottom
    BevelInner = bvLowered
    BorderWidth = 4
    Caption = 'Panel2'
    TabOrder = 1
    object ScrollBox: TScrollBox
      Left = 6
      Top = 6
      Width = 442
      Height = 98
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
        Top = 8
        Width = 26
        Height = 13
        Caption = #1044#1072#1090#1072
      end
      object Label5: TLabel
        Left = 80
        Top = 8
        Width = 34
        Height = 13
        Caption = #1057#1091#1084#1084#1072
      end
      object Label6: TLabel
        Left = 8
        Top = 48
        Width = 63
        Height = 13
        Caption = #1042#1080#1076' '#1088#1072#1089#1093#1086#1076#1072
      end
      object Label1: TLabel
        Left = 176
        Top = 8
        Width = 19
        Height = 13
        Caption = #1058#1080#1087
      end
      object EditDate: TMaskEdit
        Left = 8
        Top = 24
        Width = 64
        Height = 21
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '  .  .    '
      end
      object cbType: TComboBox
        Left = 176
        Top = 24
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        Items.Strings = (
          #1050#1072#1089#1089#1072
          #1050#1072#1089#1089#1072#1041#1072#1085#1082)
      end
      object ComboBox1: TComboBox
        Left = 8
        Top = 64
        Width = 425
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        Sorted = True
        TabOrder = 2
      end
      object EditSumma: TCurrencyEdit
        Left = 80
        Top = 24
        Width = 89
        Height = 21
        AutoSize = False
        DisplayFormat = ',0.00;-,0.00'
        TabOrder = 3
      end
    end
  end
  object RxDBGrid1: TRxDBGrid [2]
    Left = 0
    Top = 0
    Width = 454
    Height = 116
    TabStop = False
    Align = alClient
    DataSource = dsDolg
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    MultiSelect = True
    Columns = <
      item
        Expanded = False
        FieldName = 'DatePlat'
        Title.Caption = #1044#1072#1090#1072
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Summa'
        Title.Caption = #1057#1091#1084#1084#1072
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Spravka'
        Title.Caption = #1057#1087#1088#1072#1074#1082#1072
        Width = 273
        Visible = True
      end>
  end
  object quDolg: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'SELECT Dbo_platr.PlatNo, Dbo_platr.Nom, Dbo_platr.PostNo, Dbo_pl' +
        'atr.DatePlat, Dbo_platr.Summa, Dbo_platr.SummaDolg, Dbo_platr.Bu' +
        'h, Dbo_platr.Spravka, Dbo_platr.TipPlat, Dbo_platr.UserNo, Dbo_p' +
        'ost.Name'
      'FROM dbo.PlatR Dbo_platr, dbo.Post Dbo_post'
      
        'WHERE  (Dbo_platr.PostNo = Dbo_post.PostNo)  AND  (Dbo_platr.Pos' +
        'tNo = :PostNo)  AND Dbo_platr.is_econom=0'
      'ORDER BY (Dbo_platr.DatePlat)')
    Left = 46
    Top = 22
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'PostNo'
        ParamType = ptInput
      end>
    object quDolgDatePlat: TDateTimeField
      FieldName = 'DatePlat'
      Origin = 'BASE.PlatR.DatePlat'
    end
    object quDolgSumma: TFloatField
      FieldName = 'Summa'
      Origin = 'BASE.PlatR.Summa'
    end
    object quDolgNom: TIntegerField
      FieldName = 'Nom'
      Origin = 'BASE.PlatR.Nom'
    end
    object quDolgPlatNo: TIntegerField
      FieldName = 'PlatNo'
      Origin = 'BASE.PlatR.PlatNo'
    end
    object quDolgSpravka: TStringField
      FieldName = 'Spravka'
      Origin = 'BASE.PlatR.Spravka'
      FixedChar = True
      Size = 55
    end
    object quDolgPostNo: TSmallintField
      FieldName = 'PostNo'
      Origin = 'BASE.PlatR.PostNo'
    end
    object quDolgSummaDolg: TFloatField
      FieldName = 'SummaDolg'
      Origin = 'BASE.PlatR.SummaDolg'
    end
    object quDolgBuh: TSmallintField
      FieldName = 'Buh'
      Origin = 'BASE.PlatR.Buh'
    end
    object quDolgTipPlat: TSmallintField
      FieldName = 'TipPlat'
      Origin = 'BASE.PlatR.TipPlat'
    end
    object quDolgUserNo: TSmallintField
      FieldName = 'UserNo'
      Origin = 'BASE.PlatR.UserNo'
    end
    object quDolgName: TStringField
      FieldName = 'Name'
      Origin = 'BASE.Post.Name'
      FixedChar = True
      Size = 30
    end
  end
  object dsDolg: TDataSource
    DataSet = quDolg
    Left = 48
    Top = 72
  end
  object quPlatToPlatR: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'INSERT INTO PlatR'
      
        ' (PostNo, DatePlat, Summa, Buh, Spravka, UserNo, PlatNo,OurFirmN' +
        'o,SummaDolg)'
      'VALUES'
      
        ' (:PostNo, :DatePlat, :Summa, :Buh, :Spravka, :UserNo, :PlatNo, ' +
        ':OurFirmNo, :SummaDolg)')
    Left = 118
    Top = 19
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PostNo'
      end
      item
        DataType = ftUnknown
        Name = 'DatePlat'
      end
      item
        DataType = ftUnknown
        Name = 'Summa'
      end
      item
        DataType = ftUnknown
        Name = 'Buh'
      end
      item
        DataType = ftUnknown
        Name = 'Spravka'
      end
      item
        DataType = ftUnknown
        Name = 'UserNo'
      end
      item
        DataType = ftUnknown
        Name = 'PlatNo'
      end
      item
        DataType = ftSmallint
        Name = 'OurFirmNo'
        ParamType = ptInput
        Value = '1'
      end
      item
        DataType = ftFloat
        Name = 'SummaDolg'
        ParamType = ptInput
      end>
  end
  object quCountPlatR: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT MAX(PlatNo) PlatNoMAX'
      'FROM dbo.PlatR Dbo_platr')
    Left = 120
    Top = 64
    object quCountPlatRPlatNoMAX: TIntegerField
      FieldName = 'PlatNoMAX'
      Origin = 'BASE.PlatR.PlatNo'
    end
  end
end
