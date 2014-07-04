unit jktFNProg0002;

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
  cxLookAndFeelPainters, Vcl.Menus, cxStyles, cxEdit, cxScheduler,
  cxSchedulerStorage, cxSchedulerCustomControls, cxSchedulerCustomResourceView,
  cxSchedulerDayView, cxSchedulerDateNavigator, cxSchedulerHolidays,
  cxSchedulerTimeGridView, cxSchedulerUtils, cxSchedulerWeekView,
  cxSchedulerYearView, cxSchedulerGanttView, cxSchedulerTreeListBrowser,
  dxSkinscxSchedulerPainter, cxContainer, cxLabel, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxGroupBox;

type
  TFNProg0002 = class(TfrmChild)
    cxScheduler1: TcxScheduler;
    Storage: TcxSchedulerStorage;
    cxGroupBox1: TcxGroupBox;
    cxComboBox1: TcxComboBox;
    cxLabel1: TcxLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNProg0002: TFNProg0002;

implementation

{$R *.dfm}

procedure TFNProg0002.FormClose(Sender: TObject; var Action: TCloseAction);
const
  FileName = 'AgendaSectores.dat';
begin
  inherited;

  // save the data to the file when the application exits
  Storage.SaveToFile(FileName);
end;

procedure TFNProg0002.FormShow(Sender: TObject);
const
  DlgMsg = 'There was no file found';
  FileName = 'AgendaSectores.dat';
begin
  inherited;

  if FileExists(FileName) then
    // load the data from the file when the application starts up
    Storage.LoadFromFile(FileName)
   else
     ShowMessage(DlgMsg);
end;

end.
