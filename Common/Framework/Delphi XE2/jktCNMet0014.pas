unit jktCNMet0014;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs ,
  jktCNMet0002, DB , kbmMemTable, jktFNMet0003;

const
  oid         = 'oid';
  codigo      = 'codigo';
  descripcion = 'descripcion';

type
  { Propiedades del Componente Help para uso Externo }
  TPropertysTjktHelp = class(TPersistent)
  private
     FClasificador  : Boolean;
     FComponente    : String;
     FServiceCaller : TjktServiceCaller;
     FOSName        : String;
     FQuery         : Integer;
     FRefreshDatos  : Boolean;
     FDataSetName   : String;
  published
    property Clasificador  : Boolean       read FClasificador  write FClasificador  default False;
    property Componente    : String        read FComponente    write FComponente;
    property ServiceCaller : TjktServiceCaller read FServiceCaller write FServiceCaller;
    property OSName        : String        read FOSName        write FOSName;
    property Query         : Integer       read FQuery         write FQuery;
    property RefreshDatos  : Boolean       read FRefreshDatos  write FRefreshDatos  default False;
    property DataSetName   : String        read FDataSetName   write FDataSetName;
  end;

  TNotifyAcepto = procedure(DataSet : TDataSet) of object;


  TjktHelpGenerico = class(TComponent)
  private
    { Private declarations }
    FTempMemTable  : TkbmMemTable;
    FSeleccionReg  : TkbmMemTable;
    FDataSource    : TDataSource;
    FRefreshDatos  : Boolean;
    FServiceCaller : TjktServiceCaller;

    FOid             : Integer;
    FOidRespuesta    : TIntegerField;
    FCodigo          : string;
    FCodigoRespuesta : TStringField;

    FDescripcion : string;
    FListaParams : TStringList;
    FListaValoresParams : TStringList;
    FSeleccionMultiple : boolean;
    FNotifyAcepto : TNotifyAcepto;
    FTipoFiltro : TjktTipoFiltro;
    FEntidad : string;
    procedure TraerDataSet();
    function SeleccionarRegistro() : Boolean;
    procedure ArmarOperHelpGenerico();
    procedure ValidateProperties();
    function cargarRegistrosMultiSelec(DataSet : TDataSet) : string;
    function getSeparadorCodigo() : string;
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function Ejecutar() : Boolean;
    function GetCodigo() : string;
    function GetOid() : integer;
    function GetDescripcion() : string;
    function GetDataSet () : TDataSet;
    function GetDataSource () : TDataSource;
    procedure clearParams();
    procedure addParam(ParamName : string ; valor : string );
    procedure setDataSet(DataSet : TDataSet);
    function validar(aCodigo : string;  raiseException : Boolean) : Boolean; overload;
    function validar(aOid    : Integer; raiseException : Boolean) : Boolean; overload;
    procedure LimpiarDataSets();
  published
    { Published declarations }
    property ServiceCaller : TjktServiceCaller read FServiceCaller write FServiceCaller;
    property Entidad : string read FEntidad write FEntidad;
    property TipoFiltro : TjktTipoFiltro read FTipoFiltro write FTipoFiltro default fi_Activos;
    property OidRespuesta : TIntegerField read FOidRespuesta write FOidRespuesta;
    property CodigoRespuesta : TStringField read FCodigoRespuesta write FCodigoRespuesta;

    property RefreshDatos : Boolean read FRefreshDatos write FRefreshDatos default False;
    property SeleccionMultiple : Boolean read FSeleccionMultiple write FSeleccionMultiple default false;
    property NotifyAcepto : TNotifyAcepto read FNotifyAcepto write FNotifyAcepto;

  end;


procedure Register;


implementation


procedure Register;
begin
  RegisterComponents('Jakarta', [TjktHelpGenerico]);
end;


constructor TjktHelpGenerico.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);

  FSeleccionReg := TkbmMemTable.Create(Self);

  FTempMemTable := TkbmMemTable.Create(Self);
  FTempMemTable.Name := 'TMemHlp' + IntToStr(AOwner.ComponentCount);

  FDataSource         := TDataSource.Create(Self);
  FDataSource.DataSet := FTempMemTable;

  FListaParams        := TStringList.Create;
  FListaValoresParams := TStringList.Create;

  FEntidad := '';
end;

