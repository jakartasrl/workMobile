inherited FNVen0003: TFNVen0003
  Caption = 'Solicitud de Cotizaci'#243'n'
  ClientHeight = 592
  ClientWidth = 861
  ExplicitWidth = 877
  ExplicitHeight = 630
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBoxLeft: TcxGroupBox
    ExplicitHeight = 592
    Height = 592
  end
  inherited cxSplitterLeft: TcxSplitter
    Height = 592
    ExplicitHeight = 592
  end
  inherited cxGroupBoxRight: TcxGroupBox
    Left = 831
    ExplicitLeft = 828
    ExplicitHeight = 592
    Height = 592
  end
  inherited cxSplitterRight: TcxSplitter
    Left = 827
    Height = 592
    HotZoneClassName = ''
    HotZone = nil
    ExplicitLeft = 824
    ExplicitHeight = 592
  end
  inherited cxGroupBoxMain: TcxGroupBox
    ExplicitWidth = 790
    ExplicitHeight = 592
    Height = 592
    Width = 793
    object lcMain: TdxLayoutControl
      Left = 2
      Top = 2
      Width = 789
      Height = 588
      Align = alClient
      TabOrder = 0
      LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
      ExplicitWidth = 786
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 120
        Top = 41
        DataBinding.DataField = 'nro_cotiz'
        DataBinding.DataSource = dsCotizacion
        Properties.ReadOnly = True
        Style.HotTrack = False
        TabOrder = 0
        Width = 90
      end
      object cxDBDateEdit1: TcxDBDateEdit
        Left = 257
        Top = 41
        DataBinding.DataField = 'fecha'
        DataBinding.DataSource = dsCotizacion
        Properties.ReadOnly = True
        Properties.ShowTime = False
        Properties.UseLeftAlignmentOnEditing = False
        Style.HotTrack = False
        TabOrder = 1
        Width = 92
      end
      object cxDBTextEdit6: TcxDBTextEdit
        Left = 462
        Top = 107
        DataBinding.DataField = 'razonSocial'
        DataBinding.DataSource = dsCotizacion
        Properties.ReadOnly = True
        Style.HotTrack = False
        TabOrder = 6
        Width = 283
      end
      object cxDBTextEdit7: TcxDBTextEdit
        Left = 177
        Top = 241
        DataBinding.DataField = 'des_vend'
        DataBinding.DataSource = dsCotizacion
        Properties.ReadOnly = True
        Style.HotTrack = False
        TabOrder = 9
        Width = 180
      end
      object cxDBTextEdit8: TcxDBTextEdit
        Left = 533
        Top = 241
        DataBinding.DataField = 'des_repre'
        DataBinding.DataSource = dsCotizacion
        Properties.ReadOnly = True
        Style.HotTrack = False
        TabOrder = 11
        Width = 180
      end
      object cxDBButtonEdit1: TcxDBButtonEdit
        Left = 115
        Top = 107
        DataBinding.DataField = 'cod_clie'
        DataBinding.DataSource = dsCotizacion
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = cxDBButtonEdit1PropertiesButtonClick
        Style.HotTrack = False
        TabOrder = 4
        Width = 99
      end
      object cxDBButtonEdit2: TcxDBButtonEdit
        Left = 91
        Top = 241
        DataBinding.DataField = 'cod_vend'
        DataBinding.DataSource = dsCotizacion
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = cxDBButtonEdit2PropertiesButtonClick
        Style.HotTrack = False
        TabOrder = 8
        Width = 80
      end
      object jktExpDBGrid5: TjktExpDBGrid
        Left = 10000
        Top = 10000
        Width = 717
        Height = 365
        TabOrder = 13
        Visible = False
        DataSource = dsArchivos
        object jktExpDBGrid5DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsArchivos
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.DragHighlighting = False
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsView.GroupByBox = False
          object jktExpDBGrid5DBTableView1FechaSubida: TcxGridDBColumn
            Caption = 'Fecha de subida'
            DataBinding.FieldName = 'fecha_subida'
            Options.Editing = False
            Width = 115
          end
          object jktExpDBGrid5DBTableView1Usuario: TcxGridDBColumn
            Caption = 'Usuario'
            DataBinding.FieldName = 'usuario'
            Options.Editing = False
          end
          object jktExpDBGrid5DBTableView1Comentario: TcxGridDBColumn
            Caption = 'Comentario'
            DataBinding.FieldName = 'comentario'
            Width = 237
          end
          object jktExpDBGrid5DBTableView1Archivo: TcxGridDBColumn
            Caption = 'Archivo'
            DataBinding.FieldName = 'archivo'
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end
              item
                Hint = 'Abrir archivo...'
              end>
            Properties.ReadOnly = True
            Properties.OnButtonClick = jktExpDBGrid5DBTableView1ArchivoPropertiesButtonClick
            Width = 389
          end
        end
        object jktExpDBGrid5Level1: TcxGridLevel
          GridView = jktExpDBGrid5DBTableView1
        end
      end
      object cxDBButtonEdit3: TcxDBButtonEdit
        Left = 220
        Top = 107
        DataBinding.DataField = 'des_sucu'
        DataBinding.DataSource = dsCotizacion
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = cxDBButtonEdit3PropertiesButtonClick
        Style.HotTrack = False
        TabOrder = 5
        Width = 141
      end
      object cxDBButtonEdit4: TcxDBButtonEdit
        Left = 447
        Top = 241
        DataBinding.DataField = 'cod_repre'
        DataBinding.DataSource = dsCotizacion
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = cxDBButtonEdit4PropertiesButtonClick
        Style.HotTrack = False
        TabOrder = 10
        Width = 80
      end
      object cxGridItems: TcxGrid
        Left = 10000
        Top = 10000
        Width = 737
        Height = 406
        BorderStyle = cxcbsNone
        TabOrder = 12
        Visible = False
        object DBLayoutView: TcxGridDBLayoutView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsItems
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsView.ScrollBars = ssNone
          OptionsView.RecordCaption.DisplayMask = '[RecordIndex] de [RecordCount]'
          OptionsView.ViewMode = lvvmSingleRow
          object DBLayoutViewTipo: TcxGridDBLayoutViewItem
            Caption = 'Tipo'
            DataBinding.FieldName = 'oid_tipo'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'oid_tipo'
            Properties.ListColumns = <
              item
                Caption = 'Seleccione...'
                FieldName = 'des_tipo'
              end>
            Properties.ListSource = dsTiposVenta
            LayoutItem = DBLayoutViewLayoutItem1
            Options.Filtering = False
          end
          object DBLayoutViewCodigo: TcxGridDBLayoutViewItem
            Caption = 'Art'#237'culo'
            DataBinding.FieldName = 'cod_art'
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.OnButtonClick = DBLayoutViewCodigoPropertiesButtonClick
            LayoutItem = DBLayoutViewLayoutItem2
            Options.Filtering = False
          end
          object DBLayoutViewDescripcion: TcxGridDBLayoutViewItem
            Caption = 'Descripci'#243'n'
            DataBinding.FieldName = 'des_abrev_art'
            LayoutItem = DBLayoutViewLayoutItem3
            Options.Editing = False
            Options.Filtering = False
          end
          object DBLayoutViewCantidad: TcxGridDBLayoutViewItem
            Caption = 'Cantidad'
            DataBinding.FieldName = 'cant'
            LayoutItem = DBLayoutViewLayoutItem4
            Options.Filtering = False
          end
          object DBLayoutViewReferencia: TcxGridDBLayoutViewItem
            Caption = 'Referencia'
            DataBinding.FieldName = 'referencia'
            LayoutItem = DBLayoutViewLayoutItem5
            Options.Filtering = False
          end
          object DBLayoutViewItem1: TcxGridDBLayoutViewItem
            Caption = 'Cargar plantilla'
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.ReadOnly = True
            Properties.OnButtonClick = DBLayoutViewItem1PropertiesButtonClick
            LayoutItem = DBLayoutViewLayoutItem7
            Options.Filtering = False
          end
          object DBLayoutViewDetalle: TcxGridDBLayoutViewItem
            Caption = 'Detalle'
            DataBinding.FieldName = 'detalle'
            PropertiesClassName = 'TcxMemoProperties'
            Properties.VisibleLineCount = 15
            LayoutItem = DBLayoutViewLayoutItem6
            Options.Filtering = False
          end
          object dxLayoutGroup1: TdxLayoutGroup
            AlignHorz = ahLeft
            AlignVert = avTop
            CaptionOptions.Text = 'Template Card'
            CaptionOptions.Visible = False
            ButtonOptions.Buttons = <>
            Hidden = True
            ShowBorder = False
            Index = -1
          end
          object DBLayoutViewLayoutItem2: TcxGridLayoutItem
            Parent = DBLayoutViewGroup2
            SizeOptions.Width = 152
            Index = 0
          end
          object DBLayoutViewLayoutItem3: TcxGridLayoutItem
            CaptionOptions.AlignHorz = taRightJustify
            Parent = DBLayoutViewGroup2
            SizeOptions.Width = 349
            Index = 1
          end
          object DBLayoutViewLayoutItem6: TcxGridLayoutItem
            CaptionOptions.ImageIndex = 0
            CaptionOptions.Visible = False
            Parent = dxLayoutGroup2
            SizeOptions.Height = 80
            SizeOptions.Width = 453
            Index = 1
          end
          object DBLayoutViewGroup2: TdxLayoutGroup
            CaptionOptions.Text = 'Hidden Group'
            CaptionOptions.Visible = False
            Parent = DBLayoutViewGroup4
            ButtonOptions.Buttons = <>
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            Index = 1
          end
          object dxLayoutGroup2: TdxLayoutGroup
            CaptionOptions.Text = 'Detalle'
            CaptionOptions.Visible = False
            Parent = DBLayoutViewGroup3
            SizeOptions.Height = 72
            ButtonOptions.Buttons = <>
            ShowBorder = False
            Index = 0
          end
          object DBLayoutViewLayoutItem1: TcxGridLayoutItem
            Parent = DBLayoutViewGroup1
            SizeOptions.Width = 152
            Index = 0
          end
          object DBLayoutViewLayoutItem4: TcxGridLayoutItem
            Parent = DBLayoutViewGroup1
            SizeOptions.Width = 7
            Index = 1
          end
          object DBLayoutViewGroup1: TdxLayoutGroup
            CaptionOptions.Text = 'Hidden Group'
            Parent = DBLayoutViewGroup4
            ButtonOptions.Buttons = <>
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            Index = 0
          end
          object DBLayoutViewLayoutItem5: TcxGridLayoutItem
            Parent = DBLayoutViewGroup4
            Index = 2
          end
          object DBLayoutViewGroup4: TdxLayoutGroup
            CaptionOptions.Text = 'Hidden Group'
            Parent = dxLayoutGroup1
            ButtonOptions.Buttons = <>
            Hidden = True
            ItemIndex = 3
            ShowBorder = False
            Index = 0
          end
          object DBLayoutViewLayoutItem7: TcxGridLayoutItem
            Parent = DBLayoutViewGroup5
            SizeOptions.Width = 20
            Index = 0
          end
          object DBLayoutViewGroup3: TdxLayoutGroup
            CaptionOptions.Text = 'New Group'
            Parent = DBLayoutViewGroup4
            ButtonOptions.Buttons = <>
            LayoutDirection = ldTabbed
            ShowBorder = False
            Index = 3
          end
          object DBLayoutViewSpaceItem1: TdxLayoutEmptySpaceItem
            CaptionOptions.Text = 'Empty Space Item'
            Parent = DBLayoutViewGroup5
            SizeOptions.Height = 10
            SizeOptions.Width = 255
            Index = 1
          end
          object DBLayoutViewGroup5: TdxLayoutGroup
            CaptionOptions.Text = 'Hidden Group'
            Parent = dxLayoutGroup2
            ButtonOptions.Buttons = <>
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            Index = 0
          end
        end
        object cxGridItemsLevel1: TcxGridLevel
          GridView = DBLayoutView
        end
      end
      object cxDBDateEdit2: TcxDBDateEdit
        Left = 456
        Top = 41
        DataBinding.DataField = 'fecha_vencimiento'
        DataBinding.DataSource = dsCotizacion
        Style.HotTrack = False
        TabOrder = 2
        Width = 90
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 115
        Top = 68
        DataBinding.DataField = 'referencia'
        DataBinding.DataSource = dsCotizacion
        Style.HotTrack = False
        TabOrder = 3
        Width = 424
      end
      object cxDBLookupComboBox1: TcxDBLookupComboBox
        Left = 115
        Top = 134
        DataBinding.DataField = 'oid_cont_suc'
        DataBinding.DataSource = dsCotizacion
        Properties.DropDownAutoSize = True
        Properties.KeyFieldNames = 'oid_cont_suc'
        Properties.ListColumns = <
          item
            Caption = 'Apellido y Nombre'
            Width = 150
            FieldName = 'ape_nom'
          end
          item
            Caption = 'Tipo Contacto'
            Width = 90
            FieldName = 'tipo_cont'
          end
          item
            Caption = 'E-mail'
            Width = 200
            FieldName = 'email'
          end>
        Properties.ListSource = dsContactos
        Style.HotTrack = False
        TabOrder = 7
        Width = 246
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
      object lcMainGroup1: TdxLayoutGroup
        CaptionOptions.Text = 'Identificaci'#243'n'
        Parent = dxLayoutGroup4
        ButtonOptions.Buttons = <>
        ItemIndex = 1
        Index = 0
      end
      object lcMainItem2: TdxLayoutItem
        AlignHorz = ahLeft
        CaptionOptions.Text = 'Nro. de Cotizaci'#243'n :'
        Parent = lcMainGroup2
        Control = cxDBTextEdit2
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainGroup4: TdxLayoutGroup
        AlignHorz = ahClient
        CaptionOptions.Text = 'General'
        Parent = lcMainGroup3
        ButtonOptions.Buttons = <>
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
      object lcMainItem1: TdxLayoutItem
        CaptionOptions.Text = 'Fecha :'
        Parent = lcMainGroup2
        Control = cxDBDateEdit1
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object lcMainItem7: TdxLayoutItem
        AlignHorz = ahLeft
        CaptionOptions.Text = 'Nombre Comercial:'
        Parent = lcMainGroup9
        Control = cxDBTextEdit6
        ControlOptions.ShowBorder = False
        Index = 2
      end
      object lcMainItem8: TdxLayoutItem
        AlignHorz = ahLeft
        CaptionOptions.Visible = False
        Parent = lcMainGroup11
        Control = cxDBTextEdit7
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object lcMainItem9: TdxLayoutItem
        AlignHorz = ahLeft
        CaptionOptions.Visible = False
        Parent = lcMainGroup11
        Control = cxDBTextEdit8
        ControlOptions.ShowBorder = False
        Index = 3
      end
      object lcMainGroup11: TdxLayoutGroup
        CaptionOptions.Text = 'Datos Comerciales'
        Parent = lcMainGroup4
        ButtonOptions.Buttons = <>
        ButtonOptions.ShowExpandButton = True
        ItemIndex = 3
        LayoutDirection = ldHorizontal
        Index = 0
      end
      object lcMainItem12: TdxLayoutItem
        CaptionOptions.Text = 'Cliente | Sucursal :'
        Parent = lcMainGroup9
        Control = cxDBButtonEdit1
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainGroup13: TdxLayoutGroup
        CaptionOptions.Text = #205'tems'
        Parent = lcMainGroup3
        ButtonOptions.Buttons = <>
        Index = 1
      end
      object lcMainGroup2: TdxLayoutGroup
        CaptionOptions.Text = 'Datos del Pedido'
        Parent = lcMainGroup1
        ButtonOptions.Buttons = <>
        ItemControlAreaAlignment = catOwn
        LayoutDirection = ldHorizontal
        ShowBorder = False
        Index = 0
      end
      object lcMainGroup9: TdxLayoutGroup
        CaptionOptions.Text = 'Datos del Cliente'
        Parent = lcMainGroup1
        ButtonOptions.Buttons = <>
        LayoutDirection = ldHorizontal
        ShowBorder = False
        Index = 3
      end
      object dxLayoutSeparatorItem2: TdxLayoutSeparatorItem
        CaptionOptions.Text = 'Separator'
        Parent = lcMainGroup1
        SizeOptions.AssignedValues = [sovSizableHorz, sovSizableVert]
        SizeOptions.SizableHorz = False
        SizeOptions.SizableVert = False
        Index = 2
      end
      object dxLayoutItem1: TdxLayoutItem
        CaptionOptions.Text = 'Vendedor :'
        Parent = lcMainGroup11
        Control = cxDBButtonEdit2
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainGroup16: TdxLayoutGroup
        CaptionOptions.Text = 'Archivos asociados y Notas'
        Parent = lcMainGroup3
        ButtonOptions.Buttons = <>
        Index = 2
      end
      object lcMainItem20: TdxLayoutItem
        CaptionOptions.Text = 'jktExpDBGrid5'
        CaptionOptions.Visible = False
        Parent = lcMainGroup16
        Control = jktExpDBGrid5
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainItem3: TdxLayoutItem
        CaptionOptions.Visible = False
        Parent = lcMainGroup9
        Control = cxDBButtonEdit3
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object lcMainItem4: TdxLayoutItem
        CaptionOptions.Text = 'Representante :'
        Parent = lcMainGroup11
        Control = cxDBButtonEdit4
        ControlOptions.ShowBorder = False
        Index = 2
      end
      object lcMainItem5: TdxLayoutItem
        CaptionOptions.Text = 'New Item'
        CaptionOptions.Visible = False
        Parent = lcMainGroup13
        Control = cxGridItems
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainItem6: TdxLayoutItem
        CaptionOptions.Text = 'Fecha Vencimiento :'
        Parent = lcMainGroup2
        Control = cxDBDateEdit2
        ControlOptions.ShowBorder = False
        Index = 2
      end
      object lcMainItem10: TdxLayoutItem
        CaptionOptions.Text = 'Referencia :'
        Parent = lcMainGroup1
        Control = cxDBTextEdit1
        ControlOptions.AlignHorz = ahLeft
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object lcMainItem11: TdxLayoutItem
        CaptionOptions.Text = 'Contacto Refer.:'
        Parent = lcMainGroup1
        Control = cxDBLookupComboBox1
        ControlOptions.AlignHorz = ahLeft
        ControlOptions.ShowBorder = False
        Index = 4
      end
    end
  end
  inherited BarManager: TdxBarManager
    Left = 304
    Top = 8
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited Driver: TjktDriver
    DataSetCab = mtCotizacion
    TipoPrograma = tp_abmIndividual
    Filtro = Help
    OperacionesIniciales = <
      item
        Operacion = opTraerTiposDeVenta
      end>
    OnNuevo = DriverNuevo
    Left = 496
    Top = 8
  end
  inherited IdHTTP: TIdHTTP
    Left = 440
    Top = 8
  end
  inherited Service: TjktServiceCaller
    Left = 384
    Top = 8
  end
  inherited OperacionSave: TjktOperacion
    OperName = 'GuardarSolicitudCotizacion'
    Atributos = <
      item
        Dataset = mtItems
        Tag = 0
      end
      item
        Dataset = mtArchivos
        Tag = 0
      end>
    Left = 552
    Top = 8
  end
  inherited mtParametroInicial: TjktMemTable
    Left = 640
    Top = 8
  end
  inherited OperacionTraer: TjktOperacion
    OperName = 'TraerSolicitudCotizacion'
    Atributos = <
      item
        Attribute = 'oid'
        Field = mtCotizacionoid_cotiz
        Tag = 0
      end>
    OnAfterEjecutar = OperacionTraerAfterEjecutar
    Left = 552
    Top = 56
  end
  inherited ValidadorForm: TjktValidadorForm
    ListaValidaciones = <
      item
        Field = mtCotizacioncod_clie
        ValidadorGral = valClie
      end
      item
        Field = mtCotizacioncod_vend
        ValidadorGral = valVend
      end
      item
        Field = mtCotizacioncod_repre
        ValidadorGral = valRepre
      end
      item
        Field = mtItemscod_art
        ValidadorGral = valArt
      end>
    Top = 56
  end
  inherited mtParametrosForm: TjktMemTable
    Left = 680
    Top = 8
  end
  object dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList
    Left = 256
    Top = 8
    object dxLayoutSkinLookAndFeel1: TdxLayoutSkinLookAndFeel
    end
  end
  object OpenDialog: TOpenDialog
    Left = 640
    Top = 56
  end
  object Help: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'cotizacion'
    TipoFiltro = fi_Activos
    OidRespuesta = mtCotizacionoid_cotiz
    Left = 496
    Top = 88
  end
  object mtItems: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_cotiz'
        DataType = ftInteger
      end
      item
        Name = 'oid_tipo'
        DataType = ftInteger
      end
      item
        Name = 'oid_art'
        DataType = ftInteger
      end
      item
        Name = 'cod_art'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'des_art_abrev'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'cant'
        DataType = ftFloat
      end
      item
        Name = 'detalle'
        DataType = ftMemo
      end>
    IndexFieldNames = 'oid_cotiz'
    IndexDefs = <
      item
        Name = 'mtItemsIndex'
        Fields = 'oid_cotiz'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    MasterFields = 'oid_cotiz'
    MasterSource = dsCotizacion
    Version = '7.12.10 CodeGear Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    OnNewRecord = mtItemsNewRecord
    Left = 192
    Top = 344
    object mtItemsoid_item: TIntegerField
      Tag = 1
      FieldName = 'oid_item'
    end
    object mtItemsoid_cotiz: TIntegerField
      Tag = 1
      FieldName = 'oid_cotiz'
    end
    object mtItemsoid_tipo: TIntegerField
      Tag = 1
      FieldName = 'oid_tipo'
    end
    object mtItemsoid_art: TIntegerField
      Tag = 1
      FieldName = 'oid_art'
    end
    object mtItemscod_art: TStringField
      FieldName = 'cod_art'
      Size = 50
    end
    object mtItemsdes_abrev_art: TStringField
      FieldName = 'des_abrev_art'
      Size = 40
    end
    object mtItemscant: TFloatField
      Tag = 1
      FieldName = 'cant'
    end
    object mtItemsreferencia: TStringField
      Tag = 1
      FieldName = 'referencia'
      Size = 100
    end
    object mtItemsdetalle: TMemoField
      Tag = 1
      FieldName = 'detalle'
      BlobType = ftMemo
    end
  end
  object dsItems: TDataSource
    DataSet = mtItems
    Left = 232
    Top = 344
  end
  object mtArchivos: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_arch'
        DataType = ftInteger
      end
      item
        Name = 'oid_cotiz'
        DataType = ftInteger
      end
      item
        Name = 'fecha_subida'
        DataType = ftDateTime
      end
      item
        Name = 'oid_usu'
        DataType = ftInteger
      end
      item
        Name = 'usuario'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'comentario'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'archivo'
        DataType = ftString
        Size = 100
      end>
    IndexFieldNames = 'oid_cotiz'
    IndexDefs = <
      item
        Name = 'mtArchivosIndex'
        Fields = 'oid_cotiz'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    MasterFields = 'oid_cotiz'
    MasterSource = dsCotizacion
    Version = '7.12.10 CodeGear Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    OnNewRecord = mtArchivosNewRecord
    Left = 192
    Top = 392
    object mtArchivosoid_arch: TIntegerField
      Tag = 1
      FieldName = 'oid_arch'
    end
    object mtArchivosoid_cotiz: TIntegerField
      Tag = 1
      FieldName = 'oid_cotiz'
    end
    object mtArchivosfecha_subida: TDateTimeField
      FieldName = 'fecha_subida'
    end
    object mtArchivosoid_usu: TIntegerField
      Tag = 1
      FieldName = 'oid_usu'
    end
    object mtArchivosusuario: TStringField
      FieldName = 'usuario'
    end
    object mtArchivoscomentario: TStringField
      Tag = 1
      FieldName = 'comentario'
      Size = 50
    end
    object mtArchivosarchivo: TStringField
      Tag = 1
      FieldName = 'archivo'
      Size = 100
    end
  end
  object dsArchivos: TDataSource
    DataSet = mtArchivos
    Left = 232
    Top = 392
  end
  object mtCotizacion: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_cotiz'
        DataType = ftInteger
      end
      item
        Name = 'nro_cotiz'
        DataType = ftInteger
      end
      item
        Name = 'fecha'
        DataType = ftDateTime
      end
      item
        Name = 'oid_clie'
        DataType = ftInteger
      end
      item
        Name = 'cod_clie'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'razonSocial'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'oid_sucu'
        DataType = ftInteger
      end
      item
        Name = 'nro_sucu'
        DataType = ftSmallint
      end
      item
        Name = 'des_sucu'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'oid_vend'
        DataType = ftInteger
      end
      item
        Name = 'cod_vend'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'des_vend'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'oid_repre'
        DataType = ftInteger
      end
      item
        Name = 'cod_repre'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'des_repre'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'respCargaEmpresa'
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
    Left = 192
    Top = 296
    object mtCotizacionoid_cotiz: TIntegerField
      Tag = 1
      FieldName = 'oid_cotiz'
    end
    object mtCotizacionnro_cotiz: TStringField
      FieldName = 'nro_cotiz'
      Size = 30
    end
    object mtCotizacionfecha: TDateTimeField
      FieldName = 'fecha'
    end
    object mtCotizacionfecha_vencimiento: TDateTimeField
      Tag = 1
      FieldName = 'fecha_vencimiento'
    end
    object mtCotizacionoid_clie: TIntegerField
      FieldName = 'oid_clie'
    end
    object mtCotizacioncod_clie: TStringField
      FieldName = 'cod_clie'
      Size = 15
    end
    object mtCotizacionRazonSocial: TStringField
      FieldName = 'razonSocial'
      Size = 100
    end
    object mtCotizacionoid_sucu: TIntegerField
      Tag = 1
      FieldName = 'oid_sucu'
    end
    object mtCotizacionnro_sucu: TSmallintField
      FieldName = 'nro_sucu'
    end
    object mtCotizaciondes_sucu: TStringField
      FieldName = 'des_sucu'
      Size = 50
    end
    object mtCotizacionreferencia: TStringField
      Tag = 1
      FieldName = 'referencia'
      Size = 100
    end
    object mtCotizacionoid_cont_suc: TIntegerField
      Tag = 1
      FieldName = 'oid_cont_suc'
    end
    object mtCotizacionoid_vend: TIntegerField
      Tag = 1
      FieldName = 'oid_vend'
    end
    object mtCotizacioncod_vend: TStringField
      FieldName = 'cod_vend'
      Size = 15
    end
    object mtCotizaciondes_vend: TStringField
      FieldName = 'des_vend'
      Size = 40
    end
    object mtCotizacionoid_repre: TIntegerField
      Tag = 1
      FieldName = 'oid_repre'
    end
    object mtCotizacioncod_repre: TStringField
      FieldName = 'cod_repre'
      Size = 15
    end
    object mtCotizaciondes_repre: TStringField
      FieldName = 'des_repre'
      Size = 40
    end
  end
  object dsCotizacion: TDataSource
    DataSet = mtCotizacion
    Left = 232
    Top = 296
  end
  object hlpVend: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'vendedor'
    TipoFiltro = fi_Activos
    OidRespuesta = mtCotizacionoid_vend
    CodigoRespuesta = mtCotizacioncod_vend
    Left = 208
    Top = 144
  end
  object hlpRepre: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'representante'
    TipoFiltro = fi_Activos
    OidRespuesta = mtCotizacionoid_repre
    CodigoRespuesta = mtCotizacioncod_repre
    Left = 248
    Top = 144
  end
  object hlpArt: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'articulos'
    TipoFiltro = fi_Activos
    OidRespuesta = mtItemsoid_art
    CodigoRespuesta = mtItemscod_art
    Left = 288
    Top = 144
  end
  object hlpClie: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'clientes'
    TipoFiltro = fi_Activos
    OidRespuesta = mtCotizacionoid_clie
    CodigoRespuesta = mtCotizacioncod_clie
    Left = 128
    Top = 144
  end
  object hlpSucu: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'clienteSucursal'
    EntidadMaestra = 'clientes'
    OidEntidadMaestra = mtCotizacionoid_clie
    TipoFiltro = fi_Activos
    OidRespuesta = mtCotizacionoid_sucu
    Left = 168
    Top = 144
  end
  object mtTiposVenta: TjktMemTable
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
    Left = 392
    Top = 248
    object mtTiposVentaoid_tipo: TIntegerField
      Tag = 1
      FieldName = 'oid_tipo'
    end
    object mtTiposVentades_tipo: TStringField
      FieldName = 'des_tipo'
      Size = 30
    end
  end
  object opTraerTiposDeVenta: TjktOperacion
    OperName = 'TraerTiposDeVenta'
    EnviarTodo = False
    Atributos = <>
    ServiceCaller = Service
    Left = 352
    Top = 248
  end
  object dsTiposVenta: TDataSource
    DataSet = mtTiposVenta
    Left = 432
    Top = 248
  end
  object valClie: TjktValidador
    Entidad = 'clientes'
    Validacion = tExistente
    ListaAsignaciones = <
      item
        SourceName = 'oid'
        FieldTarget = mtCotizacionoid_clie
      end
      item
        SourceName = 'Descripcion'
        FieldTarget = mtCotizacionRazonSocial
      end>
    Left = 128
    Top = 200
  end
  object valVend: TjktValidador
    Entidad = 'vendedor'
    Validacion = tExistente
    ListaAsignaciones = <
      item
        SourceName = 'oid'
        FieldTarget = mtCotizacionoid_vend
      end
      item
        SourceName = 'Descripcion'
        FieldTarget = mtCotizaciondes_vend
      end>
    Left = 208
    Top = 200
  end
  object valRepre: TjktValidador
    Entidad = 'representante'
    Validacion = tExistente
    ListaAsignaciones = <
      item
        SourceName = 'oid'
        FieldTarget = mtCotizacionoid_repre
      end
      item
        SourceName = 'Descripcion'
        FieldTarget = mtCotizaciondes_repre
      end>
    Left = 248
    Top = 200
  end
  object valArt: TjktValidador
    Entidad = 'articulos'
    Validacion = tExistente
    ListaAsignaciones = <
      item
        SourceName = 'oid'
        FieldTarget = mtItemsoid_art
      end
      item
        SourceName = 'Descripcion'
        FieldTarget = mtItemsdes_abrev_art
      end>
    Left = 288
    Top = 200
  end
  object hlpPlantilla: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'plantilla'
    TipoFiltro = fi_Activos
    Left = 328
    Top = 144
  end
  object opTraerVendRepre: TjktOperacion
    OperName = 'TraerVendRepreCliente'
    EnviarTodo = False
    Atributos = <>
    ServiceCaller = Service
    Left = 352
    Top = 304
  end
  object mtVendRepre: TjktMemTable
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
    Left = 392
    Top = 304
    object mtVendRepreoid_vend: TIntegerField
      FieldName = 'oid_vend'
    end
    object mtVendReprecod_vend: TStringField
      FieldName = 'cod_vend'
      Size = 15
    end
    object mtVendRepredes_vend: TStringField
      FieldName = 'des_vend'
      Size = 40
    end
    object mtVendRepreoid_repre: TIntegerField
      FieldName = 'oid_repre'
    end
    object mtVendReprecod_repre: TStringField
      FieldName = 'cod_repre'
      Size = 15
    end
    object mtVendRepredes_repre: TStringField
      FieldName = 'des_repre'
      Size = 40
    end
  end
  object opTraerContactosSucu: TjktOperacion
    OperName = 'TraerContactosDeSucursal'
    EnviarTodo = False
    Atributos = <>
    ServiceCaller = Service
    Left = 352
    Top = 360
  end
  object mtContactos: TjktMemTable
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
    Left = 392
    Top = 360
    object mtContactosoid_cont_suc: TIntegerField
      FieldName = 'oid_cont_suc'
    end
    object mtContactostipo_cont: TStringField
      FieldName = 'tipo_cont'
      Size = 30
    end
    object mtContactosape_nom: TStringField
      FieldName = 'ape_nom'
      Size = 60
    end
    object mtContactosemail: TStringField
      FieldName = 'email'
      Size = 50
    end
  end
  object dsContactos: TDataSource
    DataSet = mtContactos
    Left = 432
    Top = 360
  end
  object mtClienteSucursal: TjktMemTable
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
    Left = 392
    Top = 416
    object mtClienteSucursaloid_clie_suc: TIntegerField
      FieldName = 'oid_clie_suc'
    end
  end
end
