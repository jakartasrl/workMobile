inherited FNVar0001: TFNVar0001
  Caption = 'ABM de Condiciones de Pago'
  ClientHeight = 306
  ClientWidth = 684
  ExplicitWidth = 700
  ExplicitHeight = 345
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBoxLeft: TcxGroupBox
    ExplicitLeft = 0
    ExplicitTop = 113
    ExplicitHeight = 193
    Height = 306
  end
  inherited cxSplitterLeft: TcxSplitter
    Height = 306
    Control = cxGroupBoxLeft
    ExplicitLeft = 185
    ExplicitTop = 113
    ExplicitHeight = 193
  end
  inherited cxGroupBoxRight: TcxGroupBox
    Left = 499
    TabOrder = 5
    ExplicitLeft = 499
    ExplicitTop = 113
    ExplicitHeight = 193
    Height = 306
  end
  inherited cxSplitterRight: TcxSplitter
    Left = 491
    Height = 306
    Control = cxGroupBoxRight
    ExplicitLeft = 491
    ExplicitTop = 113
    ExplicitHeight = 193
  end
  inherited cxGroupBoxMain: TcxGroupBox
    TabOrder = 7
    ExplicitLeft = 195
    ExplicitTop = 113
    ExplicitWidth = 298
    ExplicitHeight = 193
    Height = 306
    Width = 298
    object cxGroupBox1: TcxGroupBox
      Left = 2
      Top = 5
      Align = alTop
      Caption = 'Datos de la Condici'#243'n de Pago'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 684
      Height = 113
      Width = 294
      object dxBevel1: TdxBevel
        Left = 14
        Top = 63
        Width = 551
        Height = 14
        Shape = dxbsLineTop
      end
      object txtCodigo: TcxDBTextEdit
        Left = 61
        Top = 30
        DataBinding.DataField = 'Codigo'
        DataBinding.DataSource = dsCondicionDePago
        TabOrder = 0
        Width = 121
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 256
        Top = 30
        DataBinding.DataField = 'Descripcion'
        DataBinding.DataSource = dsCondicionDePago
        TabOrder = 1
        Width = 223
      end
      object cxLabel1: TcxLabel
        Left = 14
        Top = 32
        AutoSize = False
        Caption = 'C'#243'digo :'
        Properties.Alignment.Horz = taRightJustify
        Transparent = True
        Height = 17
        Width = 46
        AnchorX = 60
      end
      object cxLabel2: TcxLabel
        Left = 180
        Top = 32
        AutoSize = False
        Caption = 'Descripci'#243'n :'
        Properties.Alignment.Horz = taRightJustify
        Transparent = True
        Height = 17
        Width = 75
        AnchorX = 255
      end
      object cxDBCheckBox1: TcxDBCheckBox
        Left = 504
        Top = 30
        Caption = 'Activo :'
        DataBinding.DataField = 'Activo'
        DataBinding.DataSource = dsCondicionDePago
        Properties.Alignment = taRightJustify
        TabOrder = 2
        Transparent = True
        Width = 61
      end
      object cxDBCheckBox2: TcxDBCheckBox
        Left = 14
        Top = 73
        Caption = 'D'#237'as a partir de Fecha Factura'
        DataBinding.DataField = 'APartirFechaFactura'
        DataBinding.DataSource = dsCondicionDePago
        Properties.Alignment = taLeftJustify
        TabOrder = 3
        Transparent = True
        Width = 175
      end
      object cxDBCheckBox3: TcxDBCheckBox
        Left = 210
        Top = 73
        Caption = 'D'#237'as a partir de Fecha Recepci'#243'n'
        DataBinding.DataField = 'APartirFechaRecepcion'
        DataBinding.DataSource = dsCondicionDePago
        Properties.Alignment = taLeftJustify
        TabOrder = 4
        Transparent = True
        Width = 187
      end
    end
    object cxGroupBox2: TcxGroupBox
      Left = 2
      Top = 118
      Align = alClient
      Caption = 'Detalle'
      TabOrder = 1
      ExplicitLeft = 193
      ExplicitTop = 0
      ExplicitWidth = 298
      ExplicitHeight = 306
      Height = 186
      Width = 294
      object dbgDetalleCondicion: TjktExpDBGrid
        Left = 2
        Top = 18
        Width = 367
        Height = 166
        Align = alLeft
        TabOrder = 0
        DataSource = dsDetalleCondicionDePago
        ExplicitHeight = 286
        object dbgDetalleCondicionDBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsDetalleCondicionDePago
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsView.GroupByBox = False
          object dbgDetalleCondicionDBTableView1oid_Det_CondPago: TcxGridDBColumn
            DataBinding.FieldName = 'oid_Det_CondPago'
            Visible = False
          end
          object dbgDetalleCondicionDBTableView1oid_CondPago: TcxGridDBColumn
            DataBinding.FieldName = 'oid_CondPago'
            Visible = False
          end
          object dbgDetalleCondicionDBTableView1Dias: TcxGridDBColumn
            Caption = 'D'#237'as'
            DataBinding.FieldName = 'Dias'
            Width = 49
          end
          object dbgDetalleCondicionDBTableView1Porcentaje: TcxGridDBColumn
            DataBinding.FieldName = 'Porcentaje'
            Width = 69
          end
        end
        object dbgDetalleCondicionLevel1: TcxGridLevel
          GridView = dbgDetalleCondicionDBTableView1
        end
      end
    end
  end
  inherited BarManager: TdxBarManager
    Left = 72
    Top = 16
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited Driver: TjktDriver
    DataSetCab = mtCondicionDePago
    TipoPrograma = tp_abmIndividual
    Filtro = Help
    FocoEnAlta = mtCondicionDePagoCodigo
    FocoEnModificacion = mtCondicionDePagoDescripcion
    Left = 328
    Top = 16
  end
  inherited IdHTTP: TIdHTTP
    Left = 224
    Top = 16
  end
  inherited Service: TjktServiceCaller
    Left = 168
    Top = 16
  end
  inherited OperacionSave: TjktOperacion
    OperName = 'GuardarCondPago'
    Atributos = <
      item
        Dataset = mtDetalleCondicionDePago
        Tag = 0
      end>
    Left = 392
    Top = 16
  end
  inherited mtParametroInicial: TjktMemTable
    Left = 480
    Top = 16
  end
  inherited OperacionTraer: TjktOperacion
    OperName = 'TraerCondPago'
    Atributos = <
      item
        Attribute = 'oid'
        Field = mtCondicionDePagooid_CondPago
        Tag = 0
      end>
    Left = 392
    Top = 80
  end
  inherited ValidadorForm: TjktValidadorForm
    ListaValidaciones = <
      item
        Field = mtCondicionDePagoCodigo
        ValidadorNew = valCodigo1
      end
      item
        Field = mtCondicionDePagoCodigo
        ValidadorNew = valCodigo2
      end
      item
        Field = mtDetalleCondicionDePagoDias
        ValidadorGral = valDias
      end
      item
        Field = mtDetalleCondicionDePagoPorcentaje
        ValidadorGral = valPorcentaje
      end>
    Left = 224
    Top = 80
  end
  object dsCondicionDePago: TDataSource
    DataSet = mtCondicionDePago
    Left = 608
    Top = 16
  end
  object mtCondicionDePago: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_CondPago'
        DataType = ftInteger
      end
      item
        Name = 'Codigo'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Descripcion'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'APartirFechaFactura'
        DataType = ftBoolean
      end
      item
        Name = 'APartirFechaRecepcion'
        DataType = ftBoolean
      end
      item
        Name = 'Activo'
        DataType = ftBoolean
      end>
    AutoReposition = True
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
    Left = 608
    Top = 64
    object mtCondicionDePagooid_CondPago: TIntegerField
      Tag = 1
      FieldName = 'oid_CondPago'
    end
    object mtCondicionDePagoCodigo: TStringField
      Tag = 2
      FieldName = 'Codigo'
      Size = 15
    end
    object mtCondicionDePagoDescripcion: TStringField
      Tag = 1
      FieldName = 'Descripcion'
      Size = 100
    end
    object mtCondicionDePagoAPartirFechaFactura: TBooleanField
      Tag = 1
      FieldName = 'APartirFechaFactura'
    end
    object mtCondicionDePagoAPartirFechaRecepcion: TBooleanField
      Tag = 1
      FieldName = 'APartirFechaRecepcion'
    end
    object mtCondicionDePagoActivo: TBooleanField
      Tag = 1
      FieldName = 'Activo'
    end
  end
  object Help: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'condicionPago'
    OidRespuesta = mtCondicionDePagooid_CondPago
    Left = 328
    Top = 80
  end
  object mtDetalleCondicionDePago: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_Det_CondPago'
        DataType = ftInteger
      end
      item
        Name = 'oid_CondPago'
        DataType = ftInteger
      end
      item
        Name = 'oid_Detalle'
        DataType = ftInteger
      end>
    IndexFieldNames = 'oid_CondPago'
    IndexDefs = <
      item
        Name = 'mtDetalleCondicionDePagoIndex1'
        Fields = 'oid_CondPago'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    MasterFields = 'oid_CondPago'
    MasterSource = dsCondicionDePago
    Version = '7.12.10 CodeGear Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    Left = 224
    Top = 192
    object mtDetalleCondicionDePagooid_Det_CondPago: TIntegerField
      Tag = 1
      FieldName = 'oid_Det_CondPago'
    end
    object mtDetalleCondicionDePagooid_CondPago: TIntegerField
      Tag = 1
      FieldName = 'oid_CondPago'
    end
    object mtDetalleCondicionDePagoDias: TIntegerField
      Tag = 1
      FieldName = 'Dias'
    end
    object mtDetalleCondicionDePagoPorcentaje: TIntegerField
      Tag = 1
      FieldName = 'Porcentaje'
    end
  end
  object dsDetalleCondicionDePago: TDataSource
    DataSet = mtDetalleCondicionDePago
    Left = 224
    Top = 144
  end
  object valDias: TjktValidador
    Validacion = tMayorCero
    ListaAsignaciones = <>
    Left = 16
    Top = 160
  end
  object valPorcentaje: TjktValidador
    Validacion = tMenorIgualCien
    ListaAsignaciones = <>
    Left = 80
    Top = 160
  end
  object valCodigo1: TjktValidador
    Validacion = tDistintoEspacio
    ListaAsignaciones = <>
    Left = 72
    Top = 64
  end
  object valCodigo2: TjktValidador
    Entidad = 'condicionPago'
    Validacion = tInexistente
    ListaAsignaciones = <>
    Left = 136
    Top = 64
  end
end
