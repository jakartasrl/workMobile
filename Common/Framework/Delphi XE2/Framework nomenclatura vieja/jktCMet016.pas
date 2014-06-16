unit jktCMet016;

interface

uses
  Classes, Graphics;

type

  TLeyendaItem = class(TCollectionItem)
  private
    FValor   : string;
    FLeyenda : String;
    FVisible : boolean;
    FColorFondo: TColor;
    FColorLetra: TColor;
  protected
  public
    Procedure Assign(Source : TPersistent); Override;
  published
    property Valor   : string  read fValor   write fValor;
    property Leyenda : String  read fLeyenda write fLeyenda;
    property Visible : boolean read fVisible write fVisible;
    property ColorFondo   : TColor  read fColorFondo   write fColorFondo;
    property ColorLetra   : TColor  read fColorLetra   write fColorLetra;
  end;

  TLeyendaList = class(TCollection)
  private
     FOwner: TPersistent;
     function  GetLeyendaItem(Index: Integer): TLeyendaItem ;
     procedure SetLeyendaItem(Index: Integer; Value: TLeyendaItem );
  protected
     function GetOwner: TPersistent; override;
  public
     Procedure Assign(Source: TPersistent) ; Override;
     constructor Create(AOwner: TPersistent; AItemClass: TCollectionItemClass);
     property Items[Index: Integer]: TLeyendaItem read GetLeyendaItem write SetLeyendaItem; default;
  end;

implementation

Procedure TLeyendaItem.Assign(Source : TPersistent);
begin
    FValor   := TLeyendaItem(Source).Valor;
    FLeyenda := TLeyendaItem(Source).Leyenda;
    FVisible := TLeyendaItem(Source).Visible;
    FColorFondo   := TLeyendaItem(Source).ColorFondo;
    FColorLetra   := TLeyendaItem(Source).ColorLetra;
end;

constructor TLeyendaList.Create(AOwner :TPersistent; AItemClass :TCollectionItemClass);
begin
   inherited Create(AItemClass);
   FOwner := AOwner;
end;

Procedure TLeyendaList.Assign(Source : TPersistent);
begin

end;

function TLeyendaList.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

function TLeyendaList.GetLeyendaItem(Index: Integer): TLeyendaItem;
begin
  Result := TLeyendaItem(inherited Items[Index]);
end;

procedure TLeyendaList.SetLeyendaItem(Index: Integer; Value: TLeyendaItem);
begin
  Items[Index].Assign(Value);
end;

end.
