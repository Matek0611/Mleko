inherited ListAddressPostForOstatok1Form: TListAddressPostForOstatok1Form
  Left = 376
  Top = 188
  Width = 1139
  Height = 275
  Caption = #1057#1087#1080#1089#1086#1082' '#1072#1076#1088#1077#1089#1086#1074' '#1087#1086' '#1087#1072#1088#1090#1085#1077#1088#1072#1084
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 195
    Width = 1123
    Height = 41
    Align = alBottom
    TabOrder = 0
    object Button1: TButton
      Left = 40
      Top = 8
      Width = 153
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1089#1087#1080#1089#1086#1082
      TabOrder = 0
      OnClick = Button1Click
    end
    object btExitOk: TButton
      Left = 1032
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1099#1093#1086#1076
      ModalResult = 1
      TabOrder = 1
      OnClick = btExitOkClick
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 0
    Width = 1123
    Height = 195
    Align = alClient
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 1121
      Height = 193
      Align = alClient
      DataSource = dsListAddressPostForOstatok1
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
      TitleLines = 2
      OnExit = DBGridEh1Exit
      OnKeyDown = DBGridEh1KeyDown
      OnKeyPress = DBGridEh1KeyPress
      OnTitleBtnClick = DBGridEh1TitleBtnClick
      Columns = <
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'PostNo'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'Name'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'AddressNo'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'Address'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'SotrudNo'
          Footers = <>
          ReadOnly = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'SotrudName'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'Set_Article_Group_Id'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'GroupName'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'Buh'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'Buh_type_name'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          DropDownSpecRow.Value = 0
          EditButtons = <>
          FieldName = 'Kol'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'Active'
          Footers = <>
          Title.Alignment = taCenter
        end>
    end
  end
  object quListAddressPostForOstatok1: TMSQuery
    SQLUpdate.Strings = (
      'update ListAddressPostForOstatok1'
      '  set  Active = :Active'
      '     , Kol = :Kol'
      ' where PostNo = :PostNo '
      '   and AddressNo = :AddressNo '
      '   and SotrudNo = :SotrudNo '
      '   and OtdelNo = :OtdelNo '
      '   and Set_Article_Group_Id = :Set_Article_Group_Id'
      '   and Buh = :Buh')
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'select   rtrim(ltrim(p.Name))+'#39'_'#39'+rtrim(ltrim(ap.Address))+'#39'_'#39'+r' +
        'trim(ltrim(s.SotrudName))+'#39'_'#39'+rtrim(ltrim(vo.OtdelName))+'#39'_'#39'+rtr' +
        'im(ltrim(dsag.NAME))+'#39'_'#39'+rtrim(ltrim(dbt.Buh_type_name)) AS PKEY'
      '       , l.PostNo'
      '       , p.Name'
      '       , l.AddressNo'
      '       , ap.Address'
      '       , l.SotrudNo'
      '       , s.SotrudName'
      '       , l.OtdelNo'
      '       , vo.OtdelName'
      '       , l.Set_Article_Group_Id'
      '       , dsag.NAME as GroupName'
      '       , l.Buh'
      '       , dbt.Buh_type_name'
      '       , l.Kol'
      '       , l.Active'
      ' from ListAddressPostForOstatok1 l left join'
      '      Post p on p.PostNo = l.PostNo left join'
      
        '      AddressPost ap on ap.PostNo = l.PostNo and ap.AddressNo = ' +
        'l.AddressNo left join'
      '      VidOtdel vo on vo.OtdelNo = l.OtdelNo left join'
      
        '      D_SET_ARTICLE_GROUP dsag on dsag.ID = l.Set_Article_Group_' +
        'Id left join'
      '      Sotrud s on s.SotrudNo = l.SotrudNo left join'
      '      d_buh_type dbt on dbt.Buh = l.Buh'
      'order by &_order')
    Left = 432
    Top = 8
    MacroData = <
      item
        Name = '_order'
        Value = 'l.PostNo'
      end>
    object quListAddressPostForOstatok1PostNo: TIntegerField
      DisplayLabel = #1050#1086#1076' '#1087#1072#1088#1090#1085#1077#1088#1072
      FieldName = 'PostNo'
    end
    object quListAddressPostForOstatok1Name: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1072#1088#1090#1085#1077#1088#1072
      FieldName = 'Name'
      Size = 30
    end
    object quListAddressPostForOstatok1AddressNo: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1072#1076#1088#1077#1089#1072
      FieldName = 'AddressNo'
    end
    object quListAddressPostForOstatok1Address: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089' '#1076#1086#1089#1090#1072#1074#1082#1080
      DisplayWidth = 50
      FieldName = 'Address'
      Size = 256
    end
    object quListAddressPostForOstatok1Active: TBooleanField
      DisplayLabel = 'V'
      FieldName = 'Active'
    end
    object quListAddressPostForOstatok1SotrudNo: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
      FieldName = 'SotrudNo'
    end
    object quListAddressPostForOstatok1SotrudName: TStringField
      DisplayLabel = #1048#1084#1103' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
      FieldName = 'SotrudName'
      Size = 30
    end
    object quListAddressPostForOstatok1Set_Article_Group_Id: TLargeintField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1043#1088#1091#1087#1087#1099' '#1086#1090#1089#1088#1086#1095#1082#1080
      FieldName = 'Set_Article_Group_Id'
    end
    object quListAddressPostForOstatok1GroupName: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087#1099' '#1086#1090#1089#1088#1086#1095#1082#1080
      DisplayWidth = 30
      FieldName = 'GroupName'
      Size = 512
    end
    object quListAddressPostForOstatok1OtdelNo: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1086#1090#1076#1077#1083#1072
      FieldName = 'OtdelNo'
    end
    object quListAddressPostForOstatok1OtdelName: TStringField
      DisplayLabel = #1054#1090#1076#1077#1083
      FieldName = 'OtdelName'
      Size = 30
    end
    object quListAddressPostForOstatok1Buh: TIntegerField
      DisplayWidth = 3
      FieldName = 'Buh'
      Visible = False
    end
    object quListAddressPostForOstatok1Buh_type_name: TStringField
      DisplayLabel = #1041#1091#1093#1075#1072#1083#1090#1077#1088#1089#1082#1080#1081' '#1090#1080#1087
      FieldName = 'Buh_type_name'
    end
    object quListAddressPostForOstatok1Kol: TIntegerField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1085#1072#1082#1083#1072#1076#1085#1099#1093
      FieldName = 'Kol'
    end
  end
  object dsListAddressPostForOstatok1: TMSDataSource
    DataSet = quListAddressPostForOstatok1
    Left = 400
    Top = 8
  end
end
