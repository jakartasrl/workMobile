program JakartaERP;

uses
  Vcl.Forms,
  jktFNMenuPrincipal in 'jktFNMenuPrincipal.pas' {frmMenuPrincipal},
  jktFrameListaProgramas in 'jktFrameListaProgramas.pas' {frameListaProgramas: TFrame},
  jktUtils in 'jktUtils.pas',
  jktFNMet0000 in '..\..\Common\Framework\Delphi XE2\jktFNMet0000.pas' {frmMainForm},
  jktFNMet0001 in '..\..\Common\Framework\Delphi XE2\jktFNMet0001.pas' {frmChild},
  jktCNMet0005 in '..\..\Common\Framework\Delphi XE2\jktCNMet0005.pas',
  jktFNSeg0001 in 'jktFNSeg0001.pas' {FNSeg0001},
  jktFNSeg0002 in 'jktFNSeg0002.pas' {FNSeg0002},
  jktFNImp0001 in 'jktFNImp0001.pas' {FNImp0001},
  jktFNVar0001 in 'jktFNVar0001.pas' {FNVar0001},
  jktFNCla0001 in 'jktFNCla0001.pas' {FNCla0001},
  jktFNCla0002 in 'jktFNCla0002.pas' {FNCla0002};

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
