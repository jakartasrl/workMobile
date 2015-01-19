inherited FNLab0003: TFNLab0003
  Caption = 'Ingreso de Muestras'
  ClientHeight = 542
  ClientWidth = 1196
  ExplicitWidth = 1212
  ExplicitHeight = 581
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBoxLeft: TcxGroupBox
    ExplicitHeight = 0
    Height = 542
  end
  inherited cxSplitterLeft: TcxSplitter
    Height = 542
    ExplicitHeight = 0
  end
  inherited cxGroupBoxRight: TcxGroupBox
    Left = 1166
    ExplicitLeft = 1166
    ExplicitHeight = 0
    Height = 542
  end
  inherited cxSplitterRight: TcxSplitter
    Left = 1162
    Height = 542
    ExplicitLeft = 1162
    ExplicitHeight = 0
  end
  inherited cxGroupBoxMain: TcxGroupBox
    ExplicitWidth = 1128
    ExplicitHeight = 0
    Height = 542
    Width = 1128
    object cxGroupBox1: TcxGroupBox
      Left = 2
      Top = 2
      Align = alTop
      Caption = 'Datos de la Muestra'
      TabOrder = 0
      Height = 105
      Width = 1124
      object cxLabel2: TcxLabel
        Left = 552
        Top = 23
        Caption = 'Equipo'
      end
      object cxLabel3: TcxLabel
        Left = 9
        Top = 46
        Caption = 'Nro Pedido'
      end
      object cxLabel4: TcxLabel
        Left = 448
        Top = 46
        Caption = 'Referencia'
      end
      object cxLabel5: TcxLabel
        Left = 932
        Top = 46
        Caption = 'Fecha'
      end
      object cxLabel6: TcxLabel
        Left = 9
        Top = 69
        Caption = 'Comentario'
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 71
        Top = 22
        TabOrder = 5
        Width = 82
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 151
        Top = 22
        TabOrder = 6
        Width = 34
      end
      object cxDBTextEdit3: TcxDBTextEdit
        Left = 191
        Top = 22
        TabOrder = 7
        Width = 355
      end
      object cxDBTextEdit4: TcxDBTextEdit
        Left = 594
        Top = 22
        TabOrder = 8
        Width = 82
      end
      object cxDBTextEdit5: TcxDBTextEdit
        Left = 682
        Top = 22
        TabOrder = 9
        Width = 415
      end
      object cxDBTextEdit6: TcxDBTextEdit
        Left = 71
        Top = 46
        TabOrder = 10
        Width = 170
      end
      object cxDBTextEdit7: TcxDBTextEdit
        Left = 510
        Top = 45
        TabOrder = 11
        Width = 387
      end
      object cxDBTextEdit8: TcxDBTextEdit
        Left = 971
        Top = 45
        TabOrder = 12
        Width = 126
      end
      object cxDBTextEdit9: TcxDBTextEdit
        Left = 71
        Top = 69
        TabOrder = 13
        Width = 826
      end
    end
    object cxGroupBox2: TcxGroupBox
      Left = 2
      Top = 107
      Align = alClient
      Caption = 'Determinaciones a Realizar'
      TabOrder = 1
      ExplicitHeight = 279
      Height = 433
      Width = 1124
    end
  end
  object cxLabel1: TcxLabel [5]
    Left = 45
    Top = 32
    Caption = 'Cliente/Suc'
  end
  inherited BarManager: TdxBarManager
    Left = 152
    Top = 16
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited Driver: TjktDriver
    Left = 352
    Top = 65528
  end
  inherited IdHTTP: TIdHTTP
    Left = 280
  end
  inherited Service: TjktServiceCaller
    Top = 65528
  end
  inherited OperacionSave: TjktOperacion
    Left = 400
    Top = 0
  end
  inherited mtParametroInicial: TjktMemTable
    Left = 512
    Top = 72
  end
  inherited mtParametrosForm: TjktMemTable
    Top = 56
  end
end
