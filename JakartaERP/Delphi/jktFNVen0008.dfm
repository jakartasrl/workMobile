object FNVen0008: TFNVen0008
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Tipos de cambio'
  ClientHeight = 163
  ClientWidth = 314
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object jktExpDBGrid1: TjktExpDBGrid
    Left = 0
    Top = 0
    Width = 314
    Height = 163
    Align = alClient
    BorderStyle = cxcbsNone
    TabOrder = 0
    ExplicitWidth = 298
    ExplicitHeight = 153
    object jktExpDBGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Inserting = False
      OptionsView.ExpandButtonsForEmptyDetails = False
      OptionsView.GroupByBox = False
      object jktExpDBGrid1DBTableView1oid_moneda: TcxGridDBColumn
        DataBinding.FieldName = 'oid_moneda'
        Visible = False
      end
      object jktExpDBGrid1DBTableView1cod_moneda: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'cod_moneda'
        Options.Editing = False
        Width = 70
      end
      object jktExpDBGrid1DBTableView1des_moneda: TcxGridDBColumn
        Caption = 'Moneda'
        DataBinding.FieldName = 'des_moneda'
        Options.Editing = False
        Width = 180
      end
      object jktExpDBGrid1DBTableView1cotizacion: TcxGridDBColumn
        Caption = 'Cotizaci'#243'n'
        DataBinding.FieldName = 'cotizacion'
      end
    end
    object jktExpDBGrid1Level1: TcxGridLevel
      GridView = jktExpDBGrid1DBTableView1
    end
  end
end
