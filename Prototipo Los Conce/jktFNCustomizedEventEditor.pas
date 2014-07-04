unit jktFNCustomizedEventEditor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  cxSchedulerEventEditor, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Vcl.Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxControls, cxContainer, cxEdit, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxCheckBox, cxSpinEdit, cxCheckComboBox, cxMemo, cxDropDownEdit,
  cxTimeEdit, cxCalendar, cxMaskEdit, cxImageComboBox, cxTextEdit, cxLabel,
  cxGroupBox, dxBevel, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls;

type
  TEventEditorCustomized = class(TcxSchedulerEventEditorForm)
    lbDuracion: TcxLabel;
    cxSpinEdit1: TcxSpinEdit;
  private
    { Private declarations }
  protected
    procedure LoadEventValuesIntoControls; override;
    procedure UpdateEventValuesFromControls; override;
  public
    { Public declarations }
  end;

var
  EventEditorCustomized: TEventEditorCustomized;

implementation

{$R *.dfm}

uses
  cxSchedulerDialogs;

{ TEventEditorCustomized }

procedure TEventEditorCustomized.LoadEventValuesIntoControls;
const
  CLRF = #13#10;
  DlgMsg = 'Can''t load data';
begin
  // invoke the parent's method to load the data into the inherited editing controls located on the form
  inherited LoadEventValuesIntoControls;
  try
    // load the data into the custom editing controls
    // no checking for a null value is needed. The null value is automatically replaced with empty string in the editing controls
    teFirstName.EditValue := Event.GetCustomFieldValueByName('FName');
    teLastName.EditValue := Event.GetCustomFieldValueByName('LName');
    cbGender.EditValue := Event.GetCustomFieldValueByName('Gender');
  except
    on E: Exception do
      ShowMessage(DlgMsg + CLRF + E.Message);
  end;
end;

procedure TEventEditorCustomized.UpdateEventValuesFromControls;
const
  CLRF = #13#10;
  DlgMsg = 'Can''t load data';
begin
  // invoke the parent's method to post the data from the inherited editing controls located on the form
  inherited UpdateEventValuesFromControls;
  try
    // post the data from the custom editing controls
    Event.SetCustomFieldValueByName('FName', teFirstName.EditValue);
    Event.SetCustomFieldValueByName('LName', teLastName.EditValue);
    Event.SetCustomFieldValueByName('Gender', cbGender.EditValue);
    FModified := True;
  except
    on E: Exception do
      ShowMessage(DlgMsg + CLRF + E.Message);
  end;
end;

initialization
  // to use the cxEventEditorClass constant, specify the cxSchedulerDialogs unit in the uses clause
  // indicate that the new Event dialog will be invoked at runtime
  cxEventEditorClass := TEventEditorCustomized;

end.
