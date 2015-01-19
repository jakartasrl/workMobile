inherited FNVen0009: TFNVen0009
  Caption = 'Carga Tipo de Cambio'
  ClientHeight = 438
  ClientWidth = 664
  ExplicitWidth = 680
  ExplicitHeight = 476
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBoxLeft: TcxGroupBox
    ExplicitHeight = 0
    Height = 438
  end
  inherited cxSplitterLeft: TcxSplitter
    Height = 438
    ExplicitHeight = 0
  end
  inherited cxGroupBoxRight: TcxGroupBox
    Left = 634
    ExplicitLeft = 86
    ExplicitHeight = 0
    Height = 438
  end
  inherited cxSplitterRight: TcxSplitter
    Left = 630
    Height = 438
    ExplicitLeft = 82
    ExplicitHeight = 0
  end
  inherited cxGroupBoxMain: TcxGroupBox
    ExplicitWidth = 48
    ExplicitHeight = 0
    Height = 438
    Width = 596
    object lcMain: TdxLayoutControl
      Left = 2
      Top = 2
      Width = 592
      Height = 434
      Align = alClient
      TabOrder = 0
      LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
      ExplicitWidth = 756
      ExplicitHeight = 488
      object cxDBDateEdit2: TcxDBDateEdit
        Left = 198
        Top = 41
        DataBinding.DataField = 'vig_has'
        Properties.ReadOnly = False
        Style.HotTrack = False
        TabOrder = 1
        Width = 90
      end
      object jktExpDBGrid1: TjktExpDBGrid
        Left = 10
        Top = 81
        Width = 250
        Height = 300
        TabOrder = 2
        DataSource = dsTipoCambio
        object jktExpDBGrid1DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsTipoCambio
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          object jktExpDBGrid1DBTableView1oid: TcxGridDBColumn
            DataBinding.FieldName = 'oid'
            Visible = False
          end
          object jktExpDBGrid1DBTableView1oid_mon: TcxGridDBColumn
            DataBinding.FieldName = 'oid_mon'
            Visible = False
          end
          object jktExpDBGrid1DBTableView1des_mon: TcxGridDBColumn
            Caption = 'Moneda'
            DataBinding.FieldName = 'des_mon'
            Options.Editing = False
            Width = 150
          end
          object jktExpDBGrid1DBTableView1dato1: TcxGridDBColumn
            DataBinding.FieldName = 'dato1'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Width = 70
          end
          object jktExpDBGrid1DBTableView1dato2: TcxGridDBColumn
            DataBinding.FieldName = 'dato2'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Width = 70
          end
          object jktExpDBGrid1DBTableView1dato3: TcxGridDBColumn
            DataBinding.FieldName = 'dato3'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Width = 70
          end
          object jktExpDBGrid1DBTableView1dato4: TcxGridDBColumn
            DataBinding.FieldName = 'dato4'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Width = 70
          end
          object jktExpDBGrid1DBTableView1dato5: TcxGridDBColumn
            DataBinding.FieldName = 'dato5'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Width = 70
          end
          object jktExpDBGrid1DBTableView1valor: TcxGridDBColumn
            DataBinding.FieldName = 'valor'
            HeaderAlignmentHorz = taCenter
            Width = 70
          end
        end
        object jktExpDBGrid1Level1: TcxGridLevel
          GridView = jktExpDBGrid1DBTableView1
        end
      end
      object cxDBDateEdit1: TcxDBDateEdit
        Left = 62
        Top = 41
        DataBinding.DataField = 'vig_des'
        Properties.ReadOnly = False
        Style.HotTrack = False
        TabOrder = 0
        Width = 90
      end
      object dxLayoutGroup4: TdxLayoutGroup
        AlignHorz = ahParentManaged
        AlignVert = avParentManaged
        ButtonOptions.Buttons = <>
        Hidden = True
        ItemIndex = 1
        ShowBorder = False
        Index = -1
      end
      object lcMainGroup6: TdxLayoutGroup
        CaptionOptions.Text = 'Rango de fechas'
        Parent = dxLayoutGroup4
        Visible = False
        ButtonOptions.Buttons = <>
        LayoutDirection = ldHorizontal
        Index = 0
      end
      object lcMainGroup3: TdxLayoutGroup
        AlignVert = avClient
        CaptionOptions.Text = 'New Group'
        CaptionOptions.Visible = False
        Parent = dxLayoutGroup4
        ButtonOptions.Buttons = <>
        ShowBorder = False
        Index = 1
      end
      object lcMainItem6: TdxLayoutItem
        CaptionOptions.Text = 'Hasta :'
        Parent = lcMainGroup6
        Control = cxDBDateEdit2
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object lcMainItem7: TdxLayoutItem
        AlignVert = avClient
        Parent = lcMainGroup3
        Control = jktExpDBGrid1
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainItem3: TdxLayoutItem
        CaptionOptions.Text = 'Desde :'
        Parent = lcMainGroup6
        Control = cxDBDateEdit1
        ControlOptions.ShowBorder = False
        Index = 0
      end
    end
  end
  inherited BarManager: TdxBarManager
    Left = 144
    Top = 112
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited Driver: TjktDriver
    DataSetCab = mtTipoCambio
    Left = 376
    Top = 112
  end
  inherited IdHTTP: TIdHTTP
    Left = 296
    Top = 112
  end
  inherited Service: TjktServiceCaller
    Left = 240
    Top = 112
  end
  inherited OperacionSave: TjktOperacion
    OperName = 'GuardarTipoDeCambio'
    Left = 440
    Top = 112
  end
  inherited mtParametroInicial: TjktMemTable
    Left = 544
    Top = 112
  end
  inherited OperacionTraer: TjktOperacion
    OperName = 'TraerTipoDeCambioEnMatriz'
    OnAfterEjecutar = OperacionTraerAfterEjecutar
    Left = 440
    Top = 168
  end
  inherited ValidadorForm: TjktValidadorForm
    Left = 296
    Top = 168
  end
  inherited mtParametrosForm: TjktMemTable
    Left = 584
    Top = 112
  end
  object dxLayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 240
    Top = 168
    object dxLayoutSkinLookAndFeel1: TdxLayoutSkinLookAndFeel
    end
  end
  object mtTipoCambio: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    Version = '7.12.10 CodeGear Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    Left = 144
    Top = 312
    object mtTipoCambiooid: TIntegerField
      Tag = 1
      FieldName = 'oid'
    end
    object mtTipoCambiooid_mon: TIntegerField
      Tag = 1
      FieldName = 'oid_mon'
    end
    object mtTipoCambiodes_mon: TStringField
      FieldName = 'des_mon'
      Size = 60
    end
    object mtTipoCambiodato1: TFloatField
      FieldName = 'dato1'
      DisplayFormat = '0.00'
    end
    object mtTipoCambiodato2: TFloatField
      FieldName = 'dato2'
      DisplayFormat = '0.00'
    end
    object mtTipoCambiodato3: TFloatField
      FieldName = 'dato3'
      DisplayFormat = '0.00'
    end
    object mtTipoCambiodato4: TFloatField
      FieldName = 'dato4'
      DisplayFormat = '0.00'
    end
    object mtTipoCambiodato5: TFloatField
      FieldName = 'dato5'
      DisplayFormat = '0.00'
    end
    object mtTipoCambiovalor: TFloatField
      Tag = 1
      FieldName = 'valor'
      DisplayFormat = '0.00'
    end
  end
  object dsTipoCambio: TDataSource
    DataSet = mtTipoCambio
    Left = 184
    Top = 312
  end
  object mtHeaders: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    Version = '7.12.10 CodeGear Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    Left = 144
    Top = 264
    object mtHeadersfieldName: TStringField
      FieldName = 'fieldName'
      Size = 5
    end
    object mtHeaderslabel: TStringField
      FieldName = 'label'
      Size = 10
    end
    object mtHeaderscolumnWidth: TSmallintField
      FieldName = 'columnWidth'
    end
  end
end
