inherited fmEditPlatR: TfmEditPlatR
  Left = 766
  Top = 260
  ActiveControl = EditSumma
  BorderStyle = bsDialog
  Caption = #1054#1087#1083#1072#1090#1072' '#1079#1072' '#1090#1086#1074#1072#1088
  ClientHeight = 311
  ClientWidth = 454
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 270
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
    Top = 125
    Width = 454
    Height = 145
    Align = alBottom
    BevelInner = bvLowered
    BorderWidth = 4
    Caption = 'Panel2'
    TabOrder = 1
    object ScrollBox: TScrollBox
      Left = 6
      Top = 6
      Width = 442
      Height = 133
      HorzScrollBar.Margin = 6
      HorzScrollBar.Range = 331
      VertScrollBar.Margin = 6
      VertScrollBar.Range = 84
      Align = alClient
      AutoScroll = False
      BorderStyle = bsNone
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 34
        Height = 13
        Caption = #1053#1086#1084#1077#1088
      end
      object Label4: TLabel
        Left = 312
        Top = 8
        Width = 26
        Height = 13
        Caption = #1044#1072#1090#1072
        FocusControl = EditDate
      end
      object Label5: TLabel
        Left = 8
        Top = 48
        Width = 34
        Height = 13
        Caption = #1057#1091#1084#1084#1072
        FocusControl = EditSumma
      end
      object Label6: TLabel
        Left = 8
        Top = 88
        Width = 43
        Height = 13
        Caption = #1057#1087#1088#1072#1074#1082#1072
        FocusControl = EditSpravka
      end
      object Label2: TLabel
        Left = 80
        Top = 8
        Width = 43
        Height = 13
        Caption = #1055#1072#1088#1090#1085#1077#1088
      end
      object Label3: TLabel
        Left = 136
        Top = 48
        Width = 19
        Height = 13
        Caption = #1058#1080#1087
      end
      object EditDate: TDBEdit
        Left = 312
        Top = 24
        Width = 68
        Height = 21
        DataField = 'DatePlat'
        DataSource = dsPlatR
        TabOrder = 2
        OnExit = EditDateExit
      end
      object EditSumma: TDBEdit
        Left = 8
        Top = 64
        Width = 109
        Height = 21
        DataField = 'Summa'
        DataSource = dsPlatR
        TabOrder = 3
      end
      object EditSpravka: TDBEdit
        Left = 8
        Top = 104
        Width = 288
        Height = 21
        DataField = 'Spravka'
        DataSource = dsPlatR
        TabOrder = 5
      end
      object tePost: TDBEdit
        Left = 80
        Top = 24
        Width = 209
        Height = 21
        DataField = 'Name'
        ReadOnly = True
        TabOrder = 1
      end
      object lcNameBuh: TDBLookupComboBox
        Left = 136
        Top = 64
        Width = 89
        Height = 21
        DataField = 'Buh'
        DataSource = dsPlatR
        KeyField = 'buh'
        ListField = 'Buh_type_name'
        ListSource = DSBuh
        TabOrder = 4
      end
      object edNom: TDBEdit
        Left = 8
        Top = 24
        Width = 49
        Height = 21
        DataField = 'Nom'
        DataSource = dsPlatR
        TabOrder = 0
      end
    end
  end
  object RxDBGrid1: TRxDBGrid [2]
    Left = 0
    Top = 0
    Width = 454
    Height = 125
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
        FieldName = 'Nom'
        Title.Caption = #1053#1086#1084#1077#1088
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DateNakl'
        Title.Caption = #1044#1072#1090#1072
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Summa'
        Title.Caption = #1057#1091#1084#1084#1072
        Width = 147
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SummaDolg'
        Title.Caption = #1044#1086#1083#1075
        Width = 143
        Visible = True
      end>
  end
  object quDolg: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'select NaklP.NaklNo,NaklP.Nom,NaklP.DateNakl,NaklP.Summa,NaklP.S' +
        'ummaDolg'
      'from NaklP'
      'where (SummaDolg<>0) and'
      '      (NaklP.PostNo=:PostNo) and'
      '      (Buh>=:BuhB and Buh<=:BuhE)'
      '     and NaklP.OurFIrmNo = :OurFirmNo'
      'order by NaklP.DateNakl      '
      '')
    BeforeOpen = quDolgBeforeOpen
    Left = 46
    Top = 22
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PostNo'
      end
      item
        DataType = ftSmallint
        Name = 'BuhB'
      end
      item
        DataType = ftSmallint
        Name = 'BuhE'
      end
      item
        DataType = ftUnknown
        Name = 'OurFirmNo'
      end>
    object quDolgNaklNo: TIntegerField
      FieldName = 'NaklNo'
      Origin = 'NaklP.NaklNo'
    end
    object quDolgNom: TIntegerField
      FieldName = 'Nom'
      Origin = 'NaklP.Nom'
    end
    object quDolgDateNakl: TDateTimeField
      FieldName = 'DateNakl'
      Origin = 'NaklP.DateNakl'
    end
    object quDolgSumma: TFloatField
      FieldName = 'Summa'
      Origin = 'NaklP.Summa'
      DisplayFormat = '#,##0.00'
    end
    object quDolgSummaDolg: TFloatField
      FieldName = 'SummaDolg'
      Origin = 'NaklP.SummaDolg'
      DisplayFormat = '#,##0.00'
    end
  end
  object dsDolg: TDataSource
    DataSet = quDolg
    Left = 48
    Top = 80
  end
  object quPlatToNakl: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'insert into PlatToNakl'
      ' (Tip,PlatNo,NaklNo,Summa)'
      'values'
      ' (2,:PlatNo,:NaklNo,:Summa)'
      '')
    Left = 326
    Top = 67
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PlatNo'
      end
      item
        DataType = ftUnknown
        Name = 'NaklNo'
      end
      item
        DataType = ftUnknown
        Name = 'Summa'
      end>
  end
  object quPlatR: TMSQuery
    SQLInsert.Strings = (
      'DECLARE @return_value   INT'
      ''
      ''
      'EXEC  @return_value = [work].dbo.sp_AddEntity'
      '    @p_Entity_type = '#39'PLATR'#39','
      '    @p_Nom = NULL,'
      '    @p_PostNo = :PostNo,'
      '    @p_DatePlat = :DatePlat,'
      '    @p_Summa = :Summa,'
      '    @p_Buh = :Buh,'
      '    @p_Spravka = :Spravka,'
      '    @p_TipPlat = :TipPlat,'
      '    @p_UserNo = :UserNo,'
      '    @p_SotrudNo = NULL,'
      '    @p_bank_invoice_id = NULL,'
      '    @p_activity_type_id = NULL,'
      '    @p_response_dept_id = NULL,'
      '    @p_VidRashodNo = NULL,'
      '    @p_OtdelNo = NULL,'
      '    @p_our_firmNo = :OurFirmNo,'
      '    @p_is_econom = 0,'
      '    @p_Pkey = :Pkey OUT')
    SQLDelete.Strings = (
      'EXEC  dbo.sp_DelEntity   @Pkey = :Pkey')
    SQLUpdate.Strings = (
      'DECLARE @return_value   INT'
      ''
      'EXEC  @return_value = [work].dbo.sp_EditEntity'
      '    @p_Entity_type = '#39'PLATR'#39','
      '    @p_Nom = NULL,'
      '    @p_PostNo = :PostNo,'
      '    @p_DatePlat = :DatePlat,'
      '    @p_Summa = :Summa,'
      '    @p_Buh = :Buh,'
      '    @p_Spravka = :Spravka,'
      '    @p_TipPlat = :TipPlat,'
      '    @p_UserNo = :UserNo,'
      '    @p_SotrudNo = NULL,'
      '    @p_bank_invoice_id = NULL,'
      '    @p_activity_type_id = NULL,'
      '    @p_response_dept_id = NULL,'
      '    @p_VidRashodNo = NULL,'
      '    @p_OtdelNo = NULL,'
      '    @p_our_firmNo = :OurFirmNo,'
      '    @p_is_econom = NULL,'
      '    @p_Pkey = :Pkey')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select PlatR.PlatNo,PlatR.Nom,PlatR.PostNo,PlatR.DatePlat,'
      '       PlatR.Summa,PlatR.Buh,PlatR.Spravka,PlatR.UserNo,'
      '       PlatR.TipPlat,Platr.SummaDolg,PlatR.OurFirmNo,PLatR.Pkey'
      'from PlatR'
      'where PlatR.Pkey = :pPkey')
    BeforeUpdateExecute = quPlatRBeforeUpdateExecute
    AfterUpdateExecute = quPlatRAfterUpdateExecute
    AfterPost = quPlatRAfterPost
    OnNewRecord = quPlatRNewRecord
    Left = 144
    Top = 48
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'pPkey'
        ParamType = ptInputOutput
        Value = -1
      end>
  end
  object dsPlatR: TDataSource
    DataSet = quPlatR
    Left = 144
    Top = 96
  end
  object quTipNakl: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select TipNo,TipName'
      'from TipNakl'
      'order by TipNo')
    Left = 198
    Top = 43
    object quTipNaklTipNo: TSmallintField
      FieldName = 'TipNo'
      Origin = 'TipNakl.TipNo'
    end
    object quTipNaklTipName: TStringField
      FieldName = 'TipName'
      Origin = 'TipNakl.TipName'
      Size = 10
    end
  end
  object quWork: TMSQuery
    Connection = dmDataModule.DB
    Left = 280
    Top = 24
  end
  object spModify_Plat_Nakl_link: TMSStoredProc
    StoredProcName = 'sp_Modify_Plat_Nakl_link;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_Modify_Plat_Nakl_link;1(:p_ID, :p_entit' +
        'yNo_1, :p_entityNo_2, :p_Entity_Type_1, :p_Entity_Type_2, :p_Lin' +
        'k_Summa, :p_UserNo)}')
    Left = 120
    Top = 208
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
  object QuBuh: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'Select * from d_buh_type')
    Left = 366
    Top = 167
  end
  object DSBuh: TDataSource
    Left = 366
    Top = 215
  end
end
