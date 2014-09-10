{*******************************************************************************
Fecha modificacion: 01/04/2014
Autor: Santiago Braceras
Detalles:
  Debido a que no encontramos versiones de LibXmlParser y SysTools que soporten
  el nuevo tipo UnicodeString de Delphi 2009 se decide cambiar en toda la unit
  los tipos 'String', 'Char', y 'PChar' por sus versiones que no soportan Unicode
  ('AnsiString', 'AnsiChar' y 'PAnsiChar' respectivamente), ya que no está previsto
  que la aplicación sea utilizada en países que requieran soporte de Unicode.

  Podría haber realizado un cast explicito en todas las asignaciones desde
  UnicodeString := AnsiString, pero requiere un esfuerzo similar a cambiar los
  tipos de datos en toda la unit.
*******************************************************************************}

unit jktCNMet0002;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IdHTTP, db, kbmMemCSVStreamFormat, jktCNMet0003;


const

  HEADER_ESTRUC_TMEMTABLE = '"@@FILE VERSION@@","251"';
  HEADER_MULTIDATASET     = 'MULTITABLE';


type
  TNuevoDataSetEvent = procedure(Sender: TObject; aDatasetName :string) of object;

type

  TjktServiceCaller = class(TComponent)
  private
    { Private declarations }
    FHTTP         :TIdHTTP;
    FProtocolo    :String;
    FHost         :String;
    FPort         :String;
    FPortW        :String;
    FServlet      :String;
    FAplicacion   :String;
    FXML          :TjktXML;
    FDataset      :TDataset;
    FStatus       :AnsiString;
    FMensaje      :AnsiString;
    FLog          :string;
    FTrace        :boolean;
    FModoExecute      :boolean;
    sfCSV: TkbmCSVStreamFormat;
    FIgnoreException : boolean;
    FOperaciones     :TDataset;
    currentOper      :string;
    FListaDataSetsToAssing : TStringList; // nada
    FCSVFormat: TkbmCSVStreamFormat;
    FResponse : AnsiString;
    FCertificado : string;
    InicioPost   :string;
    FinPost      :string;
    InicioParser :string;
    FinParser    :string;

    function getNombreTablaMemDataSet(Response : AnsiString): AnsiString;
    procedure     setPort(Value :string);
    procedure     tratarResponse(response: AnsiString);
    procedure     doNuevoDataset(aDatasetName: AnsiString);
    procedure     analizarStatusResponse;
    procedure     setearModifEnFalse;
    function      esEstrucMemDataSet(response: AnsiString) : boolean;
    procedure     llenarTablaMemDataSet(response: AnsiString);
    function      esMultiDataSet(response: AnsiString) : boolean;
    procedure     llenarMultiDataSet(response: AnsiString);
    procedure executeHTTP;
    procedure executeFile;
    procedure     asignarDataSetsLista(aDatasetName :string);
    procedure copiarDatasetEventos;
    procedure tratarDatosMemTable(response: AnsiString);
    function  obtenerDataset(aDatasetName: AnsiString) :TDataset;
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure   InicioOperacion;
    procedure   setOperacion(aOper :String);
    procedure   addElement(aNivel :integer; aElem :string); overload;

    procedure   addAtribute(aAttName, aAttValue :string); overload;
    procedure   addAtribute(aAttName : String; aAttValue : Boolean); overload;
    procedure   addAtribute(aAttName : String; aAttValue : Integer); overload;
    procedure   addDataSet(DataSet : TDataSet ; condicion : variant; aTag : Integer = 0 ; DataSetName : string = '');
    procedure enviarCampos(aDataset: TDataSet; aTag : Integer; aNivel : Integer);
    property Dataset :TDataset read FDataset  write FDataset;
    property ModoExecute  :boolean  read FModoExecute write FModoExecute;
    property Log  :string read FLog;
    property Mensaje : AnsiString read FMensaje write FMensaje;
    property Certificado : string read fCertificado write fCertificado;
    property Trace       :boolean read FTrace write FTrace;
    function getXML  :TStringList;

    procedure execute;
    procedure asignarDataSet(name : string ; dataSet : TDataSet);
    procedure pisarDataSet(name : string ; dataSet : TDataSet);

  published
    { Published declarations }
    property HTTP       :TIdHTTP read FHTTP       write FHTTP;
    property Servlet    :string  read FServlet    write FServlet;
    property Protocolo  :string  read FProtocolo  write FProtocolo;
    property Host       :string  read FHost       write FHost;
    property Port       :string  read FPortW      write setPort;
    property Aplicacion :string  read FAplicacion write FAplicacion;
    property Operaciones     :TDataset read FOperaciones write FOperaciones;
    property CSVFormat: TkbmCSVStreamFormat read FCSVFormat write FCSVFormat;
    property IgnoreException : boolean read FIgnoreException write FIgnoreException;
    property Response : AnsiString read FResponse write FResponse;

  end;

