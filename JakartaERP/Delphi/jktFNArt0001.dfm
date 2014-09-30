inherited FNArt0001: TFNArt0001
  Caption = 'ABM de Art'#237'culos'
  ClientHeight = 500
  ClientWidth = 752
  ExplicitWidth = 768
  ExplicitHeight = 538
  PixelsPerInch = 96
  TextHeight = 13
  object lcMain: TdxLayoutControl [0]
    Left = 0
    Top = 0
    Width = 752
    Height = 500
    Align = alClient
    TabOrder = 4
    ExplicitLeft = 80
    ExplicitTop = 64
    ExplicitWidth = 300
    ExplicitHeight = 250
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 70
      Top = 28
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 0
      Width = 121
    end
    object cxDBTextEdit2: TcxDBTextEdit
      Left = 281
      Top = 79
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 4
      Width = 435
    end
    object cxDBCheckBox1: TcxDBCheckBox
      Left = 64
      Top = 55
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 1
      Width = 40
    end
    object cxDBCheckBox2: TcxDBCheckBox
      Left = 64
      Top = 82
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 2
      Width = 40
    end
    object cxDBCheckBox3: TcxDBCheckBox
      Left = 112
      Top = 121
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 5
      Width = 40
    end
    object cxDBCheckBox4: TcxDBCheckBox
      Left = 112
      Top = 148
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 6
      Width = 40
    end
    object cxDBCheckBox5: TcxDBCheckBox
      Left = 226
      Top = 121
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 7
      Width = 40
    end
    object cxDBCheckBox6: TcxDBCheckBox
      Left = 226
      Top = 148
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 8
      Width = 40
    end
    object cxDBMemo1: TcxDBMemo
      Left = 281
      Top = 28
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 3
      Height = 45
      Width = 467
    end
    object jktExpDBGrid1: TjktExpDBGrid
      Left = 22
      Top = 232
      Width = 250
      Height = 200
      TabOrder = 10
      object jktExpDBGrid1DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
      end
      object jktExpDBGrid1Level1: TcxGridLevel
        GridView = jktExpDBGrid1DBTableView1
      end
    end
    object jktExpDBGrid2: TjktExpDBGrid
      Left = 22
      Top = 468
      Width = 250
      Height = 200
      TabOrder = 11
      object jktExpDBGrid2DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
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
      Left = 22
      Top = 916
      Width = 250
      Height = 200
      TabOrder = 24
      object jktExpDBGrid3DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
      end
      object jktExpDBGrid3Level1: TcxGridLevel
        GridView = jktExpDBGrid3DBTableView1
      end
    end
    object jktExpDBGrid4: TjktExpDBGrid
      Left = 22
      Top = 1152
      Width = 250
      Height = 200
      TabOrder = 25
      object jktExpDBGrid4DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
      end
      object jktExpDBGrid4Level1: TcxGridLevel
        GridView = jktExpDBGrid4DBTableView1
      end
    end
    object cxDBLookupComboBox1: TcxDBLookupComboBox
      Left = 108
      Top = 205
      DataBinding.DataField = 'oid_TipoArt'
      DataBinding.DataSource = dsArticulo
      Properties.DropDownAutoSize = True
      Properties.KeyFieldNames = 'oid_TipoArt'
      Properties.ListColumns = <
        item
          Caption = 'C'#243'digo'
          FieldName = 'CodTipoArt'
        end
        item
          Caption = 'Descripci'#243'n'
          FieldName = 'DescTipoArt'
        end>
      Properties.ListFieldIndex = 1
      Properties.ListSource = dsTiposDeProducto
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 9
      Width = 145
    end
    object cxDBButtonEdit1: TcxDBButtonEdit
      Left = 160
      Top = 704
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 12
      Width = 70
    end
    object cxDBButtonEdit2: TcxDBButtonEdit
      Left = 160
      Top = 731
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
      Width = 70
    end
    object cxDBButtonEdit3: TcxDBButtonEdit
      Left = 160
      Top = 758
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 16
      Width = 70
    end
    object cxDBButtonEdit4: TcxDBButtonEdit
      Left = 160
      Top = 801
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 18
      Width = 70
    end
    object cxDBButtonEdit5: TcxDBButtonEdit
      Left = 160
      Top = 828
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 20
      Width = 70
    end
    object cxDBButtonEdit6: TcxDBButtonEdit
      Left = 160
      Top = 855
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 22
      Width = 70
    end
    object cxDBTextEdit3: TcxDBTextEdit
      Left = 236
      Top = 704
      Enabled = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 13
      Width = 200
    end
    object cxDBTextEdit4: TcxDBTextEdit
      Left = 236
      Top = 731
      Enabled = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 15
      Width = 200
    end
    object cxDBTextEdit5: TcxDBTextEdit
      Left = 236
      Top = 758
      Enabled = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 17
      Width = 200
    end
    object cxDBTextEdit6: TcxDBTextEdit
      Left = 236
      Top = 801
      Enabled = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 19
      Width = 200
    end
    object cxDBTextEdit7: TcxDBTextEdit
      Left = 236
      Top = 828
      Enabled = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 21
      Width = 200
    end
    object cxDBTextEdit8: TcxDBTextEdit
      Left = 236
      Top = 855
      Enabled = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 23
      Width = 200
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
      ShowBorder = False
      Index = 0
    end
    object lcMainGroup5: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = lcMainGroup3
      ButtonOptions.Buttons = <>
      Hidden = True
      ItemControlAreaAlignment = catOwn
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
      Index = 0
    end
    object lcMainGroup12: TdxLayoutGroup
      CaptionOptions.Text = 'Unidades de Medida'
      Parent = lcMainGroup10
      ButtonOptions.Buttons = <>
      Index = 1
    end
    object lcMainGroup13: TdxLayoutGroup
      CaptionOptions.Text = 'Clasificadores'
      Parent = lcMainGroup10
      ButtonOptions.Buttons = <>
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
    Left = 552
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
    Left = 552
    Top = 80
  end
  inherited ValidadorForm: TjktValidadorForm
    Left = 184
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
    Left = 296
    Top = 160
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
    Left = 296
    Top = 208
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
    Left = 296
    Top = 256
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
    Left = 296
    Top = 304
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
    Left = 296
    Top = 352
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
    Left = 336
    Top = 160
  end
  object dsValoresCaracProd: TDataSource
    DataSet = mtValoresCaracProd
    Left = 336
    Top = 208
  end
  object dsAperturaStock: TDataSource
    DataSet = mtAperturaStock
    Left = 336
    Top = 256
  end
  object dsEquivalencias: TDataSource
    DataSet = mtEquivalencias
    Left = 336
    Top = 304
  end
  object dsClasifProd: TDataSource
    DataSet = mtClasifProd
    Left = 336
    Top = 352
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
    Left = 608
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
end
