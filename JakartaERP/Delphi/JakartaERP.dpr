program JakartaERP;

uses
  Vcl.Forms,
  jktMain in 'jktMain.pas' {frmMain},
  jktFrameListaProgramas in 'jktFrameListaProgramas.pas' {frameListaProgramas: TFrame},
  jktUtils in 'jktUtils.pas',
  jktMainRibbon in 'jktMainRibbon.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
