inherited MlekoSelectDocStateDlg: TMlekoSelectDocStateDlg
  Left = 297
  Top = 233
  Caption = 'MlekoSelectDocStateDlg'
  PixelsPerInch = 96
  TextHeight = 13
  inherited SQLBuilder: TTargetSQLBuilder
    Select.Strings = (
      'id'
      ',Name as State_name'
      ',description')
    From.Strings = (
      'd_edit_status')
    Left = 71
    Top = 124
  end
end
