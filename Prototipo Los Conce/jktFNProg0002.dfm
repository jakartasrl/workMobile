inherited FNProg0002: TFNProg0002
  Caption = 'FNProg0002'
  ClientHeight = 533
  ClientWidth = 769
  ExplicitWidth = 785
  ExplicitHeight = 571
  PixelsPerInch = 96
  TextHeight = 13
  object cxScheduler1: TcxScheduler [0]
    Left = 0
    Top = 65
    Width = 769
    Height = 468
    ViewGantt.Active = True
    ViewGantt.Scales.MajorUnit = suMonth
    ViewGantt.Scales.MinorUnit = suDay
    ViewTimeGrid.Scales.MajorUnit = suMonth
    ViewTimeGrid.Scales.MinorUnit = suDay
    Align = alClient
    EventPopupMenu.Items = [epmiEditSeries, epmiShowTimeAs, epmiLabel, epmiDelete]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Storage = Storage
    TabOrder = 4
    ExplicitWidth = 791
    ExplicitHeight = 459
    Splitters = {
      710200007E00000000030000830000006C0200000100000071020000D3010000}
    StoredClientBounds = {010000000100000000030000D3010000}
  end
  object cxGroupBox1: TcxGroupBox [1]
    Left = 0
    Top = 0
    Align = alTop
    Caption = 'Selecci'#243'n de Agenda'
    TabOrder = 5
    ExplicitWidth = 791
    Height = 65
    Width = 769
    object cxComboBox1: TcxComboBox
      Left = 120
      Top = 23
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'Compras'
        'Taller'
        'Laboratorio Qu'#237'mico'
        'Laboratorio El'#233'ctrico'
        'Legales')
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 0
      Text = 'Compras'
      Width = 153
    end
    object cxLabel1: TcxLabel
      Left = 16
      Top = 26
      Caption = 'Agenda del sector :'
      Transparent = True
    end
  end
  inherited BarManager: TdxBarManager
    Left = 344
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited Driver: TjktDriver
    Scheduler = cxScheduler1
    Left = 672
  end
  inherited IdHTTP: TIdHTTP
    Left = 560
  end
  inherited Service: TjktServiceCaller
    Left = 512
  end
  inherited OperacionSave: TjktOperacion
    Left = 736
  end
  object Storage: TcxSchedulerStorage
    CustomFields = <
      item
        Name = 'Duracion'
        ValueType = 'Integer'
      end>
    Resources.Items = <
      item
        Name = 'Compras'
        ResourceID = 0
      end
      item
        Name = 'Taller'
        ResourceID = 1
        Visible = False
      end
      item
        Name = 'Laboratorio Qu'#237'mico'
        ResourceID = 2
        Visible = False
      end
      item
        Name = 'Laboratorio El'#233'ctrico'
        ResourceID = 3
        Visible = False
      end
      item
        Name = 'Legales'
        ResourceID = 4
        Visible = False
      end>
    Left = 704
    Top = 232
  end
end
