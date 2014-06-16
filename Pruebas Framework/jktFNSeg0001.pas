unit jktFNSeg0001;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, Db, kbmMemTable, IdAntiFreezeBase, IdAntiFreeze, iniFiles,
  IdIOHandler, IdIOHandlerSocket, kbmMemCSVStreamFormat, jktCNMet0012, jktCNMet0002;

type
  TFPampaSG0005 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EIdent: TEdit;
    Label2: TLabel;
    EPasswd: TEdit;
    GBConexion: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    EHost: TEdit;
    EPort: TEdit;
    BOK: TButton;
    BCancel: TButton;
    CBDefault: TCheckBox;
    Label5: TLabel;
    CBIdioma: TComboBox;
    CheckBox2: TCheckBox;
    IdHTTP1: TIdHTTP;
    Usuario: TkbmMemTable;
    Usuariooid_usu: TIntegerField;
    UsuarioApeNom: TStringField;
    Empresa: TkbmMemTable;
    Empresaoid_emp: TIntegerField;
    EmpresadescEmpresa: TStringField;
    Usuarioiniciales: TStringField;
    EmpresacodEmpresa: TStringField;
    UsuariosesionID: TStringField;
    EAplicacion: TEdit;
    Label7: TLabel;
    UsuariodecimalSeparator: TStringField;
    Empresais_default: TBooleanField;
    Button1: TButton;
    Empresaoid_per_dat: TIntegerField;
    Empresaoid_per_fun: TIntegerField;
    TOper: TkbmMemTable;
    TOperoper: TStringField;
    TOperdataset: TStringField;
    TOperfile: TStringField;
    EServlet: TEdit;
    Usuariocertificado: TStringField;
    TAvisoCambioPassword: TjktMemTable;
    TAvisoCambioPasswordcaduco_password: TBooleanField;
    TAvisoCambioPasswordaviso_prox_venc: TBooleanField;
    TAvisoCambioPassworddias: TIntegerField;
    mtSucursalLogin: TjktMemTable;
    mtSucursalLoginoid_suc: TIntegerField;
    mtSucursalLogindesc_suc: TStringField;
    Empresacolor: TStringField;
    oper: TjktServiceCaller;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EIdentKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BCancelClick(Sender: TObject);
  private
    { Private declarations }
//    FPampaSG0008 : TFPampaSG0008;
    FOK          :boolean;
    FAutoLogin   :boolean;
    host         :string;
    port         :string;
    servlet      :string;
    aplicacion   :string;
    integAuth    :string;
    trace        :string;
    FMensaje     :string;
    FPrimerColor  :integer;

    procedure crearLogin;
    procedure cerrar;
//    procedure registrarHostPort;
//    function cambiarPassword(LoginName : string ; Password : string) : TFPampaSG0008;
  public
    { Public declarations }
    instalacion        :boolean;
    property AutoLogin :boolean  read FAutoLogin;
    property OK        :boolean  read FOK;
    property Mensaje   : string read FMensaje write FMensaje;
    property PrimerColor   :integer  read FPrimerColor;

end;

var
  FPampaSG0005: TFPampaSG0005;
  IgnoreExceptionLogin : boolean;
  seConecto : boolean;
  captionLogin : string;

implementation

{$R *.DFM}

uses
  jktCNMet0005, jktMisc0001;

procedure TFPampaSG0005.Button1Click(Sender: TObject);
begin
//  cambiarPassword('','');
end;

//function TFPampaSG0005.cambiarPassword(LoginName : string ; Password : string) : TFPampaSG0008;
//begin
//  FPampaSG0008 := TFPampaSG0008.Create(Self);
//  if (LoginName<>'')
//     then begin
//          FPampaSG0008.setLogin(LoginName);
//          FPampaSG0008.NoLimpiarLoginNiPassword := True;
//          end;
//  if (Password<>'')
//     then begin
//          FPampaSG0008.setPassword(Password);
//          FPampaSG0008.NoLimpiarLoginNiPassword := True;
//          end;
//  FPampaSG0008.setHost(EHost.Text);
//  FPampaSG0008.setPort(EPort.Text);
//  // 17-02-2005
//  FPampaSG0008.setServlet('FrontServletXML');
//  // 17-02-2005
//  FPampaSG0008.setAplicacion(EAplicacion.Text);
//  FPampaSG0008.setAutoLogin(FAutoLogin);
//  FPampaSG0008.setProtocolo('http://');
//
//  if ( integAuth = 'S' )
//     then FPampaSG0008.setHTTPOptions([hoInProcessAuth,hoForceEncodeParams]);
//
//  FPampaSG0008.ShowModal();
//  result := FPampaSG0008;
//end;

procedure TFPampaSG0005.FormShow(Sender: TObject);
begin

  TAvisoCambioPassword.Close;
  TAvisoCambioPassword.Open;

  self.Height := self.height - GBConexion.height + 20;
  if trim(EHost.text) = ''
     then begin
           self.Height := self.height + GBConexion.height;
           GBConexion.visible := true;
          end
     else GBConexion.visible := false;

  TOper.Open;
 {$IFDEF PRUEBA}
    TOper.LoadFromFileViaFormat('OperInicio.csv', csv1);
 {$ENDIF}
