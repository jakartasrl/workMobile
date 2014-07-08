inherited FNProg0003: TFNProg0003
  Caption = 'Planificador de Taller'
  ClientHeight = 501
  ClientWidth = 767
  ExplicitWidth = 783
  ExplicitHeight = 539
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox [0]
    Left = 0
    Top = 0
    Align = alTop
    Caption = 'Selecci'#243'n de Orden de Trabajo'
    TabOrder = 4
    ExplicitLeft = 376
    ExplicitTop = 400
    Height = 65
    Width = 767
    object cxLabel1: TcxLabel
      Left = 16
      Top = 26
      Caption = 'Nro. de Orden de Trabajo :'
      Transparent = True
    end
    object cxButtonEdit1: TcxButtonEdit
      Left = 157
      Top = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      TabOrder = 1
      Width = 121
    end
  end
  object Scheduler: TcxScheduler [1]
    Left = 0
    Top = 65
    Width = 767
    Height = 436
    ViewDay.TimeRulerMinutes = True
    ViewDay.TimeScale = 15
    ViewGantt.Active = True
    ViewGantt.Scales.MajorUnit = suMonth
    ViewGantt.Scales.MinorUnit = suDay
    ViewGantt.TreeBrowser.Width = 371
    ViewGantt.ShowExpandButtons = True
    ViewGantt.ShowTotalProgressLine = True
    ViewTimeGrid.Scales.TimeStep = 60
    Align = alClient
    ControlBox.Control = cxPageControl1
    EventOperations.SharingBetweenResources = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    OptionsView.AdditionalTimeZone = 17
    OptionsView.AdditionalTimeZoneLabel = 'Am'#233'rica Central'
    OptionsView.CurrentTimeZoneLabel = 'Buenos Aires'
    OptionsView.ResourceHeaders.RotateCaptions = False
    OptionsView.ResourcesPerPage = 2
    OptionsView.RotateResourceCaptions = False
    OptionsView.WorkStart = 0.375000000000000000
    OptionsView.WorkFinish = 0.750000000000000000
    ResourceNavigator.Buttons.ShowFewerResources.Hint = 'Mostrar menos sectores'
    ResourceNavigator.Buttons.ShowMoreResources.Hint = 'Mostrar m'#225's sectores'
    Storage = Storage
    TabOrder = 5
    ExplicitLeft = 33
    ExplicitTop = 95
    ExplicitWidth = 672
    ExplicitHeight = 383
    Selection = 1
    Splitters = {
      6F0200007E000000FE020000830000006A020000010000006F020000B3010000}
    StoredClientBounds = {0100000001000000FE020000B3010000}
    object cxPageControl1: TcxPageControl
      Left = 0
      Top = 0
      Width = 143
      Height = 304
      Align = alClient
      TabOrder = 0
      Properties.ActivePage = tbsGantt
      Properties.CustomButtons.Buttons = <>
      ExplicitHeight = 243
      ClientRectBottom = 300
      ClientRectLeft = 4
      ClientRectRight = 139
      ClientRectTop = 24
      object tbsGantt: TcxTabSheet
        Caption = 'Gantt'
        ImageIndex = 3
        ExplicitHeight = 223
        DesignSize = (
          135
          276)
        object btnGanttExpandAll: TcxButton
          Tag = 1
          Left = 8
          Top = 38
          Width = 119
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Expand All'
          TabOrder = 0
        end
        object btnGanttCollapseAll: TcxButton
          Left = 8
          Top = 8
          Width = 119
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Collapse All'
          TabOrder = 1
        end
        object cbxEventsStyle: TcxComboBox
          Left = 8
          Top = 86
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            'Default'
            'Progress')
          TabOrder = 2
          Text = 'Default'
          Width = 127
        end
        object cxLabel5: TcxLabel
          Left = 8
          Top = 68
          Caption = 'Events Style:'
          Transparent = True
        end
        object cbxExpandButton: TcxCheckBox
          Left = 8
          Top = 113
          Caption = 'Expand Buttons'
          State = cbsChecked
          TabOrder = 4
          Transparent = True
          Width = 121
        end
        object cbxProgress: TcxCheckBox
          Left = 8
          Top = 139
          Caption = 'Progress Line'
          State = cbsChecked
          TabOrder = 5
          Transparent = True
          Width = 121
        end
        object cbxSnapGanttEvents: TcxCheckBox
          Left = 8
          Top = 160
          Caption = 'Snap Events to TimeSlots'
          Properties.MultiLine = True
          State = cbsChecked
          TabOrder = 6
          Transparent = True
          Width = 121
        end
        object cbxTreeBrowser: TcxCheckBox
          Left = 8
          Top = 192
          Caption = 'Tree Browser'
          Properties.MultiLine = True
          TabOrder = 7
          Transparent = True
          Width = 121
        end
      end
      object cxTabSheet1: TcxTabSheet
        Caption = 'Vista'
        ImageIndex = 1
        ExplicitHeight = 223
        object cxGroupBox2: TcxGroupBox
          Left = 3
          Top = 11
          TabOrder = 0
          Height = 78
          Width = 124
          object cxComboBox2: TcxComboBox
            Left = 11
            Top = 31
            Properties.DropDownListStyle = lsFixedList
            Properties.Items.Strings = (
              'Ninguno'
              'Fecha'
              'Sector')
            TabOrder = 0
            Text = 'Sector'
            Width = 105
          end
          object cxLabel2: TcxLabel
            Left = 11
            Top = 8
            Caption = 'Agrupar por:'
            Transparent = True
          end
        end
      end
    end
  end
  inherited BarManager: TdxBarManager
    Left = 312
    Top = 24
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited Driver: TjktDriver
    Scheduler = Scheduler
    Left = 640
    Top = 24
  end
  inherited IdHTTP: TIdHTTP
    Left = 528
    Top = 24
  end
  inherited Service: TjktServiceCaller
    Left = 480
    Top = 24
  end
  inherited OperacionSave: TjktOperacion
    Left = 704
    Top = 24
  end
  object Storage: TcxSchedulerStorage
    CustomFields = <
      item
        Name = 'Duracion'
        ValueType = 'Integer'
      end>
    Resources.Items = <
      item
        Name = 'Carpinter'#237'a'
        ResourceID = 1
      end
      item
        Name = 'Bobinado'
        ResourceID = 2
      end
      item
        Name = 'Montaje'
        ResourceID = 3
      end
      item
        Name = 'Herrer'#237'a'
        ResourceID = 4
      end>
    Left = 440
    Top = 160
  end
end
