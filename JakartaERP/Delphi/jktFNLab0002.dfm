inherited FNLab0002: TFNLab0002
  Caption = 'ABM de Analisis'
  ClientHeight = 368
  ClientWidth = 718
  ExplicitWidth = 734
  ExplicitHeight = 407
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBoxLeft: TcxGroupBox
    ExplicitTop = 57
    ExplicitHeight = 311
    Height = 368
  end
  inherited cxSplitterLeft: TcxSplitter
    Height = 368
    ExplicitLeft = 185
    ExplicitTop = 57
    ExplicitHeight = 311
  end
  inherited cxGroupBoxRight: TcxGroupBox
    Left = 533
    TabOrder = 4
    ExplicitLeft = 533
    ExplicitTop = 57
    ExplicitHeight = 311
    Height = 368
  end
  inherited cxSplitterRight: TcxSplitter
    Left = 525
    Height = 368
    ExplicitLeft = 525
    ExplicitTop = 57
    ExplicitHeight = 311
  end
  inherited cxGroupBoxMain: TcxGroupBox
    TabOrder = 7
    ExplicitTop = 57
    ExplicitWidth = 332
    ExplicitHeight = 311
    Height = 368
    Width = 332
    object Panel1: TPanel
      Left = 3
      Top = 22
      Width = 326
      Height = 57
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 0
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 718
      object Label1: TLabel
        Left = 32
        Top = 16
        Width = 35
        Height = 13
        Caption = 'Analisis'
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 73
        Top = 13
        TabOrder = 0
        Width = 121
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 200
        Top = 13
        TabOrder = 1
        Width = 457
      end
    end
    object Panel2: TPanel
      Left = 3
      Top = 79
      Width = 326
      Height = 286
      Align = alClient
      BorderStyle = bsSingle
      TabOrder = 1
      ExplicitLeft = 193
      ExplicitTop = 0
      ExplicitWidth = 332
      ExplicitHeight = 368
      object cxGrid1: TcxGrid
        Left = 1
        Top = 1
        Width = 320
        Height = 280
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 326
        ExplicitHeight = 362
        object cxGrid1DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = DSDet
          DataController.KeyFieldNames = 'key'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          object cxGrid1DBTableView1cod_det: TcxGridDBColumn
            Caption = 'Codigo'
            DataBinding.FieldName = 'cod_det'
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
    DockControlHeights = (
      0
      0
      0
      0)
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
      end>
  end
  object valLaboratorio: TjktValidador
    Entidad = 'Laboratorio'
    Validacion = tExistente
    ListaAsignaciones = <
      item
        FieldName = 'oid'
        SourceName = 'oid'
      end
      item
        FieldName = 'descripcion'
        SourceName = 'descripcion'
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
    Left = 144
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
    Left = 576
    Top = 168
    object TCaboid_ana: TIntegerField
      FieldName = 'oid_ana'
    end
    object TCabcod_ana: TStringField
      FieldName = 'cod_ana'
      Size = 10
    end
    object TCabdes_ana: TStringField
      FieldName = 'des_ana'
      Size = 60
    end
    object TCaboid_lab: TIntegerField
      FieldName = 'oid_lab'
    end
    object TCabactivo: TBooleanField
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
      FieldName = 'oid_ana'
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
    Entidad = 'Determinacion'
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
end
