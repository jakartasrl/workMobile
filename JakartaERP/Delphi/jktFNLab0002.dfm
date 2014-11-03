inherited FNLab0002: TFNLab0002
  Left = 631
  Top = 110
  Caption = 'ABM de Analisis'
  ClientHeight = 368
  ClientWidth = 782
  Position = poDesigned
  ExplicitWidth = 798
  ExplicitHeight = 407
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBoxLeft: TcxGroupBox
    ExplicitHeight = 368
    Height = 368
  end
  inherited cxSplitterLeft: TcxSplitter
    Height = 368
    ExplicitHeight = 368
  end
  inherited cxGroupBoxRight: TcxGroupBox
    Left = 752
    TabOrder = 4
    ExplicitLeft = 688
    ExplicitHeight = 368
    Height = 368
  end
  inherited cxSplitterRight: TcxSplitter
    Left = 748
    Height = 368
    ExplicitLeft = 684
    ExplicitHeight = 368
  end
  inherited cxGroupBoxMain: TcxGroupBox
    TabOrder = 7
    ExplicitWidth = 650
    ExplicitHeight = 368
    Height = 368
    Width = 714
    object cxGroupBox1: TcxGroupBox
      Left = 2
      Top = 2
      Align = alTop
      Caption = 'Analisis'
      Style.TextStyle = [fsItalic]
      TabOrder = 0
      ExplicitWidth = 646
      Height = 55
      Width = 710
      object Label1: TLabel
        Left = 25
        Top = 24
        Width = 33
        Height = 13
        Caption = 'Codigo'
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 64
        Top = 21
        DataBinding.DataField = 'cod_ana'
        DataBinding.DataSource = DSCab
        TabOrder = 0
        Width = 105
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 175
        Top = 21
        DataBinding.DataField = 'des_ana'
        DataBinding.DataSource = DSCab
        TabOrder = 1
        Width = 463
      end
    end
    object cxGroupBox2: TcxGroupBox
      Left = 2
      Top = 57
      Align = alClient
      Caption = 'Determinaciones Incluidas'
      Style.BorderStyle = ebsOffice11
      Style.TextStyle = [fsItalic]
      TabOrder = 1
      ExplicitWidth = 646
      Height = 309
      Width = 710
      object cxGrid1: TcxGrid
        Left = 3
        Top = 15
        Width = 704
        Height = 284
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 705
        object cxGrid1DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = DSDet
          DataController.KeyFieldNames = 'key'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsData.Appending = True
          OptionsView.GroupByBox = False
          object cxGrid1DBTableView1cod_det: TcxGridDBColumn
            Caption = 'Codigo'
            DataBinding.FieldName = 'cod_det'
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.OnButtonClick = cxGrid1DBTableView1cod_detPropertiesButtonClick
            HeaderAlignmentHorz = taCenter
          end
          object cxGrid1DBTableView1des_det: TcxGridDBColumn
            Caption = 'Descripcion'
            DataBinding.FieldName = 'des_det'
            HeaderAlignmentHorz = taCenter
          end
          object cxGrid1DBTableView1activo: TcxGridDBColumn
            Caption = 'Activo'
            DataBinding.FieldName = 'activo'
            HeaderAlignmentHorz = taCenter
            Width = 61
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
    end
  end
  inherited BarManager: TdxBarManager
    Left = 112
    Top = 48
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited Driver: TjktDriver
    DataSetCab = TCab
    TipoPrograma = tp_abmIndividual
    Filtro = hlpAnalisis
    FocoEnAlta = TCabcod_ana
    FocoEnModificacion = TCabdes_ana
  end
  inherited Service: TjktServiceCaller
    Left = 192
    Top = 48
  end
  inherited OperacionSave: TjktOperacion
    OperName = 'SaveAnalisis'
    Atributos = <
      item
        Dataset = TCab
        Tag = 0
      end
      item
        Dataset = TDet
        Tag = 0
      end>
  end
  inherited OperacionTraer: TjktOperacion
    OperName = 'TraerAnalisis'
  end
  inherited ValidadorForm: TjktValidadorForm
    ListaValidaciones = <
      item
        Field = TDetcod_det
        ValidadorNew = valDeter
        ValidadorModif = valDeter
      end
      item
        Field = TCabcod_ana
        ValidadorNew = valAna
      end>
  end
  object valLaboratorio: TjktValidador
    Entidad = 'laboratorio'
    Validacion = tExistente
    ListaAsignaciones = <
      item
        FieldName = 'oid'
        SourceName = 'oid'
        FieldTarget = TLabooid_lab
      end
      item
        FieldName = 'descripcion'
        SourceName = 'descripcion'
        FieldTarget = TLabodes_lab
      end>
    Left = 96
    Top = 128
  end
  object TLabo: TjktMemTable
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
    Left = 152
    Top = 128
    object TLabooid_lab: TIntegerField
      FieldName = 'oid_lab'
    end
    object TLabodes_lab: TStringField
      FieldName = 'des_lab'
      Size = 30
    end
  end
  object TCab: TjktMemTable
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
    OnNewRecord = TCabNewRecord
    Left = 576
    Top = 168
    object TCaboid_ana: TIntegerField
      Tag = 1
      FieldName = 'oid_ana'
    end
    object TCabcod_ana: TStringField
      Tag = 2
      FieldName = 'cod_ana'
      Size = 10
    end
    object TCabdes_ana: TStringField
      Tag = 1
      FieldName = 'des_ana'
      Size = 60
    end
    object TCaboid_lab: TIntegerField
      Tag = 1
      FieldName = 'oid_lab'
    end
    object TCabactivo: TBooleanField
      Tag = 1
      FieldName = 'activo'
    end
  end
  object TDet: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'TDetIndex1'
        Fields = 'oid_ana'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    MasterFields = 'oid_ana'
    MasterSource = DSCab
    Version = '7.12.10 CodeGear Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    OnNewRecord = TDetNewRecord
    Left = 576
    Top = 216
    object TDetoid_det: TIntegerField
      Tag = 1
      FieldName = 'oid_det'
    end
    object TDetcod_det: TStringField
      Tag = 1
      FieldName = 'cod_det'
    end
    object TDetdes_det: TStringField
      Tag = 1
      FieldName = 'des_det'
      Size = 60
    end
    object TDetactivo: TBooleanField
      Tag = 1
      FieldName = 'activo'
    end
    object TDetkey: TIntegerField
      FieldName = 'key'
    end
    object TDetoid_ana: TIntegerField
      Tag = 1
      FieldName = 'oid_ana'
    end
    object TDetoid_detalle: TIntegerField
      Tag = 1
      FieldName = 'oid_detalle'
    end
  end
  object DSDet: TDataSource
    DataSet = TDet
    Left = 624
    Top = 216
  end
  object DSCab: TDataSource
    DataSet = TCab
    Left = 616
    Top = 176
  end
  object valDeter: TjktValidador
    Entidad = 'determinacion'
    Validacion = tExistente
    ListaAsignaciones = <
      item
        FieldName = 'oid'
        SourceName = 'oid'
        FieldTarget = TDetoid_det
      end
      item
        FieldName = 'descripcion'
        SourceName = 'descripcion'
        FieldTarget = TDetdes_det
      end>
    Left = 40
    Top = 200
  end
  object valAna: TjktValidador
    Entidad = 'analisis'
    Validacion = tInexistente
    ListaAsignaciones = <>
    Left = 104
    Top = 208
  end
  object hlpAnalisis: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'analisis'
    OidRespuesta = TCaboid_ana
    Left = 376
    Top = 152
  end
  object hlpDeter: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'determinacion'
    CodigoRespuesta = TDetcod_det
    Left = 256
    Top = 224
  end
end
