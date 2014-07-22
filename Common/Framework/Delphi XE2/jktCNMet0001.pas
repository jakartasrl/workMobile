unit jktCNMet0001;

interface

{ Este componente genera eventos para el control de los ABM }


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, Vcl.ActnList, db, kbmMemTable, cxScheduler, dxRibbonStatusBar,
  jktCNMet0002, jktCNMet0010, jktMisc0001, jktCNMet0012, jktCNMet0030;

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

  TjktTipoPrograma = (tp_abmLista, tp_abmListaConFiltro, tp_Otro); // renombrar 'tp_Otro' por otro nombre más explícito
//  TjktTipoABM = (abmLista, abmIndividual, abmListaConFiltro, abmEstandar);

  TLineaMensajeEvent = procedure(Sender: TObject; Texto: string) of object;

type

  TjktDriver = class(TComponent)
  private
    { Private declarations }
    FConfirmarCancelacion       :Boolean;
    FIgnoreTags                 :Boolean;
    FDataSetCab                 :TDataSet;
    FEstado                     :TjktEstado;
    FTipoPrograma               :TjktTipoPrograma;
    FFocoEnAlta                 :TField;
    FFocoEnModificacion         :TField;
    FOperacionSave              :TjktOperacion;
    FOperacionTraer             :TjktOperacion;
    FServiceCaller              :TjktServiceCaller;
    FActionList                 :TActionList;
    FScheduler                  :TcxScheduler;
    { Agregar  :
        FiltroActivos
        FiltroInActivos
    }
    // Eventos
    FOnSetDefaults              :TNotifyEvent;
    FOnModoAppend               :TNotifyEvent;
    FOnFiltrar                  :TNotifyEvent;
    FOnEliminar                 :TNotifyEvent;
    FOnReHabilitar              :TNotifyEvent;
    FOnCancel                   :TNotifyEvent;
    FOnCompletarCampos          :TNotifyEvent;
    FOnCustomOper               :TNotifyEvent;
    FOnFiltroActivos            :TNotifyEvent;
    FOnFiltroInActivos          :TNotifyEvent;
    FOnOperacionTraer           :TNotifyEvent;
    FOnEjecutar                 :TNotifyEvent;
    FOnLookUp                   :TNotifyEvent;
    FOnNuevo                    :TNotifyEvent;
    FOnGuardar                  :TNotifyEvent;
    FOnCustomToolButton         :TNotifyEvent;
    FOnImprimir                 :TNotifyEvent;


    function cuelgaDe(DataSetAVerificar : TDataSet ; DataSetPadre : TDataSet) : boolean;
    procedure marcarRegistrosPadres(DataSet : TDataSet);
    procedure DoSetDefaults;
    procedure DoSetFocoAlta;
    procedure DoSetFocoModi;
    procedure AnalizarDataSet;
    procedure DoFiltrar;
    procedure DoCancel;
    procedure DoCloseDataSet;
    procedure DoEliminar;
    procedure DoRehabilitar;
    procedure DoLineaMensaje(aTexto :string);
    procedure DoInhibirBotones;
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
    procedure DoCustomOper;
    procedure DoGuardar;
    procedure DoCustomToolButton;
    procedure camposDataset(aDataset:TDataSet);
    procedure recorrerDataSet(aDataset:TDataSet ; aLista: TList;  aNivel, aNivelDataSet: integer);
    procedure MarcarRegistrosComoModif(aDataset: TkbmMemTable ; aLista: TList);
    procedure abrirDataSets;
    procedure cerrarDataSets;
    procedure postDataSets;
    procedure DoImprimir;
    function  verModificados: Boolean;
    function  obtenerListaDataSet(aDataset:TDataSet) : TList;
    procedure TratarMensajeException(excep : Exception);
    procedure ejecutarOperacion(aOper : TjktOperacion);
    procedure completarAtributosOperacion(aOper :TjktOperacion);
    procedure enabledAction(actionName :string;  enabled :boolean);
    procedure DoDesInhibirCamposNoModificables;
    procedure DoInhibirCamposNoModificables;
    procedure modificarReadOnly(aValue :boolean);
    procedure LookUp;

  protected
    { Protected declarations }
    FOpciones : TjktOpciones;
    nivel     : integer;
    FNoAutoEditarDataSets : Boolean;

  public
    { Public declarations }
    property Estado : TjktEstado read FEstado;
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Inicio;
    procedure New;
    procedure CustomOperation;
    procedure Eliminar;
    procedure Rehabilitar;
    procedure Guardar;
    procedure Proximo;
    procedure Anterior;
    procedure Filtrar;
    procedure Ejecutar;
    procedure Imprimir;
    procedure CustomToolButton;
    procedure OpenRehabilitar;
    procedure newRecord(aDataSet: TDataSet);
    function  CanClose: Boolean;
    function  esNuevo(): Boolean;
    function  esAbrir(): Boolean;
    function  Cancelar: Boolean;

  published
    { Published declarations }

    property IgnoreTags            : Boolean read fIgnoreTags write fIgnoreTags;
    property NoAutoEditarDataSets  : Boolean read FNoAutoEditarDataSets write FNoAutoEditarDataSets;
    property DataSetCab            : TDataSet read FDataSetCab          write FDataSetCab;
    property OperacionSave         : TjktOperacion  read FOperacionSave write FOperacionSave;
    property OperacionTraer        : TjktOperacion  read FOperacionTraer write FOperacionTraer;
    property ServiceCaller         : TjktServiceCaller read FServiceCaller write FServiceCaller;
    property ActionList            : TActionList read FActionList write FActionList;
    property Scheduler             : TcxScheduler read FScheduler write FScheduler;
    property ConfirmarCancelacion  : Boolean read FConfirmarCancelacion write FConfirmarCancelacion;

    property Opciones              : TjktOpciones     read FOpciones     write FOpciones;
    property TipoPrograma          : TjktTipoPrograma read FTipoPrograma write FTipoPrograma;
    property FocoEnAlta            : TField read FFocoEnAlta         write FFocoEnAlta;
    property FocoEnModificacion    : TField read FFocoEnModificacion write FFocoEnModificacion;

    property OnSetDefaults         :TNotifyEvent read FOnSetDefaults        write FOnSetDefaults;
    property OnEliminar            :TNotifyEvent read FOnEliminar           write FOnEliminar;
    property OnRehabilitar         :TNotifyEvent read FOnRehabilitar        write FOnRehabilitar;
    property OnCancel              :TNotifyEvent read FOnCancel             write FOnCancel;
    property OnCompletarCampos     :TNotifyEvent read FOnCompletarCampos    write FOnCompletarCampos;
    property OnFiltroActivos       :TNotifyEvent read FOnFiltroActivos      write FOnFiltroActivos;
    property OnFiltroInActivos     :TNotifyEvent read FOnFiltroInActivos    write FOnFiltroInActivos;
    property OnFiltrar             :TNotifyEvent read FOnFiltrar            write FOnFiltrar;
    property OnEjecutar            :TNotifyEvent read FOnEjecutar write FOnEjecutar;
    property OnNuevo               :TNotifyEvent read FOnNuevo write FOnNuevo;
    property OnCustomOper          :TNotifyEvent read FOnCustomOper write FOnCustomOper;
    property OnGuardar             :TNotifyEvent read FOnGuardar write FOnGuardar;
    property OnCustomToolButton    :TNotifyEvent read FOnCustomToolButton write FOnCustomToolButton;
    property OnImprimir            :TNotifyEvent read FOnImprimir write FOnImprimir;
  end;

