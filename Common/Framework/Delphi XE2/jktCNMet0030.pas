unit jktCNMet0030;

interface

uses
  Classes, kbmMemTable, data.db, jktCNMet0002;

{
  type
    TjktOperacionEditor = class (TComponentEditor)
      function GetVerbCount: Integer; override;
      function GetVerb(Index: Integer): string; override;
      procedure ExecuteVerb(Index: Integer); override;
      procedure Edit; override;
    end;
}

type

  TjktOperAttribute = class(TCollectionItem)
  private
    FAttribute :String;
    FDataset   :TkbmMemTable;
    FField     :TField;
    FTag       :integer;
  protected
  public
    procedure Assign(Source: TPersistent); override;
  published
    property Attribute : String       read FAttribute write FAttribute;
    property Dataset  :TkbmMemTable   read FDataset write FDataset;
    property Field    :TField         read FField   write FField;
    property Tag      :integer        read FTag   write FTag;
  end;

  TjktOperAttributeList = class(TCollection)
  private
    FOwner : TComponent;
  protected
    function  GetOwner : TPersistent; override;
    function  GetItem(Index: Integer): TjktOperAttribute;
    procedure SetItem(Index: Integer; Value:TjktOperAttribute);
    procedure Update(Item: TjktOperAttribute);
  public
    constructor Create(AOwner : TComponent);
    function add : TjktOperAttribute;
    property Items[Index: Integer]: TjktOperAttribute read GetItem write SetItem;
  end;

  
type

  TjktOperacion = class(TComponent)
  private
    FOperName      : string;
    FEnviarTodo    : Boolean;
    FAtributos     : TjktOperAttributeList;
    FServiceCaller : TjktServiceCaller;
    DatasetsList   : TList;
      
    {********   Eventos   ********}
    FOnBeforeEjecutar : TNotifyEvent;
    FOnAfterEjecutar  : TNotifyEvent;

    function  getCountDatasets :integer;
    procedure completarAtributosOperacion();
    procedure obtenerDatasets;
    function  GetDataset(Index: Integer): TkbmMemTable;
    procedure addAtributosOperacion;
    procedure addDatasetOperacion;
    procedure setXMLSave(aDataSet :TDataSet);
    function  obtenerListaDataSet(aDataset:TDataSet) : TList;
    procedure recorrerDataSet(aDataset:TDataSet ; aLista :TList; aNivel, aNivelDataSet: integer);
      
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure   execute;
    procedure   executeGuardar(aDataSet :TDataSet);
    property    CountDatasets :integer read getCountDatasets;
    property    ItemsDataset[Index: Integer]:TkbmMemTable read GetDataset ;

  published
    property OperName      :string   read FOperName     write FOperName;
    property EnviarTodo    :boolean  read FEnviarTodo   write FEnviarTodo;
    property Atributos     :TjktOperAttributeList read FAtributos write FAtributos;
    property ServiceCaller :TjktServiceCaller read FServiceCaller write FServiceCaller;

    property OnBeforeEjecutar : TNotifyEvent read FOnBeforeEjecutar write FOnBeforeEjecutar;
    property OnAfterEjecutar  : TNotifyEvent read FOnAfterEjecutar  write FOnAfterEjecutar;
    
  end;

type

  TjktOperacionItemList = class(TCollectionItem)
  private
    FOperacion: TjktOperacion;

  protected
  public
    procedure Assign(Source: TPersistent); override;

  published
    property Operacion: TjktOperacion read FOperacion write FOperacion;
  end;

 type
  TjktOperacionesList = class(TCollection)
  private
    FOwner : TComponent;
  protected
    function  GetOwner : TPersistent; override;
    function  GetItem(Index: Integer): TjktOperacionItemList;
    procedure SetItem(Index: Integer; Value: TjktOperacionItemList);
    procedure Update(Item: TjktOperacionItemList);
  public
    constructor Create(AOwner : TComponent);
    function add : TjktOperacionItemList;
    property Items[Index: Integer]: TjktOperacionItemList read GetItem write SetItem;
  end;


procedure Register;

implementation

uses
  jktFNMet0030, SysUtils;


procedure Register;
begin
  RegisterComponents('Jakarta', [TjktOperacion]);
//  RegisterComponentEditor (TjktOperacion, TjktOperacionEditor);
end;