end;

procedure TFPampaSG0005.EIdentKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_F1)  and   (GBConexion.visible = false)
     then begin
            self.Height := self.height + GBConexion.height;
            GBConexion.visible := true;
          end;
end;

procedure TFPampaSG0005.BOKClick(Sender: TObject);
//var
//  FPampaSG0008 : TFPampaSG0008;
begin

  if (not Self.AutoLogin)
     then begin
            if trim(EIdent.Text) = ''
               then raise Exception.Create('Debe Ingresar la Identificacion');

            if trim(EPasswd.Text) = ''
               then raise Exception.Create('Debe Ingresar la Password');
          end;

  if Usuario.Active
     then Usuario.close;
  Usuario.open;

  if Empresa.Active
     then Empresa.close;
  Empresa.open;

  oper.Host       := EHost.Text;
  oper.Port       := EPort.Text;
    // 17-02-2005
  EServlet.Text := 'FrontServletXML';
  oper.Servlet    := EServlet.Text;
  // 17-02-2005
  oper.Aplicacion := EAplicacion.Text;
  oper.Protocolo  := 'http://';

  if ( integAuth = 'S' )
     then oper.HTTP.HTTPOptions := [hoInProcessAuth,hoForceEncodeParams];

  oper.InicioOperacion;
  oper.setOperacion('Login');
  oper.addAtribute('iniciales', EIdent.text);
  oper.addAtribute('password',  EPasswd.text);
  oper.addAtribute('datasetUsu',  mtSucursalLogin.Name);

  if (FAutoLogin)
     then oper.addAtribute('autologin', 'S')
     else oper.addAtribute('autologin', 'N');

  if instalacion
     then oper.addAtribute('instalacion', '1');
  Oper.IgnoreException := False;
  oper.execute;

  // Verificar si caduco o no la contraseña
  if (TAvisoCambioPasswordcaduco_password.AsBoolean)
     then begin
          MessageDlg('La contraseña esta vencida, debe cambiar la misma.', mtInformation,
                [mbOK], 0);
//          FPampaSG0008 := cambiarPassword(EIdent.text,EPasswd.text);
//          if (not FPampaSG0008.Aceptar)
//              then Application.Terminate;
     end
  else if (TAvisoCambioPasswordaviso_prox_venc.AsBoolean)
          then begin
               if MessageDlg('Su clave vence en '+ IntToStr(TAvisoCambioPassworddias.AsInteger)+' días. Desea cambiarla?',
                  mtConfirmation, [mbYes, mbNo], 0) = mrYes
                  then begin
     //                  FPampaSG0008 := cambiarPassword(EIdent.text,EPasswd.text);
                       end;
               end;

  Mensaje := '';
  if (Trim(oper.Mensaje)<>'')
     then begin
          Mensaje := oper.Mensaje;
          if (IgnoreExceptionLogin = false)
              then raise Exception.Create(Mensaje);
          end
     else seConecto := True;

  crearLogin;

//  registrarHostPort;

  cerrar;
end;

procedure TFPampaSG0005.crearLogin;
var
  OidEmpresaActiva : integer;
begin

  OidEmpresaActiva := 0;

  FOK := true;
  Usuario.First;
  Login := TjktLogin.New(Usuario.fieldByName('oid_usu').AsInteger,
                         Usuario.fieldByName('ApeNom').AsString,
                         Usuario.fieldByName('sesionID').asString,
                         Usuariocertificado.AsString);

  Login.OidSucursal := mtSucursalLogin.fieldByName('oid_suc').AsInteger;




  Empresa.First;
  while not Empresa.Eof do
    begin
       Login.addEmpresa( Empresa.fieldByName('oid_emp').AsInteger,
                         Empresa.FieldByName('descEmpresa').asString,
                         0,
                         0);

       if Empresa.fieldByName('is_default').AsBoolean
          then begin
                 OidEmpresaActiva := Empresa.fieldByName('oid_emp').AsInteger;
                 if Empresa.fieldByName('color').asString <> ''
                      then FPrimerColor      := Empresa.fieldByName('color').AsInteger
                      else FPrimerColor      := clBtnFace;
                end;

       Empresa.Next;
    end;

// Seteo Datos del Login

  Login.setEmpresaActiva(OidEmpresaActiva);
  Login.Host       := EHost.Text;
  Login.Port       := EPort.Text;
    // 17-02-2005
  Login.Servlet    := EServlet.Text;
  // 17-02-2005
  Login.Aplicacion := EAplicacion.Text;
  Login.Protocolo := 'http://';

  if (integAuth = 'S')
     then begin
            Login.IntegAuth   := True;
            Login.HTTPOptions := [hoInProcessAuth,hoForceEncodeParams];
          end
     else begin
            Login.IntegAuth   := False;
            Login.HTTPOptions := [hoForceEncodeParams];
          end;

  if (trace = 'S')
      then Login.trace := true
      else Login.trace := false;

  DecimalSeparator  := puntoDecimal;
  ThousandSeparator := separadorMiles;