var
    puntoDecimal : Char;
    separadorMiles : Char;

const
    TABLATAG         = 'TABLA';
    VALORTABLAENTERA = 'VALOR_TABLA';
    FILATAG       = 'FILA';
    RESPONSETAG   = 'RESPONSE';
    STATUSTAG     = 'STATUS';
    MENSAJETAG    = 'MENSAJE';
    STATUSOK      = 'OK';
    STATUSWARNING = 'WARNING';
    EXC_INFO      = 'EXC_INFO';

procedure Register;

implementation

uses
  LibXmlParser, jktCNMet0005, jktFNMet0005, IdIOHandler, IdIOHandlerSocket, jktMisc0001, {FastStringFuncs,}
  IdHeaderList, inifiles, Registry, IdBaseComponent, IdAuthenticationDigest, IdAuthentication,
  IdAuthenticationSSPI, IdComponent, IdTCPConnection, IdTCPClient, StStrS, kbmMemTable, jktFNMet0008;

procedure Register;
begin
  RegisterComponents('Jakarta', [TjktServiceCaller]);
end;


constructor TjktServiceCaller.Create(AOwner: TComponent);
begin
  inherited create(AOwner);
  FXML                     := TjktXML.New(Self);
  sfCSV                    := TkbmCSVStreamFormat.Create(Self);
  sfCSV.CSVTrueString      := 'true';
  sfCSV.CSVFalseString     := 'false';
  sfCSV.CSVQuote           :='''';
  //sfCSV.CSVRecordDelimiter :='|';
  sfCSV.sfDef              := [];
  sfCSV.sfIndexDef         := [];
  FIgnoreException := False;
  FListaDataSetsToAssing := TStringList.Create;
  fCertificado := '';
end;

destructor TjktServiceCaller.Destroy;
var
  i : integer;
begin
  FHTTP := nil;
  FXML.Free;
  FreeAndNil(sfCSV);
  for i:=0 to FListaDataSetsToAssing.Count-1 do
    FListaDataSetsToAssing.Objects[i] := Nil;
  FListaDataSetsToAssing.Clear;
  FreeAndNil(FListaDataSetsToAssing);
  inherited Destroy;
end;

procedure  TjktServiceCaller.setPort(Value :string);
begin
  FPortW := Value;
  FPort := ':' + Value;
end;

procedure TjktServiceCaller.execute;
begin
{$IFDEF PRUEBA}
    executeFile;
{$ELSE}
    executeHTTP;
{$ENDIF}

end;


procedure TjktServiceCaller.executeFile;
var
  filtro, dsName, fileName: AnsiString;
begin

  Screen.cursor := crHourGlass;
  FModoExecute  := true;
  try

      filtro := 'oper = ' + '''' + currentOper + '''';
      if (FOperaciones = nil)
         then raise Exception.Create('No fue asignado la propiedad Operaciones del componente jkOperacion');

      if (FCSVFormat = nil)
         then raise Exception.Create('No fue asignado la propiedad CSVFormat del componente jkOperacion');


      FOperaciones.Filter   := filtro;
      FOperaciones.filtered := true;
      FOperaciones.First;
      while (not FOperaciones.EOF) do
        begin
          dsName    := FOperaciones.fieldByName('dataset').asString;
          fileName  := FOperaciones.fieldByName('file').asString;

          doNuevoDataset(dsName);
          if (FDataset <> nil) and (FDataset.active)
             then begin
                  (FDataset as TkbmMemTable).EmptyTable;
                  end;
          if (FDataset <> nil) and (not FDataset.Active)
             then begin
                  FDataset.Open;
                  end;
          (FDataset as TkbmMemTable).LoadFromFileViaFormat(fileName, FCSVFormat);
          FOperaciones.next;
        end;
   finally
     Screen.cursor := crDefault;
     FModoExecute := false;
   end;

end;

procedure TjktServiceCaller.executeHTTP;
var
  URL      : string;
  Params   : TStream;
  Response : AnsiString;
  i        : integer;
  DatasetEventos: TDataset;
begin
  Screen.cursor := crHourGlass;
  FModoExecute  := true;

{$IFDEF SERVLET}
  //URL := FProtocolo + FHost + FPort + '/' + FAplicacion + '/servlet/' + FServlet;
{$ELSE}
  //URL := FProtocolo + FHost + FPort + '/' + FAplicacion + '/' + FServlet;
{$ENDIF}

  URL := FProtocolo + FHost + FPort + '/' + FAplicacion + '/'+FServlet;

  http.Request.Referer      := URL;
  http.Request.ContentType  :='application/x-www-form-urlencoded';
  http.Request.Host         := FHost;
  http.Request.Connection   :='Keep-Alive';
  http.Request.CacheControl :='no-cache';
  HTTP.HandleRedirects      := True;

  try
    Params := TMemoryStream.Create;
    FXML.toStringList.saveToStream(Params);

    {$IFDEF DEBUGGING}
    FMet005 := TFMet005.Create(nil);
    {$ENDIF}

    {$IFDEF DEBUGGING}
    FMet005.mostrarError(FXML.toStringList.Text);
    {$ENDIF}

    try
      // Trace
      if FTrace then
        InicioPost := FormatDateTime('hh:mm:ss:zzz', Now());
      // Fin

      Response  := HTTP.Post(URL, Params); // advertimos que se hace un cast implicito con potencial perdida de datos de 'string' a 'AnsiString'.
                                           // Como el servidor java no esta manejando Unicode tampoco, suponemos que no habra perdida de datos
      FResponse := Response;

      {$IFDEF DEBUGGING}
      FMet005.mostrarError(FResponse);
      {$ENDIF}

      {$IFDEF DEBUGGING}
      FMet005.Free;
      {$ENDIF}

      // Trace
      if FTrace then
        FinPost := FormatDateTime('hh:mm:ss:zzz',Now());
      // Fin
    except
      on E: Exception do
        begin
          FreeAndNil(Params);
          Screen.cursor := crDefault;
          FModoExecute := false;
          FMensaje := E.Message;
          //mostrarMensErrorAbort(FMensaje) o mandar una Excepcion Silenciona;
          if (IgnoreException=false) then
            raise Exception.Create(FMensaje)
          else
            Abort;
        end;
    end;

     //  Trace
      if FTrace
         then InicioParser := FormatDateTime('hh:mm:ss:zzz',Now());
     // Fin

     Self.tratarResponse(Response);

    //  Trace
      if FTrace
         then FinParser := FormatDateTime('hh:mm:ss:zzz',Now());
    // Fin


    //  Trace
      if FTrace
         then begin
               i := FListaDataSetsToAssing.IndexOf('TEventos');
               if (i<>-1)
                    then DatasetEventos := TDataSet(FListaDataSetsToAssing.Objects[i]);
               if not DatasetEventos.Active
                  then DatasetEventos.Open;
               DatasetEventos.Append;
               DatasetEventos.fieldByName('oper').asString   := currentOper;
               DatasetEventos.fieldByName('secu').asInteger  := 01;
               DatasetEventos.fieldByName('evento').asString := 'Inicio Post';
               DatasetEventos.fieldByName('hora').asString   := InicioPost;

               DatasetEventos.Append;
               DatasetEventos.fieldByName('oper').asString   := currentOper;
               DatasetEventos.fieldByName('secu').asInteger  := 04;
               DatasetEventos.fieldByName('evento').asString := 'Fin Post';
               DatasetEventos.fieldByName('hora').asString   := FinPost;

               DatasetEventos.Append;
               DatasetEventos.fieldByName('oper').asString   := currentOper;
               DatasetEventos.fieldByName('secu').asInteger  := 05;
               DatasetEventos.fieldByName('evento').asString := 'Inicio Parser';
               DatasetEventos.fieldByName('hora').asString   := InicioParser;

               DatasetEventos.Append;
               DatasetEventos.fieldByName('oper').asString   := currentOper;
               DatasetEventos.fieldByName('secu').asInteger  := 06;
               DatasetEventos.fieldByName('evento').asString := 'Fin Parser';
               DatasetEventos.fieldByName('hora').asString   := FinParser;
               DatasetEventos.Post;

               copiarDatasetEventos;

              end;
    // Fin

     Screen.cursor := crDefault;
     FModoExecute := false;
     FreeAndNil(Params);
   // exception if
    except
     on E: Exception do
        begin
         FreeAndNil(Params);
         FModoExecute := false;
 //        Application.MessageBox(PChar(FMensaje), 'Error', mb_ok);
         Screen.cursor := crDefault;
         if FMensaje = ''
            then FMensaje := E.Message;
         //abort;
         // Si hay un error que cree una exception sin mensaje (silenciosa)
         if (IgnoreException=false)
            then mostrarMensErrorAbort(FMensaje)
            else Abort;
         //Exception.Create(FMensaje);
        end;
    end;
end;

{*******************************************************************************
Fecha modificacion: 01/04/2014
Autor: Santiago Braceras
Detalles:
  LibXmlParser actualmente no soporta el nuevo tipo UnicodeString de Delphi
  2009. No hay compatibilidad para UnicodeString
*******************************************************************************}
procedure TjktServiceCaller.tratarResponse(response: AnsiString);
var
   fs        : PAnsiChar;// PChar;
   i , j     : Integer;
   xmlParser : TXmlParser;
   fieldName : AnsiString;
   value, value1: AnsiString;
   pos: cardinal;
   listaDataSets: TStringList;
begin
   FormatSettings.DecimalSeparator  := puntoDecimal;
   FormatSettings.ThousandSeparator := separadorMiles;

// Para Debug de datos entre Java -> Delphi
//   if (FMet005 <> nil)
//      then FMet005.mostrarError(response);

   // Verificar si la estructura enviada corresponde a un TMemDataSet
   if esEstrucMemDataSet(response)
      then begin
             llenarTablaMemDataSet(response);
             exit;
           end;

      // Verificar si la estructura enviada corresponde a un TMemDataSet
   if esMultiDataSet(response)
      then begin
             llenarMultiDataSet(response);
             exit;
           end;


   fs := PAnsiChar(response);

   listaDataSets := TStringList.Create;
   xmlParser     := TXmlParser.Create;

  try
   FStatus := '';
   XmlParser.LoadFromBuffer(fs);
   XmlParser.StartScan;
   XmlParser.Normalize := FALSE;
   WHILE XmlParser.Scan DO
     BEGIN
      CASE XmlParser.CurPartType OF
        ptStartTag,
        ptEmptyTag  :
         BEGIN
            FOR i := 0 TO XMLParser.CurAttr.Count -1 DO
               begin
                 if (XMLParser.CurName = RESPONSETAG)
                        then begin
                                if XMLParser.CurAttr.Name(i) = STATUSTAG
                                   then begin
                                         FStatus := XMLParser.CurAttr.Value(i);
                                         //FMensaje := XMLParser.CurAttr.Value(i+1);
                                         analizarStatusResponse;
                                        end;
                                if XMLParser.CurAttr.Name(i) = MENSAJETAG
                                   then begin
                                         FMensaje := XMLParser.CurAttr.Value(i);
                                         //analizarStatusResponse;
                                        end;
                               continue;
                             end ;

                 if (XMLParser.CurName = TABLATAG) and (i = 0)
                        then begin
                               doNuevoDataset(XMLParser.CurAttr.Value(i));
                               if (FDataset <> nil) and (FDataset.active)
                                        then FDataset.close;
                               if (FDataset <> nil)
                                        then begin
                                             FDataset.open;
                                             if (FDataset is TkbmMemTable)
                                                 then begin
                                                      TkbmMemTable(FDataset).EnableVersioning := False;
                                                      TkbmMemTable(FDataset).BlockReadSize := 0;
                                                      listaDataSets.AddObject('',TkbmMemTable(FDataset));
                                                      end;
                                             end;
                               continue;
                              end;


                if (XMLParser.CurName = VALORTABLAENTERA) and (i = 0)
                    then begin
                          if FDataset <> nil
                            then begin
                                   //FMet005.mostrarError('atributo:'+XMLParser.CurAttr.Value(i));
                                   tratarDatosMemTable(XMLParser.CurAttr.Value(i));
                                 end;
                            continue;
                          end;

                if (XMLParser.CurName = FILATAG) and (i = 0)
                    then begin
                          if FDataset <> nil
                            then begin
                                  FDataset.append;
                                  setearModifEnFalse;
                                 end;
                         end;

                if (XMLParser.CurName = FILATAG) and (FDataset <> Nil)
                   then begin
                        // Modificado por : Snimo 30/12/2003
                        // Se cambia el codigo porque de esta forma al asignar los numeros a los
                        // campos de los DataSet , se evite el problema de la configuracion
                        // regional con los puntos y comas
                        // Se comento la siguiente linea de codigo : FDataset.fieldByName(fieldName).Value := XMLParser.CurAttr.Value(i)
                        fieldName := XMLParser.CurAttr.Name(i);
                        if (FDataset.fieldByName(fieldName).DataType = ftInteger) or
                           (FDataset.fieldByName(fieldName).DataType = ftSmallint) or
                           (FDataset.fieldByName(fieldName).DataType = ftWord)
                           then begin
                                  value := XMLParser.CurAttr.Value(i);
                                  // si tiene un punto, le saco todo a derecha del punto
                                  if StrStPosS(value, '.', pos)
                                       then  begin
                                                value1 := ExtractWordS(1,value,'.');
                                                FDataset.fieldByName(fieldName).AsInteger := Trunc(StrToInt(value1));
                                             end
                                  else
                                  // si tiene una coma, le saco todo a derecha de la coma
                                  if StrStPosS(value, '.', pos)
                                       then   begin
                                                value1 := ExtractWordS(1,value,',');
                                                FDataset.fieldByName(fieldName).AsInteger := Trunc(StrToInt(value1));
                                             end

                                  else  FDataset.fieldByName(fieldName).AsInteger := Trunc(StrToInt(value));
                                  

                                end
                           else if (FDataset.fieldByName(fieldName).DataType = ftCurrency) or
                                   (FDataset.fieldByName(fieldName).DataType = ftFloat)
                                   then FDataset.fieldByName(fieldName).Value := StrToFloat(XMLParser.CurAttr.Value(i)) // no hay una version AnsiString de StrToFloat ni de StrToInt
                                   else begin
                                        if ((FDataset.fieldByName(fieldName).Size >=255) or
                                            (FDataset.fieldByName(fieldName).DataType = ftMemo))
                                           then FDataset.fieldByName(fieldName).Value := getTextToRich(XMLParser.CurAttr.Value(i))
                                           else FDataset.fieldByName(fieldName).Value := XMLParser.CurAttr.Value(i);
                                        end;
                        end;
               end;
         END;
        ptEndTag    : begin
                      CONTINUE;
                      end;
       END;
     end;

  finally

   if (FDataset <> nil) and ((FDataset.state = dsEdit) or (FDataset.state = dsInsert))
       then FDataset.Post;

    // La idea es activar el Versioning de todos los datasets para realizar las seguimientos
    for j:=0 to listaDataSets.Count-1 do
      begin
      // Habilita el seguimiento de Registros
      TkbmMemTable(listaDataSets.Objects[j]).EnableVersioning := True;
      TkbmMemTable(listaDataSets.Objects[j]).BlockReadSize    := 0;
      TkbmMemTable(listaDataSets.Objects[j]).Refresh;

      // Evita que a veces no aparezcan los registros detalles
      if (TkbmMemTable(listaDataSets.Objects[j]).State in [dsEdit,dsInsert])
          then TkbmMemTable(listaDataSets.Objects[j]).Post;
      // Posiciona el Cursor sobre el primer registro
      TkbmMemTable(listaDataSets.Objects[j]).First;
      end;

    for j:=0 to listaDataSets.Count-1 do
      listaDataSets.Objects[j] := Nil;
    FreeAndNil(listaDataSets);

    XmlParser.Free;

(* No va mas.
    if FStatus = ''
       then begin
              FStatus  := 'MAL';
              FMensaje := 'No pudo establecer conexion con el Server';
              //mostrarMensErrorAbort(FMensaje);
              raise Exception.create(FMensaje);
            end;
*)
  end;
end;


procedure TjktServiceCaller.setearModifEnFalse;
begin
  if FDataSet.FindField('modif') <> nil
         then FDataSet.FieldByName('modif').AsBoolean := False;
  if FDataSet.FindField('new') <> nil
         then FDataSet.FieldByName('new').AsBoolean := False;
end;


procedure TjktServiceCaller.InicioOperacion;
begin
   FIgnoreException := false;
   FDataSet := nil;
   FXML.setEncabezado('<?xml version="1.0" encoding="ISO-8859-1" standalone="yes"?>');
end;


procedure TjktServiceCaller.doNuevoDataset(aDatasetName: AnsiString);
begin
    if (FDataset <> nil) and ((FDataset.state = dsEdit) or (FDataset.state = dsInsert))
       then FDataset.Post;
    FDataset := nil;
    FDataset := obtenerDataset(aDatasetName);
    if FDataset = nil
        then raise Exception.Create('No existe el dataset: ' + aDatasetName);
end;

function TjktServiceCaller.obtenerDataset(aDatasetName: AnsiString) :TDataset;
var
 x :integer;
begin
  result := TDataset (self.Owner.FindComponent(aDatasetName));
  if result = nil
     then   if FListaDataSetsToAssing.Find(aDatasetName, x)  = true
                then result := TDataset (FListaDataSetsToAssing.Objects[x]);

end;


procedure TjktServiceCaller.analizarStatusResponse;
begin
     if (FStatus = STATUSWARNING)
         then  MessageDlg(FMensaje, mtWarning,[mbOk], 0)
         else if  (FStatus <> STATUSOK)
             then begin
                //mostrarMensErrorAbort('Error en el Response del Servlet');

                raise Exception.Create(FMensaje);
             end;
end;

procedure TjktServiceCaller.setOperacion(aOper :String);
var
  keyName :string;
begin
   currentOper := aOper;
   FXML.addElement(0, 'Request');
   {$IfDef SIN_JAVA}
      keyName := 'opTest';
  {$Else}
      keyName := 'op';
  {$EndIf}
   FXML.addAtribute(keyName, aOPer);
   if Login <> nil
      then begin
           FXML.addAtribute('sesionID',    Login.sesionID);
           FXML.addAtribute('oid_usu_emp', IntToStr(Login.CurrentEmpresa.OidEmp));
           FXML.addAtribute('sys_oid_sucursal', IntToStr(Login.OidSucursal));
           if (Certificado='')
              then FXML.addAtribute('certificado', Login.Certificado)
              else FXML.addAtribute('certificado', Certificado);
           end;
   FXML.addElement(1, 'Campos');
end;

procedure TjktServiceCaller.addAtribute(aAttName, aAttValue :string);
begin
  aAttName := upperCase(aAttName);
  FXML.addAtribute(aAttName, aAttValue);
end;

procedure TjktServiceCaller.addAtribute(aAttName : String; aAttValue : Integer);
begin
  aAttName := upperCase(aAttName);
  FXML.addAtribute(aAttName, IntToStr(aAttValue));
end;

procedure TjktServiceCaller.addAtribute(aAttName : String; aAttValue : Boolean);
begin
  aAttName := upperCase(aAttName);
  if (aAttValue)
     then FXML.addAtribute(aAttName, 'True')
     else FXML.addAtribute(aAttName, 'False');
end;

procedure TjktServiceCaller.addElement(aNivel: integer; aElem: string);
begin
   FXML.addElement(aNivel, aElem);
end;

function TjktServiceCaller.getXML: TStringList;
begin
   result := FXML.toStringList;
end;

function TjktServiceCaller.esEstrucMemDataSet(response: AnsiString) : boolean;
begin
  if copy(response, 1, 24) = HEADER_ESTRUC_TMEMTABLE
     then result := true
     else result := false;
end;

function TjktServiceCaller.esMultiDataSet(response: AnsiString) : boolean;
begin
  if Copy(response, 1, 10) = HEADER_MULTIDATASET
     then result := true
     else result := false;
end;

function TjktServiceCaller.getNombreTablaMemDataSet(Response: AnsiString): AnsiString;
var
  nombreTentativo , nombreReal : string;
  i : integer;
begin
  nombreReal := '';
  nombreTentativo := copy(response,25,40);
  for i:=1 to length(nombreTentativo) do
    begin
    if (nombreTentativo[i]=',')
       then break;
    nombreReal := nombreReal + nombreTentativo[i];
    end;
  result := nombreReal;
end;

procedure TjktServiceCaller.llenarTablaMemDataSet(response: AnsiString);
var
  StringStream : TStringStream;
begin
  doNuevoDataset(getNombreTablaMemDataSet(response));
  StringStream := TStringStream.Create(response);
  TkbmMemTable(FDataset).EnableVersioning := False;
  try

    sfCSV.CSVQuote           :='"';
    //sfCSV.CSVRecordDelimiter :=',';
    if FDataset.Active
      then FDataset.close;
    TkbmMemTable(FDataset).LoadFromStreamViaFormat(StringStream,sfCSV);

    sfCSV.CSVQuote           :='''';
    //sfCSV.CSVRecordDelimiter :='|';


  finally
    TkbmMemTable(FDataset).EnableVersioning := True;
  end;
  StringStream.Free;
