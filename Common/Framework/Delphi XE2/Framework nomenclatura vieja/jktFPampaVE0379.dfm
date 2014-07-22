object FPampaVE0379: TFPampaVE0379
  Left = 268
  Top = 51
  Width = 996
  Height = 637
  Caption = 'Consulta pedidos facturación'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object jktExpDBGrid1: TjktExpDBGrid
    Left = 0
    Top = 0
    Width = 980
    Height = 599
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'secu'
    ShowGroupPanel = True
    SummaryGroups = <>
    SummarySeparator = ', '
    Align = alClient
    TabOrder = 0
    DataSource = DSConsulta
    Filter.Active = True
    Filter.Criteria = {00000000}
    LookAndFeel = lfFlat
    OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSort, edgoTabs, edgoTabThrough, edgoVertThrough]
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoBandHeaderWidth, edgoRowAutoHeight, edgoUseBitmap]
    object jktExpDBGrid1secu: TdxDBGridMaskColumn
      DisableEditor = True
      HeaderAlignment = taCenter
      Visible = False
      Width = 96
      BandIndex = 0
      RowIndex = 0
      FieldName = 'secu'
    end
    object jktExpDBGrid1oid_cco_ped: TdxDBGridMaskColumn
      DisableEditor = True
      HeaderAlignment = taCenter
      Visible = False
      Width = 96
      BandIndex = 0
      RowIndex = 0
      FieldName = 'oid_cco_ped'
    end
    object jktExpDBGrid1nro_ped: TdxDBGridMaskColumn
      Caption = 'Nro Pedido'
      DisableEditor = True
      HeaderAlignment = taCenter
      Width = 77
      BandIndex = 0
      RowIndex = 0
      FieldName = 'nro_ped'
    end
    object jktExpDBGrid1cliente: TdxDBGridMaskColumn
      Caption = 'Cliente'
      DisableEditor = True
      HeaderAlignment = taCenter
      Width = 136
      BandIndex = 0
      RowIndex = 0
      FieldName = 'cliente'
    end
    object jktExpDBGrid1vendedor: TdxDBGridMaskColumn
      Caption = 'Vendedor'
      DisableEditor = True
      HeaderAlignment = taCenter
      Width = 139
      BandIndex = 0
      RowIndex = 0
      FieldName = 'vendedor'
    end
    object jktExpDBGrid1moneda_ori: TdxDBGridMaskColumn
      Caption = 'Moneda Origen'
      DisableEditor = True
      HeaderAlignment = taCenter
      Width = 60
      BandIndex = 0
      RowIndex = 0
      FieldName = 'moneda_ori'
    end
    object jktExpDBGrid1Column13: TdxDBGridColumn
      Caption = 'Cotiz Ori'
      DisableEditor = True
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'cotiz_ori'
    end
    object jktExpDBGrid1importe_ped_tot: TdxDBGridCurrencyColumn
      Caption = 'Importe Pedido Total'
      DisableEditor = True
      HeaderAlignment = taCenter
      Width = 89
      BandIndex = 0
      RowIndex = 0
      FieldName = 'importe_ped_tot'
      Nullable = False
    end
    object jktExpDBGrid1impo_facturas: TdxDBGridCurrencyColumn
      Caption = 'Facturas'
      DisableEditor = True
      HeaderAlignment = taCenter
      Width = 87
      BandIndex = 0
      RowIndex = 0
      FieldName = 'impo_facturas'
      Nullable = False
    end
    object jktExpDBGrid1impo_facturas_varias: TdxDBGridCurrencyColumn
      Caption = 'Facturas Varias'
      DisableEditor = True
      HeaderAlignment = taCenter
      Width = 136
      BandIndex = 0
      RowIndex = 0
      FieldName = 'impo_facturas_varias'
      Nullable = False
    end
    object jktExpDBGrid1impo_nc: TdxDBGridCurrencyColumn
      Caption = 'NC'
      DisableEditor = True
      HeaderAlignment = taCenter
      Width = 60
      BandIndex = 0
      RowIndex = 0
      FieldName = 'impo_nc'
      Nullable = False
    end
    object jktExpDBGrid1impo_remito: TdxDBGridCurrencyColumn
      Caption = 'Remitos'
      DisableEditor = True
      HeaderAlignment = taCenter
      Width = 60
      BandIndex = 0
      RowIndex = 0
      FieldName = 'impo_remito'
      Nullable = False
    end
    object jktExpDBGrid1saldo_sin_facturar: TdxDBGridCurrencyColumn
      Caption = 'Saldo sin facturar'
      DisableEditor = True
      HeaderAlignment = taCenter
      Width = 102
      BandIndex = 0
      RowIndex = 0
      FieldName = 'saldo_sin_facturar'
      Nullable = False
    end
  end
  object mtConsulta: TjktMemTable
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
    Version = '5.52'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 32
    Top = 290
    object mtConsultasecu: TIntegerField
      FieldName = 'secu'
    end
    object mtConsultaoid_cco_ped: TIntegerField
      FieldName = 'oid_cco_ped'
    end
    object mtConsultanro_ped: TIntegerField
      FieldName = 'nro_ped'
    end
    object mtConsultacliente: TStringField
      FieldName = 'cliente'
      Size = 250
    end
    object mtConsultavendedor: TStringField
      FieldName = 'vendedor'
      Size = 250
    end
    object mtConsultamoneda_ori: TStringField
      FieldName = 'moneda_ori'
      Size = 30
    end
    object mtConsultaimporte_ped_tot: TCurrencyField
      FieldName = 'importe_ped_tot'
      DisplayFormat = '###,###,###,##0.00'
    end
    object mtConsultaimpo_facturas: TCurrencyField
      FieldName = 'impo_facturas'
      DisplayFormat = '###,###,###,##0.00'
    end
    object mtConsultaimpo_facturas_varias: TCurrencyField
      FieldName = 'impo_facturas_varias'
      DisplayFormat = '###,###,###,##0.00'
    end
    object mtConsultaimpo_nc: TCurrencyField
      FieldName = 'impo_nc'
      DisplayFormat = '###,###,###,##0.00'
    end
    object mtConsultaimpo_remito: TCurrencyField
      FieldName = 'impo_remito'
      DisplayFormat = '###,###,###,##0.00'
    end
    object mtConsultasaldo_sin_facturar: TCurrencyField
      FieldName = 'saldo_sin_facturar'
      DisplayFormat = '###,###,###,##0.00'
    end
    object mtConsultacotiz_ori: TCurrencyField
      FieldName = 'cotiz_ori'
      DisplayFormat = '###,###,###,##0.0000'
    end
  end
  object DSConsulta: TDataSource
    DataSet = mtConsulta
    Left = 64
    Top = 290
  end
end
