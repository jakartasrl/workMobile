inherited FNVen0006: TFNVen0006
  Caption = 'Ingreso de Presupuesto'
  ClientHeight = 478
  ClientWidth = 909
  ExplicitWidth = 925
  ExplicitHeight = 516
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBoxLeft: TcxGroupBox
    ExplicitHeight = 478
    Height = 478
  end
  inherited cxSplitterLeft: TcxSplitter
    Height = 478
    ExplicitHeight = 478
  end
  inherited cxGroupBoxRight: TcxGroupBox
    Left = 879
    ExplicitLeft = 734
    ExplicitHeight = 478
    Height = 478
  end
  inherited cxSplitterRight: TcxSplitter
    Left = 875
    Height = 478
    ExplicitLeft = 730
    ExplicitHeight = 478
  end
  inherited cxGroupBoxMain: TcxGroupBox
    ExplicitWidth = 696
    ExplicitHeight = 478
    Height = 478
    Width = 841
    object lcMain: TdxLayoutControl
      Left = 2
      Top = 2
      Width = 837
      Height = 474
      Align = alClient
      TabOrder = 0
      LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
      ExplicitWidth = 789
      ExplicitHeight = 588
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 120
        Top = 41
        DataBinding.DataField = 'nro_cotiz'
        Properties.ReadOnly = True
        Style.HotTrack = False
        TabOrder = 0
        Width = 90
      end
      object cxDBDateEdit1: TcxDBDateEdit
        Left = 257
        Top = 41
        DataBinding.DataField = 'fecha'
        Properties.ReadOnly = True
        Properties.ShowTime = False
        Properties.UseLeftAlignmentOnEditing = False
        Style.HotTrack = False
        TabOrder = 1
        Width = 92
      end
      object cxDBTextEdit6: TcxDBTextEdit
        Left = 467
        Top = 107
        DataBinding.DataField = 'razonSocial'
        Properties.ReadOnly = True
        Style.HotTrack = False
        TabOrder = 6
        Width = 283
      end
      object cxDBTextEdit7: TcxDBTextEdit
        Left = 177
        Top = 241
        DataBinding.DataField = 'des_vend'
        Properties.ReadOnly = True
        Style.HotTrack = False
        TabOrder = 9
        Width = 180
      end
      object cxDBTextEdit8: TcxDBTextEdit
        Left = 533
        Top = 241
        DataBinding.DataField = 'des_repre'
        Properties.ReadOnly = True
        Style.HotTrack = False
        TabOrder = 11
        Width = 180
      end
      object cxDBButtonEdit1: TcxDBButtonEdit
        Left = 120
        Top = 107
        DataBinding.DataField = 'cod_clie'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Style.HotTrack = False
        TabOrder = 4
        Width = 99
      end
      object cxDBButtonEdit2: TcxDBButtonEdit
        Left = 91
        Top = 241
        DataBinding.DataField = 'cod_vend'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
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
        object jktExpDBGrid5DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
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
            Width = 389
          end
        end
        object jktExpDBGrid5Level1: TcxGridLevel
          GridView = jktExpDBGrid5DBTableView1
        end
      end
      object cxDBButtonEdit3: TcxDBButtonEdit
        Left = 225
        Top = 107
        DataBinding.DataField = 'des_sucu'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Style.HotTrack = False
        TabOrder = 5
        Width = 141
      end
      object cxDBButtonEdit4: TcxDBButtonEdit
        Left = 447
        Top = 241
        DataBinding.DataField = 'cod_repre'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
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
          object cxGridLayoutItem1: TcxGridLayoutItem
            Parent = dxLayoutGroup3
            SizeOptions.Width = 152
            Index = 0
          end
          object DBLayoutViewLayoutItem4: TcxGridLayoutItem
            Parent = dxLayoutGroup3
            SizeOptions.Width = 7
            Index = 1
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
        end
        object cxGridItemsLevel1: TcxGridLevel
          GridView = DBLayoutView
        end
      end
      object cxDBDateEdit2: TcxDBDateEdit
        Left = 456
        Top = 41
        DataBinding.DataField = 'fecha_vencimiento'
        Style.HotTrack = False
        TabOrder = 2
        Width = 90
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 120
        Top = 68
        DataBinding.DataField = 'referencia'
        Style.HotTrack = False
        TabOrder = 3
        Width = 424
      end
      object cxDBLookupComboBox1: TcxDBLookupComboBox
        Left = 120
        Top = 134
        DataBinding.DataField = 'oid_cont_suc'
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
      object dxLayoutGroup5: TdxLayoutGroup
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
      object dxLayoutItem1: TdxLayoutItem
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
        Parent = dxLayoutGroup5
        ButtonOptions.Buttons = <>
        LayoutDirection = ldHorizontal
        ShowBorder = False
        Index = 0
      end
      object lcMainGroup9: TdxLayoutGroup
        CaptionOptions.Text = 'Datos del Cliente'
        Parent = dxLayoutGroup5
        ButtonOptions.Buttons = <>
        LayoutDirection = ldHorizontal
        ShowBorder = False
        Index = 3
      end
      object dxLayoutSeparatorItem2: TdxLayoutSeparatorItem
        CaptionOptions.Text = 'Separator'
        Parent = dxLayoutGroup5
        SizeOptions.AssignedValues = [sovSizableHorz, sovSizableVert]
        SizeOptions.SizableHorz = False
        SizeOptions.SizableVert = False
        Index = 2
      end
      object dxLayoutItem2: TdxLayoutItem
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
        Parent = dxLayoutGroup5
        Control = cxDBTextEdit1
        ControlOptions.AlignHorz = ahLeft
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object lcMainItem11: TdxLayoutItem
        CaptionOptions.Text = 'Contacto Refer.:'
        Parent = dxLayoutGroup5
        Control = cxDBLookupComboBox1
        ControlOptions.AlignHorz = ahLeft
        ControlOptions.ShowBorder = False
        Index = 4
      end
    end
  end
  inherited BarManager: TdxBarManager
    Left = 288
    Top = 56
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited Driver: TjktDriver
    Left = 544
    Top = 56
  end
  inherited IdHTTP: TIdHTTP
    Left = 440
    Top = 56
  end
  inherited Service: TjktServiceCaller
    Left = 384
    Top = 56
  end
  inherited OperacionSave: TjktOperacion
    Left = 608
    Top = 56
  end
  inherited mtParametroInicial: TjktMemTable
    Left = 704
    Top = 56
  end
  inherited OperacionTraer: TjktOperacion
    Left = 608
    Top = 120
  end
  inherited ValidadorForm: TjktValidadorForm
    Left = 440
    Top = 120
  end
  inherited mtParametrosForm: TjktMemTable
    Left = 744
    Top = 56
  end
  object dxLayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 232
    Top = 56
    object dxLayoutSkinLookAndFeel1: TdxLayoutSkinLookAndFeel
    end
  end
end
