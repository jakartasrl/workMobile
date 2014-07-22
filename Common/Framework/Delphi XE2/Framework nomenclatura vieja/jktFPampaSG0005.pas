unit jktFPampaSG0005;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, jktCMet002, Db, kbmMemTable, IdAntiFreezeBase,
  IdAntiFreeze, jktFPampaSG0008, IdIOHandler, IdIOHandlerSocket,
  kbmMemCSVStreamFormat;

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
    TUsu: TkbmMemTable;
    TUsuoid_usu: TIntegerField;
    TUsuApeNom: TStringField;
    TEmpre: TkbmMemTable;
    TEmpreoid_emp: TIntegerField;
    TEmpredescEmpresa: TStringField;
    TUsuiniciales: TStringField;
    TEmprecodEmpresa: TStringField;
    TUsusesionID: TStringField;
    EAplicacion: TEdit;
    Label7: TLabel;
    TUsudecimalSeparator: TStringField;
    TEmpreis_default: TBooleanField;
    Button1: TButton;
    TEmpreoid_per_dat: TIntegerField;
    TEmpreoid_per_fun: TIntegerField;
    TOper: TkbmMemTable;
    csv1: TkbmCSVStreamFormat;
    TOperoper: TStringField;
    TOperdataset: TStringField;
    TOperfile: TStringField;
    EServlet: TEdit;
    TUsucertificado: TStringField;
    TEmprecolor: TStringField;
    mtSucursalLogin: TkbmMemTable;
    mtSucursalLoginoid_Suc: TIntegerField;
    mtSucursalLogindesc_suc: TStringField;
    Oper: TjktOperacion;
    procedure FormShow(Sender: TObject);
    procedure EIdentKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BOKClick(Sender: TObject);
    procedure operNuevoDataSet(Sender: TObject; aDatasetName: String);
    procedure FormCreate(Sender: TObject);
    procedure BCancelClick(Sender: TObject);

  private
    { Private declarations }
    FPampaSG0008 : TFPampaSG0008;
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
  jktCMet005, jktMisc01, FUnit1, FUnit2, santi02;

procedure TFPampaSG0005.FormShow(Sender: TObject);
begin
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
begin
  if (not Self.AutoLogin)
     then begin
            if trim(EIdent.Text) = ''
               then raise Exception.Create('Debe Ingresar la Identificacion');

            if trim(EPasswd.Text) = ''
               then raise Exception.Create('Debe Ingresar la Password');
          end;

  if TUsu.Active
     then TUsu.close;
  TUsu.open;

  if TEmpre.Active
     then TEmpre.close;
  TEmpre.open;

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

  Mensaje := '';
  if (Trim(oper.Mensaje)<>'')
     then begin
          Mensaje := oper.Mensaje;
          if (IgnoreExceptionLogin = false)
              then raise Exception.Create(Mensaje);
          end
     else seConecto := True;

  crearLogin;
  Form2.showModal();

  cerrar;
end;

procedure TFPampaSG0005.operNuevoDataSet(Sender: TObject;
  aDatasetName: String);
begin
   if aDatasetName = 'Usuario'
      then oper.Dataset := TUsu;

   if aDatasetName = 'Empresa'
      then oper.Dataset := TEmpre;

   if aDatasetName = 'mtSucursalLogin'
      then oper.Dataset := mtSucursalLogin ;
end;

procedure TFPampaSG0005.crearLogin;
var
  OidEmpresaActiva : integer;
begin

  OidEmpresaActiva := 0;

  FOK := true;
  TUsu.First;
  Login := TjktLogin.New(TUsu.fieldByName('oid_usu').AsInteger,
                         TUsu.fieldByName('ApeNom').AsString,
                         TUsu.fieldByName('sesionID').asString,
                         TUsucertificado.AsString);

  Login.OidSucursal := mtSucursalLogin.fieldByName('oid_suc').AsInteger;




  TEmpre.First;
  while not TEmpre.Eof do
    begin
       Login.addEmpresa( TEmpre.fieldByName('oid_emp').AsInteger,
                         TEmpre.FieldByName('descEmpresa').asString,
                         0,
                         0);

       if TEmpre.fieldByName('is_default').AsBoolean
          then begin
                 OidEmpresaActiva := TEmpre.fieldByName('oid_emp').AsInteger;
                 if TEmpre.fieldByName('color').asString <> ''
                      then FPrimerColor      := TEmpre.fieldByName('color').AsInteger
                      else FPrimerColor      := clBtnFace;
                end;

       TEmpre.Next;
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

  FormatSettings.DecimalSeparator  := puntoDecimal;
  FormatSettings.ThousandSeparator := separadorMiles;
end;

procedure TFPampaSG0005.cerrar;
begin
   self.close;
end;

procedure TFPampaSG0005.FormCreate(Sender: TObject);
var
  usuario : string;
  password : string;
  initialOperation : string;
  loginOut : string;
begin
   usuario := '';
   password := '';
   self.Caption := captionLogin;
   FAutoLogin := False;
   initialOperation := '';
   loginOut := '';

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
      else EAplicacion.Text := oper.aplicacion;

 

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

initialization
  puntoDecimal   := '.';
  separadorMiles :=',';
end.
