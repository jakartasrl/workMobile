unit jktCNMet0011;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs ,
  jktCNMet0002, jktCNMet0030, jktFNMet0008, DB, kbmMemTable;

const
  operExistente       = 'ValidarExistente';
  operInexistente     = 'ValidarInexistente';

type
  TjktValidacion   = (tExistente, tInexistente, tEspecial, tMayorCero, tMayorIgualCero, tMenorIgualCien, tDistintoEspacio);

type
  TjktAsignadorField = class(TCollectionItem)
  private
     FFieldName        :string;
     FFieldTarget      :TField;
     FFieldSource      :TField;
  public
     procedure asignarValor;
     property FieldSource      :TField           read FFieldSource     write FFieldSource;

  published
     property FieldName        :string           read FFieldName       write FFieldName;
     property FieldTarget      :TField           read FFieldTarget     write FFieldTarget;
end;

type
  TjktAsignadorFieldList = class(TCollection)
    private
      FOwner : TComponent;
    protected
      function  GetOwner : TPersistent; override;
      function  GetItem(Index: Integer): TjktAsignadorField;
      procedure SetItem(Index: Integer; Value:TjktAsignadorField);
      procedure Update(Item: TjktAsignadorField);
    public
      constructor Create(AOwner : TComponent);
      function add : TjktAsignadorField;
      property Items[Index: Integer]: TjktAsignadorField read GetItem write SetItem;
end;



type
  TjktValidador = class(TComponent)
  private
    { Private declarations }
    FTempMemTable       : TkbmMemTable;
    FEntidad            : string;
    FServiceCaller      : TjktServiceCaller;
    FValidacion         : TjktValidacion;
    FListaAsignaciones  : TjktAsignadorFieldList;
    FOperacionEspecial  : TjktOperacion;
    DatasetCreado       : boolean;
    procedure  crearDatasetResult;
    procedure  validacionLocal(sender  :TField);
    procedure  validacionServer(sender :TField);
    procedure  validacionExistenciaInexistencia(sender :TField);

  protected
    { Protected declarations }

  public
    { Public declarations }
    constructor Create(AOwner : TComponent); override;
    destructor  Destroy; override;
    procedure validar(sender : TField);
    procedure procesarResultado;
    property ServiceCaller: TjktServiceCaller read FServiceCaller write FServiceCaller;

  published
    { Published declarations }
    property Entidad : string read FEntidad write FEntidad;
    property Validacion         :TjktValidacion    read FValidacion    write FValidacion;
    property ListaAsignaciones  :TjktAsignadorFieldList read FListaAsignaciones write FListaAsignaciones;
    property OperacionEspecial  :TjktOperacion    read FOperacionEspecial  write FOperacionEspecial ;
  end;

type
  TjktValidadorField = class(TCollectionItem)
  private
     FField                :TField;
     FValidadorNew         :TjktValidador;
     FValidadorModif       :TjktValidador;
     FValidadorGral        :TjktValidador;

  published
     property Field                :TField           read FField               write FField;
     property ValidadorNew         :TjktValidador    read FValidadorNew        write FValidadorNew;
     property ValidadorModif       :TjktValidador    read FValidadorModif      write FValidadorModif;
     property ValidadorGral        :TjktValidador    read FValidadorGral       write FValidadorGral;
  end;

type
  TjktValidadorFieldList = class(TCollection)
  private
    FOwner : TComponent;
  protected
    function  GetOwner : TPersistent; override;
    function  GetItem(Index: Integer): TjktValidadorField;
    procedure SetItem(Index: Integer; Value: TjktValidadorField);
    procedure Update(Item: TjktValidadorField);
  public
    constructor Create(AOwner : TComponent);
    function add : TjktValidadorField;
    property Items[Index: Integer]: TjktValidadorField read GetItem write SetItem;
  end;


type
  TjktValidadorForm = class(TComponent)
  private
     FListaValidaciones : TjktValidadorFieldList;
     FValidarCampo      : TFieldNotifyEvent;
     procedure agregarValidacion(validadorField: TjktValidadorField);
     function isEstadoNew: Boolean;

  public
    { Public declarations }
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    procedure  inicializar;
    procedure Validar(Sender: TField);
  published
    property ListaValidaciones: TjktValidadorFieldList read FListaValidaciones write FListaValidaciones;
  end;

procedure Register;

implementation

uses
  jktCNMet0001;

procedure Register;
begin
  RegisterComponents('Jakarta', [TjktValidador, TjktValidadorForm] );
end;


