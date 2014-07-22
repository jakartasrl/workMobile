program Project1;

uses
  Vcl.Forms,
  jktCMet003 in 'jktCMet003.pas',
  jktCMet005 in 'jktCMet005.pas',
  jktCMet002 in 'jktCMet002.pas',
  jktFPampaSG0005 in 'jktFPampaSG0005.pas' {FPampaSG0005},
  jktCMet001 in 'jktCMet001.pas',
  FUnit1 in 'FUnit1.pas' {FormGrilla1},
  FUnit2 in 'FUnit2.pas' {Form1},
  jktCMet008 in 'jktCMet008.pas',
  dxDBGridTypes in 'dxDBGridTypes.pas',
  santi02 in 'santi02.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFPampaSG0005, FPampaSG0005);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TFormGrilla1, FormGrilla1);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
