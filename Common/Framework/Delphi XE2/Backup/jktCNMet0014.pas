unit jktCNMet0014;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs ,
  jktCNMet0002, DB , kbmMemTable, jktFNMet0003;

const
  oid         = 'oid';
  codigo      = 'codigo';
  descripcion = 'descripcion';
  selec       = 'seleccionado';

type
  { Propiedades del Componente Help para uso Externo }
  TPropertysTjktHelp = class(TPersistent)
  private
     FClasificador : Boolean;
     FComponente   : String;
     FOperacion    : TjktServiceCaller;
     FOSName       : String;
     FQuery        : Integer;
     FRefreshDatos : Boolean;
     FDataSetName  : String;
  published
    property Clasificador : Boolean       read FClasificador  write FClasificador  default False;
    property Componente   : String        read FComponente    write FComponente;
    property Operacion    : TjktServiceCaller read FOperacion     write FOperacion;
    property OSName       : String        read FOSName        write FOSName;
    property Query        : Integer       read FQuery         write FQuery;
    property RefreshDatos : Boolean       read FRefreshDatos  write FRefreshDatos  default False;
    property DataSetName  : String        read FDataSetName   write FDataSetName;
  end;

  TSetHlpActivo = (tHlpServerDataSet, tHlpLocalDataSet);

  TNotifyAcepto = procedure (DataSet : TDataSet) of object;


  TjktHelp = class(TComponent)
  private

  protected

  public

  published

  end;


  TjktHelpGenerico = class(TjktHelp)
  private
    { Private declarations }
    FTempMemTable   : TkbmMemTable;
    FSeleccionReg   : TkbmMemTable;
    FTempMemTableParam : TkbmMemTable;
    FDataSource     : TDataSource;
    FOSName         : String;
    FComponente     : String;
    FSeparador      : String;
    FQuery          : Integer;
    FUnirCodigoDesc : Boolean;
    FRefreshDatos   : Boolean;
    FOperacion      : TjktServiceCaller;
    FOid            : integer;
    FCodigo         : String;
    FDescripcion    : String;
    FSetHlpActivo   : TSetHlpActivo;
    FListaParams    : TStringList;
    FListaValoresParams : TStringList;
    FClasificador   : Boolean;
    FSeleccionMultiple : boolean;
    FNotifyAcepto : TNotifyAcepto;
    FNombreOperHelp : string;
    FFormNameABM : string;
    FAltaNuevos  : boolean;
    procedure TraerDataSet ();
    function SeleccionarRegistro(aFieldCodigo : TField) : boolean;
    procedure ArmarOperHelpGenerico();
    procedure ArmarOperHelpMetaClass();
    function cargarRegistrosMultiSelec(DataSet : TDataSet) : string;
    function getSeparadorCodigo(): String;
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function Help(aFieldCodigo : TField) : Boolean;
    function GetCodigo() : String;
    function GetOid() : integer;
    function getDescripcion() : string;
    function GetDataSet () : TDataSet;
    function GetDataSource () : TDataSource;
    function mostrarHelp() : boolean;
    function GetSelectedRecord(): TkbmMemTable;
    procedure clearParams();
    procedure addParam(ParamName : string ; valor : string );
    procedure setDataSet(DataSet : TDataSet);
    function validar(aCodigo : String;  raiseException : Boolean) : Boolean; overload;
    function validar(aOid    : Integer; raiseException : Boolean) : Boolean; overload;
    procedure LimpiarDataSets();
  published
    { Published declarations }
    property AltaNuevos  : boolean read fAltaNuevos write fAltaNuevos;
    property FormNameABM    : string read fFormNameABM write fFormNameABM;
    property OSName         : String        read FOSName         write FOSName;
    property Componente     : String        read FComponente     write FComponente;
    property Query          : Integer       read FQuery          write FQuery;
    property UnirCodigoDesc : Boolean       read FUnirCodigoDesc write FUnirCodigoDesc default False;
    property RefreshDatos   : Boolean       read FRefreshDatos   write FRefreshDatos   default False;

    property Operacion      : TjktServiceCaller read FOperacion      write FOperacion;
    property SetHlpActivo   : TSetHlpActivo read FSetHlpActivo   write FSetHlpActivo   default tHlpServerDataSet;
    property Clasificador   : Boolean       read FClasificador   write FClasificador   default False;
    property SeleccionMultiple : boolean read FSeleccionMultiple write FSeleccionMultiple default false;
    property NotifyAcepto : TNotifyAcepto read FNotifyAcepto write FNotifyAcepto;
    property NombreOperHelp : string read FNombreOperHelp write FNombreOperHelp;
  end;