procedure Register;

implementation

uses
  jktFNMet0008;

procedure Register;
begin
  RegisterComponents('Jakarta', [TjktDriver]);
end;

constructor TjktDriver.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Self.FEstado := esNil;
end;

destructor TjktDriver.Destroy;
begin
  FDataSetCab  := nil;
  inherited Destroy;
end;

procedure TjktDriver.Inicio;
begin
  Self.DoInhibirBotones;

  if (FTipoPrograma = tp_abmLista) and (Self.FEstado = esNil) then
    Filtrar
  else
    begin
      Self.FEstado := esNil;
      Self.DoLineaMensaje(' ');
    end;
end;

procedure TjktDriver.LookUp;
begin

end;

procedure TjktDriver.DoInhibirBotones;
var
 x :integer;
begin
  if not Assigned(FActionList) then exit;

  for x := 0 to FActionList.ActionCount -1  do
    begin
       TAction (FActionList.Actions[x]).Enabled := False;
    end;

  if FTipoPrograma = tp_Otro then
    enabledAction('acNew', True);
  enabledAction('acFind', True);
  enabledAction('acFindRemoved', True);
end;

procedure TjktDriver.New;
begin
  try
    Self.FEstado := esAlta;
    Self.DoLineaMensaje('Alta');

    Self.DoNuevo;
  except
    on E: Exception do
      begin
        Self.TratarMensajeException(E);
        Self.Cancelar;
        Self.FEstado := esNil;
      end;
  end;
