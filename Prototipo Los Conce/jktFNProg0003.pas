unit jktFNProg0003;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, jktFNMet0001, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinsdxBarPainter, jktCNMet0030, jktCNMet0002,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  jktCNMet0001, dxBar, cxClasses, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxLabel, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxGroupBox, Vcl.Menus, cxStyles, cxScheduler,
  cxSchedulerStorage, cxSchedulerCustomControls, cxSchedulerCustomResourceView,
  cxSchedulerDayView, cxSchedulerDateNavigator, cxSchedulerHolidays,
  cxSchedulerTimeGridView, cxSchedulerUtils, cxSchedulerWeekView,
  cxSchedulerYearView, cxSchedulerGanttView, cxSchedulerTreeListBrowser,
  dxSkinscxSchedulerPainter, dxSkinscxPCPainter, cxPCdxBarPopupMenu, cxCheckBox,
  Vcl.StdCtrls, cxButtons, cxPC, cxButtonEdit;

type
  TFNProg0003 = class(TfrmChild)
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    Scheduler: TcxScheduler;
    cxPageControl1: TcxPageControl;
    tbsGantt: TcxTabSheet;
    btnGanttExpandAll: TcxButton;
    btnGanttCollapseAll: TcxButton;
    cbxEventsStyle: TcxComboBox;
    cxLabel5: TcxLabel;
    cbxExpandButton: TcxCheckBox;
    cbxProgress: TcxCheckBox;
    cbxSnapGanttEvents: TcxCheckBox;
    cbxTreeBrowser: TcxCheckBox;
    cxTabSheet1: TcxTabSheet;
    cxGroupBox2: TcxGroupBox;
    cxComboBox2: TcxComboBox;
    cxLabel2: TcxLabel;
    Storage: TcxSchedulerStorage;
    cxButtonEdit1: TcxButtonEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNProg0003: TFNProg0003;

implementation

{$R *.dfm}

procedure TFNProg0003.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
const
  DlgMsg = 'No se encontró la agenda para esa orden...';
  FileName = 'AgendaTaller.dat';
begin
  inherited;

  if FileExists(FileName) and (TcxButtonEdit(Sender).Text = '1804') then
    // load the data from the file
    Storage.LoadFromFile(FileName)
  else
    ShowMessage(DlgMsg);
end;

procedure TFNProg0003.FormClose(Sender: TObject; var Action: TCloseAction);
const
  FileName = 'AgendaTaller.dat';
begin
  inherited;

  // save the data to the file when the application exits
  Storage.SaveToFile(FileName);
end;

end.
