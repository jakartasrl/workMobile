unit jktCNMet0001;

interface

{ Este componente genera eventos para el control de los ABM }


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  db, kbmMemTable, jktCNMet0002, jktCNMet0010, jktMisc0001, jktCNMet0012;

type
  TjktOpcion       = (opNuevo, opOpen,  opRehabilita, opBaja, opImprimir, opExportar, opImportar ,
                      opBuscar , opEjecutar, opLookUp, opCustom);

  TjktOpciones     = set of TjktOpcion;

  TjktEstado       = (esAlta, esEdit, esRehabilita, esNil);

  TjktTipoABM      = (abmLista, abmIndividual, abmListaConFiltro , abmEstandar);

  TBeforeTraerEvent = procedure(var abort: boolean) of object;

  TLineaMensajeEvent = procedure(Sender: TObject; Texto: string) of object;

type

  TjktDriver = class(TComponent)
  private
    { Private declarations }
    FConfirmarCancelacion       :boolean;
    FIgnoreTags                 :boolean;
    FDataSetsActu               :TDataSetList;
    FDataSetCab                 :TDataSet;
    FDataSetDet1                :TDataSet;
    FDataSetDet2                :TDataSet;
    FEstado                     :TjktEstado;
    FTipoABM                    :TjktTipoABM;
    FUltimo                     :boolean;
    FConFiltro                  :boolean;
    FFormDocked                 :boolean;
    FOnLimpiarVariables         :TNotifyEvent;
    FOnSetDefaults              :TNotifyEvent;
    FOnSetParamsDocked          :TNotifyEvent;
    FOnSetFocoAlta              :TNotifyEvent;
    FOnSetFocoModi              :TNotifyEvent;
    FOnInhibirClave             :TNotifyEvent;
    FOnInhibirControles         :TNotifyEvent;
    FOnDesInhibirControles      :TNotifyEvent;
    FOnModoAppend               :TNotifyEvent;
    FOnModoOpen                 :TNotifyEvent;
    FOnCloseDataSet             :TNotifyEvent;
    FOnEliminar                 :TNotifyEvent;
    FOnReHabilitar              :TNotifyEvent;
    FOnProximo                  :TNotifyEvent;
    FOnAnterior                 :TNotifyEvent;
    FOnCancel                   :TNotifyEvent;
    FOnAfterInput               :TNotifyEvent;
    FOnCompletarCampos          :TNotifyEvent;
    FOnAfterCommit              :TNotifyEvent;
    FOnActualizacion            :TNotifyEvent;
    FOnCustomOper               :TNotifyEvent;
    FOnLineaMensaje             :TLineaMensajeEvent;
    FOnInhibirBotones           :TNotifyEvent;
    FOnBotonesNew               :TNotifyEvent;
    FOnBotonesOpen              :TNotifyEvent;
    FOnBotonesOpenReha          :TNotifyEvent;
    FOnBotonesBuscar            :TNotifyEvent;
    FOnBotonesEjecutar          :TNotifyEvent;
    FOnInhibirBotonSig          :TNotifyEvent;
    FOnDesInhibirBotonSig       :TNotifyEvent;
    FOnInhibirBotonAnt          :TNotifyEvent;
    FOnDesInhibirBotonAnt       :TNotifyEvent;
    FOnFiltroActivos            :TNotifyEvent;
    FOnFiltroInActivos          :TNotifyEvent;
    FOnOperacionTraer           :TNotifyEvent;
    FOnBuscar                   :TNotifyEvent;
    FOnEjecutar                 :TNotifyEvent;
    FOnLookUp                   :TNotifyEvent;
    FOnBeforeTraer              :TBeforeTraerEvent;
    FOnAfterOpen                :TNotifyEvent;
    FOnNuevo                    :TNotifyEvent;
    FOnAbrir                    :TNotifyEvent;
    FOnGuardar                  :TNotifyEvent;
    FOnCustomToolButton         :TNotifyEvent;
    FOnImprimir                 :TNotifyEvent;


    function cuelgaDe(DataSetAVerificar : TDataSet ; DataSetPadre : TDataSet) : boolean;
    procedure marcarRegistrosPadres(DataSet : TDataSet);
    procedure InhibirControles;
    procedure LimpiarVariables;
    procedure DoInhibirControles;
    procedure DoDesInhibirControles;
    procedure DoLimpiarVariables;
    procedure DoSetDefaults;
    procedure DoSetParamsDocked;
    procedure DoSetFocoAlta;
    procedure DoSetFocoModi;
    procedure DoInhibirClave;
    procedure AnalizarDataSet;
    procedure DoModoAppend;
    procedure DoModoOpen;
    procedure DoCancel;
    procedure DoCloseDataSet;
    procedure DoEliminar;
    procedure DoReHabilitar;
    procedure DoAfterInput;
    procedure DoCompletarCampos;
    procedure DoAfterCommit;
    procedure DoActualizacion;
    procedure DoLineaMensaje(aTexto :string);
    procedure DoInhibirBotones;
    procedure DoBotonesNew;
    procedure DoBotonesOpen;
    procedure DoBotonesOpenReha;
    procedure DoBotonesEjecutar;
    procedure DoBotonesBuscar;
    procedure DoInhibirBotonSig;
    procedure DoDesInhibirBotonSig;
    procedure DoInhibirBotonAnt;
    procedure DoDesInhibirBotonAnt;
    procedure DoProximo;
    procedure DoAnterior;
    procedure DoFiltroActivos;
    procedure DoFiltroInActivos;
    procedure DoOperacionTraer;
    procedure DoBuscar;
    procedure DoEjecutar;
    procedure DoLookUp;
    procedure DoNuevo;
    procedure DoAbrir;
    procedure DoCustomOper;
    procedure DoGuardar;
    procedure DoCustomToolButton;
    procedure camposDataset(aDataset:TDataSet ; aOper : TjktOperacion);
    procedure recorrerDataSet(aDataset:TDataSet ; aLista: TList; aOper : TjktOperacion; aNivel, aNivelDataSet: integer; aEnviarTodo : Boolean = False);
    procedure MarcarRegistrosComoModif(aDataset: TkbmMemTable ; aLista: TList);
    procedure abrirDataSets;
    procedure cerrarDataSets;
    procedure postDataSets;
    procedure DoImprimir;
    function  verModificados :boolean;
    function  obtenerListaDataSet(aDataset:TDataSet) : TList;
    function  obtenerTodosLosDataSet() : TList;
    procedure TratarMensajeException(excep : Exception);
    procedure AutomaticUpdate();
  protected
    { Protected declarations }
    FOpciones :TjktOpciones;
    nivel     : integer;
    FUpdateHandler : boolean;
    FNoAutoEditarDataSets : boolean;
  public
    { Public declarations }
    property Estado : TjktEstado read FEstado;
    property FormDocked :boolean read FFormDocked write FFormDocked;
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Inicio;
    procedure New;
    procedure Open;
    procedure CustomOperation;
    procedure Eliminar;
    procedure Rehabilitar;
    function Cancelar : Boolean;
    procedure Guardar;
    procedure Proximo;
    procedure Anterior;
    procedure Buscar;
    procedure Ejecutar;
    procedure LookUp;
    procedure Imprimir;
    procedure CustomToolButton;
    procedure OpenRehabilitar;
    procedure SetXMLSave(aOper : TjktOperacion; aDataSet : TDataSet = nil; aEnviarTodo : Boolean = False);
    procedure actualizarModif(aDataSet :TDataSet);
    procedure newRecord(aDataSet :TDataSet);
    function  CanClose :boolean ;
    function esNuevo() : Boolean;
    function esAbrir() : Boolean;
    procedure ChangeModif(aDataSet :TDataSet);
    procedure addDataSetsActu(aDataSet : TDataSet);
  published
    { Published declarations }

    property DataSetsActu         :TDataSetList  read FDataSetsActu   write FDataSetsActu;
    // Para manejar el nuevo actualizador
    property IgnoreTags           : boolean read fIgnoreTags write fIgnoreTags;
    property UpdateHandler : boolean read FUpdateHandler write FUpdateHandler;
    property NoAutoEditarDataSets : boolean read FNoAutoEditarDataSets write FNoAutoEditarDataSets;
    // Las sgtes 3 properies se mantienen solo por compatibilidad
    property DataSetCab           :TDataSet  read FDataSetCab           write FDataSetCab;
    property DataSetDet1          :TDataSet  read FDataSetDet1          write FDataSetDet1;
    property DataSetDet2          :TDataSet  read FDataSetDet2          write FDataSetDet2;
    property ConfirmarCancelacion : boolean read FConfirmarCancelacion write FConfirmarCancelacion;
    // Fin
    property Opciones             :TjktOpciones  read FOpciones         write FOpciones;
    property TipoABM              :TjktTipoABM   read FTipoABM          write FTipoABM;
    property ConFiltro            :boolean       read FConFiltro        write FConFiltro;
    property OnLimpiarVariables   :TNotifyEvent read FOnLimpiarVariables   write FOnLimpiarVariables;
    property OnInhibirControles   :TNotifyEvent read FOnInhibirControles   write FOnInhibirControles;
    property OnDesInhibirControles   :TNotifyEvent read FOnDesInhibirControles   write FOnDesInhibirControles;
    property OnSetDefaults        :TNotifyEvent read FOnSetDefaults        write FOnSetDefaults;
    property OnSetParamsDocked    :TNotifyEvent read FOnSetParamsDocked    write FOnSetParamsDocked;
    property OnSetFocoAlta        :TNotifyEvent read FOnSetFocoAlta        write FOnSetFocoAlta;
    property OnSetFocoModi        :TNotifyEvent read FOnSetFocoModi        write FOnSetFocoModi;
    property OnInhibirClave       :TNotifyEvent read FOnInhibirClave       write FOnInhibirClave;
    property OnModoAppend         :TNotifyEvent read FOnModoAppend         write FOnModoAppend;
    property OnModoOpen           :TNotifyEvent read FOnModoOpen           write FOnModoOpen;
    property OnCloseDataSet       :TNotifyEvent read FOnCloseDataSet       write FOnCloseDataSet;
    property OnEliminar           :TNotifyEvent read FOnEliminar           write FOnEliminar;
    property OnRehabilitar        :TNotifyEvent read FOnRehabilitar        write FOnRehabilitar;
    property OnProximo            :TNotifyEvent read FOnProximo            write FOnProximo;
    property OnAnterior           :TNotifyEvent read FOnAnterior           write FOnAnterior;
    property OnCancel             :TNotifyEvent read FOnCancel             write FOnCancel;
    property OnAfterInput         :TNotifyEvent read FOnAfterInput         write FOnAfterInput;
    property OnCompletarCampos    :TNotifyEvent read FOnCompletarCampos    write FOnCompletarCampos;
    property OnAfterCommit        :TNotifyEvent read FOnAfterCommit        write FOnAfterCommit;
    property OnActualizacion      :TNotifyEvent read FOnActualizacion      write FOnActualizacion;
    property OnLineaMensaje       :TLineaMensajeEvent read FOnLineaMensaje write FOnLineaMensaje;
    property OnInhibirBotones     :TNotifyEvent read FOnInhibirBotones    write FOnInhibirBotones;
    property OnBotonesNew         :TNotifyEvent  read FOnBotonesNew write FOnBotonesNew;
    property OnBotonesOpen        :TNotifyEvent  read FOnBotonesOpen write FOnBotonesOpen;
    property OnBotonesOpenReha    :TNotifyEvent  read FOnBotonesOpenReha write FOnBotonesOpenReha;
    property OnBotonesBuscar      :TNotifyEvent  read FOnBotonesBuscar write FOnBotonesBuscar;
    property OnBotonesEjecutar    :TNotifyEvent  read FOnBotonesEjecutar write FOnBotonesEjecutar;
    property OnInhibirBotonSig    :TNotifyEvent  read FOnInhibirBotonSig write FOnInhibirBotonSig;
    property OnDesInhibirBotonSig :TNotifyEvent  read FOnDesInhibirBotonSig write FOnDesInhibirBotonSig;
    property OnInhibirBotonAnt    :TNotifyEvent  read FOnInhibirBotonAnt write FOnInhibirBotonAnt;
    property OnDesInhibirBotonAnt :TNotifyEvent  read FOnDesInhibirBotonAnt write FOnDesInhibirBotonAnt;
    property OnFiltroActivos      :TNotifyEvent  read FOnFiltroActivos write FOnFiltroActivos;
    property OnFiltroInActivos    :TNotifyEvent  read FOnFiltroInActivos write FOnFiltroInActivos;
    property OnOperacionTraer     :TNotifyEvent  read FOnOperacionTraer  write FOnOperacionTraer;
    property OnBuscar             :TNotifyEvent  read FOnBuscar write FOnBuscar;
    property OnEjecutar           :TNotifyEvent  read FOnEjecutar write FOnEjecutar;
    property OnLookUp             :TNotifyEvent  read FOnLookUp write FOnLookUp;
    property OnBeforeTraer        :TBeforeTraerEvent read FOnBeforeTraer write FOnBeforeTraer;
    property OnAfterOpen          :TNotifyEvent  read FOnAfterOpen write FOnAfterOpen;
    property OnNuevo              :TNotifyEvent  read FOnNuevo write FOnNuevo;
    property OnAbrir              :TNotifyEvent  read FOnAbrir write FOnAbrir;
    property OnCustomOper         :TNotifyEvent  read FOnCustomOper write FOnCustomOper;
    property OnGuardar            :TNotifyEvent  read FOnGuardar write FOnGuardar;
    property OnCustomToolButton   :TNotifyEvent  read FOnCustomToolButton write FOnCustomToolButton;
    property OnImprimir           :TNotifyEvent  read FOnImprimir write FOnImprimir;
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
  inherited create(AOwner);
  Self.FEstado     := esNil;
  self.FFormDocked := false;
  FDataSetsActu    := TDatasetList.Create(self, TDatasetItem);