procedure Register;


implementation


procedure Register;
begin
  RegisterComponents('Jakarta', [TjktHelpGenerico]);
end;


constructor TjktHelpGenerico.create(AOwner : TComponent);
begin
  inherited create(AOwner);

  FSeleccionReg := TkbmMemTable.Create(Self);
  FSeleccionReg.FieldDefs.Add(oid,         ftInteger, 0,  false);
  FSeleccionReg.FieldDefs.Add(codigo,      ftString,  50, false);
  FSeleccionReg.FieldDefs.Add(descripcion, ftString,  1000, false);

  //FSeleccionMultiple := false;
  FTempMemTable      := TkbmMemTable.Create(Self);
  FTempMemTable.FieldDefs.Add(oid,         ftInteger, 0,  false);
  FTempMemTable.FieldDefs.Add(codigo,      ftString,  50, false);
  FTempMemTable.FieldDefs.Add(descripcion, ftString,  1000, false);
  FTempMemTable.FieldDefs.Add(selec,       ftBoolean,  0, false);

  FTempMemTableParam  := TkbmMemTable.Create(Self);
  FTempMemTableParam.FieldDefs.Add('separador', ftString,  1000, false);

// Para no duplicar los nombres de los DataSet.
{$IFDEF PRUEBA}
  FTempMemTable.Name := Self.Name;
{$ELSE}
  FTempMemTable.Name := 'TMemHlp' + IntToStr(AOwner.ComponentCount);
  FTempMemTableParam.Name := 'FTempMemTableParam';
{$ENDIF}
  FTempMemTable.Close;
  FTempMemTable.Open;

  FTempMemTableParam.Close;
  FTempMemTableParam.Open;

  FDataSource         := TDataSource.Create(Self);
  FDataSource.DataSet := FTempMemTable;

  FQuery := 3;

  FListaParams        := TStringList.Create;
  FListaValoresParams := TStringList.Create;

  FNombreOperHelp := '';

end;


function TjktHelpGenerico.Help (aFieldCodigo : TField) : boolean;
begin
  if (FOperacion.ModoExecute)
     then Exit;
  Self.TraerDataSet();
  result := Self.SeleccionarRegistro(aFieldCodigo);
end;


function TjktHelpGenerico.GetDataSet () : TDataSet;
begin
  if (FOperacion.ModoExecute)
     then Exit;

  Self.TraerDataSet();
  result := FTempMemTable;
end;


function TjktHelpGenerico.GetDataSource () : TDataSource;
begin
  if (FOperacion.ModoExecute)
     then Exit;

  if (not FTempMemTable.Active)
  or ((FTempMemTable.Active) and (FTempMemTable.IsEmpty))
  or FRefreshDatos
     then Self.TraerDataSet();

  result := FDataSource;
end;


function TjktHelpGenerico.GetCodigo() : String;
begin
  result := fCodigo;
end;

function TjktHelpGenerico.GetDescripcion() : String;
begin
  result := fDescripcion;
end;

function TjktHelpGenerico.GetOid() : Integer;
begin
  result := fOid;
end;


procedure TjktHelpGenerico.TraerDataSet();
begin

  if (FSetHlpActivo = tHlpLocalDataSet) then Exit;

// Si no refresca los datos de la ayuda y la Tabla no esta vacia, no busco la
// ayuda nuevamente.
   if (not FRefreshDatos )
  and (not FTempMemTable.IsEmpty )
      then Exit;

// Si refresca los datos, cierra y abre la tabla para borrar los datos anteriores.
  if ( FRefreshDatos )
     then begin
            FTempMemTable.Close;
            FTempMemTable.Open;
          end;

