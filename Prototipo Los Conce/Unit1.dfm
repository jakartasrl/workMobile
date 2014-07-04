object FormMenu: TFormMenu
  Left = 0
  Top = 0
  Caption = 'Men'#250' Principal'
  ClientHeight = 428
  ClientWidth = 686
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object cxButton1: TcxButton
    Left = 96
    Top = 64
    Width = 121
    Height = 57
    Caption = 'Gesti'#243'n de pedidos'
    TabOrder = 0
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 96
    Top = 136
    Width = 121
    Height = 57
    Caption = 'Agenda'
    TabOrder = 1
    OnClick = cxButton2Click
  end
end
