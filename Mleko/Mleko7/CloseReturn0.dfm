inherited fmCloseReturn: TfmCloseReturn
  Left = 449
  Top = 211
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1042#1079#1072#1080#1084#1086#1079#1072#1095#1077#1090
  ClientHeight = 553
  ClientWidth = 959
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl [0]
    Left = 0
    Top = 0
    Width = 959
    Height = 513
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = #1056#1072#1089#1093#1086#1076#1085#1099#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
      object RxDBGrid2: TRxDBGrid
        Left = 0
        Top = 0
        Width = 951
        Height = 401
        Align = alTop
        DataSource = dsNaklR
        Options = [dgTitles, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = RxDBGrid2DblClick
        OnKeyDown = RxDBGrid2KeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'NaklNo'
            Title.Caption = #1050#1086#1076
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nom'
            ReadOnly = True
            Title.Caption = #1053#1086#1084#1077#1088' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DateNakl'
            Title.Caption = #1044#1072#1090#1072
            Width = 59
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NAME'
            ReadOnly = True
            Title.Caption = #1053#1072#1073#1086#1088
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TipName'
            Title.Caption = #1058#1080#1087
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OtdelName'
            Title.Caption = #1054#1090#1076#1077#1083
            Width = 56
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Summa'
            Title.Caption = #1057#1091#1084#1084#1072
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SummaDolg'
            Title.Caption = #1044#1086#1083#1075
            Width = 65
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 401
        Width = 951
        Height = 84
        Align = alClient
        TabOrder = 1
        object Label9: TLabel
          Left = 73
          Top = 43
          Width = 66
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Label9'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Label8: TLabel
          Left = 138
          Top = 59
          Width = 66
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Label8'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Label7: TLabel
          Left = 138
          Top = 43
          Width = 66
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Label7'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Label6: TLabel
          Left = 138
          Top = 28
          Width = 66
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Label6'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Label5: TLabel
          Left = 9
          Top = 60
          Width = 66
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = #1050#1072#1089#1089#1072#1041
          Color = clWhite
          ParentColor = False
        end
        object Label4: TLabel
          Left = 9
          Top = 44
          Width = 66
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = #1041#1072#1085#1082
          Color = clWhite
          ParentColor = False
        end
        object Label3: TLabel
          Left = 9
          Top = 28
          Width = 66
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = #1050#1072#1089#1089#1072
          Color = clWhite
          ParentColor = False
        end
        object Label12: TLabel
          Left = 141
          Top = 12
          Width = 66
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = #1040#1074#1072#1085#1089
          Color = clWhite
          ParentColor = False
        end
        object Label11: TLabel
          Left = 75
          Top = 12
          Width = 66
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = #1044#1086#1083#1075
          Color = clWhite
          ParentColor = False
        end
        object Label10: TLabel
          Left = 73
          Top = 59
          Width = 66
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Label10'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Label1: TLabel
          Left = 73
          Top = 28
          Width = 66
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Label1'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1056#1072#1089#1093#1086#1076#1099' '#1076#1077#1085#1077#1075
      ImageIndex = 1
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 0
        Width = 951
        Height = 393
        Align = alTop
        DataSource = dsPlatR
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGridEh1DblClick
        OnKeyDown = DBGridEh1KeyDown
      end
      object Panel3: TPanel
        Left = 0
        Top = 393
        Width = 951
        Height = 92
        Align = alClient
        TabOrder = 1
        object Label2: TLabel
          Left = 75
          Top = 43
          Width = 66
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Label2'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Label13: TLabel
          Left = 140
          Top = 59
          Width = 66
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Label13'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Label14: TLabel
          Left = 140
          Top = 43
          Width = 66
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Label14'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Label15: TLabel
          Left = 140
          Top = 28
          Width = 66
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Label15'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Label16: TLabel
          Left = 9
          Top = 60
          Width = 66
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = #1050#1072#1089#1089#1072#1041
          Color = clWhite
          ParentColor = False
        end
        object Label17: TLabel
          Left = 9
          Top = 44
          Width = 66
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = #1041#1072#1085#1082
          Color = clWhite
          ParentColor = False
        end
        object Label18: TLabel
          Left = 9
          Top = 28
          Width = 66
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = #1050#1072#1089#1089#1072
          Color = clWhite
          ParentColor = False
        end
        object Label19: TLabel
          Left = 141
          Top = 12
          Width = 66
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = #1040#1074#1072#1085#1089
          Color = clWhite
          ParentColor = False
        end
        object Label20: TLabel
          Left = 75
          Top = 12
          Width = 66
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = #1044#1086#1083#1075
          Color = clWhite
          ParentColor = False
        end
        object Label21: TLabel
          Left = 75
          Top = 59
          Width = 66
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Label21'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Label22: TLabel
          Left = 75
          Top = 28
          Width = 66
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Label22'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
      end
    end
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 513
    Width = 959
    Height = 40
    Align = alBottom
    TabOrder = 1
    object bbOk: TBitBtn
      Left = 54
      Top = 16
      Width = 75
      Height = 25
      Caption = 'OK'
      ModalResult = 1
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
    object bbCancel: TBitBtn
      Left = 150
      Top = 16
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object quNaklR: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT NaklR.SummaDolg'
      '     , NaklR.NaklNo'
      '     , NaklR.Nom'
      '     , NaklR.SET_ARTICLE_GROUP_ID'
      '     , dsag.NAME'
      '     , TipNakl.TipName'
      '     , NaklR.Summa'
      '     , NaklR.DateNakl'
      '     , NaklR.Buh'
      '     , NaklR.PostNo'
      '     , o.OtdelName'
      'FROM NaklR INNER JOIN'
      '     TipNakl ON NaklR.Buh = TipNakl.TipNo inner join '
      '     vidotdel o on NaklR.OtdelNo=o.OtdelNo left join'
      
        '     D_SET_ARTICLE_GROUP dsag on dsag.ID = NaklR.SET_ARTICLE_GRO' +
        'UP_ID'
      ' where OurFirmNo= :OurFirmNo and (NaklR.Buh=TipNakl.TipNo) AND'
      
        '          (SummaDolg > 0) AND (Buh = 1) AND (PostNo = :PostNo) A' +
        'ND (0 <> :SummaDolg1) OR'
      
        '          (SummaDolg > 0) AND (Buh = 2) AND (PostNo = :PostNo) A' +
        'ND (0 <> :SummaDolg2) OR'
      
        '          (SummaDolg > 0) AND (Buh = 3) AND (PostNo = :PostNo) A' +
        'ND (0 <> :SummaDolg3)      '
      'order by DateNakl')
    CachedUpdates = True
    BeforeOpen = quNaklRBeforeOpen
    Left = 16
    Top = 40
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OurFirmNo'
      end
      item
        DataType = ftSmallint
        Name = 'PostNo'
      end
      item
        DataType = ftFloat
        Name = 'SummaDolg1'
      end
      item
        DataType = ftSmallint
        Name = 'PostNo'
      end
      item
        DataType = ftFloat
        Name = 'SummaDolg2'
      end
      item
        DataType = ftSmallint
        Name = 'PostNo'
      end
      item
        DataType = ftFloat
        Name = 'SummaDolg3'
      end>
    object quNaklRNaklNo: TIntegerField
      FieldName = 'NaklNo'
      Origin = 'BASE.NaklR.NaklNo'
    end
    object quNaklRDateNakl: TDateTimeField
      FieldName = 'DateNakl'
      Origin = 'BASE.NaklR.DateNakl'
    end
    object quNaklRSumma: TFloatField
      FieldName = 'Summa'
      Origin = 'BASE.NaklR.Summa'
      DisplayFormat = '0.00'
    end
    object quNaklRSummaDolg: TFloatField
      FieldName = 'SummaDolg'
      Origin = 'BASE.NaklR.SummaDolg'
      DisplayFormat = '0.00'
    end
    object quNaklRTipName: TStringField
      FieldName = 'TipName'
      Origin = 'NaklR.NaklNo'
      Size = 10
    end
    object quNaklRBuh: TSmallintField
      FieldName = 'Buh'
      Origin = 'BASE.NaklR.Buh'
    end
    object quNaklRPostNo: TSmallintField
      FieldName = 'PostNo'
      Origin = 'BASE.NaklR.PostNo'
    end
    object quNaklROtdelName: TStringField
      FieldName = 'OtdelName'
      Size = 0
    end
    object quNaklRNom: TIntegerField
      FieldName = 'Nom'
    end
    object quNaklRSET_ARTICLE_GROUP_ID: TLargeintField
      FieldName = 'SET_ARTICLE_GROUP_ID'
    end
    object quNaklRNAME: TStringField
      FieldName = 'NAME'
      Size = 512
    end
  end
  object dsNaklR: TDataSource
    DataSet = quNaklR
    Left = 16
    Top = 72
  end
  object quNaklRDolg: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT     SUM(SummaDolg) AS Summ'
      'FROM         NaklR'
      
        'WHERE     (SummaDolg < 0) AND (Buh = :Buh) and OurFirmNo = :OurF' +
        'IrmNo'
      'GROUP BY PostNo, Buh'
      'HAVING      (PostNo = :PostNo)')
    BeforeOpen = quNaklRDolgBeforeOpen
    Left = 224
    Top = 432
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'Buh'
      end
      item
        DataType = ftUnknown
        Name = 'OurFIrmNo'
      end
      item
        DataType = ftSmallint
        Name = 'PostNo'
      end>
    object quNaklRDolgSumm: TFloatField
      FieldName = 'Summ'
      Origin = 'BASE.NaklR.SummaDolg'
    end
  end
  object quNaklROplat: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT     SUM(SummaDolg) AS Summ'
      'FROM         NaklR'
      
        'WHERE     (SummaDolg > 0) AND (Buh = :Buh) and OurFIrmNo= :OurFi' +
        'rmNo'
      'GROUP BY PostNo, Buh'
      'HAVING      (PostNo = :PostNo)')
    BeforeOpen = quNaklROplatBeforeOpen
    Left = 224
    Top = 464
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Buh'
      end
      item
        DataType = ftUnknown
        Name = 'OurFirmNo'
      end
      item
        DataType = ftUnknown
        Name = 'PostNo'
      end>
    object quNaklROplatSumm: TFloatField
      FieldName = 'Summ'
      Origin = 'BASE.NaklR.SummaDolg'
    end
  end
  object quPlatR: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT pr.SummaDolg'
      '     , pr.PlatNo as NaklNo'
      '     , pr.Nom'
      '     , TipNakl.TipName'
      '     , pr.Summa'
      '     , pr.DatePlat'
      '     , pr.Buh'
      '     , pr.PostNo'
      '     , o.OtdelName'
      
        '     , (select name from D_Response_Dept where id = pr.response_' +
        'dept_id) as ResponseDeptName'
      
        '     , (select name from D_Activity_Type where id = pr.activity_' +
        'type_id) as ActivityTypeName'
      '     , pr.Spravka'
      '     , drd.NAME as ResponseDeptNameOtdel'
      '     , dat.name as ActivityTypeNameOtdel'
      
        '     , (select VidRashodName from VidRashod where VidRashodNo = ' +
        'pr.VidRashodNo) as VidRashodName'
      'FROM PlatR pr INNER JOIN'
      '     TipNakl ON pr.Buh = TipNakl.TipNo inner join '
      '     vidotdel o on pr.OtdelNo=o.OtdelNo left join'
      #9' l_VidOtdelProp lvop on lvop.OtdelNo = pr.OtdelNo left join'
      
        #9' D_Response_Dept drd on drd.ID = lvop.D_RESPONSE_DEPT_ID left j' +
        'oin'
      #9' D_Activity_Type dat on dat.id = lvop.D_ACTIVITY_TYPE_ID'
      ' where OurFirmNo= :OurFirmNo '
      '   and (pr.Buh=TipNakl.TipNo) '
      
        '   AND ((SummaDolg > 0) AND (Buh = 1) AND (PostNo = :PostNo) /*A' +
        'ND (0 <> :SummaDolg1)*/ OR'
      
        '        (SummaDolg > 0) AND (Buh = 2) AND (PostNo = :PostNo) /*A' +
        'ND (0 <> :SummaDolg2)*/ OR'
      
        '        (SummaDolg > 0) AND (Buh = 3) AND (PostNo = :PostNo)) /*' +
        'AND (0 <> :SummaDolg3)*/      '
      '   and pr.TipPlat <> 7'
      'order by DatePlat')
    CachedUpdates = True
    BeforeOpen = quPlatRBeforeOpen
    Left = 55
    Top = 40
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OurFirmNo'
      end
      item
        DataType = ftSmallint
        Name = 'PostNo'
      end
      item
        DataType = ftSmallint
        Name = 'PostNo'
      end
      item
        DataType = ftSmallint
        Name = 'PostNo'
      end>
    object quPlatRNaklNo: TIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'NaklNo'
    end
    object quPlatRNom: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'Nom'
    end
    object quPlatRDatePlat: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DatePlat'
    end
    object quPlatRTipName: TStringField
      DisplayLabel = #1058#1080#1087
      FieldName = 'TipName'
      Size = 10
    end
    object quPlatRSumma: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'Summa'
    end
    object quPlatRSummaDolg: TFloatField
      DisplayLabel = #1044#1086#1083#1075
      FieldName = 'SummaDolg'
    end
    object quPlatROtdelName: TStringField
      DisplayLabel = #1054#1090#1076#1077#1083
      FieldName = 'OtdelName'
      Size = 30
    end
    object quPlatRActivityTypeName: TStringField
      DisplayLabel = #1042#1080#1076' '#1076#1077#1103#1090#1077#1083#1100#1085#1086#1089#1090#1080
      DisplayWidth = 20
      FieldName = 'ActivityTypeName'
      Size = 100
    end
    object quPlatRSpravka: TStringField
      DisplayLabel = #1054#1087#1080#1089#1072#1085#1080#1077
      DisplayWidth = 50
      FieldName = 'Spravka'
      Size = 55
    end
    object quPlatRBuh: TSmallintField
      FieldName = 'Buh'
      Visible = False
    end
    object quPlatRPostNo: TSmallintField
      FieldName = 'PostNo'
      Visible = False
    end
    object quPlatRResponseDeptNameOtdel: TStringField
      FieldName = 'ResponseDeptNameOtdel'
      Visible = False
      Size = 512
    end
    object quPlatRActivityTypeNameOtdel: TStringField
      FieldName = 'ActivityTypeNameOtdel'
      Visible = False
      Size = 100
    end
    object quPlatRVidRashodName: TStringField
      DisplayLabel = #1042#1080#1076' '#1088#1072#1089#1093#1086#1076#1072
      FieldName = 'VidRashodName'
      ReadOnly = True
      Size = 50
    end
    object quPlatRResponseDeptName: TStringField
      DisplayLabel = #1062#1060#1054
      DisplayWidth = 20
      FieldName = 'ResponseDeptName'
      Size = 512
    end
  end
  object dsPlatR: TDataSource
    DataSet = quPlatR
    Left = 55
    Top = 72
  end
  object quPlatRDolg: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT     SUM(SummaDolg) AS Summ'
      'FROM         PlatR'
      
        'WHERE     (SummaDolg < 0) AND (Buh = :Buh) and OurFirmNo = :OurF' +
        'IrmNo'
      'GROUP BY PostNo, Buh'
      'HAVING      (PostNo = :PostNo)')
    BeforeOpen = quPlatRDolgBeforeOpen
    Left = 261
    Top = 432
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'Buh'
      end
      item
        DataType = ftSmallint
        Name = 'OurFIrmNo'
      end
      item
        DataType = ftInteger
        Name = 'PostNo'
      end>
    object quPlatRDolgSumm: TFloatField
      FieldName = 'Summ'
      ReadOnly = True
    end
  end
  object quPlatROplat: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT     SUM(SummaDolg) AS Summ'
      'FROM         PlatR'
      
        'WHERE     (SummaDolg > 0) AND (Buh = :Buh) and OurFIrmNo= :OurFi' +
        'rmNo'
      'GROUP BY PostNo, Buh'
      'HAVING      (PostNo = :PostNo)')
    BeforeOpen = quPlatROplatBeforeOpen
    Left = 262
    Top = 464
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'Buh'
      end
      item
        DataType = ftSmallint
        Name = 'OurFirmNo'
      end
      item
        DataType = ftInteger
        Name = 'PostNo'
      end>
    object quPlatROplatSumm: TFloatField
      FieldName = 'Summ'
      ReadOnly = True
    end
  end
end
