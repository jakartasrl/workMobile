unit jktCMet011;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs ,
  jktCMet002 , DB , kbmMemTable;

const
  operExistente   = 'ValidarExistente';
  operInexistente = 'ValidarInexistente';
  operMetaExistente   = 'ValidarMetaClassExistente';
  operMetaInexistente = 'ValidarMetaClassInexistente';

type
  TsetOperacion = (tOperExistente, tOperInexistente);
  TNotifyAcepto = procedure (DataSet : TDataSet) of object;

  TjktValidador = class(TComponent)
  private
    { Private declarations }
    FTempMemTable : TkbmMemTable;
    FClasificador : Boolean;
    FOSName     : string;
    FComponente : string;
    FOperacion : TjktOperacion;
    FAsignarToFieldOid : TField;
    FAsignarToFieldDesc : TField;
    FRaiseExceptionNotFound : Boolean;
    FMessageExceptionNotFound : String;
    FOid : integer;
    FCodigo : String;
    FDescripcion : String;
    FSetOperacion : TsetOperacion;
    FNroQuery : Integer;
    FListaParametros : TStringList;
    FListaValoresParam : TStringList;
    FNotifyAcepto : TNotifyAcepto;
    FNombreOperValExistente : string;
    FNombreOperValInexistente : string;
    procedure setAsignarValorOid(ValorOid : integer ; Campo : TField);
    procedure setAsignarValorDesc(ValorDesc : string ; Campo : TField);
    procedure TraerDataSetByCodigo(codigo : string);
    function procesarDataSet() : boolean;
    procedure LimpiarValores();
    procedure cargarParametros(Operacion : TjktOperacion);
    procedure ArmarOperValGenerico(codigo : string);
    procedure ArmarOperValMetaClass(codigo : string);
    function getDescMultiplesRecords() : string;
    function isKeyEnParametros(aKey : String) : Boolean;
  protected
    { Protected declarations }

  public
    { Public declarations }
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function searchByCodigo(Codigo : String) : boolean; overload;
    function searchByCodigo() : boolean; overload;
    property Oid : Integer read fOid write fOid;
    property Codigo : string read fCodigo write fCodigo;
    property Descripcion : string read fDescripcion write fDescripcion;
    property DataSetResult : TkbmMemTable read FTempMemTable write FTempMemTable;
    procedure addParam(nombreAtributo : string ; Valor : string);
    procedure clearParams();
  published
    { Published declarations }
    property OSName : string read FOSName write FOSName;
    property Operacion : TjktOperacion read FOperacion write FOperacion;
    property AsignarToFieldOid : TField read FAsignarToFieldOid write FAsignarToFieldOid;
    property AsignarToFieldDesc : TField read FAsignarToFieldDesc write FAsignarToFieldDesc;
    property RaiseExceptionNotFound : Boolean read FRaiseExceptionNotFound write FRaiseExceptionNotFound default true;
    property MessageExceptionNotFound : string read FMessageExceptionNotFound write FMessageExceptionNotFound;
    property SetOperacion : TsetOperacion read FSetOperacion write FSetOperacion default tOperExistente;
    property NroQuery : Integer read FNroQuery write FNroQuery default 2;
    property Clasificador : Boolean read FClasificador write FClasificador default false;
    property Componente   : String  read FComponente   write FComponente;
    property NotifyAcepto : TNotifyAcepto read FNotifyAcepto write FNotifyAcepto;
    property NombreOperValExistente : string read fNombreOperValExistente write fNombreOperValExistente;
    property NombreOperValInexistente : string read fNombreOperValInexistente write fNombreOperValInexistente;

  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Jakarta', [TjktValidador] );
end;


constructor TjktValidador.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);

  FNroQuery := 2;

  FTempMemTable := TkbmMemTable.Create(Self);
  FTempMemTable.FieldDefs.Add('oid',         ftInteger, 0,  false);
  FTempMemTable.FieldDefs.Add('codigo',      ftString,  50, false);
  FTempMemTable.FieldDefs.Add('descripcion', ftString,  255, false);
