inherited fmEditExpedition: TfmEditExpedition
  Left = 322
  Top = 235
  Width = 995
  Height = 430
  BorderIcons = [biSystemMenu]
  Caption = #1061#1086#1076#1082#1072
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object paTop: TPanel [0]
    Left = 0
    Top = 0
    Width = 979
    Height = 46
    Align = alTop
    BevelInner = bvLowered
    Caption = 'paTop'
    TabOrder = 0
    OnExit = paTopExit
    object ScrollBox: TScrollBox
      Left = 2
      Top = 2
      Width = 975
      Height = 42
      HorzScrollBar.Margin = 6
      HorzScrollBar.Range = 341
      HorzScrollBar.Visible = False
      VertScrollBar.Margin = 6
      VertScrollBar.Range = 126
      VertScrollBar.Visible = False
      Align = alClient
      AutoScroll = False
      BorderStyle = bsNone
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 0
        Width = 34
        Height = 13
        Caption = #1053#1086#1084#1077#1088
      end
      object Label3: TLabel
        Left = 64
        Top = 0
        Width = 26
        Height = 13
        Caption = #1044#1072#1090#1072
        FocusControl = edDate
      end
      object Label6: TLabel
        Left = 304
        Top = 0
        Width = 60
        Height = 13
        Caption = #1069#1082#1089#1087#1077#1076#1080#1090#1086#1088
      end
      object Label5: TLabel
        Left = 136
        Top = 0
        Width = 62
        Height = 13
        Caption = #1040#1074#1090#1086#1084#1086#1073#1080#1083#1100
      end
      object Label2: TLabel
        Left = 488
        Top = 8
        Width = 239
        Height = 29
        AutoSize = False
        Caption = 
          #39'F5'#39' - '#1055#1088#1086#1089#1084#1086#1090#1088', '#39'F6'#39' - '#1055#1077#1095#1072#1090#1100#13#10#39'Insert'#39' - '#1044#1086#1073#1072#1074#1080#1090#1100', '#39'Enter'#39' - '#1056 +
          #1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
        WordWrap = True
      end
      object edDate: TDBEdit
        Left = 64
        Top = 16
        Width = 65
        Height = 21
        AutoSelect = False
        DataField = 'ExpeditionDateGo'
        DataSource = fmExpedition.dsExpedition
        TabOrder = 0
      end
      object edNom: TDBEdit
        Left = 8
        Top = 16
        Width = 49
        Height = 21
        TabStop = False
        DataField = 'ExpeditionNo'
        DataSource = fmExpedition.dsExpedition
        ReadOnly = True
        TabOrder = 3
      end
      object edCars: TDBEdit
        Left = 136
        Top = 16
        Width = 161
        Height = 21
        DataField = 'CarsName'
        DataSource = fmExpedition.dsExpedition
        ReadOnly = True
        TabOrder = 1
        OnDblClick = edCarsDblClick
        OnEnter = edCarsEnter
        OnKeyDown = edCarsKeyDown
      end
      object edShipping_Agent: TDBEdit
        Left = 304
        Top = 16
        Width = 177
        Height = 21
        DataField = 'Shipping_AgentName'
        DataSource = fmExpedition.dsExpedition
        ReadOnly = True
        TabOrder = 2
        OnDblClick = edShipping_AgentDblClick
        OnEnter = edShipping_AgentEnter
        OnKeyDown = edShipping_AgentKeyDown
      end
    end
  end
  object paMiddle: TPanel [1]
    Left = 0
    Top = 46
    Width = 979
    Height = 313
    Align = alClient
    BevelInner = bvLowered
    Caption = 'paMiddle'
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 2
      Width = 975
      Height = 309
      Align = alClient
      DataSource = dsNaklR
      Flat = True
      FooterColor = clBtnFace
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      FooterRowCount = 1
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGridEh1DblClick
      OnDrawColumnCell = DBGridEh1DrawColumnCell
      OnGetCellParams = DBGridEh1GetCellParams
      OnKeyDown = DBGridEh1KeyDown
      OnKeyPress = DBGridEh1KeyPress
      OnTitleBtnClick = DBGridEh1TitleBtnClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'InCar'
          Footers = <>
          KeyList.Strings = (
            '0')
          Title.Alignment = taCenter
          Title.Caption = 'V'
          Width = 19
        end
        item
          EditButtons = <>
          FieldName = 'NaklNo'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1053#1086#1084#1077#1088
          Title.TitleButton = True
          Width = 54
        end
        item
          EditButtons = <>
          FieldName = 'DateNakl'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072
          Title.TitleButton = True
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'Name'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
          Title.TitleButton = True
          Width = 177
        end
        item
          EditButtons = <>
          FieldName = 'NameFirst'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
          Visible = False
          Width = 214
        end
        item
          EditButtons = <>
          FieldName = 'Address'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1040#1076#1088#1077#1089
          Title.TitleButton = True
          Width = 182
        end
        item
          DisplayFormat = '0.00'
          EditButtons = <>
          EditMask = '0.00'
          FieldName = 'Summa'
          Footer.FieldName = 'Summa'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1057#1091#1084#1084#1072
          Title.TitleButton = True
          Width = 62
        end
        item
          DisplayFormat = '0.00'
          EditButtons = <>
          FieldName = 'Weight'
          Footer.FieldName = 'Weight'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1042#1077#1089
          Width = 62
        end
        item
          EditButtons = <>
          FieldName = 'KolPerPak'
          Footer.FieldName = 'KolPerPak'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1071#1097#1080#1082
          Width = 53
        end
        item
          EditButtons = <>
          FieldName = 'VidNaklName'
          Footers = <>
          Title.Caption = #1042#1080#1076' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'OrderInFlight'
          Footers = <>
          Title.Caption = #1053#1086#1084'. '#1074' '#1093#1086#1076#1082#1077
          Title.TitleButton = True
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'ArrivalTime'
          Footers = <>
          Title.Caption = #1042#1088#1077#1084#1103' '#1087#1088#1080#1073#1099#1090#1080#1103
          Title.TitleButton = True
          Width = 120
        end>
    end
  end
  object paBottom: TPanel [2]
    Left = 0
    Top = 359
    Width = 979
    Height = 32
    Align = alBottom
    TabOrder = 2
    object bbOk: TBitBtn
      Left = 491
      Top = 4
      Width = 91
      Height = 25
      Caption = #1054#1050
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
      Left = 587
      Top = 4
      Width = 91
      Height = 25
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 3
      TabOrder = 1
      OnClick = bbCancelClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object bbInsert: TBitBtn
      Left = 356
      Top = 4
      Width = 91
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 2
      OnClick = bbInsertClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333FF33333333FF333993333333300033377F3333333777333993333333
        300033F77FFF3333377739999993333333333777777F3333333F399999933333
        33003777777333333377333993333333330033377F3333333377333993333333
        3333333773333333333F333333333333330033333333F33333773333333C3333
        330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
        993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
        333333333337733333FF3333333C333330003333333733333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
    end
    object bbDelete: TBitBtn
      Left = 260
      Top = 4
      Width = 91
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 3
      OnClick = bbDeleteClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003333333333333777333333333333
        300033FFFFFF3333377739999993333333333777777F3333333F399999933333
        3300377777733333337733333333333333003333333333333377333333333333
        3333333333333333333F333333333333330033333F33333333773333C3333333
        330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
        993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
        333333377F33333333FF3333C333333330003333733333333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
    end
    object bbPriview: TBitBtn
      Left = 67
      Top = 4
      Width = 91
      Height = 25
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      TabOrder = 4
      OnClick = bbPriviewClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
        0000333377777777777733330FFFFFFFFFF033337F3FFF3F3FF733330F000F0F
        00F033337F777373773733330FFFFFFFFFF033337F3FF3FF3FF733330F00F00F
        00F033337F773773773733330FFFFFFFFFF033337FF3333FF3F7333300FFFF00
        F0F03333773FF377F7373330FB00F0F0FFF0333733773737F3F7330FB0BF0FB0
        F0F0337337337337373730FBFBF0FB0FFFF037F333373373333730BFBF0FB0FF
        FFF037F3337337333FF700FBFBFB0FFF000077F333337FF37777E0BFBFB000FF
        0FF077FF3337773F7F37EE0BFB0BFB0F0F03777FF3733F737F73EEE0BFBF00FF
        00337777FFFF77FF7733EEEE0000000003337777777777777333}
      NumGlyphs = 2
    end
    object bbPrint: TBitBtn
      Left = 163
      Top = 4
      Width = 91
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100
      TabOrder = 5
      OnClick = bbPrintClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0777777777777770888888888888888F077777777777
        7770888888888888888F0000000000000000FFFFFFFFFFFFFFFF0F7F7F7F7F7F
        7F70888888888888888F07F7F7F7F7F7F9F0888888888888888F0F7F7F7F7F7F
        7F708888888888888F8F0000000000000000888888888888888F3330FFFFFFFF
        03333338F3FFFF3F8F333330F0000F0F03333338F88883838F333330FFFFFFFF
        03333338F3FF3FFF8F333330F00F000003333338F883888883333330FFFF0FF0
        33333338F3FF8F3833333330F07F0F0333333338F8838F8333333330FFFF0033
        33333338FFFF8833333333300000033333333338888883333333}
      NumGlyphs = 2
    end
  end
  object quNaklR: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT h.naklno'
      '       ,h.nom'
      '       ,h.datenakl'
      '       ,h.summa'
      '       ,post.name'
      '       ,post_1.name         AS namefirst'
      '       ,h.expeditionno'
      '       ,addresspost.address'
      '       ,h.kolperpak'
      '       ,h.weight'
      '       ,h.buh'
      '       ,h.incar'
      '       ,post.print3'
      '       ,'#39'NAKLR'#39'             AS sourcetable'
      '       ,VidNaklName'
      '       , h.OrderInFlight'
      '       , h.ArrivalTime'
      'FROM   naklr h'
      '       INNER JOIN post'
      '         ON h.postno = post.postno'
      '       INNER JOIN addresspost'
      '         ON h.addressno = addresspost.addressno'
      '            AND h.postnofirst = addresspost.postno'
      '       INNER JOIN post post_1'
      '         ON h.postnofirst = post_1.postno'
      '       inner join VidNakl v on h.VidNaklNo=v.VidNaklNo'
      'WHERE  (h.expeditionno = :expeditionno)'
      'AND (h.expeditionno <> 0)'
      'UNION ALL'
      'SELECT b.id            AS naklno'
      '       ,b.subnum       AS nom'
      '       ,b.datenakl'
      '       ,b.summa'
      '       ,p.name         AS name'
      '       ,p.name         AS namefirst'
      '       ,b.expeditionno'
      '       ,a.address'
      '       ,0              AS kolperpak'
      '       ,b.weight'
      '       ,b.buh'
      '       ,b.incar'
      '       ,Cast(0 AS BIT) AS print3'
      '       ,'#39'E_BLANK_HEAD'#39' AS sourcetable'
      '       ,VidNaklName'
      '       , null as OrderInFlight'
      '       , null as ArrivalTime'
      'FROM   e_blank_head b'
      '       INNER JOIN post p'
      '         ON b.postno = p.postno'
      '       INNER JOIN addresspost a'
      '         ON b.addressno = a.addressno'
      '            AND b.postno = a.postno'
      '       inner join VidNakl v on b.VidNaklNo=v.VidNaklNo'
      'WHERE  (b.expeditionno = :expeditionno)'
      'AND (b.expeditionno <> 0)'
      'AND NOT EXISTS (SELECT 1'
      '                FROM   naklr'
      '                WHERE  id = b.id)'
      'AND b.summa <> 0'
      'ORDER BY &_order')
    Left = 40
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'expeditionno'
      end
      item
        DataType = ftString
        Name = 'expeditionno'
      end>
    MacroData = <
      item
        Name = '_order'
        Value = 'Nom'
      end>
    object quNaklRNaklNo: TIntegerField
      FieldName = 'NaklNo'
      Origin = '.'
    end
    object quNaklRNom: TIntegerField
      FieldName = 'Nom'
      Origin = '.'
    end
    object quNaklRSumma: TFloatField
      FieldName = 'Summa'
      Origin = '.'
    end
    object quNaklRName: TStringField
      FieldName = 'Name'
      Origin = '.'
      FixedChar = True
      Size = 30
    end
    object quNaklRNameFirst: TStringField
      FieldName = 'NameFirst'
      Origin = '.'
      FixedChar = True
      Size = 30
    end
    object quNaklRExpeditionNo: TSmallintField
      FieldName = 'ExpeditionNo'
      Origin = '.'
    end
    object quNaklRAddress: TStringField
      FieldName = 'Address'
      Origin = '.'
      FixedChar = True
      Size = 256
    end
    object quNaklRKolPerPak: TFloatField
      FieldName = 'KolPerPak'
      Origin = '.'
      Precision = 10
    end
    object quNaklRWeight: TFloatField
      FieldName = 'Weight'
      Origin = '.'
      Precision = 10
    end
    object quNaklRDateNakl: TDateTimeField
      FieldName = 'DateNakl'
      Origin = '.'
    end
    object quNaklRBuh: TSmallintField
      FieldName = 'Buh'
      Origin = '.'
    end
    object quNaklRInCar: TBooleanField
      FieldName = 'InCar'
      Origin = '.'
    end
    object quNaklRPrint3: TBooleanField
      FieldName = 'Print3'
      Origin = '.'
    end
    object quNaklRSourceTable: TStringField
      FieldName = 'SourceTable'
      Origin = '.'
      FixedChar = True
      Size = 12
    end
    object quNaklRVidNaklName: TStringField
      FieldName = 'VidNaklName'
      ReadOnly = True
    end
    object quNaklROrderInFlight: TIntegerField
      FieldName = 'OrderInFlight'
      ReadOnly = True
    end
    object quNaklRArrivalTime: TDateTimeField
      FieldName = 'ArrivalTime'
      ReadOnly = True
    end
  end
  object dsNaklR: TDataSource
    DataSet = quNaklR
    Left = 24
    Top = 144
  end
  object quNaklRSumm: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'SELECT     SUM(Summa) AS Summa, SUM(Weight) AS Weight, SUM(KolPe' +
        'rPak) AS KolPerPak'
      'FROM         '
      '('
      'select Summa,Weight,KolPerPak,ExpeditionNo'
      'from NaklR'
      'WHERE  ExpeditionNo = :ExpeditionNo  AND ExpeditionNo <> 0'
      'union all'
      'select Summa,Weight,0 as KolPerPak,ExpeditionNo'
      'from e_blank_head'
      'WHERE  ExpeditionNo = :ExpeditionNo  AND ExpeditionNo <> 0'
      ') u'
      '')
    Left = 112
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ExpeditionNo'
      end
      item
        DataType = ftUnknown
        Name = 'ExpeditionNo'
      end>
    object quNaklRSummSumma: TFloatField
      FieldName = 'Summa'
      Origin = 'BASE.NaklR.Summa'
    end
    object quNaklRSummWeight: TFloatField
      FieldName = 'Weight'
      Origin = 'BASE.NaklR.Weight'
    end
    object quNaklRSummKolPerPak: TFloatField
      FieldName = 'KolPerPak'
      Origin = 'BASE.NaklR.KolPerPak'
    end
  end
  object ImageList1: TImageList
    Left = 208
    Top = 96
  end
  object quNaklRUpDate: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'UPDATE    NaklR'
      'SET              InCar = :InCar'
      'WHERE     (NaklNo = :NaklNo)')
    Left = 168
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'InCar'
      end
      item
        DataType = ftUnknown
        Name = 'NaklNo'
      end>
    object BCDField1: TFloatField
      FieldName = 'Summa'
      Origin = 'BASE.NaklR.Summa'
    end
    object BCDField2: TFloatField
      FieldName = 'Weight'
      Origin = 'BASE.NaklR.Weight'
    end
    object BCDField3: TFloatField
      FieldName = 'KolPerPak'
      Origin = 'BASE.NaklR.KolPerPak'
    end
  end
  object quWork: TMSQuery
    Connection = dmDataModule.DB
    Left = 40
    Top = 216
  end
  object quBlankHeadUpDate: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'UPDATE    e_blank_head'
      'SET              InCar = :InCar'
      'WHERE     (ID = :NaklNo)')
    Left = 128
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'InCar'
      end
      item
        DataType = ftUnknown
        Name = 'NaklNo'
      end>
    object BCDField4: TFloatField
      FieldName = 'Summa'
      Origin = 'BASE.NaklR.Summa'
    end
    object BCDField5: TFloatField
      FieldName = 'Weight'
      Origin = 'BASE.NaklR.Weight'
    end
    object BCDField6: TFloatField
      FieldName = 'KolPerPak'
      Origin = 'BASE.NaklR.KolPerPak'
    end
  end
  object TTN_Query: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'Select TTN from Post '
      'where Name =:aa')
    Left = 208
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'aa'
      end>
  end
end