{
function TjktOperacionEditor.GetVerbCount: Integer;
begin
  result := 1;
end;


function TjktOperacionEditor.GetVerb (Index: Integer): string;
begin
  case Index of
    0: Result := ' Copygright Jakarta SRL  ';
  end;
end;

procedure TjktOperacionEditor.Edit;
var
  FAttributeEditor: TFAttributeEditor;
  mem1: TkbmMemTable;
  att :TjktOperAttribute;
begin
   FAttributeEditor:= TFAttributeEditor.create(nil);
   FAttributeEditor.showModal;
   mem1 := FAttributeEditor.Tabla;
   mem1.first;
   while not mem1.eof do
     begin
          with Component as TjktOperacion do
            att  := TjktOperacion(Component).Atributos.add();
          // con el nombre obteenr el objeto o pasar al form la lista de dataset y fields
          //  att.Attribute :=  mem1.fieldByName('atributo').asString;
          //  att.Dataset   :=  mem1.fieldByName('datasetName').asString;
          //  att.Field     :=  mem1.fieldByName('fieldName').asString;

            mem1.next;
     end;
end;

procedure TjktOperacionEditor.ExecuteVerb(Index: Integer);
begin
  inherited;
   case Index of
    0: ; // nothing to do
  end;
end;
 }


procedure TjktOperAttribute.Assign(Source: TPersistent);
begin
  if Source is TjktOperAttribute then
    begin
      Attribute :=  TjktOperAttribute(Source).Attribute;
      Dataset   :=  TjktOperAttribute(Source).Dataset;
      Field     :=  TjktOperAttribute(Source).Field;
    end
  else
    inherited; //raises an exception
end;


constructor TjktOperAttributeList.Create(AOwner: TComponent);
begin
  inherited Create(TjktOperAttribute);
  FOwner := AOwner;
end;

function TjktOperAttributeList.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

function  TjktOperAttributeList.GetItem(Index: Integer): TjktOperAttribute;
begin
  result := TjktOperAttribute (inherited getItem(index));
end;

procedure TjktOperAttributeList.SetItem(Index: Integer; Value:TjktOperAttribute);
begin
  inherited setItem(index, value);
end;


procedure TjktOperAttributeList.Update(Item: TjktOperAttribute);
begin
  inherited Update(Item);
end;

function TjktOperAttributeList.add : TjktOperAttribute;
begin
  result := TjktOperAttribute (inherited add());
end;

//----------------------------------------------------------------------
constructor TjktOperacion.Create(AOwner: TComponent);
var
  x:integer;
begin
  inherited Create(AOwner);
  FAtributos  := TjktOperAttributeList.create(self);
  FEnviarTodo := false;
  for x := 0 to aOwner.ComponentCount -1 do
    begin
       if aOwner.Components[x] is TjktServiceCaller
          then FServiceCaller := TjktServiceCaller (aOwner.Components[x]);

    end;
end;

destructor TjktOperacion.Destroy;
begin
  FAtributos.free;
  inherited Destroy;
end;

procedure TjktOperacion.execute;
begin
  if not Assigned(FServiceCaller) then
    raise Exception.Create('No esta asignada la propiedad ServiceCaller');

  if Assigned(FOnBeforeEjecutar) then
    FOnBeforeEjecutar(Self);

  FServiceCaller.InicioOperacion;
  FServiceCaller.setOperacion(FOperName);
  completarAtributosOperacion();

  FServiceCaller.execute;

  if Assigned(FOnAfterEjecutar) then
    FOnAfterEjecutar(Self);
end;

procedure TjktOperacion.executeGuardar(aDataSet :TDataSet);
begin
  if not Assigned(FServiceCaller)
     then  raise Exception.Create('No esta asignada la propiedad ServiceCaller');

  if not Assigned(aDataSet)
     then  raise Exception.Create('No esta asignada la propiedad DataSetCab del Driver');

  if Assigned(FOnBeforeEjecutar) then
    FOnBeforeEjecutar(Self);

  FServiceCaller.InicioOperacion;
  FServiceCaller.setOperacion(FOperName);
  addAtributosOperacion();
  Self.setXMLSave(aDataset);

  FServiceCaller.execute;

  if Assigned(FOnAfterEjecutar) then
    FOnAfterEjecutar(Self);
end;



function TjktOperacion.getCountDatasets: integer;
begin
   if DatasetsList = nil
       then obtenerDatasets;
   result := DatasetsList.count;
end;

function TjktOperacion.GetDataset(Index: Integer): TkbmMemTable;
begin
    Result := TkbmMemTable( DatasetsList.Items[Index]);