// Para no duplicar los nombres de los DataSet.
{$IFDEF PRUEBA}
  Randomize;
  FTempMemTable.Name := Self.Name + Inttostr(random(1000000));
{$ELSE}
  //FTempMemTable.Name := FTempMemTable.Name + FOSName;
{$ENDIF}
  if (Self.Name = '')
     then begin
          Randomize;
          FTempMemTable.Name := 'THelp' + Inttostr(random(1000000));
          end;


  FOperacion.asignarDataSet(FTempMemTable.Name, FTempMemTable);

  FOperacion.InicioOperacion;

  if not FClasificador
     then begin
          if (self.OSName = '') then Exit;
          Self.ArmarOperHelpGenerico();
          end
     else Self.ArmarOperHelpMetaClass();

  FOperacion.execute;
end;

procedure TjktHelpGenerico.ArmarOperHelpGenerico();
var
  i : integer;

begin
  if (FNombreOperHelp<>'')
     then FOperacion.setOperacion(FNombreOperHelp)
     else FOperacion.setOperacion('HelpGenerico');

  FOperacion.addElement  (1, 'Tabla');
  FOperacion.addAtribute ('nombre', 'Params');

  FOperacion.addElement  (2, 'Fila');
  FOperacion.addAtribute ('OSName',  FOSName);
  FOperacion.addAtribute ('query',   IntToStr( FQuery ) );
  FOperacion.addAtribute ('dataset', FTempMemTable.Name);

  for i:=0 to FListaParams.Count-1 do
    FOperacion.addAtribute(FListaParams.Strings[i],FListaValoresParams.Strings[i]);

  if ( FUnirCodigoDesc )
     then FOperacion.addAtribute ('UnirCodigoDesc', 'true');

end;

procedure TjktHelpGenerico.ArmarOperHelpMetaClass();
var
  i           : integer;
begin

  if (FNombreOperHelp<>'')
     then FOperacion.setOperacion(FNombreOperHelp)
     else FOperacion.setOperacion('HelpMetaClass');

  FOperacion.addElement  (1, 'Tabla');
  FOperacion.addAtribute ('nombre', 'Params');

  FOperacion.addElement  (2, 'Fila');
  FOperacion.addAtribute ('OSCompoName',       FOSName);
  FOperacion.addAtribute ('codigo_componente', FComponente );
  FOperacion.addAtribute ('dataset',           FTempMemTable.Name);

  for i:=0 to FListaParams.Count-1 do
    FOperacion.addAtribute(FListaParams.Strings[i],FListaValoresParams.Strings[i]);

  if ( FUnirCodigoDesc )
     then FOperacion.addAtribute ('UnirCodigoDesc', 'true');
end;


function TjktHelpGenerico.SeleccionarRegistro(aFieldCodigo : TField) : boolean;
var
  HelpDialog: TFMet003;
  CodigoMultiple : string;
begin
  result := false;
  HelpDialog := TFMet003.Create(Nil);
  try
    HelpDialog.FormNameABM := self.FormNameABM;
    HelpDialog.AllowNuevos := self.AltaNuevos;
    HelpDialog.DataSet         := FTempMemTable;
    HelpDialog.SeleccionMultiple := self.SeleccionMultiple;
    HelpDialog.OidFieldName    := oid;
    HelpDialog.CodFieldName    := codigo;
    HelpDialog.DescFieldName   := descripcion;
    HelpDialog.ResultFieldName := 'codigo';
    HelpDialog.ShowModal();
    if (HelpDialog.ModalResult = mrOk)
       then begin
              result       := true;
              fOid         := FTempMemTable.FieldByName(oid).AsInteger;
              fCodigo      := FTempMemTable.FieldByName(codigo).AsString;
              fDescripcion := FTempMemTable.FieldByName(descripcion).AsString;

              if (not SeleccionMultiple)
                 then begin
                      if Assigned(aFieldCodigo)
                         then begin
                              if (not (aFieldCodigo.DataSet.State in [dsEdit, dsInsert]))
                                 then aFieldCodigo.DataSet.Edit();
                              aFieldCodigo.Value := getCodigo();
                              end;
                      end
                 else begin
                        CodigoMultiple := cargarRegistrosMultiSelec(FTempMemTable);
                        self.fCodigo   := CodigoMultiple;
                        if (Assigned(FNotifyAcepto))
                           then FNotifyAcepto(FSeleccionReg);
                        if Assigned(aFieldCodigo)
                           then begin
                                  if (not (aFieldCodigo.DataSet.State in [dsEdit, dsInsert]))
                                     then aFieldCodigo.DataSet.Edit();
                                  aFieldCodigo.Value := CodigoMultiple;
                                end;
                      end;
            end;
  finally
    HelpDialog.Free();
  end;
