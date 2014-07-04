program JakartaERP;

uses
  Vcl.Forms,
  jktMain in 'jktMain.pas' {frmMain},
  jktFrameListaProgramas in 'jktFrameListaProgramas.pas' {frameListaProgramas: TFrame},
  jktUtils in 'jktUtils.pas',
  jktFNMet0000 in '..\..\Common\Framework\Delphi XE2\jktFNMet0000.pas',
  jktFNMet0001 in '..\..\Common\Framework\Delphi XE2\jktFNMet0001.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
