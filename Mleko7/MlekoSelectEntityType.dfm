inherited MlekoSelectEntityTypeDlg: TMlekoSelectEntityTypeDlg
  Left = 820
  Top = 280
  Width = 540
  Height = 354
  Caption = #1042#1099#1073#1086#1088' '#1074#1080#1076#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 528
    Height = 258
    inherited TabSheet1: TTabSheet
      inherited Splitter: TSplitter
        Left = 298
        Height = 230
      end
      inherited PanelGrid: TPanel
        Width = 298
        Height = 230
        inherited DBGrid: TcitDBGrid
          Width = 296
          Height = 206
        end
        inherited ToolBar: TToolBar
          Width = 296
        end
      end
      inherited PanelSelect: TPanel
        Left = 301
        Height = 230
        inherited DBGridSelection: TcitDBGrid
          Height = 206
        end
      end
    end
  end
  inherited ButtonSelect: TButton
    Left = 449
    Top = 266
  end
  inherited ButtonCancel: TButton
    Left = 449
    Top = 298
  end
  inherited FilterPanel: TTargetFilter_Panel
    Top = 266
    Width = 432
  end
  inherited ActionList: TActionList
    Left = 116
  end
  inherited ComponentProps: TcitComponentProps
    Left = 32
  end
  inherited DS: TDataSource
    Left = 116
  end
  inherited SQLBuilder: TTargetSQLBuilder
    Select.Strings = (
      'id,description as entity_name,name as code')
    From.Strings = (
      'd_entity_type a')
    Where.Strings = (
      'name in ('#39'NAKLR'#39','#39'NAKLP'#39','#39'PLATR'#39','#39'PLATP'#39')')
    Left = 62
    Top = 41
  end
  inherited Query: TMSQuery
    Left = 87
  end
  inherited QueryProp: TMSQuery
    Left = 31
  end
  inherited DSSelection: TDataSource
    Left = 88
  end
  inherited QuSelectList: TMSQuery
    Left = 55
    Top = 196
  end
end
