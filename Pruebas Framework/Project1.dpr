program Project1;

uses
  Vcl.Forms,
  jktFNMet0000 in '..\Common\Framework\Delphi XE2\jktFNMet0000.pas' {frmMainForm},
  jktFNMet0001 in '..\Common\Framework\Delphi XE2\jktFNMet0001.pas' {frmChild},
  jktFNUti0001 in '..\Common\Framework\Delphi XE2\jktFNUti0001.pas' {FNUti0001},
  jktPrueba in 'jktPrueba.pas' {Form1},
  jktPrueba2 in 'jktPrueba2.pas' {prueba3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.ShowMainForm := False;
  Application.CreateForm(TfrmMainForm, frmMainForm);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