// Para no duplicar los nombres de los DataSet.
{$IFDEF PRUEBA}
  FTempMemTable.Name := Self.Name;
{$ELSE}
  FTempMemTable.Name := 'TMemVal' + IntToStr(AOwner.ComponentCount);
{$ENDIF}
  FRaiseExceptionNotFound := True;

  FListaParametros   := TStringList.Create;
  FListaValoresParam := TStringList.Create;
  fNombreOperValExistente := '';
  fNombreOperValInexistente := '';
end;


procedure TjktValidador.TraerDataSetByCodigo(codigo : string);
begin
  FTempMemTable.Close;
  FTempMemTable.Open;

// Para no duplicar los nombres de los DataSet.
{$IFDEF PRUEBA}
  FTempMemTable.Name := Self.Name;
{$ELSE}
//  FTempMemTable.Name := FTempMemTable.Name + FOSName;
{$ENDIF}

  FOperacion.asignarDataSet(FTempMemTable.Name, FTempMemTable);

  FOperacion.InicioOperacion;

  if not FClasificador
     then Self.ArmarOperValGenerico(codigo)
     else Self.ArmarOperValMetaClass(codigo);

  FOperacion.execute;

end;


procedure TjktValidador.ArmarOperValGenerico(codigo : string);
begin

  case FSetOperacion of
    tOperExistente   : begin
                         if (fNombreOperValExistente<>'')
                             then FOperacion.setOperacion(fNombreOperValExistente)
                             else FOperacion.setOperacion(operExistente);
                         FOperacion.addAtribute('validar', 'existente');
                         FOperacion.addAtribute('numQuery', IntToStr(NroQuery));
                       end;
    tOperInexistente : begin
                         if (fNombreOperValInexistente<>'')
                            then FOperacion.setOperacion(fNombreOperValInexistente)
                            else FOperacion.setOperacion(operInexistente);
                         FOperacion.addAtribute('validar', 'inexistente');
                         FOperacion.addAtribute('numQuery', IntToStr(NroQuery));
                       end;
  end;

  cargarParametros(FOperacion);

  FOperacion.addAtribute('OSName',  Self.OSName);

  if not Self.isKeyEnParametros('dataset')
     then FOperacion.addAtribute('dataset', FTempMemTable.Name);

  // Si no hay parametros, envia el codigo
  if (FListaParametros.Count = 0)
     then FOperacion.addAtribute('codigo',  codigo);

  if (FRaiseExceptionNotFound)
    then FOperacion.addAtribute('ExceptionNotFound', 'true')
    else FOperacion.addAtribute('ExceptionNotFound', 'false');

  FOperacion.addAtribute('MensajeExceptionNotFound', FMessageExceptionNotFound);

end;


procedure TjktValidador.ArmarOperValMetaClass(codigo : string);
begin

  case FSetOperacion of
    tOperExistente   : FOperacion.setOperacion(operMetaExistente);
    tOperInexistente : FOperacion.setOperacion(operMetaInexistente);
  end;

  FOperacion.addAtribute('numQuery',IntToStr(NroQuery));

  cargarParametros(FOperacion);

  FOperacion.addAtribute('OSName',            FOSName);
  FOperacion.addAtribute('codigo_componente', FComponente);
  FOperacion.addAtribute('codigo',            codigo);
  FOperacion.addAtribute('dataset',           FTempMemTable.Name);

  if (FRaiseExceptionNotFound)
    then FOperacion.addAtribute('ExceptionNotFound', 'true')
    else FOperacion.addAtribute('ExceptionNotFound', 'false');

  FOperacion.addAtribute('MensajeExceptionNotFound', FMessageExceptionNotFound);

end;


procedure TjktValidador.cargarParametros(Operacion : TjktOperacion);
var
  i : integer;
begin
      for i:=0 to FListaParametros.Count-1 do
    begin
    operacion.addAtribute(
      FListaParametros.Strings[i],
      FListaValoresParam.Strings[i]);
    end;
end;

function TjktValidador.getDescMultiplesRecords() : string;
var
  descripcion : string;
begin
  descripcion := '';

  FTempMemTable.First;
  while (not FTempMemTable.EOF) do
    begin
    if (descripcion = '')
       then descripcion := FTempMemTable.FieldByName('descripcion').AsString
       else descripcion := descripcion + ' , ' + FTempMemTable.FieldByName('descripcion').AsString;
    FTempMemTable.Next;
    end;
  result := descripcion;

