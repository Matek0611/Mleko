inherited MlekoSelectResponseDeptDlg: TMlekoSelectResponseDeptDlg
  Left = 853
  Top = 209
  Caption = #1042#1099#1073#1086#1088' '#1086#1090#1074#1077#1090#1089#1074#1077#1085#1085#1086#1075#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
  PixelsPerInch = 96
  TextHeight = 13
  inherited SQLBuilder: TTargetSQLBuilder
    Select.Strings = (
      'id'
      ',name as response_dept_name')
    From.Strings = (
      'D_RESPONSE_DEPT')
  end
end
