inherited FNVen0007: TFNVen0007
  Caption = 'ABM de Listas de Precios Detalle'
  ClientHeight = 492
  ClientWidth = 828
  ExplicitWidth = 844
  ExplicitHeight = 530
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBoxLeft: TcxGroupBox
    ExplicitHeight = 492
    Height = 492
  end
  inherited cxSplitterLeft: TcxSplitter
    Height = 492
    ExplicitHeight = 492
  end
  inherited cxGroupBoxRight: TcxGroupBox
    Left = 798
    ExplicitLeft = 798
    ExplicitHeight = 492
    Height = 492
  end
  inherited cxSplitterRight: TcxSplitter
    Left = 794
    Height = 492
    ExplicitLeft = 794
    ExplicitHeight = 492
  end
  inherited cxGroupBoxMain: TcxGroupBox
    ExplicitWidth = 760
    ExplicitHeight = 492
    Height = 492
    Width = 760
    object lcMain: TdxLayoutControl
      Left = 2
      Top = 2
      Width = 756
      Height = 488
      Align = alClient
      TabOrder = 0
      LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 104
        Top = 41
        DataBinding.DataField = 'codigo'
        DataBinding.DataSource = dsListaPrecio
        Properties.ReadOnly = True
        Style.HotTrack = False
        TabOrder = 0
        Width = 90
      end
      object cxDBDateEdit2: TcxDBDateEdit
        Left = 282
        Top = 68
        DataBinding.DataField = 'vig_has'
        DataBinding.DataSource = dsListaPrecio
        Properties.ReadOnly = True
        Style.HotTrack = False
        TabOrder = 3
        Width = 90
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 428
        Top = 68
        DataBinding.DataField = 'des_mon'
        DataBinding.DataSource = dsListaPrecio
        Properties.ReadOnly = True
        Style.HotTrack = False
        TabOrder = 4
        Width = 125
      end
      object jktExpDBGrid1: TjktExpDBGrid
        Left = 23
        Top = 162
        Width = 250
        Height = 300
        TabOrder = 5
        object jktExpDBGrid1DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
        end
        object jktExpDBGrid1Level1: TcxGridLevel
          GridView = jktExpDBGrid1DBTableView1
        end
      end
      object jktExpDBGrid2: TjktExpDBGrid
        Left = 10000
        Top = 10000
        Width = 250
        Height = 300
        TabOrder = 6
        Visible = False
        object jktExpDBGrid2DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
        end
        object jktExpDBGrid2Level1: TcxGridLevel
          GridView = jktExpDBGrid2DBTableView1
        end
      end
      object jktExpDBGrid3: TjktExpDBGrid
        Left = 10000
        Top = 10000
        Width = 546
        Height = 300
        TabOrder = 7
        Visible = False
        object jktExpDBGrid3DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
        end
        object jktExpDBGrid3Level1: TcxGridLevel
          GridView = jktExpDBGrid3DBTableView1
        end
      end
      object cxDBTextEdit3: TcxDBTextEdit
        Left = 282
        Top = 41
        DataBinding.DataField = 'descripcion'
        DataBinding.DataSource = dsListaPrecio
        Properties.ReadOnly = True
        Style.HotTrack = False
        TabOrder = 1
        Width = 271
      end
      object cxDBDateEdit1: TcxDBDateEdit
        Left = 104
        Top = 68
        DataBinding.DataField = 'vig_des'
        DataBinding.DataSource = dsListaPrecio
        Properties.ReadOnly = True
        Style.HotTrack = False
        TabOrder = 2
        Width = 90
      end
      object dxLayoutGroup4: TdxLayoutGroup
        AlignHorz = ahClient
        AlignVert = avClient
        ButtonOptions.Buttons = <>
        Hidden = True
        ItemIndex = 1
        ShowBorder = False
        Index = -1
      end
      object lcMainGroup6: TdxLayoutGroup
        CaptionOptions.Text = 'Datos de Lista de Precios'
        Parent = dxLayoutGroup4
        ButtonOptions.Buttons = <>
        ItemIndex = 1
        Index = 0
      end
      object lcMainItem2: TdxLayoutItem
        AlignHorz = ahLeft
        CaptionOptions.Text = 'C'#243'digo :'
        Parent = lcMainGroup2
        Control = cxDBTextEdit2
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainGroup3: TdxLayoutGroup
        CaptionOptions.Text = 'New Group'
        CaptionOptions.Visible = False
        Parent = dxLayoutGroup4
        ButtonOptions.Buttons = <>
        LayoutDirection = ldTabbed
        ShowBorder = False
        Index = 1
      end
      object lcMainGroup2: TdxLayoutGroup
        CaptionOptions.Text = 'Datos del Pedido'
        Parent = lcMainGroup6
        ButtonOptions.Buttons = <>
        Hidden = True
        LayoutDirection = ldHorizontal
        ShowBorder = False
        Index = 0
      end
      object lcMainItem6: TdxLayoutItem
        CaptionOptions.Text = 'Vigencia Hasta :'
        Parent = lcMainGroup1
        Control = cxDBDateEdit2
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object lcMainItem10: TdxLayoutItem
        CaptionOptions.Text = 'Moneda :'
        Parent = lcMainGroup1
        Control = cxDBTextEdit1
        ControlOptions.AlignHorz = ahLeft
        ControlOptions.ShowBorder = False
        Index = 2
      end
      object dxLayoutGroup5: TdxLayoutGroup
        CaptionOptions.Text = 'Laboratorio Qu'#237'mico'
        Parent = lcMainGroup3
        ButtonOptions.Buttons = <>
        Index = 0
      end
      object lcMainGroup4: TdxLayoutGroup
        CaptionOptions.Text = 'Laboratorio El'#233'ctrico'
        Parent = lcMainGroup3
        ButtonOptions.Buttons = <>
        Index = 1
      end
      object lcMainGroup5: TdxLayoutGroup
        CaptionOptions.Text = 'Materiales'
        Parent = lcMainGroup3
        ButtonOptions.Buttons = <>
        Index = 2
      end
      object lcMainItem7: TdxLayoutItem
        CaptionOptions.Text = 'Determinaciones :'
        CaptionOptions.Layout = clTop
        Parent = dxLayoutGroup5
        Control = jktExpDBGrid1
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainItem4: TdxLayoutItem
        CaptionOptions.Text = 'Determinaciones :'
        CaptionOptions.Layout = clTop
        Parent = lcMainGroup4
        Control = jktExpDBGrid2
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainItem8: TdxLayoutItem
        CaptionOptions.Visible = False
        Parent = lcMainGroup5
        Control = jktExpDBGrid3
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainItem1: TdxLayoutItem
        CaptionOptions.Text = 'Descripci'#243'n :'
        Parent = lcMainGroup2
        Control = cxDBTextEdit3
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object lcMainItem3: TdxLayoutItem
        CaptionOptions.Text = 'Vigencia Desde :'
        Parent = lcMainGroup1
        Control = cxDBDateEdit1
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainGroup1: TdxLayoutGroup
        CaptionOptions.Text = 'Hidden Group'
        Parent = lcMainGroup6
        ButtonOptions.Buttons = <>
        Hidden = True
        LayoutDirection = ldHorizontal
        ShowBorder = False
        Index = 1
      end
    end
  end
  inherited BarManager: TdxBarManager
    Left = 232
    Top = 96
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited Driver: TjktDriver
    TipoPrograma = tp_abmIndividual
    Left = 488
    Top = 96
  end
  inherited IdHTTP: TIdHTTP
    Left = 384
    Top = 96
  end
  inherited Service: TjktServiceCaller
    Left = 328
    Top = 96
  end
  inherited OperacionSave: TjktOperacion
    Left = 552
    Top = 96
  end
  inherited mtParametroInicial: TjktMemTable
    Left = 648
    Top = 96
  end
  inherited OperacionTraer: TjktOperacion
    OperName = 'TraerDetallesDeListaDePrecio'
    Atributos = <
      item
        Attribute = 'oid'
        Field = mtListaPreciooid
        Tag = 0
      end>
    Left = 552
    Top = 152
  end
  inherited ValidadorForm: TjktValidadorForm
    Left = 384
    Top = 152
  end
  inherited mtParametrosForm: TjktMemTable
    Left = 688
    Top = 96
  end
  object dxLayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 184
    Top = 96
    object dxLayoutSkinLookAndFeel1: TdxLayoutSkinLookAndFeel
    end
  end
  object Help: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'listaPrecios'
    TipoFiltro = fi_Activos
    OidRespuesta = mtListaPreciooid
    Left = 488
    Top = 152
  end
  object mtListaPrecio: TjktMemTable
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
    Left = 104
    Top = 48
    object mtListaPreciooid: TIntegerField
      FieldName = 'oid'
    end
    object mtListaPreciocodigo: TStringField
      FieldName = 'codigo'
      Size = 15
    end
    object mtListaPreciodescripcion: TStringField
      FieldName = 'descripcion'
      Size = 60
    end
    object mtListaPreciovig_des: TDateField
      FieldName = 'vig_des'
    end
    object mtListaPreciovig_has: TDateField
      FieldName = 'vig_has'
    end
    object mtListaPreciodes_mon: TStringField
      FieldName = 'des_mon'
      Size = 40
    end
  end
  object mtPreciosLaboQuim: TjktMemTable
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
    Left = 112
    Top = 232
    object mtPreciosLaboQuimoid_detalle: TIntegerField
      FieldName = 'oid_detalle'
    end
  end
  object mtPreciosLaboElec: TjktMemTable
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
    Left = 112
    Top = 280
  end
  object mtPreciosMateriales: TjktMemTable
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
    Left = 112
    Top = 328
  end
  object dsListaPrecio: TDataSource
    DataSet = mtListaPrecio
    Left = 144
    Top = 48
  end
  object DataSource2: TDataSource
    Left = 152
    Top = 232
  end
  object DataSource3: TDataSource
    Left = 152
    Top = 280
  end
  object DataSource4: TDataSource
    Left = 152
    Top = 328
  end
end
