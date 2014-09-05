inherited FNCli0001: TFNCli0001
  Caption = 'ABM de Clientes'
  ClientHeight = 500
  ClientWidth = 764
  ExplicitWidth = 780
  ExplicitHeight = 538
  PixelsPerInch = 96
  TextHeight = 13
  object lcMain: TdxLayoutControl [0]
    Left = 0
    Top = 0
    Width = 764
    Height = 500
    Align = alClient
    TabOrder = 4
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 67
      Top = 28
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
      Top = 28
      DataBinding.DataField = 'RazonSocial'
      DataBinding.DataSource = dsCliente
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 1
      Width = 293
    end
    object cxDBTextEdit3: TcxDBTextEdit
      Left = 101
      Top = 103
      DataBinding.DataField = 'Direccion'
      DataBinding.DataSource = dsCliente
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 2
      Width = 243
    end
    object cxDBTextEdit4: TcxDBTextEdit
      Left = 101
      Top = 130
      DataBinding.DataField = 'Localidad'
      DataBinding.DataSource = dsCliente
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 3
      Width = 243
    end
    object cxDBTextEdit7: TcxDBTextEdit
      Left = 101
      Top = 157
      DataBinding.DataField = 'CodPostal'
      DataBinding.DataSource = dsCliente
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 4
      Width = 132
    end
    object cxDBTextEdit8: TcxDBTextEdit
      Left = 166
      Top = 184
      DataBinding.DataField = 'DescProvincia'
      DataBinding.DataSource = dsCliente
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 6
      Width = 178
    end
    object cxDBTextEdit9: TcxDBTextEdit
      Left = 166
      Top = 211
      DataBinding.DataField = 'DescPais'
      DataBinding.DataSource = dsCliente
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 8
      Width = 178
    end
    object cxDBButtonEdit1: TcxDBButtonEdit
      Left = 101
      Top = 184
      DataBinding.DataField = 'CodProvincia'
      DataBinding.DataSource = dsCliente
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 5
      Width = 59
    end
    object cxDBButtonEdit2: TcxDBButtonEdit
      Left = 101
      Top = 211
      DataBinding.DataField = 'CodPais'
      DataBinding.DataSource = dsCliente
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 7
      Width = 59
    end
    object cxDBTextEdit5: TcxDBTextEdit
      Left = 81
      Top = 250
      DataBinding.DataField = 'Telefonos'
      DataBinding.DataSource = dsCliente
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 9
      Width = 263
    end
    object cxDBTextEdit6: TcxDBTextEdit
      Left = 81
      Top = 277
      DataBinding.DataField = 'Cuit'
      DataBinding.DataSource = dsCliente
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 10
      Width = 136
    end
    object cxDBCheckBox1: TcxDBCheckBox
      Left = 112
      Top = 304
      DataBinding.DataField = 'PersonaJuridica'
      DataBinding.DataSource = dsCliente
      Properties.Alignment = taLeftJustify
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 11
      Width = 43
    end
    object jktExpDBGrid1: TjktExpDBGrid
      Left = 34
      Top = 349
      Width = 391
      Height = 200
      TabOrder = 12
      DataSource = dsInscripcionesImpositivas
      object jktExpDBGrid1DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsInscripcionesImpositivas
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        object jktExpDBGrid1DBTableView1oid_InscClie: TcxGridDBColumn
          DataBinding.FieldName = 'oid_InscClie'
        end
        object jktExpDBGrid1DBTableView1oid_Cliente: TcxGridDBColumn
          DataBinding.FieldName = 'oid_Cliente'
        end
        object jktExpDBGrid1DBTableView1oid_Impuesto: TcxGridDBColumn
          DataBinding.FieldName = 'oid_Impuesto'
        end
        object jktExpDBGrid1DBTableView1DescImpuesto: TcxGridDBColumn
          DataBinding.FieldName = 'DescImpuesto'
        end
        object jktExpDBGrid1DBTableView1NroInscripcion: TcxGridDBColumn
          DataBinding.FieldName = 'NroInscripcion'
        end
        object jktExpDBGrid1DBTableView1oid_Categoria: TcxGridDBColumn
          DataBinding.FieldName = 'oid_Categoria'
        end
        object jktExpDBGrid1DBTableView1CodCategoria: TcxGridDBColumn
          DataBinding.FieldName = 'CodCategoria'
        end
        object jktExpDBGrid1DBTableView1DescCategoria: TcxGridDBColumn
          DataBinding.FieldName = 'DescCategoria'
        end
        object jktExpDBGrid1DBTableView1VigenciaDesde: TcxGridDBColumn
          DataBinding.FieldName = 'VigenciaDesde'
        end
        object jktExpDBGrid1DBTableView1Activo: TcxGridDBColumn
          DataBinding.FieldName = 'Activo'
        end
      end
      object jktExpDBGrid1Level1: TcxGridLevel
        GridView = jktExpDBGrid1DBTableView1
      end
    end
    object jktExpDBGrid2: TjktExpDBGrid
      Left = 22
      Top = 597
      Width = 391
      Height = 200
      TabOrder = 13
      DataSource = dsClasificadoresCliente
      object cxGridDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsClasificadoresCliente
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        object cxGridDBTableView1oid_ClasifClie: TcxGridDBColumn
          DataBinding.FieldName = 'oid_ClasifClie'
        end
        object cxGridDBTableView1oid_Cliente: TcxGridDBColumn
          DataBinding.FieldName = 'oid_Cliente'
        end
        object cxGridDBTableView1DescClasif: TcxGridDBColumn
          DataBinding.FieldName = 'DescClasif'
        end
        object cxGridDBTableView1oid_ValorClasif: TcxGridDBColumn
          DataBinding.FieldName = 'oid_ValorClasif'
        end
        object cxGridDBTableView1CodValorClasif: TcxGridDBColumn
          DataBinding.FieldName = 'CodValorClasif'
        end
        object cxGridDBTableView1DescValorClasif: TcxGridDBColumn
          DataBinding.FieldName = 'DescValorClasif'
        end
        object cxGridDBTableView1Activo: TcxGridDBColumn
          DataBinding.FieldName = 'Activo'
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDBTableView1
      end
    end
    object cxButtonEdit1: TcxDBButtonEdit
      Left = 122
      Top = 833
      DataBinding.DataField = 'CodCondPago'
      DataBinding.DataSource = dsCliente
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 14
      Width = 79
    end
    object cxTextEdit1: TcxDBTextEdit
      Left = 207
      Top = 833
      DataBinding.DataField = 'DescCondPago'
      DataBinding.DataSource = dsCliente
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 15
      Width = 274
    end
    object jktExpDBGrid3: TjktExpDBGrid
      Left = 22
      Top = 890
      Width = 211
      Height = 200
      TabOrder = 16
      DataSource = dsSucursalesCliente
      object tvSucursales: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsSucursalesCliente
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
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
        end
        object tvSucursalesDescProvincia: TcxGridDBColumn
          DataBinding.FieldName = 'DescProvincia'
        end
        object tvSucursalesoid_Vendedor: TcxGridDBColumn
          DataBinding.FieldName = 'oid_Vendedor'
        end
        object tvSucursalesCodVendedor: TcxGridDBColumn
          DataBinding.FieldName = 'CodVendedor'
        end
        object tvSucursalesDescVendedor: TcxGridDBColumn
          DataBinding.FieldName = 'DescVendedor'
        end
        object tvSucursalesTelefonos: TcxGridDBColumn
          DataBinding.FieldName = 'Telefonos'
        end
        object tvSucursalesActivo: TcxGridDBColumn
          DataBinding.FieldName = 'Activo'
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
        end
        object tvDomiciliosEntregaDescProvincia: TcxGridDBColumn
          DataBinding.FieldName = 'DescProvincia'
        end
        object tvDomiciliosEntregaHorariosEntrega: TcxGridDBColumn
          DataBinding.FieldName = 'HorariosEntrega'
        end
        object tvDomiciliosEntregaTelefonos: TcxGridDBColumn
          DataBinding.FieldName = 'Telefonos'
        end
        object tvDomiciliosEntregaActivo: TcxGridDBColumn
          DataBinding.FieldName = 'Activo'
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
        object tvClasificadoresoid_ClasifSuc: TcxGridDBColumn
          DataBinding.FieldName = 'oid_ClasifSuc'
        end
        object tvClasificadoresoid_SucClie: TcxGridDBColumn
          DataBinding.FieldName = 'oid_SucClie'
        end
        object tvClasificadoresDescClasif: TcxGridDBColumn
          DataBinding.FieldName = 'DescClasif'
        end
        object tvClasificadoresoid_ValorClasif: TcxGridDBColumn
          DataBinding.FieldName = 'oid_ValorClasif'
        end
        object tvClasificadoresCodValorClasif: TcxGridDBColumn
          DataBinding.FieldName = 'CodValorClasif'
        end
        object tvClasificadoresDescValorClasif: TcxGridDBColumn
          DataBinding.FieldName = 'DescValorClasif'
        end
        object tvClasificadoresActivo: TcxGridDBColumn
          DataBinding.FieldName = 'Activo'
        end
      end
      object lvSucursales: TcxGridLevel
        Caption = 'Sucursales'
        GridView = tvSucursales
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
    object lcMainGroup_Root: TdxLayoutGroup
      AlignHorz = ahLeft
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
      Index = 2
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
      Index = 0
    end
    object lcMainItem3: TdxLayoutItem
      CaptionOptions.Text = 'Direcci'#243'n :'
      Parent = lcMainGroup6
      Control = cxDBTextEdit3
      ControlOptions.AlignHorz = ahLeft
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcMainItem4: TdxLayoutItem
      CaptionOptions.Text = 'Localidad :'
      Parent = lcMainGroup6
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
      Parent = lcMainGroup10
      Control = cxDBButtonEdit2
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcMainItem7: TdxLayoutItem
      CaptionOptions.Text = 'Cod. Postal :'
      Parent = lcMainGroup6
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
      Index = 1
    end
    object lcMainItem9: TdxLayoutItem
      CaptionOptions.Text = 'cxDBTextEdit9'
      CaptionOptions.Visible = False
      Parent = lcMainGroup10
      Control = cxDBTextEdit9
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcMainGroup7: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = lcMainGroup6
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 3
    end
    object lcMainGroup10: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = lcMainGroup6
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 4
    end
    object lcMainItem10: TdxLayoutItem
      CaptionOptions.Text = 'Tel'#233'fonos :'
      Parent = lcMainGroup3
      Control = cxDBTextEdit5
      ControlOptions.AlignHorz = ahLeft
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcMainItem11: TdxLayoutItem
      CaptionOptions.Text = 'CUIT :'
      Parent = lcMainGroup3
      SizeOptions.Width = 290
      Control = cxDBTextEdit6
      ControlOptions.AlignHorz = ahLeft
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object lcMainItem12: TdxLayoutItem
      CaptionOptions.Text = 'Persona Jur'#237'dica :'
      Parent = lcMainGroup3
      Control = cxDBCheckBox1
      ControlOptions.AlignHorz = ahLeft
      ControlOptions.AutoControlAreaAlignment = False
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object lcMainGroup8: TdxLayoutGroup
      CaptionOptions.Text = 'Inscripciones Impositivas'
      Parent = lcMainGroup3
      ButtonOptions.Buttons = <>
      Index = 4
    end
    object lcMainItem13: TdxLayoutItem
      CaptionOptions.Visible = False
      Parent = lcMainGroup8
      Control = jktExpDBGrid1
      ControlOptions.AlignHorz = ahLeft
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcMainGroup9: TdxLayoutGroup
      CaptionOptions.Text = 'Clasificadores del Cliente'
      Parent = lcMainGroup2
      ButtonOptions.Buttons = <>
      Index = 1
    end
    object lcMainItem14: TdxLayoutItem
      CaptionOptions.Visible = False
      Parent = lcMainGroup9
      Control = jktExpDBGrid2
      ControlOptions.AlignHorz = ahLeft
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
  end
  inherited BarManager: TdxBarManager
    Left = 248
    Top = 56
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited Driver: TjktDriver
    Left = 472
    Top = 56
  end
  inherited IdHTTP: TIdHTTP
    Left = 368
    Top = 56
  end
  inherited Service: TjktServiceCaller
    Left = 312
    Top = 56
  end
  inherited OperacionSave: TjktOperacion
    Left = 536
    Top = 56
  end
  inherited mtParametroInicial: TjktMemTable
    Left = 624
    Top = 56
  end
  inherited OperacionTraer: TjktOperacion
    Left = 536
    Top = 120
  end
  inherited ValidadorForm: TjktValidadorForm
    Left = 368
    Top = 120
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
    Left = 64
    Top = 320
    object mtSucursalesClienteoid_SucClie: TIntegerField
      FieldName = 'oid_SucClie'
    end
    object mtSucursalesClienteoid_Cliente: TIntegerField
      FieldName = 'oid_Cliente'
    end
    object mtSucursalesClienteNroSucursal: TSmallintField
      FieldName = 'NroSucursal'
    end
    object mtSucursalesClienteDescripcion: TStringField
      FieldName = 'Descripcion'
      Size = 50
    end
    object mtSucursalesClienteDireccion: TStringField
      FieldName = 'Direccion'
      Size = 50
    end
    object mtSucursalesClienteLocalidad: TStringField
      FieldName = 'Localidad'
      Size = 50
    end
    object mtSucursalesClienteCodPostal: TStringField
      FieldName = 'CodPostal'
      Size = 10
    end
    object mtSucursalesClienteoid_Provincia: TIntegerField
      FieldName = 'oid_Provincia'
    end
    object mtSucursalesClienteCodProvincia: TStringField
      FieldName = 'CodProvincia'
    end
    object mtSucursalesClienteDescProvincia: TStringField
      FieldName = 'DescProvincia'
      Size = 50
    end
    object mtSucursalesClienteoid_Vendedor: TIntegerField
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
      FieldName = 'Telefonos'
      Size = 50
    end
    object mtSucursalesClienteActivo: TBooleanField
      FieldName = 'Activo'
    end
  end
  object mtDomiciliosEntrega: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexFieldNames = 'oid_SucClie'
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
    Top = 376
    object mtDomiciliosEntregaoid_DomSuc: TIntegerField
      FieldName = 'oid_DomSuc'
    end
    object mtDomiciliosEntregaoid_SucClie: TIntegerField
      FieldName = 'oid_SucClie'
    end
    object mtDomiciliosEntregaNroDomicilio: TSmallintField
      FieldName = 'NroDomicilio'
    end
    object mtDomiciliosEntregaDescripcion: TStringField
      FieldName = 'Descripcion'
      Size = 50
    end
    object mtDomiciliosEntregaDireccion: TStringField
      FieldName = 'Direccion'
      Size = 50
    end
    object mtDomiciliosEntregaLocalidad: TStringField
      FieldName = 'Localidad'
      Size = 50
    end
    object mtDomiciliosEntregaCodPostal: TStringField
      FieldName = 'CodPostal'
      Size = 10
    end
    object mtDomiciliosEntregaoid_Provincia: TIntegerField
      FieldName = 'oid_Provincia'
    end
    object mtDomiciliosEntregaCodProvincia: TStringField
      FieldName = 'CodProvincia'
    end
    object mtDomiciliosEntregaDescProvincia: TStringField
      FieldName = 'DescProvincia'
      Size = 50
    end
    object mtDomiciliosEntregaHorariosEntrega: TStringField
      FieldName = 'HorariosEntrega'
      Size = 100
    end
    object mtDomiciliosEntregaTelefonos: TStringField
      FieldName = 'Telefonos'
      Size = 50
    end
    object mtDomiciliosEntregaActivo: TBooleanField
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
    Left = 208
    Top = 376
    object mtContactosoid_ContSuc: TIntegerField
      FieldName = 'oid_ContSuc'
    end
    object mtContactosoid_SucClie: TIntegerField
      FieldName = 'oid_SucClie'
    end
    object mtContactosApellido: TStringField
      FieldName = 'Apellido'
      Size = 50
    end
    object mtContactosNombres: TStringField
      FieldName = 'Nombres'
      Size = 50
    end
    object mtContactosCargo: TStringField
      FieldName = 'Cargo'
      Size = 50
    end
    object mtContactosTelefonos: TStringField
      FieldName = 'Telefonos'
      Size = 50
    end
    object mtContactosEmail: TStringField
      FieldName = 'Email'
      Size = 50
    end
    object mtContactosActivo: TBooleanField
      FieldName = 'Activo'
    end
  end
  object mtClasificadoresSucursal: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexFieldNames = 'oid_SucClie'
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
    Left = 320
    Top = 376
    object mtClasificadoresSucursaloid_ClasifSuc: TIntegerField
      FieldName = 'oid_ClasifSuc'
    end
    object mtClasificadoresSucursaloid_SucClie: TIntegerField
      FieldName = 'oid_SucClie'
    end
    object mtClasificadoresSucursalDescClasif: TStringField
      FieldName = 'DescClasif'
      Size = 30
    end
    object mtClasificadoresSucursaloid_ValorClasif: TIntegerField
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
        Name = 'Telefonos'
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
    Left = 392
    Top = 184
    object mtClienteoid_Cliente: TIntegerField
      FieldName = 'oid_Cliente'
    end
    object mtClienteCodigo: TStringField
      FieldName = 'Codigo'
      Size = 15
    end
    object mtClienteRazonSocial: TStringField
      FieldName = 'RazonSocial'
      Size = 100
    end
    object mtClienteDireccion: TStringField
      FieldName = 'Direccion'
      Size = 50
    end
    object mtClienteLocalidad: TStringField
      FieldName = 'Localidad'
      Size = 50
    end
    object mtClienteCodPostal: TStringField
      FieldName = 'CodPostal'
      Size = 10
    end
    object mtClienteoid_Provincia: TIntegerField
      FieldName = 'oid_Provincia'
    end
    object mtClienteCodProvincia: TStringField
      FieldName = 'CodProvincia'
    end
    object mtClienteDescProvincia: TStringField
      FieldName = 'DescProvincia'
      Size = 50
    end
    object mtClienteoid_Pais: TIntegerField
      FieldName = 'oid_Pais'
    end
    object mtClienteCodPais: TStringField
      FieldName = 'CodPais'
    end
    object mtClienteDescPais: TStringField
      FieldName = 'DescPais'
      Size = 50
    end
    object mtClienteTelefonos: TStringField
      FieldName = 'Telefonos'
      Size = 50
    end
    object mtClientePersonaJuridica: TBooleanField
      FieldName = 'PersonaJuridica'
    end
    object mtClienteCuit: TStringField
      FieldName = 'Cuit'
    end
    object mtClienteoid_CondPago: TIntegerField
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
      FieldName = 'Activo'
    end
  end
  object mtInscripImposit: TjktMemTable
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
    Top = 232
    object mtInscripImpositoid_InscClie: TIntegerField
      FieldName = 'oid_InscClie'
    end
    object mtInscripImpositoid_Cliente: TIntegerField
      FieldName = 'oid_Cliente'
    end
    object mtInscripImpositoid_Impuesto: TIntegerField
      FieldName = 'oid_Impuesto'
    end
    object mtInscripImpositDescImpuesto: TStringField
      FieldName = 'DescImpuesto'
      Size = 100
    end
    object mtInscripImpositNroInscripcion: TIntegerField
      FieldName = 'NroInscripcion'
    end
    object mtInscripImpositoid_Categoria: TIntegerField
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
      FieldName = 'VigenciaDesde'
    end
    object mtInscripImpositActivo: TBooleanField
      FieldName = 'Activo'
    end
  end
  object mtClasificadoresCliente: TjktMemTable
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
    Top = 280
    object mtClasificadoresClienteoid_ClasifClie: TIntegerField
      FieldName = 'oid_ClasifClie'
    end
    object mtClasificadoresClienteoid_Cliente: TIntegerField
      FieldName = 'oid_Cliente'
    end
    object mtClasificadoresClienteDescClasif: TStringField
      FieldName = 'DescClasif'
      Size = 30
    end
    object mtClasificadoresClienteoid_ValorClasif: TIntegerField
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
      FieldName = 'Activo'
    end
  end
  object dsCliente: TDataSource
    DataSet = mtCliente
    Left = 432
    Top = 184
  end
  object dsInscripcionesImpositivas: TDataSource
    DataSet = mtInscripImposit
    Left = 432
    Top = 232
  end
  object dsClasificadoresCliente: TDataSource
    DataSet = mtClasificadoresCliente
    Left = 432
    Top = 280
  end
  object jktHelpGenerico1: TjktHelpGenerico
    Left = 472
    Top = 120
  end
end
