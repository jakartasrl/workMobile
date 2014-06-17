object FAttributeEditor: TFAttributeEditor
  Left = 0
  Top = 0
  Caption = 'FAttributeEditor'
  ClientHeight = 226
  ClientWidth = 446
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 176
    Width = 446
    Height = 50
    Align = alBottom
    TabOrder = 0
    object Button1: TButton
      Left = 120
      Top = 9
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
    end
    object Button2: TButton
      Left = 240
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 446
    Height = 176
    Align = alClient
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid1DBTableView1atributo: TcxGridDBColumn
        DataBinding.FieldName = 'atributo'
      end
      object cxGrid1DBTableView1datasetName: TcxGridDBColumn
        DataBinding.FieldName = 'datasetName'
      end
      object cxGrid1DBTableView1fieldName: TcxGridDBColumn
        DataBinding.FieldName = 'fieldName'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object mem1: TjktMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'atributo'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'datasetName'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'fieldName'
        DataType = ftString
        Size = 30
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
    Left = 16
    Top = 104
    object mem1atributo: TStringField
      FieldName = 'atributo'
      Size = 25
    end
    object mem1datasetName: TStringField
      FieldName = 'datasetName'
      Size = 30
    end
    object mem1fieldName: TStringField
      FieldName = 'fieldName'
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = mem1
    Left = 136
    Top = 96
  end
end
