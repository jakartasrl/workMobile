unit jktCMet013;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DB, dbctrls, jktCMet016;

type

  TFieldNotifyEvent = procedure(Sender: TField) of object;

  TjktDBLeyenda = class(TPanel)
  private
    { Private declarations }
    FDataLink: TFieldDataLink;
    FLeyendas : TLeyendaList;
    FCambioValor : TFieldNotifyEvent;
    function GetDataField: string;
    procedure SetDataField(Value: string);
    function GetDataSource: TDataSource;
    procedure SetDataSource(Value: TDataSource);
    function GetField: TField;
  protected
    { Protected declarations }
    procedure DataChange(Sender: TObject);
  public
    { Public declarations }
    constructor Create (AOwner: TComponent); override;
    destructor Destroy; override;
    property Field: TField read GetField;

  published
    { Published declarations }
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property Leyendas : TLeyendaList read FLeyendas write FLeyendas;
    property onCambioValor : TFieldNotifyEvent read FCambioValor write FCambioValor;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Jakarta', [TjktDBLeyenda]);
end;

{ TjktDBLeyenda }

constructor TjktDBLeyenda.Create(AOwner: TComponent);
begin
  inherited Create (AOwner);

  FLeyendas := TLeyendaList.Create(self, TLeyendaItem);

  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := self;
  FDataLink.OnDataChange := DataChange;
  self.Visible := false;
end;

// Acá es lo que quiero que haga el componente
procedure TjktDBLeyenda.DataChange(Sender: TObject);
var
  i: integer;
begin
  if (FDataLink.Field <> nil)
  then begin
       self.Visible := False;
       for i:= 0 to Leyendas.Count - 1 do
         begin
         if Assigned(FCambioValor)
            then FCambioValor(FDataLink.Field);
         if (UpperCase(Leyendas.Items[i].Valor) = UpperCase(FDataLink.Field.AsString))
            then begin
                 self.Caption := Leyendas.Items[i].Leyenda;
                 self.Color   := Leyendas.Items[i].ColorFondo;
                 self.Font.Color := Leyendas.Items[i].colorLetra;
                 self.Font.Style := self.Font.Style + [fsBold];
                 self.Visible := Leyendas.Items[i].Visible;
                 Exit;
                 end;
         end;
       end;
       self.Visible := False;
end;

destructor TjktDBLeyenda.Destroy;
begin
  FDataLink.Free;
  FDataLink := nil;
  inherited Destroy;
end;

function TjktDBLeyenda.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

function TjktDBLeyenda.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

function TjktDBLeyenda.GetField: TField;
begin
  Result := FDataLink.Field;
end;

procedure TjktDBLeyenda.SetDataField(Value: string);
begin
  FDataLink.FieldName := Value;
end;

procedure TjktDBLeyenda.SetDataSource(Value: TDataSource);
begin
  FDataLink.DataSource := Value;
end;


end.
