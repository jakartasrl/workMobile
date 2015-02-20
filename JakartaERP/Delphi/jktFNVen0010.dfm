inherited FNVen0010: TFNVen0010
  Caption = 'ABM de Precios de Costos de Reposici'#243'n'
  ClientHeight = 396
  ClientWidth = 634
  ExplicitWidth = 650
  ExplicitHeight = 434
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBoxLeft: TcxGroupBox
    ExplicitHeight = 396
    Height = 396
  end
  inherited cxSplitterLeft: TcxSplitter
    Height = 396
    ExplicitHeight = 396
  end
  inherited cxGroupBoxRight: TcxGroupBox
    Left = 604
    ExplicitLeft = 604
    ExplicitHeight = 396
    Height = 396
  end
  inherited cxSplitterRight: TcxSplitter
    Left = 600
    Height = 396
    ExplicitLeft = 600
    ExplicitHeight = 396
  end
  inherited cxGroupBoxMain: TcxGroupBox
    ExplicitWidth = 566
    ExplicitHeight = 396
    Height = 396
    Width = 566
    object lcMain: TdxLayoutControl
      Left = 2
      Top = 2
      Width = 562
      Height = 392
      Align = alClient
      TabOrder = 0
      LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
      object jktExpDBGrid4: TjktExpDBGrid
        Left = 23
        Top = 46
        Width = 513
        Height = 320
        TabOrder = 0
        DataSource = dsPrecios
        object cxGridDBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsPrecios
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          object cxGridDBTableView1oid_det: TcxGridDBColumn
            DataBinding.FieldName = 'oid_det'
            Visible = False
          end
          object cxGridDBTableView1oid: TcxGridDBColumn
            DataBinding.FieldName = 'oid'
            Visible = False
          end
          object cxGridDBTableView1codigo: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'codigo'
            Options.Editing = False
            Width = 100
          end
          object cxGridDBTableView1descripcion: TcxGridDBColumn
            Caption = 'Descripci'#243'n'
            DataBinding.FieldName = 'descripcion'
            Options.Editing = False
            Width = 200
          end
          object cxGridDBTableView1oid_mon: TcxGridDBColumn
            Caption = 'Moneda'
            DataBinding.FieldName = 'oid_mon'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.DropDownAutoSize = True
            Properties.KeyFieldNames = 'oid'
            Properties.ListColumns = <
              item
                Width = 70
                FieldName = 'codigo'
              end
              item
                Width = 130
                FieldName = 'descripcion'
              end>
            Properties.ListSource = dsMonedas
          end
          object cxGridDBTableView1precio: TcxGridDBColumn
            Caption = 'Precio'
            DataBinding.FieldName = 'precio'
          end
          object cxGridDBTableView1fecha: TcxGridDBColumn
            Caption = 'Fecha'
            DataBinding.FieldName = 'fecha'
            Width = 80
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridDBTableView1
        end
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 10000
        Top = 10000
        DataBinding.DataField = 'CodArtDes'
        DataBinding.DataSource = dsParametroInicial
        Style.HotTrack = False
        TabOrder = 1
        Visible = False
        Width = 100
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 10000
        Top = 10000
        DataBinding.DataField = 'CodArtHas'
        DataBinding.DataSource = dsParametroInicial
        Style.HotTrack = False
        TabOrder = 2
        Visible = False
        Width = 100
      end
      object jktExpDBGrid2: TjktExpDBGrid
        Left = 10000
        Top = 10000
        Width = 707
        Height = 320
        TabOrder = 3
        Visible = False
        DataSource = dsPrecios
        object cxGridDBTableView2: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsPrecios
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          object cxGridDBColumn1: TcxGridDBColumn
            DataBinding.FieldName = 'oid_det'
            Visible = False
          end
          object cxGridDBColumn2: TcxGridDBColumn
            DataBinding.FieldName = 'oid'
            Visible = False
          end
          object cxGridDBColumn3: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'codigo'
            Options.Editing = False
            Width = 100
          end
          object cxGridDBColumn4: TcxGridDBColumn
            Caption = 'Descripci'#243'n'
            DataBinding.FieldName = 'descripcion'
            Options.Editing = False
            Width = 200
          end
          object cxGridDBColumn6: TcxGridDBColumn
            Caption = 'Moneda'
            DataBinding.FieldName = 'oid_mon'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.DropDownAutoSize = True
            Properties.KeyFieldNames = 'oid'
            Properties.ListColumns = <
              item
                Width = 70
                FieldName = 'codigo'
              end
              item
                Width = 130
                FieldName = 'descripcion'
              end>
            Properties.ListSource = dsMonedas
          end
          object cxGridDBColumn5: TcxGridDBColumn
            Caption = 'Precio'
            DataBinding.FieldName = 'precio'
          end
          object cxGridDBColumn7: TcxGridDBColumn
            Caption = 'Fecha'
            DataBinding.FieldName = 'fecha'
            Width = 80
          end
        end
        object cxGridLevel2: TcxGridLevel
          GridView = cxGridDBTableView2
        end
      end
      object jktExpDBGrid3: TjktExpDBGrid
        Left = 10000
        Top = 10000
        Width = 707
        Height = 293
        TabOrder = 4
        Visible = False
        DataSource = dsPrecios
        object cxGridDBTableView3: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsPrecios
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          object cxGridDBColumn8: TcxGridDBColumn
            DataBinding.FieldName = 'oid_det'
            Visible = False
          end
          object cxGridDBColumn9: TcxGridDBColumn
            DataBinding.FieldName = 'oid'
            Visible = False
          end
          object cxGridDBColumn10: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'codigo'
            Options.Editing = False
            Width = 100
          end
          object cxGridDBColumn11: TcxGridDBColumn
            Caption = 'Descripci'#243'n'
            DataBinding.FieldName = 'descripcion'
            Options.Editing = False
            Width = 200
          end
          object cxGridDBColumn13: TcxGridDBColumn
            Caption = 'Moneda'
            DataBinding.FieldName = 'oid_mon'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.DropDownAutoSize = True
            Properties.KeyFieldNames = 'oid'
            Properties.ListColumns = <
              item
                Width = 70
                FieldName = 'codigo'
              end
              item
                Width = 130
                FieldName = 'descripcion'
              end>
            Properties.ListSource = dsMonedas
          end
          object cxGridDBColumn12: TcxGridDBColumn
            Caption = 'Precio'
            DataBinding.FieldName = 'precio'
          end
          object cxGridDBColumn14: TcxGridDBColumn
            Caption = 'Fecha'
            DataBinding.FieldName = 'fecha'
            Width = 80
          end
        end
        object cxGridLevel3: TcxGridLevel
          GridView = cxGridDBTableView3
        end
      end
      object jktExpDBGrid1: TjktExpDBGrid
        Left = 10000
        Top = 10000
        Width = 707
        Height = 320
        TabOrder = 5
        Visible = False
        DataSource = dsPrecios
        object cxGridDBTableView4: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsPrecios
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          object cxGridDBColumn15: TcxGridDBColumn
            DataBinding.FieldName = 'oid_det'
            Visible = False
          end
          object cxGridDBColumn16: TcxGridDBColumn
            DataBinding.FieldName = 'oid'
            Visible = False
          end
          object cxGridDBColumn17: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'codigo'
            Options.Editing = False
            Width = 100
          end
          object cxGridDBColumn18: TcxGridDBColumn
            Caption = 'Descripci'#243'n'
            DataBinding.FieldName = 'descripcion'
            Options.Editing = False
            Width = 200
          end
          object cxGridDBColumn20: TcxGridDBColumn
            Caption = 'Moneda'
            DataBinding.FieldName = 'oid_mon'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.DropDownAutoSize = True
            Properties.KeyFieldNames = 'oid'
            Properties.ListColumns = <
              item
                Width = 70
                FieldName = 'codigo'
              end
              item
                Width = 130
                FieldName = 'descripcion'
              end>
            Properties.ListSource = dsMonedas
          end
          object cxGridDBColumn19: TcxGridDBColumn
            Caption = 'Precio'
            DataBinding.FieldName = 'precio'
          end
          object cxGridDBColumn21: TcxGridDBColumn
            Caption = 'Fecha'
            DataBinding.FieldName = 'fecha'
            Width = 80
          end
        end
        object cxGridLevel4: TcxGridLevel
          GridView = cxGridDBTableView4
        end
      end
      object dxLayoutGroup4: TdxLayoutGroup
        AlignHorz = ahClient
        AlignVert = avClient
        ButtonOptions.Buttons = <>
        Hidden = True
        ShowBorder = False
        Index = -1
      end
      object lcMainGroup5: TdxLayoutGroup
        AlignVert = avClient
        CaptionOptions.Text = 'New Group'
        CaptionOptions.Visible = False
        Parent = dxLayoutGroup4
        ButtonOptions.Buttons = <>
        LayoutDirection = ldTabbed
        ShowBorder = False
        OnTabChanging = lcMainGroup5TabChanging
        Index = 0
      end
      object lcMainGroup3: TdxLayoutGroup
        Tag = 3
        CaptionOptions.Text = 'Laboratorio Qu'#237'mico'
        Parent = lcMainGroup5
        ButtonOptions.Buttons = <>
        Index = 2
      end
      object lcMainGroup4: TdxLayoutGroup
        Tag = 4
        CaptionOptions.Text = 'Laboratorio El'#233'ctrico'
        Parent = lcMainGroup5
        ButtonOptions.Buttons = <>
        Index = 3
      end
      object lcMainGroup2: TdxLayoutGroup
        Tag = 2
        CaptionOptions.Text = 'Art'#237'culos'
        Parent = lcMainGroup5
        ButtonOptions.Buttons = <>
        ItemIndex = 1
        Index = 1
      end
      object lcMainItem4: TdxLayoutItem
        AlignVert = avClient
        CaptionOptions.Text = 'Determinaciones :'
        CaptionOptions.Layout = clTop
        Parent = lcMainGroup4
        Control = jktExpDBGrid1
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainItem8: TdxLayoutItem
        AlignVert = avClient
        CaptionOptions.Visible = False
        Parent = lcMainGroup2
        Control = jktExpDBGrid2
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object lcMainGroup1: TdxLayoutGroup
        Tag = 1
        CaptionOptions.Text = 'Conceptos de Cotizaci'#243'n'
        Parent = lcMainGroup5
        ButtonOptions.Buttons = <>
        Index = 0
      end
      object lcMainItem1: TdxLayoutItem
        AlignVert = avClient
        Parent = lcMainGroup1
        Control = jktExpDBGrid4
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainItem2: TdxLayoutItem
        CaptionOptions.Text = 'C'#243'd. Desde :'
        Parent = lcMainGroup6
        Control = cxDBTextEdit1
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainItem3: TdxLayoutItem
        CaptionOptions.Text = 'C'#243'd. Hasta :'
        Parent = lcMainGroup6
        Control = cxDBTextEdit2
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object lcMainGroup6: TdxLayoutGroup
        CaptionOptions.Text = 'Hidden Group'
        Parent = lcMainGroup2
        ButtonOptions.Buttons = <>
        Hidden = True
        LayoutDirection = ldHorizontal
        ShowBorder = False
        Index = 0
      end
      object lcMainItem5: TdxLayoutItem
        AlignVert = avClient
        CaptionOptions.Text = 'Determinaciones :'
        CaptionOptions.Layout = clTop
        Parent = lcMainGroup3
        Control = jktExpDBGrid3
        ControlOptions.ShowBorder = False
        Index = 0
      end
    end
  end
  inherited BarManager: TdxBarManager
    Left = 120
    Top = 72
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited Driver: TjktDriver
    DataSetCab = mtPrecios
    Opciones = []
    FiltrarAlInicio = False
    OperacionesIniciales = <
      item
        Operacion = opTraerEntidades
      end>
    Left = 344
    Top = 72
  end
  inherited IdHTTP: TIdHTTP
    Top = 72
  end
  inherited Service: TjktServiceCaller
    Top = 72
  end
  inherited OperacionSave: TjktOperacion
    OperName = 'GuardarPreciosCostos'
    Atributos = <
      item
        Attribute = 'tipoelemento'
        Field = mtParametroInicialNroSolapa
        Tag = 0
      end>
    Left = 408
    Top = 72
  end
  inherited mtParametroInicial: TjktMemTable
    FieldDefs = <
      item
        Name = 'Entidad'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'OutputDatasetName'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NroSolapa'
        DataType = ftSmallint
      end>
    Left = 512
    Top = 72
    object mtParametroInicialOutputDatasetName: TStringField
      FieldName = 'OutputDatasetName'
      Size = 40
    end
    object mtParametroInicialNroSolapa: TSmallintField
      FieldName = 'NroSolapa'
    end
    object mtParametroInicialCodArtDes: TStringField
      FieldName = 'CodArtDes'
      Size = 50
    end
    object mtParametroInicialCodArtHas: TStringField
      FieldName = 'CodArtHas'
      Size = 50
    end
  end
  inherited OperacionTraer: TjktOperacion
    OperName = 'TraerPreciosCostos'
    Atributos = <
      item
        Attribute = 'tipoelemento'
        Field = mtParametroInicialNroSolapa
        Tag = 0
      end
      item
        Attribute = 'cod_art_des'
        Field = mtParametroInicialCodArtDes
        Tag = 0
      end
      item
        Attribute = 'cod_art_has'
        Field = mtParametroInicialCodArtHas
        Tag = 0
      end>
    OnBeforeEjecutar = OperacionTraerBeforeEjecutar
    OnAfterEjecutar = OperacionTraerAfterEjecutar
    Left = 408
    Top = 128
  end
  inherited ValidadorForm: TjktValidadorForm
    Top = 128
  end
  inherited mtParametrosForm: TjktMemTable
    Left = 512
    Top = 128
  end
  object dxLayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 72
    Top = 72
    object dxLayoutSkinLookAndFeel1: TdxLayoutSkinLookAndFeel
    end
  end
  object mtPrecios: TjktMemTable
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
    Left = 120
    Top = 248
    object mtPreciosoid_det: TIntegerField
      Tag = 1
      FieldName = 'oid_det'
    end
    object mtPreciosoid: TIntegerField
      Tag = 1
      FieldName = 'oid'
    end
    object mtPrecioscodigo: TStringField
      FieldName = 'codigo'
      Size = 15
    end
    object mtPreciosdescripcion: TStringField
      FieldName = 'descripcion'
      Size = 100
    end
    object mtPreciosprecio: TFloatField
      Tag = 1
      FieldName = 'precio'
      DisplayFormat = '0.00'
    end
    object mtPreciosoid_mon: TIntegerField
      Tag = 1
      FieldName = 'oid_mon'
    end
    object mtPreciosfecha: TDateField
      Tag = 1
      FieldName = 'fecha'
    end
  end
  object dsPrecios: TDataSource
    DataSet = mtPrecios
    Left = 160
    Top = 248
  end
  object opTraerEntidades: TjktOperacion
    OperName = 'FiltroActivos'
    EnviarTodo = False
    Atributos = <
      item
        Attribute = 'Entidad'
        Field = mtParametroInicialEntidad
        Tag = 0
      end
      item
        Attribute = 'OutputDatasetName'
        Field = mtParametroInicialOutputDatasetName
        Tag = 0
      end>
    ServiceCaller = Service
    OnBeforeEjecutar = opTraerEntidadesBeforeEjecutar
    Left = 80
    Top = 192
  end
  object dsMonedas: TDataSource
    DataSet = mtMonedas
    Left = 160
    Top = 192
  end
  object mtMonedas: TjktMemTable
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
    Left = 120
    Top = 192
    object mtMonedasoid: TIntegerField
      FieldName = 'oid'
    end
    object mtMonedascodigo: TStringField
      FieldName = 'codigo'
      Size = 15
    end
    object mtMonedasdescripcion: TStringField
      FieldName = 'descripcion'
      Size = 100
    end
  end
  object dsParametroInicial: TDataSource
    DataSet = mtParametroInicial
    Left = 552
    Top = 72
  end
end
