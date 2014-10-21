inherited FNCla0002: TFNCla0002
  Caption = 'ABM de Valores de Clasificador'
  ClientHeight = 404
  ClientWidth = 715
  ExplicitWidth = 731
  ExplicitHeight = 443
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBoxLeft: TcxGroupBox
    ExplicitTop = 201
    ExplicitHeight = 203
    Height = 404
  end
  inherited cxSplitterLeft: TcxSplitter
    Height = 404
    ExplicitLeft = 185
    ExplicitTop = 201
    ExplicitHeight = 203
  end
  inherited cxGroupBoxRight: TcxGroupBox
    Left = 530
    TabOrder = 4
    ExplicitLeft = 530
    ExplicitTop = 201
    ExplicitHeight = 203
    Height = 404
  end
  inherited cxSplitterRight: TcxSplitter
    Left = 522
    Height = 404
    ExplicitLeft = 522
    ExplicitTop = 201
    ExplicitHeight = 203
  end
  inherited cxGroupBoxMain: TcxGroupBox
    TabOrder = 6
    ExplicitTop = 201
    ExplicitWidth = 329
    ExplicitHeight = 203
    Height = 404
    Width = 329
    object cxGroupBox1: TcxGroupBox
      Left = 3
      Top = 22
      Align = alTop
      Caption = 'Datos del Clasificador'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      Height = 73
      Width = 323
      object txtCodigo: TcxDBTextEdit
        Left = 60
        Top = 30
        DataBinding.DataField = 'Codigo'
        DataBinding.DataSource = dsClasificador
        Enabled = False
        TabOrder = 0
        Width = 121
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 255
        Top = 30
        DataBinding.DataField = 'Descripcion'
        DataBinding.DataSource = dsClasificador
        Enabled = False
        TabOrder = 1
        Width = 245
      end
      object cxLabel1: TcxLabel
        Left = 14
        Top = 32
        AutoSize = False
        Caption = 'C'#243'digo :'
        Properties.Alignment.Horz = taLeftJustify
        Transparent = True
        Height = 17
        Width = 46
      end
      object cxLabel2: TcxLabel
        Left = 179
        Top = 32
        AutoSize = False
        Caption = 'Descripci'#243'n :'
        Properties.Alignment.Horz = taRightJustify
        Transparent = True
        Height = 17
        Width = 75
        AnchorX = 254
      end
    end
    object cxGroupBox3: TcxGroupBox
      Left = 3
      Top = 223
      Align = alClient
      Caption = 'Valores del Clasificador'
      TabOrder = 1
      ExplicitLeft = 450
      ExplicitTop = 15
      ExplicitHeight = 103
      Height = 178
      Width = 323
      object cxDBTreeList1: TcxDBTreeList
        Left = 3
        Top = 15
        Width = 551
        Height = 153
        Align = alLeft
        Bands = <
          item
          end>
        DataController.DataSource = dsValoresClasificador
        DataController.ParentField = 'codInternoPadre'
        DataController.KeyField = 'codInterno'
        Navigator.Buttons.CustomButtons = <>
        OptionsBehavior.GoToNextCellOnTab = True
        OptionsCustomizing.BandCustomizing = False
        OptionsCustomizing.BandHorzSizing = False
        OptionsCustomizing.BandMoving = False
        OptionsCustomizing.BandVertSizing = False
        OptionsData.Deleting = False
        PopupMenu = PopupMenu
        RootValue = 0
        TabOrder = 0
        ExplicitHeight = 78
        object cxDBTreeList1oid_ValorClasif: TcxDBTreeListColumn
          Visible = False
          DataBinding.FieldName = 'oid_ValorClasif'
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxDBTreeList1oid_CompClasif: TcxDBTreeListColumn
          Visible = False
          DataBinding.FieldName = 'oid_CompClasif'
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxDBTreeList1codInterno: TcxDBTreeListColumn
          Visible = False
          DataBinding.FieldName = 'codInterno'
          Position.ColIndex = 4
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxDBTreeList1codInternoPadre: TcxDBTreeListColumn
          Visible = False
          DataBinding.FieldName = 'codInternoPadre'
          Position.ColIndex = 5
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxDBTreeList1Codigo: TcxDBTreeListColumn
          Caption.Text = 'C'#243'digo'
          DataBinding.FieldName = 'Codigo'
          Width = 100
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxDBTreeList1Descripcion: TcxDBTreeListColumn
          Caption.Text = 'Descripci'#243'n'
          DataBinding.FieldName = 'Descripcion'
          Width = 140
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxDBTreeList1Activo: TcxDBTreeListColumn
          DataBinding.FieldName = 'Activo'
          Width = 100
          Position.ColIndex = 6
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
      end
    end
    object cxGroupBox2: TcxGroupBox
      Left = 3
      Top = 95
      Align = alTop
      Caption = 'Jerarqu'#237'a del Clasificador'
      TabOrder = 2
      ExplicitTop = 22
      ExplicitWidth = 179
      Height = 128
      Width = 323
      object cxDBTreeList2: TcxDBTreeList
        Left = 3
        Top = 15
        Width = 447
        Height = 103
        Align = alLeft
        Bands = <
          item
          end>
        DataController.DataSource = dsComponentesClasificador
        DataController.ParentField = 'oid_NivelPadre'
        DataController.KeyField = 'oid_Nivel'
        Enabled = False
        Navigator.Buttons.CustomButtons = <>
        OptionsCustomizing.BandCustomizing = False
        OptionsCustomizing.BandHorzSizing = False
        OptionsCustomizing.BandMoving = False
        OptionsCustomizing.BandVertSizing = False
        OptionsData.Editing = False
        OptionsData.Deleting = False
        OptionsSelection.CellSelect = False
        OptionsView.FocusRect = False
        OptionsView.Headers = False
        OptionsView.TreeLineStyle = tllsSolid
        RootValue = -1
        TabOrder = 0
        object cxDBTreeList2oid_CompClasif: TcxDBTreeListColumn
          Visible = False
          DataBinding.FieldName = 'oid_CompClasif'
          Position.ColIndex = 5
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxDBTreeList2oid_Nivel: TcxDBTreeListColumn
          Visible = False
          DataBinding.FieldName = 'oid_Nivel'
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxDBTreeList2oid_NivelPadre: TcxDBTreeListColumn
          Visible = False
          DataBinding.FieldName = 'oid_NivelPadre'
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxDBTreeList2Descripcion: TcxDBTreeListColumn
          DataBinding.FieldName = 'Descripcion'
          Width = 400
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxDBTreeList2Codigo: TcxDBTreeListColumn
          Visible = False
          DataBinding.FieldName = 'Codigo'
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxDBTreeList2Activo: TcxDBTreeListColumn
          Visible = False
          DataBinding.FieldName = 'Activo'
          Position.ColIndex = 4
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
      end
    end
  end
  inherited BarManager: TdxBarManager
    Left = 208
    Top = 248
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited Driver: TjktDriver
    DataSetCab = mtValoresClasificador
    TipoPrograma = tp_abmIndividual
    Filtro = Help
    Left = 400
    Top = 248
  end
  inherited IdHTTP: TIdHTTP
    Left = 328
    Top = 248
  end
  inherited Service: TjktServiceCaller
    Left = 272
    Top = 248
  end
  inherited OperacionSave: TjktOperacion
    OperName = 'GuardarValoresClasificador'
    Atributos = <
      item
        Dataset = mtValoresClasificador
        Tag = 0
      end>
    OnBeforeEjecutar = OperacionSaveBeforeEjecutar
    OnAfterEjecutar = OperacionSaveAfterEjecutar
    Left = 464
    Top = 248
  end
  inherited mtParametroInicial: TjktMemTable
    Left = 552
    Top = 248
  end
  inherited OperacionTraer: TjktOperacion
    OperName = 'TraerValoresClasificador'
    Atributos = <
      item
        Attribute = 'oid'
        Field = mtClasificadoroid_Clasificador
        Tag = 0
      end>
    OnAfterEjecutar = OperacionTraerAfterEjecutar
    Left = 464
    Top = 312
  end
  inherited ValidadorForm: TjktValidadorForm
    Left = 328
    Top = 312
  end
  object mtComponentesClasificador: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_CompClasif'
        DataType = ftInteger
      end
      item
        Name = 'oid_Nivel'
        DataType = ftInteger
      end
      item
        Name = 'oid_NivelPadre'
        DataType = ftInteger
      end
      item
        Name = 'Descripcion'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Codigo'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Activo'
        DataType = ftBoolean
      end>
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
    Left = 160
    Top = 128
    object mtComponentesClasificadoroid_CompClasif: TIntegerField
      FieldName = 'oid_CompClasif'
    end
    object mtComponentesClasificadoroid_Nivel: TIntegerField
      FieldName = 'oid_Nivel'
    end
    object mtComponentesClasificadoroid_NivelPadre: TIntegerField
      FieldName = 'oid_NivelPadre'
    end
    object mtComponentesClasificadorDescripcion: TStringField
      FieldName = 'Descripcion'
      Size = 100
    end
    object mtComponentesClasificadorCodigo: TStringField
      FieldName = 'Codigo'
      Size = 15
    end
    object mtComponentesClasificadorActivo: TBooleanField
      FieldName = 'Activo'
    end
  end
  object dsComponentesClasificador: TDataSource
    DataSet = mtComponentesClasificador
    Left = 160
    Top = 80
  end
  object mtClasificador: TjktMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_Clasificador'
        DataType = ftInteger
      end
      item
        Name = 'Codigo'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Descripcion'
        DataType = ftString
        Size = 100
      end>
    AutoReposition = True
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
    Left = 536
    Top = 64
    object mtClasificadoroid_Clasificador: TIntegerField
      Tag = 1
      FieldName = 'oid_Clasificador'
    end
    object mtClasificadorCodigo: TStringField
      Tag = 2
      FieldName = 'Codigo'
      Size = 15
    end
    object mtClasificadorDescripcion: TStringField
      Tag = 2
      FieldName = 'Descripcion'
      Size = 100
    end
  end
  object dsClasificador: TDataSource
    DataSet = mtClasificador
    Left = 536
    Top = 16
  end
  object mtValoresClasificador: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_ValorClasif'
        DataType = ftInteger
      end
      item
        Name = 'oid_CompClasif'
        DataType = ftInteger
      end
      item
        Name = 'codInterno'
        DataType = ftInteger
      end
      item
        Name = 'codInternoPadre'
        DataType = ftInteger
      end
      item
        Name = 'Codigo'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Descripcion'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Activo'
        DataType = ftBoolean
      end>
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
    Left = 80
    Top = 296
    object mtValoresClasificadoroid_ValorClasif: TIntegerField
      Tag = 1
      FieldName = 'oid_ValorClasif'
    end
    object mtValoresClasificadoroid_CompClasif: TIntegerField
      Tag = 1
      FieldName = 'oid_CompClasif'
    end
    object mtValoresClasificadorcodInterno: TIntegerField
      Tag = 1
      FieldName = 'codInterno'
    end
    object mtValoresClasificadorcodInternoPadre: TIntegerField
      Tag = 1
      FieldName = 'codInternoPadre'
    end
    object mtValoresClasificadorCodigo: TStringField
      Tag = 1
      FieldName = 'Codigo'
      Size = 15
    end
    object mtValoresClasificadorDescripcion: TStringField
      Tag = 1
      FieldName = 'Descripcion'
      Size = 100
    end
    object mtValoresClasificadorActivo: TBooleanField
      Tag = 1
      FieldName = 'Activo'
    end
  end
  object dsValoresClasificador: TDataSource
    DataSet = mtValoresClasificador
    Left = 80
    Top = 248
  end
  object Help: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'clasificadores'
    OidRespuesta = mtClasificadoroid_Clasificador
    Left = 400
    Top = 312
  end
  object PopupMenu: TPopupMenu
    OnPopup = PopupMenuPopup
    Left = 208
    Top = 304
    object menAnadirMismoNivel: TMenuItem
      Caption = 'A'#241'adir en mismo Nivel'
      OnClick = menAnadirMismoNivelClick
    end
    object menAnadirSubNivel: TMenuItem
      Caption = 'A'#241'adir SubNivel'
      OnClick = menAnadirSubNivelClick
    end
    object menEliminar: TMenuItem
      Caption = 'Eliminar'
    end
  end
end