end;

procedure TFPampaSG0005.cerrar;
begin
   self.close;
end;

procedure TFPampaSG0005.FormCreate(Sender: TObject);
var
  iniFile   : TIniFile;
  autoLogin : String;
  existeFile: boolean;
  usuario : string;
  password : string;
  initialOperation : string;
  ListaAtributos : TStringList;
  i : integer;
  valorAtri : string;
  nomAtri : string;
  loginOut : string;
begin

   ListaAtributos := TStringList.Create;

   usuario := '';
   password := '';
   self.Caption := captionLogin;
   FAutoLogin := False;
   initialOperation := '';
   loginOut := '';

   iniFile    := TIniFile.Create ( ChangeFileExt( Application.ExeName, '.ini') );
   existeFile := FileExists(iniFile.FileName);
   autoLogin  := IniFile.ReadString('LOGIN', 'autologin', 'N');
   trace      := IniFile.ReadString('TRACE', 'trace', 'N');

   if ( existeFile )
  and ( autoLogin = 'S' )
      then begin
             FAutoLogin := True;
             host       := IniFile.ReadString('LOGIN', 'host', '');
             port       := IniFile.ReadString('LOGIN', 'port', '');
             aplicacion := IniFile.ReadString('LOGIN', 'aplicacion', '');
             servlet    := IniFile.ReadString('LOGIN', 'servlet', '');
             integAuth  := IniFile.ReadString('CONEXION', 'integrada', 'N');
             usuario    := IniFile.ReadString('LOGIN', 'usuario', '');
             password   := IniFile.ReadString('LOGIN', 'password', '');
             loginOut :=   IniFile.ReadString('LOGIN', 'login_out', '');

           end
      else begin

             if ( existeFile )
                 then begin
                      host       := IniFile.ReadString('LOGIN', 'host', '');
                      port       := IniFile.ReadString('LOGIN', 'port', '');
                      aplicacion := IniFile.ReadString('LOGIN', 'aplicacion', '');
                      servlet    := IniFile.ReadString('LOGIN', 'servlet', '');
                  end
                 else begin
//                      reg          := TjktRegistry.Crear;
//                      host         := reg.ReadHost;
//                      port         := reg.ReadPort;
//                      servlet      := reg.ReadServlet;
//                      aplicacion   := reg.ReadAplicacion;
                      end;
           end;

   if host <> ''
      then EHost.Text := host;

   if port <> ''
      then EPort.Text := port;

     // 17-02-2005
   if servlet <> ''
      then EServlet.Text := servlet
      else EServlet.Text := oper.Servlet;
  // 17-02-2005

   if aplicacion <> ''
      then EAplicacion.Text := aplicacion
      else EAplicacion.Text := 'JakartaERP'; // oper.aplicacion;

   if ( autoLogin = 'S' )
      then begin
             if (usuario<>'')
                 then EIdent.Text  := usuario
                 else EIdent.Text  := GetNombreUsuario();
             if (password<>'')
                then EPasswd.Text := password
                else EPasswd.Text := '';
             Self.BOK.Click;
           end;


   if ( existeFile )
  and ( autoLogin = 'S' )
        then begin
             initialOperation := IniFile.ReadString('INITIAL_OPERATION', 'operation', '');

             if (initialOperation<>'')
                then begin
                     oper.InicioOperacion;
                     oper.setOperacion(initialOperation);
                     IniFile.ReadSection('INITIAL_OPERATION',ListaAtributos);
                     for i:=0 to ListaAtributos.Count-1 do
                       begin
                       nomAtri := ListaAtributos.Strings[i];
                       valorAtri    := IniFile.ReadString('INITIAL_OPERATION', nomAtri, '');
                       oper.addAtribute(nomAtri,valorAtri);
                       end;
                     oper.execute;
                     end;

             end;



   iniFile.Free;
   ListaAtributos.Free;


   if (UpperCase(loginOut) = 'TRUE')
      then Application.Terminate;


  // oper.InicioOperacion;
  // oper.setOperacion('TraerMonedasConta');
  // oper.execute;



  // Application.Terminate;

end;

procedure TFPampaSG0005.BCancelClick(Sender: TObject);
begin
  self.cerrar;
end;

//procedure TFPampaSG0005.registrarHostPort;
//begin
//   if cbDefault.Checked
//      then begin
//             if (reg = nil)
//                then reg          := TjktRegistry.Crear;
//             if EHost.text <> host
//                then reg.writeHost(EHost.text);
//             if EPort.text <> port
//                then reg.writePort(EPort.text);
//  // 17-02-2005
//             if EServlet.text <> servlet
//                then reg.writeServlet(EServlet.text);
//  // 17-02-2005
//             if EAplicacion.text <> aplicacion
//                then reg.writeAplicacion(EAplicacion.text);
//           end;
//   reg.free;
//end;

initialization
  puntoDecimal   := '.';
  separadorMiles :=',';
end.