end;

destructor TjktHelpGenerico.destroy;
begin
  FListaParams.Free;
  FListaValoresParams.Free;
  inherited destroy;
end;

function TjktHelpGenerico.mostrarHelp() : boolean;
begin
  if (FOperacion.ModoExecute)
     then Exit;
  result := Help(Nil);
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

function TjktHelpGenerico.GetSelectedRecord(): TkbmMemTable;
begin
(*
  -- vieja implementacion, no se usaba en ningun proyecto y estaba mal --
  HelpDialog := TFMet003.Create(Nil);
  try
    HelpDialog.DataSet         := FTempMemTable;
    HelpDialog.OidFieldName    := oid;
    HelpDialog.CodFieldName    := codigo;
    HelpDialog.DescFieldName   := descripcion;
    HelpDialog.SelecFieldName  := selec;
    HelpDialog.ResultFieldName := 'codigo';
    HelpDialog.MostrarColSelec := True;
    HelpDialog.ShowModal();

    DasetResult:= TkbmMemTable.Create(Self);    // Crea DasetResult
    DasetResult.CreateTableAs(HelpDialog.DataSet, []);    // Copia la estructura

    if ( HelpDialog.ModalResult = mrOk )
       then begin
              HelpDialog.DataSet.First;
              while not HelpDialog.DataSet.Eof do
                begin
                  if HelpDialog.DataSet.FieldByName('selec').AsBoolean
                     then begin
                            DasetResult.Append;
                            DasetResult.FieldByName('oid').AsInteger        :=  HelpDialog.DataSet.FieldByName('oid').AsInteger;
                            DasetResult.FieldByName('codigo').AsString      :=  HelpDialog.DataSet.FieldByName('codigo').AsString;
                            DasetResult.FieldByName('descripcion').AsString :=  HelpDialog.DataSet.FieldByName('descripcion').AsString;
                            DasetResult.Post;
                          end;
                  HelpDialog.DataSet.Next;
                end;

              result := DasetResult;
            end;
  finally
    HelpDialog.Free();
  end;
*)
  result := FSeleccionReg;
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

                 if (codigoMultiple<>'')
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
  if (FOperacion.ModoExecute)
     then Exit;

  result := False;

  Self.TraerDataSet();

  if not FTempMemTable.Locate('codigo',aCodigo,[loCaseInsensitive])
     then begin
            if raiseException
               then raise Exception.Create('Codigo Inexistente ');
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
  if (FOperacion.ModoExecute)
     then Exit;

  Self.TraerDataSet();

  if not FTempMemTable.Locate('oid',aOid,[loCaseInsensitive])
     then begin
            result := False;
            FOid         := 0;
            FCodigo      := '';
            FDescripcion := '';
            if raiseException
               then raise Exception.Create('Registro Inexistente ');
          end
     else begin
            result       := True;
            FOid         := FTempMemTable.FieldByName(oid).AsInteger;
            FCodigo      := FTempMemTable.FieldByName(codigo).AsString;
            FDescripcion := FTempMemTable.FieldByName(descripcion).AsString;
          end;
end;


procedure TjktHelpGenerico.LimpiarDataSets();
begin
  if (Assigned(FTempMemTable))
 and (FTempMemTable.Active)
     then FTempMemTable.EmptyTable;

  if (Assigned(FSeleccionReg))
 and (FSeleccionReg.Active)
     then FSeleccionReg.EmptyTable;

end;

function TjktHelpGenerico.getSeparadorCodigo(): String;
begin
  if ( FSeparador = '' )
     then begin
            FOperacion.asignarDataSet('FTempMemTableParam', FTempMemTableParam);
            FOperacion.InicioOperacion;
            FOperacion.setOperacion('TraerSeparadorCodigo');
            FOperacion.execute;

            FTempMemTableParam.First;
            FSeparador := FTempMemTableParam.FieldByName('separador').AsString;
          end;
  result := FSeparador;
end;

end.
