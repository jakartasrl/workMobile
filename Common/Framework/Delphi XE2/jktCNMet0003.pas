unit jktCNMet0003;


interface

uses
  Classes, Dialogs;


type
  TjktElement = class (TComponent)
    private
      FHijos :TList;
      FAtrib :TList;
      FName  :string;
      Nivel  :integer;
    protected
    public
      constructor New(aOwner : TComponent; aElem :String; aNivel :integer);
      destructor  Destroy; override;
      procedure addAtribute(aATri, aValue :String);
      procedure imprimir(aStrList :TStringList);
      property  Hijos :TList read FHijos;
end;

type
  TjktAtribute = class (TComponent)
    private
       FName  :String;
       FValue :String;
       Nivel  :integer;
      function FixValue(Value: String): String;
    protected
    public
      constructor New(aOwner : TComponent; aATri, aValue :String; aNivel :integer);
      destructor  Destroy; override;
      procedure   imprimir(aStrList :TStringList);
end;

type
  TjktXML = class (TComponent)
    private
      FHijos  :TList;
      curList :TList;
      curElement : TjktElement;
      xwork   :integer;
      encabezado : string;
      FXMLString : TStringList;
      function  getLista(aNivel :integer; aList :TList) :TList;
      procedure borrarHijos;

    protected
    public
      constructor New(aOwner : TComponent);
      destructor  Destroy; override;
      procedure setEncabezado(aEnca :string);
      procedure addElement(aNivel :integer; aElem :string);
      procedure addAtribute(aAtri, aValue :string);
      function  toStringList :TStringList;
end;


implementation


constructor TjktElement.New(aOwner : TComponent; AElem :String; aNivel :integer);
begin
    inherited create(aOwner);
    FName  := aElem;
    Nivel  := aNivel;
    FHijos := TList.Create;
    FAtrib := TList.Create;
end;

destructor  TjktElement.Destroy;
var
  i:integer;
  obj :TObject;
begin
  for i:=0 to FHijos.Count -1 do
    begin
       obj :=TObject (FHijos.Items[i]);
       obj.Free;
    end;
  FHijos.Free;
  for i:=0 to FAtrib.Count -1 do
    begin
       obj :=TObject (FAtrib.Items[i]);
       obj.Free;
    end;
  FAtrib.Free;

  inherited destroy;
end;

procedure  TjktElement.addAtribute(aATri, aValue :String);
begin
   FAtrib.Add( TjktAtribute.new(Self, aAtri, aValue, Nivel) );
end;


procedure TjktElement.imprimir(aStrList :TStringList);
var
  i:integer;
  sangria :string;
begin
   case Nivel of
     0 : sangria := '';
     1 : sangria := '  ';
     2 : sangria := '    ';
     3 : sangria := '       ';
     4 : sangria := '          ';
     5 : sangria := '             ';
   end;

   aStrList.Add(sangria + '<' + FName);
   for i:=0 to FAtrib.count -1 do
     begin
        TjktAtribute (FAtrib.Items[i]).imprimir(aStrList);
     end;
   aStrList.Add(sangria + '>');
   for i:=0 to FHijos.count -1 do
     begin
        TjktElement (FHijos.Items[i]).imprimir(aStrList);
     end;

   aStrList.Add(sangria + '</' + FName + '>');

end;

//-----------------------------

constructor TjktAtribute.New(aOwner : TComponent; aATri, aValue :String; aNivel :integer);
begin
   inherited create(aOwner);
   FName  := aAtri;
   FValue := FixValue(aValue);
   Nivel  := aNivel;
end;

destructor  TjktAtribute.Destroy;
begin
   inherited destroy;
end;

//reemplaza los caracteres para el xml
function TjktAtribute.FixValue(Value: String): String;
var
  Repl: String;
  ch: Char;
  i, Len: Integer;
begin
  Result:='';
  Len:=Length(Value);

  //recorro el string
  for i:=1 to Len do
  begin

    //evaluo el caracter
    ch:=Value[i];
    case (ch) of
      '&': Repl:='&amp;';
      '>': Repl:='&gt;';
      '<': Repl:='&lt;';
      #39: Repl:='&apos;';
      '"': Repl:='&quot;';
      else
        Repl:=ch;
    end;
    Result:=Result+Repl;
  end;
end;

procedure TjktAtribute.imprimir(aStrList :TStringList);
var
  sangria :string;
begin
   case Nivel of
     0 : sangria := '    ';
     1 : sangria := '      ';
     2 : sangria := '        ';
     3 : sangria := '           ';
     4 : sangria := '              ';
     5 : sangria := '                 ';
   end;

   aStrList.Add(sangria + FName + '=' + '"' + FValue + '"');
end;

//-----------------------------


constructor TjktXML.New(aOwner : TComponent);
begin
    inherited create(aOwner);
    FHijos := TList.Create;
    FXMLString := TStringList.Create;
end;

destructor  TjktXML.Destroy;
begin
  borrarHijos;
  FHijos.Free;
  FXMLString.free;
  inherited destroy;
end;

procedure   TjktXML.addElement(aNivel :integer; aElem :string);
begin
   xwork := 0;
   curList := getLista(aNivel, FHijos);
   curElement := TjktElement.New(Self, aElem, aNivel);
   curList.add(curElement);
end;

procedure   TjktXML.addAtribute(aAtri, aValue :string);
begin
   curElement.addAtribute(aAtri, aValue);
end;

function TjktXML.getLista(aNivel :integer; aList :TList) :TList;
var
  elem : TjktElement;
begin
   if aNivel = 0
      then result := FHijos
      else
       if aNivel = xwork
              then begin
                    result := aList;
                   end
              else begin
                    xwork := xwork +1;
                    elem := TjktElement (aList.Items[aList.count -1]);
                    result := getLista(aNivel, elem.Hijos);
                   end;

end;

function TjktXML.toStringList :TStringList;
var
  i :integer;
begin
   FXMLString.clear;
   result := FXMLString;
   result.Add(encabezado);
   for i:= 0 to FHijos.count -1 do
      begin
         TjktElement (FHijos.Items[i]).imprimir(result);
      end;
end;

procedure TjktXML.setEncabezado(aEnca :string);
begin
   borrarHijos;
   encabezado := aEnca;
end;

procedure TjktXML.borrarHijos;
var
  i:integer;
  obj :TObject;
begin
  for i:=0 to FHijos.Count -1 do
    begin
       obj :=TObject (FHijos.Items[i]);
       obj.Free;
    end;
  FHijos.clear;
end;
//-----------------------------------------


end.

