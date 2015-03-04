inherited FNCli0001: TFNCli0001
  Caption = 'ABM de Clientes'
  ClientHeight = 557
  ClientWidth = 984
  ExplicitWidth = 1000
  ExplicitHeight = 595
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBoxLeft: TcxGroupBox
    ExplicitHeight = 557
    Height = 557
  end
  inherited cxSplitterLeft: TcxSplitter
    Height = 557
    ExplicitHeight = 557
  end
  inherited cxGroupBoxRight: TcxGroupBox
    Left = 954
    TabOrder = 4
    ExplicitLeft = 954
    ExplicitHeight = 557
    Height = 557
  end
  inherited cxSplitterRight: TcxSplitter
    Left = 950
    Height = 557
    ExplicitLeft = 950
    ExplicitHeight = 557
  end
  inherited cxGroupBoxMain: TcxGroupBox
    TabOrder = 7
    ExplicitWidth = 916
    ExplicitHeight = 557
    Height = 557
    Width = 916
    object lcMain: TdxLayoutControl
      Left = 2
      Top = 2
      Width = 912
      Height = 553
      Align = alClient
      TabOrder = 0
      LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 65
        Top = 41
        DataBinding.DataField = 'Codigo'
        DataBinding.DataSource = dsCliente
        Style.HotTrack = False
        TabOrder = 0
        Width = 150
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 293
        Top = 41
        DataBinding.DataField = 'RazonSocial'
        DataBinding.DataSource = dsSujImp
        Style.HotTrack = False
        TabOrder = 1
        Width = 293
      end
      object cxDBTextEdit3: TcxDBTextEdit
        Left = 89
        Top = 196
        DataBinding.DataField = 'Direccion'
        DataBinding.DataSource = dsSujImp
        Style.HotTrack = False
        TabOrder = 5
        Width = 243
      end
      object cxDBTextEdit4: TcxDBTextEdit
        Left = 394
        Top = 196
        DataBinding.DataField = 'Localidad'
        DataBinding.DataSource = dsSujImp
        Style.HotTrack = False
        TabOrder = 6
        Width = 243
      end
      object cxDBTextEdit7: TcxDBTextEdit
        Left = 710
        Top = 196
        DataBinding.DataField = 'CodPostal'
        DataBinding.DataSource = dsSujImp
        Style.HotTrack = False
        TabOrder = 7
        Width = 87
      end
      object cxDBTextEdit8: TcxDBTextEdit
        Left = 154
        Top = 223
        DataBinding.DataField = 'DescProvincia'
        DataBinding.DataSource = dsSujImp
        Enabled = False
        Style.HotTrack = False
        TabOrder = 9
        Width = 178
      end
      object cxDBTextEdit9: TcxDBTextEdit
        Left = 459
        Top = 223
        DataBinding.DataField = 'DescPais'
        DataBinding.DataSource = dsSujImp
        Enabled = False
        Style.HotTrack = False
        TabOrder = 11
        Width = 178
      end
      object cxDBButtonEdit1: TcxDBButtonEdit
        Left = 89
        Top = 223
        DataBinding.DataField = 'CodProvincia'
        DataBinding.DataSource = dsSujImp
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = cxDBButtonEdit1PropertiesButtonClick
        Style.HotTrack = False
        TabOrder = 8
        Width = 59
      end
      object cxDBButtonEdit2: TcxDBButtonEdit
        Left = 394
        Top = 223
        DataBinding.DataField = 'CodPais'
        DataBinding.DataSource = dsSujImp
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = cxDBButtonEdit2PropertiesButtonClick
        Style.HotTrack = False
        TabOrder = 10
        Width = 59
      end
      object cxDBTextEdit5: TcxDBTextEdit
        Left = 89
        Top = 250
        DataBinding.DataField = 'Telefonos'
        DataBinding.DataSource = dsCliente
        Style.HotTrack = False
        TabOrder = 12
        Width = 243
      end
      object cxDBCheckBox1: TcxDBCheckBox
        Left = 281
        Top = 125
        DataBinding.DataField = 'PersonaJuridica'
        DataBinding.DataSource = dsSujImp
        Properties.Alignment = taLeftJustify
        Style.HotTrack = False
        TabOrder = 4
        Transparent = True
        Width = 43
      end
      object jktExpDBGrid1: TjktExpDBGrid
        Left = 30
        Top = 321
        Width = 767
        Height = 145
        TabOrder = 15
        DataSource = dsInscripcionesImpositivas
        object jktExpDBGrid1DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsInscripcionesImpositivas
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsData.Deleting = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          object jktExpDBGrid1DBTableView1oid_InscClie: TcxGridDBColumn
            DataBinding.FieldName = 'oid_InscClie'
            Visible = False
          end
          object jktExpDBGrid1DBTableView1oid_Cliente: TcxGridDBColumn
            DataBinding.FieldName = 'oid_Cliente'
            Visible = False
          end
          object jktExpDBGrid1DBTableView1oid_Impuesto: TcxGridDBColumn
            DataBinding.FieldName = 'oid_Impuesto'
            Visible = False
          end
          object jktExpDBGrid1DBTableView1CodImpuesto: TcxGridDBColumn
            Caption = 'C'#243'd. Impuesto'
            DataBinding.FieldName = 'CodImpuesto'
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Options.Editing = False
            Width = 84
          end
          object jktExpDBGrid1DBTableView1DescImpuesto: TcxGridDBColumn
            Caption = 'Desc. Impuesto'
            DataBinding.FieldName = 'DescImpuesto'
            Options.Editing = False
            Width = 222
          end
          object jktExpDBGrid1DBTableView1NroInscripcion: TcxGridDBColumn
            Caption = 'Nro. Inscripci'#243'n'
            DataBinding.FieldName = 'NroInscripcion'
            Width = 86
          end
          object jktExpDBGrid1DBTableView1oid_Categoria: TcxGridDBColumn
            DataBinding.FieldName = 'oid_Categoria'
            Visible = False
            Width = 73
          end
          object jktExpDBGrid1DBTableView1CodCategoria: TcxGridDBColumn
            Caption = 'C'#243'd. Categor'#237'a'
            DataBinding.FieldName = 'CodCategoria'
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.OnButtonClick = jktExpDBGrid1DBTableView1CodCategoriaPropertiesButtonClick
            Width = 84
          end
          object jktExpDBGrid1DBTableView1DescCategoria: TcxGridDBColumn
            Caption = 'Desc. Categor'#237'a'
            DataBinding.FieldName = 'DescCategoria'
            Options.Editing = False
            Width = 217
          end
          object jktExpDBGrid1DBTableView1VigenciaDesde: TcxGridDBColumn
            Caption = 'Vigencia Desde'
            DataBinding.FieldName = 'VigenciaDesde'
            Width = 87
          end
          object jktExpDBGrid1DBTableView1Activo: TcxGridDBColumn
            DataBinding.FieldName = 'Activo'
            Width = 40
          end
        end
        object jktExpDBGrid1Level1: TcxGridLevel
          GridView = jktExpDBGrid1DBTableView1
        end
      end
      object jktExpDBGrid2: TjktExpDBGrid
        Left = 10000
        Top = 10000
        Width = 787
        Height = 200
        TabOrder = 23
        Visible = False
        DataSource = dsClasificadoresCliente
        object cxGridDBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsClasificadoresCliente
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsData.Deleting = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          object cxGridDBTableView1oid_ClasifClie: TcxGridDBColumn
            DataBinding.FieldName = 'oid_ClasifClie'
            Visible = False
          end
          object cxGridDBTableView1oid_Cliente: TcxGridDBColumn
            DataBinding.FieldName = 'oid_Cliente'
            Visible = False
          end
          object cxGridDBTableView1oid_Clasif: TcxGridDBColumn
            DataBinding.FieldName = 'oid_Clasif'
            Visible = False
          end
          object cxGridDBTableView1DescClasif: TcxGridDBColumn
            Caption = 'Desc. Clasificador'
            DataBinding.FieldName = 'DescClasif'
            Options.Editing = False
            Width = 151
          end
          object cxGridDBTableView1oid_ValorClasif: TcxGridDBColumn
            DataBinding.FieldName = 'oid_ValorClasif'
            Visible = False
          end
          object cxGridDBTableView1CodValorClasif: TcxGridDBColumn
            Caption = 'C'#243'd. Valor Clasif.'
            DataBinding.FieldName = 'CodValorClasif'
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.OnButtonClick = cxGridDBTableView1CodValorClasifPropertiesButtonClick
            Width = 102
          end
          object cxGridDBTableView1DescValorClasif: TcxGridDBColumn
            Caption = 'Desc. Valor Clasif.'
            DataBinding.FieldName = 'DescValorClasif'
            Options.Editing = False
          end
          object cxGridDBTableView1Activo: TcxGridDBColumn
            DataBinding.FieldName = 'Activo'
            Width = 40
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridDBTableView1
        end
      end
      object cxButtonEdit1: TcxDBButtonEdit
        Left = 120
        Top = 529
        DataBinding.DataField = 'CodCondPago'
        DataBinding.DataSource = dsCliente
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
        Style.HotTrack = False
        TabOrder = 16
        Width = 105
      end
      object cxTextEdit1: TcxDBTextEdit
        Left = 231
        Top = 529
        DataBinding.DataField = 'DescCondPago'
        DataBinding.DataSource = dsCliente
        Properties.ReadOnly = True
        Style.HotTrack = False
        TabOrder = 17
        Width = 260
      end
      object jktExpDBGrid3: TjktExpDBGrid
        Left = 10000
        Top = 10000
        Width = 787
        Height = 288
        TabOrder = 25
        Visible = False
        DataSource = dsSucursalesCliente
        object tvSucursales: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsSucursalesCliente
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsView.GroupByBox = False
          object tvSucursalesoid_SucClie: TcxGridDBColumn
            DataBinding.FieldName = 'oid_SucClie'
            Visible = False
          end
          object tvSucursalesoid_Cliente: TcxGridDBColumn
            DataBinding.FieldName = 'oid_Cliente'
            Visible = False
          end
          object tvSucursalesNroSucursal: TcxGridDBColumn
            Caption = 'Nro. Sucursal'
            DataBinding.FieldName = 'NroSucursal'
          end
          object tvSucursalesDescripcion: TcxGridDBColumn
            Caption = 'Descripci'#243'n'
            DataBinding.FieldName = 'Descripcion'
            Width = 250
          end
          object tvSucursalesDireccion: TcxGridDBColumn
            Caption = 'Direcci'#243'n'
            DataBinding.FieldName = 'Direccion'
            Width = 200
          end
          object tvSucursalesLocalidad: TcxGridDBColumn
            DataBinding.FieldName = 'Localidad'
            Width = 150
          end
          object tvSucursalesCodPostal: TcxGridDBColumn
            Caption = 'C'#243'd. Postal'
            DataBinding.FieldName = 'CodPostal'
          end
          object tvSucursalesProvincia: TcxGridDBColumn
            Caption = 'Provincia'
            DataBinding.FieldName = 'oid_Provincia'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.DropDownAutoSize = True
            Properties.KeyFieldNames = 'oid'
            Properties.ListColumns = <
              item
                Caption = 'C'#243'digo'
                Width = 70
                FieldName = 'codigo'
              end
              item
                Caption = 'Descripci'#243'n'
                Width = 200
                FieldName = 'descripcion'
              end>
            Properties.ListFieldIndex = 1
            Properties.ListSource = dsProvincias
            Width = 130
          end
          object tvSucursalesTelefonos: TcxGridDBColumn
            Caption = 'Tel'#233'fonos'
            DataBinding.FieldName = 'Telefonos'
            Width = 150
          end
          object tvSucursalesdom_ent_fac: TcxGridDBColumn
            Caption = 'Domicilio Entrega Facturas'
            DataBinding.FieldName = 'dom_ent_fac'
          end
          object tvSucursalesVendedor: TcxGridDBColumn
            Caption = 'Vendedor'
            DataBinding.FieldName = 'oid_Vendedor'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.DropDownAutoSize = True
            Properties.KeyFieldNames = 'oid'
            Properties.ListColumns = <
              item
                Caption = 'C'#243'digo'
                Width = 70
                FieldName = 'codigo'
              end
              item
                Caption = 'Descripci'#243'n'
                Width = 200
                FieldName = 'descripcion'
              end>
            Properties.ListFieldIndex = 1
            Properties.ListSource = dsVendedores
            Width = 130
          end
          object tvSucursalesRepresentante: TcxGridDBColumn
            Caption = 'Representante'
            DataBinding.FieldName = 'oid_Representante'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.DropDownAutoSize = True
            Properties.KeyFieldNames = 'oid'
            Properties.ListColumns = <
              item
                Caption = 'C'#243'digo'
                Width = 70
                FieldName = 'codigo'
              end
              item
                Caption = 'Descripci'#243'n'
                Width = 200
                FieldName = 'descripcion'
              end>
            Properties.ListFieldIndex = 1
            Properties.ListSource = dsRepresentantes
            Width = 130
          end
          object tvSucursalesActivo: TcxGridDBColumn
            DataBinding.FieldName = 'Activo'
            Width = 40
          end
        end
        object tvDomiciliosEntrega: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsDomiciliosEntrega
          DataController.DetailKeyFieldNames = 'oid_SucClie'
          DataController.KeyFieldNames = 'oid_DomSuc'
          DataController.MasterKeyFieldNames = 'oid_SucClie'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.DragDropText = True
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsView.GroupByBox = False
          object tvDomiciliosEntregaoid_DomSuc: TcxGridDBColumn
            DataBinding.FieldName = 'oid_DomSuc'
            Visible = False
          end
          object tvDomiciliosEntregaoid_SucClie: TcxGridDBColumn
            DataBinding.FieldName = 'oid_SucClie'
            Visible = False
          end
          object tvDomiciliosEntregaNroDomicilio: TcxGridDBColumn
            Caption = 'Nro. Domicilio'
            DataBinding.FieldName = 'NroDomicilio'
            Width = 75
          end
          object tvDomiciliosEntregaDescripcion: TcxGridDBColumn
            Caption = 'Descripci'#243'n'
            DataBinding.FieldName = 'Descripcion'
            Width = 250
          end
          object tvDomiciliosEntregaDireccion: TcxGridDBColumn
            Caption = 'Direcci'#243'n'
            DataBinding.FieldName = 'Direccion'
            Width = 200
          end
          object tvDomiciliosEntregaLocalidad: TcxGridDBColumn
            DataBinding.FieldName = 'Localidad'
            Width = 150
          end
          object tvDomiciliosEntregaCodPostal: TcxGridDBColumn
            Caption = 'C'#243'd. Postal'
            DataBinding.FieldName = 'CodPostal'
          end
          object tvDomiciliosEntregaoid_Provincia: TcxGridDBColumn
            DataBinding.FieldName = 'oid_Provincia'
            Visible = False
          end
          object tvDomiciliosEntregaProvincia: TcxGridDBColumn
            Caption = 'Provincia'
            DataBinding.FieldName = 'oid_Provincia'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.DropDownAutoSize = True
            Properties.KeyFieldNames = 'oid'
            Properties.ListColumns = <
              item
                Caption = 'C'#243'digo'
                Width = 70
                FieldName = 'codigo'
              end
              item
                Caption = 'Descripci'#243'n'
                Width = 200
                FieldName = 'descripcion'
              end>
            Properties.ListFieldIndex = 1
            Properties.ListSource = dsProvincias
            Width = 130
          end
          object tvDomiciliosEntregaTelefonos: TcxGridDBColumn
            Caption = 'Tel'#233'fonos'
            DataBinding.FieldName = 'Telefonos'
            Width = 150
          end
          object tvDomiciliosEntregaHorariosEntrega: TcxGridDBColumn
            Caption = 'Horarios de Entrega'
            DataBinding.FieldName = 'HorariosEntrega'
            Width = 250
          end
          object tvDomiciliosEntregaActivo: TcxGridDBColumn
            DataBinding.FieldName = 'Activo'
            Width = 40
          end
        end
        object cvContactos: TcxGridDBCardView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsContactos
          DataController.DetailKeyFieldNames = 'oid_SucClie'
          DataController.KeyFieldNames = 'oid_ContSuc'
          DataController.MasterKeyFieldNames = 'oid_SucClie'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsView.CardIndent = 7
          object cvContactosoid_ContSuc: TcxGridDBCardViewRow
            DataBinding.FieldName = 'oid_ContSuc'
            Visible = False
            Position.BeginsLayer = True
          end
          object cvContactosoid_SucClie: TcxGridDBCardViewRow
            DataBinding.FieldName = 'oid_SucClie'
            Visible = False
            Position.BeginsLayer = True
          end
          object cvContactosoid_TipoContacto: TcxGridDBCardViewRow
            Caption = 'Tipo'
            DataBinding.FieldName = 'oid_TipoContacto'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'oid'
            Properties.ListColumns = <
              item
                Width = 200
                FieldName = 'descripcion'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dsTiposContacto
            Position.BeginsLayer = True
          end
          object cvContactosApellidoYNombre: TcxGridDBCardViewRow
            Caption = 'Apellido, Nombre'
            DataBinding.FieldName = 'ApellidoYNombre'
            Position.BeginsLayer = True
          end
          object cvContactosCargo: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Cargo'
            Position.BeginsLayer = True
          end
          object cvContactosTelefono: TcxGridDBCardViewRow
            Caption = 'Tel. Directo'
            DataBinding.FieldName = 'Telefono'
            Position.BeginsLayer = True
          end
          object cvContactosTelefonoAlternativo: TcxGridDBCardViewRow
            Caption = 'Tel. Alternativo'
            DataBinding.FieldName = 'TelefonoAlternativo'
            Position.BeginsLayer = True
          end
          object cvContactosCelular: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Celular'
            Position.BeginsLayer = True
          end
          object cvContactosEmail: TcxGridDBCardViewRow
            Caption = 'E-mail'
            DataBinding.FieldName = 'Email'
            Position.BeginsLayer = True
          end
          object cvContactosActivo: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Activo'
            Position.BeginsLayer = True
          end
        end
        object tvClasificadores: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsClasificadoresSucursal
          DataController.DetailKeyFieldNames = 'oid_SucClie'
          DataController.KeyFieldNames = 'oid_ClasifSuc'
          DataController.MasterKeyFieldNames = 'oid_SucClie'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsData.Deleting = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          object tvClasificadoresoid_ClasifSuc: TcxGridDBColumn
            DataBinding.FieldName = 'oid_ClasifSuc'
            Visible = False
          end
          object tvClasificadoresoid_SucClie: TcxGridDBColumn
            DataBinding.FieldName = 'oid_SucClie'
            Visible = False
          end
          object tvClasificadoresoid_Clasif: TcxGridDBColumn
            DataBinding.FieldName = 'oid_Clasif'
            Visible = False
          end
          object tvClasificadoresDescClasif: TcxGridDBColumn
            Caption = 'Desc. Clasificador'
            DataBinding.FieldName = 'DescClasif'
            Options.Editing = False
          end
          object tvClasificadoresoid_ValorClasif: TcxGridDBColumn
            DataBinding.FieldName = 'oid_ValorClasif'
            Visible = False
          end
          object tvClasificadoresCodValorClasif: TcxGridDBColumn
            Caption = 'C'#243'd. Valor Clasif.'
            DataBinding.FieldName = 'CodValorClasif'
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.OnButtonClick = tvClasificadoresCodValorClasifPropertiesButtonClick
          end
          object tvClasificadoresDescValorClasif: TcxGridDBColumn
            Caption = 'Desc. Valor Clasif.'
            DataBinding.FieldName = 'DescValorClasif'
            Options.Editing = False
          end
          object tvClasificadoresActivo: TcxGridDBColumn
            DataBinding.FieldName = 'Activo'
            Width = 40
          end
        end
        object lvSucursales: TcxGridLevel
          Caption = 'Sucursales'
          GridView = tvSucursales
          MaxDetailHeight = 250
          Options.DetailTabsPosition = dtpTop
          object lvDomiciliosEntrega: TcxGridLevel
            Caption = 'Domicilios de Entrega'
            GridView = tvDomiciliosEntrega
          end
          object lvContactos: TcxGridLevel
            Caption = 'Contactos'
            GridView = cvContactos
          end
          object lvClasificadores: TcxGridLevel
            Caption = 'Clasificadores'
            GridView = tvClasificadores
          end
        end
      end
      object cxDBCheckBox2: TcxDBCheckBox
        Left = 634
        Top = 41
        DataBinding.DataField = 'Activo'
        DataBinding.DataSource = dsCliente
        Properties.Alignment = taLeftJustify
        Style.HotTrack = False
        TabOrder = 2
        Transparent = True
        Width = 43
      end
      object cxDBMaskEdit1: TcxDBMaskEdit
        Left = 89
        Top = 125
        DataBinding.DataField = 'Cuit'
        DataBinding.DataSource = dsSujImp
        Style.HotTrack = False
        TabOrder = 3
        OnExit = cxDBMaskEdit1Exit
        Width = 96
      end
      object cxDBTextEdit6: TcxDBTextEdit
        Left = 394
        Top = 250
        DataBinding.DataField = 'Fax'
        DataBinding.DataSource = dsCliente
        Style.HotTrack = False
        TabOrder = 13
        Width = 243
      end
      object cxDBTextEdit10: TcxDBTextEdit
        Left = 710
        Top = 250
        DataBinding.DataField = 'Email'
        DataBinding.DataSource = dsCliente
        Style.HotTrack = False
        TabOrder = 14
        Width = 243
      end
      object cxDBButtonEdit3: TcxDBButtonEdit
        Left = 120
        Top = 568
        DataBinding.DataField = 'cod_vend'
        DataBinding.DataSource = dsCliente
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = cxDBButtonEdit3PropertiesButtonClick
        Style.HotTrack = False
        TabOrder = 18
        Width = 105
      end
      object cxDBTextEdit11: TcxDBTextEdit
        Left = 231
        Top = 568
        DataBinding.DataField = 'des_vend'
        DataBinding.DataSource = dsCliente
        Properties.ReadOnly = True
        Style.HotTrack = False
        TabOrder = 19
        Width = 260
      end
      object cxDBButtonEdit4: TcxDBButtonEdit
        Left = 581
        Top = 568
        DataBinding.DataField = 'cod_repre'
        DataBinding.DataSource = dsCliente
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = cxDBButtonEdit4PropertiesButtonClick
        Style.HotTrack = False
        TabOrder = 20
        Width = 105
      end
      object cxDBTextEdit12: TcxDBTextEdit
        Left = 692
        Top = 568
        DataBinding.DataField = 'des_repre'
        DataBinding.DataSource = dsCliente
        Properties.ReadOnly = True
        Style.HotTrack = False
        TabOrder = 21
        Width = 260
      end
      object cxDBTextEdit13: TcxDBTextEdit
        Left = 1044
        Top = 568
        DataBinding.DataField = 'NroProveedor'
        DataBinding.DataSource = dsCliente
        Style.HotTrack = False
        TabOrder = 22
        Width = 105
      end
      object jktExpDBGrid5: TjktExpDBGrid
        Left = 10000
        Top = 10000
        Width = 839
        Height = 250
        TabOrder = 24
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
      object lcMainGroup_Root: TdxLayoutGroup
        AlignHorz = ahClient
        AlignVert = avTop
        ButtonOptions.Buttons = <>
        Hidden = True
        ItemIndex = 1
        ShowBorder = False
        Index = -1
      end
      object lcMainGroup1: TdxLayoutGroup
        CaptionOptions.Text = 'Datos del Cliente'
        Parent = lcMainGroup_Root
        ButtonOptions.Buttons = <>
        LayoutDirection = ldHorizontal
        Index = 0
      end
      object lcMainItem1: TdxLayoutItem
        CaptionOptions.Text = 'Cliente :'
        Parent = lcMainGroup1
        Control = cxDBTextEdit1
        ControlOptions.AlignHorz = ahLeft
        ControlOptions.AutoControlAreaAlignment = False
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainItem2: TdxLayoutItem
        CaptionOptions.Text = 'Raz'#243'n Social :'
        Parent = lcMainGroup1
        Control = cxDBTextEdit2
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object lcMainGroup2: TdxLayoutGroup
        CaptionOptions.Text = 'New Group'
        Parent = lcMainGroup_Root
        ButtonOptions.Buttons = <>
        Hidden = True
        ItemIndex = 3
        ShowBorder = False
        Index = 1
      end
      object lcMainGroup3: TdxLayoutGroup
        CaptionOptions.Text = 'Datos Legales / Impositivos'
        Parent = lcMainGroup2
        ButtonOptions.Buttons = <>
        ButtonOptions.ShowExpandButton = True
        ItemControlAreaAlignment = catOwn
        Index = 0
      end
      object lcMainGroup4: TdxLayoutGroup
        CaptionOptions.Text = 'Datos Comerciales'
        Parent = lcMainGroup2
        ButtonOptions.Buttons = <>
        ButtonOptions.ShowExpandButton = True
        Index = 1
      end
      object lcMainGroup5: TdxLayoutGroup
        CaptionOptions.Text = 'Sucursales'
        Parent = lcMainGroup2
        ButtonOptions.Buttons = <>
        ButtonOptions.ShowExpandButton = True
        Expanded = False
        Index = 4
      end
      object lcMainGroup6: TdxLayoutGroup
        CaptionOptions.Text = 'Domicilio Fiscal'
        Parent = lcMainGroup3
        ButtonOptions.Buttons = <>
        ButtonOptions.ShowExpandButton = True
        Index = 1
      end
      object lcMainItem3: TdxLayoutItem
        CaptionOptions.Text = 'Direcci'#243'n :'
        Parent = lcMainGroup11
        Control = cxDBTextEdit3
        ControlOptions.AlignHorz = ahLeft
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainItem4: TdxLayoutItem
        CaptionOptions.Text = 'Localidad :'
        Parent = lcMainGroup11
        Control = cxDBTextEdit4
        ControlOptions.AlignHorz = ahLeft
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object lcMainItem5: TdxLayoutItem
        CaptionOptions.Text = 'Provincia :'
        Parent = lcMainGroup7
        Control = cxDBButtonEdit1
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainItem6: TdxLayoutItem
        CaptionOptions.Text = 'Pa'#237's :'
        Parent = lcMainGroup7
        Control = cxDBButtonEdit2
        ControlOptions.ShowBorder = False
        Index = 2
      end
      object lcMainItem7: TdxLayoutItem
        CaptionOptions.Text = 'Cod. Postal :'
        Parent = lcMainGroup11
        Control = cxDBTextEdit7
        ControlOptions.AlignHorz = ahLeft
        ControlOptions.ShowBorder = False
        Index = 2
      end
      object lcMainItem8: TdxLayoutItem
        CaptionOptions.Text = 'cxDBTextEdit8'
        CaptionOptions.Visible = False
        Parent = lcMainGroup7
        Control = cxDBTextEdit8
        ControlOptions.ShowBorder = False
        Enabled = False
        Index = 1
      end
      object lcMainItem9: TdxLayoutItem
        CaptionOptions.Text = 'cxDBTextEdit9'
        CaptionOptions.Visible = False
        Parent = lcMainGroup7
        Control = cxDBTextEdit9
        ControlOptions.ShowBorder = False
        Enabled = False
        Index = 3
      end
      object lcMainGroup7: TdxLayoutGroup
        CaptionOptions.Text = 'Hidden Group'
        Parent = lcMainGroup6
        ButtonOptions.Buttons = <>
        Hidden = True
        LayoutDirection = ldHorizontal
        ShowBorder = False
        Index = 1
      end
      object lcMainItem10: TdxLayoutItem
        CaptionOptions.Text = 'Tel'#233'fonos :'
        Parent = lcMainGroup12
        Control = cxDBTextEdit5
        ControlOptions.AlignHorz = ahLeft
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainItem11: TdxLayoutItem
        CaptionOptions.Text = 'CUIT :'
        Parent = lcMainGroup10
        Control = cxDBMaskEdit1
        ControlOptions.AlignHorz = ahLeft
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainItem12: TdxLayoutItem
        CaptionOptions.Text = 'Persona Jur'#237'dica :'
        Parent = lcMainGroup10
        Control = cxDBCheckBox1
        ControlOptions.AlignHorz = ahLeft
        ControlOptions.AutoControlAreaAlignment = False
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object lcMainGroup8: TdxLayoutGroup
        CaptionOptions.Text = 'Inscripciones Impositivas'
        Parent = lcMainGroup3
        ButtonOptions.Buttons = <>
        ButtonOptions.ShowExpandButton = True
        Index = 2
      end
      object lcMainItem13: TdxLayoutItem
        CaptionOptions.Visible = False
        Parent = lcMainGroup8
        Control = jktExpDBGrid1
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainGroup9: TdxLayoutGroup
        CaptionOptions.Text = 'Clasificadores del Cliente'
        Parent = lcMainGroup2
        ButtonOptions.Buttons = <>
        ButtonOptions.ShowExpandButton = True
        Expanded = False
        Index = 2
      end
      object lcMainItem14: TdxLayoutItem
        CaptionOptions.Visible = False
        Parent = lcMainGroup9
        Control = jktExpDBGrid2
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainItem16: TdxLayoutItem
        CaptionOptions.Text = 'Condici'#243'n de Pago :'
        Parent = lcMainGroup13
        Control = cxButtonEdit1
        ControlOptions.AlignHorz = ahLeft
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainItem15: TdxLayoutItem
        CaptionOptions.Visible = False
        Parent = lcMainGroup13
        Control = cxTextEdit1
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object lcMainItem17: TdxLayoutItem
        CaptionOptions.Text = 'jktExpDBGrid3'
        CaptionOptions.Visible = False
        Parent = lcMainGroup5
        Control = jktExpDBGrid3
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainItem18: TdxLayoutItem
        CaptionOptions.Text = 'Activo :'
        Parent = lcMainGroup1
        Control = cxDBCheckBox2
        ControlOptions.ShowBorder = False
        Index = 2
      end
      object lcMainGroup11: TdxLayoutGroup
        CaptionOptions.Text = 'Hidden Group'
        Parent = lcMainGroup6
        ButtonOptions.Buttons = <>
        Hidden = True
        LayoutDirection = ldHorizontal
        ShowBorder = False
        Index = 0
      end
      object lcMainGroup10: TdxLayoutGroup
        CaptionOptions.Text = 'New Group'
        CaptionOptions.Visible = False
        Parent = lcMainGroup3
        ButtonOptions.Buttons = <>
        LayoutDirection = ldHorizontal
        Index = 0
      end
      object lcMainGroup12: TdxLayoutGroup
        CaptionOptions.Text = 'Hidden Group'
        Parent = lcMainGroup6
        ButtonOptions.Buttons = <>
        Hidden = True
        LayoutDirection = ldHorizontal
        ShowBorder = False
        Index = 2
      end
      object lcMainItem19: TdxLayoutItem
        CaptionOptions.Text = 'Fax :'
        Parent = lcMainGroup12
        Control = cxDBTextEdit6
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object lcMainItem20: TdxLayoutItem
        CaptionOptions.Text = 'E-mail :'
        Parent = lcMainGroup12
        Control = cxDBTextEdit10
        ControlOptions.ShowBorder = False
        Index = 2
      end
      object lcMainItem21: TdxLayoutItem
        CaptionOptions.Visible = False
        Parent = lcMainGroup14
        Control = cxDBTextEdit11
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object lcMainItem22: TdxLayoutItem
        CaptionOptions.Text = 'Vendedor :'
        Parent = lcMainGroup14
        Control = cxDBButtonEdit3
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainGroup13: TdxLayoutGroup
        CaptionOptions.Text = 'Hidden Group'
        Parent = lcMainGroup4
        ButtonOptions.Buttons = <>
        Hidden = True
        LayoutDirection = ldHorizontal
        ShowBorder = False
        Index = 0
      end
      object lcMainGroup14: TdxLayoutGroup
        CaptionOptions.Text = 'Hidden Group'
        Parent = lcMainGroup4
        ButtonOptions.Buttons = <>
        Hidden = True
        LayoutDirection = ldHorizontal
        ShowBorder = False
        Index = 2
      end
      object lcMainItem23: TdxLayoutItem
        CaptionOptions.Text = 'Representante :'
        Parent = lcMainGroup14
        Control = cxDBButtonEdit4
        ControlOptions.ShowBorder = False
        Index = 2
      end
      object lcMainItem24: TdxLayoutItem
        CaptionOptions.Visible = False
        Parent = lcMainGroup14
        Control = cxDBTextEdit12
        ControlOptions.ShowBorder = False
        Index = 3
      end
      object lcMainSeparatorItem1: TdxLayoutSeparatorItem
        CaptionOptions.Text = 'Separator'
        Parent = lcMainGroup4
        SizeOptions.AssignedValues = [sovSizableHorz, sovSizableVert]
        SizeOptions.SizableHorz = False
        SizeOptions.SizableVert = False
        Index = 1
      end
      object lcMainItem25: TdxLayoutItem
        CaptionOptions.Text = 'Nro. Proveedor :'
        Parent = lcMainGroup14
        Control = cxDBTextEdit13
        ControlOptions.AlignHorz = ahLeft
        ControlOptions.ShowBorder = False
        Index = 4
      end
      object lcMainGroup15: TdxLayoutGroup
        CaptionOptions.Text = 'Archivos del Cliente'
        Parent = lcMainGroup2
        ButtonOptions.Buttons = <>
        Expanded = False
        Index = 3
      end
      object lcMainItem26: TdxLayoutItem
        CaptionOptions.Layout = clTop
        Parent = lcMainGroup15
        Control = jktExpDBGrid5
        ControlOptions.ShowBorder = False
        Index = 0
      end
    end
  end
  inherited BarManager: TdxBarManager
    Left = 256
    Top = 24
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited Driver: TjktDriver
    DataSetCab = mtCliente
    TipoPrograma = tp_abmIndividual
    Filtro = Help
    FocoEnAlta = mtClienteCodigo
    OperacionesIniciales = <
      item
        Operacion = OperTraerClasifSucur
      end
      item
        Operacion = opTraerParametro
      end>
    OperacionesDefault = <
      item
        Operacion = OperTraerClasifCliente
      end>
    OnNuevo = DriverNuevo
    Left = 480
    Top = 24
  end
  inherited IdHTTP: TIdHTTP
    Left = 376
    Top = 24
  end
  inherited Service: TjktServiceCaller
    Left = 320
    Top = 24
  end
  inherited OperacionSave: TjktOperacion
    OperName = 'GuardarCliente'
    Atributos = <
      item
        Dataset = mtSujImp
        Tag = 0
      end
      item
        Dataset = mtInscripImposit
        Tag = 0
      end
      item
        Dataset = mtClasificadoresCliente
        Tag = 0
      end
      item
        Dataset = mtSucursalesCliente
        Tag = 0
      end
      item
        Dataset = mtDomiciliosEntrega
        Tag = 0
      end
      item
        Dataset = mtContactos
        Tag = 0
      end
      item
        Dataset = mtClasificadoresSucursal
        Tag = 0
      end>
    OnBeforeEjecutar = OperacionSaveBeforeEjecutar
    OnAfterEjecutar = OperacionSaveAfterEjecutar
    Left = 544
    Top = 24
  end
  inherited mtParametroInicial: TjktMemTable
    Left = 632
    Top = 24
    object mtParametroInicialOutputDatasetName: TStringField
      FieldName = 'OutputDatasetName'
      Size = 40
    end
    object mtParametroInicialNombreParametro: TStringField
      FieldName = 'NombreParametro'
      Size = 100
    end
  end
  inherited OperacionTraer: TjktOperacion
    OperName = 'TraerCliente'
    Atributos = <
      item
        Attribute = 'oid'
        Field = mtClienteoid_Cliente
        Tag = 0
      end>
    Left = 544
    Top = 80
  end
  inherited ValidadorForm: TjktValidadorForm
    ListaValidaciones = <
      item
        Field = mtSujImpCodProvincia
        ValidadorGral = ValProvincia
      end
      item
        Field = mtSujImpCodPais
        ValidadorGral = ValPais
      end
      item
        Field = mtClienteCodCondPago
        ValidadorGral = ValCondPago
      end
      item
        Field = mtInscripImpositCodCategoria
        ValidadorGral = ValCategoriaImp
      end>
    Left = 176
    Top = 24
  end
  inherited mtParametrosForm: TjktMemTable
    Left = 632
    Top = 80
    object mtParametrosFormoid_param: TIntegerField
      FieldName = 'oid_param'
    end
    object mtParametrosFormcodigo: TStringField
      FieldName = 'codigo'
      Size = 30
    end
    object mtParametrosFormdescripcion: TStringField
      FieldName = 'descripcion'
      Size = 50
    end
    object mtParametrosFormvalor_cadena: TStringField
      FieldName = 'valor_cadena'
      Size = 100
    end
    object mtParametrosFormvalor_entero: TIntegerField
      FieldName = 'valor_entero'
    end
    object mtParametrosFormvalor_fecha: TStringField
      FieldName = 'valor_fecha'
      Size = 10
    end
    object mtParametrosFormvalor_float: TFloatField
      FieldName = 'valor_float'
    end
    object mtParametrosFormvalor_boolean: TBooleanField
      FieldName = 'valor_boolean'
    end
  end
  object mtSucursalesCliente: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_SucClie'
        DataType = ftInteger
      end
      item
        Name = 'oid_Cliente'
        DataType = ftInteger
      end
      item
        Name = 'NroSucursal'
        DataType = ftSmallint
      end
      item
        Name = 'Descripcion'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Direccion'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Localidad'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CodPostal'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'oid_Provincia'
        DataType = ftInteger
      end
      item
        Name = 'CodProvincia'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DescProvincia'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'oid_Pais'
        DataType = ftInteger
      end
      item
        Name = 'dom_ent_fac'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'oid_Vendedor'
        DataType = ftInteger
      end
      item
        Name = 'CodVendedor'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'DescVendedor'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'oid_Representante'
        DataType = ftInteger
      end
      item
        Name = 'CodRepresentante'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'DescRepresentante'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Telefonos'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Activo'
        DataType = ftBoolean
      end>
    IndexFieldNames = 'oid_Cliente'
    IndexName = 'mtSucursalesClienteIndex'
    IndexDefs = <
      item
        Name = 'mtSucursalesClienteIndex'
        Fields = 'oid_Cliente'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    MasterFields = 'oid_Cliente'
    MasterSource = dsCliente
    Version = '7.12.10 CodeGear Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    OnNewRecord = mtSucursalesClienteNewRecord
    Left = 72
    Top = 304
    object mtSucursalesClienteoid_SucClie: TIntegerField
      Tag = 1
      FieldName = 'oid_SucClie'
    end
    object mtSucursalesClienteoid_Cliente: TIntegerField
      Tag = 1
      FieldName = 'oid_Cliente'
    end
    object mtSucursalesClienteNroSucursal: TSmallintField
      Tag = 1
      FieldName = 'NroSucursal'
    end
    object mtSucursalesClienteDescripcion: TStringField
      Tag = 1
      FieldName = 'Descripcion'
      Size = 50
    end
    object mtSucursalesClienteDireccion: TStringField
      Tag = 1
      FieldName = 'Direccion'
      Size = 50
    end
    object mtSucursalesClienteLocalidad: TStringField
      Tag = 1
      FieldName = 'Localidad'
      Size = 50
    end
    object mtSucursalesClienteCodPostal: TStringField
      Tag = 1
      FieldName = 'CodPostal'
      Size = 10
    end
    object mtSucursalesClienteoid_Provincia: TIntegerField
      Tag = 1
      FieldName = 'oid_Provincia'
    end
    object mtSucursalesClienteCodProvincia: TStringField
      FieldName = 'CodProvincia'
    end
    object mtSucursalesClienteDescProvincia: TStringField
      FieldName = 'DescProvincia'
      Size = 50
    end
    object mtSucursalesClienteoid_Pais: TIntegerField
      Tag = 1
      FieldName = 'oid_Pais'
    end
    object mtSucursalesClientedom_ent_fac: TStringField
      Tag = 1
      FieldName = 'dom_ent_fac'
      Size = 50
    end
    object mtSucursalesClienteoid_Vendedor: TIntegerField
      Tag = 1
      FieldName = 'oid_Vendedor'
    end
    object mtSucursalesClienteCodVendedor: TStringField
      FieldName = 'CodVendedor'
      Size = 15
    end
    object mtSucursalesClienteDescVendedor: TStringField
      FieldName = 'DescVendedor'
      Size = 40
    end
    object mtSucursalesClienteoid_Representante: TIntegerField
      Tag = 1
      FieldName = 'oid_Representante'
    end
    object mtSucursalesClienteCodRepresentante: TStringField
      FieldName = 'CodRepresentante'
      Size = 15
    end
    object mtSucursalesClienteDescRepresentante: TStringField
      FieldName = 'DescRepresentante'
      Size = 40
    end
    object mtSucursalesClienteTelefonos: TStringField
      Tag = 1
      FieldName = 'Telefonos'
      Size = 50
    end
    object mtSucursalesClienteActivo: TBooleanField
      Tag = 1
      FieldName = 'Activo'
    end
  end
  object mtDomiciliosEntrega: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_DomSuc'
        DataType = ftInteger
      end
      item
        Name = 'oid_SucClie'
        DataType = ftInteger
      end
      item
        Name = 'NroDomicilio'
        DataType = ftSmallint
      end
      item
        Name = 'Descripcion'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Direccion'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Localidad'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CodPostal'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'oid_Provincia'
        DataType = ftInteger
      end
      item
        Name = 'CodProvincia'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DescProvincia'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'oid_Pais'
        DataType = ftInteger
      end
      item
        Name = 'HorariosEntrega'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Telefonos'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Activo'
        DataType = ftBoolean
      end>
    IndexFieldNames = 'oid_SucClie'
    IndexDefs = <
      item
        Name = 'mtDomiciliosEntregaIndex'
        Fields = 'oid_SucClie'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    MasterFields = 'oid_SucClie'
    Version = '7.12.10 CodeGear Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    OnNewRecord = mtDomiciliosEntregaNewRecord
    Left = 112
    Top = 360
    object mtDomiciliosEntregaoid_DomSuc: TIntegerField
      Tag = 1
      FieldName = 'oid_DomSuc'
    end
    object mtDomiciliosEntregaoid_SucClie: TIntegerField
      Tag = 1
      FieldName = 'oid_SucClie'
    end
    object mtDomiciliosEntregaNroDomicilio: TSmallintField
      Tag = 1
      FieldName = 'NroDomicilio'
    end
    object mtDomiciliosEntregaDescripcion: TStringField
      Tag = 1
      FieldName = 'Descripcion'
      Size = 50
    end
    object mtDomiciliosEntregaDireccion: TStringField
      Tag = 1
      FieldName = 'Direccion'
      Size = 50
    end
    object mtDomiciliosEntregaLocalidad: TStringField
      Tag = 1
      FieldName = 'Localidad'
      Size = 50
    end
    object mtDomiciliosEntregaCodPostal: TStringField
      Tag = 1
      FieldName = 'CodPostal'
      Size = 10
    end
    object mtDomiciliosEntregaoid_Provincia: TIntegerField
      Tag = 1
      FieldName = 'oid_Provincia'
    end
    object mtDomiciliosEntregaCodProvincia: TStringField
      FieldName = 'CodProvincia'
    end
    object mtDomiciliosEntregaDescProvincia: TStringField
      FieldName = 'DescProvincia'
      Size = 50
    end
    object mtDomiciliosEntregaoid_Pais: TIntegerField
      Tag = 1
      FieldName = 'oid_Pais'
    end
    object mtDomiciliosEntregaHorariosEntrega: TStringField
      Tag = 1
      FieldName = 'HorariosEntrega'
      Size = 100
    end
    object mtDomiciliosEntregaTelefonos: TStringField
      Tag = 1
      FieldName = 'Telefonos'
      Size = 50
    end
    object mtDomiciliosEntregaActivo: TBooleanField
      Tag = 1
      FieldName = 'Activo'
    end
  end
  object mtContactos: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_ContSuc'
        DataType = ftInteger
      end
      item
        Name = 'oid_SucClie'
        DataType = ftInteger
      end
      item
        Name = 'oid_TipoContacto'
        DataType = ftInteger
      end
      item
        Name = 'Apellido'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Nombres'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Cargo'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Telefonos'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Email'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Activo'
        DataType = ftBoolean
      end>
    IndexFieldNames = 'oid_SucClie'
    IndexName = 'mtContactosIndex'
    IndexDefs = <
      item
        Name = 'mtContactosIndex'
        Fields = 'oid_SucClie'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    MasterFields = 'oid_SucClie'
    Version = '7.12.10 CodeGear Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    OnNewRecord = mtContactosNewRecord
    Left = 216
    Top = 360
    object mtContactosoid_ContSuc: TIntegerField
      Tag = 1
      FieldName = 'oid_ContSuc'
    end
    object mtContactosoid_SucClie: TIntegerField
      Tag = 1
      FieldName = 'oid_SucClie'
    end
    object mtContactosoid_TipoContacto: TIntegerField
      Tag = 1
      FieldName = 'oid_TipoContacto'
    end
    object mtContactosApellidoYNombre: TStringField
      Tag = 1
      FieldName = 'ApellidoYNombre'
      Size = 70
    end
    object mtContactosCargo: TStringField
      Tag = 1
      FieldName = 'Cargo'
      Size = 50
    end
    object mtContactosTelefono: TStringField
      Tag = 1
      FieldName = 'Telefono'
      Size = 50
    end
    object mtContactosTelefonoAlternativo: TStringField
      Tag = 1
      FieldName = 'TelefonoAlternativo'
      Size = 50
    end
    object mtContactosCelular: TStringField
      Tag = 1
      FieldName = 'Celular'
      Size = 50
    end
    object mtContactosEmail: TStringField
      Tag = 1
      FieldName = 'Email'
      Size = 50
    end
    object mtContactosActivo: TBooleanField
      Tag = 1
      FieldName = 'Activo'
    end
  end
  object mtClasificadoresSucursal: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_ClasifSuc'
        DataType = ftInteger
      end
      item
        Name = 'oid_SucClie'
        DataType = ftInteger
      end
      item
        Name = 'oid_Clasif'
        DataType = ftInteger
      end
      item
        Name = 'DescClasif'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'oid_ValorClasif'
        DataType = ftInteger
      end
      item
        Name = 'CodValorClasif'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DescValorClasif'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Activo'
        DataType = ftBoolean
      end>
    IndexFieldNames = 'oid_SucClie'
    IndexDefs = <
      item
        Name = 'mtClasificadoresSucursalIndex'
        Fields = 'oid_SucClie'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    MasterFields = 'oid_SucClie'
    Version = '7.12.10 CodeGear Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    OnNewRecord = mtClasificadoresSucursalNewRecord
    Left = 328
    Top = 360
    object mtClasificadoresSucursaloid_ClasifSuc: TIntegerField
      Tag = 1
      FieldName = 'oid_ClasifSuc'
    end
    object mtClasificadoresSucursaloid_SucClie: TIntegerField
      Tag = 1
      FieldName = 'oid_SucClie'
    end
    object mtClasificadoresSucursaloid_Clasif: TIntegerField
      Tag = 1
      FieldName = 'oid_Clasif'
    end
    object mtClasificadoresSucursalDescClasif: TStringField
      FieldName = 'DescClasif'
      Size = 30
    end
    object mtClasificadoresSucursaloid_ValorClasif: TIntegerField
      Tag = 1
      FieldName = 'oid_ValorClasif'
    end
    object mtClasificadoresSucursalCodValorClasif: TStringField
      FieldName = 'CodValorClasif'
    end
    object mtClasificadoresSucursalDescValorClasif: TStringField
      FieldName = 'DescValorClasif'
      Size = 30
    end
    object mtClasificadoresSucursalActivo: TBooleanField
      Tag = 1
      FieldName = 'Activo'
    end
  end
  object dsSucursalesCliente: TDataSource
    DataSet = mtSucursalesCliente
    Left = 112
    Top = 304
  end
  object dsDomiciliosEntrega: TDataSource
    DataSet = mtDomiciliosEntrega
    Left = 152
    Top = 360
  end
  object dsContactos: TDataSource
    DataSet = mtContactos
    Left = 256
    Top = 360
  end
  object dsClasificadoresSucursal: TDataSource
    DataSet = mtClasificadoresSucursal
    Left = 368
    Top = 360
  end
  object mtCliente: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_Cliente'
        DataType = ftInteger
      end
      item
        Name = 'Codigo'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Telefonos'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Fax'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Email'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'oid_CondPago'
        DataType = ftInteger
      end
      item
        Name = 'CodCondPago'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'DescCondPago'
        DataType = ftString
        Size = 100
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
        Name = 'NroProveedor'
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
    Left = 480
    Top = 168
    object mtClienteoid_Cliente: TIntegerField
      Tag = 1
      FieldName = 'oid_Cliente'
    end
    object mtClienteCodigo: TStringField
      Tag = 1
      FieldName = 'Codigo'
      Size = 15
    end
    object mtClienteTelefonos: TStringField
      Tag = 1
      FieldName = 'Telefonos'
      OnChange = mtClienteTelefonosChange
      Size = 50
    end
    object mtClienteFax: TStringField
      Tag = 1
      FieldName = 'Fax'
      Size = 50
    end
    object mtClienteEmail: TStringField
      Tag = 1
      FieldName = 'Email'
      Size = 50
    end
    object mtClienteoid_CondPago: TIntegerField
      Tag = 1
      FieldName = 'oid_CondPago'
    end
    object mtClienteCodCondPago: TStringField
      FieldName = 'CodCondPago'
      Size = 50
    end
    object mtClienteDescCondPago: TStringField
      FieldName = 'DescCondPago'
      Size = 100
    end
    object mtClienteoid_vend: TIntegerField
      Tag = 1
      FieldName = 'oid_vend'
    end
    object mtClientecod_vend: TStringField
      FieldName = 'cod_vend'
      Size = 15
    end
    object mtClientedes_vend: TStringField
      FieldName = 'des_vend'
      OnChange = mtClientedes_vendChange
      Size = 40
    end
    object mtClienteoid_repre: TIntegerField
      Tag = 1
      FieldName = 'oid_repre'
    end
    object mtClientecod_repre: TStringField
      FieldName = 'cod_repre'
      Size = 15
    end
    object mtClientedes_repre: TStringField
      FieldName = 'des_repre'
      Size = 40
    end
    object mtClienteNroProveedor: TStringField
      Tag = 1
      FieldName = 'NroProveedor'
      Size = 15
    end
    object mtClienteActivo: TBooleanField
      Tag = 1
      FieldName = 'Activo'
    end
  end
  object mtInscripImposit: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_InscClie'
        DataType = ftInteger
      end
      item
        Name = 'oid_Cliente'
        DataType = ftInteger
      end
      item
        Name = 'oid_Impuesto'
        DataType = ftInteger
      end
      item
        Name = 'CodImpuesto'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'DescImpuesto'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'NroInscripcion'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'oid_Categoria'
        DataType = ftInteger
      end
      item
        Name = 'CodCategoria'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'DescCategoria'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'VigenciaDesde'
        DataType = ftDate
      end
      item
        Name = 'Activo'
        DataType = ftBoolean
      end>
    IndexFieldNames = 'oid_Cliente'
    IndexDefs = <
      item
        Name = 'mtInscripImpositIndex'
        Fields = 'oid_Cliente'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    MasterFields = 'oid_Cliente'
    MasterSource = dsSujImp
    Version = '7.12.10 CodeGear Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    Left = 480
    Top = 216
    object mtInscripImpositoid_InscClie: TIntegerField
      Tag = 1
      FieldName = 'oid_InscClie'
    end
    object mtInscripImpositoid_Cliente: TIntegerField
      Tag = 1
      FieldName = 'oid_Cliente'
    end
    object mtInscripImpositoid_Impuesto: TIntegerField
      Tag = 1
      FieldName = 'oid_Impuesto'
    end
    object mtInscripImpositCodImpuesto: TStringField
      FieldName = 'CodImpuesto'
      Size = 15
    end
    object mtInscripImpositDescImpuesto: TStringField
      FieldName = 'DescImpuesto'
      Size = 100
    end
    object mtInscripImpositNroInscripcion: TStringField
      Tag = 1
      FieldName = 'NroInscripcion'
    end
    object mtInscripImpositoid_Categoria: TIntegerField
      Tag = 1
      FieldName = 'oid_Categoria'
    end
    object mtInscripImpositCodCategoria: TStringField
      FieldName = 'CodCategoria'
      Size = 15
    end
    object mtInscripImpositDescCategoria: TStringField
      FieldName = 'DescCategoria'
      Size = 100
    end
    object mtInscripImpositVigenciaDesde: TDateField
      Tag = 1
      FieldName = 'VigenciaDesde'
    end
    object mtInscripImpositActivo: TBooleanField
      Tag = 1
      FieldName = 'Activo'
    end
  end
  object mtClasificadoresCliente: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_ClasifClie'
        DataType = ftInteger
      end
      item
        Name = 'oid_Cliente'
        DataType = ftInteger
      end
      item
        Name = 'DescClasif'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'oid_ValorClasif'
        DataType = ftInteger
      end
      item
        Name = 'CodValorClasif'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DescValorClasif'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Activo'
        DataType = ftBoolean
      end>
    IndexFieldNames = 'oid_Cliente'
    IndexDefs = <
      item
        Name = 'mtClasificadoresClienteIndex'
        Fields = 'oid_Cliente'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    MasterFields = 'oid_Cliente'
    MasterSource = dsCliente
    Version = '7.12.10 CodeGear Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    Left = 480
    Top = 264
    object mtClasificadoresClienteoid_ClasifClie: TIntegerField
      Tag = 1
      FieldName = 'oid_ClasifClie'
    end
    object mtClasificadoresClienteoid_Cliente: TIntegerField
      Tag = 1
      FieldName = 'oid_Cliente'
    end
    object mtClasificadoresClienteoid_Clasif: TIntegerField
      Tag = 1
      FieldName = 'oid_Clasif'
    end
    object mtClasificadoresClienteDescClasif: TStringField
      FieldName = 'DescClasif'
      Size = 30
    end
    object mtClasificadoresClienteoid_ValorClasif: TIntegerField
      Tag = 1
      FieldName = 'oid_ValorClasif'
    end
    object mtClasificadoresClienteCodValorClasif: TStringField
      FieldName = 'CodValorClasif'
    end
    object mtClasificadoresClienteDescValorClasif: TStringField
      FieldName = 'DescValorClasif'
      Size = 30
    end
    object mtClasificadoresClienteActivo: TBooleanField
      Tag = 1
      FieldName = 'Activo'
    end
  end
  object dsCliente: TDataSource
    DataSet = mtCliente
    Left = 520
    Top = 168
  end
  object dsInscripcionesImpositivas: TDataSource
    DataSet = mtInscripImposit
    Left = 520
    Top = 216
  end
  object dsClasificadoresCliente: TDataSource
    DataSet = mtClasificadoresCliente
    Left = 520
    Top = 264
  end
  object Help: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'clientes'
    TipoFiltro = fi_Activos
    OidRespuesta = mtClienteoid_Cliente
    Left = 480
    Top = 80
  end
  object OperTraerClasifCliente: TjktOperacion
    OperName = 'TraerClasifCliente'
    EnviarTodo = False
    Atributos = <>
    ServiceCaller = Service
    OnAfterEjecutar = OperTraerClasifClienteAfterEjecutar
    Left = 752
    Top = 24
  end
  object OperTraerClasifSucur: TjktOperacion
    OperName = 'TraerClasifSucur'
    EnviarTodo = False
    Atributos = <>
    ServiceCaller = Service
    OnBeforeEjecutar = OperTraerClasifSucurBeforeEjecutar
    OnAfterEjecutar = OperTraerClasifSucurAfterEjecutar
    Left = 752
    Top = 80
  end
  object mtSujImp: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_SujImp'
        DataType = ftInteger
      end
      item
        Name = 'oid_Cliente'
        DataType = ftInteger
      end
      item
        Name = 'RazonSocial'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Direccion'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Localidad'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CodPostal'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'oid_Provincia'
        DataType = ftInteger
      end
      item
        Name = 'CodProvincia'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DescProvincia'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'oid_Pais'
        DataType = ftInteger
      end
      item
        Name = 'CodPais'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DescPais'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'PersonaJuridica'
        DataType = ftBoolean
      end
      item
        Name = 'Cuit'
        DataType = ftString
        Size = 20
      end>
    IndexFieldNames = 'oid_Cliente'
    IndexDefs = <
      item
        Name = 'mtSujImpIndex'
        Fields = 'oid_Cliente'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    MasterFields = 'oid_Cliente'
    MasterSource = dsCliente
    Version = '7.12.10 CodeGear Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    OnNewRecord = mtSujImpNewRecord
    Left = 576
    Top = 168
    object mtSujImpoid_SujImp: TIntegerField
      Tag = 1
      FieldName = 'oid_SujImp'
    end
    object mtSujImpoid_Cliente: TIntegerField
      Tag = 1
      FieldName = 'oid_Cliente'
    end
    object mtSujImpRazonSocial: TStringField
      Tag = 1
      FieldName = 'RazonSocial'
      Size = 100
    end
    object mtSujImpDireccion: TStringField
      Tag = 1
      FieldName = 'Direccion'
      OnChange = mtSujImpDireccionChange
      Size = 50
    end
    object mtSujImpLocalidad: TStringField
      Tag = 1
      FieldName = 'Localidad'
      OnChange = mtSujImpLocalidadChange
      Size = 50
    end
    object mtSujImpCodPostal: TStringField
      Tag = 1
      FieldName = 'CodPostal'
      OnChange = mtSujImpCodPostalChange
      Size = 10
    end
    object mtSujImpoid_Provincia: TIntegerField
      Tag = 1
      FieldName = 'oid_Provincia'
    end
    object mtSujImpCodProvincia: TStringField
      FieldName = 'CodProvincia'
      OnChange = mtSujImpCodProvinciaChange
    end
    object mtSujImpDescProvincia: TStringField
      FieldName = 'DescProvincia'
      Size = 50
    end
    object mtSujImpoid_Pais: TIntegerField
      Tag = 1
      FieldName = 'oid_Pais'
    end
    object mtSujImpCodPais: TStringField
      FieldName = 'CodPais'
    end
    object mtSujImpDescPais: TStringField
      FieldName = 'DescPais'
      Size = 50
    end
    object mtSujImpPersonaJuridica: TBooleanField
      Tag = 1
      FieldName = 'PersonaJuridica'
    end
    object mtSujImpCuit: TStringField
      Tag = 1
      FieldName = 'Cuit'
      EditMask = '00-00000000-0;1;_'
    end
  end
  object dsSujImp: TDataSource
    DataSet = mtSujImp
    Left = 616
    Top = 168
  end
  object HelpProvincia: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'provincia'
    TipoFiltro = fi_Activos
    OidRespuesta = mtSujImpoid_Provincia
    CodigoRespuesta = mtSujImpCodProvincia
    Left = 40
    Top = 168
  end
  object HelpPais: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'pais'
    TipoFiltro = fi_Activos
    OidRespuesta = mtSujImpoid_Pais
    CodigoRespuesta = mtSujImpCodPais
    Left = 80
    Top = 168
  end
  object HelpCondPago: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'condicionPago'
    TipoFiltro = fi_Activos
    OidRespuesta = mtClienteoid_CondPago
    CodigoRespuesta = mtClienteCodCondPago
    Left = 120
    Top = 168
  end
  object ValProvincia: TjktValidador
    Entidad = 'provincia'
    Validacion = tExistente
    ListaAsignaciones = <
      item
        SourceName = 'oid'
        FieldTarget = mtSujImpoid_Provincia
      end
      item
        SourceName = 'Descripcion'
        FieldTarget = mtSujImpDescProvincia
      end>
    Left = 40
    Top = 224
  end
  object ValPais: TjktValidador
    Entidad = 'pais'
    Validacion = tExistente
    ListaAsignaciones = <
      item
        SourceName = 'oid'
        FieldTarget = mtSujImpoid_Pais
      end
      item
        SourceName = 'Descripcion'
        FieldTarget = mtSujImpDescPais
      end>
    Left = 80
    Top = 224
  end
  object ValCondPago: TjktValidador
    Entidad = 'condicionPago'
    Validacion = tExistente
    ListaAsignaciones = <
      item
        SourceName = 'oid'
        FieldTarget = mtClienteoid_CondPago
      end
      item
        SourceName = 'Descripcion'
        FieldTarget = mtClienteDescCondPago
      end>
    Left = 120
    Top = 224
  end
  object ValCategoriaImp: TjktValidador
    Entidad = 'categoriasImpuesto'
    EntidadMaestra = 'impuesto'
    OidEntidadMaestra = mtInscripImpositoid_Impuesto
    Validacion = tExistente
    ListaAsignaciones = <
      item
        SourceName = 'oid'
        FieldTarget = mtInscripImpositoid_Categoria
      end
      item
        SourceName = 'Descripcion'
        FieldTarget = mtInscripImpositDescCategoria
      end>
    Left = 320
    Top = 224
  end
  object HelpValorClasifCliente: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'valoresClasificador'
    OidEntidadMaestra = mtClasificadoresClienteoid_Clasif
    TipoFiltro = fi_ValoresClasificador
    OidRespuesta = mtClasificadoresClienteoid_ValorClasif
    CodigoRespuesta = mtClasificadoresClienteCodValorClasif
    Left = 360
    Top = 168
  end
  object HelpCategoriaImp: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'categoriasImpuesto'
    EntidadMaestra = 'impuesto'
    OidEntidadMaestra = mtInscripImpositoid_Impuesto
    TipoFiltro = fi_Activos
    OidRespuesta = mtInscripImpositoid_Categoria
    CodigoRespuesta = mtInscripImpositCodCategoria
    Left = 320
    Top = 168
  end
  object HelpValorClasifSucursal: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'valoresClasificador'
    OidEntidadMaestra = mtClasificadoresSucursaloid_Clasif
    TipoFiltro = fi_ValoresClasificador
    OidRespuesta = mtClasificadoresSucursaloid_ValorClasif
    CodigoRespuesta = mtClasificadoresSucursalCodValorClasif
    Left = 400
    Top = 168
  end
  object mtClasifSucurBackup: TjktMemTable
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
    Left = 328
    Top = 312
    object mtClasifSucurBackupoid_Clasif: TIntegerField
      FieldName = 'oid_Clasif'
    end
    object mtClasifSucurBackupDescClasif: TStringField
      FieldName = 'DescClasif'
      Size = 30
    end
  end
  object dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList
    Left = 128
    Top = 24
    object dxLayoutSkinLookAndFeel1: TdxLayoutSkinLookAndFeel
    end
  end
  object mtProvincias: TjktMemTable
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
    Left = 656
    Top = 264
    object mtProvinciasoid: TIntegerField
      FieldName = 'oid'
    end
    object mtProvinciascodigo: TStringField
      FieldName = 'codigo'
      Size = 15
    end
    object mtProvinciasdescripcion: TStringField
      FieldName = 'descripcion'
      Size = 100
    end
  end
  object mtVendedores: TjktMemTable
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
    Left = 656
    Top = 312
    object mtVendedoresoid: TIntegerField
      FieldName = 'oid'
    end
    object mtVendedorescodigo: TStringField
      FieldName = 'codigo'
      Size = 15
    end
    object mtVendedoresdescripcion: TStringField
      FieldName = 'descripcion'
      Size = 100
    end
  end
  object mtRepresentantes: TjktMemTable
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
    Left = 656
    Top = 360
    object mtRepresentantesoid: TIntegerField
      FieldName = 'oid'
    end
    object mtRepresentantescodigo: TStringField
      FieldName = 'codigo'
      Size = 15
    end
    object mtRepresentantesdescripcion: TStringField
      FieldName = 'descripcion'
      Size = 100
    end
  end
  object dsProvincias: TDataSource
    DataSet = mtProvincias
    Left = 696
    Top = 264
  end
  object dsVendedores: TDataSource
    DataSet = mtVendedores
    Left = 696
    Top = 312
  end
  object dsRepresentantes: TDataSource
    DataSet = mtRepresentantes
    Left = 696
    Top = 360
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
    Left = 736
    Top = 264
  end
  object opTraerParametro: TjktOperacion
    OperName = 'TraerParametro'
    EnviarTodo = False
    Atributos = <
      item
        Attribute = 'nombreParametro'
        Field = mtParametroInicialNombreParametro
        Tag = 0
      end>
    ServiceCaller = Service
    OnBeforeEjecutar = opTraerParametroBeforeEjecutar
    OnAfterEjecutar = opTraerParametroAfterEjecutar
    Left = 752
    Top = 136
  end
  object mtImpuestos: TjktMemTable
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
    Left = 656
    Top = 408
    object IntegerField1: TIntegerField
      FieldName = 'oid'
    end
    object StringField1: TStringField
      FieldName = 'codigo'
      Size = 15
    end
    object StringField2: TStringField
      FieldName = 'descripcion'
      Size = 100
    end
  end
  object hlpVend: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'vendedor'
    TipoFiltro = fi_Activos
    OidRespuesta = mtClienteoid_vend
    CodigoRespuesta = mtClientecod_vend
    Left = 192
    Top = 168
  end
  object hlpRepre: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'representante'
    TipoFiltro = fi_Activos
    OidRespuesta = mtClienteoid_repre
    CodigoRespuesta = mtClientecod_repre
    Left = 232
    Top = 168
  end
  object mtTiposContacto: TjktMemTable
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
    Left = 656
    Top = 456
    object mtTiposContactooid: TIntegerField
      FieldName = 'oid'
    end
    object mtTiposContactocodigo: TStringField
      FieldName = 'codigo'
      Size = 15
    end
    object mtTiposContactodescripcion: TStringField
      FieldName = 'descripcion'
      Size = 100
    end
  end
  object dsTiposContacto: TDataSource
    DataSet = mtTiposContacto
    Left = 696
    Top = 456
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
        Name = 'oid_Cliente'
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
    IndexFieldNames = 'oid_Cliente'
    IndexDefs = <
      item
        Name = 'mtArchivosIndex'
        Fields = 'oid_Cliente'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    MasterFields = 'oid_Cliente'
    MasterSource = dsCliente
    Version = '7.12.10 CodeGear Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    OnNewRecord = mtArchivosNewRecord
    Left = 480
    Top = 312
    object mtArchivosoid_arch: TIntegerField
      Tag = 1
      FieldName = 'oid_arch'
    end
    object mtArchivosoid_Cliente: TIntegerField
      Tag = 1
      FieldName = 'oid_Cliente'
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
    Left = 520
    Top = 312
  end
  object OpenDialog: TOpenDialog
    Left = 560
    Top = 312
  end
  object opTraerRutaCompartida: TjktOperacion
    OperName = 'TraerParametro'
    EnviarTodo = False
    Atributos = <
      item
        Attribute = 'nombreParametro'
        Field = mtParametroInicialNombreParametro
        Tag = 0
      end>
    ServiceCaller = Service
    OnBeforeEjecutar = opTraerRutaCompartidaBeforeEjecutar
    OnAfterEjecutar = opTraerRutaCompartidaAfterEjecutar
    Left = 792
    Top = 136
  end
end
