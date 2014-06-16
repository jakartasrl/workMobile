unit jktCNMet0030;

interface
uses
 Classes, kbmMemTable, data.db;
 //DesignEditors, DesignIntf;


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

type
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
      FOperName       :string;
      FEnviarTodo     :boolean;
      FAtributos      :TjktOperAttributeList;
      DatasetsList    :TList;

      function        getCountDatasets :integer;

      procedure       obtenerDatasets;
      function        GetDataset(Index: Integer): TkbmMemTable;

   public
      constructor Create(AOwner: TComponent); override;
      destructor  Destroy; override;
      property    CountDatasets :integer read getCountDatasets;
      property    ItemsDataset[Index: Integer]:TkbmMemTable read GetDataset ;


   published
      property OperName      :string   read FOperName     write FOperName;
      property EnviarTodo    :boolean  read FEnviarTodo   write FEnviarTodo;
      property Atributos :TjktOperAttributeList read FAtributos write FAtributos;

 end;

 procedure Register;

implementation
uses jktNFMet0030;


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
//---------------------------------------


procedure TjktOperAttribute.Assign(Source: TPersistent);
begin
if Source is TjktOperAttribute
      then begin
            Attribute :=  TjktOperAttribute(Source).Attribute;
            Dataset   :=  TjktOperAttribute(Source).Dataset;
            Field     :=  TjktOperAttribute(Source).Field;
           end
else
     inherited; //raises an exception
end;

//----------------------------------------------------------------------

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
  inherited update(Item);
end;

function TjktOperAttributeList.add : TjktOperAttribute;
begin
  result := TjktOperAttribute (inherited add());
end;

//----------------------------------------------------------------------
constructor TjktOperacion.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FAtributos  := TjktOperAttributeList.create(self);
  FEnviarTodo := false;

end;



destructor TjktOperacion.Destroy;
begin
  FAtributos.free;
  inherited Destroy;
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
  x: word;
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

end.
