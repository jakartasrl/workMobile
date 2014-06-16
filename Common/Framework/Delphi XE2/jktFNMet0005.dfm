object FMet005: TFMet005
  Left = 344
  Top = 195
  Caption = 'XML'
  ClientHeight = 337
  ClientWidth = 528
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 528
    Height = 277
    Align = alClient
    TabOrder = 0
    object Memo: TMemo
      Left = 2
      Top = 15
      Width = 524
      Height = 260
      Align = alClient
      Lines.Strings = (
        '')
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 277
    Width = 528
    Height = 60
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 200
      Top = 16
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      TabOrder = 0
      OnClick = Button1Click
    end
  end
end
