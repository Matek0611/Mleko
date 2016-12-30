inherited fmDolgNam: TfmDolgNam
  Left = 345
  Top = 230
  ActiveControl = grDolg
  BorderStyle = bsDialog
  Caption = #1044#1086#1083#1078#1085#1080#1082#1080
  ClientHeight = 409
  ClientWidth = 517
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 368
    Width = 517
    Height = 41
    Align = alBottom
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 368
      Top = 10
      Width = 81
      Height = 25
      Cancel = True
      Caption = #1042#1099#1093#1086#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ModalResult = 2
      ParentFont = False
      TabOrder = 0
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
    object bbPrint: TBitBtn
      Left = 88
      Top = 10
      Width = 75
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = bbPrintClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
  end
  object PageControl1: TPageControl [1]
    Left = 0
    Top = 0
    Width = 517
    Height = 368
    ActivePage = tsDolg
    Align = alClient
    TabOrder = 1
    OnChange = PageControl1Change
    object tsDolg: TTabSheet
      Caption = #1044#1086#1083#1075#1080
      object grDolg: TRxDBGrid
        Left = 0
        Top = 0
        Width = 509
        Height = 340
        Align = alClient
        DataSource = dsDolg
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnKeyDown = grDolgKeyDown
        OnKeyPress = grDolgKeyPress
        OnGetCellParams = grDolgGetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'Name'
            Title.Caption = #1044#1086#1083#1078#1085#1080#1082
            Width = 283
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Dolg'
            Title.Caption = #1044#1086#1083#1075
            Width = 67
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MinDate'
            Title.Caption = #1054#1087#1083#1072#1090#1072
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PSrok'
            Title.Caption = #1055#1088#1086#1089#1088#1086#1095#1082#1072
            Visible = True
          end>
      end
    end
    object tsNakl: TTabSheet
      Caption = #1053#1072#1082#1083#1072#1076#1085#1099#1077
      object RxDBGrid1: TRxDBGrid
        Left = 0
        Top = 0
        Width = 509
        Height = 340
        Align = alClient
        DataSource = dsNaklR
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = RxDBGrid1DblClick
        OnKeyDown = RxDBGrid1KeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'Nom'
            Title.Caption = #8470
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BuhName'
            Title.Caption = #1058#1080#1087
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OtdelName'
            Title.Caption = #1054#1090#1076#1077#1083
            Width = 99
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DateNakl'
            Title.Caption = #1044#1072#1090#1072
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DateOpl'
            Title.Caption = #1054#1087#1083#1072#1090#1072
            Width = 62
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Summa'
            Title.Caption = #1057#1091#1084#1084#1072
            Width = 61
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SummaDolg'
            Title.Caption = #1044#1086#1083#1075
            Width = 62
            Visible = True
          end>
      end
    end
  end
  object dsDolg: TDataSource
    DataSet = quDolg
    Left = 32
    Top = 64
  end
  object quDolg: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'select sum(SummaDolg) Dolg,NaklR.PostNo,Min(dateOpl) MinDate,Pos' +
        't.Name,Post.Phone,'
      '       Post.Contact ContactFace,Sotrud.SotrudName'
      
        'from NaklR,Post left outer join Sotrud on (Sotrud.SotrudNo=Post.' +
        'SotrudNo)'
      'where (SummaDolg<>0) and'
      '      (Post.PostNo=NaklR.PostNo) and NaklR.OurFirmNo= :OurFirmNo'
      
        'group by NaklR.PostNo,Post.Name,Post.Phone,Post.Contact,Sotrud.S' +
        'otrudName'
      'order by Post.Name'
      '')
    BeforeOpen = quDolgBeforeOpen
    OnCalcFields = quDolgCalcFields
    Options.EnableBCD = True
    Left = 32
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'OurFirmNo'
      end>
    object quDolgPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object quDolgName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object quDolgPSrok: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'PSrok'
      Calculated = True
    end
    object quDolgDolg: TBCDField
      FieldName = 'Dolg'
      DisplayFormat = '#,##0.00'
      Size = 2
    end
    object quDolgMinDate: TDateTimeField
      FieldName = 'MinDate'
    end
    object quDolgPhone: TStringField
      FieldName = 'Phone'
      Size = 15
    end
    object quDolgContactFace: TStringField
      FieldName = 'ContactFace'
      Size = 50
    end
    object quDolgSotrudName: TStringField
      FieldName = 'SotrudName'
      Size = 30
    end
  end
  object dsNaklR: TDataSource
    DataSet = quNaklR
    Left = 80
    Top = 64
  end
  object quNaklR: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'SELECT     NaklR.NaklNo, NaklR.Nom, NaklR.SummaDolg, NaklR.DateN' +
        'akl, NaklR.Summa, NaklR.DateOpl, TipNakl.TipName AS BuhName, '
      '                      VidOtdel.OtdelName'
      'FROM         NaklR INNER JOIN'
      
        '                      TipNakl ON NaklR.Buh = TipNakl.TipNo INNER' +
        ' JOIN'
      
        '                      VidOtdel ON NaklR.OtdelNo = VidOtdel.Otdel' +
        'No'
      'where (SummaDolg<>0) and'
      '      (PostNo=:PostNo) and OurFirmNo= :OurFirmNo'
      'order by NaklR.DateNakl')
    BeforeOpen = quNaklRBeforeOpen
    Options.EnableBCD = True
    Left = 80
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PostNo'
      end
      item
        DataType = ftUnknown
        Name = 'OurFirmNo'
      end>
    object quNaklRNaklNo: TIntegerField
      FieldName = 'NaklNo'
    end
    object quNaklRNom: TIntegerField
      FieldName = 'Nom'
    end
    object quNaklRSumma: TBCDField
      FieldName = 'Summa'
      Origin = 'NaklR.Summa'
      DisplayFormat = '#,##0.00'
      Size = 2
    end
    object quNaklRSummaDolg: TBCDField
      FieldName = 'SummaDolg'
      Origin = 'NaklR.SummaDolg'
      DisplayFormat = '#,##0.00'
      Size = 2
    end
    object quNaklRDateNakl: TDateTimeField
      FieldName = 'DateNakl'
      Origin = 'NaklR.DateNakl'
    end
    object quNaklRDateOpl: TDateTimeField
      FieldName = 'DateOpl'
      Origin = 'NaklR.DateOpl'
    end
    object quNaklRBuhName: TStringField
      FieldName = 'BuhName'
      Origin = 'TipNakl.TipName'
      Size = 10
    end
    object quNaklROtdelName: TStringField
      FieldName = 'OtdelName'
      FixedChar = True
      Size = 30
    end
  end
  object dsRashod: TDataSource
    DataSet = quRashod
    Left = 128
    Top = 64
  end
  object quRashod: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select Rashod.RasNo,Rashod.Kol,Rashod.PriceOut,Tovar.NameTovar'
      'from Rashod,Tovar'
      'where (Rashod.NaklNo=:NaklNo) and'
      '      (Rashod.TovarNo=Tovar.TovarNo)')
    Options.EnableBCD = True
    MasterSource = dsNaklR
    Left = 128
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NaklNo'
      end>
    object quRashodNameTovar: TStringField
      FieldName = 'NameTovar'
      Size = 30
    end
    object quRashodRasNo: TSmallintField
      FieldName = 'RasNo'
      Origin = 'Rashod.RasNo'
    end
    object quRashodKol: TBCDField
      FieldName = 'Kol'
      Origin = 'Rashod.Kol'
      DisplayFormat = '0.###'
      Size = 3
    end
    object quRashodPriceOut: TBCDField
      FieldName = 'PriceOut'
      Origin = 'Rashod.PriceOut'
      DisplayFormat = '0.00##'
      Size = 6
    end
  end
end
