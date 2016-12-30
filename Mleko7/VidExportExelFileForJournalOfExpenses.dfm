inherited VidExportExelFileForJournalOfExpensesForm: TVidExportExelFileForJournalOfExpensesForm
  Left = 875
  Top = 223
  Width = 433
  Height = 433
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1092#1072#1081#1083#1072' '#1074#1099#1075#1088#1091#1079#1082#1080' '#1045#1082#1089#1077#1083#1100' '#1092#1072#1081#1083#1072
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox [0]
    Left = 0
    Top = 0
    Width = 417
    Height = 353
    Align = alClient
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1092#1072#1081#1083#1072' '#1086#1090#1087#1088#1072#1074#1082#1080' '
    TabOrder = 0
    object DBGridEhVidExportExelFile: TDBGridEh
      Left = 2
      Top = 15
      Width = 413
      Height = 336
      Align = alClient
      DataSource = dsVidExportExelFile
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
      Columns = <
        item
          EditButtons = <>
          FieldName = 'Column_Name'
          Footers = <>
          Title.Alignment = taCenter
          Width = 276
        end
        item
          EditButtons = <>
          FieldName = 'Is_Checked'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'N_pp'
          Footers = <>
          Title.Alignment = taCenter
        end>
    end
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 353
    Width = 417
    Height = 41
    Align = alBottom
    TabOrder = 1
    object bbOk: TBitBtn
      Left = 117
      Top = 9
      Width = 76
      Height = 25
      TabOrder = 0
      OnClick = bbOkClick
      Kind = bkOK
    end
    object bbCancel: TBitBtn
      Left = 230
      Top = 9
      Width = 76
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = bbCancelClick
      Kind = bkCancel
    end
  end
  object quVidExportExelFile: TMSQuery
    SQLInsert.Strings = (
      'declare'
      '  @Cnt int'
      ''
      'select @Cnt = count(*)'
      ' from L_VidExportExelFileForJournalOfExpenses'
      '  where UserNo = :UserNo'
      '    and Column_Name = :Column_Name'
      ''
      'if @Cnt = 0'
      
        'insert into L_VidExportExelFileForJournalOfExpenses (UserNo, Col' +
        'umn_Name, Is_Checked, N_pp)'
      '       values (:UserNo, :Column_Name, :Is_Checked, :N_pp)')
    SQLUpdate.Strings = (
      'declare'
      '  @Cnt int'
      ''
      'select @Cnt = count(*)'
      ' from L_VidExportExelFileForJournalOfExpenses'
      '  where UserNo = :UserNo'
      '    and Column_Name = :Column_Name'
      ''
      'if @Cnt = 0'
      
        'insert into L_VidExportExelFileForJournalOfExpenses (UserNo, Col' +
        'umn_Name, Is_Checked, N_pp)'
      '       values (:UserNo, :Column_Name, :Is_Checked, :N_pp)'
      ''
      'if @Cnt = 1'
      'update L_VidExportExelFileForJournalOfExpenses'
      ' set Is_Checked = :Is_Checked'
      '    ,N_pp = :N_pp'
      'where UserNo = :UserNo'
      '  and Column_Name = :Column_Name')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select  l.id'
      '       ,l.UserNo'
      '       ,i.Column_Name'
      '       ,isnull(l.Is_Checked,0) as Is_Checked'
      '       ,l.N_pp'
      
        ' from information_schema.columns /*INFORMATION_SCHEMA.COLUMNS*/ ' +
        'i left join'
      
        '      L_VidExportExelFileForJournalOfExpenses l on l.Column_Name' +
        ' = i.COLUMN_NAME and l.UserNo = isnull(:UserNo,l.UserNo)'
      '  where TABLE_NAME = '#39'V_List_entity'#39
      'order by isnull(l.N_pp,100)')
    BeforePost = quVidExportExelFileBeforePost
    Left = 369
    Top = 357
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'UserNo'
      end>
    object quVidExportExelFileid: TLargeintField
      FieldName = 'id'
      ReadOnly = True
    end
    object quVidExportExelFileUserNo: TSmallintField
      FieldName = 'UserNo'
    end
    object quVidExportExelFileColumn_Name: TWideStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1082#1086#1083#1086#1085#1082#1080
      DisplayWidth = 70
      FieldName = 'Column_Name'
      ReadOnly = True
      Size = 128
    end
    object quVidExportExelFileIs_Checked: TBooleanField
      DisplayLabel = 'V'
      FieldName = 'Is_Checked'
    end
    object quVidExportExelFileN_pp: TSmallintField
      DisplayLabel = #8470#1087#1087
      FieldName = 'N_pp'
    end
  end
  object dsVidExportExelFile: TMSDataSource
    DataSet = quVidExportExelFile
    Left = 337
    Top = 357
  end
end
