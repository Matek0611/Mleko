inherited fmCloseReturnePlat: TfmCloseReturnePlat
  Left = 552
  Top = 222
  Width = 1013
  Height = 453
  Caption = #1057#1087#1080#1089#1086#1082' '#1087#1088#1080#1093#1086#1076#1086#1074' '#1076#1077#1085#1077#1075' '#1076#1083#1103' '#1089#1087#1080#1089#1072#1085#1080#1103' '#1076#1086#1083#1075#1072
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 361
    Width = 997
    Height = 53
    Align = alBottom
    TabOrder = 0
    object bbOk: TBitBtn
      Left = 46
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
      Left = 142
      Top = 16
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 0
    Width = 997
    Height = 361
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    object RxDBGrid2: TRxDBGrid
      Left = 1
      Top = 25
      Width = 995
      Height = 335
      Align = alClient
      DataSource = dsPlatP
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
          FieldName = 'PlatNo'
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
          FieldName = 'DatePlat'
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
          FieldName = 'OtdelName'
          Title.Caption = #1054#1090#1076#1077#1083
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ResponseDeptName'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ActivityTypeName'
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
        end
        item
          Expanded = False
          FieldName = 'Spravka'
          Visible = True
        end>
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 995
      Height = 24
      Align = alTop
      TabOrder = 1
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
      object Label2: TLabel
        Left = 8
        Top = 3
        Width = 174
        Height = 13
        Caption = #1044#1086#1083#1075' '#1087#1086' '#1079#1072#1082#1088#1099#1074#1072#1077#1084#1086#1081' '#1085#1072#1082#1083#1072#1076#1085#1086#1081':'
      end
    end
  end
  object quPlatP: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT   pp.SummaDolg'
      '       , pp.PlatNo'
      '       , TipNakl.TipName'
      '       , pp.Summa'
      '       , pp.DatePlat as DateNakl'
      '       , pp.Buh'
      '       , pp.PostNo'
      '       , o.OtdelName'
      '       , pp.Nom'
      
        '       , (select name from D_Response_Dept where id = pp.respons' +
        'e_dept_id) as ResponseDeptName'
      
        '       , (select name from D_Activity_Type where id = pp.activit' +
        'y_type_id) as ActivityTypeName'
      '       , drd.NAME as ResponseDeptNameOtdel'
      '       , dat.name as ActivityTypeNameOtdel'
      '       , pp.Spravka'
      'FROM PlatP pp INNER JOIN'
      '     TipNakl ON pp.Buh = TipNakl.TipNo inner join '
      '     vidotdel o on pp.OtdelNo=o.OtdelNo left join'
      '     l_VidOtdelProp lvop on lvop.OtdelNo = pp.OtdelNo left join'
      
        '     D_Response_Dept drd on drd.ID = lvop.D_RESPONSE_DEPT_ID lef' +
        't join'
      '     D_Activity_Type dat on dat.id = lvop.D_ACTIVITY_TYPE_ID'
      ' where (pp.Buh=TipNakl.TipNo) '
      '   AND (pp.TipPlat <> 7)'
      '   AND (SummaDolg > 0) '
      '   AND (Buh = :Buh) '
      '   AND (PostNo = :PostNo)      '
      '   AND pp.OurFirmNo= :OurFirmNo'
      'order by DatePlat')
    CachedUpdates = True
    BeforeOpen = quPlatPBeforeOpen
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
    object quPlatPSummaDolg: TFloatField
      FieldName = 'SummaDolg'
    end
    object quPlatPPlatNo: TIntegerField
      FieldName = 'PlatNo'
    end
    object quPlatPTipName: TStringField
      FieldName = 'TipName'
      Size = 10
    end
    object quPlatPSumma: TFloatField
      FieldName = 'Summa'
    end
    object quPlatPDateNakl: TDateTimeField
      FieldName = 'DateNakl'
    end
    object quPlatPBuh: TSmallintField
      FieldName = 'Buh'
    end
    object quPlatPPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object quPlatPOtdelName: TStringField
      FieldName = 'OtdelName'
      Size = 30
    end
    object quPlatPNom: TIntegerField
      FieldName = 'Nom'
    end
    object quPlatPResponseDeptName: TStringField
      DisplayLabel = #1062#1060#1054
      DisplayWidth = 20
      FieldName = 'ResponseDeptName'
      ReadOnly = True
      Size = 512
    end
    object quPlatPActivityTypeName: TStringField
      DisplayLabel = #1042#1080#1076' '#1076#1077#1103#1090#1077#1083#1100#1085#1086#1089#1090#1080
      DisplayWidth = 20
      FieldName = 'ActivityTypeName'
      ReadOnly = True
      Size = 100
    end
    object quPlatPResponseDeptNameOtdel: TStringField
      FieldName = 'ResponseDeptNameOtdel'
      Size = 512
    end
    object quPlatPActivityTypeNameOtdel: TStringField
      FieldName = 'ActivityTypeNameOtdel'
      Size = 100
    end
    object quPlatPSpravka: TStringField
      DisplayLabel = #1054#1087#1080#1089#1072#1085#1080#1077
      DisplayWidth = 50
      FieldName = 'Spravka'
      Size = 200
    end
  end
  object dsPlatP: TDataSource
    DataSet = quPlatP
    Left = 16
    Top = 72
  end
  object quZachet: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'INSERT INTO PlatZachet'
      
        '                      (PlatZachet, PlatNoDolg, PlatNoAvans, Summ' +
        'aDolg, SummaAvans, DateZachet, SummaZachet)'
      
        'VALUES     (:PlatZachet, :PlatNoDolg, :PlatNoAvans, :SummaDolg, ' +
        ':SummaAvans, :DateZachet, :SummaZachet)')
    Left = 16
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PlatZachet'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PlatNoDolg'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PlatNoAvans'
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
  object spModify_Plat_Plat_link: TMSStoredProc
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
        Value = 0
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
