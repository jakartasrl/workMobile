unit jktCNMet0001;

interface

{ Este componente genera eventos para el control de los ABM }


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, Vcl.ActnList, db, kbmMemTable, dxRibbonStatusBar,
  jktCNMet0010, jktMisc0001, jktCNMet0012, jktCNMet0030, jktCNMet0014;

type
  TjktOpcion = (opImprimir, opExportar, opImportar);
                // Tras agregar property TipoPrograma, ahora se habilitan o
                // deshabilitan ciertos botones de la Ribbon según el TipoPrograma
                // seleccionado.
                // Se quitan entonces las siguientes Opciones:
                // 'opNuevo', 'opBaja', 'opBuscar' , 'opEjecutar',
                // 'opLookUp', 'opCustom'

  TjktOpciones = set of TjktOpcion;

  TjktEstado   = (esAlta, esEdit, esRehabilita, esNil);

  TjktTipoPrograma = (tp_abmLista, tp_abmListaConFiltro, tp_abmIndividual);

  TLineaMensajeEvent = procedure(Sender: TObject; Texto: string) of object;

type

  TjktDriver = class(TComponent)
  private
    { Private declarations }
    FConfirmarCancelacion : Boolean;
    FDataSetCab           : TDataSet;
    FEstado               : TjktEstado;
    FTipoPrograma         : TjktTipoPrograma;
    FFocoEnAlta           : TField;
    FFocoEnModificacion   : TField;
    FOperacionSave        : TjktOperacion;
    FOperacionTraer       : TjktOperacion;
    FActionList           : TActionList;
    FOperacionesIniciales : TjktOperacionesList;
    FOperacionesDefault   : TjktOperacionesList;
    FFiltro               : TjktHelpGenerico;
    {********   Eventos   ********}
//    FOnSetDefaults        : TNotifyEvent;
    FOnFiltrar            : TNotifyEvent;
    FOnEliminar           : TNotifyEvent;
    FOnReHabilitar        : TNotifyEvent;
    FOnCancel             : TNotifyEvent;
    FOnCompletarCampos    : TNotifyEvent;
    FOnEjecutar           : TNotifyEvent;
    FOnNuevo              : TNotifyEvent;
    FOnGuardar            : TNotifyEvent;
    FOnCustomToolButton   : TNotifyEvent;
    FOnImprimir           : TNotifyEvent;

    procedure DoSetDefaults;
    procedure DoSetFocoAlta;
    procedure DoSetFocoModi;
    procedure AnalizarDataSet;
    procedure Filtrar;
    procedure DoCancel;
    procedure DoCloseDataSet;
    procedure DoEliminar;
    procedure DoRehabilitar;
    procedure DoLineaMensaje(aTexto :string);
    procedure DoInhibirBotones;
    procedure DoBotonesInicio;
    procedure DoBotonesNew;
    procedure DoBotonesFiltrar;
    procedure DoBotonesOpenReha;
    procedure DoBotonesEjecutar;
    procedure DoInhibirBotonSig;
    procedure DoDesInhibirBotonSig;
    procedure DoInhibirBotonAnt;
    procedure DoDesInhibirBotonAnt;
    procedure DoProximo;
    procedure DoAnterior;
    procedure DoOperacionTraer;
    procedure DoEjecutar;
    procedure DoNuevo;
    procedure DoGuardar;
    procedure DoCustomToolButton;
    procedure abrirDataSets;
    procedure cerrarDataSets;
    procedure postDataSets;
    procedure DoImprimir;
    function  verModificados: Boolean;
    procedure TratarMensajeException(excep : Exception);
    procedure enabledAction(actionName :string;  enabled :boolean);
    procedure DoDesInhibirCamposNoModificables;
    procedure DoInhibirCamposNoModificables;
    procedure modificarReadOnly(aValue :boolean);
    procedure ejecutarListaOperaciones(aListaOper :TjktOperacionesList) ;

  protected
    { Protected declarations }
    FOpciones : TjktOpciones;
    nivel     : integer;
    FNoAutoEditarDataSets : Boolean;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;

    procedure Inicio;
    procedure New;
    procedure Eliminar;
    procedure Rehabilitar;
    procedure Guardar;
    procedure Proximo;
    procedure Anterior;
    procedure ActualizarEstadoBotones;
    procedure FiltrarActivos;
    procedure FiltrarInactivos;
    procedure FiltrarAvanzado;
    procedure Ejecutar;
    procedure Imprimir;
    procedure CustomToolButton;
    procedure OpenRehabilitar;
    procedure doOperacionesIniciales;
    procedure doOperacionesDefault;

    function CanClose: Boolean;
    function esNuevo(): Boolean;
    function esAbrir(): Boolean;
    function Cancelar: Boolean;

    property Estado : TjktEstado read FEstado;

  published
    { Published declarations }
    property NoAutoEditarDataSets  : Boolean read FNoAutoEditarDataSets write FNoAutoEditarDataSets;
    property DataSetCab            : TDataSet read FDataSetCab          write FDataSetCab;
    property OperacionSave         : TjktOperacion  read FOperacionSave write FOperacionSave;
    property OperacionTraer        : TjktOperacion  read FOperacionTraer write FOperacionTraer;
    property ActionList            : TActionList read FActionList write FActionList;
    property ConfirmarCancelacion  : Boolean read FConfirmarCancelacion write FConfirmarCancelacion;

    property Opciones              : TjktOpciones     read FOpciones     write FOpciones;
    property TipoPrograma          : TjktTipoPrograma read FTipoPrograma write FTipoPrograma;
    property Filtro                : TjktHelpGenerico read FFiltro       write FFiltro;
    property FocoEnAlta            : TField read FFocoEnAlta         write FFocoEnAlta;
    property FocoEnModificacion    : TField read FFocoEnModificacion write FFocoEnModificacion;
    property OperacionesIniciales  : TjktOperacionesList read FOperacionesIniciales write FOperacionesIniciales;
    property OperacionesDefault    : TjktOperacionesList read FOperacionesDefault   write FOperacionesDefault;

