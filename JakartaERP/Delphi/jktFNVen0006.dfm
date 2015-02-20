inherited FNVen0006: TFNVen0006
  Caption = 'Ingreso de Presupuesto'
  ClientHeight = 742
  ClientWidth = 971
  ExplicitTop = -153
  ExplicitWidth = 987
  ExplicitHeight = 780
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBoxLeft: TcxGroupBox
    ExplicitHeight = 742
    Height = 742
  end
  inherited cxSplitterLeft: TcxSplitter
    Height = 742
    ExplicitHeight = 742
  end
  inherited cxGroupBoxRight: TcxGroupBox
    Left = 941
    ExplicitLeft = 941
    ExplicitHeight = 742
    Height = 742
  end
  inherited cxSplitterRight: TcxSplitter
    Left = 937
    Height = 742
    ExplicitLeft = 933
    ExplicitHeight = 742
  end
  inherited cxGroupBoxMain: TcxGroupBox
    ExplicitWidth = 903
    ExplicitHeight = 742
    Height = 742
    Width = 903
    object lcMain: TdxLayoutControl
      Left = 2
      Top = 2
      Width = 899
      Height = 738
      Align = alClient
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 354
        Top = 41
        DataBinding.DataField = 'nro_presu'
        DataBinding.DataSource = dsPresupuesto
        Enabled = False
        Properties.ReadOnly = True
        Style.HotTrack = False
        TabOrder = 1
        Width = 90
      end
      object cxDBDateEdit1: TcxDBDateEdit
        Left = 493
        Top = 41
        DataBinding.DataField = 'fecha'
        DataBinding.DataSource = dsPresupuesto
        Enabled = False
        Properties.ReadOnly = True
        Properties.ShowTime = False
        Properties.UseLeftAlignmentOnEditing = False
        Style.HotTrack = False
        TabOrder = 2
        Width = 92
      end
      object cxDBTextEdit6: TcxDBTextEdit
        Left = 297
        Top = 74
        DataBinding.DataField = 'razonSocial'
        DataBinding.DataSource = dsPresupuesto
        Enabled = False
        Properties.ReadOnly = True
        Style.HotTrack = False
        TabOrder = 5
        Width = 561
      end
      object cxDBButtonEdit2: TcxDBButtonEdit
        Left = 136
        Top = 74
        DataBinding.DataField = 'cod_clie'
        DataBinding.DataSource = dsPresupuesto
        Enabled = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = cxDBButtonEdit2PropertiesButtonClick
        Style.HotTrack = False
        TabOrder = 3
        Width = 90
      end
      object cxDBButtonEdit3: TcxDBButtonEdit
        Left = 229
        Top = 74
        DataBinding.DataField = 'nro_sucu'
        DataBinding.DataSource = dsPresupuesto
        Enabled = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = cxDBButtonEdit3PropertiesButtonClick
        Style.HotTrack = False
        TabOrder = 4
        Width = 65
      end
      object cxGridItems: TcxGrid
        Left = 23
        Top = 261
        Width = 850
        Height = 406
        BorderStyle = cxcbsNone
        Enabled = False
        TabOrder = 14
        object DBLayoutView: TcxGridDBLayoutView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsItems
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skSum
              FieldName = 'importe_total'
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsData.CancelOnExit = False
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
            LayoutItem = cxGridLayoutItem1
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
          object DBLayoutViewMoneda: TcxGridDBLayoutViewItem
            Caption = 'Moneda'
            DataBinding.FieldName = 'oid_mon'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.DropDownAutoSize = True
            Properties.KeyFieldNames = 'oid'
            Properties.ListColumns = <
              item
                Caption = 'S'#237'mbolo'
                Width = 70
                FieldName = 'codigo'
              end
              item
                Caption = 'Descripci'#243'n'
                Width = 130
                FieldName = 'descripcion'
              end>
            Properties.ListSource = dsMonedas
            LayoutItem = DBLayoutViewLayoutItem8
          end
          object DBLayoutViewImporte: TcxGridDBLayoutViewItem
            Caption = 'Importe'
            DataBinding.FieldName = 'importe'
            LayoutItem = DBLayoutViewLayoutItem1
          end
          object DBLayoutViewImporteTotal: TcxGridDBLayoutViewItem
            Caption = 'Importe Total'
            DataBinding.FieldName = 'importe_total'
            LayoutItem = DBLayoutViewLayoutItem9
            Options.Editing = False
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
            SizeOptions.Width = 19
            Index = 0
          end
          object DBLayoutViewLayoutItem3: TcxGridLayoutItem
            CaptionOptions.AlignHorz = taRightJustify
            Parent = DBLayoutViewGroup2
            SizeOptions.Width = 328
            Index = 1
          end
          object DBLayoutViewLayoutItem6: TcxGridLayoutItem
            CaptionOptions.ImageIndex = 0
            CaptionOptions.Visible = False
            Parent = dxLayoutGroup2
            SizeOptions.Height = 35
            SizeOptions.Width = 432
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
          object cxGridLayoutItem1: TcxGridLayoutItem
            Parent = dxLayoutGroup3
            SizeOptions.Width = 33
            Index = 0
          end
          object DBLayoutViewLayoutItem4: TcxGridLayoutItem
            CaptionOptions.Layout = clTop
            Parent = DBLayoutViewGroup1
            SizeOptions.Width = 17
            Index = 0
          end
          object dxLayoutGroup3: TdxLayoutGroup
            CaptionOptions.Text = 'Hidden Group'
            Parent = DBLayoutViewGroup4
            ButtonOptions.Buttons = <>
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            Index = 0
          end
          object DBLayoutViewLayoutItem5: TcxGridLayoutItem
            Parent = dxLayoutGroup3
            SizeOptions.Width = 328
            Index = 1
          end
          object DBLayoutViewGroup4: TdxLayoutGroup
            CaptionOptions.Text = 'Hidden Group'
            Parent = dxLayoutGroup1
            ButtonOptions.Buttons = <>
            Hidden = True
            ItemIndex = 2
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
            Index = 2
          end
          object dxLayoutEmptySpaceItem1: TdxLayoutEmptySpaceItem
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
          object DBLayoutViewLayoutItem1: TcxGridLayoutItem
            CaptionOptions.Layout = clTop
            Parent = DBLayoutViewGroup1
            SizeOptions.Width = 14
            Index = 2
          end
          object DBLayoutViewLayoutItem8: TcxGridLayoutItem
            CaptionOptions.Layout = clTop
            Parent = DBLayoutViewGroup1
            SizeOptions.Width = 8
            Index = 1
          end
          object DBLayoutViewGroup1: TdxLayoutGroup
            AlignHorz = ahRight
            CaptionOptions.Text = 'Hidden Group'
            Parent = DBLayoutViewGroup4
            ButtonOptions.Buttons = <>
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            Index = 4
          end
          object DBLayoutViewLayoutItem9: TcxGridLayoutItem
            CaptionOptions.Layout = clTop
            Parent = DBLayoutViewGroup1
            SizeOptions.Width = 21
            Index = 3
          end
          object DBLayoutViewSeparatorItem1: TdxLayoutSeparatorItem
            CaptionOptions.Text = 'Separator'
            Parent = DBLayoutViewGroup4
            SizeOptions.AssignedValues = [sovSizableHorz, sovSizableVert]
            SizeOptions.SizableHorz = False
            SizeOptions.SizableVert = False
            Index = 3
          end
        end
        object cxGridItemsLevel1: TcxGridLevel
          GridView = DBLayoutView
        end
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 136
        Top = 188
        DataBinding.DataField = 'referencia'
        DataBinding.DataSource = dsPresupuesto
        Enabled = False
        Style.HotTrack = False
        TabOrder = 13
        Width = 424
      end
      object cxDBLookupComboBox1: TcxDBLookupComboBox
        Left = 136
        Top = 122
        DataBinding.DataField = 'oid_cont_suc'
        DataBinding.DataSource = dsPresupuesto
        Enabled = False
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
        TabOrder = 10
        Width = 229
      end
      object jktExpDBGrid1: TjktExpDBGrid
        Left = 10000
        Top = 10000
        Width = 250
        Height = 200
        Enabled = False
        TabOrder = 15
        Visible = False
        DataSource = dsDeterLaboQuim
        object jktExpDBGrid1DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsDeterLaboQuim
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Inserting = False
          OptionsView.NoDataToDisplayInfoText = 'Seleccione una Lista de Precios'
          object jktExpDBGrid1DBTableView1oid_item: TcxGridDBColumn
            DataBinding.FieldName = 'oid_item'
            Visible = False
          end
          object jktExpDBGrid1DBTableView1oid_presu: TcxGridDBColumn
            DataBinding.FieldName = 'oid_presu'
            Visible = False
          end
          object jktExpDBGrid1DBTableView1cod_ana: TcxGridDBColumn
            Caption = 'C'#243'd. An'#225'lisis'
            DataBinding.FieldName = 'cod_ana'
            Options.Editing = False
          end
          object jktExpDBGrid1DBTableView1des_ana: TcxGridDBColumn
            Caption = 'An'#225'lisis'
            DataBinding.FieldName = 'des_ana'
            Visible = False
            GroupIndex = 0
            Options.Editing = False
            Width = 250
          end
          object jktExpDBGrid1DBTableView1oid_det: TcxGridDBColumn
            DataBinding.FieldName = 'oid_det'
            Visible = False
          end
          object jktExpDBGrid1DBTableView1cod_det: TcxGridDBColumn
            Caption = 'C'#243'd. Deter.'
            DataBinding.FieldName = 'cod_det'
            Options.Editing = False
          end
          object jktExpDBGrid1DBTableView1des_det: TcxGridDBColumn
            Caption = 'Determinaci'#243'n'
            DataBinding.FieldName = 'des_det'
            Options.Editing = False
            Width = 250
          end
          object jktExpDBGrid1DBTableView1cant: TcxGridDBColumn
            Caption = 'Cantidad'
            DataBinding.FieldName = 'cant'
            HeaderAlignmentHorz = taRightJustify
          end
          object jktExpDBGrid1DBTableView1oid_mon: TcxGridDBColumn
            Caption = 'Moneda'
            DataBinding.FieldName = 'oid_mon'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.DropDownAutoSize = True
            Properties.KeyFieldNames = 'oid'
            Properties.ListColumns = <
              item
                Caption = 'S'#237'mbolo'
                Width = 70
                FieldName = 'codigo'
              end
              item
                Caption = 'Descripci'#243'n'
                Width = 130
                FieldName = 'descripcion'
              end>
            Properties.ListSource = dsMonedas
            HeaderAlignmentHorz = taCenter
          end
          object jktExpDBGrid1DBTableView1importe: TcxGridDBColumn
            Caption = 'Precio Unit.'
            DataBinding.FieldName = 'importe'
            HeaderAlignmentHorz = taRightJustify
            Options.Editing = False
          end
          object jktExpDBGrid1DBTableView1importe_total: TcxGridDBColumn
            Caption = 'Total'
            DataBinding.FieldName = 'importe_total'
            HeaderAlignmentHorz = taRightJustify
          end
        end
        object jktExpDBGrid1Level1: TcxGridLevel
          GridView = jktExpDBGrid1DBTableView1
        end
      end
      object jktExpDBGrid3: TjktExpDBGrid
        Left = 10000
        Top = 10000
        Width = 546
        Height = 309
        Enabled = False
        TabOrder = 17
        Visible = False
        DataSource = dsMateriales
        object jktExpDBGrid3DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsMateriales
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.GroupByBox = False
          object jktExpDBGrid3DBTableView1oid_item: TcxGridDBColumn
            DataBinding.FieldName = 'oid_item'
            Visible = False
          end
          object jktExpDBGrid3DBTableView1oid_presu: TcxGridDBColumn
            DataBinding.FieldName = 'oid_presu'
            Visible = False
          end
          object jktExpDBGrid3DBTableView1oid_art: TcxGridDBColumn
            DataBinding.FieldName = 'oid_art'
            Visible = False
          end
          object jktExpDBGrid3DBTableView1cod_art: TcxGridDBColumn
            Caption = 'C'#243'd. Art'#237'culo'
            DataBinding.FieldName = 'cod_art'
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.OnButtonClick = jktExpDBGrid3DBTableView1cod_artPropertiesButtonClick
            Width = 80
          end
          object jktExpDBGrid3DBTableView1des_art: TcxGridDBColumn
            Caption = 'Descripci'#243'n'
            DataBinding.FieldName = 'des_art'
            Options.Editing = False
            Width = 250
          end
          object jktExpDBGrid3DBTableView1cant: TcxGridDBColumn
            Caption = 'Cantidad'
            DataBinding.FieldName = 'cant'
            HeaderAlignmentHorz = taRightJustify
          end
          object jktExpDBGrid3DBTableView1oid_mon: TcxGridDBColumn
            Caption = 'Moneda'
            DataBinding.FieldName = 'oid_mon'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.DropDownAutoSize = True
            Properties.KeyFieldNames = 'oid'
            Properties.ListColumns = <
              item
                Caption = 'S'#237'mbolo'
                Width = 70
                FieldName = 'codigo'
              end
              item
                Caption = 'Descripci'#243'n'
                Width = 130
                FieldName = 'descripcion'
              end>
            Properties.ListSource = dsMonedas
            HeaderAlignmentHorz = taCenter
          end
          object jktExpDBGrid3DBTableView1importe: TcxGridDBColumn
            Caption = 'Precio'
            DataBinding.FieldName = 'importe'
            HeaderAlignmentHorz = taRightJustify
          end
          object jktExpDBGrid3DBTableView1importe_total: TcxGridDBColumn
            Caption = 'Total'
            DataBinding.FieldName = 'importe_total'
            HeaderAlignmentHorz = taRightJustify
            Options.Editing = False
          end
        end
        object jktExpDBGrid3Level1: TcxGridLevel
          GridView = jktExpDBGrid3DBTableView1
        end
      end
      object cxDBButtonEdit1: TcxDBButtonEdit
        Left = 136
        Top = 41
        DataBinding.DataField = 'nro_cotiz'
        DataBinding.DataSource = dsPresupuesto
        Enabled = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = cxDBButtonEdit1PropertiesButtonClick
        Style.HotTrack = False
        TabOrder = 0
        Width = 90
      end
      object cxDBButtonEdit4: TcxDBButtonEdit
        Left = 136
        Top = 98
        DataBinding.DataField = 'cod_vend'
        DataBinding.DataSource = dsPresupuesto
        Enabled = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = cxDBButtonEdit4PropertiesButtonClick
        Style.HotTrack = False
        TabOrder = 6
        Width = 90
      end
      object cxDBTextEdit7: TcxDBTextEdit
        Left = 229
        Top = 98
        DataBinding.DataField = 'des_vend'
        DataBinding.DataSource = dsPresupuesto
        Enabled = False
        Properties.ReadOnly = True
        Style.HotTrack = False
        TabOrder = 7
        Width = 222
      end
      object cxDBButtonEdit5: TcxDBButtonEdit
        Left = 543
        Top = 98
        DataBinding.DataField = 'cod_repre'
        DataBinding.DataSource = dsPresupuesto
        Enabled = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = cxDBButtonEdit5PropertiesButtonClick
        Style.HotTrack = False
        TabOrder = 8
        Width = 90
      end
      object cxDBTextEdit8: TcxDBTextEdit
        Left = 636
        Top = 98
        DataBinding.DataField = 'des_repre'
        DataBinding.DataSource = dsPresupuesto
        Enabled = False
        Properties.ReadOnly = True
        Style.HotTrack = False
        TabOrder = 9
        Width = 222
      end
      object cxDBButtonEdit6: TcxDBButtonEdit
        Left = 136
        Top = 155
        DataBinding.DataField = 'cod_lis_pre'
        DataBinding.DataSource = dsPresupuesto
        Enabled = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = cxDBButtonEdit6PropertiesButtonClick
        Style.HotTrack = False
        TabOrder = 11
        Width = 90
      end
      object cxDBTextEdit3: TcxDBTextEdit
        Left = 229
        Top = 155
        DataBinding.DataField = 'des_lis_pre'
        DataBinding.DataSource = dsPresupuesto
        Enabled = False
        Properties.ReadOnly = True
        Style.HotTrack = False
        TabOrder = 12
        Width = 222
      end
      object jktExpDBGrid4: TjktExpDBGrid
        Left = 10000
        Top = 10000
        Width = 250
        Height = 200
        Align = alClient
        Enabled = False
        TabOrder = 18
        Visible = False
        DataSource = dsNotas
        object jktExpDBGrid4DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsNotas
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          object jktExpDBGrid4DBTableView1oid: TcxGridDBColumn
            DataBinding.FieldName = 'oid'
            Visible = False
          end
          object jktExpDBGrid4DBTableView1selec: TcxGridDBColumn
            Caption = 'Incluir'
            DataBinding.FieldName = 'selec'
            HeaderAlignmentHorz = taCenter
            Width = 45
          end
          object jktExpDBGrid4DBTableView1descripcion: TcxGridDBColumn
            Caption = 'Descripci'#243'n'
            DataBinding.FieldName = 'descripcion'
            PropertiesClassName = 'TcxMemoProperties'
            Options.Editing = False
            Width = 730
          end
        end
        object jktExpDBGrid4Level1: TcxGridLevel
          GridView = jktExpDBGrid4DBTableView1
        end
      end
      object jktExpDBGrid6: TjktExpDBGrid
        Left = 10000
        Top = 10000
        Width = 833
        Height = 406
        Enabled = False
        TabOrder = 19
        Visible = False
        DataSource = dsCondComerciales
        object cxGridDBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsCondComerciales
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          object cxGridDBTableView1oid: TcxGridDBColumn
            DataBinding.FieldName = 'oid'
            Visible = False
          end
          object cxGridDBTableView1selec: TcxGridDBColumn
            Caption = 'Incluir'
            DataBinding.FieldName = 'selec'
            HeaderAlignmentHorz = taCenter
            Width = 45
          end
          object cxGridDBTableView1descripcion: TcxGridDBColumn
            Caption = 'Descripci'#243'n'
            DataBinding.FieldName = 'descripcion'
            Options.Editing = False
            Width = 730
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridDBTableView1
        end
      end
      object jktExpDBGrid5: TjktExpDBGrid
        Left = 10000
        Top = 10000
        Width = 850
        Height = 388
        Enabled = False
        TabOrder = 16
        Visible = False
        DataSource = dsDeterLaboElec
        object jktExpDBGrid5DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsDeterLaboElec
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Inserting = False
          OptionsView.NoDataToDisplayInfoText = 'Seleccione una Lista de Precios'
          object cxGridDBColumn1: TcxGridDBColumn
            DataBinding.FieldName = 'oid_item'
            Visible = False
          end
          object cxGridDBColumn2: TcxGridDBColumn
            DataBinding.FieldName = 'oid_presu'
            Visible = False
          end
          object cxGridDBColumn3: TcxGridDBColumn
            Caption = 'C'#243'd. An'#225'lisis'
            DataBinding.FieldName = 'cod_ana'
            Options.Editing = False
          end
          object cxGridDBColumn4: TcxGridDBColumn
            Caption = 'An'#225'lisis'
            DataBinding.FieldName = 'des_ana'
            Visible = False
            GroupIndex = 0
            Options.Editing = False
            Width = 250
          end
          object cxGridDBColumn5: TcxGridDBColumn
            DataBinding.FieldName = 'oid_det'
            Visible = False
          end
          object cxGridDBColumn6: TcxGridDBColumn
            Caption = 'C'#243'd. Deter.'
            DataBinding.FieldName = 'cod_det'
            Options.Editing = False
          end
          object cxGridDBColumn7: TcxGridDBColumn
            Caption = 'Determinaci'#243'n'
            DataBinding.FieldName = 'des_det'
            Options.Editing = False
            Width = 250
          end
          object cxGridDBColumn8: TcxGridDBColumn
            Caption = 'Cantidad'
            DataBinding.FieldName = 'cant'
            HeaderAlignmentHorz = taRightJustify
          end
          object cxGridDBColumn9: TcxGridDBColumn
            Caption = 'Moneda'
            DataBinding.FieldName = 'oid_mon'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.DropDownAutoSize = True
            Properties.KeyFieldNames = 'oid'
            Properties.ListColumns = <
              item
                Caption = 'S'#237'mbolo'
                Width = 70
                FieldName = 'codigo'
              end
              item
                Caption = 'Descripci'#243'n'
                Width = 130
                FieldName = 'descripcion'
              end>
            Properties.ListSource = dsMonedas
            HeaderAlignmentHorz = taCenter
          end
          object cxGridDBColumn10: TcxGridDBColumn
            Caption = 'Precio Unit.'
            DataBinding.FieldName = 'importe'
            HeaderAlignmentHorz = taRightJustify
            Options.Editing = False
          end
          object cxGridDBColumn11: TcxGridDBColumn
            Caption = 'Total'
            DataBinding.FieldName = 'importe_total'
            HeaderAlignmentHorz = taRightJustify
          end
        end
        object cxGridLevel2: TcxGridLevel
          GridView = jktExpDBGrid5DBTableView1
        end
      end
      object dxLayoutGroupRoot: TdxLayoutGroup
        AlignHorz = ahClient
        AlignVert = avTop
        ButtonOptions.Buttons = <>
        Enabled = False
        Hidden = True
        ItemIndex = 1
        ShowBorder = False
        Index = -1
      end
      object lcMainGroup6: TdxLayoutGroup
        CaptionOptions.Text = 'Identificaci'#243'n'
        Parent = dxLayoutGroupRoot
        ButtonOptions.Buttons = <>
        ButtonOptions.ShowExpandButton = True
        ItemIndex = 1
        Index = 0
      end
      object lcMainItem2: TdxLayoutItem
        AlignHorz = ahLeft
        CaptionOptions.Text = 'Nro. de Presupuesto :'
        Offsets.Left = 5
        Parent = lcMainGroup14
        Control = cxDBTextEdit2
        ControlOptions.ShowBorder = False
        Index = 2
      end
      object lcMainGroup3: TdxLayoutGroup
        CaptionOptions.Text = 'New Group'
        CaptionOptions.Visible = False
        Parent = dxLayoutGroupRoot
        ButtonOptions.Buttons = <>
        LayoutDirection = ldTabbed
        ShowBorder = False
        OnTabChanged = lcMainGroup3TabChanged
        OnTabChanging = lcMainGroup3TabChanging
        Index = 1
      end
      object dxLayoutItem1: TdxLayoutItem
        CaptionOptions.Text = 'Fecha :'
        Offsets.Left = 5
        Parent = lcMainGroup14
        Control = cxDBDateEdit1
        ControlOptions.ShowBorder = False
        Index = 3
      end
      object lcMainItem7: TdxLayoutItem
        CaptionOptions.Text = 'Raz'#243'n Social :'
        CaptionOptions.Visible = False
        Parent = lcMainGroup9
        Control = cxDBTextEdit6
        ControlOptions.ShowBorder = False
        Index = 2
      end
      object lcMainItem12: TdxLayoutItem
        CaptionOptions.Text = 'Cliente | Sucursal :'
        Parent = lcMainGroup9
        Control = cxDBButtonEdit2
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainGroup13: TdxLayoutGroup
        Tag = 1
        CaptionOptions.Text = #205'tems'
        Parent = lcMainGroup3
        ButtonOptions.Buttons = <>
        Index = 0
      end
      object lcMainGroup9: TdxLayoutGroup
        CaptionOptions.Text = 'Datos del Cliente'
        Parent = lcMainGroup6
        ButtonOptions.Buttons = <>
        Hidden = True
        LayoutDirection = ldHorizontal
        ShowBorder = False
        Index = 2
      end
      object lcMainItem3: TdxLayoutItem
        CaptionOptions.Visible = False
        Parent = lcMainGroup9
        Control = cxDBButtonEdit3
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object lcMainItem5: TdxLayoutItem
        CaptionOptions.Visible = False
        Parent = lcMainGroup13
        Control = cxGridItems
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainItem10: TdxLayoutItem
        CaptionOptions.Text = 'Referencia :'
        Parent = lcMainGroup6
        Control = cxDBTextEdit1
        ControlOptions.AlignHorz = ahLeft
        ControlOptions.ShowBorder = False
        Index = 8
      end
      object lcMainItem11: TdxLayoutItem
        CaptionOptions.Text = 'Contacto Refer.:'
        Parent = lcMainGroup6
        Control = cxDBLookupComboBox1
        ControlOptions.AlignHorz = ahLeft
        ControlOptions.ShowBorder = False
        Index = 4
      end
      object lcMainGroup1: TdxLayoutGroup
        Tag = 2
        CaptionOptions.Text = 'Laboratorio Qu'#237'mico'
        Parent = lcMainGroup3
        ButtonOptions.Buttons = <>
        Index = 1
      end
      object lcMainGroup4: TdxLayoutGroup
        Tag = 3
        CaptionOptions.Text = 'Laboratorio El'#233'ctrico'
        Parent = lcMainGroup3
        ButtonOptions.Buttons = <>
        Index = 2
      end
      object lcMainGroup5: TdxLayoutGroup
        Tag = 4
        CaptionOptions.Text = 'Materiales'
        Parent = lcMainGroup3
        ButtonOptions.Buttons = <>
        Index = 3
      end
      object lcMainItem1: TdxLayoutItem
        AlignVert = avClient
        CaptionOptions.Text = 'Determinaciones :'
        CaptionOptions.Layout = clTop
        Parent = lcMainGroup1
        Control = jktExpDBGrid1
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainItem4: TdxLayoutItem
        AlignVert = avClient
        CaptionOptions.Text = 'Determinaciones :'
        CaptionOptions.Layout = clTop
        Parent = lcMainGroup4
        Control = jktExpDBGrid5
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainItem8: TdxLayoutItem
        AlignVert = avClient
        CaptionOptions.Visible = False
        Parent = lcMainGroup5
        Control = jktExpDBGrid3
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainSeparatorItem1: TdxLayoutSeparatorItem
        CaptionOptions.Text = 'Separator'
        Parent = lcMainGroup6
        SizeOptions.AssignedValues = [sovSizableHorz, sovSizableVert]
        SizeOptions.SizableHorz = False
        SizeOptions.SizableVert = False
        Index = 1
      end
      object lcMainSeparatorItem2: TdxLayoutSeparatorItem
        CaptionOptions.Text = 'Separator'
        Parent = lcMainGroup6
        SizeOptions.AssignedValues = [sovSizableHorz, sovSizableVert]
        SizeOptions.SizableHorz = False
        SizeOptions.SizableVert = False
        Index = 7
      end
      object lcMainItem9: TdxLayoutItem
        CaptionOptions.Text = 'En base a Cotizaci'#243'n...'
        Parent = lcMainGroup14
        Control = cxDBButtonEdit1
        ControlOptions.AlignHorz = ahLeft
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainGroup7: TdxLayoutGroup
        CaptionOptions.Text = 'Datos Comerciales'
        Parent = lcMainGroup6
        ButtonOptions.Buttons = <>
        Hidden = True
        LayoutDirection = ldHorizontal
        ShowBorder = False
        Index = 3
      end
      object lcMainItem13: TdxLayoutItem
        CaptionOptions.Text = 'Vendedor :'
        Parent = lcMainGroup7
        Control = cxDBButtonEdit4
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainItem14: TdxLayoutItem
        CaptionOptions.Visible = False
        Parent = lcMainGroup7
        Control = cxDBTextEdit7
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object lcMainItem15: TdxLayoutItem
        CaptionOptions.Text = 'Representante :'
        Offsets.Left = 5
        Parent = lcMainGroup7
        Control = cxDBButtonEdit5
        ControlOptions.ShowBorder = False
        Index = 2
      end
      object lcMainItem16: TdxLayoutItem
        CaptionOptions.Visible = False
        Parent = lcMainGroup7
        Control = cxDBTextEdit8
        ControlOptions.ShowBorder = False
        Index = 3
      end
      object lcMainSeparatorItem3: TdxLayoutSeparatorItem
        CaptionOptions.Text = 'Separator'
        Parent = lcMainGroup6
        SizeOptions.AssignedValues = [sovSizableHorz, sovSizableVert]
        SizeOptions.SizableHorz = False
        SizeOptions.SizableVert = False
        Index = 5
      end
      object lcMainItem17: TdxLayoutItem
        CaptionOptions.Text = 'Lista de Precios :'
        Parent = lcMainGroup8
        Control = cxDBButtonEdit6
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainItem18: TdxLayoutItem
        CaptionOptions.Visible = False
        Parent = lcMainGroup8
        Control = cxDBTextEdit3
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object lcMainGroup8: TdxLayoutGroup
        CaptionOptions.Text = 'Hidden Group'
        Parent = lcMainGroup6
        ButtonOptions.Buttons = <>
        Hidden = True
        LayoutDirection = ldHorizontal
        ShowBorder = False
        Index = 6
      end
      object lcMainGroup10: TdxLayoutGroup
        CaptionOptions.Text = 'Notas'
        Parent = lcMainGroup3
        ButtonOptions.Buttons = <>
        Index = 5
      end
      object lcMainGroup11: TdxLayoutGroup
        CaptionOptions.Text = 'Cond. Comerciales'
        Parent = lcMainGroup3
        ButtonOptions.Buttons = <>
        Index = 6
      end
      object lcMainItem19: TdxLayoutItem
        AlignVert = avClient
        CaptionOptions.Visible = False
        Parent = lcMainGroup10
        Control = jktExpDBGrid4
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainItem20: TdxLayoutItem
        AlignVert = avClient
        CaptionOptions.Visible = False
        Parent = lcMainGroup11
        Control = jktExpDBGrid6
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainGroup14: TdxLayoutGroup
        CaptionOptions.Text = 'Hidden Group'
        Parent = lcMainGroup6
        ButtonOptions.Buttons = <>
        Hidden = True
        LayoutDirection = ldHorizontal
        ShowBorder = False
        Index = 0
      end
      object lcMainSeparatorItem4: TdxLayoutSeparatorItem
        CaptionOptions.Text = 'Separator'
        Parent = lcMainGroup14
        SizeOptions.AssignedValues = [sovSizableHorz, sovSizableVert]
        SizeOptions.SizableHorz = False
        SizeOptions.SizableVert = False
        Index = 1
      end
      object lcMainGroup2: TdxLayoutGroup
        Tag = 5
        Parent = lcMainGroup3
        ButtonOptions.Buttons = <>
        Index = 4
      end
    end
  end
  inherited BarManager: TdxBarManager
    Left = 216
    Top = 40
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited Driver: TjktDriver
    DataSetCab = mtPresupuesto
    TipoPrograma = tp_abmIndividual
    Filtro = Help
    OperacionesIniciales = <
      item
        Operacion = opTraerTiposDeVenta
      end>
    OnCancel = DriverCancel
    OnNuevo = DriverNuevo
    OnGuardar = DriverGuardar
    Left = 448
    Top = 40
  end
  inherited IdHTTP: TIdHTTP
    Left = 392
    Top = 40
  end
  inherited Service: TjktServiceCaller
    Left = 352
    Top = 40
  end
  inherited OperacionSave: TjktOperacion
    OperName = 'GuardarPresupuesto'
    Atributos = <
      item
        Dataset = mtItems
        Tag = 0
      end
      item
        Dataset = mtDeterLaboQuim
        Tag = 0
      end
      item
        Dataset = mtDeterLaboElec
        Tag = 0
      end
      item
        Dataset = mtMateriales
        Tag = 0
      end
      item
        Dataset = mtNotas
        Tag = 0
      end
      item
        Dataset = mtCondComerciales
        Tag = 0
      end>
    Left = 568
    Top = 40
  end
  inherited mtParametroInicial: TjktMemTable
    Left = 640
    Top = 40
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
    object mtParametroInicialLaboratorio: TStringField
      FieldName = 'Laboratorio'
    end
  end
  inherited OperacionTraer: TjktOperacion
    OperName = 'TraerPresupuesto'
    Atributos = <
      item
        Attribute = 'oid'
        Field = mtPresupuestooid_presu
        Tag = 0
      end>
    OnAfterEjecutar = OperacionTraerAfterEjecutar
    Left = 568
    Top = 88
  end
  inherited ValidadorForm: TjktValidadorForm
    ListaValidaciones = <
      item
        Field = mtPresupuestocod_clie
        ValidadorGral = valClie
      end
      item
        Field = mtPresupuestonro_sucu
        ValidadorGral = valSucu
      end
      item
        Field = mtPresupuestocod_vend
        ValidadorGral = valVend
      end
      item
        Field = mtPresupuestocod_repre
        ValidadorGral = valRepre
      end
      item
        Field = mtPresupuestocod_lis_pre
        ValidadorGral = valListaPrecios
      end
      item
        Field = mtItemscod_art
        ValidadorGral = valArt
      end
      item
        Field = mtMaterialescod_art
        ValidadorGral = valArt2
      end>
    Left = 496
    Top = 88
  end
  inherited mtParametrosForm: TjktMemTable
    Left = 680
    Top = 40
  end
  object dxLayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 176
    Top = 40
    object dxLayoutSkinLookAndFeel1: TdxLayoutSkinLookAndFeel
      GroupOptions.CaptionOptions.Font.Charset = DEFAULT_CHARSET
      GroupOptions.CaptionOptions.Font.Color = clWindowText
      GroupOptions.CaptionOptions.Font.Height = -11
      GroupOptions.CaptionOptions.Font.Name = 'Tahoma'
      GroupOptions.CaptionOptions.Font.Style = []
      GroupOptions.CaptionOptions.UseDefaultFont = False
      GroupOptions.Padding.AssignedValues = [lpavLeft]
      GroupOptions.Padding.Left = 0
      ItemOptions.CaptionOptions.Font.Charset = DEFAULT_CHARSET
      ItemOptions.CaptionOptions.Font.Color = clWindowText
      ItemOptions.CaptionOptions.Font.Height = -11
      ItemOptions.CaptionOptions.Font.Name = 'Tahoma'
      ItemOptions.CaptionOptions.Font.Style = []
      ItemOptions.CaptionOptions.UseDefaultFont = False
      Offsets.ItemOffset = 2
    end
  end
  object Help: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'presupuesto'
    TipoFiltro = fi_Activos
    OidRespuesta = mtPresupuestooid_presu
    Left = 496
    Top = 40
  end
  object hlpCotiz: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'cotizacion'
    TipoFiltro = fi_Activos
    OidRespuesta = mtPresupuestooid_cotiz
    CodigoRespuesta = mtPresupuestonro_cotiz
    Left = 360
    Top = 136
  end
  object mtPresupuesto: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_presu'
        DataType = ftInteger
      end
      item
        Name = 'nro_presu'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'oid_cotiz'
        DataType = ftInteger
      end
      item
        Name = 'nro_cotiz'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'fecha'
        DataType = ftDateTime
      end
      item
        Name = 'fecha_vencimiento'
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
        Name = 'referencia'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'oid_cont_suc'
        DataType = ftInteger
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
        Name = 'oid_lis_pre'
        DataType = ftInteger
      end
      item
        Name = 'cod_lis_pre'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'des_lis_pre'
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
    Left = 144
    Top = 344
    object mtPresupuestooid_presu: TIntegerField
      Tag = 1
      FieldName = 'oid_presu'
    end
    object mtPresupuestonro_presu: TStringField
      FieldName = 'nro_presu'
      Size = 30
    end
    object mtPresupuestooid_cotiz: TIntegerField
      Tag = 1
      FieldName = 'oid_cotiz'
    end
    object mtPresupuestonro_cotiz: TStringField
      FieldName = 'nro_cotiz'
      Size = 30
    end
    object mtPresupuestofecha: TDateTimeField
      FieldName = 'fecha'
    end
    object mtPresupuestooid_clie: TIntegerField
      FieldName = 'oid_clie'
    end
    object mtPresupuestocod_clie: TStringField
      FieldName = 'cod_clie'
      Size = 15
    end
    object mtPresupuestoRazonSocial: TStringField
      FieldName = 'razonSocial'
      Size = 100
    end
    object mtPresupuestooid_sucu: TIntegerField
      Tag = 1
      FieldName = 'oid_sucu'
    end
    object mtPresupuestonro_sucu: TSmallintField
      FieldName = 'nro_sucu'
    end
    object mtPresupuestodes_sucu: TStringField
      FieldName = 'des_sucu'
      Size = 50
    end
    object mtPresupuestoreferencia: TStringField
      Tag = 1
      FieldName = 'referencia'
      Size = 100
    end
    object mtPresupuestooid_cont_suc: TIntegerField
      Tag = 1
      FieldName = 'oid_cont_suc'
    end
    object mtPresupuestooid_vend: TIntegerField
      Tag = 1
      FieldName = 'oid_vend'
    end
    object mtPresupuestocod_vend: TStringField
      FieldName = 'cod_vend'
      Size = 15
    end
    object mtPresupuestodes_vend: TStringField
      FieldName = 'des_vend'
      Size = 40
    end
    object mtPresupuestooid_repre: TIntegerField
      Tag = 1
      FieldName = 'oid_repre'
    end
    object mtPresupuestocod_repre: TStringField
      FieldName = 'cod_repre'
      Size = 15
    end
    object mtPresupuestodes_repre: TStringField
      FieldName = 'des_repre'
      Size = 40
    end
    object mtPresupuestooid_lis_pre: TIntegerField
      Tag = 1
      FieldName = 'oid_lis_pre'
    end
    object mtPresupuestocod_lis_pre: TStringField
      FieldName = 'cod_lis_pre'
      OnChange = mtPresupuestocod_lis_preChange
      Size = 15
    end
    object mtPresupuestodes_lis_pre: TStringField
      FieldName = 'des_lis_pre'
      Size = 100
    end
  end
  object mtItems: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_item'
        DataType = ftInteger
      end
      item
        Name = 'oid_presu'
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
        Name = 'des_abrev_art'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'cant'
        DataType = ftFloat
      end
      item
        Name = 'referencia'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'detalle'
        DataType = ftMemo
      end
      item
        Name = 'importe'
        DataType = ftFloat
      end
      item
        Name = 'oid_mon'
        DataType = ftInteger
      end>
    IndexFieldNames = 'oid_presu'
    IndexDefs = <
      item
        Name = 'mtItemsIndex'
        Fields = 'oid_presu'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    MasterFields = 'oid_presu'
    MasterSource = dsPresupuesto
    Version = '7.12.10 CodeGear Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    OnCalcFields = mtItemsCalcFields
    Left = 184
    Top = 400
    object mtItemsoid_item: TIntegerField
      Tag = 1
      FieldName = 'oid_item'
    end
    object mtItemsoid_presu: TIntegerField
      Tag = 1
      FieldName = 'oid_presu'
    end
    object mtItemsoid_item_cotiz: TIntegerField
      Tag = 1
      FieldName = 'oid_item_cotiz'
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
    object mtItemsoid_mon: TIntegerField
      Tag = 1
      FieldName = 'oid_mon'
    end
    object mtItemsimporte: TFloatField
      Tag = 1
      FieldName = 'importe'
      DisplayFormat = '0.00'
    end
    object mtItemsimporte_total: TFloatField
      FieldKind = fkCalculated
      FieldName = 'importe_total'
      DisplayFormat = '0.00'
      Calculated = True
    end
  end
  object dsItems: TDataSource
    DataSet = mtItems
    Left = 224
    Top = 400
  end
  object dsPresupuesto: TDataSource
    DataSet = mtPresupuesto
    Left = 184
    Top = 344
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
    Left = 560
    Top = 360
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
    Left = 520
    Top = 360
  end
  object dsMonedas: TDataSource
    DataSet = mtMonedas
    Left = 600
    Top = 360
  end
  object hlpRepre: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'representante'
    TipoFiltro = fi_Activos
    CodigoRespuesta = mtPresupuestocod_repre
    Left = 200
    Top = 136
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
    Left = 240
    Top = 184
  end
  object hlpArt: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'articulos'
    TipoFiltro = fi_Activos
    OidRespuesta = mtItemsoid_art
    CodigoRespuesta = mtItemscod_art
    Left = 240
    Top = 136
  end
  object valRepre: TjktValidador
    Entidad = 'representante'
    Validacion = tExistente
    ListaAsignaciones = <
      item
        SourceName = 'oid'
        FieldTarget = mtPresupuestooid_repre
      end
      item
        SourceName = 'Descripcion'
        FieldTarget = mtPresupuestodes_repre
      end>
    Left = 200
    Top = 184
  end
  object valVend: TjktValidador
    Entidad = 'vendedor'
    Validacion = tExistente
    ListaAsignaciones = <
      item
        SourceName = 'oid'
        FieldTarget = mtPresupuestooid_vend
      end
      item
        SourceName = 'Descripcion'
        FieldTarget = mtPresupuestodes_vend
      end>
    Left = 160
    Top = 184
  end
  object hlpVend: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'vendedor'
    TipoFiltro = fi_Activos
    CodigoRespuesta = mtPresupuestocod_vend
    Left = 160
    Top = 136
  end
  object hlpSucu: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'clienteSucursal'
    EntidadMaestra = 'clientes'
    OidEntidadMaestra = mtPresupuestooid_clie
    TipoFiltro = fi_Activos
    Left = 120
    Top = 136
  end
  object valClie: TjktValidador
    Entidad = 'clientes'
    Validacion = tExistente
    ListaAsignaciones = <
      item
        SourceName = 'oid'
        FieldTarget = mtPresupuestooid_clie
      end
      item
        SourceName = 'Descripcion'
        FieldTarget = mtPresupuestoRazonSocial
      end>
    Left = 80
    Top = 184
  end
  object hlpClie: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'clientes'
    TipoFiltro = fi_Activos
    CodigoRespuesta = mtPresupuestocod_clie
    Left = 80
    Top = 136
  end
  object dsTiposVenta: TDataSource
    DataSet = mtTiposVenta
    Left = 600
    Top = 416
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
    Left = 560
    Top = 416
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
    OnAfterEjecutar = opTraerTiposDeVentaAfterEjecutar
    Left = 520
    Top = 416
  end
  object hlpPlantilla: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'plantilla'
    TipoFiltro = fi_Activos
    Left = 320
    Top = 136
  end
  object opTraerCotizParaPresu: TjktOperacion
    OperName = 'TraerCotizacionParaPresupuesto'
    EnviarTodo = False
    Atributos = <
      item
        Attribute = 'oid_cotizacion'
        Field = mtPresupuestooid_cotiz
        Tag = 0
      end>
    ServiceCaller = Service
    Left = 520
    Top = 248
  end
  object opTraerVendRepre: TjktOperacion
    OperName = 'TraerVendRepreCliente'
    EnviarTodo = False
    Atributos = <
      item
        Attribute = 'oid'
        Field = mtPresupuestooid_clie
        Tag = 0
      end>
    ServiceCaller = Service
    Left = 520
    Top = 472
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
    Left = 560
    Top = 472
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
  object dsContactos: TDataSource
    DataSet = mtContactos
    Left = 600
    Top = 304
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
    Left = 560
    Top = 304
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
  object opTraerContactosSucu: TjktOperacion
    OperName = 'TraerContactosDeSucursal'
    EnviarTodo = False
    Atributos = <
      item
        Attribute = 'oid'
        Field = mtPresupuestooid_sucu
        Tag = 0
      end>
    ServiceCaller = Service
    Left = 520
    Top = 304
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
    Left = 640
    Top = 304
    object mtClienteSucursaloid_clie_suc: TIntegerField
      FieldName = 'oid_clie_suc'
    end
  end
  object valListaPrecios: TjktValidador
    Entidad = 'listaPrecios'
    Validacion = tExistente
    ListaAsignaciones = <
      item
        SourceName = 'oid'
        FieldTarget = mtPresupuestooid_lis_pre
      end
      item
        SourceName = 'Descripcion'
        FieldTarget = mtPresupuestodes_lis_pre
      end>
    Left = 400
    Top = 184
  end
  object hlpListaPrecios: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'listaPrecios'
    TipoFiltro = fi_Activos
    CodigoRespuesta = mtPresupuestocod_lis_pre
    Left = 400
    Top = 136
  end
  object mtNotas: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid'
        DataType = ftInteger
      end
      item
        Name = 'oid_presu'
        DataType = ftInteger
      end
      item
        Name = 'vineta'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'descripcion'
        DataType = ftMemo
      end>
    IndexFieldNames = 'oid_presu'
    IndexDefs = <
      item
        Name = 'mtNotasIndex'
        Fields = 'oid_presu'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    MasterFields = 'oid_presu'
    MasterSource = dsPresupuesto
    Version = '7.12.10 CodeGear Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    Left = 320
    Top = 496
    object mtNotasoid: TIntegerField
      Tag = 1
      FieldName = 'oid'
    end
    object mtNotasoid_presu: TIntegerField
      Tag = 1
      FieldName = 'oid_presu'
    end
    object mtNotasselec: TBooleanField
      Tag = 1
      FieldName = 'selec'
    end
    object mtNotascodigo: TStringField
      FieldName = 'codigo'
      Size = 15
    end
    object mtNotasdescripcion: TMemoField
      FieldName = 'descripcion'
      BlobType = ftMemo
    end
  end
  object mtCondComerciales: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid'
        DataType = ftInteger
      end
      item
        Name = 'oid_presu'
        DataType = ftInteger
      end
      item
        Name = 'vineta'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'descripcion'
        DataType = ftMemo
      end>
    IndexFieldNames = 'oid_presu'
    IndexDefs = <
      item
        Name = 'mtCondComercialesIndex'
        Fields = 'oid_presu'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    MasterFields = 'oid_presu'
    MasterSource = dsPresupuesto
    Version = '7.12.10 CodeGear Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    Left = 320
    Top = 544
    object mtCondComercialesoid: TIntegerField
      Tag = 1
      FieldName = 'oid'
    end
    object mtCondComercialesoid_presu: TIntegerField
      Tag = 1
      FieldName = 'oid_presu'
    end
    object mtCondComercialesselec: TBooleanField
      Tag = 1
      FieldName = 'selec'
    end
    object mtCondComercialescodigo: TStringField
      FieldName = 'codigo'
      Size = 15
    end
    object mtCondComercialesdescripcion: TMemoField
      FieldName = 'descripcion'
      BlobType = ftMemo
    end
  end
  object dsNotas: TDataSource
    DataSet = mtNotas
    Left = 360
    Top = 496
  end
  object dsCondComerciales: TDataSource
    DataSet = mtCondComerciales
    Left = 360
    Top = 544
  end
  object mtDeterLaboQuim: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_item'
        DataType = ftInteger
      end
      item
        Name = 'oid_presu'
        DataType = ftInteger
      end
      item
        Name = 'cod_ana'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'des_ana'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'oid_det'
        DataType = ftInteger
      end
      item
        Name = 'cod_det'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'des_det'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'cant'
        DataType = ftInteger
      end
      item
        Name = 'importe'
        DataType = ftFloat
      end
      item
        Name = 'oid_mon'
        DataType = ftInteger
      end>
    IndexFieldNames = 'oid_presu'
    IndexDefs = <
      item
        Name = 'mtDeterLaboQuimIndex'
        Fields = 'oid_presu'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    MasterFields = 'oid_presu'
    MasterSource = dsPresupuesto
    Version = '7.12.10 CodeGear Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    OnCalcFields = mtDeterLaboQuimCalcFields
    Left = 184
    Top = 448
    object mtDeterLaboQuimoid_item: TIntegerField
      Tag = 1
      FieldName = 'oid_item'
    end
    object mtDeterLaboQuimoid_presu: TIntegerField
      Tag = 1
      FieldName = 'oid_presu'
    end
    object mtDeterLaboQuimcod_ana: TStringField
      FieldName = 'cod_ana'
      Size = 15
    end
    object mtDeterLaboQuimdes_ana: TStringField
      FieldName = 'des_ana'
      Size = 100
    end
    object mtDeterLaboQuimoid_det: TIntegerField
      Tag = 1
      FieldName = 'oid_det'
    end
    object mtDeterLaboQuimcod_det: TStringField
      FieldName = 'cod_det'
      Size = 15
    end
    object mtDeterLaboQuimdes_det: TStringField
      FieldName = 'des_det'
      Size = 100
    end
    object mtDeterLaboQuimcant: TIntegerField
      Tag = 1
      FieldName = 'cant'
    end
    object mtDeterLaboQuimoid_mon: TIntegerField
      Tag = 1
      FieldName = 'oid_mon'
    end
    object mtDeterLaboQuimimporte: TFloatField
      Tag = 1
      FieldName = 'importe'
      DisplayFormat = '0.00'
    end
    object mtDeterLaboQuimimporte_total: TFloatField
      FieldKind = fkCalculated
      FieldName = 'importe_total'
      DisplayFormat = '0.00'
      Calculated = True
    end
  end
  object mtDeterLaboElec: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_item'
        DataType = ftInteger
      end
      item
        Name = 'oid_presu'
        DataType = ftInteger
      end
      item
        Name = 'cod_ana'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'des_ana'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'oid_det'
        DataType = ftInteger
      end
      item
        Name = 'cod_det'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'des_det'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'cant'
        DataType = ftInteger
      end
      item
        Name = 'importe'
        DataType = ftFloat
      end
      item
        Name = 'oid_mon'
        DataType = ftInteger
      end>
    IndexFieldNames = 'oid_presu'
    IndexDefs = <
      item
        Name = 'mtDeterLaboElecIndex'
        Fields = 'oid_presu'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    MasterFields = 'oid_presu'
    MasterSource = dsPresupuesto
    Version = '7.12.10 CodeGear Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    Left = 184
    Top = 496
    object mtDeterLaboElecoid_item: TIntegerField
      Tag = 1
      FieldName = 'oid_item'
    end
    object mtDeterLaboElecoid_presu: TIntegerField
      Tag = 1
      FieldName = 'oid_presu'
    end
    object mtDeterLaboEleccod_ana: TStringField
      FieldName = 'cod_ana'
      Size = 15
    end
    object mtDeterLaboElecdes_ana: TStringField
      FieldName = 'des_ana'
      Size = 100
    end
    object mtDeterLaboElecoid_det: TIntegerField
      Tag = 1
      FieldName = 'oid_det'
    end
    object mtDeterLaboEleccod_det: TStringField
      FieldName = 'cod_det'
      Size = 15
    end
    object mtDeterLaboElecdes_det: TStringField
      FieldName = 'des_det'
      Size = 100
    end
    object mtDeterLaboEleccant: TIntegerField
      Tag = 1
      FieldName = 'cant'
    end
    object mtDeterLaboElecoid_mon: TIntegerField
      Tag = 1
      FieldName = 'oid_mon'
    end
    object mtDeterLaboElecimporte: TFloatField
      Tag = 1
      FieldName = 'importe'
      DisplayFormat = '0.00'
    end
    object mtDeterLaboElecimporte_total: TFloatField
      FieldKind = fkCalculated
      FieldName = 'importe_total'
      DisplayFormat = '0.00'
      Calculated = True
    end
  end
  object mtMateriales: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_item'
        DataType = ftInteger
      end
      item
        Name = 'oid_presu'
        DataType = ftInteger
      end
      item
        Name = 'oid_art'
        DataType = ftInteger
      end
      item
        Name = 'cod_art'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'des_art'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'cant'
        DataType = ftInteger
      end
      item
        Name = 'importe'
        DataType = ftFloat
      end
      item
        Name = 'oid_mon'
        DataType = ftInteger
      end>
    IndexFieldNames = 'oid_presu'
    IndexDefs = <
      item
        Name = 'mtMaterialesIndex'
        Fields = 'oid_presu'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    MasterFields = 'oid_presu'
    MasterSource = dsPresupuesto
    Version = '7.12.10 CodeGear Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    OnCalcFields = mtMaterialesCalcFields
    Left = 184
    Top = 544
    object mtMaterialesoid_item: TIntegerField
      Tag = 1
      FieldName = 'oid_item'
    end
    object mtMaterialesoid_presu: TIntegerField
      Tag = 1
      FieldName = 'oid_presu'
    end
    object mtMaterialesoid_art: TIntegerField
      Tag = 1
      FieldName = 'oid_art'
    end
    object mtMaterialescod_art: TStringField
      FieldName = 'cod_art'
      OnChange = mtMaterialescod_artChange
      Size = 15
    end
    object mtMaterialesdes_art: TStringField
      FieldName = 'des_art'
      Size = 100
    end
    object mtMaterialescant: TIntegerField
      Tag = 1
      FieldName = 'cant'
    end
    object mtMaterialesoid_mon: TIntegerField
      Tag = 1
      FieldName = 'oid_mon'
    end
    object mtMaterialesimporte: TFloatField
      Tag = 1
      FieldName = 'importe'
      DisplayFormat = '0.00'
    end
    object mtMaterialesimporte_total: TFloatField
      FieldKind = fkCalculated
      FieldName = 'importe_total'
      DisplayFormat = '0.00'
      Calculated = True
    end
  end
  object dsDeterLaboQuim: TDataSource
    DataSet = mtDeterLaboQuim
    Left = 224
    Top = 448
  end
  object dsDeterLaboElec: TDataSource
    DataSet = mtDeterLaboElec
    Left = 224
    Top = 496
  end
  object dsMateriales: TDataSource
    DataSet = mtMateriales
    Left = 224
    Top = 544
  end
  object opTraerDeterQuimConPrecio: TjktOperacion
    OperName = 'TraerDeterQuimConPrecio'
    EnviarTodo = False
    Atributos = <
      item
        Attribute = 'oid_lista_precio'
        Field = mtPresupuestooid_lis_pre
        Tag = 0
      end
      item
        Attribute = 'laboratorio'
        Field = mtParametroInicialLaboratorio
        Tag = 0
      end>
    ServiceCaller = Service
    OnBeforeEjecutar = opTraerDeterQuimConPrecioBeforeEjecutar
    Left = 520
    Top = 528
  end
  object opTraerDeterElecConPrecio: TjktOperacion
    OperName = 'TraerDeterElecConPrecio'
    EnviarTodo = False
    Atributos = <
      item
        Attribute = 'oid_lista_precio'
        Field = mtPresupuestooid_lis_pre
        Tag = 0
      end
      item
        Attribute = 'laboratorio'
        Field = mtParametroInicialLaboratorio
        Tag = 0
      end>
    ServiceCaller = Service
    OnBeforeEjecutar = opTraerDeterElecConPrecioBeforeEjecutar
    Left = 560
    Top = 528
  end
  object opTraerProductoConPrecio: TjktOperacion
    OperName = 'TraerProductoConPrecio'
    EnviarTodo = False
    Atributos = <
      item
        Attribute = 'oid_lista_precio'
        Field = mtPresupuestooid_lis_pre
        Tag = 0
      end
      item
        Attribute = 'oid_art'
        Field = mtMaterialesoid_art
        Tag = 0
      end>
    ServiceCaller = Service
    Left = 600
    Top = 528
  end
  object hlpArt2: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'articulos'
    TipoFiltro = fi_Activos
    CodigoRespuesta = mtMaterialescod_art
    Left = 280
    Top = 136
  end
  object valArt2: TjktValidador
    Entidad = 'articulos'
    Validacion = tExistente
    ListaAsignaciones = <
      item
        SourceName = 'oid'
        FieldTarget = mtMaterialesoid_art
      end
      item
        SourceName = 'Descripcion'
        FieldTarget = mtMaterialesdes_art
      end>
    Left = 280
    Top = 184
  end
  object mtPrecioMaterial: TjktMemTable
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
    Left = 640
    Top = 528
    object mtPrecioMaterialoid_item: TIntegerField
      FieldName = 'oid_item'
    end
    object mtPrecioMaterialoid_mon: TIntegerField
      FieldName = 'oid_mon'
    end
    object mtPrecioMaterialimporte: TFloatField
      FieldName = 'importe'
    end
  end
  object valSucu: TjktValidador
    Entidad = 'clienteSucursal'
    EntidadMaestra = 'clientes'
    OidEntidadMaestra = mtPresupuestooid_clie
    Validacion = tExistente
    ListaAsignaciones = <
      item
        SourceName = 'oid'
        FieldTarget = mtPresupuestooid_sucu
      end
      item
        SourceName = 'Descripcion'
        FieldTarget = mtPresupuestodes_sucu
      end>
    CampoValidado = 'numero'
    Left = 120
    Top = 184
  end
  object opGenerarComprobantePresupuesto: TjktOperacion
    OperName = 'GenerarComprobantePresupuesto'
    EnviarTodo = False
    Atributos = <
      item
        Attribute = 'oid'
        Field = mtComprobanteoid_presu
        Tag = 0
      end>
    ServiceCaller = Service
    Left = 520
    Top = 584
  end
  object mtComprobante: TjktMemTable
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
    Left = 560
    Top = 584
    object mtComprobanteoid_presu: TIntegerField
      Tag = 1
      FieldName = 'oid_presu'
    end
    object mtComprobanteruta: TStringField
      FieldName = 'ruta'
      Size = 255
    end
    object mtComprobantearchivo: TStringField
      FieldName = 'archivo'
      Size = 255
    end
  end
end
