inherited UpdaterForm: TUpdaterForm
  Caption = 'UpdaterForm'
  ExplicitWidth = 218
  ExplicitHeight = 132
  PixelsPerInch = 96
  TextHeight = 13
  object TrayIcon: TTrayIcon
    OnClick = TrayIconClick
    Left = 8
    Top = 8
  end
  object ActionList1: TActionList
    Left = 40
    Top = 8
    object Logout: TAction
      Caption = #1042#1099#1093#1086#1076
      OnExecute = LogoutExecute
    end
  end
  object PopupMenu: TPopupMenu
    Left = 72
    Top = 8
    object Logout1: TMenuItem
      Action = Logout
    end
  end
end