end;

destructor TjktDriver.Destroy;
begin
  FDataSetCab  := nil;
  FDataSetDet1 := nil;
  FDataSetDet2 := nil;
  FDataSetsActu.Free;

  inherited Destroy;
end;

procedure TjktDriver.Inicio;
begin
   Self.FEstado   := esNil;
   Self.FUltimo   := False;
   self.DoLineaMensaje(' ');
   Self.DoInhibirBotones;
   Self.LimpiarVariables;
   Self.InhibirControles;
end;

procedure TjktDriver.DoInhibirBotones;
begin
  if Assigned(FOnInhibirBotones)
     then FOnInhibirBotones(self);

end;

procedure TjktDriver.LimpiarVariables;
begin
  self.DoLimpiarVariables;
end;

procedure TjktDriver.InhibirControles;
begin
  self.DoInhibirControles;
end;

procedure TjktDriver.DoLimpiarVariables;
begin
  if Assigned(FOnLimpiarVariables)
     then FOnLimpiarVariables(self);
end;

procedure TjktDriver.DoInhibirControles;
begin
  if Assigned(FOnInhibirControles)
     then FOnInhibirControles(self);
end;

procedure TjktDriver.DoDesInhibirControles;
begin
  if Assigned(FOnDesInhibirControles)
     then FOnDesInhibirControles(self);
