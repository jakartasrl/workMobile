inherited FNCli0001: TFNCli0001
  Caption = 'ABM de Clientes'
  ClientHeight = 520
  ClientWidth = 913
  ExplicitLeft = -164
  ExplicitWidth = 929
  ExplicitHeight = 558
  PixelsPerInch = 96
  TextHeight = 13
  object lcMain: TdxLayoutControl [0]
    Left = 0
    Top = 0
    Width = 913
    Height = 520
    Align = alClient
    TabOrder = 4
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 67
      Top = -23
      DataBinding.DataField = 'Codigo'
      DataBinding.DataSource = dsCliente
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 0
      Width = 150
    end
    object cxDBTextEdit2: TcxDBTextEdit
      Left = 321
      Top = -23
      DataBinding.DataField = 'RazonSocial'
      DataBinding.DataSource = dsSujImp
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 1
      Width = 293
    end
    object cxDBTextEdit3: TcxDBTextEdit
      Left = 93
      Top = 109
      DataBinding.DataField = 'Direccion'
      DataBinding.DataSource = dsSujImp
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 5
      Width = 243
    end
    object cxDBTextEdit4: TcxDBTextEdit
      Left = 398
      Top = 109
      DataBinding.DataField = 'Localidad'
      DataBinding.DataSource = dsSujImp
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 6
      Width = 243
    end
    object cxDBTextEdit7: TcxDBTextEdit
      Left = 714
      Top = 109
      DataBinding.DataField = 'CodPostal'
      DataBinding.DataSource = dsSujImp
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 7
      Width = 87
    end
    object cxDBTextEdit8: TcxDBTextEdit
      Left = 158
      Top = 136
      DataBinding.DataField = 'DescProvincia'
      DataBinding.DataSource = dsSujImp
      Enabled = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 9
      Width = 178
    end
    object cxDBTextEdit9: TcxDBTextEdit
      Left = 463
      Top = 136
      DataBinding.DataField = 'DescPais'
      DataBinding.DataSource = dsSujImp
      Enabled = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 11
      Width = 178
    end
    object cxDBButtonEdit1: TcxDBButtonEdit
      Left = 93
      Top = 136
      DataBinding.DataField = 'CodProvincia'
      DataBinding.DataSource = dsSujImp
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = cxDBButtonEdit1PropertiesButtonClick
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 8
      Width = 59
    end
    object cxDBButtonEdit2: TcxDBButtonEdit
      Left = 398
      Top = 136
      DataBinding.DataField = 'CodPais'
      DataBinding.DataSource = dsSujImp
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = cxDBButtonEdit2PropertiesButtonClick
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 10
      Width = 59
    end
    object cxDBTextEdit5: TcxDBTextEdit
      Left = 93
      Top = 163
      DataBinding.DataField = 'Telefonos'
      DataBinding.DataSource = dsCliente
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 12
      Width = 243
    end
    object cxDBTextEdit6: TcxDBTextEdit
      Left = 93
      Top = 52
      DataBinding.DataField = 'Cuit'
      DataBinding.DataSource = dsSujImp
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 3
      Width = 136
    end
    object cxDBCheckBox1: TcxDBCheckBox
      Left = 325
      Top = 52
      DataBinding.DataField = 'PersonaJuridica'
      DataBinding.DataSource = dsSujImp
      Properties.Alignment = taLeftJustify
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 4
      Width = 43
    end
    object jktExpDBGrid1: TjktExpDBGrid
      Left = 34
      Top = 220
      Width = 391
      Height = 200
      TabOrder = 13
      DataSource = dsInscripcionesImpositivas
      object jktExpDBGrid1DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsInscripcionesImpositivas
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsView.GroupByBox = False
        object jktExpDBGrid1DBTableView1oid_InscClie: TcxGridDBColumn
          DataBinding.FieldName = 'oid_InscClie'
        end
        object jktExpDBGrid1DBTableView1oid_Cliente: TcxGridDBColumn
          DataBinding.FieldName = 'oid_Cliente'
        end
        object jktExpDBGrid1DBTableView1oid_Impuesto: TcxGridDBColumn
          DataBinding.FieldName = 'oid_Impuesto'
        end
        object jktExpDBGrid1DBTableView1CodImpuesto: TcxGridDBColumn
          DataBinding.FieldName = 'CodImpuesto'
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.OnButtonClick = jktExpDBGrid1DBTableView1CodImpuestoPropertiesButtonClick
        end
        object jktExpDBGrid1DBTableView1DescImpuesto: TcxGridDBColumn
          DataBinding.FieldName = 'DescImpuesto'
          Options.Editing = False
          Width = 230
        end
        object jktExpDBGrid1DBTableView1NroInscripcion: TcxGridDBColumn
          DataBinding.FieldName = 'NroInscripcion'
          Width = 86
        end
        object jktExpDBGrid1DBTableView1oid_Categoria: TcxGridDBColumn
          DataBinding.FieldName = 'oid_Categoria'
          Width = 73
        end
        object jktExpDBGrid1DBTableView1CodCategoria: TcxGridDBColumn
          DataBinding.FieldName = 'CodCategoria'
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.OnButtonClick = jktExpDBGrid1DBTableView1CodCategoriaPropertiesButtonClick
          Width = 72
        end
        object jktExpDBGrid1DBTableView1DescCategoria: TcxGridDBColumn
          DataBinding.FieldName = 'DescCategoria'
          Options.Editing = False
          Width = 230
        end
        object jktExpDBGrid1DBTableView1VigenciaDesde: TcxGridDBColumn
          DataBinding.FieldName = 'VigenciaDesde'
          Width = 75
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
      Left = 22
      Top = 525
      Width = 391
      Height = 200
      TabOrder = 16
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
        end
        object cxGridDBTableView1oid_Cliente: TcxGridDBColumn
          DataBinding.FieldName = 'oid_Cliente'
        end
        object cxGridDBTableView1oid_Clasif: TcxGridDBColumn
          DataBinding.FieldName = 'oid_Clasif'
        end
        object cxGridDBTableView1DescClasif: TcxGridDBColumn
          DataBinding.FieldName = 'DescClasif'
          Options.Editing = False
        end
        object cxGridDBTableView1oid_ValorClasif: TcxGridDBColumn
          DataBinding.FieldName = 'oid_ValorClasif'
        end
        object cxGridDBTableView1CodValorClasif: TcxGridDBColumn
          DataBinding.FieldName = 'CodValorClasif'
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.OnButtonClick = cxGridDBTableView1CodValorClasifPropertiesButtonClick
        end
        object cxGridDBTableView1DescValorClasif: TcxGridDBColumn
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
      Left = 122
      Top = 468
      DataBinding.DataField = 'CodCondPago'
      DataBinding.DataSource = dsCliente
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 14
      Width = 79
    end
    object cxTextEdit1: TcxDBTextEdit
      Left = 207
      Top = 468
      DataBinding.DataField = 'DescCondPago'
      DataBinding.DataSource = dsCliente
      Enabled = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 15
      Width = 274
    end
    object jktExpDBGrid3: TjktExpDBGrid
      Left = 22
      Top = 761
      Width = 491
      Height = 288
      TabOrder = 17
      DataSource = dsSucursalesCliente
      object tvSucursales: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsSucursalesCliente
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.DragOpening = False
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsView.GroupByBox = False
        object tvSucursalesoid_SucClie: TcxGridDBColumn
          DataBinding.FieldName = 'oid_SucClie'
        end
        object tvSucursalesoid_Cliente: TcxGridDBColumn
          DataBinding.FieldName = 'oid_Cliente'
        end
        object tvSucursalesNroSucursal: TcxGridDBColumn
          DataBinding.FieldName = 'NroSucursal'
        end
        object tvSucursalesDescripcion: TcxGridDBColumn
          DataBinding.FieldName = 'Descripcion'
        end
        object tvSucursalesDireccion: TcxGridDBColumn
          DataBinding.FieldName = 'Direccion'
        end
        object tvSucursalesLocalidad: TcxGridDBColumn
          DataBinding.FieldName = 'Localidad'
        end
        object tvSucursalesCodPostal: TcxGridDBColumn
          DataBinding.FieldName = 'CodPostal'
        end
        object tvSucursalesoid_Provincia: TcxGridDBColumn
          DataBinding.FieldName = 'oid_Provincia'
        end
        object tvSucursalesCodProvincia: TcxGridDBColumn
          DataBinding.FieldName = 'CodProvincia'
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.OnButtonClick = tvSucursalesCodProvinciaPropertiesButtonClick
        end
        object tvSucursalesDescProvincia: TcxGridDBColumn
          DataBinding.FieldName = 'DescProvincia'
          Options.Editing = False
        end
        object tvSucursalesoid_Vendedor: TcxGridDBColumn
          DataBinding.FieldName = 'oid_Vendedor'
        end
        object tvSucursalesCodVendedor: TcxGridDBColumn
          DataBinding.FieldName = 'CodVendedor'
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.OnButtonClick = tvSucursalesCodVendedorPropertiesButtonClick
        end
        object tvSucursalesDescVendedor: TcxGridDBColumn
          DataBinding.FieldName = 'DescVendedor'
          Options.Editing = False
        end
        object tvSucursalesTelefonos: TcxGridDBColumn
          DataBinding.FieldName = 'Telefonos'
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
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsView.GroupByBox = False
        object tvDomiciliosEntregaoid_DomSuc: TcxGridDBColumn
          DataBinding.FieldName = 'oid_DomSuc'
        end
        object tvDomiciliosEntregaoid_SucClie: TcxGridDBColumn
          DataBinding.FieldName = 'oid_SucClie'
        end
        object tvDomiciliosEntregaNroDomicilio: TcxGridDBColumn
          DataBinding.FieldName = 'NroDomicilio'
        end
        object tvDomiciliosEntregaDescripcion: TcxGridDBColumn
          DataBinding.FieldName = 'Descripcion'
        end
        object tvDomiciliosEntregaDireccion: TcxGridDBColumn
          DataBinding.FieldName = 'Direccion'
        end
        object tvDomiciliosEntregaLocalidad: TcxGridDBColumn
          DataBinding.FieldName = 'Localidad'
        end
        object tvDomiciliosEntregaCodPostal: TcxGridDBColumn
          DataBinding.FieldName = 'CodPostal'
        end
        object tvDomiciliosEntregaoid_Provincia: TcxGridDBColumn
          DataBinding.FieldName = 'oid_Provincia'
        end
        object tvDomiciliosEntregaCodProvincia: TcxGridDBColumn
          DataBinding.FieldName = 'CodProvincia'
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.OnButtonClick = tvDomiciliosEntregaCodProvinciaPropertiesButtonClick
        end
        object tvDomiciliosEntregaDescProvincia: TcxGridDBColumn
          DataBinding.FieldName = 'DescProvincia'
          Options.Editing = False
        end
        object tvDomiciliosEntregaHorariosEntrega: TcxGridDBColumn
          DataBinding.FieldName = 'HorariosEntrega'
        end
        object tvDomiciliosEntregaTelefonos: TcxGridDBColumn
          DataBinding.FieldName = 'Telefonos'
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
          Position.BeginsLayer = True
        end
        object cvContactosoid_SucClie: TcxGridDBCardViewRow
          DataBinding.FieldName = 'oid_SucClie'
          Position.BeginsLayer = True
        end
        object cvContactosApellido: TcxGridDBCardViewRow
          DataBinding.FieldName = 'Apellido'
          Position.BeginsLayer = True
        end
        object cvContactosNombres: TcxGridDBCardViewRow
          DataBinding.FieldName = 'Nombres'
          Position.BeginsLayer = True
        end
        object cvContactosTelefonos: TcxGridDBCardViewRow
          DataBinding.FieldName = 'Telefonos'
          Position.BeginsLayer = True
        end
        object cvContactosEmail: TcxGridDBCardViewRow
          DataBinding.FieldName = 'Email'
          Position.BeginsLayer = True
        end
        object cvContactosCargo: TcxGridDBCardViewRow
          DataBinding.FieldName = 'Cargo'
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
        end
        object tvClasificadoresoid_SucClie: TcxGridDBColumn
          DataBinding.FieldName = 'oid_SucClie'
        end
        object tvClasificadoresoid_Clasif: TcxGridDBColumn
          DataBinding.FieldName = 'oid_Clasif'
        end
        object tvClasificadoresDescClasif: TcxGridDBColumn
          DataBinding.FieldName = 'DescClasif'
          Options.Editing = False
        end
        object tvClasificadoresoid_ValorClasif: TcxGridDBColumn
          DataBinding.FieldName = 'oid_ValorClasif'
        end
        object tvClasificadoresCodValorClasif: TcxGridDBColumn
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
        MaxDetailHeight = 200
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
      Left = 662
      Top = -23
      DataBinding.DataField = 'Activo'
      DataBinding.DataSource = dsCliente
      Properties.Alignment = taLeftJustify
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 2
      Width = 43
    end
    object lcMainGroup_Root: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avTop
      ButtonOptions.Buttons = <>
      Hidden = True
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
      CaptionOptions.Text = 'Nombre Comercial :'
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
      ShowBorder = False
      Index = 1
    end
    object lcMainGroup3: TdxLayoutGroup
      CaptionOptions.Text = 'Datos Legales / Impositivos'
      Parent = lcMainGroup2
      ButtonOptions.Buttons = <>
      ItemControlAreaAlignment = catOwn
      Index = 0
    end
    object lcMainGroup4: TdxLayoutGroup
      CaptionOptions.Text = 'Datos Comerciales'
      Parent = lcMainGroup2
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      Index = 1
    end
    object lcMainGroup5: TdxLayoutGroup
      CaptionOptions.Text = 'Sucursales'
      Parent = lcMainGroup2
      ButtonOptions.Buttons = <>
      Index = 3
    end
    object lcMainGroup6: TdxLayoutGroup
      CaptionOptions.Text = 'Domicilio'
      Parent = lcMainGroup3
      ButtonOptions.Buttons = <>
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
      Control = cxDBTextEdit6
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
      Parent = lcMainGroup4
      Control = cxButtonEdit1
      ControlOptions.AlignHorz = ahLeft
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcMainItem15: TdxLayoutItem
      CaptionOptions.Visible = False
      Parent = lcMainGroup4
      Control = cxTextEdit1
      ControlOptions.ShowBorder = False
      Enabled = False
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
    OperacionesDefault = <
      item
        Operacion = OperTraerClasifCliente
      end
      item
        Operacion = OperTraerClasifSucur
      end>
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
    Left = 544
    Top = 24
  end
  inherited mtParametroInicial: TjktMemTable
    Left = 632
    Top = 24
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
        Field = mtSucursalesClienteCodProvincia
        ValidadorGral = ValProvinciaSucursal
      end
      item
        Field = mtDomiciliosEntregaCodProvincia
        ValidadorGral = ValProvinciaDomEnt
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
        Field = mtSucursalesClienteCodVendedor
        ValidadorGral = ValVendedor
      end
      item
        Field = mtInscripImpositCodImpuesto
        ValidadorGral = ValImpuesto
      end
      item
        Field = mtInscripImpositCodCategoria
        ValidadorGral = ValCategoriaImp
      end>
    Left = 176
    Top = 24
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
        Name = 'Telefonos'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Activo'
        DataType = ftBoolean
      end>
    IndexFieldNames = 'oid_Cliente'
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
    Left = 64
    Top = 320
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
    MasterSource = dsSucursalesCliente
    Version = '7.12.10 CodeGear Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    Left = 104
    Top = 376
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
    IndexName = '__MT__DEFAULT_'
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
    MasterSource = dsSucursalesCliente
    Version = '7.12.10 CodeGear Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    Left = 208
    Top = 376
    object mtContactosoid_ContSuc: TIntegerField
      Tag = 1
      FieldName = 'oid_ContSuc'
    end
    object mtContactosoid_SucClie: TIntegerField
      Tag = 1
      FieldName = 'oid_SucClie'
    end
    object mtContactosApellido: TStringField
      Tag = 1
      FieldName = 'Apellido'
      Size = 50
    end
    object mtContactosNombres: TStringField
      Tag = 1
      FieldName = 'Nombres'
      Size = 50
    end
    object mtContactosCargo: TStringField
      Tag = 1
      FieldName = 'Cargo'
      Size = 50
    end
    object mtContactosTelefonos: TStringField
      Tag = 1
      FieldName = 'Telefonos'
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
    MasterSource = dsSucursalesCliente
    Version = '7.12.10 CodeGear Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    Left = 320
    Top = 376
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
    Left = 104
    Top = 320
  end
  object dsDomiciliosEntrega: TDataSource
    DataSet = mtDomiciliosEntrega
    Left = 144
    Top = 376
  end
  object dsContactos: TDataSource
    DataSet = mtContactos
    Left = 248
    Top = 376
  end
  object dsClasificadoresSucursal: TDataSource
    DataSet = mtClasificadoresSucursal
    Left = 360
    Top = 376
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
        Name = 'DescImpuesto'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'NroInscripcion'
        DataType = ftInteger
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
    object mtInscripImpositNroInscripcion: TIntegerField
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
    OidRespuesta = mtClienteoid_Cliente
    Left = 480
    Top = 80
  end
  object OperTraerClasifCliente: TjktOperacion
    OperName = 'TraerClasifCliente'
    EnviarTodo = False
    Atributos = <>
    ServiceCaller = Service
    Left = 752
    Top = 24
  end
  object OperTraerClasifSucur: TjktOperacion
    OperName = 'TraerClasifSucur'
    EnviarTodo = False
    Atributos = <>
    ServiceCaller = Service
    Left = 752
    Top = 80
  end
  object mtSujImp: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
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
      Size = 50
    end
    object mtSujImpLocalidad: TStringField
      Tag = 1
      FieldName = 'Localidad'
      Size = 50
    end
    object mtSujImpCodPostal: TStringField
      Tag = 1
      FieldName = 'CodPostal'
      Size = 10
    end
    object mtSujImpoid_Provincia: TIntegerField
      Tag = 1
      FieldName = 'oid_Provincia'
    end
    object mtSujImpCodProvincia: TStringField
      FieldName = 'CodProvincia'
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
    OidRespuesta = mtSujImpoid_Provincia
    CodigoRespuesta = mtSujImpCodProvincia
    Left = 40
    Top = 168
  end
  object HelpPais: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'pais'
    OidRespuesta = mtSujImpoid_Pais
    CodigoRespuesta = mtSujImpCodPais
    Left = 160
    Top = 168
  end
  object HelpCondPago: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'condicionPago'
    OidRespuesta = mtClienteoid_CondPago
    CodigoRespuesta = mtClienteCodCondPago
    Left = 200
    Top = 168
  end
  object HelpVendedor: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'vendedor'
    OidRespuesta = mtSucursalesClienteoid_Vendedor
    CodigoRespuesta = mtSucursalesClienteCodVendedor
    Left = 240
    Top = 168
  end
  object HelpImpuesto: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'impuesto'
    OidRespuesta = mtInscripImpositoid_Impuesto
    CodigoRespuesta = mtInscripImpositCodImpuesto
    Left = 280
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
    Left = 160
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
    Left = 200
    Top = 224
  end
  object ValVendedor: TjktValidador
    Entidad = 'vendedor'
    Validacion = tExistente
    ListaAsignaciones = <
      item
        SourceName = 'oid'
        FieldTarget = mtSucursalesClienteoid_Vendedor
      end
      item
        SourceName = 'Descripcion'
        FieldTarget = mtSucursalesClienteDescVendedor
      end>
    Left = 240
    Top = 224
  end
  object ValImpuesto: TjktValidador
    Entidad = 'impuesto'
    Validacion = tExistente
    ListaAsignaciones = <
      item
        SourceName = 'oid'
        FieldTarget = mtInscripImpositoid_Impuesto
      end
      item
        SourceName = 'Descripcion'
        FieldTarget = mtInscripImpositDescImpuesto
      end>
    Left = 280
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
    OidRespuesta = mtInscripImpositoid_Categoria
    CodigoRespuesta = mtInscripImpositCodCategoria
    Left = 320
    Top = 168
  end
  object ValProvinciaSucursal: TjktValidador
    Entidad = 'provincia'
    Validacion = tExistente
    ListaAsignaciones = <
      item
        SourceName = 'oid'
        FieldTarget = mtSucursalesClienteoid_Provincia
      end
      item
        SourceName = 'Descripcion'
        FieldTarget = mtSucursalesClienteDescProvincia
      end>
    Left = 80
    Top = 224
  end
  object HelpProvinciaSucursal: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'provincia'
    OidRespuesta = mtSucursalesClienteoid_Provincia
    CodigoRespuesta = mtSucursalesClienteCodProvincia
    Left = 80
    Top = 168
  end
  object HelpProvinciaDomEnt: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'provincia'
    OidRespuesta = mtDomiciliosEntregaoid_Provincia
    CodigoRespuesta = mtDomiciliosEntregaCodProvincia
    Left = 120
    Top = 168
  end
  object ValProvinciaDomEnt: TjktValidador
    Entidad = 'provincia'
    Validacion = tExistente
    ListaAsignaciones = <
      item
        SourceName = 'oid'
        FieldTarget = mtDomiciliosEntregaoid_Provincia
      end
      item
        SourceName = 'Descripcion'
        FieldTarget = mtDomiciliosEntregaDescProvincia
      end>
    Left = 120
    Top = 224
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
end
