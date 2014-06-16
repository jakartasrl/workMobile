unit jktCMet008;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxCntner, dxTL, dxDBCtrl, dxDBGrid , dxGrClms;

type
  TjktExpDBGrid = class(TdxDBGrid)
  private
    { Private declarations }
    FListaCampos  : TList;
    FListaSummary : TList;
    SumGroup      : TdxDBGridSummaryGroup;
    SumItem       : TdxDBGridSummaryItem;
  protected
    { Protected declarations }
  public
    { Public declarations }
    destructor Destroy(); override;
    function CrearColumn(aCaption   : String;
                         aFieldName : String;
                         aTipo      : String;
                         aBand      : TdxTreeListBand;
                         aAncho     : integer = 100;
                         aAlingTitulo : TAlignment = taCenter;
                         aSummaryFooterType   : TdxSummaryType = cstNone;
                         aSummaryFooterFormat : String = '';
                         aColor     : TColor = clWindow) : TdxDBTreeListColumn; overload;

    function CrearColumn(aCaption   : String;
                         aFieldName : String;
                         aTipo      : String) : TdxDBTreeListColumn; overload;

    class function TIPO_COL_ESTANDAR() : string;
    class function TIPO_COL_CHECKBOX() : string;
    class function TIPO_COL_MASCARA() : string;
    class function TIPO_BUT_COLUMN() : string;
    class function TIPO_READONLY() : string;
    class function TIPO_COL_MEMO() : string;
    class function TIPO_COL_DATE() : string;
    function CrearBanda(Titulo: String) : TdxTreeListBand;
    procedure BorrarConfig ();
    procedure MostrarOcultarGroupPanel ();
    procedure MostrarOcultarBandas ();
    procedure MostrarOcultarSummaryFooter ();
    procedure MostrarOcultarFiltro ();
    procedure Loaded; override;
    procedure AddColumnaAgrupada(aColumna : TdxDBTreeListColumn);
    procedure AddColumnaSummary(aColumna : TdxDBTreeListColumn);
    procedure CrearConfigGrilla;
  published
    { Published declarations }
  end;

procedure Register;

implementation


destructor TjktExpDBGrid.Destroy();
begin
  if (FListaCampos <> nil)
     then FListaCampos.Clear;
  FListaCampos.Free;
  if (FListaSummary <> nil)
     then FListaSummary.Clear;
  FListaSummary.Free;
  inherited Destroy();
end;

