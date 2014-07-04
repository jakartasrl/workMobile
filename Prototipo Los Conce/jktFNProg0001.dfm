inherited FNProg0001: TFNProg0001
  Caption = 'Administraci'#243'n de Pedidos'
  ClientHeight = 538
  ClientWidth = 767
  ExplicitWidth = 783
  ExplicitHeight = 576
  PixelsPerInch = 96
  TextHeight = 13
  object lcMain: TdxLayoutControl [0]
    Left = 0
    Top = 0
    Width = 767
    Height = 538
    Align = alClient
    TabOrder = 4
    LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
    object cxDBTextEdit2: TcxDBTextEdit
      Left = 273
      Top = 41
      Style.HotTrack = False
      TabOrder = 1
      Width = 117
    end
    object cxDBTextEdit3: TcxDBTextEdit
      Left = 539
      Top = 41
      Style.HotTrack = False
      TabOrder = 2
      Width = 121
    end
    object cxDBTextEdit4: TcxDBTextEdit
      Left = 760
      Top = 41
      Style.HotTrack = False
      TabOrder = 3
      Width = 121
    end
    object cxDBDateEdit1: TcxDBDateEdit
      Left = 99
      Top = 41
      Style.HotTrack = False
      TabOrder = 0
      Width = 99
    end
    object cxDBTextEdit6: TcxDBTextEdit
      Left = 273
      Top = 107
      Style.HotTrack = False
      TabOrder = 6
      Width = 387
    end
    object cxDBTextEdit7: TcxDBTextEdit
      Left = 224
      Top = 213
      Style.HotTrack = False
      TabOrder = 8
      Width = 132
    end
    object cxDBTextEdit8: TcxDBTextEdit
      Left = 443
      Top = 213
      Style.HotTrack = False
      TabOrder = 9
      Width = 121
    end
    object jktExpDBGrid1: TjktExpDBGrid
      Left = 32
      Top = 302
      Width = 452
      Height = 120
      TabOrder = 10
      DataSource = dsContactosComerciales
      object jktExpDBGrid1DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsContactosComerciales
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
        object jktExpDBGrid1DBTableView1NombreApellido: TcxGridDBColumn
          Caption = 'Nombre y Apellido'
          DataBinding.FieldName = 'NombreApellido'
          Width = 150
        end
        object jktExpDBGrid1DBTableView1Telefono: TcxGridDBColumn
          Caption = 'Tel'#233'fono'
          DataBinding.FieldName = 'Telefono'
          Width = 100
        end
        object jktExpDBGrid1DBTableView1Email: TcxGridDBColumn
          Caption = 'e-mail'
          DataBinding.FieldName = 'Email'
          Width = 200
        end
      end
      object jktExpDBGrid1Level1: TcxGridLevel
        GridView = jktExpDBGrid1DBTableView1
      end
    end
    object jktExpDBGrid2: TjktExpDBGrid
      Left = 490
      Top = 302
      Width = 452
      Height = 120
      TabOrder = 11
      DataSource = dsContactosTecnicos
      object jktExpDBGrid2DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsContactosTecnicos
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
        object jktExpDBGrid2DBTableView1NombreApellido: TcxGridDBColumn
          Caption = 'Nombre y Apellido'
          DataBinding.FieldName = 'NombreApellido'
          Width = 150
        end
        object jktExpDBGrid2DBTableView1Telefono: TcxGridDBColumn
          Caption = 'Tel'#233'fono'
          DataBinding.FieldName = 'Telefono'
          Width = 100
        end
        object jktExpDBGrid2DBTableView1Email: TcxGridDBColumn
          Caption = 'e-mail'
          DataBinding.FieldName = 'Email'
          Width = 200
        end
      end
      object jktExpDBGrid2Level1: TcxGridLevel
        GridView = jktExpDBGrid2DBTableView1
      end
    end
    object jktExpDBGrid3: TjktExpDBGrid
      Left = 32
      Top = 583
      Width = 438
      Height = 120
      TabOrder = 18
      DataSource = dsCondicionesFacturacion
      object jktExpDBGrid3DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsCondicionesFacturacion
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
        object jktExpDBGrid3DBTableView1Concepto: TcxGridDBColumn
          DataBinding.FieldName = 'Concepto'
          Width = 190
        end
        object jktExpDBGrid3DBTableView1Importe: TcxGridDBColumn
          DataBinding.FieldName = 'Importe'
        end
        object jktExpDBGrid3DBTableView1Moneda: TcxGridDBColumn
          DataBinding.FieldName = 'Moneda'
          Width = 60
        end
        object jktExpDBGrid3DBTableView1FormaPago: TcxGridDBColumn
          DataBinding.FieldName = 'FormaPago'
          Width = 122
        end
      end
      object jktExpDBGrid3Level1: TcxGridLevel
        GridView = jktExpDBGrid3DBTableView1
      end
    end
    object cxDBButtonEdit1: TcxDBButtonEdit
      Left = 99
      Top = 107
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Style.HotTrack = False
      TabOrder = 5
      Width = 99
    end
    object cxRadioButton1: TcxRadioButton
      Left = 42
      Top = 503
      Width = 90
      Height = 17
      Caption = 'Los Conce'
      Color = 15919591
      ParentColor = False
      TabOrder = 12
      ParentBackground = False
    end
    object cxRadioButton2: TcxRadioButton
      Left = 138
      Top = 503
      Width = 65
      Height = 17
      Caption = 'Cliente'
      Color = 15919591
      ParentColor = False
      TabOrder = 13
      ParentBackground = False
    end
    object cxRadioButton3: TcxRadioButton
      Left = 229
      Top = 503
      Width = 90
      Height = 17
      Caption = 'Los Conce'
      Checked = True
      Color = 15919591
      ParentColor = False
      TabOrder = 14
      TabStop = True
      GroupIndex = 1
      ParentBackground = False
    end
    object cxRadioButton4: TcxRadioButton
      Left = 325
      Top = 503
      Width = 65
      Height = 17
      Caption = 'Cliente'
      Color = 15919591
      ParentColor = False
      TabOrder = 15
      GroupIndex = 1
      ParentBackground = False
    end
    object cxRadioButton5: TcxRadioButton
      Left = 416
      Top = 503
      Width = 90
      Height = 17
      Caption = 'Los Conce'
      Checked = True
      Color = 15919591
      ParentColor = False
      TabOrder = 16
      TabStop = True
      GroupIndex = 2
      ParentBackground = False
    end
    object cxRadioButton6: TcxRadioButton
      Left = 512
      Top = 503
      Width = 65
      Height = 17
      Caption = 'Cliente'
      Color = 15919591
      ParentColor = False
      TabOrder = 17
      GroupIndex = 2
      ParentBackground = False
    end
    object cxDBButtonEdit2: TcxDBButtonEdit
      Left = 136
      Top = 213
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Style.HotTrack = False
      TabOrder = 7
      Width = 82
    end
    object jktExpDBGrid4: TjktExpDBGrid
      Left = 10000
      Top = 10000
      Width = 736
      Height = 120
      TabOrder = 24
      Visible = False
      DataSource = dsPolizasSeguros
      object jktExpDBGrid4DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsPolizasSeguros
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
        object jktExpDBGrid4DBTableView1Compania: TcxGridDBColumn
          Caption = 'Compa'#241#237'a Contratada'
          DataBinding.FieldName = 'Compania'
          Width = 199
        end
        object jktExpDBGrid4DBTableView1TipoPoliza: TcxGridDBColumn
          Caption = 'Tipo de Poliza'
          DataBinding.FieldName = 'TipoPoliza'
          Width = 150
        end
        object jktExpDBGrid4DBTableView1Monto: TcxGridDBColumn
          DataBinding.FieldName = 'Monto'
          Width = 63
        end
        object jktExpDBGrid4DBTableView1Vencimiento: TcxGridDBColumn
          DataBinding.FieldName = 'Vencimiento'
          Width = 89
        end
        object jktExpDBGrid4DBTableView1Contactos: TcxGridDBColumn
          DataBinding.FieldName = 'Contactos'
          Width = 233
        end
      end
      object jktExpDBGrid4Level1: TcxGridLevel
        GridView = jktExpDBGrid4DBTableView1
      end
    end
    object jktExpDBGrid5: TjktExpDBGrid
      Left = 10000
      Top = 10000
      Width = 734
      Height = 200
      TabOrder = 25
      Visible = False
      DataSource = dsArchivosAsociados
      object jktExpDBGrid5DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsArchivosAsociados
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
        object jktExpDBGrid5DBTableView1FechaSubida: TcxGridDBColumn
          Caption = 'Fecha de subida'
          DataBinding.FieldName = 'FechaSubida'
          Options.Editing = False
          Width = 106
        end
        object jktExpDBGrid5DBTableView1Usuario: TcxGridDBColumn
          DataBinding.FieldName = 'Usuario'
          Options.Editing = False
        end
        object jktExpDBGrid5DBTableView1Comentario: TcxGridDBColumn
          DataBinding.FieldName = 'Comentario'
          Width = 237
        end
        object jktExpDBGrid5DBTableView1Archivo: TcxGridDBColumn
          DataBinding.FieldName = 'Archivo'
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.OnButtonClick = jktExpDBGrid5DBTableView1ArchivoPropertiesButtonClick
          Width = 389
        end
      end
      object jktExpDBGrid5Level1: TcxGridLevel
        GridView = jktExpDBGrid5DBTableView1
      end
    end
    object cxDBTreeList1: TcxDBTreeList
      Left = 10000
      Top = 10000
      Width = 250
      Height = 150
      Bands = <
        item
        end>
      DataController.DataSource = dsItemsLaboratorio
      DataController.ParentField = 'CodItemPadre'
      DataController.KeyField = 'CodItem'
      Navigator.Buttons.CustomButtons = <>
      RootValue = -1
      TabOrder = 20
      Visible = False
      object cxDBTreeList1CodItem: TcxDBTreeListColumn
        Caption.AlignHorz = taRightJustify
        DataBinding.FieldName = 'CodItem'
        Width = 70
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object cxDBTreeList1Ensayo: TcxDBTreeListColumn
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Caption.AlignHorz = taRightJustify
        DataBinding.FieldName = 'Ensayo'
        Width = 79
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object cxDBTreeList1Descripcion: TcxDBTreeListColumn
        DataBinding.FieldName = 'Descripcion'
        Width = 420
        Position.ColIndex = 2
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object cxDBTreeList1TomaMuestra: TcxDBTreeListColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Caption.AlignHorz = taCenter
        Caption.Text = 'Toma Muestra'
        DataBinding.FieldName = 'TomaMuestra'
        Width = 80
        Position.ColIndex = 3
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object cxDBTreeList1Cantidad: TcxDBTreeListColumn
        Caption.AlignHorz = taCenter
        DataBinding.FieldName = 'Cantidad'
        Width = 67
        Position.ColIndex = 4
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object cxDBTreeList1PrecioUnit: TcxDBTreeListColumn
        Caption.AlignHorz = taRightJustify
        Caption.Text = 'Precio Unitario'
        DataBinding.FieldName = 'PrecioUnit'
        Width = 83
        Position.ColIndex = 5
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object cxDBTreeList1PrecioTotal: TcxDBTreeListColumn
        Caption.AlignHorz = taRightJustify
        Caption.Text = 'Precio Total'
        DataBinding.FieldName = 'PrecioTotal'
        Width = 73
        Position.ColIndex = 6
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object cxDBTreeList1Moneda: TcxDBTreeListColumn
        DataBinding.FieldName = 'Moneda'
        Width = 58
        Position.ColIndex = 7
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object cxDBTreeList1Notas: TcxDBTreeListColumn
        DataBinding.FieldName = 'Notas'
        Width = 290
        Position.ColIndex = 8
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
    end
    object cxGridService: TcxGrid
      Left = 10000
      Top = 10000
      Width = 457
      Height = 431
      BorderStyle = cxcbsNone
      TabOrder = 19
      Visible = False
      object DBLayoutView: TcxGridDBLayoutView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsItemsService
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        Images = Images
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsView.ScrollBars = ssNone
        OptionsView.CenterRecords = False
        OptionsView.RecordCaption.DisplayMask = '[RecordIndex] de [RecordCount]'
        OptionsView.ViewMode = lvvmSingleRow
        object DBLayoutViewNroItem: TcxGridDBLayoutViewItem
          DataBinding.FieldName = 'NroItem'
          LayoutItem = cxGridLayoutItem1
          Options.Filtering = False
        end
        object DBLayoutViewCodigo: TcxGridDBLayoutViewItem
          DataBinding.FieldName = 'Codigo'
          LayoutItem = DBLayoutViewLayoutItem2
          Options.Filtering = False
        end
        object DBLayoutViewDescripcion: TcxGridDBLayoutViewItem
          DataBinding.FieldName = 'Descripcion'
          LayoutItem = DBLayoutViewLayoutItem3
          Options.Filtering = False
        end
        object DBLayoutViewPrecio: TcxGridDBLayoutViewItem
          DataBinding.FieldName = 'Precio'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          LayoutItem = DBLayoutViewLayoutItem4
          Options.Filtering = False
        end
        object DBLayoutViewMoneda: TcxGridDBLayoutViewItem
          DataBinding.FieldName = 'Moneda'
          PropertiesClassName = 'TcxComboBoxProperties'
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            'Pesos'
            'D'#243'lar')
          LayoutItem = DBLayoutViewLayoutItem5
        end
        object DBLayoutViewDetalle: TcxGridDBLayoutViewItem
          DataBinding.FieldName = 'Detalle'
          PropertiesClassName = 'TcxMemoProperties'
          Properties.VisibleLineCount = 15
          LayoutItem = DBLayoutViewLayoutItem6
          Options.Filtering = False
        end
        object DBLayoutViewFechaEntrega: TcxGridDBLayoutViewItem
          DataBinding.FieldName = 'FechaEntrega'
          LayoutItem = DBLayoutViewLayoutItem1
          Options.Filtering = False
        end
        object DBLayoutViewPlazoEntrega: TcxGridDBLayoutViewItem
          Caption = 'Plazo de entrega (d'#237'as)'
          DataBinding.FieldName = 'PlazoEntrega'
          LayoutItem = DBLayoutViewLayoutItem7
          Options.Filtering = False
        end
        object DBLayoutViewAPartirDe: TcxGridDBLayoutViewItem
          Caption = 'A partir de'
          DataBinding.FieldName = 'APartirDe'
          PropertiesClassName = 'TcxComboBoxProperties'
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            'Pago de anticipo'
            '...')
          LayoutItem = DBLayoutViewLayoutItem8
          Options.Filtering = False
        end
        object dxLayoutGroup1: TdxLayoutGroup
          AlignHorz = ahLeft
          AlignVert = avTop
          CaptionOptions.Text = 'Template Card'
          CaptionOptions.Visible = False
          ButtonOptions.Buttons = <>
          Hidden = True
          LayoutDirection = ldHorizontal
          ShowBorder = False
          Index = -1
        end
        object DBLayoutViewGroup3: TdxLayoutGroup
          CaptionOptions.Text = 'Hidden Group'
          CaptionOptions.Visible = False
          Parent = dxLayoutGroup1
          SizeOptions.Width = 542
          ButtonOptions.Buttons = <>
          Hidden = True
          ShowBorder = False
          Index = 0
        end
        object cxGridLayoutItem1: TcxGridLayoutItem
          AlignHorz = ahLeft
          CaptionOptions.AlignHorz = taRightJustify
          Parent = DBLayoutViewGroup3
          SizeOptions.Width = 61
          Index = 0
        end
        object DBLayoutViewLayoutItem2: TcxGridLayoutItem
          CaptionOptions.AlignHorz = taRightJustify
          Parent = DBLayoutViewGroup2
          Index = 0
        end
        object DBLayoutViewLayoutItem3: TcxGridLayoutItem
          CaptionOptions.AlignHorz = taRightJustify
          Offsets.Left = 2
          Parent = DBLayoutViewGroup2
          SizeOptions.Width = 378
          Index = 1
        end
        object DBLayoutViewLayoutItem4: TcxGridLayoutItem
          CaptionOptions.ImageIndex = 2
          Parent = DBLayoutViewGroup4
          SizeOptions.Width = 64
          Index = 0
        end
        object DBLayoutViewLayoutItem5: TcxGridLayoutItem
          CaptionOptions.AlignHorz = taRightJustify
          Offsets.Left = 2
          Parent = DBLayoutViewGroup4
          SizeOptions.Width = 83
          Index = 1
        end
        object DBLayoutViewLayoutItem6: TcxGridLayoutItem
          CaptionOptions.ImageIndex = 0
          CaptionOptions.Visible = False
          Parent = dxLayoutGroup2
          Index = 0
        end
        object DBLayoutViewGroup2: TdxLayoutGroup
          CaptionOptions.Text = 'Hidden Group'
          CaptionOptions.Visible = False
          Parent = DBLayoutViewGroup3
          ButtonOptions.Buttons = <>
          Hidden = True
          LayoutDirection = ldHorizontal
          ShowBorder = False
          Index = 1
        end
        object DBLayoutViewGroup4: TdxLayoutGroup
          CaptionOptions.Text = 'Hidden Group'
          CaptionOptions.Visible = False
          Parent = DBLayoutViewGroup3
          ButtonOptions.Buttons = <>
          Hidden = True
          LayoutDirection = ldHorizontal
          ShowBorder = False
          Index = 2
        end
        object dxLayoutEmptySpaceItem1: TdxLayoutEmptySpaceItem
          CaptionOptions.Text = 'Empty Space Item'
          Parent = DBLayoutViewGroup3
          SizeOptions.Height = 6
          SizeOptions.Width = 10
          Index = 5
        end
        object dxLayoutGroup2: TdxLayoutGroup
          CaptionOptions.Text = 'New Group'
          CaptionOptions.Visible = False
          Parent = DBLayoutViewGroup3
          ButtonOptions.Buttons = <>
          LayoutDirection = ldTabbed
          ShowBorder = False
          Index = 6
        end
        object DBLayoutViewLayoutItem1: TcxGridLayoutItem
          Parent = DBLayoutViewGroup5
          Index = 0
        end
        object DBLayoutViewLayoutItem7: TcxGridLayoutItem
          Parent = DBLayoutViewGroup1
          SizeOptions.Width = 149
          Index = 0
        end
        object DBLayoutViewLayoutItem8: TcxGridLayoutItem
          CaptionOptions.AlignHorz = taRightJustify
          Parent = DBLayoutViewGroup1
          SizeOptions.Width = 171
          Index = 1
        end
        object DBLayoutViewSeparatorItem1: TdxLayoutSeparatorItem
          CaptionOptions.Text = 'Separator'
          Parent = DBLayoutViewGroup3
          SizeOptions.AssignedValues = [sovSizableHorz, sovSizableVert]
          SizeOptions.SizableHorz = False
          SizeOptions.SizableVert = False
          Index = 3
        end
        object DBLayoutViewGroup1: TdxLayoutGroup
          CaptionOptions.Text = 'New Group'
          CaptionOptions.Visible = False
          Parent = DBLayoutViewGroup5
          SizeOptions.Width = 267
          ButtonOptions.Buttons = <>
          LayoutDirection = ldHorizontal
          ShowBorder = False
          Index = 2
        end
        object DBLayoutViewGroup5: TdxLayoutGroup
          CaptionOptions.Text = 'Hidden Group'
          CaptionOptions.Visible = False
          Parent = DBLayoutViewGroup3
          ButtonOptions.Buttons = <>
          Hidden = True
          LayoutDirection = ldHorizontal
          ShowBorder = False
          Index = 4
        end
        object DBLayoutViewSeparatorItem2: TdxLayoutSeparatorItem
          CaptionOptions.Text = 'Separator'
          Parent = DBLayoutViewGroup5
          SizeOptions.AssignedValues = [sovSizableHorz, sovSizableVert]
          SizeOptions.SizableHorz = False
          SizeOptions.SizableVert = False
          Index = 1
        end
      end
      object cxGridServiceLevel1: TcxGridLevel
        GridView = DBLayoutView
      end
    end
    object cxComboBox1: TcxComboBox
      Left = 99
      Top = 68
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'Venta'
        'Reparaciones'
        'Ensayos Laboratorio'
        'Service')
      Properties.OnChange = cxComboBox1PropertiesChange
      Style.HotTrack = False
      TabOrder = 4
      Width = 168
    end
    object jktExpDBGrid6: TjktExpDBGrid
      Left = 10000
      Top = 10000
      Width = 903
      Height = 319
      TabOrder = 21
      Visible = False
      DataSource = dsTareasTaller
      object jktExpDBGrid6DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsTareasTaller
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsView.GroupByBox = False
        object jktExpDBGrid6DBTableView1Incluida: TcxGridDBColumn
          DataBinding.FieldName = 'Incluida'
          HeaderAlignmentHorz = taCenter
          Width = 52
        end
        object jktExpDBGrid6DBTableView1CodTarea: TcxGridDBColumn
          DataBinding.FieldName = 'CodTarea'
          SortIndex = 0
          SortOrder = soAscending
          Width = 70
        end
        object jktExpDBGrid6DBTableView1Descripcion: TcxGridDBColumn
          DataBinding.FieldName = 'Descripcion'
          Width = 430
        end
        object jktExpDBGrid6DBTableView1Comentario: TcxGridDBColumn
          DataBinding.FieldName = 'Comentario'
          Width = 349
        end
      end
      object jktExpDBGrid6Level1: TcxGridLevel
        GridView = jktExpDBGrid6DBTableView1
      end
    end
    object jktExpDBGrid7: TjktExpDBGrid
      Left = 10000
      Top = 10000
      Width = 903
      Height = 319
      TabOrder = 22
      Visible = False
      DataSource = dsTareasService
      object cxGridDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsTareasService
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsView.GroupByBox = False
        object cxGridDBColumn1: TcxGridDBColumn
          DataBinding.FieldName = 'Incluida'
          HeaderAlignmentHorz = taCenter
          Width = 52
        end
        object cxGridDBColumn2: TcxGridDBColumn
          DataBinding.FieldName = 'CodTarea'
          SortIndex = 0
          SortOrder = soAscending
          Width = 70
        end
        object cxGridDBColumn3: TcxGridDBColumn
          DataBinding.FieldName = 'Descripcion'
          Width = 430
        end
        object cxGridDBColumn4: TcxGridDBColumn
          DataBinding.FieldName = 'Comentario'
          Width = 349
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDBTableView1
      end
    end
    object jktExpDBGrid8: TjktExpDBGrid
      Left = 10000
      Top = 10000
      Width = 903
      Height = 319
      TabOrder = 23
      Visible = False
      DataSource = dsTareasLaboQuimico
      object cxGridDBTableView2: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsTareasLaboQuimico
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsView.GroupByBox = False
        object cxGridDBColumn5: TcxGridDBColumn
          DataBinding.FieldName = 'Incluida'
          HeaderAlignmentHorz = taCenter
          Width = 52
        end
        object cxGridDBColumn6: TcxGridDBColumn
          DataBinding.FieldName = 'CodTarea'
          SortIndex = 0
          SortOrder = soAscending
          Width = 70
        end
        object cxGridDBColumn7: TcxGridDBColumn
          DataBinding.FieldName = 'Descripcion'
          Width = 430
        end
        object cxGridDBColumn8: TcxGridDBColumn
          DataBinding.FieldName = 'Comentario'
          Width = 349
        end
      end
      object cxGridLevel2: TcxGridLevel
        GridView = cxGridDBTableView2
      end
    end
    object Scheduler: TcxScheduler
      Left = 10000
      Top = 10000
      Width = 781
      Height = 383
      ViewDay.TimeRulerMinutes = True
      ViewDay.TimeScale = 15
      ViewGantt.Active = True
      ViewGantt.Scales.MajorUnit = suMonth
      ViewGantt.Scales.MinorUnit = suDay
      ViewGantt.TreeBrowser.Width = 371
      ViewGantt.ShowExpandButtons = True
      ViewGantt.ShowTotalProgressLine = True
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
      OptionsView.ResourcesPerPage = 3
      OptionsView.ShowAdditionalTimeZone = True
      OptionsView.WorkStart = 0.375000000000000000
      OptionsView.WorkFinish = 0.750000000000000000
      ResourceNavigator.Buttons.ShowFewerResources.Hint = 'Mostrar menos sectores'
      ResourceNavigator.Buttons.ShowMoreResources.Hint = 'Mostrar m'#225's sectores'
      Storage = Storage
      TabOrder = 26
      Visible = False
      Selection = 1
      Splitters = {
        7D0200007E0000000C0300008300000078020000010000007D0200007E010000}
      StoredClientBounds = {01000000010000000C0300007E010000}
      object cxPageControl1: TcxPageControl
        Left = 0
        Top = 0
        Width = 143
        Height = 251
        Align = alClient
        TabOrder = 0
        Properties.ActivePage = tbsGantt
        Properties.CustomButtons.Buttons = <>
        ExplicitHeight = 342
        ClientRectBottom = 246
        ClientRectLeft = 2
        ClientRectRight = 138
        ClientRectTop = 25
        object tbsGantt: TcxTabSheet
          Caption = 'Gantt'
          ImageIndex = 3
          ExplicitHeight = 140
          DesignSize = (
            136
            221)
          object btnGanttExpandAll: TcxButton
            Tag = 1
            Left = 8
            Top = 38
            Width = 120
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Expand All'
            TabOrder = 0
            OnClick = btnGanttCollapseAllClick
          end
          object btnGanttCollapseAll: TcxButton
            Left = 8
            Top = 8
            Width = 120
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Collapse All'
            TabOrder = 1
            OnClick = btnGanttCollapseAllClick
          end
          object cbxEventsStyle: TcxComboBox
            Left = 8
            Top = 86
            Properties.DropDownListStyle = lsFixedList
            Properties.Items.Strings = (
              'Default'
              'Progress')
            Properties.OnChange = cbxEventsStylePropertiesChange
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
            OnClick = cbxExpandButtonClick
            Width = 121
          end
          object cbxProgress: TcxCheckBox
            Left = 8
            Top = 139
            Caption = 'Progress Line'
            State = cbsChecked
            TabOrder = 5
            Transparent = True
            OnClick = cbxProgressClick
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
            OnClick = cbxSnapGanttEventsClick
            Width = 121
          end
          object cbxTreeBrowser: TcxCheckBox
            Left = 8
            Top = 192
            Caption = 'Tree Browser'
            Properties.MultiLine = True
            TabOrder = 7
            Transparent = True
            OnClick = cbxTreeBrowserClick
            Width = 121
          end
        end
        object cxTabSheet1: TcxTabSheet
          Caption = 'Vista'
          ImageIndex = 1
          ExplicitHeight = 312
          object cxGroupBox1: TcxGroupBox
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
              Properties.OnChange = cxComboBox2PropertiesChange
              TabOrder = 0
              Text = 'Sector'
              Width = 105
            end
            object cxLabel1: TcxLabel
              Left = 11
              Top = 8
              Caption = 'Agrupar por:'
            end
          end
        end
      end
    end
    object SchedulerGrid: TjktExpDBGrid
      Left = 10000
      Top = 10000
      Width = 752
      Height = 270
      Align = alClient
      TabOrder = 27
      Visible = False
      object jktExpDBGrid1TableView1: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.CellHints = True
        OptionsBehavior.ImmediateEditor = False
        object jktExpDBGrid1TableView1cxGridColumn1: TcxGridColumn
          Caption = 'ID'
          DataBinding.ValueType = 'Integer'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          Options.Editing = False
        end
        object jktExpDBGrid1TableView1cxGridColumn2: TcxGridColumn
          Caption = 'ParentID'
          DataBinding.ValueType = 'Integer'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          Options.Editing = False
        end
        object jktExpDBGrid1TableView1cxGridColumn3: TcxGridColumn
          Caption = 'GroupID'
          DataBinding.ValueType = 'Variant'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          Options.Editing = False
        end
        object jktExpDBGrid1TableView1cxGridColumn5: TcxGridColumn
          Caption = 'Tarea'
          PropertiesClassName = 'TcxMemoProperties'
          Width = 124
        end
        object jktExpDBGrid1TableView1cxGridColumn21: TcxGridColumn
          Caption = 'Sector'
          PropertiesClassName = 'TcxTextEditProperties'
          Options.Editing = False
        end
        object jktExpDBGrid1TableView1cxGridColumn7: TcxGridColumn
          Caption = 'Actual Finish'
          DataBinding.ValueType = 'Integer'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Kind = ckDateTime
          Visible = False
          Options.Editing = False
        end
        object jktExpDBGrid1TableView1cxGridColumn8: TcxGridColumn
          Caption = 'Actual Start'
          DataBinding.ValueType = 'Integer'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Kind = ckDateTime
          Visible = False
          Options.Editing = False
        end
        object jktExpDBGrid1TableView1cxGridColumn10: TcxGridColumn
          Caption = 'Start'
          DataBinding.ValueType = 'DateTime'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Kind = ckDateTime
          Width = 80
        end
        object jktExpDBGrid1TableView1cxGridColumn9: TcxGridColumn
          Caption = 'Finish'
          DataBinding.ValueType = 'DateTime'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Kind = ckDateTime
          Width = 80
        end
        object jktExpDBGrid1TableView1cxGridColumn11: TcxGridColumn
          Caption = 'Message'
          PropertiesClassName = 'TcxMemoProperties'
          Visible = False
        end
        object jktExpDBGrid1TableView1cxGridColumn12: TcxGridColumn
          Caption = 'Type'
          DataBinding.ValueType = 'Integer'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Items = <
            item
              Description = 'Recurrence Pattern'
              ImageIndex = 2
              Value = 1
            end
            item
              Description = 'Custom Occurrence'
              ImageIndex = 3
              Value = 4
            end>
          Properties.ShowDescriptions = False
          Visible = False
          Options.Editing = False
        end
        object jktExpDBGrid1TableView1cxGridColumn6: TcxGridColumn
          Caption = 'Location'
          PropertiesClassName = 'TcxMemoProperties'
          Width = 45
        end
        object jktExpDBGrid1TableView1cxGridColumn4: TcxGridColumn
          Caption = 'State'
          DataBinding.ValueType = 'Integer'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Items = <
            item
              Description = 'Free'
              ImageIndex = 0
              Value = 0
            end
            item
              Description = 'Tentative'
              ImageIndex = 1
              Value = 1
            end
            item
              Description = 'Busy'
              ImageIndex = 2
              Value = 2
            end
            item
              Description = 'Out of office'
              ImageIndex = 3
              Value = 3
            end>
          Width = 84
        end
        object jktExpDBGrid1TableView1cxGridColumn13: TcxGridColumn
          Caption = 'Reminder'
          DataBinding.ValueType = 'Boolean'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Width = 50
        end
        object jktExpDBGrid1TableView1cxGridColumn14: TcxGridColumn
          Caption = 'All Day Event'
          DataBinding.ValueType = 'Boolean'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Width = 69
        end
        object jktExpDBGrid1TableView1cxGridColumn15: TcxGridColumn
          Caption = 'Enabled'
          DataBinding.ValueType = 'Boolean'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Width = 43
        end
        object jktExpDBGrid1TableView1cxGridColumn16: TcxGridColumn
          Caption = 'Label'
          DataBinding.ValueType = 'Integer'
          PropertiesClassName = 'TcxColorComboBoxProperties'
          Properties.CustomColors = <>
          Properties.DefaultColor = clNone
          Properties.DefaultColorStyle = cxdcClear
          Properties.DefaultDescription = 'None'
          Properties.NamingConvention = cxncNone
          Width = 110
        end
        object jktExpDBGrid1TableView1cxGridColumn17: TcxGridColumn
          Caption = 'Recurrence Pattern'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          Options.Editing = False
          Width = 99
        end
        object jktExpDBGrid1TableView1cxGridColumn18: TcxGridColumn
          Caption = 'Recurrence Index'
          DataBinding.ValueType = 'Integer'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          Options.Editing = False
        end
        object jktExpDBGrid1TableView1cxGridColumn19: TcxGridColumn
          Caption = 'ReminderDate'
          DataBinding.ValueType = 'DateTime'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Kind = ckDateTime
          Visible = False
          Options.Editing = False
        end
        object jktExpDBGrid1TableView1cxGridColumn20: TcxGridColumn
          Caption = 'Reminder Minutes Before Start'
          DataBinding.ValueType = 'Integer'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          Options.Editing = False
        end
        object jktExpDBGrid1TableView1cxGridColumn22: TcxGridColumn
          Caption = 'Task Complete'
          DataBinding.ValueType = 'Integer'
          PropertiesClassName = 'TcxProgressBarProperties'
          Visible = False
        end
        object jktExpDBGrid1TableView1cxGridColumn23: TcxGridColumn
          Caption = 'Task Links'
          DataBinding.ValueType = 'Variant'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          Options.Editing = False
        end
        object jktExpDBGrid1TableView1cxGridColumn24: TcxGridColumn
          Caption = 'Task Index'
          DataBinding.ValueType = 'Integer'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          Options.Editing = False
        end
        object jktExpDBGrid1TableView1cxGridColumn25: TcxGridColumn
          Caption = 'Task Status'
          DataBinding.ValueType = 'Integer'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Items = <
            item
              Description = 'Not Started'
              ImageIndex = 1
              Value = 0
            end
            item
              Description = 'In Progress'
              ImageIndex = 2
              Value = 1
            end
            item
              Description = 'Complete'
              ImageIndex = 2
              Value = 2
            end
            item
              Description = 'Waiting'
              ImageIndex = 4
              Value = 3
            end
            item
              Description = 'Deferred'
              ImageIndex = 5
              Value = 4
            end>
          Visible = False
        end
      end
      object cxGridLevel3: TcxGridLevel
        GridView = jktExpDBGrid1TableView1
      end
    end
    object lcMainGroup_Root: TdxLayoutGroup
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
      Parent = lcMainGroup_Root
      ButtonOptions.Buttons = <>
      ItemIndex = 1
      Index = 0
    end
    object lcMainItem2: TdxLayoutItem
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Nro. Pedido:'
      Parent = lcMainGroup2
      Control = cxDBTextEdit2
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcMainItem3: TdxLayoutItem
      AlignHorz = ahLeft
      CaptionOptions.Text = 'En base a Presupuesto Nro.:'
      Parent = lcMainGroup2
      Control = cxDBTextEdit3
      ControlOptions.AutoControlAreaAlignment = False
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object lcMainItem4: TdxLayoutItem
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Orden de Compra:'
      Parent = lcMainGroup2
      Control = cxDBTextEdit4
      ControlOptions.AutoControlAreaAlignment = False
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object lcMainGroup4: TdxLayoutGroup
      AlignHorz = ahClient
      CaptionOptions.Text = 'General'
      Parent = lcMainGroup3
      ButtonOptions.Buttons = <>
      ItemIndex = 1
      Index = 0
    end
    object lcMainGroup3: TdxLayoutGroup
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      Parent = lcMainGroup_Root
      ButtonOptions.Buttons = <>
      LayoutDirection = ldTabbed
      ShowBorder = False
      Index = 1
    end
    object lcMainGroup5: TdxLayoutGroup
      CaptionOptions.Text = 'Condiciones de Transporte (Responsables)'
      Parent = lcMainGroup4
      ButtonOptions.Buttons = <>
      ButtonOptions.ShowExpandButton = True
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      Index = 2
    end
    object lcMainGroup6: TdxLayoutGroup
      CaptionOptions.Text = 'Forma y Condiciones de Facturaci'#243'n'
      Parent = lcMainGroup4
      ButtonOptions.Buttons = <>
      ButtonOptions.ShowExpandButton = True
      Index = 3
    end
    object lcMainGroup7: TdxLayoutGroup
      CaptionOptions.Text = 'P'#243'lizas de Seguros'
      Parent = lcMainGroup3
      ButtonOptions.Buttons = <>
      ButtonOptions.ShowExpandButton = True
      Index = 3
    end
    object lcMainItem6: TdxLayoutItem
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Fecha:'
      Parent = lcMainGroup2
      Control = cxDBDateEdit1
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcMainItem7: TdxLayoutItem
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Raz'#243'n Social:'
      Parent = lcMainGroup9
      Control = cxDBTextEdit6
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcMainItem8: TdxLayoutItem
      AlignHorz = ahLeft
      Parent = lcMainGroup11
      Control = cxDBTextEdit7
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcMainItem9: TdxLayoutItem
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Representante:'
      Parent = lcMainGroup11
      Control = cxDBTextEdit8
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object lcMainGroup8: TdxLayoutGroup
      AlignHorz = ahClient
      CaptionOptions.Text = 'Contactos'
      Parent = lcMainGroup4
      ButtonOptions.Buttons = <>
      ButtonOptions.ShowExpandButton = True
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      Index = 1
    end
    object lcMainItem10: TdxLayoutItem
      CaptionOptions.Text = 'Comerciales'
      CaptionOptions.Layout = clTop
      Parent = lcMainGroup8
      Control = jktExpDBGrid1
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcMainItem11: TdxLayoutItem
      CaptionOptions.Text = 'T'#233'cnicos'
      CaptionOptions.Layout = clTop
      Parent = lcMainGroup8
      Control = jktExpDBGrid2
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcMainGroup11: TdxLayoutGroup
      CaptionOptions.Text = 'Datos Comerciales'
      Parent = lcMainGroup4
      ButtonOptions.Buttons = <>
      ButtonOptions.ShowExpandButton = True
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      Index = 0
    end
    object lcMainItem5: TdxLayoutItem
      AlignHorz = ahLeft
      CaptionOptions.Text = 'jktExpDBGrid3'
      CaptionOptions.Visible = False
      Parent = lcMainGroup6
      Control = jktExpDBGrid3
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcMainItem12: TdxLayoutItem
      CaptionOptions.Text = 'Nro. Cliente:'
      Parent = lcMainGroup9
      Control = cxDBButtonEdit1
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcMainGroup13: TdxLayoutGroup
      CaptionOptions.Text = #205'tems'
      Parent = lcMainGroup3
      ButtonOptions.Buttons = <>
      ItemIndex = 1
      Index = 1
    end
    object lcMainGroup2: TdxLayoutGroup
      CaptionOptions.Text = 'Datos del Pedido'
      Parent = lcMainGroup1
      ButtonOptions.Buttons = <>
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
    object lcMainItem15: TdxLayoutItem
      CaptionOptions.Text = 'cxRadioButton1'
      CaptionOptions.Visible = False
      Parent = lcMainGroup10
      Control = cxRadioButton1
      ControlOptions.AutoColor = True
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcMainItem16: TdxLayoutItem
      CaptionOptions.Text = 'cxRadioButton2'
      CaptionOptions.Visible = False
      Parent = lcMainGroup10
      Control = cxRadioButton2
      ControlOptions.AutoColor = True
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcMainGroup10: TdxLayoutGroup
      CaptionOptions.Text = 'Carga'
      Parent = lcMainGroup5
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      Index = 0
    end
    object lcMainGroup14: TdxLayoutGroup
      CaptionOptions.Text = 'Transporte'
      Parent = lcMainGroup5
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      Index = 1
    end
    object lcMainGroup15: TdxLayoutGroup
      CaptionOptions.Text = 'Descarga'
      Parent = lcMainGroup5
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      Index = 2
    end
    object lcMainItem13: TdxLayoutItem
      CaptionOptions.Text = 'cxRadioButton3'
      CaptionOptions.Visible = False
      Parent = lcMainGroup14
      Control = cxRadioButton3
      ControlOptions.AutoColor = True
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcMainItem14: TdxLayoutItem
      CaptionOptions.Text = 'cxRadioButton4'
      CaptionOptions.Visible = False
      Parent = lcMainGroup14
      Control = cxRadioButton4
      ControlOptions.AutoColor = True
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcMainItem17: TdxLayoutItem
      CaptionOptions.Text = 'cxRadioButton5'
      CaptionOptions.Visible = False
      Parent = lcMainGroup15
      Control = cxRadioButton5
      ControlOptions.AutoColor = True
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcMainItem18: TdxLayoutItem
      CaptionOptions.Text = 'cxRadioButton6'
      CaptionOptions.Visible = False
      Parent = lcMainGroup15
      Control = cxRadioButton6
      ControlOptions.AutoColor = True
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcMainSeparatorItem1: TdxLayoutSeparatorItem
      CaptionOptions.Text = 'Separator'
      Parent = lcMainGroup1
      SizeOptions.AssignedValues = [sovSizableHorz, sovSizableVert]
      SizeOptions.SizableHorz = False
      SizeOptions.SizableVert = False
      Index = 2
    end
    object lcMainItem1: TdxLayoutItem
      CaptionOptions.Text = 'Vendedor Comercial:'
      Parent = lcMainGroup11
      Control = cxDBButtonEdit2
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcMainItem19: TdxLayoutItem
      AlignHorz = ahLeft
      CaptionOptions.Text = 'jktExpDBGrid4'
      CaptionOptions.Visible = False
      Parent = lcMainGroup7
      Control = jktExpDBGrid4
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcMainGroup16: TdxLayoutGroup
      CaptionOptions.Text = 'Archivos asociados y Notas'
      Parent = lcMainGroup3
      ButtonOptions.Buttons = <>
      Index = 4
    end
    object lcMainItem20: TdxLayoutItem
      CaptionOptions.Text = 'jktExpDBGrid5'
      CaptionOptions.Visible = False
      Parent = lcMainGroup16
      Control = jktExpDBGrid5
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcMainGroupLaboratorio: TdxLayoutGroup
      CaptionOptions.Text = 'Laboratorio'
      Parent = lcMainGroup13
      Visible = False
      ButtonOptions.Buttons = <>
      Index = 1
    end
    object lcMainGroupService: TdxLayoutGroup
      CaptionOptions.Text = 'Service'
      Parent = lcMainGroup13
      Visible = False
      ButtonOptions.Buttons = <>
      Index = 0
    end
    object lcMainItem21: TdxLayoutItem
      CaptionOptions.Text = 'cxDBTreeList1'
      CaptionOptions.Visible = False
      Parent = lcMainGroupLaboratorio
      Control = cxDBTreeList1
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcMainItem22: TdxLayoutItem
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Parent = lcMainGroupService
      Control = cxGridService
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcMainItem23: TdxLayoutItem
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Tipo de Pedido:'
      Parent = lcMainGroup1
      Control = cxComboBox1
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcMainGroup12: TdxLayoutGroup
      CaptionOptions.Text = 'Solicitudes de Trabajo'
      Parent = lcMainGroup3
      ButtonOptions.Buttons = <>
      ItemIndex = 1
      Index = 2
    end
    object lcMainGroup17: TdxLayoutGroup
      CaptionOptions.Text = 'Taller'
      Parent = lcMainGroup21
      ButtonOptions.Buttons = <>
      Index = 0
    end
    object lcMainGroup18: TdxLayoutGroup
      CaptionOptions.Text = 'Service'
      Parent = lcMainGroup21
      ButtonOptions.Buttons = <>
      Index = 1
    end
    object lcMainGroup19: TdxLayoutGroup
      CaptionOptions.Text = 'Laboratorio Qu'#237'mico'
      Parent = lcMainGroup21
      ButtonOptions.Buttons = <>
      Index = 2
    end
    object lcMainGroup20: TdxLayoutGroup
      CaptionOptions.Text = 'Laboratorio El'#233'ctrico'
      Parent = lcMainGroup21
      ButtonOptions.Buttons = <>
      Index = 3
    end
    object lcMainLabeledItem1: TdxLayoutLabeledItem
      CaptionOptions.Text = #211'rdenes de trabajo para los distintos sectores'
      Parent = lcMainGroup12
      Index = 0
    end
    object lcMainGroup21: TdxLayoutGroup
      CaptionOptions.Text = 'New Group'
      Parent = lcMainGroup12
      ButtonOptions.Buttons = <>
      Hidden = True
      ItemIndex = 2
      LayoutDirection = ldTabbed
      ShowBorder = False
      Index = 1
    end
    object lcMainItem24: TdxLayoutItem
      AlignHorz = ahLeft
      CaptionOptions.Text = 'jktExpDBGrid6'
      CaptionOptions.Visible = False
      Parent = lcMainGroup17
      Control = jktExpDBGrid6
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcMainItem26: TdxLayoutItem
      AlignHorz = ahLeft
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Parent = lcMainGroup18
      Control = jktExpDBGrid7
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcMainItem25: TdxLayoutItem
      AlignHorz = ahLeft
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Parent = lcMainGroup19
      Control = jktExpDBGrid8
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcMainGroup22: TdxLayoutGroup
      CaptionOptions.Text = 'Agenda'
      Parent = lcMainGroup3
      ButtonOptions.Buttons = <>
      Index = 5
    end
    object lcMainItem27: TdxLayoutItem
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Parent = lcMainGroup22
      Control = Scheduler
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcMainItem28: TdxLayoutItem
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Parent = lcMainGroup22
      Control = SchedulerGrid
      ControlOptions.ShowBorder = False
      Index = 1
    end
  end
  inherited BarManager: TdxBarManager
    Left = 352
    Top = 8
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited Driver: TjktDriver
    Left = 608
    Top = 8
  end
  inherited IdHTTP: TIdHTTP
    Left = 496
    Top = 8
  end
  inherited Service: TjktServiceCaller
    Left = 448
    Top = 8
  end
  inherited OperacionSave: TjktOperacion
    Atributos = <
      item
        Dataset = TCondicionesFacturacion
        Tag = 0
      end
      item
        Dataset = TContactosComerciales
        Tag = 0
      end
      item
        Dataset = TContactosTecnicos
        Tag = 0
      end
      item
        Dataset = TPolizasSeguros
        Tag = 0
      end
      item
        Dataset = TArchivosAsociados
        Tag = 0
      end
      item
        Dataset = TItemsLaboratorio
        Tag = 0
      end
      item
        Dataset = TItemsService
        Tag = 0
      end
      item
        Dataset = TTareasTaller
        Tag = 0
      end
      item
        Dataset = TTareasService
        Tag = 0
      end
      item
        Dataset = TTareasLaboQuimico
        Tag = 0
      end>
    Left = 672
    Top = 8
  end
  object TCondicionesFacturacion: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Concepto'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Importe'
        DataType = ftFloat
      end
      item
        Name = 'Moneda'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'FormaPago'
        DataType = ftString
        Size = 20
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
    Left = 120
    Top = 360
    object TCondicionesFacturacionConcepto: TStringField
      FieldName = 'Concepto'
      Size = 40
    end
    object TCondicionesFacturacionImporte: TFloatField
      FieldName = 'Importe'
    end
    object TCondicionesFacturacionMoneda: TStringField
      FieldName = 'Moneda'
      Size = 5
    end
    object TCondicionesFacturacionFormaPago: TStringField
      FieldName = 'FormaPago'
    end
  end
  object dsCondicionesFacturacion: TDataSource
    DataSet = TCondicionesFacturacion
    Left = 80
    Top = 360
  end
  object TContactosComerciales: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'NombreApellido'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Telefono'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Email'
        DataType = ftString
        Size = 50
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
    Left = 120
    Top = 312
    object TContactosComercialesNombreApellido: TStringField
      FieldName = 'NombreApellido'
      Size = 40
    end
    object TContactosComercialesTelefono: TStringField
      FieldName = 'Telefono'
    end
    object TContactosComercialesEmail2: TStringField
      FieldName = 'Email'
      Size = 50
    end
  end
  object dsContactosComerciales: TDataSource
    DataSet = TContactosComerciales
    Left = 80
    Top = 312
  end
  object dsContactosTecnicos: TDataSource
    DataSet = TContactosTecnicos
    Left = 80
    Top = 264
  end
  object TContactosTecnicos: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'NombreApellido'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Telefono'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Email'
        DataType = ftString
        Size = 50
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
    Left = 120
    Top = 264
    object StringField1: TStringField
      FieldName = 'NombreApellido'
      Size = 40
    end
    object StringField2: TStringField
      FieldName = 'Telefono'
    end
    object StringField3: TStringField
      FieldName = 'Email'
      Size = 50
    end
  end
  object LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 608
    Top = 64
    object dxLayoutWebLookAndFeel1: TdxLayoutWebLookAndFeel
    end
    object dxLayoutSkinLookAndFeel1: TdxLayoutSkinLookAndFeel
    end
  end
  object TPolizasSeguros: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Compania'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'TipoPoliza'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Monto'
        DataType = ftFloat
      end
      item
        Name = 'Vencimiento'
        DataType = ftDate
      end
      item
        Name = 'Contactos'
        DataType = ftString
        Size = 40
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
    Left = 408
    Top = 264
    object TPolizasSegurosCompania: TStringField
      FieldName = 'Compania'
      Size = 40
    end
    object TPolizasSegurosTipoPoliza: TStringField
      FieldName = 'TipoPoliza'
      Size = 40
    end
    object TPolizasSegurosMonto: TFloatField
      FieldName = 'Monto'
    end
    object TPolizasSegurosVencimiento: TDateField
      FieldName = 'Vencimiento'
    end
    object TPolizasSegurosContactos: TStringField
      FieldName = 'Contactos'
      Size = 40
    end
  end
  object dsPolizasSeguros: TDataSource
    DataSet = TPolizasSeguros
    Left = 368
    Top = 264
  end
  object TArchivosAsociados: TjktMemTable
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
    Left = 544
    Top = 264
    object TArchivosAsociadosFechaSubida: TDateTimeField
      FieldName = 'FechaSubida'
    end
    object TArchivosAsociadosUsuario: TStringField
      FieldName = 'Usuario'
    end
    object TArchivosAsociadosComentario: TStringField
      FieldName = 'Comentario'
      Size = 50
    end
    object TArchivosAsociadosArchivo: TStringField
      FieldName = 'Archivo'
      Size = 100
    end
  end
  object dsArchivosAsociados: TDataSource
    DataSet = TArchivosAsociados
    Left = 504
    Top = 264
  end
  object OpenDialog: TOpenDialog
    Left = 672
    Top = 64
  end
  object dsItemsLaboratorio: TDataSource
    DataSet = TItemsLaboratorio
    Left = 232
    Top = 264
  end
  object TItemsLaboratorio: TjktMemTable
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
    Left = 272
    Top = 264
    object TItemsLaboratorioCodItem: TIntegerField
      FieldName = 'CodItem'
    end
    object TItemsLaboratorioCodItemPadre: TIntegerField
      FieldName = 'CodItemPadre'
    end
    object TItemsLaboratorioEnsayo: TIntegerField
      FieldName = 'Ensayo'
    end
    object TItemsLaboratorioDescripcion: TStringField
      FieldName = 'Descripcion'
      Size = 300
    end
    object TItemsLaboratorioTomaMuestra: TBooleanField
      FieldName = 'TomaMuestra'
    end
    object TItemsLaboratorioCantidad: TIntegerField
      FieldName = 'Cantidad'
    end
    object TItemsLaboratorioPrecio: TFloatField
      FieldName = 'PrecioUnit'
    end
    object TItemsLaboratorioPrecioTotal: TFloatField
      FieldName = 'PrecioTotal'
    end
    object TItemsLaboratorioMoneda: TStringField
      FieldName = 'Moneda'
      Size = 5
    end
    object TItemsLaboratorioNotas: TStringField
      FieldName = 'Notas'
      Size = 300
    end
  end
  object TItemsService: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'NroItem'
        DataType = ftInteger
      end
      item
        Name = 'Codigo'
        DataType = ftInteger
      end
      item
        Name = 'Descripcion'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'Precio'
        DataType = ftFloat
      end
      item
        Name = 'Moneda'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Detalle'
        DataType = ftMemo
      end
      item
        Name = 'FechaEntrega'
        DataType = ftDateTime
      end
      item
        Name = 'PlazoEntrega'
        DataType = ftInteger
      end
      item
        Name = 'APartirDe'
        DataType = ftString
        Size = 20
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
    Left = 272
    Top = 312
    object TItemsServiceNroItem: TIntegerField
      FieldName = 'NroItem'
    end
    object TItemsServiceCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object TItemsServiceDescripcion: TStringField
      FieldName = 'Descripcion'
      Size = 300
    end
    object TItemsServicePrecio: TFloatField
      FieldName = 'Precio'
    end
    object TItemsServiceMoneda: TStringField
      FieldName = 'Moneda'
      Size = 5
    end
    object TItemsServiceDetalle: TMemoField
      FieldName = 'Detalle'
      BlobType = ftMemo
    end
    object TItemsServiceFechaEntrega: TDateTimeField
      FieldName = 'FechaEntrega'
    end
    object TItemsServicePlazoEntrega: TIntegerField
      FieldName = 'PlazoEntrega'
    end
    object TItemsServiceAPartirDe: TStringField
      FieldName = 'APartirDe'
    end
  end
  object dsItemsService: TDataSource
    DataSet = TItemsService
    Left = 232
    Top = 312
  end
  object Images: TcxImageList
    FormatVersion = 1
    DesignInfo = 5243328
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000101010108282
          82FF828282FF828282FF818181FF818181FF818181FFBBB8B4FFBBB8B4FFBBB8
          B4FFBBB8B4FFBBB8B4FFBBB8B4FFBBB8B4FFBBB8B4FFBBB8B4FF404040408F8F
          8FFFFDFDFDFFADBBD7FFF9F9F9FFF9F9F9FFF9F9F9FFBBB8B4FFFEFDFCFFFDFB
          F8FFEDD8CBFFC1805CFFF5E9E0FFFAF3ECFFFAF2E9FFBBB8B4FF404040409999
          99FF959596FFADBBD7FFE2C1A3FFE2C1A3FFE2C1A3FFBBB8B4FFFDFBF8FFFDF9
          F5FFC6855BFFC57941FFCE997AFFFAF2E9FFF9F0E6FFBBB8B4FF40404040A2A2
          A2FFFAFAFAFFADBBD7FFEBEBEBFFEBEBEBFFEBEBEBFFBBB8B4FFFDF9F5FFE9D2
          C4FFD38F55FFD28C4FFFBE6B30FFF3E4D8FFF8EEE2FFBBB8B4FF40404040AAAA
          AAFFE2C1A3FFADBBD7FFE2C1A3FFE2C1A3FFE2C1A3FFBBB8B4FFFCF7F2FFDFBA
          A2FFD1966BFFCD9675FFD08442FFCD9775FFF7ECDFFFBBB8B4FF40404040AFAF
          AFFFFBFBFBFFADBBD7FFF0F0F0FFF0F0F0FFF0F0F0FFBBB8B4FFFBF5EFFFFAF3
          ECFFFAF2E9FFF9F0E6FFCF9060FFB66028FFF0DFCEFFBBB8B4FF40404040B5B5
          B5FFE2C1A3FFADBBD7FFE2C1A3FFE2C1A3FFE2C1A3FFBBB8B4FFFAF3ECFFFAF2
          E9FFF9F0E6FFF8EEE2FFD7AC90FFB6622DFFC88E6DFFBBB8B4FF40404040B8B8
          B8FF959596FFADBBD7FFF4F4F4FFF5F5F5FFF5F5F5FFBBB8B4FFFAF2E9FFF9F0
          E6FFF8EEE2FFF7ECDFFFF6EADCFFBE7A55FFC38561FFBBB8B4FF40404040BBBB
          BBFFE2C1A3FFADBBD7FFE2C1A3FFE2C1A3FFE2C1A3FFBBB8B4FFBBB8B4FFBBB8
          B4FFBBB8B4FFBBB8B4FFBBB8B4FFBBB8B4FFBBB8B4FFBBB8B4FF40404040BDBD
          BDFFFDFDFDFFADBBD7FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF7F7F7FFF6F6
          F6FFF5F5F5FFF4F4F4FFFCFCFCFFBDBDBDFF000000000000000040404040BEBE
          BEFFE2C1A3FFADBBD7FFE2C1A3FFE2C1A3FFE2C1A3FFE2C1A3FFE2C1A3FFE2C1
          A3FFE2C1A3FFE2C1A3FFE2C1A3FFBEBEBEFF000000000000000040404040BFBF
          BFFFFDFDFDFFADBBD7FFFAFAFAFFFAFAFAFFFBFBFBFFFAFAFAFFFAFAFAFFF9F9
          F9FFF8F8F8FFF6F6F6FFFDFDFDFFBFBFBFFF000000000000000040404040C0C0
          C0FFE2C1A3FFADBBD7FFE2C1A3FFE2C1A3FFE2C1A3FFE2C1A3FFE2C1A3FFE2C1
          A3FFC0C0C0FFCBCBCBFFDBDBDBFFB3B3B3EF000000000000000040404040C0C0
          C0FF959596FFADBBD7FFFBFBFBFFFCFCFCFFFCFCFCFFFCFCFCFFFBFBFBFFFAFA
          FAFFCBCBCBFFE2E2E2FFB4B4B4EF24242430000000000000000040404040C0C0
          C0FFFFFFFFFFADBBD7FFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFAFA
          FAFFDBDBDBFFB4B4B4EF2424243000000000000000000000000010101010C0C0
          C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
          C0FFB4B4B4EF2424243000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000000090B1016A7C4FF16A7C4FF001C223000000000000000000138
          456016A7C4FF16A7C4FF00090B10000000000000000000000000000000000000
          00000000000016A7C4FF73D8E6FF77E0ECFF16A7C4FF16A7C4FF16A7C4FF1BAE
          C9FF37D5E6FF27C8DCFF16A7C4FF000000000000000000000000000000000000
          00000000000016A7C4FF98EAF3FF89E7F1FF74DFECFF6DE1EDFF59D9E8FF50DB
          EAFF41D8E8FF33D4E6FF16A7C4FF000000000000000000000000000000000000
          00000000000016A7C4FF9FEBF4FF8BE4EEFF6AD3E3FF74D6E5FF6DD5E4FF4CCD
          DFFF47D5E6FF37CFE1FF16A7C4FF000000000000000000000000012F395016A7
          C4FF16A7C4FF6BD3E3FF87DFEBFF8EDFEAFF16A7C4FF16A7C4FF16A7C4FF16A7
          C4FF61D5E5FF3FD0E2FF24BAD2FF16A7C4FF16A7C4FF0013172016A7C4FF50CD
          E0FF61D4E4FF84E6F0FF7DD8E6FF16A7C4FFA7A7A7FFA7A7A7FFA7A7A7FFA7A7
          A7FF16A7C4FF5AD0E1FF45D8E8FF2BC5DBFF22C1D7FF16A7C4FF16A7C4FF62DF
          ECFF6FE1EEFF64D5E4FF16A7C4FFA7A7A7FFFEFEFEFFFDFDFDFFF7F7F7FFE5E5
          E5FFA7A7A7FF16A7C4FF45D2E3FF42D8E8FF33D4E6FF16A7C4FF16A7C4FF44CB
          DEFF65DFECFF54CEE0FF16A7C4FFA7A7A7FFF9F9F9FFF9F9F9FFF4F4F4FFE5E5
          E5FFA7A7A7FF16A7C4FF43CBDEFF4DDAE9FF27BED5FF16A7C4FF0000000016A7
          C4FF47CBDEFF4DCDDFFF16A7C4FFA7A7A7FFE8E8E8FFEEEEEEFFE9E9E9FFDADA
          DAFFA7A7A7FF16A7C4FF4CCCDFFF34BDD4FF16A7C4FF00000000000000000013
          172016A7C4FF5FDEECFF16A7C4FFA7A7A7FFBCBCBCFFD5D5D5FFD2D2D2FFB9B9
          B9FFA7A7A7FF16A7C4FF71E1EEFF16A7C4FF000000000000000000000000012F
          395016A7C4FF55DCEAFF4FD1E2FF16A7C4FFA7A7A7FFA7A7A7FFA7A7A7FFA7A7
          A7FF16A7C4FF70D7E6FF7CE4EFFF16A7C4FF001C2230000000000000000016A7
          C4FF40D7E8FF4CDAE9FF58DDEBFF52D1E2FF16A7C4FF16A7C4FF16A7C4FF16A7
          C4FF8BE0ECFF95E9F2FF86E6F0FF78E3EFFF16A7C4FF000000000000000016A7
          C4FF33CEE1FF3BD0E2FF16A7C4FF5CDDEBFF68E0EDFF74E2EEFF81E5F0FF8DE8
          F1FF90E5EFFF16A7C4FF91E8F2FF7BE0ECFF16A7C4FF00000000000000000009
          0B1016A7C4FF16A7C4FF012F395016A7C4FF16A7C4FF6BE0EDFF77E3EFFF16A7
          C4FF16A7C4FF012F395016A7C4FF16A7C4FF00090B1000000000000000000000
          00000000000000000000000000000000000016A7C4FF62DEECFF6EE1EDFF16A7
          C4FF000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000C6F84AF16A7C4FF16A7C4FF0141
          5070000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000503
          020C3A1D1988793C1ADA934811ED7F3E16E046221A9D09040517010305070537
          6882075DB0D50263C4E70056B3D8073A6E8C01070D11000000000603020B6A38
          1DBFC4680FFFD16700FFD77A1AFFD6740EFFC96102FF6B3921D3145191C02D97
          F1FF3B9BF3FF2E91F0FF4A9CF1FF0373E6FF0756A5CC01070E1249260F7BD17D
          2BFFDF882DFFFCF4ECFFFDF9F4FFF8E6D4FFE2852BFF776957FF279FFBFF45A9
          F7FFEFF2F4FFEFF2F3FFE9EEF3FF4097F0FF006EE6FF073D74949E5A21DBE89D
          4FFFFDF7F0FFE5AD74FFE09E5BFFDB8E3FFFC8690BFF4B8BBDFF45B7FFFF30A1
          F5FF79C0F8FFE5EDF3FF007AECFF1783ECFF0074EBFF0661BEE3BF7530F0F2B7
          79FFFFFEFCFFFCF5EEFFFBF3EAFFE29A50FFBD640DFF4AA1E2FF52C0FFFF49B2
          F8FFEEF2F4FFF2F3F4FFD9E7F2FF0E83EDFF097DECFF0669CCEFAF6826DAF5B7
          78FFFEFAF4FFE8AA6AFFE59E55FFE49E56FFD7883CFF60A2D4FF5FCEFFFF4CB9
          FDFF9DD6FCFFEAF0F4FF2A9AF2FF2391F0FF1688F0FF0C65BFE35B300677F0B0
          70FFF9C791FFFEFBF7FFFEF8F2FFFAE9D8FFF4BB89FF7A7F78FF4DB5E1FF59BF
          FAFF7FD1FFFFEAF0F4FFE6EFF3FF4CAAF6FF1D8DEEFF09407696070300099757
          18BDF3B779FFFBC48AFFFFCA9AFFA3975EFF2A7210FF0C860BFF048A17FF127E
          30FF3996A3FF6FC9FFFF6DC4FDFF3AA4F3FF1363AED301080F14000000000A05
          000D6A360A88BB6F36D8857936FA008711FF04B41CFF6FD87AFFC8ECC4FF0AB3
          12FF008802FF2A868BFC3089DDDD114A86990109121700000000000000000000
          0000000000000B0B00240A761DF223C54BFFB6EABDFFEEF4E6FFEEF4E5FFA5E4
          ABFF13BC20FF017708F70311122F000000000000000000000000000000000000
          0000000000000027055A23B252FF3CC96BFF59CD76FF4AC862FFBEE6BBFFF3F6
          EAFF35C342FF01A30FFF0121006A000000000000000000000000000000000000
          00000000000006400B7A2EBE63FF29C265FF41C76BFFF0F5E9FFF5F7ECFF79D6
          86FF08B317FF07AD17FF0231058B000000000000000000000000000000000000
          0000000000000431075525B755FF3DC976FFF3F6EDFF98E1B4FFC3E9C7FF19B9
          3AFF12BA29FF09A318FF02210366000000000000000000000000000000000000
          000000000000010D0215169B2FE839C773FFBAECCFFFEDF4E8FFF0F5EAFFACE7
          BEFF1FC245FF097215F10008001B000000000000000000000000000000000000
          000000000000000000000430074C19AB3BF63FC773FF91E1B2FFD3EFD9FF3EC7
          70FF138E2EFA011C025900000000000000000000000000000000000000000000
          0000000000000000000000000000032005330A7118AD0E972BE70E912AE80860
          15B20218033B0000000000000000000000000000000000000000}
      end>
  end
  object TTareasTaller: TjktMemTable
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
    AfterOpen = TTareasTallerAfterOpen
    AfterPost = TTareasTallerAfterPost
    Left = 480
    Top = 368
    object TTareasTallerIncluida: TBooleanField
      FieldName = 'Incluida'
    end
    object TTareasTallerCodTarea: TIntegerField
      FieldName = 'CodTarea'
    end
    object TTareasTallerDescripcion: TStringField
      FieldName = 'Descripcion'
      Size = 400
    end
    object TTareasTallerComentario: TStringField
      FieldName = 'Comentario'
      Size = 100
    end
  end
  object TTareasService: TjktMemTable
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
    AfterOpen = TTareasServiceAfterOpen
    AfterPost = TTareasServiceAfterPost
    Left = 480
    Top = 416
    object TTareasServiceIncluida: TBooleanField
      FieldName = 'Incluida'
    end
    object TTareasServiceCodTarea: TIntegerField
      FieldName = 'CodTarea'
    end
    object TTareasServiceDescripcion: TStringField
      FieldName = 'Descripcion'
      Size = 400
    end
    object TTareasServiceComentario: TStringField
      FieldName = 'Comentario'
      Size = 100
    end
  end
  object TTareasLaboQuimico: TjktMemTable
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
    AfterOpen = TTareasLaboQuimicoAfterOpen
    AfterPost = TTareasLaboQuimicoAfterPost
    Left = 480
    Top = 464
    object TTareasLaboQuimicoIncluida: TBooleanField
      FieldName = 'Incluida'
    end
    object TTareasLaboQuimicoCodTarea: TIntegerField
      FieldName = 'CodTarea'
    end
    object TTareasLaboQuimicoDescripcion: TStringField
      FieldName = 'Descripcion'
      Size = 400
    end
    object TTareasLaboQuimicoComentario: TStringField
      FieldName = 'Comentario'
      Size = 100
    end
  end
  object dsTareasTaller: TDataSource
    DataSet = TTareasTaller
    Left = 440
    Top = 368
  end
  object dsTareasService: TDataSource
    DataSet = TTareasService
    Left = 440
    Top = 416
  end
  object dsTareasLaboQuimico: TDataSource
    DataSet = TTareasLaboQuimico
    Left = 440
    Top = 464
  end
  object kbmBSF: TkbmBinaryStreamFormat
    Version = '3.00'
    sfUsingIndex = [sfSaveUsingIndex]
    sfData = [sfSaveData, sfLoadData]
    sfCalculated = []
    sfLookup = []
    sfNonVisible = [sfSaveNonVisible, sfLoadNonVisible]
    sfBlobs = [sfSaveBlobs, sfLoadBlobs]
    sfDef = [sfSaveDef, sfLoadDef]
    sfIndexDef = [sfSaveIndexDef, sfLoadIndexDef]
    sfFiltered = [sfSaveFiltered]
    sfIgnoreRange = [sfSaveIgnoreRange]
    sfIgnoreMasterDetail = [sfSaveIgnoreMasterDetail]
    sfDeltas = []
    sfDontFilterDeltas = []
    sfAppend = []
    sfFieldKind = [sfSaveFieldKind]
    sfFromStart = [sfLoadFromStart]
    sfDataTypeHeader = [sfSaveDataTypeHeader, sfLoadDataTypeHeader]
    sfDisplayWidth = []
    BufferSize = 16384
    Left = 552
    Top = 368
  end
  object Storage: TcxSchedulerStorage
    CustomFields = <>
    Resources.Items = <
      item
        Name = 'Legales'
        ResourceID = 1
      end
      item
        Name = 'Administraci'#243'n'
        ResourceID = 2
      end
      item
        Name = 'Taller'
        ResourceID = 3
      end
      item
        Name = 'Compras'
        ResourceID = 4
      end>
    Left = 560
    Top = 160
  end
  object cxSchedulerGridConnection1: TcxSchedulerGridConnection
    GridView = jktExpDBGrid1TableView1
    Storage = Storage
    Active = True
    Left = 608
    Top = 160
    Links = <
      item
        AdapterClass = 'TcxSchedulerIDFieldAdapter'
        Item = jktExpDBGrid1TableView1cxGridColumn1
      end
      item
        AdapterClass = 'TcxSchedulerIDFieldAdapter'
        FieldIndex = 7
        Item = jktExpDBGrid1TableView1cxGridColumn2
      end
      item
        AdapterClass = 'TcxSchedulerGroupIDFieldAdapter'
        FieldIndex = 22
        Item = jktExpDBGrid1TableView1cxGridColumn3
      end
      item
        AdapterClass = 'TcxSchedulerStateFieldAdapter'
        FieldIndex = 14
        Item = jktExpDBGrid1TableView1cxGridColumn4
      end
      item
        AdapterClass = 'TcxSchedulerTextFieldAdapter'
        FieldIndex = 0
        Item = jktExpDBGrid1TableView1cxGridColumn5
      end
      item
        AdapterClass = 'TcxSchedulerTextFieldAdapter'
        FieldIndex = 4
        Item = jktExpDBGrid1TableView1cxGridColumn6
      end
      item
        AdapterClass = 'TcxSchedulerDateTimeFieldAdapter'
        FieldIndex = 15
        Item = jktExpDBGrid1TableView1cxGridColumn7
      end
      item
        AdapterClass = 'TcxSchedulerDateTimeFieldAdapter'
        FieldIndex = 16
        Item = jktExpDBGrid1TableView1cxGridColumn8
      end
      item
        AdapterClass = 'TcxSchedulerEventFinishFieldAdapter'
        FieldIndex = 2
        Item = jktExpDBGrid1TableView1cxGridColumn9
      end
      item
        AdapterClass = 'TcxSchedulerEventStartFieldAdapter'
        FieldIndex = 13
        Item = jktExpDBGrid1TableView1cxGridColumn10
      end
      item
        AdapterClass = 'TcxSchedulerTextFieldAdapter'
        FieldIndex = 5
        Item = jktExpDBGrid1TableView1cxGridColumn11
      end
      item
        AdapterClass = 'TcxSchedulerTypeFieldAdapter'
        FieldIndex = 1
        Item = jktExpDBGrid1TableView1cxGridColumn12
      end
      item
        AdapterClass = 'TcxSchedulerReminderFieldAdapter'
        FieldIndex = 6
        Item = jktExpDBGrid1TableView1cxGridColumn13
      end
      item
        AdapterClass = 'TcxSchedulerAllDayFieldAdapter'
        FieldIndex = 6
        Item = jktExpDBGrid1TableView1cxGridColumn14
      end
      item
        AdapterClass = 'TcxSchedulerEnabledFieldAdapter'
        FieldIndex = 6
        Item = jktExpDBGrid1TableView1cxGridColumn15
      end
      item
        AdapterClass = 'TcxSchedulerLabelColorFieldAdapter'
        FieldIndex = 3
        Item = jktExpDBGrid1TableView1cxGridColumn16
      end
      item
        AdapterClass = 'TcxSchedulerRecurringFieldAdapter'
        FieldIndex = 9
        Item = jktExpDBGrid1TableView1cxGridColumn17
      end
      item
        AdapterClass = 'TcxSchedulerIntegerFieldAdapter'
        FieldIndex = 8
        Item = jktExpDBGrid1TableView1cxGridColumn18
      end
      item
        AdapterClass = 'TcxSchedulerDateTimeFieldAdapter'
        FieldIndex = 10
        Item = jktExpDBGrid1TableView1cxGridColumn19
      end
      item
        AdapterClass = 'TcxSchedulerIntegerFieldAdapter'
        FieldIndex = 11
        Item = jktExpDBGrid1TableView1cxGridColumn20
      end
      item
        AdapterClass = 'TcxSchedulerResourceIDFieldAdapter'
        FieldIndex = 12
        Item = jktExpDBGrid1TableView1cxGridColumn21
      end
      item
        AdapterClass = 'TcxSchedulerCompleteFieldAdapter'
        FieldIndex = 17
        Item = jktExpDBGrid1TableView1cxGridColumn22
      end
      item
        AdapterClass = 'TcxSchedulerLinksFieldAdapter'
        FieldIndex = 19
        Item = jktExpDBGrid1TableView1cxGridColumn23
      end
      item
        AdapterClass = 'TcxSchedulerIntegerFieldAdapter'
        FieldIndex = 18
        Item = jktExpDBGrid1TableView1cxGridColumn24
      end
      item
        AdapterClass = 'TcxSchedulerStatusFieldAdapter'
        FieldIndex = 20
        Item = jktExpDBGrid1TableView1cxGridColumn25
      end>
  end
end
