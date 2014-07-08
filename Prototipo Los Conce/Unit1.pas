unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, Vcl.StdCtrls, cxButtons,
  jktFNProg0001, jktFNProg0002, jktFNProg0003, jktFNProg0004,
  cxControls, cxContainer, cxEdit,
  dxBevel, cxImage;

type
  TFormMenu = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxImage1: TcxImage;
    dxBevel1: TdxBevel;
    cxButton4: TcxButton;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  FormMenu: TFormMenu;

implementation

{$R *.dfm}

uses
  jktFNMet0000;

procedure TFormMenu.cxButton1Click(Sender: TObject);
begin
  frmRibbonMain.Show;
  FNProg0001 := TFNProg0001.Create(frmRibbonMain, frmRibbonMain.alActions);
  Self.Hide;
end;

procedure TFormMenu.cxButton2Click(Sender: TObject);
begin
  frmRibbonMain.Show;
  FNProg0002 := TFNProg0002.Create(frmRibbonMain, frmRibbonMain.alActions);
  Self.Hide;
end;

procedure TFormMenu.cxButton3Click(Sender: TObject);
begin
  frmRibbonMain.Show;
  FNProg0003 := TFNProg0003.Create(frmRibbonMain, frmRibbonMain.alActions);
  Self.Hide;
end;

procedure TFormMenu.cxButton4Click(Sender: TObject);
begin
  frmRibbonMain.Show;
  FNProg0004 := TFNProg0004.Create(frmRibbonMain, frmRibbonMain.alActions);
  Self.Hide;
end;

end.