procedure TjktExpDBGrid.Loaded;
begin
  inherited Loaded;
  Self.LoadFromRegistry('\Software\Jakarta\FormatoGrilla\'+self.Owner.ClassName+'_'+self.Name);
end;

function TjktExpDBGrid.CrearColumn(aCaption   : String;
                                   aFieldName : String;
                                   aTipo      : String;
                                   aBand      : TdxTreeListBand;
                                   aAncho : integer = 100;
                                   aAlingTitulo : TAlignment = taCenter;
                                   aSummaryFooterType   : TdxSummaryType = cstNone;
                                   aSummaryFooterFormat : String = '';
                                   aColor     : TColor = clWindow
                                   ) : TdxDBTreeListColumn;
var
  column : TdxDBTreeListColumn;
begin
  if (aTipo=TjktExpDBGrid.TIPO_COL_CHECKBOX())
     then column := self.CreateColumn(TdxDBGridCheckColumn);
  if (aTipo=TjktExpDBGrid.TIPO_COL_MASCARA)
     then column := self.CreateColumn(TdxDBGridMaskColumn);
  if (aTipo=TjktExpDBGrid.TIPO_BUT_COLUMN)
     then column := self.CreateColumn(TdxDBGridButtonColumn);
  if (aTipo=TjktExpDBGrid.TIPO_COL_MEMO)
     then column := self.CreateColumn(TdxDBGridBlobColumn);
  if (aTipo=TjktExpDBGrid.TIPO_COL_DATE)
     then column := self.CreateColumn(TdxDBGridDateColumn);
  if (aTipo=TjktExpDBGrid.TIPO_COL_ESTANDAR)
     then column := self.CreateColumn(TdxDBGridColumn);
  if (aTipo=TjktExpDBGrid.TIPO_READONLY)
     then begin
            column := Self.CreateColumn(TdxDBGridColumn);
            column.DisableEditor := True;
            column.TabStop       := False;
          end;

   column.Caption := aCaption;
   TdxDBTreeListColumn(column).FieldName := aFieldName;
   TdxDBTreeListColumn(column).Visible := True;
   if (aBand<>nil)
     then TdxDBTreeListColumn(column).BandIndex := aBand.Index;
   TdxDBTreeListColumn(column).Width := aAncho;
   TdxDBTreeListColumn(column).HeaderAlignment := aAlingTitulo;
   TdxDBTreeListColumn(column).Color := aColor;
   TdxDBTreeListColumn(column).SummaryFooterType   := aSummaryFooterType;
   TdxDBTreeListColumn(column).SummaryFooterFormat := aSummaryFooterFormat;

   result := column;
end;

function TjktExpDBGrid.CrearColumn(aCaption   : String;
                                   aFieldName : String;
                                   aTipo      : String) : TdxDBTreeListColumn;
begin
  result := CrearColumn(aCaption ,
                        aFieldName,
                        aTipo,
                        nil);
end;

function TjktExpDBGrid.CrearBanda(Titulo: String) : TdxTreeListBand;
var
  band: TdxTreeListBand;
begin
  band := self.Bands.Add();
  band.Caption := Titulo;
  result := band;
end;


class function TjktExpDBGrid.TIPO_COL_ESTANDAR() : string;
begin
  result := 'tipo_col_estandar';
end;

class function TjktExpDBGrid.TIPO_COL_CHECKBOX() : string;
begin
  result := 'tipo_col_checkbox';
end;

class function TjktExpDBGrid.TIPO_COL_MASCARA() : string;
begin
  result := 'tipo_col_mascara';
end;

class function TjktExpDBGrid.TIPO_BUT_COLUMN() : string;
begin
  result := 'tipo_col_button';
end;

class function TjktExpDBGrid.TIPO_READONLY() : string;
begin
  result := 'tipo_readonly';
end;

class function TjktExpDBGrid.TIPO_COL_MEMO() : string;
begin
  result := 'tipo_col_memo';
end;

class function TjktExpDBGrid.TIPO_COL_DATE() : string;
begin
  result := 'tipo_col_date';
end;

procedure TjktExpDBGrid.BorrarConfig ();
begin
  Self.ClearGroupColumns;
  Self.DestroyColumns;
  Self.Bands.Clear;

  if (FListaCampos <> nil)
     then FListaCampos.Clear;
  FListaCampos.Free;

  FListaCampos := TList.Create;

  if (FListaSummary <> nil)
     then FListaSummary.Clear;
  FListaSummary.Free;

  FListaSummary := TList.Create;

end;

procedure TjktExpDBGrid.MostrarOcultarGroupPanel ();
begin
  if (Self.ShowGroupPanel)
     then Self.ShowGroupPanel := False
     else Self.ShowGroupPanel := True;
end;

procedure TjktExpDBGrid.MostrarOcultarBandas ();
begin
  if (Self.ShowBands)
     then Self.ShowBands := False
     else Self.ShowBands := True;
end;

procedure TjktExpDBGrid.MostrarOcultarSummaryFooter ();
begin
  if (Self.ShowSummaryFooter)
     then Self.ShowSummaryFooter := False
     else Self.ShowSummaryFooter := True;
end;

procedure TjktExpDBGrid.MostrarOcultarFiltro ();
begin
  if (Self.Filter.Active)
     then Self.Filter.Active := False
     else Self.Filter.Active := True;
end;

procedure TjktExpDBGrid.AddColumnaAgrupada(aColumna : TdxDBTreeListColumn);
begin
  FListaCampos.Add( aColumna );
end;


procedure TjktExpDBGrid.AddColumnaSummary(aColumna : TdxDBTreeListColumn);
begin
  FListaSummary.Add( aColumna );
end;


procedure TjktExpDBGrid.CrearConfigGrilla;
var
  idx : Integer;
  col : TdxDBTreeListColumn;
begin

  if (FListaCampos = nil)
     then raise Exception.Create('Primero debe borrar la configuracion de la Grilla. TjktExpDBGrid');

  // Crea los campos en el DataSet
  for idx := 0 to FListaCampos.count - 1 do
     begin
       col := TdxDBTreeListColumn( FListaCampos.Items[idx] );
       Self.AddGroupColumn(col);
     end;

  if (FListaSummary = nil)
     then raise Exception.Create('Primero debe borrar la configuracion de la Grilla. TjktExpDBGrid');

  // Summary Group
  SumGroup := Self.SummaryGroups.Add;
  SumGroup.DefaultGroup := False;

  // Crea los campos en el DataSet
  for idx := 0 to FListaSummary.count - 1 do
     begin
       col := TdxDBTreeListColumn( FListaSummary.Items[idx] );

       SumItem := SumGroup.SummaryItems.Add;
       SumItem.ColumnName    := col.Name;
       SumItem.SummaryField  := col.Field.AsString;
       SumItem.SummaryFormat := '###,###,###,##0';
       SumItem.SummaryType   := cstSum;
     end;

end;

procedure Register;
begin
  RegisterComponents('Jakarta', [TjktExpDBGrid]);
end;

end.
