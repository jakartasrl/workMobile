unit jktCMet023;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jktCMet012, db, jktFMet014, kbmMemTable, kbmMemCSVStreamFormat, Variants;

type
  TjktImportCSV = class(TComponent)
  private
    { Private declarations }
    Errores       : Boolean;
    TKeys         : TStringList;
    TCampos       : TStringList;
    NomCampoValue : String;
    NomCampoKey   : String;
    FFImportCSV   : TFMet014;
    FDSOrigen     : TjktMemTable;
    FDSDestino    : TjktMemTable;
    FDSPeriodos   : TjktMemTable;
    CSVSFOrigen   : TkbmCSVStreamFormat;
    FImportarTodo : boolean;
    procedure MostrarFormatoArchivo();
    procedure ValidarPropiedades();
    procedure CrearFormInput();
    procedure ProcesarImportacion();
    function  GetKeyLocate() : String;
    procedure GetKeyValues(var aKeyValue : Variant);
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner : TComponent); override;
    destructor Destroy(); override;
    property  ImportarTodo :boolean read FImportarTodo write FImportarTodo;
    procedure Inicializar();
    procedure addKey(aNomCampo : String; aTipo: TFieldType);
    procedure addCampos(aNomCampo : String; aDataSetPeri : TDataSet; aNomKey : String; aTipo: TFieldType);
    procedure ImportarCSV(DataSetDestino : TDataSet);
  published
    { Published declarations }
  end;

procedure Register;

implementation

const
  PREFIJO_CAMPO = 'p';

procedure Register;
begin
  RegisterComponents('Jakarta', [TjktImportCSV]);
end;


procedure TjktImportCSV.ImportarCSV(DataSetDestino : TDataSet);
var
  MasterSource : TDataSource;
begin
  FDSDestino := TjktMemTable(DataSetDestino);
  Self.ValidarPropiedades();
  Self.CrearFormInput();
  Self.MostrarFormatoArchivo();
  FFImportCSV.Mostrar();
  if FFImportCSV.Acepto
     then begin
            try
              MasterSource := FDSDestino.MasterSource;
              FDSDestino.MasterSource := nil;
              FDSDestino.DisableControls;
              Self.ProcesarImportacion();
            finally
              FDSDestino.EnableControls;
              FDSDestino.MasterSource := MasterSource;
            end;
          end;
  if Errores
     then FFImportCSV.MostrarErrores(FDSOrigen);
end;


procedure TjktImportCSV.ValidarPropiedades();
begin
end;


procedure TjktImportCSV.CrearFormInput();
begin
  FFImportCSV := TFMet014.Create(Self);
end;


procedure TjktImportCSV.Inicializar();
begin
  Errores := False;
  FImportarTodo := false;
  TKeys.Clear;
  TCampos.Clear;
  FDSOrigen.BorrarConfigTabla;
  FDSPeriodos.BorrarConfigTabla;
end;

procedure TjktImportCSV.addKey(aNomCampo : String; aTipo: TFieldType);
var
  size : Integer;
  cpo  : String;
begin
  size := 0;
  if (aTipo = ftString)
     then size := 255;

  cpo := ',';

  CSVSFOrigen.CSVFieldDelimiter := Char(cpo[1]);

  FDSOrigen.FieldDefs.Add(aNomCampo, aTipo, size, false);
  TKeys.Add(aNomCampo);
end;


procedure TjktImportCSV.addCampos(aNomCampo : String; aDataSetPeri : TDataSet; aNomKey : String; aTipo: TFieldType);
var
  peri  : Integer;
  campo : String;
begin

  FDSPeriodos.LoadFromDataSet(aDataSetPeri, [mtcpoStructure]);

  NomCampokey   := aNomKey;
  NomCampoValue := aNomCampo;

  for peri := 1 to FDSPeriodos.RecordCount do
    begin
      campo := PREFIJO_CAMPO + IntToStr(peri);
      FDSOrigen.FieldDefs.Add(campo, aTipo, 0, false);
      TCampos.Add(campo);
    end;
end;


procedure TjktImportCSV.ProcesarImportacion();
var
  ini       : Integer;
  idx       : Integer;
  CantKeys  : Integer;
  campo     : String;
  campoOri  : String;
  campoDes  : String;
  KeyLocate : String;
  KeyValues : Variant;
