program JakartaERP;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {FormMenu},
  jktFNMet0000 in '..\Common\Framework\Delphi XE2\jktFNMet0000.pas' {frmRibbonMain},
  jktFNMet0001 in '..\Common\Framework\Delphi XE2\jktFNMet0001.pas' {frmChild},
  jktFNProg0001 in 'jktFNProg0001.pas' {FNProg0001},
  jktFNProg0002 in 'jktFNProg0002.pas' {FNProg0002},
  cxSchedulerEventEditor in 'C:\Program Files\Developer Express.VCL\ExpressScheduler\Sources\cxSchedulerEventEditor.pas' {cxSchedulerEventEditorForm},
  jktFNCustomizedEventEditor in 'jktFNCustomizedEventEditor.pas' {EventEditorCustomized};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.ShowMainForm := False;
  Application.CreateForm(TfrmRibbonMain, frmRibbonMain);
  Application.CreateForm(TFormMenu, FormMenu);
  Application.CreateForm(TEventEditorCustomized, EventEditorCustomized);
  Application.Run;
end.
