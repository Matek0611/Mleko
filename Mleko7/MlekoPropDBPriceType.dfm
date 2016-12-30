inherited MlekoPropDbPriceTypeDlg: TMlekoPropDbPriceTypeDlg
  Left = 1252
  Top = 473
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1089#1080#1089#1090#1077#1084#1099
  ClientHeight = 238
  ClientWidth = 420
  PixelsPerInch = 96
  TextHeight = 13
  inherited ButtonOK: TButton
    Left = 185
    Top = 212
  end
  inherited ButtonCancel: TButton
    Left = 265
    Top = 212
    Cancel = False
  end
  inherited ButtonApply: TButton
    Left = 345
    Top = 212
  end
  inherited PageControl: TPageControl
    Width = 420
    Height = 185
    MultiLine = True
    inherited TabSheet1: TTabSheet
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 412
        Height = 157
        Align = alTop
        Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1082#1086#1083#1086#1085#1082#1080' '#1094#1077#1085
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Label2: TLabel
          Left = 56
          Top = 80
          Width = 37
          Height = 13
          Caption = #1054#1090#1076#1077#1083
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 11
          Top = 49
          Width = 90
          Height = 13
          Caption = #1053#1072#1089#1083#1077#1076#1086#1074#1072#1085' '#1086#1090
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object citDBEdit9: TcitDBEdit
          Left = 106
          Top = 20
          Width = 279
          Height = 21
          DataField = 'ColName'
          DataSource = DS
          DontPushIfDisabled = False
          Enabled = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          OwnesLButton = False
          OwnesLLabel = True
          LBtnAlignment = baRight
          LBtnFlat = False
          LBtnDown = False
          LBtnGroupIndex = 0
          LBtnAllowAllUp = True
          LBtnGlyphKind = gkDots
          LBtnShortCut1 = 115
          LBtnShortCut2 = 40
          LBtnWidth = 25
          LLblAlignment = laLeft
          LLblCaption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          LLblWidth = 90
          LLblFont.Charset = DEFAULT_CHARSET
          LLblFont.Color = clWindowText
          LLblFont.Height = -11
          LLblFont.Name = 'MS Sans Serif'
          LLblFont.Style = [fsBold]
          LLblRequiredFont.Charset = DEFAULT_CHARSET
          LLblRequiredFont.Color = clWindowText
          LLblRequiredFont.Height = -11
          LLblRequiredFont.Name = 'MS Sans Serif'
          LLblRequiredFont.Style = [fsBold]
          Required = True
          ParentFont = False
          TabOrder = 1
          Text = 'citDBEdit9'
          Visible = True
        end
        object citDBEdit1: TcitDBEdit
          Left = 106
          Top = 102
          Width = 92
          Height = 21
          DataField = 'Factor'
          DataSource = DS
          DontPushIfDisabled = False
          Enabled = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          OwnesLButton = False
          OwnesLLabel = True
          LBtnAlignment = baRight
          LBtnFlat = False
          LBtnDown = False
          LBtnGroupIndex = 0
          LBtnAllowAllUp = True
          LBtnGlyphKind = gkDots
          LBtnShortCut1 = 115
          LBtnShortCut2 = 40
          LBtnWidth = 25
          LLblAlignment = laLeft
          LLblCaption = #1052#1085#1086#1078#1080#1090#1077#1083#1100
          LLblWidth = 70
          LLblFont.Charset = DEFAULT_CHARSET
          LLblFont.Color = clWindowText
          LLblFont.Height = -11
          LLblFont.Name = 'MS Sans Serif'
          LLblFont.Style = [fsBold]
          LLblRequiredFont.Charset = DEFAULT_CHARSET
          LLblRequiredFont.Color = clWindowText
          LLblRequiredFont.Height = -11
          LLblRequiredFont.Name = 'MS Sans Serif'
          LLblRequiredFont.Style = [fsBold]
          Required = True
          ParentFont = False
          TabOrder = 0
          Text = 'citDBEdit1'
          Visible = True
        end
        object DBLookupComboBox2: TDBLookupComboBox
          Left = 106
          Top = 75
          Width = 145
          Height = 21
          DataField = 'OtdelNo'
          DataSource = DS
          KeyField = 'OtdelNo'
          ListField = 'OtdelName'
          ListSource = ds_otdel
          TabOrder = 2
        end
        object citDBEdit3: TcitDBEdit
          Left = 106
          Top = 128
          Width = 92
          Height = 21
          DataField = 'Price_line'
          DataSource = DS
          DontPushIfDisabled = False
          Enabled = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          OwnesLButton = False
          OwnesLLabel = True
          LBtnAlignment = baRight
          LBtnFlat = False
          LBtnDown = False
          LBtnGroupIndex = 0
          LBtnAllowAllUp = True
          LBtnGlyphKind = gkDots
          LBtnShortCut1 = 115
          LBtnShortCut2 = 40
          LBtnWidth = 25
          LLblAlignment = laLeft
          LLblCaption = #8470' '#1050#1086#1083#1086#1085#1082#1080
          LLblWidth = 70
          LLblFont.Charset = DEFAULT_CHARSET
          LLblFont.Color = clWindowText
          LLblFont.Height = -11
          LLblFont.Name = 'MS Sans Serif'
          LLblFont.Style = [fsBold]
          LLblRequiredFont.Charset = DEFAULT_CHARSET
          LLblRequiredFont.Color = clWindowText
          LLblRequiredFont.Height = -11
          LLblRequiredFont.Name = 'MS Sans Serif'
          LLblRequiredFont.Style = [fsBold]
          Required = True
          ParentFont = False
          TabOrder = 3
          Text = 'citDBEdit3'
          Visible = True
        end
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 106
          Top = 47
          Width = 279
          Height = 21
          DataField = 'Parent_colnPrice'
          DataSource = DS
          KeyField = 'colnprice'
          ListField = 'colname'
          ListSource = DsParentType
          TabOrder = 4
        end
      end
    end
  end
  inherited ToolBar: TToolBar
    Width = 420
  end
  inherited ActionList: TActionList
    Left = 32
    Top = 602
    object ActionCalcBalances: TAction
      Caption = 'ActionCalcBalances'
    end
  end
  inherited Query: TMSQuery
    SQLInsert.Strings = (
      'begin'
      'declare @l_id int'
      
        'Exec sp_AddPriceType @l_id out, :ColName, :OtdelNo, :Price_Line,' +
        ' :Parent_ColNPrice, :Factor'
      'SET :ColNPrice = @l_id'
      'end')
    SQL.Strings = (
      'select '
      'ColNPrice'
      ',ColName'
      ',OtdelNo'
      ',Price_line'
      ',Parent_colnPrice'
      ',Factor'
      'from d_price_type p'
      'where 1=2'
      '')
    Debug = True
    FetchRows = 1
    Left = 304
    Top = 2
  end
  inherited DS: TDataSource
    Left = 332
    Top = 2
  end
  object qu_otdel: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from VidOtdel')
    AfterInsert = QueryAfterInsert
    AfterEdit = QueryAfterEdit
    Left = 264
    Top = 98
  end
  object ds_otdel: TDataSource
    DataSet = qu_otdel
    Left = 295
    Top = 98
  end
  object quParentType: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select colnprice,colname from d_price_type')
    FetchRows = 1
    AfterInsert = QueryAfterInsert
    AfterEdit = QueryAfterEdit
    Options.StrictUpdate = False
    Left = 320
    Top = 58
  end
  object DsParentType: TDataSource
    DataSet = quParentType
    Left = 348
    Top = 58
  end
end
