unit jktPrueba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

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

procedure TForm1.Button1Click(Sender: TObject);
begin
  frmRibbonMain.Show;
  Application.CreateForm(TFNUti0001, FNUti0001);
  FNUti0001.ParametroInicial := 'EMPRE';
  FNUti0001.ParentActionList := frmRibbonMain.alActions;
  FNUti0001.llamarOperacionConfiguracion;
  self.Hide;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  frmRibbonMain.Show;
  Application.CreateForm(Tprueba3, prueba3);
  prueba3.ParentActionList := frmRibbonMain.alActions;
  self.Hide;
end;

end.
