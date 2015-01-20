inherited FNVen0002: TFNVen0002
  Caption = 'ABM de Modelos de Cotizador'
  ClientHeight = 412
  ClientWidth = 845
  ExplicitWidth = 861
  ExplicitHeight = 450
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBoxLeft: TcxGroupBox
    ExplicitHeight = 412
    Height = 412
  end
  inherited cxSplitterLeft: TcxSplitter
    Height = 412
    ExplicitHeight = 412
  end
  inherited cxGroupBoxRight: TcxGroupBox
    Left = 815
    TabOrder = 4
    ExplicitLeft = 815
    ExplicitHeight = 412
    Height = 412
  end
  inherited cxSplitterRight: TcxSplitter
    Left = 811
    Height = 412
    ExplicitLeft = 811
    ExplicitHeight = 412
  end
  inherited cxGroupBoxMain: TcxGroupBox
    TabOrder = 6
    ExplicitWidth = 777
    ExplicitHeight = 412
    Height = 412
    Width = 777
    object dxBevel1: TdxBevel
      Left = 768
      Top = 75
      Width = 7
      Height = 335
      Align = alRight
      Anchors = [akLeft, akTop, akRight, akBottom]
      Shape = dxbsNone
      ExplicitWidth = 102
    end
    object cxGroupBox1: TcxGroupBox
      Left = 2
      Top = 2
      Align = alTop
      Caption = 'Datos del Modelo de Cotizador'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      Height = 73
      Width = 773
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 60
        Top = 30
        DataBinding.DataField = 'cod_mod'
        DataBinding.DataSource = dsCab
        TabOrder = 0
        Width = 121
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 256
        Top = 30
        DataBinding.DataField = 'des_mod'
        DataBinding.DataSource = dsCab
        TabOrder = 1
        Width = 505
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
    object cxGroupBox2: TcxGroupBox
      Left = 2
      Top = 75
      Align = alLeft
      PanelStyle.Active = True
      TabOrder = 1
      Height = 335
      Width = 406
      object cxDBTreeList1: TcxDBTreeList
        Left = 2
        Top = 2
        Width = 402
        Height = 331
        Align = alClient
        Bands = <
          item
            Caption.AlignHorz = taCenter
            Caption.AlignVert = vaCenter
            Caption.Text = 'T'#237'tulo/Concepto'
          end>
        DataController.DataSource = dsDet
        DataController.ParentField = 'codInternoPadre'
        DataController.KeyField = 'codInterno'
        Navigator.Buttons.CustomButtons = <>
        OptionsBehavior.GoToNextCellOnTab = True
        OptionsCustomizing.BandCustomizing = False
        OptionsCustomizing.BandHorzSizing = False
        OptionsCustomizing.BandMoving = False
        OptionsCustomizing.BandVertSizing = False
        OptionsData.Deleting = False
        OptionsView.Bands = True
        PopupMenu = PopupMenu
        RootValue = 0
        TabOrder = 0
        object cxDBTreeList1oid_titu_conc: TcxDBTreeListColumn
          Visible = False
          DataBinding.FieldName = 'oid_titu_conc'
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxDBTreeList1oid_mod: TcxDBTreeListColumn
          Visible = False
          DataBinding.FieldName = 'oid_mod'
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxDBTreeList1codInterno: TcxDBTreeListColumn
          Visible = False
          DataBinding.FieldName = 'codInterno'
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxDBTreeList1codInternoPadre: TcxDBTreeListColumn
          Visible = False
          DataBinding.FieldName = 'codInternoPadre'
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxDBTreeList1cod_titu_conc: TcxDBTreeListColumn
          Caption.Text = 'C'#243'digo'
          DataBinding.FieldName = 'cod_titu_conc'
          Options.Editing = False
          Position.ColIndex = 4
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxDBTreeList1des_titu_conc: TcxDBTreeListColumn
          Caption.Text = 'Descripci'#243'n'
          DataBinding.FieldName = 'des_titu_conc'
          Options.Editing = False
          Width = 300
          Position.ColIndex = 5
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxDBTreeList1oid_conc: TcxDBTreeListColumn
          Visible = False
          DataBinding.FieldName = 'oid_conc'
          Position.ColIndex = 6
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxDBTreeList1tipo: TcxDBTreeListColumn
          Visible = False
          DataBinding.FieldName = 'tipo'
          Position.ColIndex = 7
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
      end
    end
    object cxGroupBox3: TcxGroupBox
      Left = 408
      Top = 75
      Align = alClient
      PanelStyle.Active = True
      PanelStyle.BorderWidth = 5
      Style.BorderStyle = ebsNone
      TabOrder = 2
      Height = 335
      Width = 360
      object cxGroupBox5: TcxGroupBox
        Left = 7
        Top = 142
        Align = alTop
        Alignment = alTopCenter
        Caption = 'Alta de Concepto'
        TabOrder = 1
        Visible = False
        Height = 135
        Width = 346
        object cxLabel5: TcxLabel
          Left = 12
          Top = 30
          Caption = 'C'#243'digo :'
          Transparent = True
        end
        object cxLabel6: TcxLabel
          Left = 12
          Top = 65
          Caption = 'Descripci'#243'n :'
          Transparent = True
        end
        object cxButtonEdit3: TcxButtonEdit
          Left = 80
          Top = 28
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnButtonClick = cxButtonEdit3PropertiesButtonClick
          TabOrder = 2
          Width = 97
        end
        object cxTextEdit4: TcxTextEdit
          Left = 80
          Top = 63
          Properties.ReadOnly = True
          TabOrder = 3
          Width = 250
        end
        object cxButton3: TcxButton
          Left = 174
          Top = 92
          Width = 75
          Height = 25
          Caption = 'Agregar'
          Enabled = False
          TabOrder = 4
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = cxButton3Click
        end
        object cxButton4: TcxButton
          Left = 255
          Top = 92
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 5
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = cxButton2Click
        end
      end
      object cxGroupBox4: TcxGroupBox
        Left = 7
        Top = 7
        Align = alTop
        Alignment = alTopCenter
        Caption = 'Alta de T'#237'tulo'
        TabOrder = 0
        Visible = False
        Height = 135
        Width = 346
        object cxLabel3: TcxLabel
          Left = 12
          Top = 30
          Caption = 'C'#243'digo :'
          Transparent = True
        end
        object cxLabel4: TcxLabel
          Left = 12
          Top = 65
          Caption = 'Descripci'#243'n :'
          Transparent = True
        end
        object cxTextEdit1: TcxTextEdit
          Left = 80
          Top = 28
          TabOrder = 2
          Width = 97
        end
        object cxTextEdit2: TcxTextEdit
          Left = 80
          Top = 63
          TabOrder = 3
          Width = 250
        end
        object cxButton1: TcxButton
          Left = 174
          Top = 92
          Width = 75
          Height = 25
          Caption = 'Agregar'
          TabOrder = 4
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = cxButton1Click
        end
        object cxButton2: TcxButton
          Left = 255
          Top = 92
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 5
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = cxButton2Click
        end
      end
    end
  end
  inherited BarManager: TdxBarManager
    Left = 248
    Top = 64
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited Driver: TjktDriver
    DataSetCab = mtCab
    TipoPrograma = tp_abmIndividual
    Filtro = Help
    Left = 440
    Top = 64
  end
  inherited IdHTTP: TIdHTTP
    Left = 352
    Top = 64
  end
  inherited Service: TjktServiceCaller
    Left = 304
    Top = 64
  end
  inherited OperacionSave: TjktOperacion
    OperName = 'GuardarModeloCotizador'
    Atributos = <
      item
        Dataset = mtDet
        Tag = 0
      end>
    OnBeforeEjecutar = OperacionSaveBeforeEjecutar
    OnAfterEjecutar = OperacionSaveAfterEjecutar
    Left = 504
    Top = 64
  end
  inherited mtParametroInicial: TjktMemTable
    Left = 592
    Top = 64
  end
  inherited OperacionTraer: TjktOperacion
    OperName = 'TraerModeloCotizador'
    Atributos = <
      item
        Attribute = 'oid'
        Field = mtCaboid_mod
        Tag = 0
      end>
    Left = 504
    Top = 120
  end
  inherited ValidadorForm: TjktValidadorForm
    Left = 304
    Top = 120
  end
  inherited mtParametrosForm: TjktMemTable
    Left = 632
    Top = 64
  end
  object mtCab: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_mod'
        DataType = ftInteger
      end
      item
        Name = 'cod_mod'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'des_mod'
        DataType = ftString
        Size = 100
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
    Left = 112
    Top = 128
    object mtCaboid_mod: TIntegerField
      Tag = 1
      FieldName = 'oid_mod'
    end
    object mtCabcod_mod: TStringField
      Tag = 1
      FieldName = 'cod_mod'
      Size = 15
    end
    object mtCabdes_mod: TStringField
      Tag = 1
      FieldName = 'des_mod'
      Size = 100
    end
    object mtCabActivo: TBooleanField
      Tag = 1
      FieldName = 'Activo'
    end
  end
  object mtDet: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_titu_conc'
        DataType = ftInteger
      end
      item
        Name = 'oid_mod'
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
        Name = 'cod_titu_conc'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'des_titu_conc'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'oid_conc'
        DataType = ftInteger
      end
      item
        Name = 'tipo'
        DataType = ftString
        Size = 1
      end>
    IndexFieldNames = 'oid_mod'
    IndexDefs = <
      item
        Name = 'mtDetIndex'
        Fields = 'oid_mod'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    MasterFields = 'oid_mod'
    MasterSource = dsCab
    Version = '7.12.10 CodeGear Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    Left = 112
    Top = 200
    object mtDetoid_titu_conc: TIntegerField
      Tag = 1
      FieldName = 'oid_titu_conc'
    end
    object mtDetoid_mod: TIntegerField
      Tag = 1
      FieldName = 'oid_mod'
    end
    object mtDetcodInterno: TIntegerField
      Tag = 1
      FieldName = 'codInterno'
    end
    object mtDetcodInternoPadre: TIntegerField
      Tag = 1
      FieldName = 'codInternoPadre'
    end
    object mtDetcod_titu_conc: TStringField
      Tag = 1
      FieldName = 'cod_titu_conc'
      Size = 15
    end
    object mtDetdes_titu_conc: TStringField
      Tag = 1
      FieldName = 'des_titu_conc'
      Size = 100
    end
    object mtDetoid_conc: TIntegerField
      Tag = 1
      FieldName = 'oid_conc'
    end
    object mtDettipo: TStringField
      Tag = 1
      FieldName = 'tipo'
      Size = 1
    end
  end
  object dsCab: TDataSource
    DataSet = mtCab
    Left = 152
    Top = 128
  end
  object dsDet: TDataSource
    DataSet = mtDet
    Left = 152
    Top = 200
  end
  object Help: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'modeloCotizador'
    TipoFiltro = fi_Activos
    OidRespuesta = mtCaboid_mod
    Left = 440
    Top = 120
  end
  object HelpConcepto: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'conceptoPresupuesto'
    TipoFiltro = fi_Activos
    OidRespuesta = mtDetoid_conc
    Left = 688
    Top = 256
  end
  object PopupMenu: TPopupMenu
    OnPopup = PopupMenuPopup
    Left = 248
    Top = 200
    object menAnadirMismoNivel: TMenuItem
      Caption = 'A'#241'adir T'#237'tulo'
      OnClick = menAnadirMismoNivelClick
    end
    object menAnadirSubTitulo: TMenuItem
      Caption = 'A'#241'adir SubT'#237'tulo'
      OnClick = menAnadirSubTituloClick
    end
    object menAnadirConcepto: TMenuItem
      Caption = 'A'#241'adir Concepto'
      OnClick = menAnadirConceptoClick
    end
    object menModificar: TMenuItem
      Caption = 'Modificar'
      OnClick = menModificarClick
    end
    object menEliminar: TMenuItem
      Caption = 'Eliminar'
      Enabled = False
      OnClick = menEliminarClick
    end
  end
  object opEliminarTituloConcepto: TjktOperacion
    OperName = 'EliminarTituloConcepto'
    EnviarTodo = False
    Atributos = <
      item
        Attribute = 'oid'
        Field = mtDetoid_titu_conc
        Tag = 0
      end>
    ServiceCaller = Service
    Left = 328
    Top = 200
  end
end