end;

procedure TjktDriver.CustomOperation;
begin
  Self.DoCustomOper;
end;

procedure TjktDriver.OpenRehabilitar;
begin
  try
    Self.FEstado := esRehabilita;
    self.DoLineaMensaje('Rehabilitar');
    Self.DoOperacionTraer;
    Self.DoBotonesOpenReha;
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
  if Assigned(FOnSetDefaults)
     then FOnSetDefaults(self);
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

    if (FEstado = esAlta) and (FTipoPrograma = tp_Otro) then
      begin
        // Dejo vacios los DataSets
        Self.cerrarDataSets;
        DoNuevo;
      end
    else if (FTipoPrograma = tp_abmLista) or
      (FEstado = esEdit) or (FEstado = esRehabilita) then
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

procedure TjktDriver.AnalizarDataSet;
begin
  if FDataSetCab <> nil
   then
     begin
       if FDataSetCab.EOF
          then self.doInhibirBotonSig()
          else self.doDesInhibirBotonSig();

       if FDataSetCab.BOF
          then self.doInhibirBotonAnt()
          else self.doDesInhibirBotonAnt();
    end;
end;


procedure TjktDriver.DoFiltrar;
begin
  self.abrirDataSets;

  // mostrar el HELP (o FILTRO) segun el help asignado en la property HelpFiltro
end;

procedure TjktDriver.DoNuevo;
begin
  self.DoDesInhibirCamposNoModificables;
  Self.abrirDataSets;
  // agregar InhibirControlesXSeguridad
  Self.DoSetDefaults;
  // Cambiar el estado de los botones
  Self.DoBotonesNew;
  Self.DoSetFocoAlta;
end;


procedure TjktDriver.DoCustomOper;
begin
end;

procedure TjktDriver.DoGuardar;
begin
  if not Assigned(FOperacionSave)
     then  raise Exception.Create('No esta asignada la propiedad Operacion Save');

  if not Assigned(FServiceCaller)
     then  raise Exception.Create('No esta asignada la propiedad ServiceCaller');

  ejecutarOperacion(FOperacionSave);
end;

procedure TjktDriver.ejecutarOperacion(aOper : TjktOperacion);
begin
  FServiceCaller.InicioOperacion;
  FServiceCaller.setOperacion(aOper.OperName);
  if aOper.Atributos.Count > 0
     then completarAtributosOperacion(aOper);

  FServiceCaller.execute;
end;

procedure TjktDriver.completarAtributosOperacion(aOper :TjktOperacion);
var
 x :integer;
 count :integer;
 att :TjktOperAttribute;
begin
  count :=  aOper.Atributos.Count;
  // Mandar primero los campos sueltos
  for x := 0 to count - 1 do
    begin
       att :=  aOper.Atributos.Items[x];
       if  att.Field = nil
          then continue;
       FServiceCaller.addAtribute(att.Attribute, att.Field.AsString);
    end;
  // Mandar luego los datasets
  for x := 0 to count - 1 do
    begin
       att :=  aOper.Atributos.Items[x];
       if  att.Dataset = nil
          then continue;
       FServiceCaller.addDataSet(att.Dataset, '', att.Tag);
    end;
