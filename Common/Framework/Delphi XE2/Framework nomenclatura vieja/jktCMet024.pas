unit jktCMet024;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxDBTL, cxTL, cxCustomData;

type
  TjktDBTreeList = class(TcxDBTreeList)
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
   class function TIPO_COL_ESTANDAR() : string;
   class function TIPO_COL_CHECKBOX() : string;
   class function TIPO_COL_MASCARA() : string;
   class function TIPO_BUT_COLUMN() : string;
   class function TIPO_READONLY() : string;
   class function TIPO_COL_MEMO() : string;
   class function TIPO_COL_DATE() : string;

   function CrearColumn(aCaption   : String;
                        aFieldName : String;
                        aTipo      : String;
                        aBand      : TcxTreeListBand;
                        aAncho : integer = 100;
                        aAlingTitulo : TAlignment = taCenter;
                        aSummaryFooterType   : TcxSummaryKind = skNone;
                        aSummaryFooterFormat : String = '';
                        aColor     : TColor = clWindow) : TcxDBTreeListColumn;
    procedure Loaded; override;

  published
    { Published declarations }
    function CrearBanda(Titulo: String): TcxTreeListBand;
  end;

procedure Register;

implementation

uses
  cxEditRepositoryItems;

procedure Register;
begin
  RegisterComponents('Jakarta', [TjktDBTreeList]);
end;

function TjktDBTreeList.CrearBanda(Titulo: String) : TcxTreeListBand;
var
  band: TcxTreeListBand;
begin
  band := self.Bands.Add();
  band.Caption.Text := Titulo;
  result := band;
end;

procedure TjktDBTreeList.Loaded;
begin
  inherited Loaded;
  Self.RestoreFromRegistry('\Software\Jakarta\FormatoGrilla\' +
    Self.Owner.ClassName + '_' + Self.Name);
end;

function TjktDBTreeList.CrearColumn(aCaption   : String;
                                    aFieldName : String;
                                    aTipo      : String;
                                    aBand      : TcxTreeListBand;
                                    aAncho : integer = 100;
                                    aAlingTitulo : TAlignment = taCenter;
                                    aSummaryFooterType   : TcxSummaryKind = skNone;
                                    aSummaryFooterFormat : String = '';
                                    aColor     : TColor = clWindow
                                    ) : TcxDBTreeListColumn;
var
  column : TcxDBTreeListColumn;
  SummaryItem: TcxTreeListSummaryItem;
begin
  column := TcxDBTreeListColumn(self.CreateColumn(aBand));

  // Unlike the previous version of the grid control, ExpressQuantumGrid4 does not
  // provide different column types. Instead, you should use the item's properties
  // (RepositoryItem or PropertiesClass) to specify the editor type used to edit
  // the item's data.

  // An item linked to a dataset field in a data-aware View is automatically
  // assigned a default editor according to the field type. For instance, if an
  // item is linked to a Boolean field, a check box (TcxCheckBox) is used to edit
  // the column's values.

{
  if (aTipo=TjktDBTreeList.TIPO_COL_CHECKBOX())
     then column.Properties := TdxDBGridCheckColumn;  // TcxEditRepositoryCheckBoxItem
  if (aTipo=TjktDBTreeList.TIPO_COL_MASCARA)
     then column.Properties := TdxDBGridMaskColumn;   // TcxEditRepositoryMaskItem
  if (aTipo=TjktDBTreeList.TIPO_BUT_COLUMN)
     then column.Properties := TdxDBGridButtonColumn; // TcxEditRepositoryButtonItem
  if (aTipo=TjktDBTreeList.TIPO_COL_MEMO)
     then column.Properties := TdxDBGridBlobColumn;   // TcxEditRepositoryBlobItem
  if (aTipo=TjktDBTreeList.TIPO_COL_DATE)
     then column.Properties := TdxDBGridDateColumn;   // TcxEditRepositoryDateItem
  if (aTipo=TjktDBTreeList.TIPO_COL_ESTANDAR)
     then column.Properties := TdxDBGridColumn;       // TcxEditRepositoryTextItem
  if (aTipo=TjktDBTreeList.TIPO_READONLY)
     then begin
            column.Properties := TdxDBGridColumn;     // TcxEditRepositoryTextItem
            column.DisableEditor := True;
            column.TabStop       := False;
          end;
}
  column.DataBinding.FieldName := aFieldName;
  column.Caption.Text := aCaption;
  column.Caption.AlignHorz := aAlingTitulo;
  column.Visible := True;
  column.Width := aAncho;
  // column.Color := aColor;
  // (Lo mejor seria que nos envien por parametro el Style que quieren usar para
  //  el Content, Footer y Header!)
  column.Styles.Content := nil; // aColor;
  column.Styles.Footer  := nil; // aColor;
  column.Styles.Header  := nil; // aColor;

  // SummaryFooterType   := aSummaryFooterType;
  SummaryItem := column.Summary.FooterSummaryItems.Add;
  SummaryItem.Kind := aSummaryFooterType;
  SummaryItem.Format := aSummaryFooterFormat;

  Result := column;
end;

class function TjktDBTreeList.TIPO_COL_ESTANDAR() : string;
begin
  result := 'tipo_col_estandar';
end;

class function TjktDBTreeList.TIPO_COL_CHECKBOX() : string;
begin
  result := 'tipo_col_checkbox';
end;

class function TjktDBTreeList.TIPO_COL_MASCARA() : string;
begin
  result := 'tipo_col_mascara';
end;

class function TjktDBTreeList.TIPO_BUT_COLUMN() : string;
begin
  result := 'tipo_col_button';
end;

class function TjktDBTreeList.TIPO_READONLY() : string;
begin
  result := 'tipo_readonly';
end;

class function TjktDBTreeList.TIPO_COL_MEMO() : string;
begin
  result := 'tipo_col_memo';
end;

class function TjktDBTreeList.TIPO_COL_DATE() : string;
begin
  result := 'tipo_col_date';
end;


end.
