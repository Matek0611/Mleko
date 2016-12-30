inherited ServiceBrokerFrame: TServiceBrokerFrame
  Width = 889
  Height = 471
  Align = alClient
  object Splitter1: TSplitter
    Left = 380
    Top = 0
    Height = 471
    Color = clBtnFace
    ParentColor = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 380
    Height = 471
    Align = alLeft
    Anchors = [akTop]
    BevelOuter = bvNone
    Color = clGreen
    TabOrder = 0
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 380
      Height = 136
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 3
        Top = 6
        Width = 111
        Height = 13
        Caption = 'Initiator connection'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel5: TPanel
        Left = 1
        Top = 23
        Width = 378
        Height = 112
        Anchors = [akLeft, akTop, akRight, akBottom]
        BevelOuter = bvNone
        Color = clGreen
        TabOrder = 0
        object btInitiatorBeginDialog: TSpeedButton
          Left = 1
          Top = 1
          Width = 82
          Height = 22
          Caption = 'Begin dialog'
          Flat = True
          Transparent = False
          OnClick = btInitiatorBeginDialogClick
        end
        object btInitiatorEndDialog: TSpeedButton
          Left = 84
          Top = 1
          Width = 82
          Height = 22
          Caption = 'End dialog'
          Flat = True
          Transparent = False
          OnClick = btInitiatorEndDialogClick
        end
        object btInitiatorSend: TSpeedButton
          Left = 167
          Top = 1
          Width = 82
          Height = 22
          Caption = 'Send'
          Flat = True
          Transparent = False
          OnClick = btInitiatorSendClick
        end
        object btInitiatorReceive: TSpeedButton
          Left = 250
          Top = 1
          Width = 82
          Height = 22
          Caption = 'Receive'
          Flat = True
          Transparent = False
          OnClick = btInitiatorReceiveClick
        end
        object Panel7: TPanel
          Left = 1
          Top = 24
          Width = 376
          Height = 87
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelOuter = bvNone
          TabOrder = 0
          object lbInitiatorMessage: TLabel
            Left = 3
            Top = 37
            Width = 43
            Height = 13
            Caption = 'Message'
          end
          object lbInitiatorWaitTimeout: TLabel
            Left = 3
            Top = 66
            Width = 60
            Height = 13
            Caption = 'WaitTimeout'
          end
          object cbInitiatorAsynchNotification: TCheckBox
            Left = 3
            Top = 8
            Width = 166
            Height = 17
            Caption = 'AsynchNotification'
            TabOrder = 0
            OnClick = cbInitiatorAsynchNotificationClick
          end
          object edInitiatorMessage: TEdit
            Left = 66
            Top = 33
            Width = 308
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            Text = 'Hello target connection!'
          end
          object edInitiatorWaitTimeout: TEdit
            Left = 66
            Top = 63
            Width = 81
            Height = 21
            TabOrder = 2
            OnChange = edInitiatorWaitTimeoutChange
          end
        end
        object Panel10: TPanel
          Left = 333
          Top = 1
          Width = 44
          Height = 22
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvNone
          TabOrder = 1
        end
      end
    end
    object meInitiatorLog: TMemo
      Left = 0
      Top = 136
      Width = 380
      Height = 335
      Align = alClient
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 383
    Top = 0
    Width = 506
    Height = 471
    Align = alClient
    BevelOuter = bvNone
    Color = clGreen
    TabOrder = 1
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 506
      Height = 136
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label2: TLabel
        Left = 3
        Top = 6
        Width = 105
        Height = 13
        Caption = 'Target connection'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel6: TPanel
        Left = 1
        Top = 23
        Width = 333
        Height = 112
        BevelOuter = bvNone
        Color = clGreen
        TabOrder = 0
        object btTargetReceive: TSpeedButton
          Left = 84
          Top = 1
          Width = 82
          Height = 22
          Caption = 'Receive'
          Flat = True
          Transparent = False
          OnClick = btTargetReceiveClick
        end
        object btTargetSend: TSpeedButton
          Left = 1
          Top = 1
          Width = 82
          Height = 22
          Caption = 'Send'
          Flat = True
          Transparent = False
          OnClick = btTargetSendClick
        end
        object Panel8: TPanel
          Left = 1
          Top = 24
          Width = 331
          Height = 87
          BevelOuter = bvNone
          TabOrder = 0
          object lbTargetMessage: TLabel
            Left = 3
            Top = 37
            Width = 43
            Height = 13
            Caption = 'Message'
          end
          object lbTargetWaitTimeout: TLabel
            Left = 3
            Top = 66
            Width = 60
            Height = 13
            Caption = 'WaitTimeout'
          end
          object cbTargetAsynchNotification: TCheckBox
            Left = 8
            Top = 7
            Width = 166
            Height = 17
            Caption = 'AsynchNotification'
            TabOrder = 0
            OnClick = cbTargetAsynchNotificationClick
          end
          object edTargetMessage: TEdit
            Left = 66
            Top = 33
            Width = 263
            Height = 21
            TabOrder = 1
            Text = 'Hello initiator connection!'
          end
          object edTargetWaitTimeout: TEdit
            Left = 66
            Top = 63
            Width = 81
            Height = 21
            TabOrder = 2
            OnChange = edTargetWaitTimeoutChange
          end
        end
        object Panel9: TPanel
          Left = 167
          Top = 1
          Width = 165
          Height = 22
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelOuter = bvNone
          TabOrder = 1
        end
      end
    end
    object meTargetLog: TMemo
      Left = 0
      Top = 136
      Width = 506
      Height = 335
      Align = alClient
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 1
    end
  end
  object InitiatorServiceBroker: TMSServiceBroker
    WaitTimeout = 5000
    OnMessage = InitiatorServiceBrokerMessage
    OnBeginConversation = InitiatorServiceBrokerBeginConversation
    OnEndConversation = InitiatorServiceBrokerEndConversation
    Left = 240
    Top = 128
  end
  object MSConnection2: TMSConnection
    Database = 'master'
    Left = 384
    Top = 232
  end
  object TargetServiceBroker: TMSServiceBroker
    Connection = MSConnection2
    WaitTimeout = 5000
    OnMessage = TargetServiceBrokerMessage
    OnBeginConversation = TargetServiceBrokerBeginConversation
    OnEndConversation = TargetServiceBrokerEndConversation
    Left = 416
    Top = 232
  end
end
