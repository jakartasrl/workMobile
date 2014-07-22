unit jktFPampaSG0008;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, jktCMet002, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, StdCtrls, Db, kbmMemTable;

type
  TFPampaSG0008 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    ELogin: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    IdHTTP1: TIdHTTP;
    oper: TjktOperacion;
    MPassword: TMaskEdit;
    MNuevoPassword: TMaskEdit;
    MConfirmaPassword: TMaskEdit;
    mtRespuesta: TkbmMemTable;
    mtRespuestaoid_usu: TIntegerField;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure operNuevoDataSet(Sender: TObject; aDatasetName: String);
  private
    { Private declarations }
    fNoLimpiarLoginNiPassword : boolean;
    autologin: string;
    fAceptar : boolean;
    procedure ValidarCampos();
  public
    { Public declarations }
    property NoLimpiarLoginNiPassword : boolean read fNoLimpiarLoginNiPassword write fNoLimpiarLoginNiPassword;
    property Aceptar : boolean read fAceptar write fAceptar;
    procedure setHost(host : string);
    procedure setPort(port : string);
    procedure setServlet(servlet : string);
    procedure setAplicacion(aplicacion : string);
    procedure setProtocolo(protocolo : string);
    procedure setHTTPOptions(aHTTPOptions : TidHTTPOptions);
    procedure setAutoLogin(aAutologin : boolean);
    procedure setLogin(LoginName : string);
    procedure setPassword(Password : string);
  end;

var
  FPampaSG0008: TFPampaSG0008;

implementation

{$R *.DFM}

uses jktCMet005;

procedure TFPampaSG0008.Button2Click(Sender: TObject);
begin
  close;

  fAceptar := False;
end;

procedure TFPampaSG0008.FormShow(Sender: TObject);
begin
  fAceptar := False;
  if (not fNoLimpiarLoginNiPassword)
     then begin
          ELogin.Text := '';
          MPassword.Text := '';
          fNoLimpiarLoginNiPassword := False;
          end;
  MNuevoPassword.Text := '';
  MConfirmaPassword.Text := '';
end;

procedure TFPampaSG0008.setHost(host : string);
begin
  oper.Host       := host;
end;

procedure TFPampaSG0008.setPort(port : string);
begin
  oper.Port       := port;
end;

procedure TFPampaSG0008.setServlet(servlet : string);
begin
  oper.Servlet    := servlet;
end;

procedure TFPampaSG0008.setAplicacion(aplicacion : string);
begin
  oper.Aplicacion := aplicacion;
end;

procedure TFPampaSG0008.setProtocolo(protocolo : string);
begin
  oper.Protocolo  := protocolo;
end;

procedure TFPampaSG0008.setHTTPOptions(aHTTPOptions : TidHTTPOptions);
begin
  oper.HTTP.HTTPOptions := aHTTPOptions;
end;

procedure TFPampaSG0008.setAutoLogin (aAutoLogin : boolean);
begin
  if (aAutoLogin)
     then autologin := 'S'
     else autologin := 'N';
end;

procedure TFPampaSG0008.ValidarCampos();
begin
  if trim(ELogin.Text)=''
     then raise Exception.Create('Debe ingresar el Login');
  if trim(MPassword.Text)=''
     then raise Exception.Create('Debe ingresar el Password');
  if trim(MNuevoPassword.Text)=''
     then raise Exception.Create('Debe ingresar el Nuevo Password');
  if trim(MConfirmaPassword.Text)=''
     then raise Exception.Create('Debe ingresar el Nuevo Password');

end;

procedure TFPampaSG0008.Button1Click(Sender: TObject);
begin

  mtRespuesta.Close;
  mtRespuesta.Open;

  if (trim(ELogin.Text)='')
     then raise Exception.Create('Debe ingresar un Login');

  if (trim(MPassword.Text)='')
     then raise Exception.Create('Debe ingresar un Password');

  if (MNuevoPassword.text <> MConfirmaPassword.text)
     then raise Exception.Create('El nuevo password no coinice con su confirmación');

  oper.InicioOperacion;
  oper.setOperacion('CambiarPassword');
  oper.addAtribute('iniciales',   ELogin.Text);
      oper.addAtribute('password',    MPassword.Text);
  oper.addAtribute('newPassword', MNuevoPassword.Text);
  oper.addAtribute('autologin',   autologin);
  oper.execute;

  if not mtRespuesta.IsEmpty
     then  begin
           MessageDlg('Cambio de Password Exitoso.', mtInformation,[mbOk], 0);
           Close;
           end;

  fAceptar := True;

end;

procedure TFPampaSG0008.operNuevoDataSet(Sender: TObject;
  aDatasetName: String);
begin
  if (aDatasetName='CambioPassword')
      then Oper.Dataset := mtRespuesta;
end;

procedure TFPampaSG0008.setLogin(LoginName : string);
begin
  ELogin.Text := LoginName;
end;

procedure TFPampaSG0008.setPassword(Password : string);
begin
  MPassword.Text := Password;
end;

end.