constructor TjktValidador.Create(AOwner : TComponent);
var x:integer;
begin
  inherited Create(AOwner);
  for x := 0 to aOwner.ComponentCount -1 do
    begin
       if aOwner.Components[x] is TjktServiceCaller
          then FServiceCaller := TjktServiceCaller (aOwner.Components[x]);
    end;

  FListaAsignaciones   := TjktAsignadorFieldList.Create(self);
  datasetCreado := false;
end;

destructor  TjktValidador.destroy;
begin
  FListaAsignaciones.Free;
  inherited destroy;
end;

procedure TjktValidador.crearDatasetResult;
var
  x :integer;
  name :string;
  tipo :TFieldType;
  size :integer;
  campo :TField;
begin
  FTempMemTable := TkbmMemTable.Create(self);
  FTempMemTable.Name := 'TMemVal' + IntToStr(random(100000));
  for x := 0 to FListaAsignaciones.Count -1 do
    begin
       name :=  FListaAsignaciones.Items[x].FieldName;
       if        FListaAsignaciones.Items[x].FieldTarget is TIntegerField
       then      begin
                   tipo := ftInteger;
                   size := 0;
                 end
       else      if FListaAsignaciones.Items[x].FieldTarget is TStringField
       then      begin
                   tipo := ftString;
                   size := 255;
                 end
       else      if FListaAsignaciones.Items[x].FieldTarget is TFloatField
       then      begin
                   tipo := ftString;
                   size := 0;
                 end
       else      if FListaAsignaciones.Items[x].FieldTarget is TCurrencyField
       then      begin
                   tipo := ftCurrency;
                   size := 0;
                 end

       else      if FListaAsignaciones.Items[x].FieldTarget is TBooleanField
       then      begin
                   tipo := ftBoolean;
                   size := 0;
                 end;
       FTempMemTable.FieldDefs.Add(name, tipo, size,  false);
    end;

  DatasetCreado := true;
  FTempMemTable.Close;
  FTempMemTable.Open;

  for x := 0 to FListaAsignaciones.Count -1 do
    begin
       name :=  FListaAsignaciones.Items[x].FieldName;
       campo := FTempMemTable.FieldByName(name);
       FListaAsignaciones.Items[x].FieldSource   := campo;
    end;

  FServiceCaller.asignarDataSet(FTempMemTable.Name, FTempMemTable);
end;

procedure TjktValidador.procesarResultado();
var
  x: Integer;
begin
  if not Assigned(FTempMemTable) then
    Exit;

  if FTempMemTable.IsEmpty then
    Exit;

  for x:= 0 to FListaAsignaciones.Count -1 do
    begin
       FListaAsignaciones.Items[x].asignarValor;
    end;
end;

procedure TjktValidador.validar(sender :TField);
begin
  if (FValidacion =  tMayorCero)
  or (FValidacion =  tMayorIgualCero)
  or (FValidacion =  tMenorIgualCien )
  or (FValidacion =  tDistintoEspacio)
      then validacionLocal(sender)
      else validacionServer(sender);
end;

procedure TjktValidador.validacionServer(sender:TField);
begin
  if not Assigned(FServiceCaller)
     then raise Exception.Create('Falta Asignar la propiedad "ServiceCaller" al Validador ' + Self.Name);

  if (FServiceCaller.ModoExecute)
     then Exit;

  if FValidacion = tEspecial
      then FOperacionEspecial.execute
      else validacionExistenciaInexistencia(sender);

  procesarResultado;
end;

procedure TjktValidador.validacionExistenciaInexistencia(sender :TField);
var
  operName :string;
begin
  if FValidacion = tExistente then
    operName := operExistente
  else if FValidacion = tInexistente then
    operName := operInexistente;

  FServiceCaller.InicioOperacion;
  FServiceCaller.setOperacion(operName);
  FServiceCaller.addAtribute('codigo',    trim(sender.AsString));
  FServiceCaller.addAtribute('entidad',   FEntidad);

  if FValidacion = tExistente then
    begin
      if not Self.DatasetCreado then
        crearDatasetResult;

      FServiceCaller.addAtribute('outputDatasetName',   FTempMemTable.Name);
    end;

  FServiceCaller.execute;
end;

procedure TjktValidador.validacionLocal(sender :TField);
begin
  try
    if FValidacion =  tMayorCero then
      begin
        if sender.asFloat <= 0 then raise Exception.Create('Debe ser mayor a cero');
      end
    else if FValidacion =  tMayorIgualCero then
      begin
        if sender.asFloat < 0 then raise Exception.Create('Debe ser mayor o igual a cero') ;
      end
    else if FValidacion =  tMenorIgualCien then
      begin
        if sender.asFloat < 100 then raise Exception.Create('Debe ser menor o igual a cien') ;
      end
    else if FValidacion =  tDistintoEspacio then
      begin
        if trim(sender.asString) = '' then raise Exception.Create('Debe ser distinto de espacios');
      end;
  except
    on E: Exception do begin
      // El componente TcxCustomEdit de 'DevExpress' captura el raise (en el DoExit)
      // y no muestra mensaje alguno! Es por esto que capturo la Exception antes que lo
      // haga el componente, para poder mostrar el error
      mostrarMensErrorAbort(E.Message);
    end;
  end;