//    property OnSetDefaults         :TNotifyEvent read FOnSetDefaults        write FOnSetDefaults;
    property OnEliminar            :TNotifyEvent read FOnEliminar           write FOnEliminar;
    property OnRehabilitar         :TNotifyEvent read FOnRehabilitar        write FOnRehabilitar;
    property OnCancel              :TNotifyEvent read FOnCancel             write FOnCancel;
    property OnCompletarCampos     :TNotifyEvent read FOnCompletarCampos    write FOnCompletarCampos;
    property OnFiltrar             :TNotifyEvent read FOnFiltrar            write FOnFiltrar;
    property OnEjecutar            :TNotifyEvent read FOnEjecutar write FOnEjecutar;
    property OnNuevo               :TNotifyEvent read FOnNuevo write FOnNuevo;
    property OnGuardar             :TNotifyEvent read FOnGuardar write FOnGuardar;
    property OnCustomToolButton    :TNotifyEvent read FOnCustomToolButton write FOnCustomToolButton;
    property OnImprimir            :TNotifyEvent read FOnImprimir write FOnImprimir;
  end;

procedure Register;

implementation

uses
  jktFNMet0008, jktCNTypes;

procedure Register;
begin
  RegisterComponents('Jakarta', [TjktDriver]);
end;

constructor TjktDriver.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FOperacionesIniciales := TjktOperacionesList.Create(self);
  FOperacionesDefault   := TjktOperacionesList.Create(self);

  Self.FEstado := esNil;
end;

destructor TjktDriver.Destroy;
begin
  FDataSetCab := nil;
  FOperacionesIniciales.Free;
  FOperacionesDefault.Free;

  inherited Destroy;
end;

procedure TjktDriver.Inicio;
begin
  if (FTipoPrograma = tp_abmLista) and (Self.FEstado = esNil) then
    begin
      DoBotonesInicio;
      Filtrar;
    end
  else
    begin
      Self.FEstado := esNil;
      Self.ActualizarEstadoBotones;
    end;
end;

procedure TjktDriver.DoInhibirBotones;
var
  x: Integer;
begin
  if not Assigned(FActionList) then Exit;

  for x := 0 to FActionList.ActionCount - 1 do
    begin
       TAction(FActionList.Actions[x]).Enabled := False;
    end;
