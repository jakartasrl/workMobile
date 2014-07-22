unit jktCNMet0012;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, kbmMemTable;

type

  TjktMemTable = class(TkbmMemTable)
  private
    { Private declarations }
    fMensajeErrorClaveDuplicada : string ;
    FNoAutoEditarCabecera : Boolean ;
    FListaCampos  : TList;
    FListaIndices : TList;
    FListaMaster  : TList;
    procedure onPostErrorDataSet(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure AutoEditarCabecera();
  protected
    { Protected declarations }
    procedure onEventoBeforeEdit(DataSet: TDataSet);
    procedure onEventoBeforeInsert(DataSet: TDataSet);
  public
    { Public declarations }
    constructor Create(AOwner : TComponent); override;
    destructor Destroy(); override;
    procedure BajaLogica();
    procedure Rehabilitar();
    procedure Inicializar;
    procedure Editar;
    procedure Postear;
    function isEditando : Boolean;
    procedure BorrarConfigTabla;
    procedure AddCampoInteger(aName : String; aOnChange : TFieldNotifyEvent = nil; aOnValidate : TFieldNotifyEvent = nil; aTag : Integer = 0; aFormat : String = '');
    procedure AddCampoString(aName : String; aSize : Integer; aOnChange : TFieldNotifyEvent = nil; aOnValidate : TFieldNotifyEvent = nil; aTag : Integer = 0);
    procedure AddCampoBoolean(aName : String; aOnChange : TFieldNotifyEvent = nil; aOnValidate : TFieldNotifyEvent = nil; aTag : Integer = 0);
    procedure AddCampoCurrency(aName : String; aFormat : String; aOnChange : TFieldNotifyEvent = nil; aOnValidate : TFieldNotifyEvent = nil; aTag : Integer = 0);
    procedure AddCampoFloat(aName : String; aFormat : String; aOnChange : TFieldNotifyEvent = nil; aOnValidate : TFieldNotifyEvent = nil; aTag : Integer = 0);
    procedure AddCampoFecha(aName : String; aOnChange : TFieldNotifyEvent = nil; aOnValidate : TFieldNotifyEvent = nil; aTag : Integer = 0);
    procedure AddCalculatedCurrency(aName : String; aFormat : String; aTag : Integer = 0);
    procedure AddIndice(aName : String; aFields : String);
    procedure AddIndiceUnique(aName : String; aFields : String);
    procedure SetMasterSource(aIndexFieldName : String; aMasterField : String; aMasterSource : TDataSource);
    procedure CrearConfigTabla;
  published
    { Published declarations }
    property MensajeErrorClaveDuplicada : String read fMensajeErrorClaveDuplicada write fMensajeErrorClaveDuplicada;
    property NoAutoEditarCabecera : Boolean read FNoAutoEditarCabecera write FNoAutoEditarCabecera default False;
  end;

type

  TjktCampo = class(TComponent)
    private
      FNombre     : String;
      FSize       : Integer;
      FTipo       : TFieldType;
      FFormato    : String;
      FOnChange   : TFieldNotifyEvent;
      FOnValidate : TFieldNotifyEvent;
      FTag        : Integer;
      FKind       : TFieldKind;

    protected

    public
      constructor Nuevo(aOwner : TComponent; aNombre : String; aSize : Integer; aTipo : TFieldType ; aFormato : String; aOnChange : TFieldNotifyEvent; aOnValidate : TFieldNotifyEvent; aTag : Integer; aKind : TFieldKind = fkData);
      destructor Destroy(); override;
      property Nombre     : String       read FNombre     write FNombre;
      property Size       : Integer      read FSize       write FSize;
      property Tipo       : TFieldType   read FTipo       write FTipo;
      property Formato    : String       read FFormato    write FFormato;
      property OnChange   : TFieldNotifyEvent read FOnChange   write FOnChange;
      property OnValidate : TFieldNotifyEvent read FOnValidate write FOnValidate;
      property Tag        : Integer      read FTag        write FTag;
      property Kind       : TFieldKind   read FKind       write FKind;
  end;

procedure Register;

implementation

constructor TjktCampo.Nuevo(aOwner : TComponent; aNombre : String; aSize : Integer; aTipo : TFieldType ; aFormato : String; aOnChange : TFieldNotifyEvent; aOnValidate : TFieldNotifyEvent; aTag : Integer; aKind : TFieldKind = fkData);
begin
   inherited Create(aOwner);
   FNombre     := aNombre;
   FSize       := aSize;
   FTipo       := aTipo;
   FFormato    := aFormato;
   FOnChange   := aOnChange;
   FOnValidate := aOnValidate;
   FTag        := aTag;
   FKind       := aKind;
end;

destructor TjktCampo.Destroy();
begin
  FOnChange   := nil;
  FOnValidate := nil;
  inherited Destroy();
end;


type
  TjktIndice = class(TComponent)
    private
      FNombre     : String;
      FCampos     : String;
      FOpciones   : TIndexOptions;
    protected
    public
      constructor Nuevo(aOwner : TComponent; aNombre : String; aCampos : String; aOpciones : TIndexOptions);
      property Nombre   : String         read FNombre    write FNombre;
      property Campos   : String         read FCampos    write FCampos;
      property Opciones : TIndexOptions  read FOpciones  write FOpciones;
end;

constructor TjktIndice.Nuevo(aOwner : TComponent; aNombre : String; aCampos : String; aOpciones : TIndexOptions);
begin
   inherited Create(aOwner);
   FNombre   := aNombre;
   FCampos   := aCampos;
   FOpciones := aOpciones;
end;

type
  TjktMasterSource = class(TComponent)
    private
      FIndexFieldName : String;
      FMasterField    : String;
      FMasterSource   : TDataSource;
    protected
    public
      constructor Nuevo(aOwner : TComponent; aIndexFieldName : String; aMasterField : String; aMasterSource : TDataSource);
      property IndexFieldName : String      read FIndexFieldName write FIndexFieldName;
      property MasterField    : String      read FMasterField    write FMasterField;
      property MasterSource   : TDataSource read FMasterSource   write FMasterSource;
end;

constructor TjktMasterSource.Nuevo(aOwner : TComponent; aIndexFieldName : String; aMasterField : String; aMasterSource : TDataSource);
begin
   inherited Create(aOwner);
   FIndexFieldName := aIndexFieldName;
   FMasterField    := aMasterField;
   FMasterSource   := aMasterSource;
end;

constructor TjktMemTable.Create(AOwner : TComponent);
begin
  inherited Create(AOWner);
  OnPostError           := onPostErrorDataSet;
  BeforeEdit            := onEventoBeforeEdit;
  BeforeInsert          := onEventoBeforeInsert;
  EnableVersioning      := True;
end;

destructor TjktMemTable.Destroy();
var
  i: integer;
begin
  if (FListaCampos <> nil)
     then begin
           for i:=0 to FListaCampos.Count - 1 do
              begin
                 if (FListaCampos.Items[i] <> nil)
                 then TjktCampo(FListaCampos.Items[i]).free;
                // TjktCampo(FListaCampos.Items[i]).free;
              end;
           FListaCampos.Clear;
           FListaCampos.Free;
           FListaCampos := nil;
          end;

  if (FListaIndices <> nil)
     then begin
           for i:=0 to FListaIndices.Count - 1 do
              begin
                 TjktIndice(FListaIndices.Items[i]).free;
              end;
              FListaIndices.Clear;
              FListaIndices.Free;
              FListaIndices := nil;
          end;

  if (FListaMaster <> nil)
     then  begin
            for i:=0 to FListaMaster.Count - 1 do
              begin
                 TjktMasterSource(FListaMaster.Items[i]).free;
              end;
            FListaMaster.Clear;
            FListaMaster.Free;
            FListaMaster := nil;
           end;
  inherited Destroy();
end;

procedure TjktMemTable.BajaLogica();
begin
  if (not self.Active) then Exit;
{
  if (self.State in [dsEdit,dsInsert])
      then begin
           self.Cancel;
           exit;
           end;
}
  if (self.IsEmpty) then Exit;

  if (self.FieldByName('new').AsBoolean = true)
     then self.delete
     else begin
          if (not (self.State in [dsEdit,dsInsert]))
             then self.Edit;
          self.FieldByName('Activo').AsBoolean := False;
          end;
end;

procedure TjktMemTable.Rehabilitar();
begin
  if (not self.Active) then Exit;
  if (self.IsEmpty) then Exit;
  if (not (self.State in [dsEdit,dsInsert]))
     then self.Edit;
  self.FieldByName('Activo').AsBoolean := True;
end;

procedure TjktMemTable.onPostErrorDataSet(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
   if (E.ClassName = 'EMemTableDupKey' )
     then E.Message := fMensajeErrorClaveDuplicada;
end;

procedure TjktMemTable.onEventoBeforeEdit(DataSet: TDataSet);
begin
  AutoEditarCabecera();
end;

procedure TjktMemTable.onEventoBeforeInsert(DataSet: TDataSet);
begin
  AutoEditarCabecera();
end;

procedure TjktMemTable.AutoEditarCabecera();
begin
  //Esto es para solucionar el problema del movimiento al querer editar un registro
  // la primera vez. La primer solucion fue por el modif en el OnChange.
  if (FNoAutoEditarCabecera = False)
     then begin
            if (not Assigned(self.MasterSource)) then Exit;
            if (not Assigned(self.MasterSource.DataSet)) then Exit;
            if (not (self.MasterSource.DataSet.State in [dsEdit,dsInsert]))
               then self.MasterSource.DataSet.Edit;
          end;
end;

procedure TjktMemTable.Inicializar;
begin
  if (Self.Active)
     then Self.Close;
  Self.Open;   
end;

procedure TjktMemTable.Editar;
begin
  if (not (self.State in [dsEdit,dsInsert]))
     then self.Edit;
end;

function TjktMemTable.isEditando : Boolean;
begin
  result := False;
  if ( Self.Active )
 and ( Self.State in [dsEdit,dsInsert] )
     then result := True;
end;

procedure TjktMemTable.Postear;
begin
  if ( Self.Active )
 and ( Self.State in [dsEdit,dsInsert] )
     then Self.Post;
end;


procedure TjktMemTable.BorrarConfigTabla;
var
  i :integer;
begin

  Self.FieldDefs.Clear;
  Self.IndexDefs.Clear;

   if (FListaCampos <> nil)
     then begin
           for i:=0 to FListaCampos.Count - 1 do
              begin
                 TjktCampo(FListaCampos.Items[i]).free;
              end;
           FListaCampos.Clear;
           FListaCampos.Free;
           FListaCampos := nil;
          end;

  if (FListaIndices <> nil)
     then begin
           for i:=0 to FListaIndices.Count - 1 do
              begin
                 TjktIndice(FListaIndices.Items[i]).free;
              end;
              FListaIndices.Clear;
              FListaIndices.Free;
              FListaIndices := nil;
          end;

  if (FListaMaster <> nil)
     then  begin
            for i:=0 to FListaMaster.Count - 1 do
              begin
                 TjktMasterSource(FListaMaster.Items[i]).free;
              end;
            FListaMaster.Clear;
            FListaMaster.Free;
            FListaMaster := nil;
           end;


  FListaCampos  := TList.Create;
  FListaIndices := TList.Create;
  FListaMaster  := TList.Create;
end;

procedure TjktMemTable.AddCampoInteger(aName : String; aOnChange : TFieldNotifyEvent = nil; aOnValidate : TFieldNotifyEvent = nil; aTag : Integer = 0; aFormat : String = '' );
begin
  FListaCampos.Add( TjktCampo.Nuevo(Self, aName, 0, ftInteger, aFormat, aOnChange, aOnValidate, aTag) );
end;

procedure TjktMemTable.AddCampoFecha(aName : String; aOnChange : TFieldNotifyEvent = nil; aOnValidate : TFieldNotifyEvent = nil; aTag : Integer = 0);
begin
  FListaCampos.Add(TjktCampo.Nuevo(Self, aName, 0, ftDate, '', aOnChange, aOnValidate, aTag));
end;

procedure TjktMemTable.AddCampoString(aName : String; aSize : Integer; aOnChange : TFieldNotifyEvent = nil; aOnValidate : TFieldNotifyEvent = nil; aTag : Integer = 0);
begin
  FListaCampos.Add(TjktCampo.Nuevo(Self, aName, aSize, ftString, '', aOnChange, aOnValidate, aTag));
end;

procedure TjktMemTable.AddCampoBoolean(aName : String; aOnChange : TFieldNotifyEvent = nil; aOnValidate : TFieldNotifyEvent = nil; aTag : Integer = 0);
begin
  FListaCampos.Add(TjktCampo.Nuevo(Self, aName, 0, ftBoolean, '', aOnChange, aOnValidate, aTag));
end;

procedure TjktMemTable.AddCampoCurrency(aName : String; aFormat : String; aOnChange : TFieldNotifyEvent = nil; aOnValidate : TFieldNotifyEvent = nil; aTag : Integer = 0);
begin
  FListaCampos.Add(TjktCampo.Nuevo(Self, aName, 0, ftCurrency, aFormat, aOnChange, aOnValidate, aTag));
end;

procedure TjktMemTable.AddCalculatedCurrency(aName : String; aFormat : String; aTag : Integer = 0);
begin
  FListaCampos.Add(TjktCampo.Nuevo(Self, aName, 0, ftCurrency, aFormat, nil, nil, aTag, fkCalculated));
end;

procedure TjktMemTable.AddCampoFloat(aName : String; aFormat : String; aOnChange : TFieldNotifyEvent = nil; aOnValidate : TFieldNotifyEvent = nil; aTag : Integer = 0);
begin
  FListaCampos.Add(TjktCampo.Nuevo(Self, aName, 0, ftFloat, aFormat, aOnChange, aOnValidate, aTag));
end;

procedure TjktMemTable.AddIndice(aName : String; aFields : String);
begin
  FListaIndices.Add(TjktIndice.Nuevo(Self, aName, aFields, []));
end;

procedure TjktMemTable.AddIndiceUnique(aName : String; aFields : String);
begin
  FListaIndices.Add(TjktIndice.Nuevo(Self, aName, aFields, [ixUnique]));
end;

procedure TjktMemTable.SetMasterSource(aIndexFieldName : String; aMasterField : String; aMasterSource : TDataSource);
begin
  if (FListaMaster.Count = 0)
     then FListaMaster.Add(TjktMasterSource.Nuevo(Self, aIndexFieldName, aMasterField, aMasterSource));
end;

procedure TjktMemTable.CrearConfigTabla;
var
  idx : Integer;
  cpo : TjktCampo;
  ind : TjktIndice;
  mae : TjktMasterSource;
begin

  if (FListaCampos = nil)
     then raise Exception.Create('Primero debe limpiar la tabla. TjktMemTable');

  // Crea los campos en el DataSet
  for idx := 0 to FListaCampos.count - 1 do
     begin
       cpo := TjktCampo(FListaCampos.Items[idx]);
       Self.FieldDefs.Add( cpo.FNombre, cpo.FTipo, cpo.FSize, false );
     end;

  // Crea los Indices en el DataSet
  for idx := 0 to FListaIndices.count - 1 do
     begin
       ind := TjktIndice(FListaIndices.Items[idx]);
       Self.IndexDefs.Add( ind.FNombre, ind.FCampos, ind.FOpciones);
     end;

  // Crea los campos "fisicamente"
  Self.CreateTable;

  // Asigna Formatos y Eventos.
  for idx := 0 to FListaCampos.count - 1 do
     begin
       cpo := TjktCampo(FListaCampos.Items[idx]);

       Self.FieldByName(cpo.FNombre).FieldKind := cpo.Kind;
       Self.FieldByName(cpo.FNombre).Tag       := cpo.Tag;

       if (cpo.Formato <> '')
          then TNumericField( Self.FieldByName(cpo.FNombre) ).DisplayFormat := cpo.Formato;

       if Assigned(cpo.OnChange)
          then Self.FieldByName(cpo.FNombre).OnChange   := cpo.OnChange;

       if Assigned(cpo.OnValidate)
          then Self.FieldByName(cpo.FNombre).OnValidate := cpo.OnValidate;
     end;

  // Asigna el Master Source
  for idx := 0 to FListaMaster.count - 1 do
     begin
       mae := TjktMasterSource(FListaMaster.Items[idx]);
       Self.IndexFieldNames := mae.IndexFieldName;
       Self.MasterFields    := mae.MasterField;
       Self.MasterSource    := mae.MasterSource;
     end;

end;


procedure Register;
begin
  RegisterComponents('Jakarta', [TjktMemTable]);
end;



end.