function TjktHelpGenerico.Ejecutar(): Boolean;
begin
  Result := False;

  ValidateProperties;

  if FServiceCaller.ModoExecute then
    Exit;

  Result := SeleccionarRegistro();
end;

function TjktHelpGenerico.GetDataSet () : TDataSet;
begin
  Result := nil;

  if FServiceCaller.ModoExecute then
    Exit;

  Self.TraerDataSet();
  result := FTempMemTable;
end;

function TjktHelpGenerico.GetDataSource () : TDataSource;
begin
  Result := nil;

  if FServiceCaller.ModoExecute then
    Exit;

  if (not FTempMemTable.Active)
  or ((FTempMemTable.Active) and (FTempMemTable.IsEmpty))
  or FRefreshDatos
     then Self.TraerDataSet();

  Result := FDataSource;
end;

function TjktHelpGenerico.GetCodigo() : string;
begin
  result := FCodigo;
end;

function TjktHelpGenerico.GetDescripcion() : string;
begin
  result := FDescripcion;
end;

function TjktHelpGenerico.GetOid() : Integer;
begin
  result := FOid;
end;

procedure TjktHelpGenerico.TraerDataSet();
begin
  // Si no refresca los datos de la ayuda y la Tabla no esta vacia, no busco la
  // ayuda nuevamente.
  if not FRefreshDatos and (not FTempMemTable.IsEmpty) then
    Exit;

  // Si refresca los datos, cierra y abre la tabla para borrar los datos anteriores.
  if FRefreshDatos then
    begin
      FTempMemTable.Close;
      FTempMemTable.Open;
    end;
end;

procedure TjktHelpGenerico.ArmarOperHelpGenerico();
var
  i: Integer;
begin
  for i:=0 to FListaParams.Count-1 do
    FServiceCaller.addAtribute(FListaParams.Strings[i],FListaValoresParams.Strings[i]);
end;

function TjktHelpGenerico.SeleccionarRegistro(): Boolean;
var
  HelpDialog: TFMet003;
  CodigoMultiple: string;
begin
  Result := False;

  HelpDialog := TFMet003.Create(nil);
  try
    HelpDialog.Service.Host       := FServiceCaller.Host;
    HelpDialog.Service.Port       := FServiceCaller.Port;
    HelpDialog.Service.Servlet    := FServiceCaller.Servlet;
    HelpDialog.Service.Aplicacion := FServiceCaller.Aplicacion;
    HelpDialog.Service.Protocolo  := FServiceCaller.Protocolo;

    HelpDialog.Entidad       := FEntidad;
    HelpDialog.TipoFiltro    := FTipoFiltro;
    HelpDialog.SeleccionMultiple := Self.SeleccionMultiple;

    HelpDialog.OidFieldName    := oid;
    HelpDialog.CodFieldName    := codigo;
    HelpDialog.DescFieldName   := descripcion;
    HelpDialog.ResultFieldName := 'codigo';

    HelpDialog.ShowModal();
    if (HelpDialog.ModalResult = mrOk) then
      begin
        Result := True;

        FOid         := HelpDialog.mtInput.FieldByName(oid).AsInteger;
        FCodigo      := HelpDialog.mtInput.FieldByName(codigo).AsString;
        FDescripcion := HelpDialog.mtInput.FieldByName(descripcion).AsString;

        if not SeleccionMultiple then
          begin
            // Devuelvo los datos donde los quieren
            if Assigned(CodigoRespuesta) then
              begin
                if not (CodigoRespuesta.DataSet.State in [dsEdit, dsInsert]) then
                  CodigoRespuesta.DataSet.Edit();

                CodigoRespuesta.Value := GetCodigo();
              end;

            if Assigned(OidRespuesta) then
              begin
                if not (OidRespuesta.DataSet.State in [dsEdit, dsInsert]) then
                  OidRespuesta.DataSet.Edit();

                OidRespuesta.Value := GetOid();
              end;
          end
        else
          begin
            CodigoMultiple := cargarRegistrosMultiSelec(FTempMemTable);
            FCodigo := CodigoMultiple;
            // Envio una tabla con los registros seleccionados!
            if (Assigned(FNotifyAcepto)) then FNotifyAcepto(FSeleccionReg);

            if Assigned(CodigoRespuesta) then
              begin
                if not (CodigoRespuesta.DataSet.State in [dsEdit, dsInsert]) then
                  CodigoRespuesta.DataSet.Edit();

                CodigoRespuesta.Value := CodigoMultiple;
              end;
          end;
      end;
  finally
    HelpDialog.Free();
  end;