end;

procedure TjktDriver.New;
begin
  try
    Self.FEstado   := esAlta;
    self.DoLineaMensaje('Alta');

    //Self.DoNuevo;
   // Self.DoModoOpen;
    self.DoModoAppend;
    Self.LimpiarVariables;
    Self.DoDesInhibirControles;
    // agregar InhibirControlesXSeguridad
    self.DoSetDefaults;
    // Cambiar el estado de los botones
    Self.DoBotonesNew;
    //Self.DoSetParamsDocked;
    Self.DoSetFocoAlta;
  except
    on E: Exception do
      begin
        self.TratarMensajeException(E);
        self.cancelar;
      end;
  end;
end;

procedure TjktDriver.CustomOperation;
begin
  Self.DoCustomOper;
end;

procedure TjktDriver.Open;
var
  abortaTraer : boolean;
begin
  try
    Self.DoAbrir;
    Self.FEstado := esEdit;
    abortaTraer := false;
    if Assigned(FOnBeforeTraer)
       then begin
              FOnBeforeTraer(abortaTraer);
              if (abortaTraer)
                 then exit;
            end;
    self.DoLineaMensaje('Edicion');
    Self.DoModoOpen;
    Self.DoSetParamsDocked;
    Self.DoOperacionTraer;
    Self.DoBotonesOpen;
    Self.DoDesInhibirControles;
    Self.DoInhibirClave;
    Self.DoSetFocoModi;
    if (Self.FDataSetCab <> nil)
       then begin
              FDatasetCab.First;
              FDatasetCab.Edit;
            end;
    Self.AnalizarDataSet;
    if Assigned(FOnAfterOpen)
       then FOnAfterOpen(self);
  except
    on E: Exception do
       begin
         self.TratarMensajeException(E);
         self.Cancelar;
       end;
  end;
