inherited MlekoPropDbPostAddressDlg: TMlekoPropDbPostAddressDlg
  Left = 1034
  Top = 228
  Caption = 'MlekoPropDbPostAddressDlg'
  ClientHeight = 488
  ClientWidth = 368
  PixelsPerInch = 96
  TextHeight = 13
  inherited ButtonOK: TButton
    Left = 160
    Top = 464
  end
  inherited ButtonCancel: TButton
    Left = 230
    Top = 464
  end
  inherited ButtonApply: TButton
    Left = 300
    Top = 464
  end
  inherited PageControl: TPageControl
    Width = 368
    Height = 417
  end
  inherited ToolBar: TToolBar
    Width = 368
  end
  inherited Query: TMSQuery
    SQL.Strings = (
      'SELECT     ID,PostNo, AddressNo, Address, RegionNo, MarschrutNo'
      'FROM         AddressPost'
      'where AddressPost.PostNo= :PostNo')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PostNo'
      end>
  end
end
