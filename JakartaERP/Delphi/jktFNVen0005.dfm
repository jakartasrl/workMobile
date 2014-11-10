inherited FNVen0005: TFNVen0005
  Caption = 'Cotizador'
  ClientHeight = 477
  ClientWidth = 782
  ExplicitWidth = 798
  ExplicitHeight = 515
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBoxLeft: TcxGroupBox
    ExplicitHeight = 477
    Height = 477
  end
  inherited cxSplitterLeft: TcxSplitter
    Height = 477
    ExplicitHeight = 477
  end
  inherited cxGroupBoxRight: TcxGroupBox
    Left = 752
    ExplicitLeft = 752
    ExplicitHeight = 477
    Height = 477
  end
  inherited cxSplitterRight: TcxSplitter
    Left = 748
    Height = 477
    ExplicitLeft = 748
    ExplicitHeight = 477
  end
  inherited cxGroupBoxMain: TcxGroupBox
    ExplicitWidth = 714
    ExplicitHeight = 477
    Height = 477
    Width = 714
    object lcMain: TdxLayoutControl
      Left = 2
      Top = 2
      Width = 710
      Height = 473
      Align = alClient
      TabOrder = 0
      LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 116
        Top = 41
        DataBinding.DataField = 'nro_cotiz'
        DataBinding.DataSource = dsItem
        Properties.ReadOnly = True
        Style.HotTrack = False
        TabOrder = 0
        Width = 93
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 256
        Top = 41
        DataBinding.DataField = 'fecha'
        DataBinding.DataSource = dsItem
        Properties.ReadOnly = True
        Style.HotTrack = False
        TabOrder = 1
        Width = 100
      end
      object cxDBTextEdit3: TcxDBTextEdit
        Left = 116
        Top = 68
        DataBinding.DataField = 'des_clie_sucu'
        DataBinding.DataSource = dsItem
        Properties.ReadOnly = True
        Style.HotTrack = False
        TabOrder = 2
        Width = 307
      end
      object cxDBTextEdit4: TcxDBTextEdit
        Left = 116
        Top = 95
        DataBinding.DataField = 'des_vend'
        DataBinding.DataSource = dsItem
        Properties.ReadOnly = True
        Style.HotTrack = False
        TabOrder = 3
        Width = 307
      end
      object cxDBTextEdit6: TcxDBTextEdit
        Left = 116
        Top = 240
        DataBinding.DataField = 'cod_art'
        DataBinding.DataSource = dsItem
        Properties.ReadOnly = True
        Style.HotTrack = False
        TabOrder = 6
        Width = 77
      end
      object cxDBTextEdit7: TcxDBTextEdit
        Left = 199
        Top = 240
        DataBinding.DataField = 'des_abrev_art'
        DataBinding.DataSource = dsItem
        Properties.ReadOnly = True
        Style.HotTrack = False
        TabOrder = 7
        Width = 224
      end
      object cxDBLabel1: TcxDBLabel
        Left = 116
        Top = 122
        DataBinding.DataField = 'des_tipo_item'
        DataBinding.DataSource = dsItem
        Properties.Alignment.Vert = taVCenter
        Style.HotTrack = False
        Transparent = True
        Height = 17
        Width = 307
        AnchorY = 131
      end
      object cxDBMemo1: TcxDBMemo
        Left = 116
        Top = 145
        DataBinding.DataField = 'detalle_item'
        DataBinding.DataSource = dsItem
        Properties.ReadOnly = True
        Style.HotTrack = False
        TabOrder = 5
        Height = 89
        Width = 307
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
        CaptionOptions.Text = 'Detalles del '#237'tem a cotizar'
        Parent = lcMainGroup_Root
        ButtonOptions.Buttons = <>
        Index = 0
      end
      object lcMainGroup2: TdxLayoutGroup
        CaptionOptions.Text = 'New Group'
        Parent = lcMainGroup_Root
        ButtonOptions.Buttons = <>
        Index = 1
      end
      object lcMainGroup3: TdxLayoutGroup
        CaptionOptions.Text = 'New Group'
        Parent = lcMainGroup_Root
        ButtonOptions.Buttons = <>
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
        CaptionOptions.AlignHorz = taRightJustify
        CaptionOptions.Text = 'Cliente / Sucursal :'
        Parent = lcMainGroup1
        Control = cxDBTextEdit3
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object lcMainItem4: TdxLayoutItem
        CaptionOptions.AlignHorz = taRightJustify
        CaptionOptions.Text = 'Vendedor :'
        Parent = lcMainGroup1
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
        Parent = lcMainGroup1
        ButtonOptions.Buttons = <>
        Hidden = True
        LayoutDirection = ldHorizontal
        ShowBorder = False
        Index = 5
      end
      object lcMainItem5: TdxLayoutItem
        CaptionOptions.AlignHorz = taRightJustify
        CaptionOptions.Text = 'Tipo :'
        Parent = lcMainGroup1
        Control = cxDBLabel1
        ControlOptions.ShowBorder = False
        Index = 3
      end
      object lcMainGroup5: TdxLayoutGroup
        CaptionOptions.Text = 'Hidden Group'
        Parent = lcMainGroup1
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
        Parent = lcMainGroup1
        Control = cxDBMemo1
        ControlOptions.ShowBorder = False
        Index = 4
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
    Left = 496
  end
  inherited IdHTTP: TIdHTTP
    Left = 416
  end
  inherited Service: TjktServiceCaller
    Left = 376
  end
  inherited OperacionSave: TjktOperacion
    Left = 552
  end
  inherited mtParametroInicial: TjktMemTable
    Left = 656
  end
  inherited OperacionTraer: TjktOperacion
    OperName = 'TraerItem'
    Atributos = <
      item
        Attribute = 'oid'
        Tag = 0
      end>
    OnBeforeEjecutar = OperacionTraerBeforeEjecutar
    Left = 552
    Top = 88
  end
  inherited ValidadorForm: TjktValidadorForm
    Left = 424
    Top = 88
  end
  inherited mtParametrosForm: TjktMemTable
    Left = 696
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
    Left = 232
    Top = 152
    object mtItemoid_item: TIntegerField
      FieldName = 'oid_item'
    end
    object mtItemnro_cotiz: TIntegerField
      FieldName = 'nro_cotiz'
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
    Left = 272
    Top = 152
  end
end
