object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 383
  ClientWidth = 623
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 32
    Top = 256
    Width = 121
    Height = 41
    Caption = 'Link DataSource'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 623
    Height = 241
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 1
    object Grilla: TjktExpDBGrid
      Left = 1
      Top = 1
      Width = 621
      Height = 239
      Align = alClient
      TabOrder = 0
      DataSource = DataSource1
      object GrillaDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = DataSource1
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.ColumnHeaderHints = False
      end
      object GrillaLevel1: TcxGridLevel
        GridView = GrillaDBTableView1
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = mtConsulta
    Left = 88
    Top = 72
  end
  object mtTipoCtaProv: TkbmMemTable
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
    FilterOptions = []
    Version = '7.12.10 CodeGear Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    Left = 232
    Top = 72
    object mtTipoCtaProvoid: TIntegerField
      Tag = 1
      FieldName = 'oid'
    end
    object mtTipoCtaProvcodigo: TStringField
      Tag = 1
      FieldName = 'codigo'
      Size = 10
    end
    object mtTipoCtaProvdescripcion: TStringField
      Tag = 1
      FieldName = 'descripcion'
      Size = 30
    end
    object mtTipoCtaProvvalidar: TBooleanField
      Tag = 1
      FieldName = 'validar'
    end
    object mtTipoCtaProvactivo: TBooleanField
      Tag = 1
      FieldName = 'activo'
    end
  end
  object mtConsulta: TjktMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'secu'
        DataType = ftInteger
      end
      item
        Name = 'oid_cco_ped'
        DataType = ftInteger
      end
      item
        Name = 'nro_ped'
        DataType = ftInteger
      end
      item
        Name = 'cliente'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'vendedor'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'moneda_ori'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'importe_ped_tot'
        DataType = ftCurrency
      end
      item
        Name = 'impo_facturas'
        DataType = ftCurrency
      end
      item
        Name = 'impo_facturas_varias'
        DataType = ftCurrency
      end
      item
        Name = 'impo_nc'
        DataType = ftCurrency
      end
      item
        Name = 'impo_remito'
        DataType = ftCurrency
      end
      item
        Name = 'saldo_sin_facturar'
        DataType = ftCurrency
      end
      item
        Name = 'cotiz_ori'
        DataType = ftCurrency
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
    SubLanguageID = 1
    LocaleID = 1024
    Left = 160
    Top = 72
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
end