end;

procedure TjktDriver.New;
begin
  try
    Self.FEstado := esAlta;
    Self.ActualizarEstadoBotones;

    Self.DoNuevo;
  except
    on E: Exception do
      begin
        Self.TratarMensajeException(E);
        Self.Cancelar;
      end;
  end;
end;


procedure TjktDriver.OpenRehabilitar;
begin
  try
    Self.FEstado := esRehabilita;
    Self.ActualizarEstadoBotones;

    Self.DoOperacionTraer;
    Self.DoSetFocoModi;
    if (Self.FDataSetCab <> nil)
       then begin
              FDatasetCab.first;
              FDatasetCab.Edit;
            end;
    Self.AnalizarDataSet;
  except
    on E: Exception do
       begin
         self.TratarMensajeException(E);
         self.cancelar;
       end;
  end;
end;

procedure TjktDriver.Eliminar;
begin
  Self.DoEliminar;
end;

procedure TjktDriver.Rehabilitar;
begin
  Self.DoRehabilitar;
end;

procedure TjktDriver.Proximo;
begin
  Self.DoProximo;
end;

procedure TjktDriver.Ejecutar;
begin
  if (FDataSetCab <> nil)  and ((FDataSetCab.State  = dsInsert) or (FDataSetCab.State  = dsEdit))
     then  FDataSetCab.Post;

  Self.DoEjecutar;
  Self.DoBotonesEjecutar;
end;

procedure TjktDriver.Imprimir;
begin
  if (FDataSetCab <> nil)  and ((FDataSetCab.State  = dsInsert) or (FDataSetCab.State  = dsEdit))
     then  FDataSetCab.Post;

  Self.DoImprimir;
end;

procedure TjktDriver.Anterior;
begin
  Self.DoAnterior;
end;

procedure TjktDriver.DoEjecutar;
begin
end;

procedure TjktDriver.DoImprimir;
begin
  if Assigned(FOnImprimir)
     then FOnImprimir(self);
end;

procedure TjktDriver.DoSetDefaults;
begin
   self.doOperacionesDefault;
end;

procedure TjktDriver.DoBotonesNew;
begin
  enabledAction('acNew',  false);
  enabledAction('acFind', false);
  enabledAction('acFindRemoved', false);
  enabledAction('acSave', true);
  enabledAction('acCancel', true);

  if (opImprimir in FOpciones)
    then     enabledAction('acPrint', true)
    else if (opImportar in FOpciones)
    then     enabledAction('acImport', true)
    else if (opExportar in FOpciones)
    then     enabledAction('acExport', true);
end;

procedure TjktDriver.DoBotonesFiltrar;
begin
  enabledAction('acNew',  false);
  enabledAction('acFind', false);
  enabledAction('acFindRemoved', false);
  enabledAction('acSave', true);
  enabledAction('acCancel', true);

  if (opImprimir in FOpciones)
    then     enabledAction('acPrint',  true)
    else if (opImportar in FOpciones )
    then     enabledAction('acImport', true)
    else if (opExportar in FOpciones)
    then     enabledAction('acExport', true);
end;

procedure TjktDriver.DoBotonesInicio;
begin
  Self.DoInhibirBotones;

  // Por ahora, si es 'tp_abmLista' (ABM con una grilla) solo mostramos el
  // boton 'Buscar' ya que, al no tener un Filtro, nos traera TODOS los
  // registros en la grilla (los Activos e Inactivos).
  if FTipoPrograma = tp_abmIndividual then
    begin
      enabledAction('acNew', True);
      enabledAction('acFindRemoved', True);
    end;
  enabledAction('acFind', True);
end;

procedure TjktDriver.DoBotonesOpenReha;
begin
end;

procedure TjktDriver.DoBotonesEjecutar;
begin
end;

procedure TjktDriver.DoSetFocoAlta;
begin
  if Assigned(FFocoEnAlta) then
    FFocoEnAlta.FocusControl;
end;

procedure TjktDriver.DoSetFocoModi;
begin
  if Assigned(FFocoEnModificacion) then
    FFocoEnModificacion.FocusControl;
end;