end;

function TjktValidador.procesarDataSet() : boolean;
begin
  result := false;
  if (not FTempMemTable.IsEmpty)
     then begin
            FOid         := FTempMemTable.FieldByName('oid').AsInteger;
            FCodigo      := FTempMemTable.FieldByName('codigo').AsString;
            FDescripcion := FTempMemTable.FieldByName('descripcion').AsString;
            Result       := True;

            if Assigned (FAsignarToFieldOid)
               then setAsignarValorOid(FOid, FAsignarToFieldOid);

            if (FTempMemTable.RecordCount>0)
               then begin
                    if Assigned(FNotifyAcepto)
                       then FNotifyAcepto(FTempMemTable);
                    end;


            if Assigned (FAsignarToFieldDesc)
               then begin
                    if (FTempMemTable.RecordCount = 1)
                        then setAsignarValorDesc(FDescripcion, FAsignarToFieldDesc)
                        else setAsignarValorDesc(getDescMultiplesRecords(), FAsignarToFieldDesc);
                    end;
          end

     else begin
            FOid         := 0;
            FCodigo      := '';
            FDescripcion := '';
          end;

end;

procedure TjktValidador.LimpiarValores();
begin
  if Assigned(FAsignarToFieldOid)
     then FAsignarToFieldOid.Clear;
  if Assigned(FAsignarToFieldDesc)
     then FAsignarToFieldDesc.Clear;

  FTempMemTable.Close;
  FTempMemTable.Open;
  
  if Assigned(FNotifyAcepto)
     then FNotifyAcepto(FTempMemTable);

end;

function TjktValidador.searchByCodigo(Codigo : String) : boolean;
begin
  result := False;

  if not Assigned(FOperacion)
     then raise Exception.Create('Falta Asignar la propiedad "Operacion" al Validador ' + Self.Name);

  if (FOperacion.ModoExecute)
     then Exit;

  if (Trim(codigo)<>'')
     then begin
          TraerDataSetByCodigo(codigo);
          result := procesarDataSet();
          end
     else LimpiarValores();
end;

function TjktValidador.searchByCodigo() : boolean;
begin
  result := False;

  if not Assigned(FOperacion)
     then raise Exception.Create('Falta Asignar la propiedad "Operacion" al Validador ' + Self.Name);

  if (FOperacion.ModoExecute)
     then Exit;

  if (FListaParametros.Count <> 0)
     then begin
          TraerDataSetByCodigo('');
          result := procesarDataSet();
          end
     else LimpiarValores();
end;

procedure TjktValidador.setAsignarValorOid(ValorOid : integer ; Campo : TField);
begin

  if (not Assigned(campo))
     then Exit;

  if (not Assigned(campo.DataSet))
     then Exit;

  if (not campo.DataSet.Active)
     then Exit;

  if (not (campo.DataSet.State in [dsEdit,dsInsert]))
     then campo.DataSet.Edit;

  Campo.AsInteger := ValorOid;

end;

procedure TjktValidador.setAsignarValorDesc(ValorDesc : string ; Campo : TField);
begin

  if (not Assigned(campo))
     then Exit;

  if (not Assigned(campo.DataSet))
     then Exit;

  if (not campo.DataSet.Active)
     then Exit;

  if (not (campo.DataSet.State in [dsEdit,dsInsert]))
     then campo.DataSet.Edit;

  Campo.AsString := ValorDesc;

end;

destructor TjktValidador.Destroy;
begin
  FListaParametros.Free;
  FListaValoresParam.Free;
  inherited Destroy;
end;

procedure TjktValidador.clearParams();
begin
  FListaParametros.Clear;
  FListaValoresParam.Clear;
end;

procedure TjktValidador.addParam(nombreAtributo : string ; Valor : string);
begin
  FListaParametros.Add(nombreAtributo);
  FListaValoresParam.Add(Valor);
end;

function TjktValidador.isKeyEnParametros(aKey : String) : Boolean;
var
  idx    : Integer;
  existe : Boolean;
begin
  existe := False;
  for idx := 0 to FListaParametros.Count - 1 do
    begin
      if (aKey = FListaParametros.Strings[idx])
         then existe := True;
    end;
  result := existe;   
end;


end.
