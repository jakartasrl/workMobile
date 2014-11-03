inherited FNVen0004: TFNVen0004
  Caption = #205'tems de presupuesto pendientes de cotizar'
  ClientHeight = 508
  ClientWidth = 771
  ExplicitWidth = 787
  ExplicitHeight = 546
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBoxLeft: TcxGroupBox
    ExplicitHeight = 0
    Height = 508
  end
  inherited cxSplitterLeft: TcxSplitter
    Height = 508
    ExplicitHeight = 0
  end
  inherited cxGroupBoxRight: TcxGroupBox
    Left = 741
    ExplicitLeft = 86
    ExplicitHeight = 0
    Height = 508
  end
  inherited cxSplitterRight: TcxSplitter
    Left = 737
    Height = 508
    ExplicitLeft = 82
    ExplicitHeight = 0
  end
  inherited cxGroupBoxMain: TcxGroupBox
    ExplicitWidth = 48
    ExplicitHeight = 0
    Height = 508
    Width = 703
    object cxGroupBox1: TcxGroupBox
      Left = 2
      Top = 2
      Align = alTop
      Caption = '-'
      TabOrder = 0
      Visible = False
      Height = 79
      Width = 699
    end
    object cxGroupBox2: TcxGroupBox
      Left = 2
      Top = 81
      Align = alClient
      Alignment = alCenterCenter
      TabOrder = 1
      Height = 425
      Width = 699
      object jktExpDBGrid1: TjktExpDBGrid
        Left = 3
        Top = 3
        Width = 693
        Height = 419
        Align = alClient
        TabOrder = 0
        DataSource = dsItems
        ExplicitTop = 15
        ExplicitWidth = 206
        ExplicitHeight = 122
        object jktExpDBGrid1DBTableView: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsItems
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          object jktExpDBGrid1DBTableViewnro_cotiz: TcxGridDBColumn
            Caption = 'Presupuesto'
            DataBinding.FieldName = 'nro_cotiz'
            Width = 80
          end
          object jktExpDBGrid1DBTableViewfecha: TcxGridDBColumn
            Caption = 'Fecha'
            DataBinding.FieldName = 'fecha'
          end
          object jktExpDBGrid1DBTableViewdes_clie_sucu: TcxGridDBColumn
            Caption = 'Cliente / Sucursal'
            DataBinding.FieldName = 'des_clie_sucu'
            Width = 250
          end
          object jktExpDBGrid1DBTableViewdes_vend: TcxGridDBColumn
            Caption = 'Vendedor'
            DataBinding.FieldName = 'des_vend'
            Width = 200
          end
          object jktExpDBGrid1DBTableViewoid_item: TcxGridDBColumn
            DataBinding.FieldName = 'oid_item'
          end
          object jktExpDBGrid1DBTableViewnro_item: TcxGridDBColumn
            Caption = 'Nro '#237'tem'
            DataBinding.FieldName = 'nro_item'
          end
          object jktExpDBGrid1DBTableViewcant: TcxGridDBColumn
            Caption = 'Cantidad'
            DataBinding.FieldName = 'cant'
          end
          object jktExpDBGrid1DBTableViewdetalle: TcxGridDBColumn
            Caption = 'Descripci'#243'n del '#237'tem'
            DataBinding.FieldName = 'detalle'
            Width = 200
          end
        end
        object jktExpDBGrid1Level1: TcxGridLevel
          GridView = jktExpDBGrid1DBTableView
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
  inherited Driver: TjktDriver
    DataSetCab = mtItems
  end
  object mtItems: TjktMemTable
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
    Left = 224
    Top = 208
    object mtItemsnro_cotiz: TIntegerField
      FieldName = 'nro_cotiz'
    end
    object mtItemsfecha: TDateTimeField
      FieldName = 'fecha'
    end
    object mtItemsdes_clie_sucu: TStringField
      FieldName = 'des_clie_sucu'
      Size = 150
    end
    object mtItemsdes_vend: TStringField
      FieldName = 'des_vend'
      Size = 40
    end
    object mtItemsoid_item: TIntegerField
      FieldName = 'oid_item'
    end
    object mtItemsnro_item: TIntegerField
      FieldName = 'nro_item'
    end
    object mtItemscant: TFloatField
      FieldName = 'cant'
    end
    object mtItemsdetalle: TMemoField
      FieldName = 'detalle'
      BlobType = ftMemo
    end
  end
  object dsItems: TDataSource
    DataSet = mtItems
    Left = 264
    Top = 208
  end
  object cxGridPopupMenu: TcxGridPopupMenu
    PopupMenus = <
      item
        GridView = jktExpDBGrid1DBTableView
        HitTypes = []
        Index = 0
      end>
    Left = 160
    Top = 304
  end
end
