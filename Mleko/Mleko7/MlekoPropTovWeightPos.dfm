inherited MlekoPropTovWeightPosDlg: TMlekoPropTovWeightPosDlg
  Left = 1304
  ActiveControl = p_TovarNo
  Caption = 'MlekoPropTovWeightPosDlg'
  ClientHeight = 248
  ClientWidth = 368
  DesignSize = (
    368
    248)
  PixelsPerInch = 96
  TextHeight = 13
  inherited ButtonOK: TButton
    Left = 132
    Top = 224
  end
  inherited ButtonCancel: TButton
    Left = 212
    Top = 224
  end
  inherited ButtonApply: TButton
    Left = 292
    Top = 224
  end
  inherited PageControl: TPageControl
    Width = 367
    Height = 222
    inherited TabSheet1: TTabSheet
      object p_TovarNo: TcitDBComboEdit
        Left = 67
        Top = 3
        Width = 249
        Height = 21
        Enabled = True
        OwnesLButton = True
        OwnesLLabel = True
        LBtnAlignment = baRight
        LBtnDown = False
        LBtnGroupIndex = 0
        LBtnAllowAllUp = False
        LBtnGlyphKind = gkDots
        LBtnShortCut1 = 115
        LBtnShortCut2 = 40
        LBtnWidth = 25
        LLblAlignment = laLeft
        LLblCaption = #1058#1086#1074#1072#1088
        LLblWidth = 65
        LLblFont.Charset = DEFAULT_CHARSET
        LLblFont.Color = clWindowText
        LLblFont.Height = -11
        LLblFont.Name = 'MS Sans Serif'
        LLblFont.Style = []
        LLblRequiredFont.Charset = DEFAULT_CHARSET
        LLblRequiredFont.Color = clWindowText
        LLblRequiredFont.Height = -11
        LLblRequiredFont.Name = 'MS Sans Serif'
        LLblRequiredFont.Style = [fsBold]
        Required = False
        TabOrder = 0
        Text = 'p_TovarNo'
        Visible = True
        LocateKey = False
        EntityCode = 'TOVAR'
        OnSelectOk = p_TovarNoSelectOk
        EditStyle = edSelect
        AutoTabControl = True
      end
      object p_Prihod_NaklNo: TcitDBComboEdit
        Left = 67
        Top = 30
        Width = 249
        Height = 21
        Enabled = False
        OwnesLButton = True
        OwnesLLabel = True
        LBtnAlignment = baRight
        LBtnDown = False
        LBtnGroupIndex = 0
        LBtnAllowAllUp = False
        LBtnGlyphKind = gkDots
        LBtnShortCut1 = 115
        LBtnShortCut2 = 40
        LBtnWidth = 25
        LLblAlignment = laLeft
        LLblCaption = #1055#1088#1080#1093#1086#1076
        LLblWidth = 65
        LLblFont.Charset = DEFAULT_CHARSET
        LLblFont.Color = clWindowText
        LLblFont.Height = -11
        LLblFont.Name = 'MS Sans Serif'
        LLblFont.Style = []
        LLblRequiredFont.Charset = DEFAULT_CHARSET
        LLblRequiredFont.Color = clWindowText
        LLblRequiredFont.Height = -11
        LLblRequiredFont.Name = 'MS Sans Serif'
        LLblRequiredFont.Style = [fsBold]
        Required = False
        TabOrder = 1
        Text = 'ed_TovarNo'
        Visible = True
        LocateKey = False
        EditStyle = edSelect
        AutoTabControl = True
      end
      object p_Rashod_id: TcitDBComboEdit
        Left = 67
        Top = 58
        Width = 249
        Height = 21
        Enabled = True
        OwnesLButton = True
        OwnesLLabel = True
        LBtnAlignment = baRight
        LBtnDown = False
        LBtnGroupIndex = 0
        LBtnAllowAllUp = False
        LBtnGlyphKind = gkDots
        LBtnShortCut1 = 115
        LBtnShortCut2 = 40
        LBtnWidth = 25
        LLblAlignment = laLeft
        LLblCaption = #1056#1072#1089#1093#1086#1076
        LLblWidth = 65
        LLblFont.Charset = DEFAULT_CHARSET
        LLblFont.Color = clWindowText
        LLblFont.Height = -11
        LLblFont.Name = 'MS Sans Serif'
        LLblFont.Style = []
        LLblRequiredFont.Charset = DEFAULT_CHARSET
        LLblRequiredFont.Color = clWindowText
        LLblRequiredFont.Height = -11
        LLblRequiredFont.Name = 'MS Sans Serif'
        LLblRequiredFont.Style = [fsBold]
        Required = False
        TabOrder = 2
        Text = 'ed_TovarNo'
        Visible = True
        OnPushButton = p_Rashod_idPushButton
        LocateKey = False
        EntityCode = 'NAKLR'
        EditStyle = edSelect
        AutoTabControl = True
      end
      object p_item_kol: TcitDBComboEdit
        Left = 108
        Top = 87
        Width = 208
        Height = 21
        Enabled = True
        OwnesLButton = True
        OwnesLLabel = True
        LBtnAlignment = baRight
        LBtnDown = False
        LBtnGroupIndex = 0
        LBtnAllowAllUp = False
        LBtnGlyphKind = gkDots
        LBtnShortCut1 = 115
        LBtnShortCut2 = 40
        LBtnWidth = 25
        LLblAlignment = laLeft
        LLblCaption = #1042#1077#1089' ('#1082#1086#1083') '#1087#1086#1079#1080#1094#1080#1080
        LLblWidth = 107
        LLblFont.Charset = DEFAULT_CHARSET
        LLblFont.Color = clWindowText
        LLblFont.Height = -11
        LLblFont.Name = 'MS Sans Serif'
        LLblFont.Style = []
        LLblRequiredFont.Charset = DEFAULT_CHARSET
        LLblRequiredFont.Color = clWindowText
        LLblRequiredFont.Height = -11
        LLblRequiredFont.Name = 'MS Sans Serif'
        LLblRequiredFont.Style = [fsBold]
        Required = False
        TabOrder = 3
        Text = 'ed_TovarNo'
        Visible = True
        LocateKey = False
        EditStyle = edCalc
        AutoTabControl = True
      end
      object p_item_num: TcitDBComboEdit
        Left = 124
        Top = 117
        Width = 192
        Height = 21
        Enabled = True
        OwnesLButton = True
        OwnesLLabel = True
        LBtnAlignment = baRight
        LBtnDown = False
        LBtnGroupIndex = 0
        LBtnAllowAllUp = False
        LBtnGlyphKind = gkDots
        LBtnShortCut1 = 115
        LBtnShortCut2 = 40
        LBtnWidth = 25
        LLblAlignment = laLeft
        LLblCaption = #8470' '#1087#1086#1079#1080#1094#1080#1080' '#1074' '#1103#1097#1080#1082#1077
        LLblWidth = 120
        LLblFont.Charset = DEFAULT_CHARSET
        LLblFont.Color = clWindowText
        LLblFont.Height = -11
        LLblFont.Name = 'MS Sans Serif'
        LLblFont.Style = []
        LLblRequiredFont.Charset = DEFAULT_CHARSET
        LLblRequiredFont.Color = clWindowText
        LLblRequiredFont.Height = -11
        LLblRequiredFont.Name = 'MS Sans Serif'
        LLblRequiredFont.Style = [fsBold]
        Required = False
        TabOrder = 4
        Text = 'ed_TovarNo'
        Visible = True
        LocateKey = False
        EditStyle = edCalc
        AutoTabControl = True
      end
      object p_pack_num: TcitDBComboEdit
        Left = 124
        Top = 147
        Width = 192
        Height = 21
        Enabled = True
        OwnesLButton = True
        OwnesLLabel = True
        LBtnAlignment = baRight
        LBtnDown = False
        LBtnGroupIndex = 0
        LBtnAllowAllUp = False
        LBtnGlyphKind = gkDots
        LBtnShortCut1 = 115
        LBtnShortCut2 = 40
        LBtnWidth = 25
        LLblAlignment = laLeft
        LLblCaption = #1053#1086#1084#1077#1088' '#1103#1097#1080#1082#1072
        LLblWidth = 120
        LLblFont.Charset = DEFAULT_CHARSET
        LLblFont.Color = clWindowText
        LLblFont.Height = -11
        LLblFont.Name = 'MS Sans Serif'
        LLblFont.Style = []
        LLblRequiredFont.Charset = DEFAULT_CHARSET
        LLblRequiredFont.Color = clWindowText
        LLblRequiredFont.Height = -11
        LLblRequiredFont.Name = 'MS Sans Serif'
        LLblRequiredFont.Style = [fsBold]
        Required = False
        TabOrder = 5
        Text = 'ed_TovarNo'
        Visible = True
        LocateKey = False
        EditStyle = edCalc
        AutoTabControl = True
      end
    end
  end
  inherited ToolBar: TToolBar
    Width = 368
  end
  inherited ActionList: TActionList
    Top = 24
  end
  inherited quAddBegParam: TMSQuery
    Tag = 3
    SQL.Strings = (
      'declare'
      'p_TovarNo int '
      ',@p_Prihod_NaklNo int'
      ',@p_Rashod_id int'
      ',@l_Item_kol decimal(18,6)'
      ',@l_Item_num int'
      ',@l_Pack_num int'
      ''
      'set @p_TovarNo = :p_TovarNo '
      'set @p_Prihod_NaklNo = :p_Prihod_NaklNo'
      'set @p_Rashod_id = :p_Rashod_id'
      ''
      'select @l_Item_kol=isnull(max(w.Item_Kol),0)'
      '      ,@l_Item_num=isnull(max(w.Item_num),0)'
      '      ,@l_Pack_num=isnull(max(w.Pack_Num),0)'
      'from d_tovar_weight w'
      'where (w.TovarNo = @p_TovarNo or @p_TovarNo=-1)'
      'and (w.Prihod_NaklNo=@p_Prihod_NaklNo or @p_Prihod_NaklNo=-1)'
      'and (w.Rashod_id=@p_Rashod_id or @p_Rashod_id=-1)'
      ''
      'select '
      'p_TovarNo as p_TovarNo_key'
      
        ',(select NameTovar from Tovar where TovarNo=@p_TovarNo) as p_Tov' +
        'arNo_txt'
      ',@p_Prihod_NaklNo as p_Prihod_NaklNo_key'
      
        ',(Select num from v_listNaklP where NaklNo=@p_Prihod_NaklNo) as ' +
        'p_Prihod_NaklNo_txt'
      ',@p_Rashod_id as p_Rashod_id_key'
      
        ',(Select RashodNum from v_blankList where id=@p_Rashod_id) as p_' +
        'Rashod_id_txt'
      ',@l_Item_kol as p_Item_kol_key'
      ',@l_Item_kol as p_Item_kol_txt'
      ',@l_Item_num as p_Item_num_key'
      ',@l_Item_num as p_Item_num_txt'
      ',@l_Pack_num as p_Pack_num_key'
      ',@l_Pack_num as p_Pack_num_txt')
    BeforeOpen = quAddBegParamBeforeOpen
    ParamData = <
      item
        DataType = ftString
        Name = 'p_TovarNo'
        Size = 2
        Value = '-1'
      end
      item
        DataType = ftString
        Name = 'p_Prihod_NaklNo'
        Size = 2
        Value = '-1'
      end
      item
        DataType = ftString
        Name = 'p_Rashod_id'
        Size = 2
        Value = '-1'
      end>
  end
  inherited quUpdBegParam: TMSQuery
    Tag = 4
    SQL.Strings = (
      'select '
      'ID as p_id_key'
      ',ID as p_id_txt'
      ',w.TovarNo as p_TovarNo_key'
      
        ',(select NameTovar from Tovar where TovarNo=w.TovarNo) as p_Tova' +
        'rNo_txt'
      ',w.Prihod_NaklNo as p_Prihod_NaklNo_key'
      
        ',(Select num from v_listNaklP where NaklNo=w.Prihod_NaklNo) as p' +
        '_Prihod_NaklNo_txt'
      ',w.Rashod_id as p_Rashod_id_key'
      
        ',(Select RashodNum from v_blankList where id=w.Rashod_id) as p_R' +
        'ashod_id_txt'
      ',w.Item_kol as p_Item_kol_key'
      ',w.Item_kol as p_Item_kol_txt'
      ',w.Item_num as p_Item_num_key'
      ',w.Item_num as p_Item_num_txt'
      ',w.Pack_num as p_Pack_num_key'
      ',w.Pack_num as p_Pack_num_txt'
      'from d_tovar_weight w'
      'where w.id = :p_id')
    BeforeOpen = quUpdBegParamBeforeOpen
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_id'
        Value = Null
      end>
  end
  inherited spUpd: TMSStoredProc
    StoredProcName = 'sp_EditTovWeightPos'
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_EditTovWeightPos (:p_id, :p_TovarNo, :p' +
        '_Prihod_NaklNo, :p_Rashod_id, :p_item_kol, :p_item_num, :p_pack_' +
        'num)}')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'p_id'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'p_TovarNo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_Prihod_NaklNo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_Rashod_id'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'p_item_kol'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_item_num'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_pack_num'
        ParamType = ptInput
      end>
  end
  inherited spAdd: TMSStoredProc
    StoredProcName = 'sp_EditTovWeightPos;1'
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_EditTovWeightPos;1(:p_id, :p_TovarNo, :' +
        'p_Prihod_NaklNo, :p_Rashod_id, :p_item_kol, :p_item_num, :p_pack' +
        '_num)}')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'p_id'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'p_TovarNo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_Prihod_NaklNo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_Rashod_id'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'p_item_kol'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_item_num'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_pack_num'
        ParamType = ptInput
      end>
  end
end
