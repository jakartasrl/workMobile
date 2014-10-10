unit jktCNMet0008;

interface

uses
  DB, cxGrid, cxGridDBTableView, cxGridCustomTableView, cxCustomData, Classes;
  // dxDBGridTypes;

type
  // creamos la correspondencia de los tipos de datos viejos con los nuevos de TcxGrid
  TdxDBGridMaskColumn = TcxGridDBColumn;
  TdxDBGridColumn = TcxGridDBColumn;
  TdxDBGridCurrencyColumn = TcxGridDBColumn;

  TdxDBGridSummaryGroup = TcxDataGroupSummaryItems;
  TdxDBGridSummaryItem = TcxDataFooterSummaryItems;

//  TjktExpDBGrid = class(TdxDBGrid)
  TjktExpDBGrid = class(TcxGrid)
  private
    // FBands: TdxTreeListBands;
    FKeyFieldName: string;

    // campos private del TjktExpDBGrid obsoleto (quien hereda de TdxDBGrid)
    FListaCampos  : TList;
    FListaSummary : TList;
    SumGroup      : TdxDBGridSummaryGroup;
    SumItem       : TdxDBGridSummaryItem;
    // fin de campos private del TjktExpDBGrid obsoleto (quien hereda de TdxDBGrid)

    // procedure SetBands(Value: TdxTreeListBands);
    procedure SetDataSource(aValue: TDataSource);
    procedure SetKeyFieldName(const Value: string);

    function GetDataSource: TDataSource;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;

    procedure GotoFirst;

{
    // metodos publicos del TjktExpDBGrid obsoleto (quien hereda de TdxDBGrid)

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

    // fin de metodos publicos del TjktExpDBGrid obsoleto (quien hereda de TdxDBGrid)
}

  published
    // property Bands: TdxTreeListBands read FBands write SetBands;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property KeyField: string read FKeyFieldName write SetKeyFieldName;

  end;


procedure Register;

implementation

{ TjktExpDBGrid }

{
procedure TjktExpDBGrid.AddColumnaAgrupada(aColumna: TdxDBTreeListColumn);
begin
  FListaCampos.Add( aColumna );
end;

procedure TjktExpDBGrid.AddColumnaSummary(aColumna: TdxDBTreeListColumn);
begin
  FListaSummary.Add( aColumna );
end;

procedure TjktExpDBGrid.BorrarConfig;
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

function TjktExpDBGrid.CrearBanda(Titulo: String): TdxTreeListBand;
var
  band: TdxTreeListBand;
begin
  band := self.Bands.Add();
  band.Caption := Titulo;
  result := band;
end;

function TjktExpDBGrid.CrearColumn(aCaption,
                                   aFieldName,
                                   aTipo: String): TdxDBTreeListColumn;
begin
  result := CrearColumn(aCaption ,
                        aFieldName,
                        aTipo,
                        nil);
end;

function TjktExpDBGrid.CrearColumn(aCaption, aFieldName, aTipo: String;
  aBand: TdxTreeListBand; aAncho: integer; aAlingTitulo: TAlignment;
  aSummaryFooterType: TdxSummaryType; aSummaryFooterFormat: String;
  aColor: TColor): TdxDBTreeListColumn;
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

procedure TjktExpDBGrid.Loaded;
begin
  inherited;
  Self.LoadFromRegistry('\Software\Jakarta\FormatoGrilla\'+self.Owner.ClassName+'_'+self.Name);
end;

procedure TjktExpDBGrid.MostrarOcultarBandas;
begin
  if (Self.ShowBands)
     then Self.ShowBands := False
     else Self.ShowBands := True;
end;

procedure TjktExpDBGrid.MostrarOcultarFiltro;
begin
  if (Self.Filter.Active)
     then Self.Filter.Active := False
     else Self.Filter.Active := True;
end;

procedure TjktExpDBGrid.MostrarOcultarGroupPanel;
begin
  if (Self.ShowGroupPanel)
     then Self.ShowGroupPanel := False
     else Self.ShowGroupPanel := True;
end;

procedure TjktExpDBGrid.MostrarOcultarSummaryFooter;
begin
  if (Self.ShowSummaryFooter)
     then Self.ShowSummaryFooter := False
     else Self.ShowSummaryFooter := True;
end;

class function TjktExpDBGrid.TIPO_BUT_COLUMN: string;
begin

end;

class function TjktExpDBGrid.TIPO_COL_CHECKBOX: string;
begin

end;

class function TjktExpDBGrid.TIPO_COL_DATE: string;
begin

end;

class function TjktExpDBGrid.TIPO_COL_ESTANDAR: string;
begin

end;

class function TjktExpDBGrid.TIPO_COL_MASCARA: string;
begin

end;

class function TjktExpDBGrid.TIPO_COL_MEMO: string;
begin

end;

class function TjktExpDBGrid.TIPO_READONLY: string;
begin

end;

}

constructor  TjktExpDBGrid.Create(AOwner: TComponent);
begin
  inherited;

end;

destructor TjktExpDBGrid.Destroy;
begin
  if (FListaCampos <> nil)
     then FListaCampos.Clear;
  FListaCampos.Free;
  if (FListaSummary <> nil)
     then FListaSummary.Clear;
  FListaSummary.Free;

  inherited;
end;

function TjktExpDBGrid.GetDataSource: TDataSource;
begin
  // Debemos machear con la property 'DataController.DataSource' de la vista
  // Por defecto se crea un nivel con una vista asociada! Por lo tanto, debería estar.
  if (Levels.Count > 0) then
    if (Levels.Items[0].GridView is TcxGridDBTableView) then
      Result := TcxGridDBTableView(Levels.Items[0].GridView).DataController.DataSource
    else
      Result := nil
  else
    Result := nil;
end;

procedure TjktExpDBGrid.GotoFirst;
begin
//  GotoNodeByNavigation(tlnmFirst, False);

  // equivalent with the View's Controller.GoToFirst method!
  // The grid's root level can be accessed via the Levels property
  // This root level is not used for display purposes and doesn't have an
  // associated grid View.
  TcxCustomGridTableView(Levels.Items[0].GridView).Controller.GoToFirst;
end;

{
procedure TjktExpDBGrid.SetBands(Value: TdxTreeListBands);
begin
  Bands.Assign(Value);
end;
}

procedure TjktExpDBGrid.SetDataSource(aValue: TDataSource);
begin
  // The grid's root level can be accessed via the Levels property.
  // This root level is not used for display purposes and doesn't have an associated grid View

  // Por defecto se crea un nivel con una vista asociada! Por lo tanto, debería estar.
{
  with (Levels.Items[0].GridView as TcxGridDBTableView) do begin
    if not assigned(DataController.DataSource) then
      DataController.DataSource := FDataSource;
  end;
}
end;

procedure TjktExpDBGrid.SetKeyFieldName(const Value: string);
begin
  if FKeyFieldName <> Value then
  begin
    FKeyFieldName := Value;
    { TODO : buscar correspondencia con la nueva grilla }
//    LinkActive(DataLink.Active);
//    View.DataController.KeyFieldNames := ???     Specifies one or more key field names separated by a semicolon.
  end;
end;

procedure Register;
begin
  RegisterComponents('Jakarta', [TjktExpDBGrid]);
end;


end.
