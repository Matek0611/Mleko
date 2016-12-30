inherited ControlVidRashodForPlatForm: TControlVidRashodForPlatForm
  Left = 399
  Top = 239
  Width = 846
  Height = 364
  Caption = 
    #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1074#1080#1076#1086#1074' '#1088#1072#1089#1093#1086#1076#1072' '#1076#1083#1103' '#1087#1088#1080#1093#1086#1076#1072' '#1080' '#1088#1072#1089#1093#1086#1076#1072' '#1076#1077#1085#1077#1075' '#1087#1088#1080' '#1074#1099#1075#1088#1091#1079#1082 +
    #1077' '#1076#1086#1083#1075#1086#1074' '#1085#1072' '#1089#1072#1081#1090
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 830
    Height = 325
    Align = alClient
    TabOrder = 0
    object gbPlatP: TGroupBox
      Left = 1
      Top = 1
      Width = 415
      Height = 323
      Align = alClient
      Caption = #1055#1088#1080#1093#1086#1076' '#1076#1077#1085#1077#1075
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Panel2: TPanel
        Left = 2
        Top = 280
        Width = 411
        Height = 41
        Align = alBottom
        TabOrder = 0
        object VidrashodNoPlatP: TcitDBComboEdit
          Left = 150
          Top = 13
          Width = 226
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
          LLblCaption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1080#1076' '#1088#1072#1089#1093#1086#1076#1072':'
          LLblWidth = 140
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
          Required = True
          TabOrder = 0
          Visible = True
          LocateKey = False
          Owner = 'ControlVidRashodForPlat'
          EntityCode = 'VIDRASHOD'
          multiselect = True
          OnSelectOk = VidrashodNoPlatPSelectOk
          EditStyle = edSelect
          AutoTabControl = True
        end
      end
      object DBGridEhVidRashPlatP: TDBGridEh
        Left = 2
        Top = 15
        Width = 411
        Height = 265
        Align = alClient
        DataSource = dsVidRashodPlatP
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = [fsBold]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnKeyDown = DBGridEhVidRashPlatPKeyDown
        OnKeyPress = DBGridEhVidRashPlatPKeyPress
        Columns = <
          item
            EditButtons = <>
            FieldName = 'VidRashNo'
            Footers = <>
            ReadOnly = True
          end
          item
            EditButtons = <>
            FieldName = 'VidRashodName'
            Footers = <>
            ReadOnly = True
          end
          item
            EditButtons = <>
            FieldName = 'CheckMinus'
            Footers = <>
          end>
      end
    end
    object gbPlatR: TGroupBox
      Left = 416
      Top = 1
      Width = 413
      Height = 323
      Align = alRight
      Caption = #1056#1072#1089#1093#1086#1076' '#1076#1077#1085#1077#1075
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Panel3: TPanel
        Left = 2
        Top = 280
        Width = 409
        Height = 41
        Align = alBottom
        TabOrder = 0
        object VidrashodNoPlatR: TcitDBComboEdit
          Left = 148
          Top = 13
          Width = 226
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
          LLblCaption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1080#1076' '#1088#1072#1089#1093#1086#1076#1072':'
          LLblWidth = 140
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
          Required = True
          TabOrder = 0
          Visible = True
          LocateKey = False
          Owner = 'ControlVidRashodForPlat'
          EntityCode = 'VIDRASHOD'
          multiselect = True
          OnSelectOk = VidrashodNoPlatRSelectOk
          EditStyle = edSelect
          AutoTabControl = True
        end
      end
      object DBGridEhVidRashPlatR: TDBGridEh
        Left = 2
        Top = 15
        Width = 409
        Height = 265
        Align = alClient
        DataSource = dsVidRashodPlatR
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = [fsBold]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnKeyDown = DBGridEhVidRashPlatRKeyDown
        OnKeyPress = DBGridEhVidRashPlatRKeyPress
        Columns = <
          item
            EditButtons = <>
            FieldName = 'VidRashNo'
            Footers = <>
            ReadOnly = True
          end
          item
            EditButtons = <>
            FieldName = 'VidRashodName'
            Footers = <>
            ReadOnly = True
          end
          item
            EditButtons = <>
            FieldName = 'CheckMinus'
            Footers = <>
          end>
      end
    end
  end
  object dsVidRashodPlatP: TMSDataSource
    DataSet = quVidRashodPlatP
    Left = 5
    Top = 226
  end
  object quVidRashodPlatP: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select lmp.VidRashNo'
      '      ,p.VidRashodName'
      '      ,lmp.CheckMinus'
      ' from ListMinusVidRashPlatPForSite lmp inner join'
      '      VidRashod p on p.VidRashodNo = lmp.VidRashNo')
    Left = 5
    Top = 250
    object quVidRashodPlatPVidRashNo: TSmallintField
      DisplayLabel = #1050#1086#1076
      DisplayWidth = 5
      FieldName = 'VidRashNo'
    end
    object quVidRashodPlatPVidRashodName: TStringField
      DisplayLabel = #1042#1080#1076' '#1088#1072#1089#1093#1086#1076#1072
      FieldName = 'VidRashodName'
      Size = 50
    end
    object quVidRashodPlatPCheckMinus: TBooleanField
      Alignment = taCenter
      DisplayLabel = 'V'
      DisplayWidth = 3
      FieldName = 'CheckMinus'
    end
  end
  object dsVidRashodPlatR: TMSDataSource
    DataSet = quVidRashodPlatR
    Left = 802
    Top = 226
  end
  object quVidRashodPlatR: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select lmp.VidRashNo'
      '      ,p.VidRashodName'
      '      ,lmp.CheckMinus'
      ' from ListMinusVidRashPlatRForSite lmp inner join'
      '      VidRashod p on p.VidRashodNo = lmp.VidRashNo')
    Left = 802
    Top = 250
    object quVidRashodPlatRVidRashNo: TSmallintField
      DisplayLabel = #1050#1086#1076
      DisplayWidth = 5
      FieldName = 'VidRashNo'
    end
    object quVidRashodPlatRVidRashodName: TStringField
      DisplayLabel = #1042#1080#1076' '#1088#1072#1089#1093#1086#1076#1072
      FieldName = 'VidRashodName'
      Size = 50
    end
    object quVidRashodPlatRCheckMinus: TBooleanField
      Alignment = taCenter
      DisplayLabel = 'V'
      DisplayWidth = 3
      FieldName = 'CheckMinus'
    end
  end
  object spInsInListMinusVidRashPlatPForSite: TMSStoredProc
    StoredProcName = 'InsInListMinusVidRashPlatPForSite;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL InsInListMinusVidRashPlatPForSite;1(:SPID,' +
        ' :UserNo)}')
    Left = 33
    Top = 249
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'SPID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UserNo'
        ParamType = ptInput
      end>
  end
  object spInsInListMinusVidRashPlatRForSite: TMSStoredProc
    StoredProcName = 'InsInListMinusVidRashPlatRForSite;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL InsInListMinusVidRashPlatRForSite;1(:SPID,' +
        ' :UserNo)}')
    Left = 776
    Top = 249
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'SPID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UserNo'
        ParamType = ptInput
      end>
  end
end