function TjktDriver.Cancelar : Boolean;
begin
  Result := True;

  if (ConfirmarCancelacion) and (FDataSetCab <> nil) and (FDataSetCab.State <> dsInactive)
    and (Self.verModificados) then begin
      if MessageDlg('Perderá los datos editados, ¿Confirma Cancelar?', mtConfirmation,
        [mbYes, mbNo], 0) = mrYes then begin
          Self.DoCancel;
          Self.DoCloseDataSet;
          Self.Inicio;
      end else begin
        Result := False;
      end
  end else begin
    Self.DoCancel;
    Self.DoCloseDataSet;
    Self.Inicio;
  end;
end;


function TjktDriver.verModificados :boolean;
begin
  Result := False;

  if ( FDataSetCab.State in [dsEdit, dsInsert] )
    then begin
      Result := True;
      Exit;
    end;

  // analizar una mejor forma de verificar si hubo registros que se modificaron
  FDataSetCab.First;
  while not FDataSetCab.Eof do
    begin
      if (FDataSetCab.FindField('modif') <> nil) and
         (FDataSetCab.FieldByName('modif').AsBoolean = True)
        then begin
          Result := True;
          Break;
        end;

      FDataSetCab.Next;
    end;
end;

procedure TjktDriver.Guardar;
begin
  Self.postDataSets;

  try
    DoGuardar;

    if (FTipoPrograma = tp_abmIndividual) then
      begin
        Self.DoCloseDataSet;

        if (FEstado = esAlta) then
          Self.DoNuevo

        else if (FEstado = esEdit) then
          Self.Inicio;
      end
    else if (FTipoPrograma = tp_abmLista) then
      begin
        Self.DoOperacionTraer;
        if FDatasetCab <> nil then begin
          FDataSetCab.First;
          FDataSetCab.Edit;
        end;
        Self.AnalizarDataSet;
      end;
  except
    on E: Exception do
      begin
        Self.TratarMensajeException(E);
        if FDatasetCab <> nil then
          FDataSetCab.Edit;
      end;
  end;
end;

procedure TjktDriver.ActualizarEstadoBotones;
begin
  if FEstado = esNil then
    begin
      DoBotonesInicio;
      DoLineaMensaje(' ');
    end
  else if FEstado = esAlta then
    begin
      DoBotonesNew;
      DoLineaMensaje('Alta');
    end
  else if FEstado = esEdit then
    begin
      DoBotonesFiltrar;
      DoLineaMensaje('Edicion');
    end
  else if FEstado = esRehabilita then
    begin
      DoBotonesOpenReha;
      DoLineaMensaje('Rehabilitar');
    end
end;

procedure TjktDriver.AnalizarDataSet;
begin
  if FDataSetCab <> nil then
    begin
       if FDataSetCab.EOF
          then self.doInhibirBotonSig()
          else self.doDesInhibirBotonSig();

       if FDataSetCab.BOF
          then self.doInhibirBotonAnt()
          else self.doDesInhibirBotonAnt();
    end;
end;

procedure TjktDriver.DoNuevo;
begin
  Self.DoDesInhibirCamposNoModificables;
  Self.abrirDataSets;
  // agregar InhibirControlesXSeguridad
  Self.DoSetDefaults;
  Self.DoSetFocoAlta;

  if Assigned(FOnNuevo) then
    FOnNuevo(Self);
end;

procedure TjktDriver.DoGuardar;
begin
  if not Assigned(FOperacionSave) then
    raise Exception.Create('No esta asignada la propiedad Operacion Save');

  FOperacionSave.executeGuardar(FDataSetCab);
end;

procedure TjktDriver.abrirDataSets;
var
  i: Integer;
  DataSet: TkbmMemTable;
begin
  if FDataSetCab <> nil then
    FDataSetCab.Open;

  for i:= 0 to FOperacionSave.CountDatasets - 1 do
    begin
      DataSet :=  FOperacionSave.ItemsDataset[i];
      if DataSet is TjktMemTable then
        TjktMemTable(DataSet).NoAutoEditarCabecera := FNoAutoEditarDataSets;

      if (not DataSet.Active) then
        DataSet.Open;

//      DataSet.Append;
    end;
