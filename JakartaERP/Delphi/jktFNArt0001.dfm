inherited FNArt0001: TFNArt0001
  Caption = 'ABM de Art'#237'culos'
  ClientHeight = 522
  ClientWidth = 839
  ExplicitWidth = 855
  ExplicitHeight = 560
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBoxLeft: TcxGroupBox
    ExplicitHeight = 522
    Height = 522
  end
  inherited cxSplitterLeft: TcxSplitter
    Height = 522
    ExplicitHeight = 522
  end
  inherited cxGroupBoxRight: TcxGroupBox
    Left = 809
    TabOrder = 4
    ExplicitLeft = 769
    ExplicitHeight = 522
    Height = 522
  end
  inherited cxSplitterRight: TcxSplitter
    Left = 805
    Height = 522
    ExplicitLeft = 765
    ExplicitHeight = 522
  end
  inherited cxGroupBoxMain: TcxGroupBox
    TabOrder = 7
    ExplicitWidth = 731
    ExplicitHeight = 522
    Height = 522
    Width = 771
    object lcMain: TdxLayoutControl
      Left = 2
      Top = 2
      Width = 767
      Height = 518
      Align = alClient
      TabOrder = 0
      LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
      ExplicitWidth = 727
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 68
        Top = 41
        DataBinding.DataField = 'Codigo'
        DataBinding.DataSource = dsArticulo
        Style.HotTrack = False
        TabOrder = 0
        Width = 121
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 279
        Top = 92
        DataBinding.DataField = 'DescAbrev'
        DataBinding.DataSource = dsArticulo
        Style.HotTrack = False
        TabOrder = 4
        Width = 467
      end
      object cxDBCheckBox1: TcxDBCheckBox
        Left = 62
        Top = 68
        DataBinding.DataField = 'EsBien'
        DataBinding.DataSource = dsArticulo
        Properties.OnChange = cxDBCheckBox1PropertiesChange
        Style.HotTrack = False
        TabOrder = 1
        Transparent = True
        Width = 40
      end
      object cxDBCheckBox2: TcxDBCheckBox
        Tag = 1
        Left = 62
        Top = 93
        DataBinding.DataField = 'EsServicio'
        DataBinding.DataSource = dsArticulo
        Properties.OnChange = cxDBCheckBox1PropertiesChange
        Style.HotTrack = False
        TabOrder = 2
        Transparent = True
        Width = 40
      end
      object cxDBCheckBox3: TcxDBCheckBox
        Left = 77
        Top = 131
        DataBinding.DataField = 'EsStockeable'
        DataBinding.DataSource = dsArticulo
        Style.HotTrack = False
        TabOrder = 5
        Transparent = True
        Width = 40
      end
      object cxDBCheckBox4: TcxDBCheckBox
        Left = 213
        Top = 131
        DataBinding.DataField = 'EsProdPropia'
        DataBinding.DataSource = dsArticulo
        Style.HotTrack = False
        TabOrder = 6
        Transparent = True
        Width = 40
      end
      object cxDBCheckBox5: TcxDBCheckBox
        Left = 327
        Top = 131
        DataBinding.DataField = 'EsComprable'
        DataBinding.DataSource = dsArticulo
        Style.HotTrack = False
        TabOrder = 7
        Transparent = True
        Width = 40
      end
      object cxDBCheckBox6: TcxDBCheckBox
        Left = 418
        Top = 131
        DataBinding.DataField = 'EsVendible'
        DataBinding.DataSource = dsArticulo
        Style.HotTrack = False
        TabOrder = 8
        Transparent = True
        Width = 40
      end
      object cxDBMemo1: TcxDBMemo
        Left = 279
        Top = 41
        DataBinding.DataField = 'Descripcion'
        DataBinding.DataSource = dsArticulo
        Style.HotTrack = False
        TabOrder = 3
        Height = 45
        Width = 467
      end
      object jktExpDBGrid1: TjktExpDBGrid
        Left = 10000
        Top = 10000
        Width = 726
        Height = 200
        TabOrder = 10
        Visible = False
        DataSource = dsValoresCaracProd
        object jktExpDBGrid1DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsValoresCaracProd
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsData.Deleting = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          object jktExpDBGrid1DBTableView1oid_ValorCarac: TcxGridDBColumn
            DataBinding.FieldName = 'oid_ValorCarac'
            Visible = False
          end
          object jktExpDBGrid1DBTableView1oid_Art: TcxGridDBColumn
            DataBinding.FieldName = 'oid_Art'
            Visible = False
          end
          object jktExpDBGrid1DBTableView1oid_Carac: TcxGridDBColumn
            DataBinding.FieldName = 'oid_Carac'
            Visible = False
          end
          object jktExpDBGrid1DBTableView1DescCarac: TcxGridDBColumn
            Caption = 'Desc. Carac.'
            DataBinding.FieldName = 'DescCarac'
            Options.Editing = False
          end
          object jktExpDBGrid1DBTableView1TipoDeDato: TcxGridDBColumn
            Caption = 'Tipo De Dato'
            DataBinding.FieldName = 'TipoDeDato'
            Options.Editing = False
          end
          object jktExpDBGrid1DBTableView1oid_TablaValores: TcxGridDBColumn
            DataBinding.FieldName = 'oid_TablaValores'
            Visible = False
            Width = 98
          end
          object jktExpDBGrid1DBTableView1CodValorCarac: TcxGridDBColumn
            Caption = 'C'#243'd. Valor Carac.'
            DataBinding.FieldName = 'CodValorCarac'
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.OnButtonClick = jktExpDBGrid1DBTableView1CodValorCaracPropertiesButtonClick
          end
          object jktExpDBGrid1DBTableView1DescValorCarac: TcxGridDBColumn
            Caption = 'Desc. Valor Carac.'
            DataBinding.FieldName = 'DescValorCarac'
            Options.Editing = False
          end
        end
        object jktExpDBGrid1Level1: TcxGridLevel
          GridView = jktExpDBGrid1DBTableView1
        end
      end
      object jktExpDBGrid2: TjktExpDBGrid
        Left = 10000
        Top = 10000
        Width = 726
        Height = 200
        TabOrder = 11
        Visible = False
        DataSource = dsAperturaStock
        object jktExpDBGrid2DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsAperturaStock
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.GroupByBox = False
        end
        object jktExpDBGrid2Level1: TcxGridLevel
          GridView = jktExpDBGrid2DBTableView1
        end
      end
      object jktExpDBGrid3: TjktExpDBGrid
        Left = 10000
        Top = 10000
        Width = 726
        Height = 200
        TabOrder = 24
        Visible = False
        DataSource = dsEquivalencias
        object jktExpDBGrid3DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsEquivalencias
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsView.GroupByBox = False
          object jktExpDBGrid3DBTableView1oid_EquivArt: TcxGridDBColumn
            DataBinding.FieldName = 'oid_EquivArt'
            Visible = False
          end
          object jktExpDBGrid3DBTableView1oid_Art: TcxGridDBColumn
            DataBinding.FieldName = 'oid_Art'
            Visible = False
          end
          object jktExpDBGrid3DBTableView1oid_UnidMedOrig: TcxGridDBColumn
            DataBinding.FieldName = 'oid_UnidMedOrig'
            Visible = False
          end
          object jktExpDBGrid3DBTableView1CodUnidMedOrig: TcxGridDBColumn
            Caption = 'C'#243'd. Unid. Med. Orig.'
            DataBinding.FieldName = 'CodUnidMedOrig'
            Width = 118
          end
          object jktExpDBGrid3DBTableView1DescUnidMedOrig: TcxGridDBColumn
            Caption = 'Desc. Unid. Med. Orig'
            DataBinding.FieldName = 'DescUnidMedOrig'
            Options.Editing = False
            Width = 401
          end
          object jktExpDBGrid3DBTableView1oid_UnidMedDest: TcxGridDBColumn
            DataBinding.FieldName = 'oid_UnidMedDest'
            Visible = False
          end
          object jktExpDBGrid3DBTableView1CodUnidMedDest: TcxGridDBColumn
            Caption = 'C'#243'd. Unid. Med. Dest'
            DataBinding.FieldName = 'CodUnidMedDest'
          end
          object jktExpDBGrid3DBTableView1DescUnidMedDest: TcxGridDBColumn
            Caption = 'Desc. Unid. Med. Dest.'
            DataBinding.FieldName = 'DescUnidMedDest'
            Options.Editing = False
            Width = 374
          end
          object jktExpDBGrid3DBTableView1FactConv: TcxGridDBColumn
            Caption = 'Factor Conv.'
            DataBinding.FieldName = 'FactConv'
            Width = 94
          end
          object jktExpDBGrid3DBTableView1Activo: TcxGridDBColumn
            DataBinding.FieldName = 'Activo'
            Width = 48
          end
        end
        object jktExpDBGrid3Level1: TcxGridLevel
          GridView = jktExpDBGrid3DBTableView1
        end
      end
      object jktExpDBGrid4: TjktExpDBGrid
        Left = 10000
        Top = 10000
        Width = 726
        Height = 200
        TabOrder = 25
        Visible = False
        DataSource = dsClasifProd
        object jktExpDBGrid4DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsClasifProd
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsData.Deleting = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          object jktExpDBGrid4DBTableView1oid_ClasifProd: TcxGridDBColumn
            DataBinding.FieldName = 'oid_ClasifProd'
            Visible = False
          end
          object jktExpDBGrid4DBTableView1oid_Art: TcxGridDBColumn
            DataBinding.FieldName = 'oid_Art'
            Visible = False
          end
          object jktExpDBGrid4DBTableView1oid_Clasif: TcxGridDBColumn
            DataBinding.FieldName = 'oid_Clasif'
            Visible = False
          end
          object jktExpDBGrid4DBTableView1DescClasif: TcxGridDBColumn
            Caption = 'Desc. Clasif.'
            DataBinding.FieldName = 'DescClasif'
            Options.Editing = False
          end
          object jktExpDBGrid4DBTableView1oid_ValorClasif: TcxGridDBColumn
            DataBinding.FieldName = 'oid_ValorClasif'
            Visible = False
          end
          object jktExpDBGrid4DBTableView1CodValorClasif: TcxGridDBColumn
            Caption = 'C'#243'd. Valor Clasif.'
            DataBinding.FieldName = 'CodValorClasif'
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.OnButtonClick = jktExpDBGrid4DBTableView1CodValorClasifPropertiesButtonClick
          end
          object jktExpDBGrid4DBTableView1DescValorClasif: TcxGridDBColumn
            Caption = 'Desc. Valor Clasif.'
            DataBinding.FieldName = 'DescValorClasif'
            Options.Editing = False
          end
          object jktExpDBGrid4DBTableView1Activo: TcxGridDBColumn
            DataBinding.FieldName = 'Activo'
          end
        end
        object jktExpDBGrid4Level1: TcxGridLevel
          GridView = jktExpDBGrid4DBTableView1
        end
      end
      object cxDBLookupComboBox1: TcxDBLookupComboBox
        Left = 10000
        Top = 10000
        DataBinding.DataField = 'oid_TipoArt'
        DataBinding.DataSource = dsArticulo
        Properties.KeyFieldNames = 'oid_TipoArt'
        Properties.ListColumns = <
          item
            Caption = 'C'#243'digo'
            Width = 60
            FieldName = 'CodTipoArt'
          end
          item
            Caption = 'Descripci'#243'n'
            Width = 220
            FieldName = 'DescTipoArt'
          end>
        Properties.ListFieldIndex = 1
        Properties.ListSource = dsTiposDeProducto
        Style.HotTrack = False
        TabOrder = 9
        Visible = False
        Width = 280
      end
      object cxDBButtonEdit1: TcxDBButtonEdit
        Left = 10000
        Top = 10000
        DataBinding.DataField = 'CodUnidStockPrinc'
        DataBinding.DataSource = dsArticulo
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = cxDBButtonEdit1PropertiesButtonClick
        Style.HotTrack = False
        TabOrder = 12
        Visible = False
        Width = 70
      end
      object cxDBButtonEdit2: TcxDBButtonEdit
        Left = 10000
        Top = 10000
        DataBinding.DataField = 'CodUnidStockSecun'
        DataBinding.DataSource = dsArticulo
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = cxDBButtonEdit2PropertiesButtonClick
        Style.HotTrack = False
        TabOrder = 14
        Visible = False
        Width = 70
      end
      object cxDBButtonEdit3: TcxDBButtonEdit
        Left = 10000
        Top = 10000
        DataBinding.DataField = 'CodUnidStockTerc'
        DataBinding.DataSource = dsArticulo
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = cxDBButtonEdit3PropertiesButtonClick
        Style.HotTrack = False
        TabOrder = 16
        Visible = False
        Width = 70
      end
      object cxDBButtonEdit4: TcxDBButtonEdit
        Left = 10000
        Top = 10000
        DataBinding.DataField = 'CodUnidVenta'
        DataBinding.DataSource = dsArticulo
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = cxDBButtonEdit4PropertiesButtonClick
        Style.HotTrack = False
        TabOrder = 18
        Visible = False
        Width = 70
      end
      object cxDBButtonEdit5: TcxDBButtonEdit
        Left = 10000
        Top = 10000
        DataBinding.DataField = 'CodUnidProd'
        DataBinding.DataSource = dsArticulo
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = cxDBButtonEdit5PropertiesButtonClick
        Style.HotTrack = False
        TabOrder = 20
        Visible = False
        Width = 70
      end
      object cxDBButtonEdit6: TcxDBButtonEdit
        Left = 10000
        Top = 10000
        DataBinding.DataField = 'CodUnidCompra'
        DataBinding.DataSource = dsArticulo
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = cxDBButtonEdit6PropertiesButtonClick
        Style.HotTrack = False
        TabOrder = 22
        Visible = False
        Width = 70
      end
      object cxDBTextEdit3: TcxDBTextEdit
        Left = 10000
        Top = 10000
        DataBinding.DataField = 'DescUnidStockPrinc'
        DataBinding.DataSource = dsArticulo
        Enabled = False
        Style.HotTrack = False
        TabOrder = 13
        Visible = False
        Width = 200
      end
      object cxDBTextEdit4: TcxDBTextEdit
        Left = 10000
        Top = 10000
        DataBinding.DataField = 'DescUnidStockSecun'
        DataBinding.DataSource = dsArticulo
        Enabled = False
        Style.HotTrack = False
        TabOrder = 15
        Visible = False
        Width = 200
      end
      object cxDBTextEdit5: TcxDBTextEdit
        Left = 10000
        Top = 10000
        DataBinding.DataField = 'DescUnidStockTerc'
        DataBinding.DataSource = dsArticulo
        Enabled = False
        Style.HotTrack = False
        TabOrder = 17
        Visible = False
        Width = 200
      end
      object cxDBTextEdit6: TcxDBTextEdit
        Left = 10000
        Top = 10000
        DataBinding.DataField = 'DescUnidVenta'
        DataBinding.DataSource = dsArticulo
        Enabled = False
        Style.HotTrack = False
        TabOrder = 19
        Visible = False
        Width = 200
      end
      object cxDBTextEdit7: TcxDBTextEdit
        Left = 10000
        Top = 10000
        DataBinding.DataField = 'DescUnidProd'
        DataBinding.DataSource = dsArticulo
        Enabled = False
        Style.HotTrack = False
        TabOrder = 21
        Visible = False
        Width = 200
      end
      object cxDBTextEdit8: TcxDBTextEdit
        Left = 10000
        Top = 10000
        DataBinding.DataField = 'DescUnidCompra'
        DataBinding.DataSource = dsArticulo
        Enabled = False
        Style.HotTrack = False
        TabOrder = 23
        Visible = False
        Width = 200
      end
      object lcMainGroup_Root: TdxLayoutGroup
        AlignHorz = ahLeft
        AlignVert = avTop
        ButtonOptions.Buttons = <>
        Hidden = True
        ItemIndex = 1
        ShowBorder = False
        Index = -1
      end
      object lcMainGroup1: TdxLayoutGroup
        CaptionOptions.Text = 'Datos del Producto'
        Parent = lcMainGroup_Root
        ButtonOptions.Buttons = <>
        Index = 0
      end
      object lcMainItem1: TdxLayoutItem
        CaptionOptions.Text = 'Producto'
        Parent = lcMainGroup8
        Control = cxDBTextEdit1
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainItem2: TdxLayoutItem
        CaptionOptions.AlignVert = tavTop
        CaptionOptions.Text = 'Descripci'#243'n'
        Parent = lcMainGroup6
        Control = cxDBMemo1
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainItem3: TdxLayoutItem
        CaptionOptions.Text = 'Desc. Abreviada'
        Parent = lcMainGroup6
        Control = cxDBTextEdit2
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object lcMainItem4: TdxLayoutItem
        AlignHorz = ahLeft
        CaptionOptions.Text = 'Bien'
        Parent = lcMainGroup2
        Control = cxDBCheckBox1
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainItem5: TdxLayoutItem
        AlignHorz = ahLeft
        CaptionOptions.Text = 'Servicio'
        Parent = lcMainGroup2
        Control = cxDBCheckBox2
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object lcMainItem6: TdxLayoutItem
        CaptionOptions.Text = 'Stockeable'
        Parent = lcMainGroup4
        Control = cxDBCheckBox3
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainItem7: TdxLayoutItem
        CaptionOptions.Text = 'Producci'#243'n Propia'
        Parent = lcMainGroup4
        Control = cxDBCheckBox4
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object lcMainItem8: TdxLayoutItem
        CaptionOptions.Text = 'Comprable'
        Parent = lcMainGroup5
        Control = cxDBCheckBox5
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainItem9: TdxLayoutItem
        CaptionOptions.Text = 'Vendible'
        Parent = lcMainGroup5
        Control = cxDBCheckBox6
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object lcMainGroup2: TdxLayoutGroup
        CaptionOptions.Text = 'Hidden Group'
        Parent = lcMainGroup8
        ButtonOptions.Buttons = <>
        Hidden = True
        ShowBorder = False
        Index = 1
      end
      object lcMainGroup3: TdxLayoutGroup
        CaptionOptions.Text = 'Hidden Group'
        Parent = lcMainGroup1
        ButtonOptions.Buttons = <>
        Hidden = True
        LayoutDirection = ldHorizontal
        ShowBorder = False
        Index = 2
      end
      object lcMainGroup4: TdxLayoutGroup
        CaptionOptions.Text = 'Hidden Group'
        Parent = lcMainGroup3
        ButtonOptions.Buttons = <>
        Hidden = True
        ItemControlAreaAlignment = catOwn
        LayoutDirection = ldHorizontal
        ShowBorder = False
        Index = 0
      end
      object lcMainGroup5: TdxLayoutGroup
        CaptionOptions.Text = 'Hidden Group'
        Parent = lcMainGroup3
        ButtonOptions.Buttons = <>
        Hidden = True
        ItemControlAreaAlignment = catOwn
        LayoutDirection = ldHorizontal
        ShowBorder = False
        Index = 2
      end
      object lcMainSeparatorItem2: TdxLayoutSeparatorItem
        CaptionOptions.Text = 'Separator'
        Parent = lcMainGroup3
        SizeOptions.AssignedValues = [sovSizableHorz, sovSizableVert]
        SizeOptions.SizableHorz = False
        SizeOptions.SizableVert = False
        Index = 1
      end
      object lcMainGroup6: TdxLayoutGroup
        CaptionOptions.Text = 'Hidden Group'
        Parent = lcMainGroup7
        ButtonOptions.Buttons = <>
        Hidden = True
        ShowBorder = False
        Index = 1
      end
      object lcMainGroup7: TdxLayoutGroup
        CaptionOptions.Text = 'Hidden Group'
        Parent = lcMainGroup1
        ButtonOptions.Buttons = <>
        Hidden = True
        LayoutDirection = ldHorizontal
        ShowBorder = False
        Index = 0
      end
      object lcMainSeparatorItem3: TdxLayoutSeparatorItem
        CaptionOptions.Text = 'Separator'
        Parent = lcMainGroup1
        SizeOptions.AssignedValues = [sovSizableHorz, sovSizableVert]
        SizeOptions.SizableHorz = False
        SizeOptions.SizableVert = False
        Index = 1
      end
      object lcMainGroup8: TdxLayoutGroup
        CaptionOptions.Text = 'Hidden Group'
        Parent = lcMainGroup7
        ButtonOptions.Buttons = <>
        Hidden = True
        ItemControlAreaAlignment = catNone
        ShowBorder = False
        Index = 0
      end
      object lcMainGroup9: TdxLayoutGroup
        CaptionOptions.Text = 'Especificaciones de Producto'
        Parent = lcMainGroup_Root
        ButtonOptions.Buttons = <>
        ButtonOptions.ShowExpandButton = True
        Expanded = False
        ItemControlAreaAlignment = catOwn
        Index = 1
      end
      object lcMainGroup10: TdxLayoutGroup
        CaptionOptions.Text = 'New Group'
        Parent = lcMainGroup_Root
        ButtonOptions.Buttons = <>
        Hidden = True
        ShowBorder = False
        Index = 2
      end
      object lcMainGroup11: TdxLayoutGroup
        CaptionOptions.Text = 'Apertura de Stock'
        Parent = lcMainGroup10
        ButtonOptions.Buttons = <>
        ButtonOptions.ShowExpandButton = True
        Expanded = False
        Index = 0
      end
      object lcMainGroup12: TdxLayoutGroup
        CaptionOptions.Text = 'Unidades de Medida'
        Parent = lcMainGroup10
        ButtonOptions.Buttons = <>
        ButtonOptions.ShowExpandButton = True
        Expanded = False
        Index = 1
      end
      object lcMainGroup13: TdxLayoutGroup
        CaptionOptions.Text = 'Clasificadores'
        Parent = lcMainGroup10
        ButtonOptions.Buttons = <>
        ButtonOptions.ShowExpandButton = True
        Expanded = False
        Index = 2
      end
      object lcMainItem10: TdxLayoutItem
        CaptionOptions.Text = 'jktExpDBGrid1'
        CaptionOptions.Visible = False
        Parent = lcMainGroup9
        Control = jktExpDBGrid1
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object lcMainItem11: TdxLayoutItem
        CaptionOptions.Text = 'jktExpDBGrid2'
        CaptionOptions.Visible = False
        Parent = lcMainGroup11
        Control = jktExpDBGrid2
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainItem12: TdxLayoutItem
        CaptionOptions.Text = 'Equivalencias'
        CaptionOptions.Layout = clTop
        Parent = lcMainGroup12
        Control = jktExpDBGrid3
        ControlOptions.ShowBorder = False
        Index = 8
      end
      object lcMainItem13: TdxLayoutItem
        CaptionOptions.Text = 'jktExpDBGrid4'
        CaptionOptions.Visible = False
        Parent = lcMainGroup13
        Control = jktExpDBGrid4
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainItem14: TdxLayoutItem
        AlignHorz = ahLeft
        CaptionOptions.Text = 'Tipo de Producto'
        Parent = lcMainGroup9
        Control = cxDBLookupComboBox1
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainItem15: TdxLayoutItem
        CaptionOptions.Text = 'Unidad de Stock Principal'
        Parent = lcMainGroup14
        Control = cxDBButtonEdit1
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainItem16: TdxLayoutItem
        CaptionOptions.Text = 'Unidad de Stock Secundaria'
        Parent = lcMainGroup15
        Control = cxDBButtonEdit2
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainItem17: TdxLayoutItem
        CaptionOptions.Text = 'Unidad de Stock Terciaria'
        Parent = lcMainGroup16
        Control = cxDBButtonEdit3
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainItem18: TdxLayoutItem
        CaptionOptions.Text = 'Unidad de Venta'
        Parent = lcMainGroup17
        Control = cxDBButtonEdit4
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainItem19: TdxLayoutItem
        CaptionOptions.Text = 'Unidad de Producci'#243'n'
        Parent = lcMainGroup18
        Control = cxDBButtonEdit5
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainItem20: TdxLayoutItem
        CaptionOptions.Text = 'Unidad de Compra'
        Parent = lcMainGroup19
        Control = cxDBButtonEdit6
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainSpaceItem1: TdxLayoutEmptySpaceItem
        CaptionOptions.Text = 'Empty Space Item'
        Parent = lcMainGroup12
        SizeOptions.Height = 10
        SizeOptions.Width = 10
        Index = 3
      end
      object lcMainSpaceItem2: TdxLayoutEmptySpaceItem
        CaptionOptions.Text = 'Empty Space Item'
        Parent = lcMainGroup12
        SizeOptions.Height = 10
        SizeOptions.Width = 10
        Index = 7
      end
      object lcMainItem21: TdxLayoutItem
        CaptionOptions.Visible = False
        Parent = lcMainGroup14
        Control = cxDBTextEdit3
        ControlOptions.ShowBorder = False
        Enabled = False
        Index = 1
      end
      object lcMainItem22: TdxLayoutItem
        CaptionOptions.Visible = False
        Parent = lcMainGroup15
        Control = cxDBTextEdit4
        ControlOptions.ShowBorder = False
        Enabled = False
        Index = 1
      end
      object lcMainItem23: TdxLayoutItem
        CaptionOptions.Visible = False
        Parent = lcMainGroup16
        Control = cxDBTextEdit5
        ControlOptions.ShowBorder = False
        Enabled = False
        Index = 1
      end
      object lcMainItem24: TdxLayoutItem
        CaptionOptions.Visible = False
        Parent = lcMainGroup17
        Control = cxDBTextEdit6
        ControlOptions.ShowBorder = False
        Enabled = False
        Index = 1
      end
      object lcMainItem25: TdxLayoutItem
        CaptionOptions.Visible = False
        Parent = lcMainGroup18
        Control = cxDBTextEdit7
        ControlOptions.ShowBorder = False
        Enabled = False
        Index = 1
      end
      object lcMainItem26: TdxLayoutItem
        CaptionOptions.Visible = False
        Parent = lcMainGroup19
        Control = cxDBTextEdit8
        ControlOptions.ShowBorder = False
        Enabled = False
        Index = 1
      end
      object lcMainGroup14: TdxLayoutGroup
        CaptionOptions.Text = 'Hidden Group'
        Parent = lcMainGroup12
        ButtonOptions.Buttons = <>
        Hidden = True
        LayoutDirection = ldHorizontal
        ShowBorder = False
        Index = 0
      end
      object lcMainGroup15: TdxLayoutGroup
        CaptionOptions.Text = 'Hidden Group'
        Parent = lcMainGroup12
        ButtonOptions.Buttons = <>
        Hidden = True
        LayoutDirection = ldHorizontal
        ShowBorder = False
        Index = 1
      end
      object lcMainGroup16: TdxLayoutGroup
        CaptionOptions.Text = 'Hidden Group'
        Parent = lcMainGroup12
        ButtonOptions.Buttons = <>
        Hidden = True
        LayoutDirection = ldHorizontal
        ShowBorder = False
        Index = 2
      end
      object lcMainGroup17: TdxLayoutGroup
        CaptionOptions.Text = 'Hidden Group'
        Parent = lcMainGroup12
        ButtonOptions.Buttons = <>
        Hidden = True
        LayoutDirection = ldHorizontal
        ShowBorder = False
        Index = 4
      end
      object lcMainGroup18: TdxLayoutGroup
        CaptionOptions.Text = 'Hidden Group'
        Parent = lcMainGroup12
        ButtonOptions.Buttons = <>
        Hidden = True
        LayoutDirection = ldHorizontal
        ShowBorder = False
        Index = 5
      end
      object lcMainGroup19: TdxLayoutGroup
        CaptionOptions.Text = 'Hidden Group'
        Parent = lcMainGroup12
        ButtonOptions.Buttons = <>
        Hidden = True
        LayoutDirection = ldHorizontal
        ShowBorder = False
        Index = 6
      end
    end
  end
  inherited BarManager: TdxBarManager
    Left = 264
    Top = 24
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited Driver: TjktDriver
    DataSetCab = mtArticulo
    TipoPrograma = tp_abmIndividual
    Filtro = Help
    OperacionesIniciales = <
      item
        Operacion = opTraerTiposDeProducto
      end>
    OperacionesDefault = <
      item
        Operacion = opTraerClasifProd
      end>
    Left = 496
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
    OperName = 'GuardarArticulo'
    Atributos = <
      item
        Dataset = mtValoresCaracProd
        Tag = 0
      end
      item
        Dataset = mtEquivalencias
        Tag = 0
      end
      item
        Dataset = mtClasifProd
        Tag = 0
      end>
    OnBeforeEjecutar = OperacionSaveBeforeEjecutar
    Left = 536
    Top = 24
  end
  inherited mtParametroInicial: TjktMemTable
    Left = 432
    Top = 24
  end
  inherited OperacionTraer: TjktOperacion
    OperName = 'TraerArticulo'
    Atributos = <
      item
        Attribute = 'oid'
        Field = mtArticulooid_Art
        Tag = 0
      end>
    Left = 536
    Top = 80
  end
  inherited ValidadorForm: TjktValidadorForm
    ListaValidaciones = <
      item
        Field = mtArticuloCodUnidStockPrinc
        ValidadorGral = ValUnidStockPrinc
      end
      item
        Field = mtArticuloCodUnidStockSecun
        ValidadorGral = ValUnidStockSecun
      end
      item
        Field = mtArticuloCodUnidStockTerc
        ValidadorGral = ValUnidStockTerc
      end
      item
        Field = mtArticuloCodUnidVenta
        ValidadorGral = ValUnidVenta
      end
      item
        Field = mtArticuloCodUnidProd
        ValidadorGral = ValUnidProd
      end
      item
        Field = mtArticuloCodUnidCompra
        ValidadorGral = ValUnidCompra
      end>
    Left = 208
    Top = 24
  end
  object mtArticulo: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_Art'
        DataType = ftInteger
      end
      item
        Name = 'Codigo'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Descripcion'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'DescAbrev'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'oid_TipoArt'
        DataType = ftInteger
      end
      item
        Name = 'EsBien'
        DataType = ftBoolean
      end
      item
        Name = 'EsServicio'
        DataType = ftBoolean
      end
      item
        Name = 'EsStockeable'
        DataType = ftBoolean
      end
      item
        Name = 'EsProdPropia'
        DataType = ftBoolean
      end
      item
        Name = 'EsComprable'
        DataType = ftBoolean
      end
      item
        Name = 'EsVendible'
        DataType = ftBoolean
      end
      item
        Name = 'Activo'
        DataType = ftBoolean
      end
      item
        Name = 'oid_UnidStockPrinc'
        DataType = ftInteger
      end
      item
        Name = 'CodUnidStockPrinc'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DescUnidStockPrinc'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'oid_UnidStockSecun'
        DataType = ftInteger
      end
      item
        Name = 'CodUnidStockSecun'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DescUnidStockSecun'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'oid_UnidStockTerc'
        DataType = ftInteger
      end
      item
        Name = 'CodUnidStockTerc'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DescUnidStockTerc'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'oid_UnidVenta'
        DataType = ftInteger
      end
      item
        Name = 'CodUnidVenta'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DescUnidVenta'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'oid_UnidProd'
        DataType = ftInteger
      end
      item
        Name = 'CodUnidProd'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DescUnidProd'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'oid_UnidCompra'
        DataType = ftInteger
      end
      item
        Name = 'CodUnidCompra'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DescUnidCompra'
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
    Left = 352
    Top = 120
    object mtArticulooid_Art: TIntegerField
      Tag = 1
      FieldName = 'oid_Art'
    end
    object mtArticuloCodigo: TStringField
      Tag = 1
      FieldName = 'Codigo'
      Size = 50
    end
    object mtArticuloDescripcion: TStringField
      Tag = 1
      FieldName = 'Descripcion'
      Size = 80
    end
    object mtArticuloDescAbrev: TStringField
      Tag = 1
      FieldName = 'DescAbrev'
      Size = 40
    end
    object mtArticulooid_TipoArt: TIntegerField
      Tag = 1
      FieldName = 'oid_TipoArt'
      OnValidate = mtArticulooid_TipoArtValidate
    end
    object mtArticuloEsBien: TBooleanField
      Tag = 1
      FieldName = 'EsBien'
    end
    object mtArticuloEsServicio: TBooleanField
      Tag = 1
      FieldName = 'EsServicio'
    end
    object mtArticuloEsStockeable: TBooleanField
      Tag = 1
      FieldName = 'EsStockeable'
    end
    object mtArticuloEsProdPropia: TBooleanField
      Tag = 1
      FieldName = 'EsProdPropia'
    end
    object mtArticuloEsComprable: TBooleanField
      Tag = 1
      FieldName = 'EsComprable'
    end
    object mtArticuloEsVendible: TBooleanField
      Tag = 1
      FieldName = 'EsVendible'
    end
    object mtArticuloActivo: TBooleanField
      Tag = 1
      FieldName = 'Activo'
    end
    object mtArticulooid_UnidStockPrinc: TIntegerField
      Tag = 1
      FieldName = 'oid_UnidStockPrinc'
    end
    object mtArticuloCodUnidStockPrinc: TStringField
      FieldName = 'CodUnidStockPrinc'
      Size = 10
    end
    object mtArticuloDescUnidStockPrinc: TStringField
      FieldName = 'DescUnidStockPrinc'
      Size = 100
    end
    object mtArticulooid_UnidStockSecun: TIntegerField
      Tag = 1
      FieldName = 'oid_UnidStockSecun'
    end
    object mtArticuloCodUnidStockSecun: TStringField
      FieldName = 'CodUnidStockSecun'
      Size = 10
    end
    object mtArticuloDescUnidStockSecun: TStringField
      FieldName = 'DescUnidStockSecun'
      Size = 100
    end
    object mtArticulooid_UnidStockTerc: TIntegerField
      Tag = 1
      FieldName = 'oid_UnidStockTerc'
    end
    object mtArticuloCodUnidStockTerc: TStringField
      FieldName = 'CodUnidStockTerc'
      Size = 10
    end
    object mtArticuloDescUnidStockTerc: TStringField
      FieldName = 'DescUnidStockTerc'
      Size = 100
    end
    object mtArticulooid_UnidVenta: TIntegerField
      Tag = 1
      FieldName = 'oid_UnidVenta'
    end
    object mtArticuloCodUnidVenta: TStringField
      FieldName = 'CodUnidVenta'
      Size = 10
    end
    object mtArticuloDescUnidVenta: TStringField
      FieldName = 'DescUnidVenta'
      Size = 100
    end
    object mtArticulooid_UnidProd: TIntegerField
      Tag = 1
      FieldName = 'oid_UnidProd'
    end
    object mtArticuloCodUnidProd: TStringField
      FieldName = 'CodUnidProd'
      Size = 10
    end
    object mtArticuloDescUnidProd: TStringField
      FieldName = 'DescUnidProd'
      Size = 100
    end
    object mtArticulooid_UnidCompra: TIntegerField
      Tag = 1
      FieldName = 'oid_UnidCompra'
    end
    object mtArticuloCodUnidCompra: TStringField
      FieldName = 'CodUnidCompra'
      Size = 10
    end
    object mtArticuloDescUnidCompra: TStringField
      FieldName = 'DescUnidCompra'
      Size = 100
    end
  end
  object mtValoresCaracProd: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_ValorCarac'
        DataType = ftInteger
      end
      item
        Name = 'oid_Art'
        DataType = ftInteger
      end
      item
        Name = 'oid_Carac'
        DataType = ftInteger
      end
      item
        Name = 'DescCarac'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'TipoDeDato'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CodValorCarac'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'DescValorCarac'
        DataType = ftString
        Size = 100
      end>
    IndexFieldNames = 'oid_Art'
    IndexDefs = <
      item
        Name = 'mtValoresCaracProdIndex'
        Fields = 'oid_Art'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    MasterFields = 'oid_Art'
    MasterSource = dsArticulo
    Version = '7.12.10 CodeGear Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    Left = 352
    Top = 168
    object mtValoresCaracProdoid_ValorCarac: TIntegerField
      Tag = 1
      FieldName = 'oid_ValorCarac'
    end
    object mtValoresCaracProdoid_Art: TIntegerField
      Tag = 1
      FieldName = 'oid_Art'
    end
    object mtValoresCaracProdoid_Carac: TIntegerField
      Tag = 1
      FieldName = 'oid_Carac'
    end
    object mtValoresCaracProdDescCarac: TStringField
      FieldName = 'DescCarac'
      Size = 50
    end
    object mtValoresCaracProdTipoDeDato: TStringField
      FieldName = 'TipoDeDato'
      Size = 15
    end
    object mtValoresCaracProdoid_TablaValores: TIntegerField
      FieldName = 'oid_TablaValores'
    end
    object mtValoresCaracProdCodValorCarac: TStringField
      Tag = 1
      FieldName = 'CodValorCarac'
      Size = 15
    end
    object mtValoresCaracProdDescValorCarac: TStringField
      FieldName = 'DescValorCarac'
      Size = 100
    end
  end
  object mtAperturaStock: TjktMemTable
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
    Left = 352
    Top = 216
    object mtAperturaStockoid_Art: TIntegerField
      Tag = 1
      FieldName = 'oid_Art'
    end
  end
  object mtEquivalencias: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_EquivArt'
        DataType = ftInteger
      end
      item
        Name = 'oid_Art'
        DataType = ftInteger
      end
      item
        Name = 'oid_UnidMedOrig'
        DataType = ftInteger
      end
      item
        Name = 'CodUnidMedOrig'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DescUnidMedOrig'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'oid_UnidMedDest'
        DataType = ftInteger
      end
      item
        Name = 'CodUnidMedDest'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DescUnidMedDest'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'FactConv'
        DataType = ftFloat
      end
      item
        Name = 'Activo'
        DataType = ftBoolean
      end>
    IndexFieldNames = 'oid_Art'
    IndexDefs = <
      item
        Name = 'mtEquivalenciasIndex'
        Fields = 'oid_Art'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    MasterFields = 'oid_Art'
    MasterSource = dsArticulo
    Version = '7.12.10 CodeGear Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    Left = 352
    Top = 264
    object mtEquivalenciasoid_EquivArt: TIntegerField
      Tag = 1
      FieldName = 'oid_EquivArt'
    end
    object mtEquivalenciasoid_Art: TIntegerField
      Tag = 1
      FieldName = 'oid_Art'
    end
    object mtEquivalenciasoid_UnidMedOrig: TIntegerField
      Tag = 1
      FieldName = 'oid_UnidMedOrig'
    end
    object mtEquivalenciasCodUnidMedOrig: TStringField
      FieldName = 'CodUnidMedOrig'
      Size = 10
    end
    object mtEquivalenciasDescUnidMedOrig: TStringField
      FieldName = 'DescUnidMedOrig'
      Size = 100
    end
    object mtEquivalenciasoid_UnidMedDest: TIntegerField
      Tag = 1
      FieldName = 'oid_UnidMedDest'
    end
    object mtEquivalenciasCodUnidMedDest: TStringField
      FieldName = 'CodUnidMedDest'
      Size = 10
    end
    object mtEquivalenciasDescUnidMedDest: TStringField
      FieldName = 'DescUnidMedDest'
      Size = 100
    end
    object mtEquivalenciasFactConv: TFloatField
      Tag = 1
      FieldName = 'FactConv'
    end
    object mtEquivalenciasActivo: TBooleanField
      Tag = 1
      FieldName = 'Activo'
    end
  end
  object mtClasifProd: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_ClasifProd'
        DataType = ftInteger
      end
      item
        Name = 'oid_Art'
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
    IndexFieldNames = 'oid_Art'
    IndexDefs = <
      item
        Name = 'mtClasifProdIndex'
        Fields = 'oid_Art'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    MasterFields = 'oid_Art'
    MasterSource = dsArticulo
    Version = '7.12.10 CodeGear Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    Left = 352
    Top = 312
    object mtClasifProdoid_ClasifProd: TIntegerField
      Tag = 1
      FieldName = 'oid_ClasifProd'
    end
    object mtClasifProdoid_Art: TIntegerField
      Tag = 1
      FieldName = 'oid_Art'
    end
    object mtClasifProdoid_Clasif: TIntegerField
      Tag = 1
      FieldName = 'oid_Clasif'
    end
    object mtClasifProdDescClasif: TStringField
      FieldName = 'DescClasif'
      Size = 30
    end
    object mtClasifProdoid_ValorClasif: TIntegerField
      Tag = 1
      FieldName = 'oid_ValorClasif'
    end
    object mtClasifProdCodValorClasif: TStringField
      FieldName = 'CodValorClasif'
    end
    object mtClasifProdDescValorClasif: TStringField
      FieldName = 'DescValorClasif'
      Size = 30
    end
    object mtClasifProdActivo: TBooleanField
      Tag = 1
      FieldName = 'Activo'
    end
  end
  object mtTiposDeProducto: TjktMemTable
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
    Top = 224
    object mtTiposDeProductooid_TipoArt: TIntegerField
      FieldName = 'oid_TipoArt'
    end
    object mtTiposDeProductoCodTipoArt: TStringField
      FieldName = 'CodTipoArt'
      Size = 10
    end
    object mtTiposDeProductoDescTipoArt: TStringField
      FieldName = 'DescTipoArt'
      Size = 80
    end
  end
  object dsArticulo: TDataSource
    DataSet = mtArticulo
    Left = 392
    Top = 120
  end
  object dsValoresCaracProd: TDataSource
    DataSet = mtValoresCaracProd
    Left = 392
    Top = 168
  end
  object dsAperturaStock: TDataSource
    DataSet = mtAperturaStock
    Left = 392
    Top = 216
  end
  object dsEquivalencias: TDataSource
    DataSet = mtEquivalencias
    Left = 392
    Top = 264
  end
  object dsClasifProd: TDataSource
    DataSet = mtClasifProd
    Left = 392
    Top = 312
  end
  object dsTiposDeProducto: TDataSource
    DataSet = mtTiposDeProducto
    Left = 152
    Top = 224
  end
  object Help: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'articulos'
    OidRespuesta = mtArticulooid_Art
    Left = 496
    Top = 80
  end
  object opTraerClasifProd: TjktOperacion
    OperName = 'TraerClasifProd'
    EnviarTodo = False
    Atributos = <>
    ServiceCaller = Service
    Left = 576
    Top = 24
  end
  object opTraerTiposDeProducto: TjktOperacion
    OperName = 'TraerTiposDeProducto'
    EnviarTodo = False
    Atributos = <>
    ServiceCaller = Service
    Left = 192
    Top = 224
  end
  object HelpValorCarac: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'valoresDeTabla'
    EntidadMaestra = 'tablaValoresCaract'
    OidEntidadMaestra = mtValoresCaracProdoid_TablaValores
    CodigoRespuesta = mtValoresCaracProdCodValorCarac
    Left = 288
    Top = 400
  end
  object HelpValorClasifProd: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'valoresClasificador'
    OidEntidadMaestra = mtClasifProdoid_Clasif
    TipoFiltro = fi_ValoresClasificador
    OidRespuesta = mtClasifProdoid_ValorClasif
    CodigoRespuesta = mtClasifProdCodValorClasif
    Left = 328
    Top = 400
  end
  object opTraerCaractProducto: TjktOperacion
    OperName = 'TraerCaracteristicasDeProducto'
    EnviarTodo = False
    Atributos = <
      item
        Attribute = 'oid'
        Field = mtArticulooid_TipoArt
        Tag = 0
      end>
    ServiceCaller = Service
    Left = 232
    Top = 224
  end
  object ValUnidStockPrinc: TjktValidador
    Entidad = 'unidadMedida'
    Validacion = tExistente
    ListaAsignaciones = <
      item
        SourceName = 'oid'
        FieldTarget = mtArticulooid_UnidStockPrinc
      end
      item
        SourceName = 'Descripcion'
        FieldTarget = mtArticuloDescUnidStockPrinc
      end>
    Left = 48
    Top = 456
  end
  object ValUnidStockSecun: TjktValidador
    Entidad = 'unidadMedida'
    Validacion = tExistente
    ListaAsignaciones = <
      item
        SourceName = 'oid'
        FieldTarget = mtArticulooid_UnidStockSecun
      end
      item
        SourceName = 'Descripcion'
        FieldTarget = mtArticuloDescUnidStockSecun
      end>
    Left = 88
    Top = 456
  end
  object HelpUnidStockPrinc: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'unidadMedida'
    OidRespuesta = mtArticulooid_UnidStockPrinc
    CodigoRespuesta = mtArticuloCodUnidStockPrinc
    Left = 48
    Top = 400
  end
  object HelpUnidStockSecun: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'unidadMedida'
    OidRespuesta = mtArticulooid_UnidStockSecun
    CodigoRespuesta = mtArticuloCodUnidStockSecun
    Left = 88
    Top = 400
  end
  object HelpUnidStockTerc: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'unidadMedida'
    OidRespuesta = mtArticulooid_UnidStockTerc
    CodigoRespuesta = mtArticuloCodUnidStockTerc
    Left = 128
    Top = 400
  end
  object ValUnidStockTerc: TjktValidador
    Entidad = 'unidadMedida'
    Validacion = tExistente
    ListaAsignaciones = <
      item
        SourceName = 'oid'
        FieldTarget = mtArticulooid_UnidStockTerc
      end
      item
        SourceName = 'Descripcion'
        FieldTarget = mtArticuloDescUnidStockTerc
      end>
    Left = 128
    Top = 456
  end
  object HelpUnidVenta: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'unidadMedida'
    OidRespuesta = mtArticulooid_UnidVenta
    CodigoRespuesta = mtArticuloCodUnidVenta
    Left = 168
    Top = 400
  end
  object HelpUnidProd: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'unidadMedida'
    OidRespuesta = mtArticulooid_UnidProd
    CodigoRespuesta = mtArticuloCodUnidProd
    Left = 208
    Top = 400
  end
  object HelpUnidCompra: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'unidadMedida'
    OidRespuesta = mtArticulooid_UnidCompra
    CodigoRespuesta = mtArticuloCodUnidCompra
    Left = 248
    Top = 400
  end
  object ValUnidVenta: TjktValidador
    Entidad = 'unidadMedida'
    Validacion = tExistente
    ListaAsignaciones = <
      item
        SourceName = 'oid'
        FieldTarget = mtArticulooid_UnidVenta
      end
      item
        SourceName = 'Descripcion'
        FieldTarget = mtArticuloDescUnidVenta
      end>
    Left = 168
    Top = 456
  end
  object ValUnidProd: TjktValidador
    Entidad = 'unidadMedida'
    Validacion = tExistente
    ListaAsignaciones = <
      item
        SourceName = 'oid'
        FieldTarget = mtArticulooid_UnidProd
      end
      item
        SourceName = 'Descripcion'
        FieldTarget = mtArticuloDescUnidProd
      end>
    Left = 208
    Top = 456
  end
  object ValUnidCompra: TjktValidador
    Entidad = 'unidadMedida'
    Validacion = tExistente
    ListaAsignaciones = <
      item
        SourceName = 'oid'
        FieldTarget = mtArticulooid_UnidCompra
      end
      item
        SourceName = 'Descripcion'
        FieldTarget = mtArticuloDescUnidCompra
      end>
    Left = 248
    Top = 456
  end
  object jktHelpGenerico1: TjktHelpGenerico
    Left = 368
    Top = 400
  end
  object jktHelpGenerico2: TjktHelpGenerico
    Left = 408
    Top = 400
  end
  object dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList
    Left = 160
    Top = 24
    object dxLayoutSkinLookAndFeel1: TdxLayoutSkinLookAndFeel
    end
  end
end