end;

procedure TjktServiceCaller.llenarMultiDataSet(response: AnsiString);
var
 qDatasets, inicioDatos, longitud, x, inicial :integer ;
 datos :string;
begin
    inicial := 13;
    qDatasets := strToInt(copy(response, 11,2));
    inicioDatos  := inicial + 7 * qDatasets;

    for x:=1 to qDatasets do
      begin
         longitud := strToInt(copy(response, inicial,7));
         datos := copy(response, inicioDatos, longitud);
         llenarTablaMemDataSet(datos);
         inicial := inicial + 7;
         inicioDatos  := inicioDatos + longitud;

      end;
end;


procedure TjktServiceCaller.tratarDatosMemTable(response: AnsiString);
var
  StringStream : TStringStream;
begin
  TkbmMemTable(FDataset).EnableVersioning := False;
  StringStream := TStringStream.Create(response);

  try
    sfCSV.CSVQuote           :='''';
    //sfCSV.CSVRecordDelimiter :='|';

    //FMet005.mostrarError(response);;
    TkbmMemTable(FDataset).LoadFromStreamViaFormat(StringStream, sfCSV);

    sfCSV.CSVQuote           :='"';
    //sfCSV.CSVRecordDelimiter :=',';


  finally
    TkbmMemTable(FDataset).EnableVersioning := True;
  end;
  StringStream.Free;
end;


procedure TjktServiceCaller.copiarDatasetEventos;
var
  indice : integer;
  Teve    : TDataset;
  TeveTot : TDataset;
begin
  indice := FListaDataSetsToAssing.IndexOf('TEventos');
  if (indice<>-1)
      then  Teve := TDataset (FListaDataSetsToAssing.Objects[indice]);

  indice := FListaDataSetsToAssing.IndexOf('TEveTot');
  if (indice<>-1)
      then  TeveTot := TDataset (FListaDataSetsToAssing.Objects[indice]);

  if  TeveTot.Active = false then TEveTot.Open;
  if  Teve.Active    = false then TEve.Open;
  Teve.First;
  while not Teve.Eof do
    begin
      TeveTot.Append;
      TeveTot.fieldByName('oper').asString   := Teve.fieldByName('oper').asString;
      TeveTot.fieldByName('secu').asInteger  := Teve.fieldByName('secu').asInteger;
      TeveTot.fieldByName('evento').asString := Teve.fieldByName('evento').asString;
      TeveTot.fieldByName('hora').asString   := Teve.fieldByName('hora').asString;
      TeveTot.Post;
      Teve.Next;
    end;
end;


procedure TjktServiceCaller.pisarDataSet(name : string ; dataSet : TDataSet);
var
  indice : integer;
begin
  indice := FListaDataSetsToAssing.IndexOf(name);
  if (indice<>-1)
     then FListaDataSetsToAssing.Delete(indice);
  FListaDataSetsToAssing.AddObject(name,dataset);
end;

procedure TjktServiceCaller.asignarDataSet(name : string ; dataSet : TDataSet);
begin
  if (FListaDataSetsToAssing.IndexOf(name)=-1)
     then FListaDataSetsToAssing.AddObject(name,dataset);
end;

procedure TjktServiceCaller.asignarDataSetsLista(aDatasetName :string);
var
  i : integer;
begin
  i := FListaDataSetsToAssing.IndexOf(aDatasetName);
  if (i<>-1)
     then self.Dataset := TDataSet(FListaDataSetsToAssing.Objects[i]);
end;

procedure TjktServiceCaller.addDataSet(DataSet : TDataSet ;
                                   condicion : variant;
                                   aTag : Integer = 0 ;
                                   DataSetName : string = '');
begin
    if (DataSet = nil)
       then Exit;

    addElement ( 1, 'Tabla');

    if (DataSetName<>'')
       then addAtribute ( 'nombre' , upperCase(DataSetName))
       else addAtribute ( 'nombre' , upperCase(DataSet.Name));

    if not DataSet.Active
       then Exit;

    DataSet.First;
    while (not DataSet.EOF) do
      begin

        if (condicion = 'modif')
           then begin
                  if (DataSet.FieldByName('modif').AsBoolean)
                     then enviarCampos(DataSet, aTag, 2);
                end
           else begin
                  enviarCampos(DataSet, aTag, 2);
                end;

        DataSet.Next;
      end;
end;


procedure TjktServiceCaller.enviarCampos(aDataset: TDataSet; aTag : Integer; aNivel :integer);
var
  idx : integer;
begin
  addElement ( aNivel, 'Fila');

  for idx := 0 to aDataset.Fields.Count - 1 do
    begin
      if ((aDataset.Fields[idx] is TIntegerField) or (aDataset.Fields[idx] is TFloatField) or (aDataset.Fields[idx] is TCurrencyField))
     and  (aDataset.Fields[idx].IsNull)
          then if (aTag <> 0)
                  then begin
                         if (aDataset.Fields[idx].Tag >= aTag)
                            then addAtribute(aDataset.Fields[idx].FieldName, '0')
                       end
                  else addAtribute(aDataset.Fields[idx].FieldName, '0')

     else if (aTag <> 0)
              then begin
                    if (aDataset.Fields[idx].Tag >= aTag)
                        then if ((aDataset.Fields[idx] is TMemoField) or (aDataset.Fields[idx].Size>=255))
                                    then addAtribute (aDataset.Fields[idx].FieldName, getRichToText(aDataset.Fields[idx].AsString))
                                    else addAtribute (aDataset.Fields[idx].FieldName, aDataset.Fields[idx].AsString);
                   end
              else begin
                    if ((aDataset.Fields[idx] is TMemoField) or (aDataset.Fields[idx].Size>=255))
                          then addAtribute (aDataset.Fields[idx].FieldName, getRichToText(aDataset.Fields[idx].AsString))
                          else addAtribute (aDataset.Fields[idx].FieldName, aDataset.Fields[idx].AsString);
                   end;

    end;
end;

end.






