object Form1: TForm1
  Left = 305
  Top = 200
  BorderStyle = bsDialog
  Caption = 'Server'
  ClientHeight = 107
  ClientWidth = 544
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 0
    Top = 0
    Width = 544
    Height = 20
    Align = alTop
    Alignment = taCenter
    Caption = 'kbmMW Stateful server demo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitWidth = 236
  end
  object GroupBox1: TGroupBox
    Left = 352
    Top = 24
    Width = 185
    Height = 73
    Caption = 'Statistics storage'
    TabOrder = 0
    object Button3: TButton
      Left = 14
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Save stats'
      TabOrder = 0
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 94
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Load stats'
      TabOrder = 1
      OnClick = Button4Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 24
    Width = 185
    Height = 73
    Caption = 'Start/stop client access to server'
    TabOrder = 1
    object Button1: TButton
      Left = 8
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Listen'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 94
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Dont listen'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 200
    Top = 24
    Width = 145
    Height = 73
    Caption = 'Accesses'
    TabOrder = 2
    object lCounter: TLabel
      Left = 8
      Top = 24
      Width = 129
      Height = 33
      Alignment = taCenter
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object kbmMWServer1: TkbmMWServer
    Active = False
    OnServeRequest = kbmMWServer1ServeRequest
    CPUAffinityMask = 1
    GarbageCollection = True
    GarbageInterval = 60
    EnableDefaultService = False
    ShutdownWait = 60
    EarlyAuthentication = False
    Left = 8
    Top = 8
  end
  object kbmMWTCPIPIndyServerTransport1: TkbmMWTCPIPIndyServerTransport
    Server = kbmMWServer1
    Bindings = <
      item
        IP = '0.0.0.0'
        Port = 3000
      end>
    StreamFormat = 'STANDARD'
    VerifyTransfer = True
    TransportStateOptions = []
    StringConversion = mwscFixed
    Left = 8
    Top = 40
  end
end
