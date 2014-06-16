object Form1: TForm1
  Left = 389
  Top = 220
  Caption = 
    'kbmSQL teaser - Copyright 2007/2008 Components4Developers - All ' +
    'rights reserved'
  ClientHeight = 560
  ClientWidth = 1221
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 120
  TextHeight = 16
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1221
    Height = 560
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Description'
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 1213
        Height = 529
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = clBtnFace
        Lines.Strings = (
          'SQL Teaser'
          ''
          'Pressing '#39'Execute SQL'#39' does the following:'
          ''
          '- Generates some sample data in the kbmMemTable mtTable1.  The '
          'data consists of about 100 records of each 4 fields.'
          
            '  fld1 and fld4 are string fields, fld2 and fld3 are integer fie' +
            'lds.  (other '
          'kbmMemTable fieldtypes are also supported)'
          ''
          '- Executes the given SQL which can be one of:'
          '  SELECT, INSERT, UPDATE and DELETE  (other DDL commands '
          'are not yet supported)'
          ''
          'The component executing the SQL is named TkbmSQL.'
          
            'It supports registering multiple kbmMemTable with it which each ' +
            'can '
          'be aliased (as this demo shows... the '
          'component mtTable1 is aliased as table1).'
          ''
          'Whats supported:'
          
            '- Complex calculations, MOD, DIV, +, -, *, /, (, ), AS aliasing,' +
            ' LIKE, '
          'BETWEEN, IN, <,>,<=,>=,<>, NOT, SELECT,'
          'DELETE, UPDATE, INSERT, IS NULL, IS NOT NULL, ORDER '
          'BY, DESC, GROUP BY, MAX, MIN, SUM, AVG, COUNT'
          ''
          'Whats not (yet) supported:'
          '- HAVING, sub selects, other DDL commands, joins.'
          ''
          'NOTICE!!!'
          'This is only a teaser! Not a demo of a done product!')
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Samples'
      ImageIndex = 1
      object Splitter1: TSplitter
        Left = 660
        Top = 0
        Height = 529
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitHeight = 522
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 660
        Height = 529
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alLeft
        TabOrder = 0
        DesignSize = (
          660
          529)
        object Button1: TButton
          Left = 12
          Top = 486
          Width = 93
          Height = 31
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akBottom]
          Caption = 'Execute SQL'
          TabOrder = 0
          OnClick = Button1Click
        end
        object mSQL: TMemo
          Left = 4
          Top = 4
          Width = 648
          Height = 370
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight, akBottom]
          Lines.Strings = (
            
              'SELECT fld1,fld5,sum(fld5),count(fld5) from table1 group by fld1' +
              ',fld5'
            
              '//SELECT min(fld2),max(fld2),sum(fld5),avg(fld5),count(*) from t' +
              'able1 where fld5>5'
            
              '//SELECT min(fld2),max(fld2),sum(fld5),avg(fld5),count(*) from t' +
              'able1'
            '//SELECT fld5,sum(fld5),count(fld5) from table1 group by fld5'
            '//SELECT count(*) from table1'
            '//SELECT count(*) from table1 where fld2>50'
            '//SELECT fld5 from table1 group by fld5'
            '//SELECT fld3, fld3 as Field3 from table1 '
            
              '//SELECT fld3,(fld3 mod 10)=0 as bool,fld3 / 13 as somefield fro' +
              'm table1 order by bool desc, somefield desc'
            '//SELECT fld3,(fld3>950)=0,fld3 / 13 from table1'
            
              '//SELECT fld3,(fld3>950)=0,fld3 / 13, (fld3 div 11) from table1 ' +
              'where (fld3 mod 11)=0 '
            '//SELECT fld3>5 from table1'
            '//SELECT fld3+1+2 from table1'
            '//SELECT fld1,fld3+1+2 from table1'
            '//SELECT fld1,fld3 from table1'
            
              '//UPDATE table1 SET fld1='#39'UPD'#39' WHERE fld1 in ('#39'STR2'#39','#39'STR4'#39','#39'STR' +
              '6'#39') or fld2=10'
            
              '//DELETE FROM table1 WHERE fld1 in ('#39'STR2'#39','#39'STR4'#39','#39'STR6'#39') or fld' +
              '2=10'
            '//DELETE FROM table1 WHERE fld1 in ('#39'STR2'#39','#39'STR4'#39','#39'STR6'#39')'
            '//DELETE FROM table1 WHERE fld1='#39'STR2'#39
            
              '//INSERT INTO table1 (fld1,fld2,fld4) VALUES ('#39'HEJ'#39',1,((2+5)-2)*' +
              '3-1 <>7)'
            '//INSERT INTO table1 (fld1,fld2,fld4) VALUES ('#39'HEJ'#39',1,2*3)'
            '//SELECT fld2+1 / 2,fld2 FROM table1 ORDER BY fld2')
          TabOrder = 1
          WordWrap = False
        end
        object Memo2: TMemo
          Left = 4
          Top = 382
          Width = 648
          Height = 97
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akRight, akBottom]
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 2
        end
      end
      object Panel2: TPanel
        Left = 663
        Top = 0
        Width = 550
        Height = 529
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        TabOrder = 1
        object Label1: TLabel
          Left = 1
          Top = 1
          Width = 548
          Height = 16
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          Caption = 'Raw data'
          ExplicitWidth = 57
        end
        object Label2: TLabel
          Left = 1
          Top = 190
          Width = 548
          Height = 16
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          Caption = 'SQL result'
          ExplicitWidth = 61
        end
        object Splitter2: TSplitter
          Left = 1
          Top = 186
          Width = 548
          Height = 4
          Cursor = crVSplit
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          ExplicitWidth = 545
        end
        object DBGrid1: TDBGrid
          Left = 1
          Top = 17
          Width = 548
          Height = 169
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -14
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
        object DBGrid2: TDBGrid
          Left = 1
          Top = 206
          Width = 548
          Height = 322
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alClient
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -14
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
    end
  end
  object mtTable1: TkbmMemTable
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
    Version = '7.10.00 Standard Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 455
    Top = 16
    object mtTable1fld1: TStringField
      FieldName = 'fld1'
      Size = 10
    end
    object mtTable1fld2: TIntegerField
      FieldName = 'fld2'
    end
    object mtTable1fld3: TIntegerField
      FieldName = 'fld3'
    end
    object mtTable1fld4: TStringField
      FieldName = 'fld4'
      Size = 10
    end
    object mtTable1fld5: TIntegerField
      FieldName = 'fld5'
    end
  end
  object dsTable1: TDataSource
    DataSet = mtTable1
    Left = 456
    Top = 72
  end
end
