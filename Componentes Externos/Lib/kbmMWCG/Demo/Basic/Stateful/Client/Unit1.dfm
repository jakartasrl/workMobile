object Form1: TForm1
  Left = 254
  Top = 116
  Width = 538
  Height = 593
  Caption = 'Client'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 0
    Top = 0
    Width = 530
    Height = 25
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    Caption = 'kbmMW client demo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object PageControl2: TPageControl
    Left = 0
    Top = 25
    Width = 530
    Height = 541
    ActivePage = TabSheet3
    Align = alClient
    TabOrder = 0
    object TabSheet2: TTabSheet
      Caption = 'Standard services like the inventory service'
      DesignSize = (
        522
        513)
      object Label1: TLabel
        Left = 88
        Top = 0
        Width = 84
        Height = 13
        Caption = 'Connect to server'
      end
      object Label2: TLabel
        Left = 88
        Top = 32
        Width = 109
        Height = 13
        Caption = 'Disconnect from server'
      end
      object Label6: TLabel
        Left = 208
        Top = 64
        Width = 297
        Height = 57
        AutoSize = False
        Caption = 
          'You can use the simple client or the inventory client to access ' +
          'the inventory service on the server.'#13#10'In this sample, only the S' +
          'imple client is actually used.'
        WordWrap = True
      end
      object Button1: TButton
        Left = 8
        Top = 0
        Width = 75
        Height = 25
        Caption = 'Connect'
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 8
        Top = 32
        Width = 75
        Height = 25
        Caption = 'Disconnect'
        TabOrder = 1
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 8
        Top = 64
        Width = 193
        Height = 25
        Caption = 'Request Inventory 100 times'
        TabOrder = 2
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 8
        Top = 96
        Width = 193
        Height = 25
        Caption = 'Request abstract for inventory'
        TabOrder = 3
        OnClick = Button4Click
      end
      object lbDebug: TListBox
        Left = 0
        Top = 128
        Width = 522
        Height = 385
        Anchors = [akLeft, akTop, akRight, akBottom]
        ItemHeight = 13
        TabOrder = 4
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Stateful service'
      ImageIndex = 1
      object Label3: TLabel
        Left = 288
        Top = 16
        Width = 74
        Height = 13
        Caption = 'Value on server'
      end
      object lValue: TLabel
        Left = 400
        Top = 16
        Width = 17
        Height = 13
        Caption = 'n/a'
      end
      object Label4: TLabel
        Left = 288
        Top = 64
        Width = 46
        Height = 13
        Caption = 'State ID'#39's'
      end
      object Label7: TLabel
        Left = 288
        Top = 40
        Width = 73
        Height = 13
        Caption = 'Current StateID'
      end
      object lStateID: TLabel
        Left = 400
        Top = 40
        Width = 17
        Height = 13
        Caption = 'n/a'
      end
      object Button5: TButton
        Left = 16
        Top = 8
        Width = 105
        Height = 25
        Caption = 'Get value'
        TabOrder = 0
        OnClick = Button5Click
      end
      object Button7: TButton
        Left = 16
        Top = 40
        Width = 105
        Height = 25
        Caption = 'Inc and Get value'
        TabOrder = 1
        OnClick = Button7Click
      end
      object Button8: TButton
        Left = 16
        Top = 72
        Width = 105
        Height = 25
        Caption = 'Release all states'
        TabOrder = 2
        OnClick = Button8Click
      end
      object mStateIDs: TMemo
        Left = 288
        Top = 88
        Width = 217
        Height = 297
        TabOrder = 3
      end
      object Button9: TButton
        Left = 16
        Top = 104
        Width = 105
        Height = 25
        Caption = 'Clear all states'
        TabOrder = 4
        OnClick = Button9Click
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Performance'
      ImageIndex = 2
      object Button6: TButton
        Left = 8
        Top = 32
        Width = 153
        Height = 25
        Caption = 'Call inventory 10000 times'
        TabOrder = 0
        OnClick = Button6Click
      end
      object mPerformancelog: TMemo
        Left = 0
        Top = 64
        Width = 513
        Height = 433
        TabOrder = 1
      end
    end
  end
  object kbmMWSimpleClient1: TkbmMWSimpleClient
    Transport = kbmMWTCPIPIndyClientTransport1
    Left = 448
    Top = 40
  end
  object kbmMWTCPIPIndyClientTransport1: TkbmMWTCPIPIndyClientTransport
    Active = False
    Port = 3000
    Host = '127.0.0.1'
    StreamFormat = 'STANDARD'
    VerifyTransfer = True
    TransportStateOptions = []
    MaxRetries = 0
    MaxRetriesAlternative = 0
    RequestTimeout = 30
    MinClientPort = 0
    MaxClientPort = 0
    ConnectTimeout = 60
    StringConversion = mwscFixed
    Left = 480
    Top = 8
  end
  object kbmMWInventoryClient1: TkbmMWInventoryClient
    Transport = kbmMWTCPIPIndyClientTransport1
    Inventory.Strings = (
      'KBMMW_INVENTORY'
      'KBMMW_QUERY')
    SelectedService = 'KBMMW_QUERY'
    InventoryService = 'KBMMW_INVENTORY'
    InventoryServiceVersion = 'kbmMW_1.0'
    Left = 480
    Top = 40
  end
end
