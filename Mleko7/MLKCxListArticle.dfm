inherited MLKCxListArticleFrame: TMLKCxListArticleFrame
  inherited PanelGrid: TPanel
    inherited DBCxGrid: TcxGrid
      inherited DBCxGridDBTableView1: TcxGridDBTableView
        OptionsBehavior.AlwaysShowEditor = True
        OptionsView.Indicator = True
        object DBCxGridDBTableView1TovarNo: TcxGridDBColumn
          Caption = #1050#1086#1076
          DataBinding.FieldName = 'TovarNo'
          Options.Editing = False
          Width = 41
        end
        object DBCxGridDBTableView1NameTovar: TcxGridDBColumn
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'NameTovar'
          Options.Editing = False
          Width = 171
        end
        object DBCxGridDBTableView1NameTovarShort: TcxGridDBColumn
          Caption = #1050#1088#1072#1090#1082#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'NameTovarShort'
          Options.Editing = False
          Width = 148
        end
        object DBCxGridDBTableView1EdIzm: TcxGridDBColumn
          Caption = #1045#1076' '#1080#1079#1084
          DataBinding.FieldName = 'EdIzm'
          Options.Editing = False
          Width = 40
        end
        object DBCxGridDBTableView1VidNo: TcxGridDBColumn
          Caption = #1042#1080#1076
          DataBinding.FieldName = 'VidNo'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'VidNo'
          Properties.ListColumns = <
            item
              FieldName = 'VidName'
            end>
          Properties.ListSource = MlekoDbDsMSSQLDm.dsVidTov
          Width = 67
        end
        object DBCxGridDBTableView1CompanyNo: TcxGridDBColumn
          Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
          DataBinding.FieldName = 'CompanyNo'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'CompanyNo'
          Properties.ListColumns = <
            item
              FieldName = 'NameCompany'
            end>
          Properties.ListSource = MlekoDbDsMSSQLDm.dsCompany
          Width = 74
        end
        object DBCxGridDBTableView1KolPerPak: TcxGridDBColumn
          Caption = #1059#1087#1072#1082
          DataBinding.FieldName = 'KolPerPak'
          Width = 34
        end
        object DBCxGridDBTableView1SrokReal: TcxGridDBColumn
          Caption = #1057#1088#1086#1082
          DataBinding.FieldName = 'SrokReal'
          Width = 34
        end
        object DBCxGridDBTableView1Weight: TcxGridDBColumn
          Caption = #1042#1077#1089
          DataBinding.FieldName = 'Weight'
          Width = 32
        end
        object DBCxGridDBTableView1OtdelNo: TcxGridDBColumn
          Caption = #1054#1090#1076#1077#1083
          DataBinding.FieldName = 'OtdelNo'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'OtdelNo'
          Properties.ListColumns = <
            item
              FieldName = 'OtdelName'
            end>
          Properties.ListSource = MlekoDbDsMSSQLDm.DsVidOtdel
        end
        object DBCxGridDBTableView1TaraNo: TcxGridDBColumn
          Caption = #1058#1072#1088#1072
          DataBinding.FieldName = 'TaraNo'
        end
        object DBCxGridDBTableView1Visible: TcxGridDBColumn
          Caption = #1053#1077#1074#1080#1076#1080#1084
          DataBinding.FieldName = 'Visible'
          Width = 47
        end
      end
    end
    inherited PageControlTop: TcxPageControl
      inherited tsMainFilter: TcxTabSheet
        object chkWithGroup: TCheckBox
          Left = 8
          Top = 8
          Width = 241
          Height = 17
          Caption = #1053#1077' '#1074#1082#1083#1102#1095#1077#1085#1085#1099#1077' '#1074' '#1075#1088#1091#1087#1087#1099
          TabOrder = 0
          OnClick = chkWithGroupClick
        end
      end
    end
  end
  inherited PageSettings: TcxPageControl
    inherited TabProp2: TcxTabSheet
      inherited FrameProp: TValueListEditor
        Strings.Strings = (
          'KEYFIELDS=TovarNo'
          'CustomDMClassName=TMlekoDbDsMSSQLDm'
          'ResourceModuleClassName=TMlekoResDm'
          'PropClassName=TfmEditTovar'
          'MultiSelect=False'
          'SelectStyle=LIST'
          'ViewStyle=LIST'
          'GRIDDataSetName=QuTovar')
        ColWidths = (
          87
          99)
      end
    end
  end
  inherited UserActionList: TActionList
    Left = 6
    Top = 246
  end
  inherited DS: TDataSource
    Left = 96
    Top = 246
  end
  inherited CustomActionList: TActionList
    Left = 66
    Top = 247
  end
  inherited SysActionList: TActionList
    Left = 36
    Top = 246
  end
  inherited BarManager: TdxBarManager
    Categories.ItemsVisibles = (
      2
      2
      2
      2
      2
      2
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True
      True
      True
      True
      True
      True
      True)
    Left = 144
    Top = 248
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited VTSelection: TVirtualTable
    Data = {03000000000000000000}
  end
end
