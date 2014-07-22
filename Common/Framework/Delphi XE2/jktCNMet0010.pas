unit jktCNMet0010;

interface
uses classes, db;

type
  TDatasetItem = class(TCollectionItem)
  private
    private FDataset: TDataset;

  protected

  public

  published
    property Dataset :TDataset read FDataset write FDataset;

  end;

type

  TDataSetList = class(TCollection)
  private
     FOwner :TPersistent;
     function  GetDatasetItem(Index: Integer): TDatasetItem;
     procedure SetDatasetItem(Index: Integer; Value: TDatasetItem);

  protected
     function GetOwner: TPersistent; override;

  public
     constructor create (AOwner :TPersistent; AItemClass :TCollectionItemClass);
     property Items[Index: Integer]:TDatasetItem read GetDatasetItem write SetDatasetItem; default;

  end;


implementation

constructor TDataSetList.create (AOwner :TPersistent; AItemClass :TCollectionItemClass);
begin
   inherited create(aItemClass);
   FOwner := AOwner;
end;


function TDataSetList.GetOwner: TPersistent;
begin
  Result := FOwner;
end;


function TDataSetList.GetDatasetItem(Index: Integer): TDatasetItem;
begin
  Result := TDatasetItem(inherited Items[Index]);
end;

procedure TDataSetList.SetDatasetItem(Index: Integer; Value: TDatasetItem);
begin
  Items[Index].Assign(Value);
end;


end.