end;

procedure TjktDriver.abrirDataSets;
var
  i: Integer;
  dataSet: TkbmMemTable;
begin
  if FDataSetCab <> nil then
    FDataSetCab.Open;

  for i:= 0 to FOperacionSave.CountDatasets - 1 do
    begin
       dataSet :=  FOperacionSave.ItemsDataset[i];
       if dataSet is TjktMemTable
          then TjktMemTable(dataSet).NoAutoEditarCabecera := FNoAutoEditarDataSets;

       if (not dataSet.Active)
         then   dataSet.open;
       dataSet.Append;
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
  self.AnalizarDataSet;
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
   enabledAction('acAnt', true);
end;

procedure TjktDriver.DoDesInhibirBotonSig;
begin
   enabledAction('acSig', true);
end;


procedure TjktDriver.DoInhibirBotonAnt;
begin
   enabledAction('acAnt', false);
end;

procedure TjktDriver.DoInhibirBotonSig;
begin
   enabledAction('acSig', false);
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

  if not Assigned(FServiceCaller)
     then  raise Exception.Create('No esta asignada la propiedad ServiceCaller');

  ejecutarOperacion(FOperacionTraer);
end;

function TjktDriver.CanClose: Boolean;
begin
  result := Self.Cancelar;
end;


function TjktDriver.cuelgaDe(DataSetAVerificar : TDataSet ; DataSetPadre : TDataSet) : boolean;
begin
  if ((DataSetAVerificar = nil) or (DataSetPadre = nil))
     then result := false
  else
  if (DataSetAVerificar.name = DataSetPadre.name)
     then result := false
  else
  if (TkbmMemTable(DataSetAVerificar).MasterSource = nil)
      then result := false
  else if (TkbmMemTable(DataSetAVerificar).MasterSource <> nil)
           then begin
                if (TkbmMemTable(DataSetAVerificar).MasterSource.dataset.Name = DataSetPadre.name)
                   then result := true
                   else result := cuelgaDe(TkbmMemTable(DataSetAVerificar).MasterSource.DataSet,
                                           DataSetPadre);
                end
           else result := false;
end;

procedure TjktDriver.MarcarRegistrosComoModif(aDataset: TkbmMemTable ; aLista: TList);
var
  datasetHijo : TkbmMemTable;
  i : integer;
begin
  if (aLista = nil) then Exit;

  aDataset.First;
  while (not aDataset.Eof) do
    begin
    // Recorrer solo los DataSets Hijos
    if ((aDataset.UpdateStatus <> usUnModified) or (aDataset.RecordTag > 0))
      then marcarRegistrosPadres(aDataset);

    // Recorrer los DataSets Hijos
    for i := 0 to aLista.count - 1 do
      begin
      datasetHijo := TkbmMemTable (aLista.Items[i]);
      if ((datasetHijo.MasterSource <> nil) and (datasetHijo.MasterSource.DataSet.Name = aDataset.Name))
        then MarcarRegistrosComoModif(datasetHijo, aLista);
      end;

    aDataset.Next;
  end;
end;

procedure TjktDriver.marcarRegistrosPadres(DataSet : TDataSet);
var
  DataSetPadre: TkbmMemTable;
begin
  if (TkbmMemTable(DataSet).MasterSource <> nil)
    then begin
      DataSetPadre := TkbmMemTable(TkbmMemTable(DataSet).MasterSource.DataSet);
      DataSetPadre.RecordTag := 1;
      marcarRegistrosPadres(DataSetPadre);
    end;
end;


function  TjktDriver.obtenerListaDataSet(aDataset: TDataSet): TList;
var
  i: Integer;
  dataSet: TkbmMemTable;
