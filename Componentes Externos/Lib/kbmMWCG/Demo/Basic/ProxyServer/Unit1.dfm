object Form1: TForm1
  Left = 305
  Top = 200
  BorderStyle = bsDialog
  Caption = 'Proxy Server'
  ClientHeight = 341
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
  object Label1: TLabel
    Left = 8
    Top = 104
    Width = 529
    Height = 233
    AutoSize = False
    Caption = 
      'This server demo includes an inventory service and a query servi' +
      'ce.'#13#10'Push the Listen button to make the server listen for client' +
      's and serve requests.'#13#10'Push the Dont listen button to stop servi' +
      'ng new requests.'#13#10#13#10'As minimum a server needs to include a TkbmM' +
      'WServer component and some TkbmMWCustomServerTransport component' +
      '. In this demo, the TkbmMWTCPIPIndyServerTransport components is' +
      ' used.'#13#10'By adding more server transport components, the server c' +
      'an service many different transport channels simultainously. F.e' +
      'x. if a TkbmMWSMSServerTransport existed and was added to this p' +
      'roject, the TkbmMWServer would at the same time service both TCP' +
      'IP bound clients and clients communicating via SMS.'#13#10#13#10'Definitio' +
      'n of which services the server should provide to clients is made' +
      ' in code f.ex. in the OnCreate event of the TForm.'#13#10#13#10'Remember i' +
      'n this demo to setup the bindings for which clients are allowed ' +
      'to connect and on which ports on the kbmMWTCPIPIndyServerTranspo' +
      'rt1 components Bindings property.'#13#10'To allow any clients, use 0.0' +
      '.0.0. Default settings is only local host can access server (127' +
      '.0.0.1).'
    WordWrap = True
  end
  object Label2: TLabel
    Left = 0
    Top = 0
    Width = 544
    Height = 20
    Align = alTop
    Alignment = taCenter
    Caption = 'kbmMW Server demo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitWidth = 170
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
    EnableDefaultService = True
    ShutdownWait = 60
    EarlyAuthentication = False
    Left = 8
    Top = 8
  end
  object kbmMWTCPIPIndyServerTransport1: TkbmMWTCPIPIndyServerTransport
    Server = kbmMWServer1
    Bindings = <
      item
        IP = '127.0.0.1'
        Port = 4000
      end>
    StreamFormat = 'STANDARD'
    VerifyTransfer = True
    TransportStateOptions = []
    StringConversion = mwscFixed
    Left = 8
    Top = 40
  end
  object kbmMWClientConnectionPool1: TkbmMWClientConnectionPool
    Transport = kbmMWTCPIPIndyClientTransport1
    Left = 384
    Top = 88
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
    Left = 384
    Top = 120
  end
end
