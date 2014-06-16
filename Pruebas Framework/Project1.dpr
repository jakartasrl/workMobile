program Project1;

uses
  Vcl.Forms,
  jktPrograma1 in 'jktPrograma1.pas' {Form2},
  jktFNSeg0001 in 'jktFNSeg0001.pas' {;

{$R *.res},
  jktNFMet0030 in 'jktNFMet0030.pas' {FAttributeEditor};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TFPampaSG0005, FPampaSG0005);
 // Application.CreateForm(TFAttributeEditor, FAttributeEditor);
  Application.Run;
end.
