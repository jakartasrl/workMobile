program RibbonNotepadDemo;

uses
  Forms,
  dxDemoUtils in '..\dxDemoUtils.pas',
  RibbonNotepadMainForm in 'RibbonNotepadMainForm.pas' {frmRibbonNotepadMain},
  dxAboutDemo in '..\dxAboutDemo.pas',
  NotepadChildForm in '..\NotepadChildForm.pas' {frmNotepadChild},
  NotepadMainForm in '..\NotepadMainForm.pas' {frmNotepadMain},
  RibbonNotepadDemoGallerySetup in 'RibbonNotepadDemoGallerySetup.pas',
  RibbonNotepadDemoOptions in 'RibbonNotepadDemoOptions.pas' {RibbonDemoOptionsForm},
  RibbonNotepadChildForm in 'RibbonNotepadChildForm.pas' {frmRibbonNotepadChild};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmRibbonNotepadMain, frmRibbonNotepadMain);
  Application.CreateForm(TColorDialogSetupForm, ColorDialogSetupForm);
  Application.Run;
end.