begin

  //FDSOrigen.FieldDefs.Add('error',     ftBoolean);
  //FDSOrigen.FieldDefs.Add('error_str', ftString, 255);

  FDSOrigen.CreateTable;
  if FDSOrigen.Active
     then FDSOrigen.Close;
  FDSOrigen.Open;

  CSVSFOrigen.CSVFieldDelimiter := FFImportCSV.GetSeparadorCampo;

  FDSOrigen.LoadFromFileViaFormat( FFImportCSV.GetNombreArchivo, CSVSFOrigen);

  CantKeys  := TKeys.Count - 1;
  KeyValues := VarArrayCreate([0, CantKeys], varVariant);
  KeyLocate := Self.GetKeyLocate;

  FDSOrigen.First;
  while (not FDSOrigen.Eof) do
    begin

      Self.GetKeyValues(KeyValues);

      if FDSDestino.Locate(KeyLocate, KeyValues, [loCaseInsensitive])
         then begin
                FDSDestino.Editar;
                ini := 0;
                FDSPeriodos.First;
                while (not FDSPeriodos.EOF) do
                  begin
                    Inc(ini);
                    campoOri := PREFIJO_CAMPO + IntToStr(ini);
                    campoDes := NomCampoValue + FDSPeriodos.FieldByName(NomCampoKey).AsString;
                    FDSDestino.FieldByName(campoDes).Value := FDSOrigen.FieldByName(campoOri).Value;
                    FDSPeriodos.Next;
                  end;
                FDSDestino.Postear;
              end
         else
         if FImportarTodo then
               begin
                FDSDestino.append;
                for idx := 0 to TKeys.Count - 1 do
                  begin
                     campo          := TKeys.Strings[idx];
                     FDSDestino.FieldByName(campo).Value := FDSOrigen.FieldByName(campo).Value;
                  end;

                ini := 0;
                FDSPeriodos.First;
                while (not FDSPeriodos.EOF) do
                  begin
                    Inc(ini);
                    campoOri := PREFIJO_CAMPO + IntToStr(ini);
                    campoDes := NomCampoValue + FDSPeriodos.FieldByName(NomCampoKey).AsString;
                    FDSDestino.FieldByName(campoDes).Value := FDSOrigen.FieldByName(campoOri).Value;
                    FDSPeriodos.Next;
                  end;
                FDSDestino.Postear;


                 // ANTERIOR
                //Errores := True;
                //FDSOrigen.Editar;
                //FDSOrigen.FieldByName('error').AsBoolean    := True;
                //FDSOrigen.FieldByName('error_str').AsString := 'No encontro registro';
                //FDSOrigen.Postear;
               end;

      FDSOrigen.Next;
    end;

end;


procedure TjktImportCSV.GetKeyValues(var aKeyValue : Variant);
var
  idx   : Integer;
  campo : String;
begin
  for idx := 0 to TKeys.Count - 1 do
    begin
      campo          := TKeys.Strings[idx];
      aKeyValue[idx] := FDSOrigen.FieldByName(campo).Value;
    end;
end;


procedure TjktImportCSV.MostrarFormatoArchivo();
var
  idx     : Integer;
  formato : String;
begin

  formato := '';

  for idx := 0 to TKeys.Count - 1 do
    begin
      formato := formato + TKeys.Strings[idx] + ', ';
    end;

  for idx := 0 to TCampos.Count - 1 do
    begin
      formato := formato + TCampos.Strings[idx];
      if not (idx = TCampos.Count - 1)
         then formato := formato + ', ';
    end;

  FFImportCSV.SetFormatoArchivo(formato);

end;


function TjktImportCSV.GetKeyLocate() : String;
var
  idx    : Integer;
  locate : String;
begin

  locate := '';

  for idx := 0 to TKeys.Count - 1 do
    begin
      locate := locate + TKeys.Strings[idx];
      if not (idx = TKeys.Count - 1)
         then locate := locate + ';';
    end;

  result := locate;
end;


constructor TjktImportCSV.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  TKeys       := TStringList.Create();
  TCampos     := TStringList.Create();
  FDSOrigen   := TjktMemTable.Create(Self);
  CSVSFOrigen := TkbmCSVStreamFormat.Create(Self);
  FDSPeriodos := TjktMemTable.Create(Self);
  Errores     := False;
end;

destructor TjktImportCSV.Destroy();
begin
  FreeAndNil(TKeys);
  FreeAndNil(TCampos);
  FreeAndNil(FDSOrigen);
  FreeAndNil(FDSPeriodos);
  FreeAndNil(FFImportCSV);
  inherited Destroy();
end;

end.