end;




//------------------------------------------------------------------------
constructor TjktValidadorForm.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  FListaValidaciones   := TjktValidadorFieldList.Create(self);
end;

destructor TjktValidadorForm.Destroy;
begin
  FListaValidaciones.Free;
  inherited Destroy;
end;

procedure  TjktValidadorForm.inicializar;
var
  x: integer;
  validadorField :TjktValidadorField;
begin
   for x:=0 to FListaValidaciones.Count -1 do
     begin
        validadorField := TjktValidadorField (FListaValidaciones.Items[x]);
        agregarValidacion(validadorField);
     end;
end;


procedure TjktValidadorForm.agregarValidacion(validadorField : TjktValidadorField);
var
  x: integer;
  campo :TField;
begin
 for x:= 0 to self.Owner.ComponentCount - 1 do
    begin
      if self.Owner.Components[x] is TField
         then begin
                campo := TField (self.Owner.Components[x]);
                if validadorField.Field = campo
                    then  campo.OnValidate := validar;
              end;
    end;
end;

procedure TjktValidadorForm.Validar(Sender: TField);
var
  x: integer;
  validadorField :TjktValidadorField;
  isNew :boolean;
begin
   isNew := isEstadoNew;
   for x:=0 to FListaValidaciones.Count -1 do
     begin
        validadorField := TjktValidadorField (FListaValidaciones.Items[x]);
        if validadorField.Field = sender
            then begin
                 if (isNew)  and ( validadorField.ValidadorNew <> nil) and (not validadorField.ValidadorNew.ServiceCaller.ModoExecute)
                      then  validadorField.ValidadorNew.validar(sender)
                 else
                 if (isNew = false)  and ( validadorField.ValidadorModif <> nil) and (not validadorField.ValidadorModif.ServiceCaller.ModoExecute)
                      then  validadorField.ValidadorModif.validar(sender)
                 else
                 if (validadorField.ValidadorGral <> nil) and (not validadorField.ValidadorGral.ServiceCaller.ModoExecute)
                      then  validadorField.ValidadorGral.validar(sender);

                 end;
     end;
end;


function TjktValidadorForm.isEstadoNew: boolean;
var
x:integer;
driver :TjktDriver;
begin
  driver := nil;
  for x := 0 to owner.ComponentCount -1 do
    begin
       if owner.Components[x] is TjktDriver then
        begin
          driver := TjktDriver(owner.Components[x]);
          Break;
        end;
    end;
  result := false;
  if driver <> nil
    then result := driver.esNuevo;
end;
//--------------------------------------------------------

constructor TjktValidadorFieldList.Create(AOwner: TComponent);
begin
  inherited Create(TjktValidadorField);
  FOwner := AOwner;
end;

function TjktValidadorFieldList.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

function  TjktValidadorFieldList.GetItem(Index: Integer): TjktValidadorField;
begin
  result := TjktValidadorField (inherited getItem(index));
end;

procedure TjktValidadorFieldList.SetItem(Index: Integer; Value:TjktValidadorField);
begin
  inherited setItem(index, value);
end;


procedure TjktValidadorFieldList.Update(Item: TjktValidadorField);
begin
  inherited Update(Item);
end;

function TjktValidadorFieldList.add : TjktValidadorField;
begin
  result := TjktValidadorField (inherited add());
end;

//--------------------------------------------------------

constructor TjktAsignadorFieldList.Create(AOwner: TComponent);
begin
  inherited Create(TjktAsignadorField);
  FOwner := AOwner;
end;

function TjktAsignadorFieldList.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

function  TjktAsignadorFieldList.GetItem(Index: Integer): TjktAsignadorField;
begin
  result := TjktAsignadorField (inherited getItem(index));
end;

procedure TjktAsignadorFieldList.SetItem(Index: Integer; Value:TjktAsignadorField);
begin
  inherited setItem(index, value);
end;


procedure TjktAsignadorFieldList.Update(Item: TjktAsignadorField);
begin
  inherited Update(Item);
end;

function TjktAsignadorFieldList.add : TjktAsignadorField;
begin
  result := TjktAsignadorField (inherited add());
end;


//----------------------------------------------------------------------
procedure TjktAsignadorField.asignarValor;
begin
   if assigned(FFieldTarget) and assigned(FFieldSource)
      then   FFieldTarget.Value  := FFieldSource.Value;
end;

end.