end;

procedure TjktDriver.OpenRehabilitar;
begin
  try
    Self.FEstado := esRehabilita;
    self.DoLineaMensaje('Rehabilitar');
    Self.DoModoOpen;
    Self.DoOperacionTraer;
    Self.DoBotonesOpenReha;
    Self.DoDesInhibirControles;
    Self.DoInhibirClave;
    Self.DoSetFocoModi;
    if (Self.FDataSetCab <> nil)
       then begin
              FDatasetCab.first;
              FDatasetCab.Edit;
            end;
    Self.AnalizarDataSet;
    if Assigned(FOnAfterOpen)
       then FOnAfterOpen(self);
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

  if (FDataSetDet2 <> nil) and ((FDataSetDet2.State = dsInsert) or (FDataSetDet2.State = dsEdit))
     then  FDataSetDet2.Post;
  if (FDataSetDet1 <> nil) and ((FDataSetDet1.State = dsInsert) or (FDataSetDet1.State = dsEdit))
     then  FDataSetDet1.Post;
  if (FDataSetCab <> nil)  and ((FDataSetCab.State  = dsInsert) or (FDataSetCab.State  = dsEdit))
     then  FDataSetCab.Post;

  Self.DoAfterInput;
  Self.DoEjecutar;
  Self.DoBotonesEjecutar;
end;


procedure TjktDriver.Imprimir;
begin

  if (FDataSetDet2 <> nil) and ((FDataSetDet2.State = dsInsert) or (FDataSetDet2.State = dsEdit))
     then  FDataSetDet2.Post;
  if (FDataSetDet1 <> nil) and ((FDataSetDet1.State = dsInsert) or (FDataSetDet1.State = dsEdit))
     then  FDataSetDet1.Post;
  if (FDataSetCab <> nil)  and ((FDataSetCab.State  = dsInsert) or (FDataSetCab.State  = dsEdit))
     then  FDataSetCab.Post;

  Self.DoAfterInput;
  Self.DoImprimir;
end;


procedure TjktDriver.Buscar;
begin
  Self.DoBuscar;
  Self.DoBotonesBuscar;
end;

procedure TjktDriver.LookUp;
begin
  Self.DoLookUp;
end;

procedure TjktDriver.Anterior;
begin
  Self.DoAnterior;
end;

procedure TjktDriver.DoInhibirClave;
begin
  if Assigned(FOnInhibirClave)
     then FOnInhibirClave(self);
end;

procedure TjktDriver.DoBuscar;
begin
  if Assigned(FOnBuscar)
     then FOnBuscar(self);
end;

procedure TjktDriver.DoEjecutar;
begin
  if Assigned(FOnEjecutar)
     then FOnEjecutar(self);
end;

procedure TjktDriver.DoImprimir;
begin
  if Assigned(FOnImprimir)
     then FOnImprimir(self);
end;

procedure TjktDriver.DoLookUp;
begin
  if Assigned(FOnLookUp)
     then FOnLookUp(self);
end;

procedure TjktDriver.DoSetDefaults;
begin
  if Assigned(FOnSetDefaults)
     then FOnSetDefaults(self);
end;

procedure TjktDriver.DoSetParamsDocked;
begin
  if Assigned(FOnSetParamsDocked)
     then FOnSetParamsDocked(self);
end;


procedure TjktDriver.DoBotonesNew;
begin
  if Assigned(FOnBotonesNew)
     then FOnBotonesNew(self);