end;

procedure TjktDriver.cerrarDataSets;
var
  i :integer;
  dataSet :TkbmMemTable;
begin
  if (FDataSetCab <> nil) and (FDataSetCab.Active = True)
      then FDataSetCab.Close;

  for i := 0 to FOperacionSave.CountDatasets - 1 do
    begin
       dataSet :=  FOperacionSave.ItemsDataset[i];
       if  (dataSet.Active)
            then dataSet.close;
    end;
end;

procedure TjktDriver.DoCancel;
begin
  if (FDataSetCab <> nil) and (FDataSetCab.State <> dsInactive)
     then FDataSetCab.Cancel;
end;

procedure TjktDriver.DoCloseDataSet;
begin
  Self.cerrarDataSets;
end;

procedure TjktDriver.DoEliminar;
begin
  if (FDataSetCab <> nil)
     then FDataSetCab.Edit;
  if Assigned(FOnEliminar)
     then FOnEliminar(self);
  if (FDataSetCab <> nil)
     then FDataSetCab.Post;
end;

procedure TjktDriver.DoRehabilitar;
begin
  if (FDataSetCab <> nil)
     then FDataSetCab.Edit;

  if Assigned(FOnRehabilitar)
     then FOnRehabilitar(self);

  if (FDataSetCab <> nil)
     then FDataSetCab.Post;
end;

procedure TjktDriver.DoProximo;
begin
  if (FDataSetCab <> nil) and (not FDataSetCab.EOF)
     then begin
           FDataSetCab.Next;
           FDataSetCab.Edit;
          end;
  Self.AnalizarDataSet;
end;

procedure TjktDriver.DoAnterior;
begin
  if (FDataSetCab <> nil) and (not FDataSetCab.BOF)
     then begin
           FDataSetCab.Prior;
           FDataSetCab.Edit;
          end;
  Self.AnalizarDataSet;
end;


procedure TjktDriver.DoLineaMensaje(aTexto: string);
var
  StatusBar: TComponent;
begin
  StatusBar := Owner.Owner.FindComponent('RibbonStatusBar');
  if (StatusBar <> nil) then
    TdxRibbonStatusBar(StatusBar).Panels[0].Text := aTexto;
end;

procedure TjktDriver.DoDesInhibirBotonAnt;
begin
   enabledAction('acDataSetPrior', true);
end;

procedure TjktDriver.DoDesInhibirBotonSig;
begin
   enabledAction('acDataSetNext', true);
end;


procedure TjktDriver.DoInhibirBotonAnt;
begin
   enabledAction('acDataSetPrior', false);
end;

procedure TjktDriver.DoInhibirBotonSig;
begin
   enabledAction('acDataSetNext', false);
end;

procedure TjktDriver.DoInhibirCamposNoModificables;
begin
  modificarReadOnly(true);
end;

procedure TjktDriver.DoDesInhibirCamposNoModificables;
begin
  modificarReadOnly(false);
end;

procedure TjktDriver.modificarReadOnly(aValue :boolean);
var
  i, j: Integer;
  dataSet: TkbmMemTable;
begin
  for i := 0 to FOperacionSave.CountDatasets - 1 do
    begin
      dataSet :=  FOperacionSave.ItemsDataset[i];
      for j := 0 to dataset.Fields.Count - 1 do
        begin
            if dataset.Fields.Fields[j].Tag > 1
               then  dataset.Fields.Fields[j].ReadOnly := aValue;
        end;
    end;
end;

procedure TjktDriver.DoOperacionTraer;
begin
  if not Assigned(FOperacionTraer)
     then  raise Exception.Create('No esta asignada la propiedad Operacion Traer');

  FOperacionTraer.execute;
end;

function TjktDriver.CanClose: Boolean;
begin
  Result := not (FEstado in [esAlta, esEdit]);

//  Result := Cancelar;
end;

function TjktDriver.esNuevo() : Boolean;
begin
  if (FEstado = esAlta)
      then result := true
      else result := false;
end;

