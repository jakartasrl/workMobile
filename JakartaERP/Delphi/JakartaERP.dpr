program JakartaERP;

uses
  Vcl.Forms,
  jktFNMet0000 in '..\..\Common\Framework\Delphi XE2\jktFNMet0000.pas' {frmMainForm},
  jktFNMet0001 in '..\..\Common\Framework\Delphi XE2\jktFNMet0001.pas' {frmChild},
  jktCNMet0005 in '..\..\Common\Framework\Delphi XE2\jktCNMet0005.pas',
  jktFNMenuPrincipal in 'jktFNMenuPrincipal.pas' {frmMenuPrincipal},
  jktFrameListaProgramas in 'jktFrameListaProgramas.pas' {frameListaProgramas: TFrame},
  jktUtils in 'jktUtils.pas',
  jktCForms in 'jktCForms.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.ShowMainForm := False;
  Application.CreateForm(TfrmMainForm, frmMainForm);
  Application.CreateForm(TfrmMenuPrincipal, frmMenuPrincipal);
  frmMainForm.MenuPrincipal := frmMenuPrincipal;
  Application.Run;
end.
