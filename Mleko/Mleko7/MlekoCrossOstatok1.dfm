inherited MlekoCrossOstatok1Form: TMlekoCrossOstatok1Form
  Left = 332
  Top = 180
  Width = 1204
  Height = 579
  Caption = ''
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TStatusBar
    Top = 522
    Width = 1188
    Height = 18
    Panels = <
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  inherited ToolBar: TToolBar
    Top = 61
    Width = 1188
    Height = 54
    object ToolButton3: TToolButton
      Left = 192
      Top = 0
      Action = ActionRegim
      Style = tbsCheck
    end
    object ToolButton6: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 32
      Wrap = True
      Style = tbsSeparator
    end
    object RBIsOnlyOstatok1: TRadioButton
      Left = 0
      Top = 30
      Width = 140
      Height = 22
      Caption = #1042#1077#1089#1100' '#1090#1086#1074#1072#1088' '#1054#1089#1090#1072#1090#1086#1082'-1'
      TabOrder = 6
      OnClick = ActionViewRefreshExecute
    end
    object RBOrderTovar: TRadioButton
      Left = 140
      Top = 30
      Width = 160
      Height = 22
      Caption = #1058#1086#1083#1100#1082#1086' '#1079#1072#1082#1072#1079#1072#1085#1085#1099#1081' '#1090#1086#1074#1072#1088
      TabOrder = 7
      OnClick = ActionViewRefreshExecute
    end
    object RBNotOrderTovar: TRadioButton
      Left = 300
      Top = 30
      Width = 200
      Height = 22
      Caption = #1053#1077' '#1079#1072#1082#1072#1079#1072#1085#1085#1099#1081' '#1090#1086#1074#1072#1088' '#1080#1079' '#1086#1089#1090#1072#1090#1082#1072
      TabOrder = 5
      OnClick = ActionViewRefreshExecute
    end
    object RBOverOstatok: TRadioButton
      Left = 500
      Top = 30
      Width = 180
      Height = 22
      Caption = #1058#1086#1074#1072#1088' '#1087#1088#1077#1074#1099#1096#1072#1102#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082
      TabOrder = 4
      OnClick = ActionViewRefreshExecute
    end
    object CBIsOnlyOstatok1: TCheckBox
      Left = 680
      Top = 30
      Width = 130
      Height = 22
      Caption = #1042#1077#1089#1100' '#1090#1086#1074#1072#1088' '#1054#1089#1090#1072#1090#1086#1082'-1'
      TabOrder = 1
      Visible = False
      OnClick = ActionViewRefreshExecute
    end
    object CBOrderTovar: TCheckBox
      Left = 810
      Top = 30
      Width = 160
      Height = 22
      Caption = #1058#1086#1083#1100#1082#1086' '#1079#1072#1082#1072#1079#1072#1085#1085#1099#1081' '#1090#1086#1074#1072#1088
      TabOrder = 0
      Visible = False
      OnClick = ActionViewRefreshExecute
    end
    object CBOverOstatok: TCheckBox
      Left = 970
      Top = 30
      Width = 176
      Height = 22
      Caption = #1058#1086#1074#1072#1088' '#1087#1088#1077#1074#1099#1096#1072#1102#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082
      TabOrder = 2
      Visible = False
      OnClick = ActionViewRefreshExecute
    end
    object CBNotOrderTovar: TCheckBox
      Left = 1146
      Top = 30
      Width = 192
      Height = 22
      Caption = #1053#1077' '#1079#1072#1082#1072#1079#1072#1085#1085#1099#1081' '#1090#1086#1074#1072#1088' '#1080#1079' '#1086#1089#1090#1072#1090#1082#1072
      TabOrder = 3
      Visible = False
      OnClick = ActionViewRefreshExecute
    end
  end
  inherited PageControlTop: TPageControl
    Top = 0
    Width = 1188
    Height = 61
    MultiLine = True
    TabHeight = 1
    TabPosition = tpRight
    TabWidth = 1
    inherited TabSheet1: TTabSheet
      inherited FilterPanel: TTargetFilter_Panel
        Width = 1179
        Height = 53
        object DBText1: TDBText
          Left = 3
          Top = 14
          Width = 263
          Height = 31
          Color = clInfoBk
          DataField = 'FullName'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          WordWrap = True
        end
        object Label1: TLabel
          Left = 102
          Top = 1
          Width = 59
          Height = 13
          Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
        end
        object Label5: TLabel
          Left = 271
          Top = 34
          Width = 57
          Height = 13
          Caption = #1042#1080#1076' '#1090#1086#1074#1072#1088#1072
          Visible = False
        end
        object Label7: TLabel
          Left = 265
          Top = 1
          Width = 135
          Height = 13
          Caption = #1044#1072#1090#1072' '#1079#1072#1087#1088#1086#1089#1072' '#1085#1072' '#1087#1086#1089#1090#1072#1074#1082#1091
        end
        object DBText2: TDBText
          Left = 281
          Top = 15
          Width = 113
          Height = 15
          Color = clInfoBk
          DataField = 'DateRequest'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object DBText7: TDBText
          Left = 657
          Top = 32
          Width = 97
          Height = 15
          Color = clInfoBk
          DataField = 'Id'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Label8: TLabel
          Left = 643
          Top = 33
          Width = 11
          Height = 13
          Caption = 'ID'
        end
        object DBText3: TDBText
          Left = 437
          Top = 15
          Width = 113
          Height = 15
          Color = clInfoBk
          DataField = 'SummaRequest'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Label2: TLabel
          Left = 418
          Top = 1
          Width = 143
          Height = 13
          Caption = #1057#1091#1084#1084#1072' '#1079#1072#1087#1088#1086#1089#1072' '#1085#1072' '#1087#1086#1089#1090#1072#1074#1082#1091
        end
        object Label3: TLabel
          Left = 590
          Top = 1
          Width = 91
          Height = 13
          Caption = #1053#1086#1084#1077#1088' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
        end
        object DBText4: TDBText
          Left = 581
          Top = 15
          Width = 113
          Height = 15
          Color = clInfoBk
          DataField = 'NaklNo'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object EdPodr: TcxDBLookupComboBox
          Left = 355
          Top = 32
          DataBinding.DataField = 'VidNo'
          DataBinding.DataSource = DSVtBrand
          Properties.ClearKey = 46
          Properties.KeyFieldNames = 'VidNo'
          Properties.ListColumns = <
            item
              FieldName = 'VidName'
            end>
          Properties.ListSource = DsListBrand
          TabOrder = 1
          Width = 281
        end
        object Progress: TProgressBar
          Left = 0
          Top = 46
          Width = 267
          Height = 6
          Smooth = True
          Step = 1
          TabOrder = 0
        end
        object btCreateNakls: TButton
          Left = 808
          Top = 8
          Width = 121
          Height = 25
          Caption = #1057#1086#1079#1076#1072#1090#1100' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
          TabOrder = 2
          OnClick = btCreateNaklsClick
        end
      end
    end
  end
  inherited PanelGrid: TPanel
    Top = 115
    Width = 1188
    Height = 407
    inherited DBGrid: TDBGridEh
      Width = 1182
      Height = 401
      TabStop = False
      AllowedOperations = [alopUpdateEh]
      ColumnDefValues.Title.Orientation = tohVertical
      ColumnDefValues.Title.TitleButton = True
      Font.Name = 'Arial'
      FooterColor = 16776176
      FooterFont.Name = 'Arial'
      FooterFont.Style = [fsBold]
      FooterRowCount = 1
      OptionsEh = [dghFixed3D, dghFrozen3D, dghFooter3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghDialogFind]
      ParentCtl3D = False
      ParentFont = False
      RowHeight = 15
      SortLocal = True
      STFilter.Local = False
      STFilter.Visible = False
      SumList.Active = True
      TitleFont.Height = -12
      TitleFont.Name = 'Arial Narrow'
      UseMultiTitle = True
      VTitleMargin = 0
      OnColEnter = DBGridColEnter
      OnColExit = DBGridColExit
      OnGetCellParams = DBGridGetCellParams
      OnGetFooterParams = DBGridGetFooterParams
      OnKeyDown = DBGridKeyDown
    end
  end
  inherited ActionList: TActionList
    Left = 44
    Top = 148
    inherited ActionItemDel: TAction
      Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1074#1089#1102' '#1089#1090#1088#1086#1082#1091
    end
    inherited ActionViewFilterOff: TAction
      Visible = False
    end
    object ActionRegim: TAction
      Caption = #1056#1077#1078#1080#1084
      Hint = #1056#1077#1078#1080#1084
      ImageIndex = 30
      ShortCut = 16452
      OnExecute = ActionRegimExecute
    end
    object ActionRegimSet: TAction
      Caption = 'ActionRegimSet'
      OnExecute = ActionRegimSetExecute
    end
  end
  inherited Query: TMSQuery
    Left = 180
    Top = 196
  end
  inherited PopupMenuGrid: TPopupMenu
    Left = 452
    Top = 148
  end
  inherited IniPropStorageMan: TIniPropStorageManEh
    Left = 384
    Top = 148
  end
  inherited DS: TDataSource
    DataSet = SP
    Left = 112
    Top = 148
  end
  inherited PrintDBGridEh1: TPrintDBGridEh
    Left = 520
    Top = 148
  end
  inherited SaveDialog1: TSaveDialog
    Left = 112
    Top = 196
  end
  object SP: TMSStoredProc
    StoredProcName = 'GetOstatok1;1'
    SQLUpdate.Strings = (
      'begin'
      ' print 1'
      'end')
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL GetOstatok1;1(:Ostatok1_id, :VidNo, :OnlyO' +
        'rderTovar, :NotOrderTovar, :OrderOverOst)}')
    Options.StrictUpdate = False
    AfterPost = SPAfterPost
    Left = 452
    Top = 196
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'Ostatok1_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'VidNo'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = 'OnlyOrderTovar'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = 'NotOrderTovar'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = 'OrderOverOst'
        ParamType = ptInput
      end>
  end
  object spGetColInfoForBlankOrder: TMSStoredProc
    StoredProcName = 'sp_GetColInfoForRequest;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_GetColInfoForRequest;1(:Request_id, :Na' +
        'klNo)}')
    Left = 552
    Top = 196
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'Request_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NaklNo'
        ParamType = ptInput
      end>
  end
  object DataSource1: TDataSource
    DataSet = spGetColInfoForBlankOrder
    Left = 248
    Top = 148
  end
  object quBrand: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'declare @date datetime'
      ''
      'set @date = :DateNakl'
      ''
      'select v.VidName,v.VidNo '
      ' from VidTov v'
      '/*'
      ''
      'declare @date datetime'
      ''
      'set @date = :DateNakl'
      ''
      'select v.VidName,v.VidNo '
      'from tovar t inner join VidTov v on t.VidNo=v.VidNo     '
      
        '--     left outer join e_blanks s on isnull(s.DateNakl,@date) = ' +
        '@date and t.TovarNo=s.TovarNo'
      '--     left outer join Ostatok o on t.TovarNo=o.TovarNo'
      '-- where s.KolOrd<>0 or o.Kol<>0'
      ' group by v.VidName,v.VidNo'
      '*/')
    Left = 752
    Top = 108
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DateNakl'
      end>
  end
  object DsListBrand: TDataSource
    DataSet = quBrand
    Left = 700
    Top = 108
  end
  object DSVtBrand: TDataSource
    DataSet = VtBrand
    Left = 588
    Top = 108
  end
  object SPSummaBlankTovPos: TMSStoredProc
    StoredProcName = 'SP_SummaBlankTovPos'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL SP_SummaBlankTovPos (:p_dateNakl, :p_Tovar' +
        'No)}')
    Left = 44
    Top = 244
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'p_dateNakl'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_TovarNo'
        ParamType = ptInput
      end>
  end
  object spEditBlankPosition: TMSStoredProc
    StoredProcName = 'sp_EditOstatok1Position;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_EditOstatok1Position;1(:Ostatok_id, :To' +
        'varNo, :Qty, :Ostatok1NaklNo, :KolZakNowOut, :SummaDost)}')
    Left = 316
    Top = 196
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'Ostatok_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TovarNo'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'Qty'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Ostatok1NaklNo'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'KolZakNowOut'
        ParamType = ptInputOutput
      end
      item
        DataType = ftFloat
        Name = 'SummaDost'
        ParamType = ptInputOutput
      end>
  end
  object quInfo: TMSStoredProc
    StoredProcName = 'sp_CrossColInfoOstatok1;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_CrossColInfoOstatok1;1(:p_dateNakl, :p_' +
        'article_id, :Ostatok1_Id)}')
    Left = 384
    Top = 196
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'p_dateNakl'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_article_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Ostatok1_Id'
        ParamType = ptInput
      end>
  end
  object VtBrand: TVirtualTable
    FieldDefs = <
      item
        Name = 'VidNo'
        DataType = ftLargeint
      end>
    Left = 640
    Top = 109
    Data = {0300010005005669644E6F1900000000000000000000000000}
  end
  object quInsInNaklP: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'declare'
      '    @p_NaklNo int'
      '   ,@p_Nom int'
      '   ,@p_PostNo smallint'
      '   ,@p_DateNakl smalldatetime'
      '   ,@p_DatePrih smalldatetime'
      '   ,@p_Buh int'
      '   ,@p_UserNo int'
      '   ,@P_doc_type int'
      '   ,@d_bank_invoice_id int'
      '   ,@Pkey bigint'
      '   ,@OtdelNo int'
      '   ,@CurrencyHead varchar(5) '
      ''
      
        'select @d_bank_invoice_id = id from D_BANK_INVOICE where isMain ' +
        '= 1'
      ''
      
        'select @CurrencyHead = c.l_code from D_CURRENCY c inner join Cur' +
        'rencyExchange ce on c.IsDefault = 1 and ce.IsActive = 1 and ce.C' +
        'urrencyId = c.ID and isnull(c.isTrash,0) = 0'
      ''
      ''
      'select @p_NaklNo=max(naklNo)+1 '
      ' from NaklP'
      ''
      'if @p_NaklNo is null'
      ' set @p_NaklNo = 1'
      ''
      'if @p_NaklNo = 0'
      ' set @p_NaklNo = 1'
      ''
      'select @p_Nom=max(Nom)+1 '
      ' from NaklP'
      ''
      'if @p_Nom is null'
      ' set @p_Nom = 1'
      ''
      'if @p_Nom = 0'
      ' set @p_Nom = 1'
      ''
      'set @p_PostNo = :PostNo'
      'set @p_Buh = :Buh'
      'set @p_DateNakl = :DateNakl'
      'set @p_DatePrih = :DatePrih'
      'set @p_UserNo = :UserNo'
      'set @P_doc_type = :Doc_Type'
      'set @OtdelNo = :OtdelNo'
      ''
      ''
      
        'INSERT INTO NaklP (NaklNo, Nom, PostNo, DateNakl, DatePrih, Summ' +
        'a, SummaDolg, Buh, UserNo,  doc_type, OurFirmNo, OtdelNo, d_bank' +
        '_invoice_id, CurrencyHead)'
      
        'VALUES(@p_NaklNo, @p_Nom, @p_PostNo, @p_DateNakl, @p_DatePrih, 0' +
        ', 0, @p_Buh, @p_UserNo, @p_doc_type, (select PostNo from d_our_f' +
        'irm),@OtdelNo,@d_bank_invoice_id,@CurrencyHead)'
      ''
      ''
      'select @Pkey = pkey from naklp where NaklNo = @p_NaklNo'
      ''
      
        'INSERT INTO L_Delay_NaklP (NaklNo,SET_ARTICLE_GROUP_ID,Day_Delay' +
        ',Day_Delay_Ext,Buh)'
      
        'values (@Pkey,:SET_ARTICLE_GROUP_ID,:Day_Delay,:Day_Delay_Ext,@p' +
        '_Buh)'
      ''
      '-- select NaklNo, Pkey from NaklP where NaklNo = @p_NaklNo')
    Left = 824
    Top = 129
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PostNo'
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'Buh'
        Value = 0
      end
      item
        DataType = ftDateTime
        Name = 'DateNakl'
      end
      item
        DataType = ftDateTime
        Name = 'DatePrih'
      end
      item
        DataType = ftInteger
        Name = 'UserNo'
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'Doc_Type'
        Value = 0
      end
      item
        DataType = ftUnknown
        Name = 'OtdelNo'
      end
      item
        DataType = ftUnknown
        Name = 'SET_ARTICLE_GROUP_ID'
      end
      item
        DataType = ftUnknown
        Name = 'Day_Delay'
      end
      item
        DataType = ftUnknown
        Name = 'Day_Delay_Ext'
      end>
  end
  object quNaklR: TMSQuery
    SQLInsert.Strings = (
      'declare '
      '   @cnt int'
      '  ,@cnt1 int'
      '  ,@VidNaklNo int'
      '  ,@OurFirmNo int'
      ''
      'select @cnt = count(*) from NaklR where NaklNo = :NaklNo'
      
        'select @cnt1 = count(*) from L_NaklRReturn where NaklNo = :NaklN' +
        'o'
      ''
      'select @OurFirmNo = PostNo from d_our_firm'
      ''
      'if @cnt = 0'
      ' insert into NaklR( NaklNo'
      '                  , Nom'
      '                  , NomFirst'
      '                  , PostNo'
      '                  , PostNoFirst'
      '                  , DateNakl'
      '                  , DateNaklFirst'
      '                  , DateOpl'
      '                  , UserNo'
      '                  , SotrudNo'
      '                  , AddressNo'
      '                  , OtdelNo'
      '                  , VidNaklNo'
      '                  , Buh'
      '                  , SET_ARTICLE_GROUP_ID'
      '                  , ColnPrice'
      '                  , pkey'
      '                  , description'
      '                  , OurFirmNo'
      '                  , CurrencyHead'
      '                  , CurrencyAccounting'
      '                  , RateCurrencyAccounting)'
      '    values (  :NaklNo'
      '            , :Nom'
      '            , :NomFirst'
      '            , :PostNo'
      '            , :PostNoFirst'
      '            , :DateNakl'
      '            , :DateNaklFirst'
      '            , :DateOpl'
      '            , :UserNo'
      '            , :SotrudNo'
      '            , :AddressNo'
      '            , :OtdelNo'
      '            , :VidNaklNo'
      '            , :Buh'
      '            , :SET_ARTICLE_GROUP_ID'
      '            , :ColnPrice'
      '            , :pkey'
      '            , :description'
      '            , @OurFirmNo'
      '            , :CurrencyHead'
      '            , :CurrencyAccounting'
      '            , :RateCurrencyAccounting)'
      'else'
      ' update NaklR'
      '   set PostNo = :PostNo'
      '     , SotrudNo = :SotrudNo '
      '     , AddressNo = :AddressNo'
      '     , OtdelNo = :OtdelNo'
      '     , VidNaklNo = :VidNaklNo'
      '     , Buh = :Buh'
      '     , SET_ARTICLE_GROUP_ID = :SET_ARTICLE_GROUP_ID'
      '     , ColnPrice = :ColnPrice'
      '     , CurrencyHead = :CurrencyHead'
      ''
      ' where NaklNo = :NaklNo'
      ''
      'select @VidNaklNo = VidNaklNo from NaklR where NaklNo = :NaklNo'
      ''
      'if @VidNaklNo in (3,5)'
      ' if @cnt1 = 0'
      '  insert into L_NaklRReturn (NaklNo, TypeReturnNo)'
      '   values (:NaklNo, :TypeReturnNo)'
      ' else'
      '  update L_NaklRReturn'
      '   set TypeReturnNo = :TypeReturnNo'
      '  where NaklNo = :NaklNo'
      ''
      ''
      '----------------------------------'
      '/*'
      'declare '
      '   @cnt int'
      '  ,@cnt1 int'
      ''
      'select @cnt = count(*) from NaklR where NaklNo = :NaklNo'
      
        'select @cnt1 = count(*) from L_NaklRReturn where NaklNo = :NaklN' +
        'o'
      ''
      'if @cnt = 0'
      ' insert into NaklR (   NaklNo'
      '              , PostNo'
      '              , SotrudNo'
      '              , AddressNo'
      '              , OtdelNo'
      '              , VidNaklNo'
      '--              , TypeReturnNo'
      '              , Buh'
      '              , SET_ARTICLE_GROUP_ID'
      '              , ColnPrice)'
      '    values (  :NaklNo'
      '            , :PostNo'
      '            , :SotrudNo'
      '            , :AddressNo'
      '            , :OtdelNo'
      '            , :VidNaklNo'
      '--            , :TypeReturnNo'
      '            , :Buh'
      '            , :SET_ARTICLE_GROUP_ID'
      '            , :ColnPrice)'
      'else'
      ' update NaklR'
      '   set PostNo = :PostNo'
      '     , SotrudNo = :SotrudNo '
      '     , AddressNo = :AddressNo'
      '     , OtdelNo = :OtdelNo'
      '     , VidNaklNo = :VidNaklNo'
      '--     , TypeReturnNo = '
      '     , Buh = :Buh'
      '     , SET_ARTICLE_GROUP_ID = :SET_ARTICLE_GROUP_ID'
      '     , ColnPrice = :ColnPrice'
      ' where NaklNo = :NaklNo'
      ''
      'if @cnt1 = 0'
      ' insert into L_NaklRReturn (NaklNo, TypeReturnNo)'
      '  values (:NaklNo, :TypeReturnNo)'
      'else'
      ' update L_NaklRReturn'
      '  set TypeReturnNo = :TypeReturnNo'
      ' where NaklNo = :NaklNo'
      '*/')
    SQLUpdate.Strings = (
      'declare '
      '   @cnt int'
      '  ,@cnt1 int'
      '  ,@VidNaklNo int'
      '  ,@OurFirmNo int'
      ''
      'select @cnt = count(*) from NaklR where NaklNo = :NaklNo'
      
        'select @cnt1 = count(*) from L_NaklRReturn where NaklNo = :NaklN' +
        'o'
      ''
      'select @OurFirmNo = PostNo from d_our_firm'
      ''
      'if @cnt = 0'
      ' insert into NaklR( NaklNo'
      '                  , Nom'
      '                  , NomFirst'
      '                  , PostNo'
      '                  , PostNoFirst'
      '                  , DateNakl'
      '                  , DateNaklFirst'
      '                  , DateOpl'
      '                  , UserNo'
      '                  , SotrudNo'
      '                  , AddressNo'
      '                  , OtdelNo'
      '                  , VidNaklNo'
      '                  , Buh'
      '                  , SET_ARTICLE_GROUP_ID'
      '                  , ColnPrice'
      '                  , pkey'
      '                  , description'
      '                  , OurFirmNo'
      '                  , CurrencyHead'
      '                  , CurrencyAccounting'
      '                  , RateCurrencyAccounting)'
      '    values (  :NaklNo'
      '            , :Nom'
      '            , :NomFirst'
      '            , :PostNo'
      '            , :PostNoFirst'
      '            , :DateNakl'
      '            , :DateNaklFirst'
      '            , :DateOpl'
      '            , :UserNo'
      '            , :SotrudNo'
      '            , :AddressNo'
      '            , :OtdelNo'
      '            , :VidNaklNo'
      '            , :Buh'
      '            , :SET_ARTICLE_GROUP_ID'
      '            , :ColnPrice'
      '            , :pkey'
      '            , :description'
      '            , @OurFirmNo'
      '            , :CurrencyHead'
      '            , :CurrencyAccounting'
      '            , :RateCurrencyAccounting)'
      'else'
      ' update NaklR'
      '   set PostNo = :PostNo'
      '     , SotrudNo = :SotrudNo '
      '     , AddressNo = :AddressNo'
      '     , OtdelNo = :OtdelNo'
      '     , VidNaklNo = :VidNaklNo'
      '     , Buh = :Buh'
      '     , SET_ARTICLE_GROUP_ID = :SET_ARTICLE_GROUP_ID'
      '     , ColnPrice = :ColnPrice'
      '     , CurrencyHead = :CurrencyHead  '
      ' where NaklNo = :NaklNo'
      ''
      'select @VidNaklNo = VidNaklNo from NaklR where NaklNo = :NaklNo'
      ''
      'if @VidNaklNo in (3,5)'
      ' if @cnt1 = 0'
      '  insert into L_NaklRReturn (NaklNo, TypeReturnNo)'
      '   values (:NaklNo, :TypeReturnNo)'
      ' else'
      '  update L_NaklRReturn'
      '   set TypeReturnNo = :TypeReturnNo'
      '  where NaklNo = :NaklNo')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select top 10 *'
      ' from NaklR nr left join'
      '      L_NaklRReturn lnr on lnr.NaklNo = nr.NaklNo')
    Left = 824
    Top = 160
  end
  object quSpec: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select   o1n.TovarNo '
      '       , qty'
      
        '       , convert(decimal(18,2),isnull(o.AvgPriceIn,0)) as AvgPri' +
        'ceIn'
      ' from Ostatok1Nakl o1n left join'
      
        '      Ostatok1Spec o on o.Ostatok1Head_Id = o1n.Ostatok1Id and o' +
        '.TovarNo = o1n.TovarNo'
      '  where Ostatok1NaklNo = :Ostatok1NaklNo'
      '    and NaklNo is null'
      '    and Ostatok1Id = :Ostatok1Id'
      '    and (qty is not null and Qty > 0)'
      'order by o1n.TovarNo')
    Left = 824
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Ostatok1NaklNo'
      end
      item
        DataType = ftInteger
        Name = 'Ostatok1Id'
      end>
    object quSpecTovarNo: TIntegerField
      FieldName = 'TovarNo'
    end
    object quSpecqty: TFloatField
      FieldName = 'qty'
    end
    object quSpecAvgPriceIn: TFloatField
      FieldName = 'AvgPriceIn'
    end
  end
end