end;

destructor TjktHelpGenerico.Destroy;
begin
  FListaParams.Free;
  FListaValoresParams.Free;

  inherited Destroy;
end;

procedure TjktHelpGenerico.clearParams();
begin
  FListaParams.Clear;
  FListaValoresParams.Clear;
end;

procedure TjktHelpGenerico.addParam(ParamName : string ; valor : string );
var
  indice : integer;
begin
  indice := FListaParams.IndexOf(ParamName);
  if (indice<>-1)
     then begin
          FListaParams.Delete(indice);
          FListaValoresParams.Delete(indice);
          end;
   FListaParams.Add(ParamName);
   FListaValoresParams.Add(valor);
end;

procedure TjktHelpGenerico.setDataSet(DataSet : TDataSet);
begin
  FTempMemTable.LoadFromDataSet(DataSet,[]);
end;

function TjktHelpGenerico.cargarRegistrosMultiSelec(DataSet : TDataSet) : string;
var
  codigoMultiple : string;
begin
  codigoMultiple := '';

  FSeleccionReg.Close;
  FSeleccionReg.Open;

  DataSet.First;
  while (not DataSet.EOF) do
    begin
      if (DataSet.FieldByName('seleccionado').AsBoolean)
          then begin
                 FSeleccionReg.Append;
                 FSeleccionReg.FieldByName('oid').AsInteger := DataSet.FieldByName('oid').AsInteger;
                 FSeleccionReg.FieldByName('codigo').AsString := DataSet.FieldByName('codigo').AsString;
                 FSeleccionReg.FieldByName('descripcion').AsString := DataSet.FieldByName('descripcion').AsString;

                 if (codigoMultiple <> '')
                    then codigoMultiple := codigoMultiple + getSeparadorCodigo() + DataSet.FieldByName('codigo').AsString
                    else codigoMultiple := DataSet.FieldByName('codigo').AsString;
               end;
      DataSet.Next;
    end;

  if (FSeleccionReg.State in [dsEdit, dsInsert])
     then FSeleccionReg.Post;

  result := codigoMultiple;
end;

function TjktHelpGenerico.validar(aCodigo : String; raiseException : Boolean) : Boolean;
begin
  Result := False;

  if FServiceCaller.ModoExecute then
    Exit;

  Self.TraerDataSet();

  if not FTempMemTable.Locate('codigo',aCodigo,[loCaseInsensitive])
     then begin
            if raiseException
               then raise Exception.Create('Codigo Inexistente');
          end
     else begin
            result       := True;
            FOid         := FTempMemTable.FieldByName(oid).AsInteger;
            FCodigo      := FTempMemTable.FieldByName(codigo).AsString;
            FDescripcion := FTempMemTable.FieldByName(descripcion).AsString;
          end;
end;

function TjktHelpGenerico.validar(aOid : Integer; raiseException : Boolean) : Boolean;
begin
  Result := False;

  if FServiceCaller.ModoExecute then
    Exit;

  Self.TraerDataSet();

  if not FTempMemTable.Locate('oid',aOid,[loCaseInsensitive]) then
    begin
      result := False;
      FOid         := 0;
      FCodigo      := '';
      FDescripcion := '';
      if raiseException
         then raise Exception.Create('Registro Inexistente ');
    end
  else
    begin
      result       := True;
      FOid         := FTempMemTable.FieldByName(oid).AsInteger;
      FCodigo      := FTempMemTable.FieldByName(codigo).AsString;
      FDescripcion := FTempMemTable.FieldByName(descripcion).AsString;
    end;
end;

procedure TjktHelpGenerico.ValidateProperties;
begin
  if (FServiceCaller = nil) then
    raise Exception.Create('La propiedad ServiceCaller no fue asignada');

  if (FEntidad = '') then
    raise Exception.Create('La propiedad Entidad no fue asignada');
end;

procedure TjktHelpGenerico.LimpiarDataSets();
begin
  if Assigned(FTempMemTable) and (FTempMemTable.Active) then
    FTempMemTable.EmptyTable;

  if Assigned(FSeleccionReg) and (FSeleccionReg.Active) then
    FSeleccionReg.EmptyTable;
end;

function TjktHelpGenerico.getSeparadorCodigo(): String;
begin

end;


end.
