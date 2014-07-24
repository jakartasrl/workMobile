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
  jktFNSeg0002 in 'jktFNSeg0002.pas' {FNSeg0002};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.ShowMainForm := False;
  Application.CreateForm(TfrmMainForm, frmMainForm);
  Application.CreateForm(TfrmMenuPrincipal, frmMenuPrincipal);
  Application.Run;
end.
