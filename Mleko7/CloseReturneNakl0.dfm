inherited fmCloseReturneNakl: TfmCloseReturneNakl
  Left = 899
  Top = 183
  Width = 654
  Height = 501
  Caption = #1057#1087#1080#1089#1086#1082' '#1085#1072#1082#1083#1072#1076#1085#1099#1093' '#1076#1083#1103' '#1089#1087#1080#1089#1072#1085#1080#1103' '#1076#1086#1083#1075#1072
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 638
    Height = 25
    Align = alTop
    TabOrder = 0
    object Label2: TLabel
      Left = 8
      Top = 3
      Width = 174
      Height = 13
      Caption = #1044#1086#1083#1075' '#1087#1086' '#1079#1072#1082#1088#1099#1074#1072#1077#1084#1086#1081' '#1085#1072#1082#1083#1072#1076#1085#1086#1081':'
    end
    object Label1: TLabel
      Left = 187
      Top = 3
      Width = 65
      Height = 15
      AutoSize = False
      Caption = 'Label1'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 25
    Width = 638
    Height = 399
    Align = alClient
    TabOrder = 1
    object RxDBGrid2: TRxDBGrid
      Left = 1
      Top = 1
      Width = 636
      Height = 397
      Align = alClient
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
          Title.Caption = #1053#1086#1084#1077#1088
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
          FieldName = 'TipName'
          Title.Caption = #1058#1080#1087
          Width = 51
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NAME'
          Title.Caption = #1053#1072#1073#1086#1088
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OtdelName'
          Title.Caption = #1054#1090#1076#1077#1083
          Width = 50
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
  end
  object Panel3: TPanel [2]
    Left = 0
    Top = 424
    Width = 638
    Height = 38
    Align = alBottom
    TabOrder = 2
    object bbOk: TBitBtn
      Left = 86
      Top = 7
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
      Left = 182
      Top = 7
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
  end
  inherited ActionList: TActionList
    Left = 48
    Top = 24
  end
  object quNaklR: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT   NaklR.SummaDolg'
      '       , NaklR.NaklNo'
      '       , TipNakl.TipName'
      '       , NaklR.Summa'
      '       , NaklR.DateNakl'
      '       , NaklR.Buh'
      '       , NaklR.PostNo'
      '       , o.OtdelName'
      '       , NaklR.Nom'
      '       , NaklR.SET_ARTICLE_GROUP_ID'
      '       , dsag.NAME'
      'FROM NaklR INNER JOIN'
      '     TipNakl ON NaklR.Buh = TipNakl.TipNo inner join '
      '     vidotdel o on NaklR.OtdelNo=o.OtdelNo left join'
      
        '     D_SET_ARTICLE_GROUP dsag on dsag.ID = NaklR.SET_ARTICLE_GRO' +
        'UP_ID'
      ' where (NaklR.Buh=TipNakl.TipNo) '
      '   AND (SummaDolg < 0) '
      '   AND (Buh = :Buh) '
      '   AND (PostNo = :PostNo)      '
      '   AND NaklR.OurFirmNo= :OurFirmNo'
      'order by DateNakl')
    CachedUpdates = True
    BeforeOpen = quNaklRBeforeOpen
    Left = 16
    Top = 40
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Buh'
      end
      item
        DataType = ftInteger
        Name = 'PostNo'
      end
      item
        DataType = ftInteger
        Name = 'OurFirmNo'
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
      Origin = 'BASE.TipNakl.TipName'
      FixedChar = True
      Size = 10
    end
    object quNaklROtdelName: TStringField
      FieldName = 'OtdelName'
      Size = 0
    end
    object quNaklRBuh: TSmallintField
      FieldName = 'Buh'
    end
    object quNaklRPostNo: TSmallintField
      FieldName = 'PostNo'
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
  object quZachet: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'INSERT INTO NaklZachet'
      
        '                      (NaklZachet, NaklNoDolg, NaklNoAvans, Summ' +
        'aDolg, SummaAvans, DateZachet, SummaZachet)'
      
        'VALUES     (:NaklZachet, :NaklNoDolg, :NaklNoAvans, :SummaDolg, ' +
        ':SummaAvans, :DateZachet, :SummaZachet)')
    Left = 16
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NaklZachet'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'NaklNoDolg'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'NaklNoAvans'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'SummaDolg'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'SummaAvans'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'DateZachet'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'SummaZachet'
      end>
  end
  object spModify_Plat_Nakl_link: TMSStoredProc
    StoredProcName = 'sp_Modify_Plat_Nakl_link;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_Modify_Plat_Nakl_link;1(:p_ID, :p_entit' +
        'yNo_1, :p_entityNo_2, :p_Entity_Type_1, :p_Entity_Type_2, :p_Lin' +
        'k_Summa, :p_UserNo)}')
    Left = 16
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'p_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_entityNo_1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_entityNo_2'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_Entity_Type_1'
        ParamType = ptInput
        Size = 5
      end
      item
        DataType = ftString
        Name = 'p_Entity_Type_2'
        ParamType = ptInput
        Size = 5
      end
      item
        DataType = ftFloat
        Name = 'p_Link_Summa'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_UserNo'
        ParamType = ptInput
      end>
  end
end