begin
  result := TList.create;
  for i := 0 to FOperacionSave.CountDatasets - 1 do
    begin
      dataSet :=  FOperacionSave.ItemsDataset[i];
      if (dataSet.MasterSource <> nil) and (dataSet.MasterSource.DataSet = aDataSet)
        then result.Add(dataSet);
    end;
end;

procedure TjktDriver.recorrerDataSet(aDataset: TDataSet; aLista :TList; aNivel, aNivelDataSet: integer);
var
  wrkDataSet: TDataset;
  lista2 : TList;
  i: Integer;
begin
  aDataSet.BlockReadSize := 1;
  try
      if aDataset = nil
         then exit;
      aDataset.first;
      // Tabla de Cabecera
      FServiceCaller.addElement(aNivel, 'Tabla');
      FServiceCaller.addAtribute('nombre', aDataset.name);
      while not aDataSet.Eof do
        begin
        // Fila
           FServiceCaller.addElement(aNivel + 1 ,'Fila');
           camposDataset(aDataSet);
           if (aLista <> nil)
             then for i := 0 to aLista.count - 1 do
                     begin
                       wrkDataset := TDataSet(aLista.items[i]);
                            // Dario para compatibilidad con lo viejo.
                            // 25-02-2005
                       lista2 := nil;
                       if (FOperacionSave.CountDatasets <> 0)
                              then lista2 := obtenerListaDataSet(wrkDataset);

                       recorrerDataset(wrkDataset, lista2,  aNivel + 2, aNivelDataSet + 1);
                       lista2.free;
                     end;
          aDataSet.Next;
        end;
  finally
     aDataSet.BlockReadSize := 0;
  end;
end;

procedure TjktDriver.camposDataset(aDataset:TDataSet);
var
  i:integer;
  fieldName :string;
begin
  for i := 0 to aDataSet.FieldCount - 1 do
    begin
      if (not FIgnoreTags) and (aDataSet.Fields[i].Tag = 0)
         then continue;
      fieldName := aDataSet.Fields[i].FieldName;
      if  ((aDataSet.Fields[i] is TIntegerField) or
           (aDataSet.Fields[i] is TFloatField) or
           (aDataSet.Fields[i] is TCurrencyField))
      and (aDataSet.Fields[i].IsNull)
          then FServiceCaller.addAtribute(fieldName, '0')
          else begin

               if ((aDataset.fieldByName(fieldName).size>=255) or (aDataset.fieldByName(fieldName).DataType = ftMemo))
                  then begin
                       if (aDataset is TkbmMemTable)
                           then FServiceCaller.addAtribute(fieldName, jktMisc0001.getRichToText(TkbmMemTable(aDataset).fieldByName(fieldName).AsString))
                           else FServiceCaller.addAtribute(fieldName, jktMisc0001.getRichToText(aDataset.fieldByName(fieldName).AsString));
                       end
                  else FServiceCaller.addAtribute(fieldName,aDataset.fieldByName(fieldName).AsString);
               end;
    end;
end;

function TjktDriver.esNuevo() : Boolean;
begin
  if (FEstado = esAlta)
      then result := true
      else result := false;
end;

procedure TjktDriver.Filtrar;
begin
  try
    Self.FEstado := esEdit;
    Self.DoLineaMensaje('Edicion');
    Self.DoFiltrar;
    Self.DoOperacionTraer;
    Self.DoBotonesFiltrar;
    self.DoInhibirCamposNoModificables;
    Self.DoSetFocoModi;

    if (Self.FDataSetCab <> nil)
       then begin
              FDatasetCab.First;
              FDatasetCab.Edit;
            end;
    Self.AnalizarDataSet;
  except
    on E: Exception do
       begin
         self.TratarMensajeException(E);
         self.Cancelar;
       end;
  end;
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


procedure TjktDriver.newRecord(aDataSet :TDataSet);
begin
  aDataSet.FieldByName('new').asBoolean    := true;
  aDataSet.FieldByName('modif').asBoolean  := false;
  aDataSet.FieldByName('activo').asBoolean := true;
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


end.

