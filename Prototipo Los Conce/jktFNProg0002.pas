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
    Scheduler: TcxScheduler;
    Storage: TcxSchedulerStorage;
    cxGroupBox1: TcxGroupBox;
    cxComboBox1: TcxComboBox;
    cxLabel1: TcxLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxComboBox1PropertiesChange(Sender: TObject);
    procedure SchedulerEventPopupMenuPopup(Sender: TcxSchedulerEventPopupMenu;
      ABuiltInMenu: TPopupMenu; var AHandled: Boolean);
  private
    procedure MarcarComoCompletadaClick(Sender: TObject);

  public
    { Public declarations }
  end;

var
  FNProg0002: TFNProg0002;

implementation

{$R *.dfm}

var
  ASelectedEvent: TcxSchedulerEvent;

procedure TFNProg0002.cxComboBox1PropertiesChange(Sender: TObject);
var
  i: Integer;
begin
  inherited;

  for i := 0 to Storage.ResourceCount - 1 do
    Storage.Resources.ResourceItems[i].Visible :=
      Storage.Resources.ResourceItems[i].ResourceID = TcxComboBox(Sender).ItemIndex;
end;

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

procedure TFNProg0002.MarcarComoCompletadaClick(Sender: TObject);
begin
  if not (Sender is TMenuItem) then Exit;

  ASelectedEvent.TaskComplete := 100;
end;

procedure TFNProg0002.SchedulerEventPopupMenuPopup(
  Sender: TcxSchedulerEventPopupMenu; ABuiltInMenu: TPopupMenu;
  var AHandled: Boolean);
var
  AItem: TMenuItem;
begin
  inherited;

  // Guardo el evento que ha sido clickeado
  ASelectedEvent := Sender.Event.Source;

  // Creo un nuevo Item de Menu
  AItem := TMenuItem.Create(ABuiltInMenu);
  AItem.Caption := 'Marcar como ''Completada''';
  AItem.OnClick := MarcarComoCompletadaClick;
  // AItem.Tag := clRed;

  // Agrego el nuevo item al popup menu
  ABuiltInMenu.Items.Add(AItem);
end;

end.
