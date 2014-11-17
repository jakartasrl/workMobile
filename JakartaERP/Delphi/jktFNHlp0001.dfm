inherited FNHlp0001: TFNHlp0001
  Caption = #205'tems de presupuesto pendientes de cotizar'
  ClientHeight = 479
  ClientWidth = 932
  ExplicitLeft = -159
  ExplicitWidth = 938
  ExplicitHeight = 507
  PixelsPerInch = 96
  TextHeight = 13
  inherited gbFiltroAvanzado: TcxGroupBox
    ExplicitWidth = 1008
    ExplicitHeight = 89
    Height = 89
    Width = 932
  end
  inherited cxGroupBox2: TcxGroupBox
    Top = 94
    ExplicitTop = 94
    ExplicitWidth = 1008
    ExplicitHeight = 329
    Height = 329
    Width = 932
    inherited dbgHelp: TjktExpDBGrid
      Width = 928
      Height = 325
      ExplicitWidth = 1004
      ExplicitHeight = 325
      inherited dbgHelpDBTableView: TcxGridDBTableView
        FilterRow.SeparatorWidth = 3
        OptionsView.CellAutoHeight = False
        OptionsView.DataRowHeight = 50
        OptionsView.GroupByBox = True
        OptionsView.GroupFooters = gfInvisible
        object dbgHelpDBTableViewseleccionado: TcxGridDBColumn
          Caption = 'Selec.'
          DataBinding.FieldName = 'seleccionado'
          Visible = False
          Width = 40
        end
        object dbgHelpDBTableViewnro_cotiz: TcxGridDBColumn
          Caption = 'Presupuesto'
          DataBinding.FieldName = 'nro_cotiz'
          Visible = False
          GroupIndex = 0
          Width = 70
        end
        object dbgHelpDBTableViewfecha: TcxGridDBColumn
          Caption = 'Fecha'
          DataBinding.FieldName = 'fecha'
        end
        object dbgHelpDBTableViewdescripcion: TcxGridDBColumn
          Caption = 'Cliente / Sucursal'
          DataBinding.FieldName = 'descripcion'
          Width = 250
        end
        object dbgHelpDBTableViewdes_vend: TcxGridDBColumn
          Caption = 'Vendedor'
          DataBinding.FieldName = 'des_vend'
          Width = 200
        end
        object dbgHelpDBTableViewnro_item: TcxGridDBColumn
          Caption = 'Nro '#237'tem'
          DataBinding.FieldName = 'nro_item'
        end
        object dbgHelpDBTableViewcant: TcxGridDBColumn
          Caption = 'Cantidad'
          DataBinding.FieldName = 'cant'
        end
        object dbgHelpDBTableViewdetalle: TcxGridDBColumn
          Caption = 'Descripci'#243'n del '#237'tem'
          DataBinding.FieldName = 'detalle'
          PropertiesClassName = 'TcxMemoProperties'
          Properties.ScrollBars = ssVertical
          Width = 200
        end
        object dbgHelpDBTableViewoid: TcxGridDBColumn
          DataBinding.FieldName = 'oid'
          Visible = False
        end
        object dbgHelpDBTableViewcodigo: TcxGridDBColumn
          DataBinding.FieldName = 'codigo'
          Visible = False
        end
      end
    end
  end
  inherited cxGroupBox3: TcxGroupBox
    Top = 423
    ExplicitTop = 423
    ExplicitWidth = 1008
    Width = 932
    inherited btnAceptar: TButton
      Left = 764
      ExplicitLeft = 840
    end
    inherited btnCancelar: TButton
      Left = 845
      ExplicitLeft = 921
    end
  end
  inherited cxSplitter: TcxSplitter
    Top = 89
    Width = 932
    ExplicitTop = 89
    ExplicitWidth = 1008
  end
  inherited popSeleccion: TPopupMenu
    Left = 168
    Top = 280
  end
  inherited mtInput: TjktMemTable
    object mtInputnro_cotiz: TIntegerField
      FieldName = 'nro_cotiz'
    end
    object mtInputfecha: TDateTimeField
      FieldName = 'fecha'
    end
    object mtInputdes_vend: TStringField
      FieldName = 'des_vend'
      Size = 40
    end
    object mtInputnro_item: TIntegerField
      FieldName = 'nro_item'
    end
    object mtInputcant: TFloatField
      FieldName = 'cant'
    end
    object mtInputdetalle: TMemoField
      FieldName = 'detalle'
      BlobType = ftMemo
    end
  end
  inherited opFiltro: TjktOperacion
    OperName = 'HelpTraerItemsACotizar'
    Left = 168
    Top = 216
  end
  inherited Service: TjktServiceCaller
    Left = 136
    Top = 24
  end
  inherited IdHTTP: TIdHTTP
    Left = 184
    Top = 24
  end
end