end;

procedure TjktOperacion.obtenerDatasets;
var
  x: integer;
  att :TjktOperAttribute;
begin
    DatasetsList := TList.create;
    for x := 0 to FAtributos.Count -1 do
      begin
         att := FAtributos.Items[x];
         if att.Dataset <> nil
            then DatasetsList.add(att.Dataset);
      end;

end;

procedure TjktOperacion.addAtributosOperacion();
var
 x :integer;
 count :integer;
 att :TjktOperAttribute;
begin
  count :=  self.FAtributos.Count;
  // Mandar primero los campos sueltos
  for x := 0 to count - 1 do
    begin
       att :=  self.FAtributos.Items[x];
       if  att.Field = nil
          then continue;
       FServiceCaller.addAtribute(att.Attribute, att.Field.AsString);
    end;
end;


procedure TjktOperacion.addDatasetOperacion();
var
 x :integer;
 count :integer;
 att :TjktOperAttribute;
begin
  count :=  self.FAtributos.Count;
  for x := 0 to count -1 do
    begin
       att :=  self.FAtributos.Items[x];
       if  att.Dataset = nil
          then continue;
       FServiceCaller.addDataSet(att.Dataset, '', att.Tag);
    end;

end;



procedure TjktOperacion.completarAtributosOperacion();
begin
  addAtributosOperacion;
  addDatasetOperacion
end;


procedure TjktOperacion.SetXMLSave(aDataSet :TDataSet);
var
  lista : TList;
begin
  lista := nil;
  self.obtenerDatasets;
  if (CountDatasets <> 0)
     then lista := obtenerListaDataSet(aDataSet);

  recorrerDataSet(aDataSet, lista, 1, 1);
  lista.Free;
end;


function  TjktOperacion.obtenerListaDataSet(aDataset:TDataSet) : TList;
var
  i :integer;
  dataSet :TkbmMemTable;
begin
  result := TList.create;
  for i:=0 to CountDatasets -1 do
    begin
       dataSet := self.GetDataset(i);
       if  (dataSet.MasterSource <> nil)
       and (dataSet.MasterSource.DataSet = aDataSet)
            then result.Add(dataSet);
    end;
end;

procedure TjktOperacion.recorrerDataSet(aDataset: TDataSet; aLista: TList; aNivel, aNivelDataSet: Integer);
var
  wrkDataSet: TDataset;
  lista2: TList;
  i: integer;
begin
  aDataSet.BlockReadSize := 1;
  try
      if aDataset = nil
         then exit;

      // Tabla de Cabecera
      FServiceCaller.addElement(aNivel, 'Tabla');
      FServiceCaller.addAtribute('nombre', upperCase(aDataset.name));

      aDataset.First;
      while not aDataSet.Eof do
        begin
          // Fila
          FServiceCaller.enviarCampos(aDataSet, 1, aNivel + 1);
          if (aLista <> nil) then
            for i:=0 to aLista.count -1 do
              begin
                wrkDataset := TDataset (aLista.items[i]);

                if (CountDatasets <> 0)
                   then lista2 := obtenerListaDataSet(wrkDataset);

                recorrerDataset(wrkDataset, lista2,  aNivel + 2, aNivelDataSet + 1 );
                lista2.free;
              end;

          aDataSet.Next;
        end;
  finally
     aDataSet.BlockReadSize := 0;
  end;
end;


procedure TjktOperacionItemList.Assign(Source: TPersistent);
begin
  if Source is TjktOperacionItemList then
    operacion :=  TjktOperacionItemList(Source).Operacion
  else
    inherited; //raises an exception
end;





constructor TjktOperacionesList.Create(AOwner: TComponent);
begin
  inherited Create(TjktOperacionItemList);
  FOwner := AOwner;
end;

function TjktOperacionesList.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

function  TjktOperacionesList.GetItem(Index: Integer): TjktOperacionItemList;
begin
  result := TjktOperacionItemList (inherited getItem(index));
end;

procedure TjktOperacionesList.SetItem(Index: Integer; Value:TjktOperacionItemList);
begin
  inherited setItem(index, value);
end;


procedure TjktOperacionesList.Update(Item: TjktOperacionItemList);
begin
  inherited Update(Item);
end;

function TjktOperacionesList.add : TjktOperacionItemList;
begin
  result := TjktOperacionItemList (inherited add());
end;




end.