end;

procedure TjktDriver.DoBotonesOpen;
begin
  if Assigned(FOnBotonesOpen)
     then FOnBotonesOpen(self);
end;

procedure TjktDriver.DoBotonesOpenReha;
begin
  if Assigned(FOnBotonesOpenReha)
     then FOnBotonesOpenReha(self);
end;

procedure TjktDriver.DoBotonesEjecutar;
begin
  if Assigned(FOnBotonesEjecutar)
     then FOnBotonesEjecutar(self);
end;

procedure TjktDriver.DoBotonesBuscar;
begin
  if Assigned(FOnBotonesBuscar)
     then FOnBotonesBuscar(self);
end;

procedure TjktDriver.DoSetFocoAlta;
begin
  if Assigned(FOnSetFocoAlta)
     then FOnSetFocoAlta(self);
end;


procedure TjktDriver.DoSetFocoModi;
begin
  if Assigned(FOnSetFocoModi)
     then FOnSetFocoModi(self);
end;

function TjktDriver.Cancelar : Boolean;
begin

 result := True;

 if (confirmarCancelacion) and (((((((FDataSetCab  <> nil) and (FDataSetCab.State  <> dsInactive))
 or ((FDataSetDet1 <> nil) and (FDataSetDet1.State <> dsInactive))
 or ((FDataSetDet2 <> nil) and (FDataSetDet2.State <> dsInactive)) )
 and (self.verModificados)))))
    then if MessageDlg('Perderá los datos editados - Confirma Cancelar ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
            then begin
                   self.DoCancel;
                   self.DoCloseDataSet;
                   if not FFormDocked
                      then self.Inicio;
                 end
            else begin
                   result := False;
                 end
    else begin
           self.DoCancel;
           self.DoCloseDataSet;
           if not FFormDocked
                      then self.Inicio;
         end;
end;


function TjktDriver.verModificados :boolean;
begin
  Result:= false;

  if ( FDataSetCab.State in [dsEdit, dsInsert] )
     then begin
            Result := True;
            Exit;
          end;

  FDataSetCab.first;
  while not FDataSetCab.eof do
    begin
        if (FDataSetCab.FindField('modif') <> nil)
       and (FDataSetCab.FieldByName('modif').AsBoolean = True)
            then begin
                  result := true;
                  break;
                 end;
       FDatasetCab.next;
    end;
end;


procedure TjktDriver.Guardar;
begin
  if (FDataSetDet2 <> nil) and ((FDataSetDet2.State = dsInsert) or (FDataSetDet2.State = dsEdit))
     then  FDataSetDet2.Post;
  if (FDataSetDet1 <> nil) and ((FDataSetDet1.State = dsInsert) or (FDataSetDet1.State = dsEdit))
     then  FDataSetDet1.Post;
  if (FDataSetCab <> nil)  and ((FDataSetCab.State  = dsInsert) or (FDataSetCab.State  = dsEdit))
     then  FDataSetCab.Post;

  Self.postDataSets;

  Self.DoGuardar;

   try
   DoAfterInput;
   DoCompletarCampos;
   DoActualizacion;
   Self.DoAfterCommit;

   if (FTipoABM = abmEstandar)
      then begin
           self.DoCloseDataSet;
           self.Inicio;
           end
      else
   if   ((FEstado    = esAlta) and  (FTipoABM   = abmIndividual))
     or (FTipoABM = abmListaConFiltro)
     then try
           self.DoCloseDataSet;
           Self.DoModoOpen;
           Self.DoModoAppend;
           Self.LimpiarVariables;
           Self.DoDesInhibirControles;
           Self.DoSetDefaults;
           Self.DoBotonesNew;
           Self.DoSetFocoAlta;
           if (FTipoABM = abmListaConFiltro)
              then Self.Cancelar;
          except
           Self.Cancelar;
          end;
    if  (FTipoABM   = abmLista)
    or  (((FEstado    = esEdit) or (FEstado = esRehabilita)) and
         (FTipoABM   = abmIndividual))
       then begin
             self.DoOperacionTraer;
             if FDatasetCab <> nil
               then begin
                     FDatasetCab.First;
                     FDatasetCab.edit;
                    end;
             self.AnalizarDataSet;
            end;
  except
     on E: Exception do
        begin
          self.TratarMensajeException(E);
          if FDatasetCab <> nil
             then FDataSetCab.Edit;
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

procedure TjktDriver.DoModoAppend;
begin
  if FDataSetCab <> nil
     then FDataSetCab.Append;
  if Assigned(FOnModoAppend)
     then FOnModoAppend(self);
end;


procedure TjktDriver.DoModoOpen;
begin
  if FDataSetCab <> nil
     then FDataSetCab.Open;
  if FDataSetDet1 <> nil
     then FDataSetDet1.Open;
  if FDataSetDet2 <> nil
     then FDataSetDet2.Open;
  self.abrirDataSets;

  if Assigned(FOnModoOpen)
     then FOnModoOpen(self);
end;


procedure TjktDriver.DoNuevo;
begin
  if Assigned(FOnNuevo)
     then FOnNuevo(self);
end;


procedure TjktDriver.DoCustomOper;
begin
  if Assigned(FOnCustomOper)
     then FOnCustomOper(self);
end;

procedure TjktDriver.DoAbrir;
begin
  if Assigned(FOnAbrir)
     then FOnAbrir(self);
end;


procedure TjktDriver.DoGuardar;
begin
  if Assigned(FOnGuardar)
     then FOnGuardar(self);
end;

procedure TjktDriver.abrirDataSets;
var
  i :integer;
  tds :TDatasetItem;
  dataSet :TkbmMemTable;
begin
  for i:= 0 to FDataSetsActu.Count -1 do
    begin
       tds :=  TDatasetItem (FDataSetsActu.Items[i]);

       if not Assigned (tds.Dataset)
          then raise Exception.Create ('DRIVER: Falto Asignar un DataSet a la lista de DataSetsActu.');

       dataSet := TkbmMemTable (tds.Dataset);

       if dataSet is TjktMemTable
          then TjktMemTable(dataSet).NoAutoEditarCabecera := FNoAutoEditarDataSets;

       if  (not dataSet.Active)
            then dataSet.open;
    end;
end;

procedure TjktDriver.cerrarDataSets;
var
  i :integer;
  tds :TDatasetItem;
  dataSet :TkbmMemTable;
begin
  for i:=0 to FDataSetsActu.Count -1 do
    begin
       tds :=  TDatasetItem (FDataSetsActu.Items[i]);
       dataSet := TkbmMemTable (tds.Dataset);
       if  (dataSet.Active)
            then dataSet.close;
    end;
end;

procedure TjktDriver.DoCancel;
begin
  if (FDataSetDet2 <> nil) and (FDataSetDet2.State <> dsInactive)
     then FDataSetDet2.Cancel;
  if (FDataSetDet1 <> nil) and (FDataSetDet1.State <> dsInactive)
     then FDataSetDet1.Cancel;
  if (FDataSetCab <> nil)  and (FDataSetCab.State  <> dsInactive)
     then FDataSetCab.Cancel;


  if Assigned(FOnCancel)
     then FOnCancel(self);
end;





procedure TjktDriver.DoAfterCommit;
begin
  if Assigned(FOnAfterCommit)
     then FOnAfterCommit(self);
end;

procedure TjktDriver.DoActualizacion;
begin
  if Assigned(FOnActualizacion)
     then FOnActualizacion(self);
end;

procedure TjktDriver.DoCloseDataSet;
begin
  if (FDataSetCab <> nil) and (FDataSetCab.Active = True)
      then FDataSetCab.Close;
  if (FDataSetDet1 <> nil) and (FDataSetDet1.Active = True)
      then FDataSetDet1.Close;
  if (FDataSetDet2 <> nil) and (FDataSetDet2.Active = True)
      then FDataSetDet2.Close;

  self.cerrarDataSets;

  if Assigned(FOnCloseDataSet)
     then FOnCloseDataSet(self);
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
  self.AnalizarDataSet;
  if Assigned(FOnProximo)
     then FOnProximo(self);
end;

procedure TjktDriver.DoAnterior;
begin
  if (FDataSetCab <> nil) and (not FDataSetCab.BOF)
     then begin
           FDataSetCab.Prior;
           FDataSetCab.Edit;
          end;
  self.AnalizarDataSet;
  if Assigned(FOnAnterior)
     then FOnAnterior(self);
end;


procedure TjktDriver.DoAfterInput;
begin
  if Assigned(FOnAfterInput)
     then FOnAfterInput(self);
end;


procedure TjktDriver.DoCompletarCampos;
begin
  if Assigned(FOnCompletarCampos)
     then FOnCompletarCampos(self);
end;


procedure TjktDriver.DoLineaMensaje(aTexto: string);
begin
    if Assigned(FOnLineaMensaje)
     then FOnLineaMensaje(self, aTexto);

end;

procedure TjktDriver.DoDesInhibirBotonAnt;
begin
    if Assigned(FOnDesInhibirBotonAnt)
     then FOnDesInhibirBotonAnt(self);
end;

procedure TjktDriver.DoDesInhibirBotonSig;
begin
    if Assigned(FOnDesInhibirBotonSig)
     then FOnDesInhibirBotonSig(self);
end;

procedure TjktDriver.DoInhibirBotonAnt;
begin
    if Assigned(FOnInhibirBotonAnt)
     then FOnInhibirBotonAnt(self);
end;

procedure TjktDriver.DoInhibirBotonSig;
begin
    if Assigned(FOnInhibirBotonSig)
     then FOnInhibirBotonSig(self);
end;

procedure TjktDriver.DoFiltroActivos;
begin
    if Assigned(FOnFiltroActivos)
     then FOnFiltroActivos(self);
end;

procedure TjktDriver.DoFiltroInActivos;
begin
    if Assigned(FOnFiltroInActivos)
     then FOnFiltroInActivos(self);
end;

procedure TjktDriver.DoOperacionTraer;
begin
    if Assigned(FOnOperacionTraer)
     then FOnOperacionTraer(self);
end;


function TjktDriver.CanClose :boolean ;
begin
  result := Self.Cancelar;
(*
  if FEstado = esNil
        then result := true
        else result := false;
*)
end;


procedure TjktDriver.SetXMLSave(aOper : TjktOperacion; aDataSet : TDataSet = nil; aEnviarTodo : Boolean = False);
var
  lista : TList;
begin
  // Se agrego un dataset por parametro para utilizar la
  // generacion de XML sin necesidad de enviar el dataset cabecera.
  if (aDataSet = nil)
     then aDataSet := FDataSetCab;

  lista := nil;
  if (FDataSetsActu.Count <> 0)
     then lista := obtenerListaDataSet(aDataSet)
     else if (FDatasetDet1 <> nil)
             then begin
                    nivel := 1;
                    lista := TList.Create;
                    lista.Add (TkbmMemTable (FDatasetDet1));
                  end;

  // Marcar Los registros como Modificados en Forma Automatica
  if (UpdateHandler)
     then AutomaticUpdate();

  recorrerDataSet(aDataSet, lista, aOper, 1, 1, aEnviarTodo);
  lista.Free;
end;

procedure TjktDriver.AutomaticUpdate();
var
  lista :TList;
  i : integer;
begin
   Lista := obtenerTodosLosDataSet();
   //Desactivar los controles visuales asociados a los Datasets
   if (Assigned(FDataSetCab))
       then FDataSetCab.BlockReadSize := 1;

   if (Assigned(FDataSetDet1))
       then FDataSetDet1.BlockReadSize := 1;

   if (Assigned(FDataSetDet2))
       then FDataSetDet2.BlockReadSize := 1;

   for i:=0 to Lista.Count-1 do
       TkbmMemTable (Lista.items[i]).BlockReadSize := 1;

   Try
     MarcarRegistrosComoModif(TkbmMemTable(FDataSetCab), Lista);
   finally
       // Activar los controles Asociados a los DataSets
       TRY
       for i:=0 to Lista.Count-1 do
            TkbmMemTable (Lista.items[i]).BlockReadSize := 0;
       EXCEPT
       END;

       if (Assigned(FDataSetCab))
           then FDataSetCab.BlockReadSize := 0;

       if (Assigned(FDataSetDet1))
           then FDataSetDet1.BlockReadSize := 0;

       if (Assigned(FDataSetDet2))
           then FDataSetDet2.BlockReadSize := 0;

   end;

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
    if ((aDataset.UpdateStatus <> usUnModified) or
        (aDataset.recordTag = 1))
        then marcarRegistrosPadres(aDataset);

    // Recorrer los DataSets Hijos
    for i:=0 to aLista.count -1 do
      begin
      datasetHijo := TkbmMemTable (aLista.items[i]);
      if ((datasetHijo.MasterSource<>Nil) and (datasetHijo.MasterSource.DataSet.Name = aDataset.Name))
          then MarcarRegistrosComoModif(datasetHijo,aLista);
      end;

    aDataset.Next;
    end;


end;

procedure TjktDriver.marcarRegistrosPadres(DataSet : TDataSet);
var
  DataSetPadre : TkbmMemTable;
begin
  if (TkbmMemTable(DataSet).MasterSource<>Nil)
     then begin
          DataSetPadre := TkbmMemTable(TkbmMemTable(DataSet).MasterSource.DataSet);
          DataSetPadre.RecordTag := 1;
          marcarRegistrosPadres(DataSetPadre);
          end;
end;



function  TjktDriver.obtenerTodosLosDataSet() : TList;
var
  i :integer;
  tds :TDatasetItem;
  dataSet :TkbmMemTable;
begin
  result := TList.create;
  for i:=0 to FDataSetsActu.Count -1 do
    begin
       tds :=  TDatasetItem (FDataSetsActu.Items[i]);
       dataSet := TkbmMemTable (tds.Dataset);
       result.Add(dataSet);
    end;
end;

function  TjktDriver.obtenerListaDataSet(aDataset:TDataSet) : TList;
var
  i :integer;
  tds :TDatasetItem;
  dataSet :TkbmMemTable;
begin
  result := TList.create;
  for i:=0 to FDataSetsActu.Count -1 do
    begin
       tds :=  TDatasetItem (FDataSetsActu.Items[i]);
       dataSet := TkbmMemTable (tds.Dataset);
       if  (dataSet.MasterSource <> nil)
       and (dataSet.MasterSource.DataSet = aDataSet)
            then result.Add(dataSet);
    end;
end;

procedure TjktDriver.recorrerDataSet(aDataset:TDataSet ; aLista :TList; aOper : TjktOperacion; aNivel, aNivelDataSet: integer; aEnviarTodo : Boolean = False);
var
  wrkDataSet :TDataset;
  modif  : boolean;
  lista2 : TList;
  i :integer;
begin
  aDataSet.BlockReadSize := 1;
  try
      if aDataset = nil
         then exit;
      aDataset.first;
      // Tabla de Cabcera
      aOper.addElement(aNivel, 'Tabla');
      aOper.addAtribute('nombre', aDataset.name);
      while not aDataSet.Eof do
        begin
          if aDataSet.FindField('modif') = nil
             then modif := true
             else modif := aDataSet.FieldByName('Modif').AsBoolean;
          // Si es Nuevo y activo en NO, no pasar al server
          if  ((aDataSet.FindField('new') <> nil) and
               (aDataSet.FieldByName('new').AsBoolean = True))
          and ((aDataSet.FindField('activo') <> nil) and
               (aDataSet.FieldByName('activo').AsBoolean = False))
                 then modif := false;

          if (UpdateHandler)
              then begin
                   if ((TkbmMemTable(aDataSet).UpdateStatus <> usUnModified)
                       or (TkbmMemTable(aDataSet).RecordTag = 1))
                       then modif := true
                       else modif := false;
                   end;

          if (aEnviarTodo)
             then modif := True;

          if modif = True
              then begin
                    // Fila
                    aOper.addElement(aNivel + 1 ,'Fila');
                    camposDataset(aDataSet, aOper);
                    {
                    case aNivelDataset of
                      1 : wrkDataset := FDatasetDet1;
                      2 : wrkDataset := FDatasetDet2;
                     else
                        wrkDataset := nil;
                    end;
                    }
                    if (aLista<>Nil)
                       then for i:=0 to aLista.count -1 do
                              begin
                                wrkDataset := TDataset (aLista.items[i]);
                                // Dario para compatibilidad con lo viejo.
                                // 25-02-2005
                                if (FDataSetsActu.Count <> 0)
                                   then lista2     :=  obtenerListaDataSet(wrkDataset)
                                   else begin
                                           lista2 := TList.Create;
                                            if (FDatasetDet2 <> nil)
                                           and (nivel <> 2)
                                               then begin
                                                     nivel := 2;
                                                     lista2.Add (TkbmMemTable (FDatasetDet2));
                                                   end;
                                        end;
                                recorrerDataset(wrkDataset, lista2, aOper, aNivel + 2, aNivelDataSet + 1, aEnviarTodo);
                                lista2.free;
                              end;
                   end;
          aDataSet.Next;
        end;
  finally
     aDataSet.BlockReadSize := 0;
  end;
end;



procedure TjktDriver.camposDataset(aDataset:TDataSet ; aOper : TjktOperacion);
var
  i:integer;
  fieldName :string;
begin
  for i := 0 to aDataSet.FieldCount - 1 do
    begin
      if (not IgnoreTags) and (aDataSet.Fields[i].Tag = 0)
         then continue;
      fieldName := aDataSet.Fields[i].FieldName;
      if  ((aDataSet.Fields[i] is TIntegerField) or
           (aDataSet.Fields[i] is TFloatField) or
           (aDataSet.Fields[i] is TCurrencyField))
      and (aDataSet.Fields[i].IsNull)
          then aOper.addAtribute(fieldName, '0')
          else begin

               if ((aDataset.fieldByName(fieldName).size>=255) or (aDataset.fieldByName(fieldName).DataType = ftMemo))
                  then begin
                       if (aDataset is TkbmMemTable)
                           then aOper.addAtribute(fieldName, jktMisc0001.getRichToText(TkbmMemTable(aDataset).fieldByName(fieldName).AsString))
                           else aOper.addAtribute(fieldName, jktMisc0001.getRichToText(aDataset.fieldByName(fieldName).AsString));
                       end
                  else aOper.addAtribute(fieldName,aDataset.fieldByName(fieldName).AsString);
               end;
    end;
end;


procedure TjktDriver.actualizarModif(aDataSet :TDataSet);
begin
   if (aDataSet.State <> dsInsert)
   and(aDataSet.State <> dsEdit) then aDataSet.Edit;

   aDataSet.FieldByName('modif').asBoolean := True;

   if (aDataSet as TkbmMemTable).MasterSource <> nil then
     begin
       actualizarModif((aDataSet as TkbmMemTable).MasterSource.dataset);
     end;
end;

function TjktDriver.esNuevo() : Boolean;
begin
  if (FEstado = esAlta)
      then result := true
      else result := falsE;
end;

function TjktDriver.esAbrir() : Boolean;
begin
  if (FEstado = esEdit)
      then result := true
      else result := falsE;
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
  tds     : TDatasetItem;
  dataSet : TkbmMemTable;
begin
  for i := 0 to FDataSetsActu.Count - 1 do
    begin
      tds :=  TDatasetItem (FDataSetsActu.Items[i]);
      dataSet := TkbmMemTable (tds.Dataset);
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
  if Assigned(FOnCustomToolButton)
     then FOnCustomToolButton(Self);
end;


procedure TjktDriver.TratarMensajeException(excep : Exception);
begin
  if (excep.Message <> 'Operation aborted')
     then mostrarMensError(excep.Message);
end;

procedure TjktDriver.ChangeModif(aDataSet :TDataSet);
begin

  if (aDataSet as TkbmMemTable).MasterSource <> nil
     then ChangeModif( (aDataSet as TkbmMemTable).MasterSource.DataSet);

  if (aDataSet.State <> dsInsert)
 and (aDataSet.State <> dsEdit)
     then aDataSet.Edit;

  aDataSet.FieldByName('modif').asBoolean := True;

end;

procedure TjktDriver.addDataSetsActu(aDataSet : TDataSet);
begin
  TDatasetItem(DataSetsActu.Add).Dataset := aDataSet;
end;

end.

