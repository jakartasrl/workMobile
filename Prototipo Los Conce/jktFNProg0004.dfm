inherited FNProg0004: TFNProg0004
  Caption = 'Presupuestos'
  ClientHeight = 515
  ClientWidth = 747
  ExplicitWidth = 763
  ExplicitHeight = 553
  PixelsPerInch = 96
  TextHeight = 13
  object jktExpDBGrid1: TjktExpDBGrid [0]
    Left = 0
    Top = 121
    Width = 747
    Height = 394
    Align = alClient
    TabOrder = 4
    DataSource = dsPresupuesto
    ExplicitLeft = 24
    ExplicitTop = 88
    ExplicitWidth = 633
    ExplicitHeight = 313
    object jktExpDBGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsPresupuesto
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skSum
          FieldName = 'Total'
          Column = jktExpDBGrid1DBTableView1Importe
          DisplayText = 'Total'
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.FocusCellOnTab = True
      OptionsView.Footer = True
      OptionsView.FooterAutoHeight = True
      OptionsView.GroupFooters = gfVisibleWhenExpanded
      object jktExpDBGrid1DBTableView1DescGrupo: TcxGridDBColumn
        Caption = 'Grupo'
        DataBinding.FieldName = 'DescGrupo'
        Visible = False
        GroupIndex = 0
        Width = 120
      end
      object jktExpDBGrid1DBTableView1CodGrupo: TcxGridDBColumn
        DataBinding.FieldName = 'CodGrupo'
        Visible = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 56
      end
      object jktExpDBGrid1DBTableView1CodItem: TcxGridDBColumn
        DataBinding.FieldName = 'CodItem'
        Width = 54
      end
      object jktExpDBGrid1DBTableView1DescItem: TcxGridDBColumn
        Caption = 'Descripci'#243'n Item'
        DataBinding.FieldName = 'DescItem'
        Width = 166
      end
      object jktExpDBGrid1DBTableView1Cantidad: TcxGridDBColumn
        DataBinding.FieldName = 'Cantidad'
        Width = 52
      end
      object jktExpDBGrid1DBTableView1Unidad: TcxGridDBColumn
        DataBinding.FieldName = 'Unidad'
        Width = 48
      end
      object jktExpDBGrid1DBTableView1Precio: TcxGridDBColumn
        DataBinding.FieldName = 'Precio'
        Width = 58
      end
      object jktExpDBGrid1DBTableView1Moneda: TcxGridDBColumn
        DataBinding.FieldName = 'Moneda'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          '$'
          'U$S')
        Width = 52
      end
      object jktExpDBGrid1DBTableView1Fecha: TcxGridDBColumn
        DataBinding.FieldName = 'Fecha'
        Width = 82
      end
      object jktExpDBGrid1DBTableView1Importe: TcxGridDBColumn
        Caption = 'Importe'
        DataBinding.FieldName = 'Total'
      end
    end
    object jktExpDBGrid1Level1: TcxGridLevel
      GridView = jktExpDBGrid1DBTableView1
    end
  end
  object cxGroupBox1: TcxGroupBox [1]
    Left = 0
    Top = 0
    Align = alTop
    Caption = 'Identificaci'#243'n de Presupuesto'
    TabOrder = 5
    Height = 121
    Width = 747
    object cxLabel1: TcxLabel
      Left = 16
      Top = 26
      Caption = 'Nro. de Presupuesto :'
      Transparent = True
    end
    object cxButtonEdit1: TcxButtonEdit
      Left = 132
      Top = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      TabOrder = 1
      Width = 121
    end
    object cxMemo1: TcxMemo
      Left = 132
      Top = 51
      TabOrder = 2
      Height = 57
      Width = 533
    end
    object cxLabel2: TcxLabel
      Left = 61
      Top = 51
      Caption = 'Descripci'#243'n :'
      Transparent = True
    end
  end
  inherited BarManager: TdxBarManager
    Left = 280
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited Driver: TjktDriver
    Left = 608
  end
  inherited IdHTTP: TIdHTTP
    Left = 496
  end
  inherited Service: TjktServiceCaller
    Left = 448
  end
  inherited OperacionSave: TjktOperacion
    Atributos = <
      item
        Dataset = TPresupuesto
        Tag = 0
      end>
    Left = 672
  end
  object TPresupuesto: TjktMemTable
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
    AfterOpen = TPresupuestoAfterOpen
    OnCalcFields = TPresupuestoCalcFields
    Left = 272
    Top = 200
    object TPresupuestoCodGrupo: TIntegerField
      FieldName = 'CodGrupo'
    end
    object TPresupuestoDescGrupo: TStringField
      FieldName = 'DescGrupo'
    end
    object TPresupuestoCodItem: TIntegerField
      FieldName = 'CodItem'
    end
    object TPresupuestoDescItem: TStringField
      FieldName = 'DescItem'
      Size = 30
    end
    object TPresupuestoCantidad: TIntegerField
      FieldName = 'Cantidad'
    end
    object TPresupuestoUnidad: TStringField
      FieldName = 'Unidad'
      Size = 5
    end
    object TPresupuestoPrecio: TFloatField
      FieldName = 'Precio'
    end
    object TPresupuestoMoneda: TStringField
      FieldName = 'Moneda'
      Size = 5
    end
    object TPresupuestoFecha: TDateField
      FieldName = 'Fecha'
    end
    object TPresupuestoTotal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Total'
      Calculated = True
    end
  end
  object dsPresupuesto: TDataSource
    DataSet = TPresupuesto
    Left = 232
    Top = 200
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
    Left = 352
    Top = 200
  end
end
