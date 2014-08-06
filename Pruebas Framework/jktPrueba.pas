unit jktPrueba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, jktCNMet0005;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
uses
  jktFNUti0001, jktFNMet0000, jktPrueba2;

{
  Los formularios hijos MDI (MDI Child) aparecen en pantalla en el mismo momento
  que se crean. Siempre son visibles. Lo que hay que hacer es no crearlo hasta
  que sea necesario.
  Nunca pueden ser invisibles, con lo cual si utilizamos los métodos Show
  o Hide provocará un error. Igual para la propiedad Visible.
}
procedure TForm1.Button1Click(Sender: TObject);
begin
  frmMainForm.Show;

  FNUti0001 := TFNUti0001.Create(frmMainForm);
  FNUti0001.InicializarChild(frmMainForm.alActions, 'usuario');

  Self.Hide;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  frmMainForm.Show;

  prueba3 := Tprueba3.Create(frmMainForm);
  prueba3.InicializarChild(frmMainForm.alActions);

  Self.Hide;
end;

initialization

  if Login = nil then begin
    Login := TjktLogin.New(0, 'Braceras Santiago', '', '');

    Login.addEmpresa(0, 'Empresa FAKE', 0, 0);

    // Seteo Datos del Login
    Login.setEmpresaActiva(0);

    Login.Host       := '10.2.1.113';
    Login.Port       := '8080';
    Login.Servlet    := '';
    Login.Aplicacion := 'frontend/api/processorDelphi/xml';
    Login.Protocolo  := 'http://';
  end;

end.
