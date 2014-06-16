object frQueryService: TfrQueryService
  Left = 0
  Top = 0
  Width = 451
  Height = 304
  Align = alClient
  TabOrder = 0
  TabStop = True
  object Label28: TLabel
    Left = 8
    Top = 56
    Width = 266
    Height = 13
    Caption = 'Please select the database you want the service to use'
  end
  object Label29: TLabel
    Left = 8
    Top = 80
    Width = 553
    Height = 41
    AutoSize = False
    Caption = 
      'The query service supports accessing multiple database types. Th' +
      'e wizard only generates code for one database type automatically' +
      ', thus additional types require manual adding of database adapte' +
      'r components.'
    WordWrap = True
  end
  object cbDatabaseType: TComboBox
    Left = 296
    Top = 48
    Width = 257
    Height = 21
    Style = csDropDownList
    TabOrder = 0
    OnChange = cbDatabaseTypeChange
  end
  object gbSampleQuery: TGroupBox
    Left = 8
    Top = 120
    Width = 553
    Height = 145
    Caption = 'Sample components'
    TabOrder = 1
    Visible = False
    object Label30: TLabel
      Left = 8
      Top = 24
      Width = 206
      Height = 13
      Caption = 'Select form/datamodule for connectionpool'
    end
    object cbConnectionPoolForm: TComboBox
      Left = 240
      Top = 16
      Width = 305
      Height = 21
      Style = csDropDownList
      TabOrder = 0
    end
    object chbSampleQuery: TCheckBox
      Left = 8
      Top = 48
      Width = 297
      Height = 17
      Caption = 'Add a sample query component on the new service module'
      TabOrder = 1
      OnClick = chbSampleQueryClick
    end
    object chbSampleStoredProc: TCheckBox
      Left = 8
      Top = 72
      Width = 369
      Height = 17
      Caption = 
        'Add a sample stored procedure component on the new service modul' +
        'e'
      TabOrder = 2
      OnClick = chbSampleStoredProcClick
    end
    object chbSampleResolver: TCheckBox
      Left = 8
      Top = 96
      Width = 353
      Height = 17
      Caption = 'Add a sample resolver component on the new service module'
      TabOrder = 3
    end
    object chbSampleStreamFormat: TCheckBox
      Left = 8
      Top = 120
      Width = 409
      Height = 17
      Caption = 
        'Add a sample binary streamformat component on the new service mo' +
        'dule'
      TabOrder = 4
    end
    object chbQueryDefault: TCheckBox
      Left = 408
      Top = 48
      Width = 97
      Height = 17
      Caption = 'Default'
      TabOrder = 5
    end
    object chbStoredProcDefault: TCheckBox
      Left = 408
      Top = 72
      Width = 97
      Height = 17
      Caption = 'Default'
      TabOrder = 6
    end
  end
  object Panel11: TPanel
    Left = 8
    Top = 8
    Width = 601
    Height = 33
    BevelOuter = bvLowered
    Caption = 'Query service'
    Color = 8043463
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
end
