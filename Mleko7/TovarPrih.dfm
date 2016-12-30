inherited fmTovarPrih: TfmTovarPrih
  Left = 703
  Top = 203
  Width = 649
  Height = 403
  ActiveControl = bbOk
  Caption = #1055#1088#1080#1093#1086#1076' '#1090#1086#1074#1072#1088#1072
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object paBottom: TPanel [0]
    Left = 0
    Top = 274
    Width = 633
    Height = 90
    Align = alBottom
    TabOrder = 1
    object Bevel1: TBevel
      Left = 8
      Top = 8
      Width = 625
      Height = 41
    end
    object Label1: TLabel
      Left = 126
      Top = 9
      Width = 59
      Height = 13
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
    end
    object Label2: TLabel
      Left = 222
      Top = 9
      Width = 26
      Height = 13
      Caption = #1062#1077#1085#1072
    end
    object bbOk: TBitBtn
      Left = 264
      Top = 56
      Width = 75
      Height = 25
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 2
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
      Left = 344
      Top = 56
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 3
      Kind = bkCancel
    end
    object ceKol: TCurrencyEdit
      Left = 126
      Top = 24
      Width = 81
      Height = 21
      AutoSize = False
      DecimalPlaces = 3
      DisplayFormat = '0.000'
      TabOrder = 0
    end
    object cePrice: TCurrencyEdit
      Left = 222
      Top = 24
      Width = 81
      Height = 21
      AutoSize = False
      DecimalPlaces = 6
      DisplayFormat = '0.000000'
      TabOrder = 1
    end
    object cbTovarPrihForDateOfManufacture: TCheckBox
      Left = 328
      Top = 24
      Width = 209
      Height = 17
      Caption = #1053#1077' '#1089#1087#1088#1072#1096#1080#1074#1072#1090#1100' '#1076#1072#1090#1091' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1072
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
  end
  object RxDBGrid1: TRxDBGrid [1]
    Left = 0
    Top = 0
    Width = 633
    Height = 274
    Align = alClient
    DataSource = dmDataModule.dsTovar
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnExit = RxDBGrid1Exit
    OnKeyDown = RxDBGrid1KeyDown
    OnKeyPress = RxDBGrid1KeyPress
    TitleButtons = True
    OnTitleBtnClick = RxDBGrid1TitleBtnClick
    Columns = <
      item
        Expanded = False
        FieldName = 'TovarNo'
        ReadOnly = True
        Title.Caption = #1050#1086#1076
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VidName'
        Title.Caption = #1042#1080#1076
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NameTovar'
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 230
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EdIzm'
        Title.Caption = #1077#1076'.'#1080#1079#1084
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NameCompany'
        Title.Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BarCode'
        Title.Caption = #1064#1090#1088#1080#1093#1082#1086#1076
        Visible = True
      end>
  end
  object quLastPrihod: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'declare @art int'
      ''
      'set @art = :TovarNo'
      ''
      'SELECT distinct s.Price_eco AS Price'
      '  FROM DSPEC s'
      ' WHERE s.doc_date = (SELECT max(doc_date)'
      '                       FROM DSPEC'
      
        '                      WHERE doc_date < GetDate() AND article_id ' +
        '= @art AND doc_type_id in (1,2)) '
      '   AND s.doc_type_id in (1,2)'
      '   AND s.article_id =@art')
    Left = 240
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TovarNo'
      end>
  end
end
