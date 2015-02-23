inherited FNVen0005: TFNVen0005
  Anchors = []
  Caption = 'Cotizador'
  ClientHeight = 552
  ClientWidth = 1234
  ExplicitLeft = -312
  ExplicitWidth = 1250
  ExplicitHeight = 590
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBoxLeft: TcxGroupBox
    ExplicitHeight = 552
    Height = 552
  end
  inherited cxSplitterLeft: TcxSplitter
    Height = 552
    ExplicitHeight = 552
  end
  inherited cxGroupBoxRight: TcxGroupBox
    Left = 1204
    ExplicitLeft = 1181
    ExplicitHeight = 552
    Height = 552
  end
  inherited cxSplitterRight: TcxSplitter
    Left = 1200
    Height = 552
    ExplicitLeft = 1177
    ExplicitHeight = 552
  end
  inherited cxGroupBoxMain: TcxGroupBox
    ExplicitWidth = 1143
    ExplicitHeight = 552
    Height = 552
    Width = 1166
    object lcMain: TdxLayoutControl
      Left = 2
      Top = 2
      Width = 1162
      Height = 548
      Align = alClient
      TabOrder = 0
      LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
      ExplicitWidth = 1139
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 126
        Top = 72
        DataBinding.DataField = 'nro_cotiz'
        DataBinding.DataSource = dsItem
        Properties.ReadOnly = True
        Style.HotTrack = False
        TabOrder = 0
        Width = 93
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 266
        Top = 72
        DataBinding.DataField = 'fecha'
        DataBinding.DataSource = dsItem
        Properties.ReadOnly = True
        Style.HotTrack = False
        TabOrder = 1
        Width = 100
      end
      object cxDBTextEdit3: TcxDBTextEdit
        Left = 126
        Top = 99
        DataBinding.DataField = 'des_clie_sucu'
        DataBinding.DataSource = dsItem
        Properties.ReadOnly = True
        Style.HotTrack = False
        TabOrder = 2
        Width = 240
      end
      object cxDBTextEdit4: TcxDBTextEdit
        Left = 126
        Top = 126
        DataBinding.DataField = 'des_vend'
        DataBinding.DataSource = dsItem
        Properties.ReadOnly = True
        Style.HotTrack = False
        TabOrder = 3
        Width = 240
      end
      object cxDBTextEdit6: TcxDBTextEdit
        Left = 452
        Top = 166
        DataBinding.DataField = 'cod_art'
        DataBinding.DataSource = dsItem
        Properties.ReadOnly = True
        Style.HotTrack = False
        TabOrder = 6
        Width = 93
      end
      object cxDBTextEdit7: TcxDBTextEdit
        Left = 551
        Top = 166
        DataBinding.DataField = 'des_abrev_art'
        DataBinding.DataSource = dsItem
        Properties.ReadOnly = True
        Style.HotTrack = False
        TabOrder = 7
        Width = 192
      end
      object cxDBLabel1: TcxDBLabel
        Left = 452
        Top = 72
        DataBinding.DataField = 'des_tipo_item'
        DataBinding.DataSource = dsItem
        Properties.Alignment.Vert = taVCenter
        Style.HotTrack = False
        Transparent = True
        Height = 17
        Width = 307
        AnchorY = 81
      end
      object cxDBMemo1: TcxDBMemo
        Left = 452
        Top = 95
        DataBinding.DataField = 'detalle_item'
        DataBinding.DataSource = dsItem
        Properties.ReadOnly = True
        Properties.ScrollBars = ssVertical
        Style.HotTrack = False
        TabOrder = 5
        Height = 65
        Width = 307
      end
      object cxDBButtonEdit1: TcxDBButtonEdit
        Left = 896
        Top = 72
        DataBinding.DataField = 'cod_mod'
        DataBinding.DataSource = dsCabCotiz
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = cxDBButtonEdit1PropertiesButtonClick
        Style.HotTrack = False
        TabOrder = 8
        Width = 95
      end
      object cxDBTextEdit5: TcxDBTextEdit
        Left = 997
        Top = 72
        DataBinding.DataField = 'des_mod'
        DataBinding.DataSource = dsCabCotiz
        Enabled = False
        Style.HotTrack = False
        TabOrder = 9
        Width = 226
      end
      object cxDBLookupComboBox1: TcxDBLookupComboBox
        Left = 896
        Top = 99
        DataBinding.DataField = 'oid_moneda_expresada'
        DataBinding.DataSource = dsCabCotiz
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
            Width = 130
            FieldName = 'descripcion'
          end>
        Properties.ListSource = dsMonedas
        Properties.OnChange = cxDBLookupComboBox1PropertiesChange
        Style.HotTrack = False
        TabOrder = 10
        Width = 95
      end
      object cxDBTreeList1: TcxDBTreeList
        Left = 20
        Top = 260
        Width = 951
        Height = 248
        BorderStyle = cxcbsNone
        Align = alClient
        Bands = <
          item
          end>
        DataController.DataSource = dsDetCotiz
        DataController.ParentField = 'codInternoPadre'
        DataController.KeyField = 'codInterno'
        Navigator.Buttons.CustomButtons = <>
        OptionsBehavior.GoToNextCellOnTab = True
        OptionsCustomizing.BandCustomizing = False
        OptionsCustomizing.BandHorzSizing = False
        OptionsCustomizing.BandMoving = False
        OptionsCustomizing.BandVertSizing = False
        OptionsData.Deleting = False
        OptionsView.Footer = True
        RootValue = 0
        Styles.OnGetContentStyle = cxDBTreeList1StylesGetContentStyle
        TabOrder = 12
        OnEditing = cxDBTreeList1Editing
        object cxDBTreeList1oid_det: TcxDBTreeListColumn
          Visible = False
          DataBinding.FieldName = 'oid_det'
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxDBTreeList1oid_cotiz: TcxDBTreeListColumn
          Visible = False
          DataBinding.FieldName = 'oid_cotiz'
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxDBTreeList1oid_mod: TcxDBTreeListColumn
          Visible = False
          DataBinding.FieldName = 'oid_mod'
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
        object cxDBTreeList1cod_titu_conc: TcxDBTreeListColumn
          Visible = False
          DataBinding.FieldName = 'cod_titu_conc'
          Options.Editing = False
          Position.ColIndex = 6
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxDBTreeList1des_titu_conc: TcxDBTreeListColumn
          Caption.Text = 'T'#237'tulo / Concepto'
          DataBinding.FieldName = 'des_titu_conc'
          Options.Editing = False
          Width = 150
          Position.ColIndex = 0
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
        object cxDBTreeList1oid_conc: TcxDBTreeListColumn
          Visible = False
          DataBinding.FieldName = 'oid_conc'
          Position.ColIndex = 8
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxDBTreeList1oid_art: TcxDBTreeListColumn
          Visible = False
          DataBinding.FieldName = 'oid_art'
          Position.ColIndex = 9
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxDBTreeList1des_art: TcxDBTreeListColumn
          Caption.Text = 'Art'#237'culo'
          DataBinding.FieldName = 'des_art'
          Options.Editing = False
          Width = 100
          Position.ColIndex = 10
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxDBTreeList1cant: TcxDBTreeListColumn
          Caption.AlignHorz = taRightJustify
          Caption.Text = 'Cantidad'
          DataBinding.FieldName = 'cant'
          Width = 70
          Position.ColIndex = 11
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxDBTreeList1oid_unid_med: TcxDBTreeListColumn
          Visible = False
          DataBinding.FieldName = 'oid_unid_med'
          Position.ColIndex = 12
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxDBTreeList1cod_unid_med: TcxDBTreeListColumn
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.OnButtonClick = cxDBTreeList1cod_unid_medPropertiesButtonClick
          Caption.Text = 'Unid. Med.'
          DataBinding.FieldName = 'cod_unid_med'
          Width = 62
          Position.ColIndex = 13
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxDBTreeList1importe_unit: TcxDBTreeListColumn
          Caption.AlignHorz = taRightJustify
          Caption.Text = 'Costo Unitario'
          DataBinding.FieldName = 'importe_unit'
          Width = 85
          Position.ColIndex = 14
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxDBTreeList1oid_moneda: TcxDBTreeListColumn
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
              Width = 130
              FieldName = 'descripcion'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsMonedas
          Caption.Text = 'Moneda'
          DataBinding.FieldName = 'oid_moneda'
          Width = 55
          Position.ColIndex = 15
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxDBTreeList1fecha_costo: TcxDBTreeListColumn
          Caption.Text = 'Fecha Costo'
          DataBinding.FieldName = 'fecha_costo'
          Options.Editing = False
          Width = 70
          Position.ColIndex = 16
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxDBTreeList1importe_total: TcxDBTreeListColumn
          Caption.AlignHorz = taRightJustify
          Caption.Text = 'Costo'
          DataBinding.FieldName = 'importe_total'
          Options.Editing = False
          Width = 70
          Position.ColIndex = 17
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
          OnGetDisplayText = cxDBTreeList1importe_totalGetDisplayText
        end
        object cxDBTreeList1markup: TcxDBTreeListColumn
          Caption.AlignHorz = taRightJustify
          Caption.Text = 'Markup (%)'
          DataBinding.FieldName = 'markup'
          Width = 70
          Position.ColIndex = 18
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxDBTreeList1importe_total_2: TcxDBTreeListColumn
          Caption.AlignHorz = taRightJustify
          Caption.Text = 'Costo en '
          DataBinding.FieldName = 'importe_total_2'
          Options.Editing = False
          Width = 95
          Position.ColIndex = 19
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <
            item
              AlignHorz = taRightJustify
              AlignVert = vaTop
              Kind = skSum
              OnGetText = cxDBTreeList1importe_total_2TcxTreeListColumnSummaryFooterSummaryItems0GetText
              AlignHorzAssigned = True
            end>
          Summary.GroupFooterSummaryItems = <>
          OnGetDisplayText = cxDBTreeList1importe_total_2GetDisplayText
        end
        object cxDBTreeList1importe_total_3: TcxDBTreeListColumn
          Caption.AlignHorz = taRightJustify
          Caption.Text = 'Importe de Venta'
          DataBinding.FieldName = 'importe_total_3'
          Width = 95
          Position.ColIndex = 20
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <
            item
              AlignHorz = taRightJustify
              AlignVert = vaTop
              Kind = skSum
              AlignHorzAssigned = True
              AlignVertAssigned = True
            end>
          Summary.GroupFooterSummaryItems = <>
          OnGetDisplayText = cxDBTreeList1importe_total_3GetDisplayText
        end
      end
      object cxCheckBox1: TcxCheckBox
        Left = 987
        Top = 260
        Caption = 'AUTORIZAR'
        Style.HotTrack = False
        TabOrder = 13
        Transparent = True
        OnClick = cxCheckBox1Click
        Width = 121
      end
      object cxCheckBox2: TcxCheckBox
        Left = 987
        Top = 285
        Caption = 'RECHAZAR'
        Style.HotTrack = False
        TabOrder = 14
        Transparent = True
        OnClick = cxCheckBox2Click
        Width = 121
      end
      object cxButton1: TcxButton
        Left = 785
        Top = 126
        Width = 150
        Height = 25
        Caption = 'Tipos de cambio...'
        TabOrder = 11
        OnClick = cxButton1Click
      end
      object lcMainGroup_Root: TdxLayoutGroup
        AlignHorz = ahParentManaged
        AlignVert = avParentManaged
        ButtonOptions.Buttons = <>
        Hidden = True
        ShowBorder = False
        Index = -1
      end
      object lcMainGroup1: TdxLayoutGroup
        CaptionOptions.Text = 'Detalles del '#237'tem a cotizar'
        Parent = lcMainGroup7
        ButtonOptions.Buttons = <>
        ItemIndex = 1
        LayoutDirection = ldHorizontal
        Index = 0
      end
      object lcMainGroup2: TdxLayoutGroup
        AlignHorz = ahClient
        CaptionOptions.Text = 'Configuraci'#243'n Cotizador'
        Parent = lcMainGroup7
        ButtonOptions.Buttons = <>
        ItemControlAreaAlignment = catOwn
        Index = 1
      end
      object lcMainGroup3: TdxLayoutGroup
        AlignVert = avClient
        CaptionOptions.Text = 'Cotizador'
        Parent = lcMainGroup_Root
        ButtonOptions.Buttons = <>
        ButtonOptions.ShowExpandButton = True
        LayoutDirection = ldHorizontal
        Index = 2
      end
      object lcMainItem1: TdxLayoutItem
        CaptionOptions.AlignHorz = taRightJustify
        CaptionOptions.Text = 'Nro. Presupuesto :'
        Parent = lcMainGroup5
        Control = cxDBTextEdit1
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainItem2: TdxLayoutItem
        CaptionOptions.Text = 'Fecha :'
        Parent = lcMainGroup5
        Control = cxDBTextEdit2
        ControlOptions.AutoControlAreaAlignment = False
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object lcMainItem3: TdxLayoutItem
        AlignHorz = ahLeft
        CaptionOptions.AlignHorz = taRightJustify
        CaptionOptions.Text = 'Cliente / Sucursal :'
        Parent = lcMainGroup9
        Control = cxDBTextEdit3
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object lcMainItem4: TdxLayoutItem
        AlignHorz = ahLeft
        CaptionOptions.AlignHorz = taRightJustify
        CaptionOptions.Text = 'Vendedor :'
        Parent = lcMainGroup9
        Control = cxDBTextEdit4
        ControlOptions.ShowBorder = False
        Index = 2
      end
      object lcMainItem7: TdxLayoutItem
        CaptionOptions.AlignHorz = taRightJustify
        CaptionOptions.Text = 'Art'#237'culo :'
        Parent = lcMainGroup4
        Control = cxDBTextEdit6
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainItem8: TdxLayoutItem
        CaptionOptions.Visible = False
        Parent = lcMainGroup4
        Control = cxDBTextEdit7
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object lcMainGroup4: TdxLayoutGroup
        CaptionOptions.Text = 'Hidden Group'
        Parent = lcMainGroup8
        Visible = False
        ButtonOptions.Buttons = <>
        Hidden = True
        LayoutDirection = ldHorizontal
        ShowBorder = False
        Index = 2
      end
      object lcMainItem5: TdxLayoutItem
        CaptionOptions.AlignHorz = taRightJustify
        CaptionOptions.Text = 'Tipo :'
        Parent = lcMainGroup8
        Control = cxDBLabel1
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainGroup5: TdxLayoutGroup
        AlignHorz = ahLeft
        CaptionOptions.Text = 'Hidden Group'
        Parent = lcMainGroup9
        ButtonOptions.Buttons = <>
        Hidden = True
        LayoutDirection = ldHorizontal
        ShowBorder = False
        Index = 0
      end
      object lcMainItem6: TdxLayoutItem
        CaptionOptions.AlignHorz = taRightJustify
        CaptionOptions.AlignVert = tavTop
        CaptionOptions.Text = 'Item a Cotizar :'
        Parent = lcMainGroup8
        Control = cxDBMemo1
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object lcMainItem9: TdxLayoutItem
        CaptionOptions.Text = 'Modelo a utilizar :'
        Parent = lcMainGroup6
        Control = cxDBButtonEdit1
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainItem10: TdxLayoutItem
        CaptionOptions.Visible = False
        Parent = lcMainGroup6
        Control = cxDBTextEdit5
        ControlOptions.ShowBorder = False
        Enabled = False
        Index = 1
      end
      object lcMainItem11: TdxLayoutItem
        CaptionOptions.Text = 'Expresar en moneda :'
        Parent = lcMainGroup2
        Control = cxDBLookupComboBox1
        ControlOptions.AlignHorz = ahLeft
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object lcMainGroup6: TdxLayoutGroup
        CaptionOptions.Text = 'Hidden Group'
        Parent = lcMainGroup2
        ButtonOptions.Buttons = <>
        Hidden = True
        LayoutDirection = ldHorizontal
        ShowBorder = False
        Index = 0
      end
      object lcMainItem13: TdxLayoutItem
        AlignVert = avClient
        CaptionOptions.Visible = False
        Parent = lcMainGroup3
        Control = cxDBTreeList1
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainGroup7: TdxLayoutGroup
        CaptionOptions.Text = 'Hidden Group'
        CaptionOptions.Visible = False
        Parent = lcMainGroup_Root
        ButtonOptions.Buttons = <>
        ButtonOptions.ShowExpandButton = True
        LayoutDirection = ldHorizontal
        Index = 0
      end
      object lcMainGroup8: TdxLayoutGroup
        CaptionOptions.Text = 'New Group'
        Parent = lcMainGroup1
        ButtonOptions.Buttons = <>
        Hidden = True
        ShowBorder = False
        Index = 1
      end
      object lcMainGroup9: TdxLayoutGroup
        CaptionOptions.Text = 'New Group'
        Parent = lcMainGroup1
        ButtonOptions.Buttons = <>
        Hidden = True
        ShowBorder = False
        Index = 0
      end
      object lcMainSplitterItem1: TdxLayoutSplitterItem
        CaptionOptions.Text = 'Splitter'
        Parent = lcMainGroup_Root
        SizeOptions.AssignedValues = [sovSizableHorz, sovSizableVert]
        SizeOptions.SizableHorz = False
        SizeOptions.SizableVert = False
        Index = 1
      end
      object lcMainItem14: TdxLayoutItem
        CaptionOptions.Text = 'cxCheckBox1'
        CaptionOptions.Visible = False
        Parent = lcMainGroup10
        Control = cxCheckBox1
        ControlOptions.AlignHorz = ahLeft
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcMainItem15: TdxLayoutItem
        CaptionOptions.Text = 'cxCheckBox2'
        CaptionOptions.Visible = False
        Parent = lcMainGroup10
        Visible = False
        Control = cxCheckBox2
        ControlOptions.AlignHorz = ahLeft
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object lcMainGroup10: TdxLayoutGroup
        CaptionOptions.Text = 'Hidden Group'
        Parent = lcMainGroup3
        ButtonOptions.Buttons = <>
        Hidden = True
        ShowBorder = False
        Index = 2
      end
      object lcMainItem16: TdxLayoutItem
        CaptionOptions.Text = 'New Item'
        CaptionOptions.Visible = False
        Parent = lcMainGroup2
        Control = cxButton1
        ControlOptions.AlignHorz = ahLeft
        ControlOptions.ShowBorder = False
        Index = 2
      end
      object lcMainSplitterItem2: TdxLayoutSplitterItem
        CaptionOptions.Text = 'Splitter'
        Parent = lcMainGroup3
        SizeOptions.AssignedValues = [sovSizableHorz, sovSizableVert]
        SizeOptions.SizableHorz = False
        SizeOptions.SizableVert = False
        Index = 1
      end
    end
  end
  inherited BarManager: TdxBarManager
    Left = 328
    Top = 88
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited Driver: TjktDriver
    DataSetCab = mtCabCotiz
    Opciones = []
    TipoPrograma = tp_abmIndividual
    Filtro = Help
    FiltrarAlInicio = False
    OperacionesIniciales = <
      item
        Operacion = opTraerEntidades
      end
      item
        Operacion = opTraerParametro
      end>
    Left = 496
  end
  inherited IdHTTP: TIdHTTP
    Left = 416
  end
  inherited Service: TjktServiceCaller
    Left = 376
  end
  inherited OperacionSave: TjktOperacion
    OperName = 'ConfigurarCotizador'
    Atributos = <
      item
        Dataset = mtTiposDeCambio
        Tag = 0
      end
      item
        Dataset = mtItem
        Tag = 0
      end
      item
        Dataset = mtDetCotiz
        Tag = 0
      end>
    OnBeforeEjecutar = OperacionSaveBeforeEjecutar
    OnAfterEjecutar = OperacionSaveAfterEjecutar
    Left = 552
  end
  inherited mtParametroInicial: TjktMemTable
    Left = 656
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
    Atributos = <
      item
        Attribute = 'oid'
        Field = mtItemoid_item
        Tag = 0
      end>
    OnBeforeEjecutar = OperacionTraerBeforeEjecutar
    OnAfterEjecutar = OperacionTraerAfterEjecutar
    Left = 552
    Top = 88
  end
  inherited ValidadorForm: TjktValidadorForm
    Left = 424
    Top = 88
  end
  inherited mtParametrosForm: TjktMemTable
    Left = 696
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
  object dxLayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 288
    Top = 88
    object dxLayoutSkinLookAndFeel1: TdxLayoutSkinLookAndFeel
    end
  end
  object mtItem: TjktMemTable
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
    Left = 424
    Top = 160
    object mtItemoid_item: TIntegerField
      FieldName = 'oid_item'
    end
    object mtItemnro_cotiz: TStringField
      FieldName = 'nro_cotiz'
      Size = 30
    end
    object mtItemfecha: TDateTimeField
      FieldName = 'fecha'
    end
    object mtItemdes_clie_sucu: TStringField
      FieldName = 'des_clie_sucu'
      Size = 150
    end
    object mtItemdes_vend: TStringField
      FieldName = 'des_vend'
      Size = 40
    end
    object mtItemcod_estado: TStringField
      FieldName = 'cod_estado'
      Size = 15
    end
    object mtItemdes_tipo_item: TStringField
      FieldName = 'des_tipo_item'
      Size = 30
    end
    object mtItemdetalle_item: TMemoField
      FieldName = 'detalle_item'
      BlobType = ftMemo
    end
    object mtItemcod_art: TStringField
      FieldName = 'cod_art'
      Size = 50
    end
    object mtItemdes_abrev_art: TStringField
      FieldName = 'des_abrev_art'
      Size = 40
    end
  end
  object dsItem: TDataSource
    DataSet = mtItem
    Left = 464
    Top = 160
  end
  object Help: TjktHelpGenerico
    ServiceCaller = Service
    FormClassName = 'TFNHlp0001'
    TipoFiltro = fi_Customizado
    OidRespuesta = mtItemoid_item
    CodigoRespuesta = mtItemcod_estado
    Left = 496
    Top = 88
  end
  object mtTiposDeCambio: TjktMemTable
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
    Left = 424
    Top = 216
    object mtTiposDeCambiooid_moneda: TIntegerField
      FieldName = 'oid_moneda'
    end
    object mtTiposDeCambiocod_moneda: TStringField
      FieldName = 'cod_moneda'
      Size = 15
    end
    object mtTiposDeCambiodes_moneda: TStringField
      FieldName = 'des_moneda'
      Size = 100
    end
    object mtTiposDeCambiocotizacion: TFloatField
      FieldName = 'cotizacion'
      DisplayFormat = '0.00'
    end
  end
  object dsTiposDeCambio: TDataSource
    DataSet = mtTiposDeCambio
    Left = 464
    Top = 216
  end
  object opTraerTiposDeCambio: TjktOperacion
    OperName = 'TraerUltimosTiposDeCambio'
    EnviarTodo = False
    Atributos = <>
    ServiceCaller = Service
    Left = 384
    Top = 216
  end
  object mtDetCotiz: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_det'
        DataType = ftInteger
      end
      item
        Name = 'oid_cotiz'
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
        Name = 'oid_titu_conc'
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
        Name = 'tipo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'oid_conc'
        DataType = ftInteger
      end
      item
        Name = 'oid_art'
        DataType = ftInteger
      end
      item
        Name = 'des_art'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'cant'
        DataType = ftInteger
      end
      item
        Name = 'oid_unid_med'
        DataType = ftInteger
      end
      item
        Name = 'cod_unid_med'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'importe_unit'
        DataType = ftFloat
      end
      item
        Name = 'oid_moneda'
        DataType = ftInteger
      end>
    IndexFieldNames = 'oid_cotiz'
    IndexDefs = <
      item
        Name = 'mtDetCotizIndex'
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
    MasterSource = dsCabCotiz
    Version = '7.12.10 CodeGear Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    OnCalcFields = mtDetCotizCalcFields
    Left = 424
    Top = 344
    object mtDetCotizoid_det: TIntegerField
      Tag = 1
      FieldName = 'oid_det'
    end
    object mtDetCotizoid_cotiz: TIntegerField
      Tag = 1
      FieldName = 'oid_cotiz'
    end
    object mtDetCotizcodInterno: TIntegerField
      FieldName = 'codInterno'
    end
    object mtDetCotizcodInternoPadre: TIntegerField
      FieldName = 'codInternoPadre'
    end
    object mtDetCotizoid_titu_conc: TIntegerField
      Tag = 1
      FieldName = 'oid_titu_conc'
    end
    object mtDetCotizcod_titu_conc: TStringField
      FieldName = 'cod_titu_conc'
      Size = 15
    end
    object mtDetCotizdes_titu_conc: TStringField
      FieldName = 'des_titu_conc'
      Size = 100
    end
    object mtDetCotiztipo: TStringField
      FieldName = 'tipo'
      Size = 1
    end
    object mtDetCotizoid_conc: TIntegerField
      Tag = 1
      FieldName = 'oid_conc'
    end
    object mtDetCotizoid_art: TIntegerField
      Tag = 1
      FieldName = 'oid_art'
    end
    object mtDetCotizdes_art: TStringField
      FieldName = 'des_art'
      Size = 40
    end
    object mtDetCotizcant: TIntegerField
      Tag = 1
      FieldName = 'cant'
    end
    object mtDetCotizoid_unid_med: TIntegerField
      Tag = 1
      FieldName = 'oid_unid_med'
    end
    object mtDetCotizcod_unid_med: TStringField
      FieldName = 'cod_unid_med'
      Size = 10
    end
    object mtDetCotizimporte_unit: TFloatField
      Tag = 1
      FieldName = 'importe_unit'
      DisplayFormat = '0.00'
    end
    object mtDetCotizoid_moneda: TIntegerField
      Tag = 1
      FieldName = 'oid_moneda'
    end
    object mtDetCotizimporte_total: TFloatField
      FieldKind = fkCalculated
      FieldName = 'importe_total'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object mtDetCotizimporte_total_2: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'importe_total_2'
      DisplayFormat = '0.00'
    end
    object mtDetCotizimporte_total_3: TFloatField
      Tag = 1
      FieldKind = fkInternalCalc
      FieldName = 'importe_total_3'
      DisplayFormat = '0.00'
    end
    object mtDetCotizfecha_costo: TDateField
      FieldName = 'fecha_costo'
    end
    object mtDetCotizmarkup: TIntegerField
      Tag = 1
      FieldName = 'markup'
    end
  end
  object hlpModelo: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'modeloCotizador'
    TipoFiltro = fi_Activos
    OidRespuesta = mtCabCotizoid_mod
    CodigoRespuesta = mtCabCotizcod_mod
    Left = 384
    Top = 288
  end
  object mtCabCotiz: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_cotiz'
        DataType = ftInteger
      end
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
    Left = 424
    Top = 288
    object mtCabCotizoid_cotiz: TIntegerField
      Tag = 1
      FieldName = 'oid_cotiz'
    end
    object mtCabCotizoid_item: TIntegerField
      Tag = 1
      FieldName = 'oid_item'
    end
    object mtCabCotizoid_mod: TIntegerField
      Tag = 1
      FieldName = 'oid_mod'
    end
    object mtCabCotizcod_mod: TStringField
      FieldName = 'cod_mod'
      Size = 15
    end
    object mtCabCotizdes_mod: TStringField
      FieldName = 'des_mod'
      Size = 100
    end
    object mtCabCotizoid_moneda_expresada: TIntegerField
      Tag = 1
      FieldName = 'oid_moneda_expresada'
    end
    object mtCabCotizcod_estado: TStringField
      Tag = 1
      FieldName = 'cod_estado'
      Size = 15
    end
  end
  object opTraerModeloParaCotizar: TjktOperacion
    OperName = 'TraerModeloParaCotizar'
    EnviarTodo = False
    Atributos = <
      item
        Attribute = 'oid'
        Field = mtCabCotizoid_mod
        Tag = 0
      end>
    ServiceCaller = Service
    Left = 384
    Top = 344
  end
  object dsCabCotiz: TDataSource
    DataSet = mtCabCotiz
    Left = 464
    Top = 288
  end
  object dsDetCotiz: TDataSource
    DataSet = mtDetCotiz
    Left = 464
    Top = 344
  end
  object hlpUnidMed: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'unidadMedida'
    TipoFiltro = fi_Activos
    OidRespuesta = mtDetCotizoid_unid_med
    CodigoRespuesta = mtDetCotizcod_unid_med
    Left = 504
    Top = 344
  end
  object cxStyleRepository: TcxStyleRepository
    Left = 288
    Top = 136
    PixelsPerInch = 96
    object cxStyleDisabled: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clInactiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clGrayText
    end
    object cxStyleNormal: TcxStyle
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
    OnBeforeEjecutar = opTraerEntidadesBeforeEjecutar
    Left = 576
    Top = 216
  end
  object dsMonedas: TDataSource
    DataSet = mtMonedas
    Left = 656
    Top = 216
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
    Left = 616
    Top = 216
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
    Left = 656
    Top = 88
  end
end
