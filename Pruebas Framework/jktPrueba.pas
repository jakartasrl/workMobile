unit jktPrueba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, jktCNMet0005, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxButtons;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    cxButton1: TcxButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
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
  jktFNUti0001, jktFNMet0000, jktPrueba2, jktPrueba3;

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

  FPrueba2 := TFPrueba2.Create(frmMainForm);
  FPrueba2.InicializarChild(frmMainForm.alActions);

  Self.Hide;
end;

procedure TForm1.cxButton1Click(Sender: TObject);
begin
  frmMainForm.Show;

  FPrueba3 := TFPrueba3.Create(frmMainForm);
  FPrueba3.InicializarChild(frmMainForm.alActions);

  Self.Hide;
end;

initialization

  if Login = nil then begin
    Login := TjktLogin.New(0, 'Braceras Santiago', '', '');

    Login.addEmpresa(0, 'Empresa FAKE', 0, 0);

    // Seteo Datos del Login
    Login.setEmpresaActiva(0);

    Login.Host       := '10.2.1.113';
    Login.Port       := '8090';
    Login.Servlet    := '';
    Login.Aplicacion := 'frontend/api/processorDelphi/xml';
    Login.Protocolo  := 'http://';
  end;

end.
