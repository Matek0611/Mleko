inherited fmSelectOtdel: TfmSelectOtdel
  Caption = #1042#1099#1073#1086#1088' '#1086#1090#1076#1077#1083#1072
  ClientHeight = 293
  ClientWidth = 261
  DesignSize = (
    261
    293)
  PixelsPerInch = 96
  TextHeight = 13
  inherited ButtonOK: TButton
    Left = 19
    Top = 261
  end
  inherited ButtonCancel: TButton
    Left = 99
    Top = 261
  end
  inherited ButtonApply: TButton
    Left = 179
    Top = 261
  end
  inherited PageControl: TPageControl
    Width = 261
    Height = 232
    inherited TabSheet1: TTabSheet
      object CheckList: TCheckListBox
        Left = 0
        Top = 0
        Width = 253
        Height = 204
        Align = alClient
        Ctl3D = True
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier'
        Font.Style = []
        ItemHeight = 14
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  inherited ToolBar: TToolBar
    Width = 261
  end
  inherited ActionList: TActionList
    Left = 152
  end
  inherited Query: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'Select * from vidotdel where OtdelNo<>-1')
  end
  inherited DS: TDataSource
    Left = 184
  end
end