procedure TjktDriver.Filtrar;
begin
  if not Assigned(FFiltro) and (FTipoPrograma = tp_abmIndividual) then
    raise Exception.Create('Debe asignarle un Filtro al Driver para este Tipo de Programa');

  if Assigned(FFiltro) and not Assigned(FFiltro.OidRespuesta) then
    raise Exception.Create('Debe asignar el campo "OidRespuesta" del Filtro, ' +
      'y este debe ser el mismo que el asignado en el Atributo "oid" de la '   +
      'OperacionTraer del Driver');

  try
    Self.FEstado := esEdit;
    Self.ActualizarEstadoBotones;

    Self.DoDesInhibirCamposNoModificables;
    Self.abrirDataSets;

    if Assigned(FFiltro) then
      begin
        // Muestro el Help (o Filtro) asignado
        if FFiltro.Ejecutar then
          begin
            // Seleccionó un registro
          end
        else
          begin
            // No seleccionó nada! Creo una exception silenciosa...
            Self.cerrarDataSets;
            Abort;
          end;
      end;

    Self.DoOperacionTraer;
    Self.DoInhibirCamposNoModificables;
    Self.DoSetFocoModi;

    if (Self.FDataSetCab <> nil) then
      begin
        FDatasetCab.First;
        FDatasetCab.Edit;
      end;
    Self.AnalizarDataSet;
  except
    on E: Exception do
       begin
         Self.TratarMensajeException(E);
         Self.Cancelar;
       end;
  end;
end;

procedure TjktDriver.FiltrarActivos;
begin
  if Assigned(FFiltro) then
    FFiltro.TipoFiltro := fi_Activos;

  Filtrar;
end;

procedure TjktDriver.FiltrarInactivos;
begin
  if Assigned(FFiltro) then
    FFiltro.TipoFiltro := fi_Inactivos;

  Filtrar;
end;

procedure TjktDriver.FiltrarAvanzado;
begin
  if Assigned(FFiltro) then
    FFiltro.TipoFiltro := fi_Avanzado;

  Filtrar;
end;

procedure TjktDriver.enabledAction(actionName: string; enabled: boolean);
var
  i: integer;
begin
  if not Assigned(FActionList) then exit;

  for i := 0 to FActionList.ActionCount - 1 do
    begin
      if TAction(FActionList.Actions[i]).Name = actionName then begin
        TAction(FActionList.Actions[i]).Enabled := enabled;
        Break;
      end;
    end;
end;

function TjktDriver.esAbrir() : Boolean;
begin
  if (FEstado = esEdit)
      then result := true
      else result := false;
end;

procedure TjktDriver.postDataSets;
var
  i       : integer;
  dataSet : TkbmMemTable;
begin
  // Primero guardo los datos del FDataSetCab
  if (FDataSetCab <> nil) and ((FDataSetCab.State = dsInsert) or (FDataSetCab.State = dsEdit))
     then FDataSetCab.Post;

  for i := 0 to FOperacionSave.CountDatasets - 1 do
    begin
      dataSet :=  FOperacionSave.ItemsDataset[i];
      if (dataSet <> nil) and ((dataSet.State = dsInsert) or (dataSet.State = dsEdit))
         then dataSet.Post;
    end;
end;

procedure TjktDriver.CustomToolButton;
begin
  Self.DoCustomToolButton;
end;

procedure TjktDriver.DoCustomToolButton();
begin
end;

procedure TjktDriver.TratarMensajeException(excep : Exception);
begin
  if (excep.Message <> 'Operation aborted')
     then mostrarMensError(excep.Message);
end;

procedure TjktDriver.ejecutarListaOperaciones(aListaOper :TjktOperacionesList) ;
var
  x: Integer;
  operItem : TjktOperacionItemList;
begin
  if not Assigned(aListaOper) then
    Exit;

  for x := 0 to aListaOper.Count - 1 do
    begin
      operItem := TjktOperacionItemList(aListaOper.Items[x]);
      if assigned (operItem.Operacion) then
        operItem.Operacion.execute;
    end;
end;

procedure TjktDriver.doOperacionesIniciales;
begin
  ejecutarListaOperaciones(FOperacionesIniciales);
end;

procedure TjktDriver.doOperacionesDefault;
begin
  ejecutarListaOperaciones(FOperacionesDefault);
end;

end.


