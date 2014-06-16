unit RealtorWorldHomePhotosBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, DB, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxClasses, dxCustomTileControl, dxTileControl, RealtorWorldBaseFrame,
  cxSplitter, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
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
  dxSkinXmas2008Blue;

type
  TfrmHomePhotosBase = class(TfrmBase)
    tcHomePhotos: TdxTileControl;
    tcHomePhotosdxTileControlGroup1: TdxTileControlGroup;
    cxSplitter1: TcxSplitter;
    procedure cxSplitter1BeforeClose(Sender: TObject; var AllowClose: Boolean);
  private
    { Private declarations }
  protected
    procedure OnItemClick(Sender: TdxTileControlItem); virtual;
  public
    constructor Create(AOwner: TComponent); override;
    procedure InitializeFrame; virtual;
    procedure SelectItem(APhotoID, AAgentID: Integer); override;
  end;

implementation

uses
  RealtorWorldDM;

{$R *.dfm}

{ TfrmHomePhotosBase }

constructor TfrmHomePhotosBase.Create(AOwner: TComponent);
begin
  inherited;
  InitializeFrame;
end;

procedure TfrmHomePhotosBase.cxSplitter1BeforeClose(Sender: TObject;
  var AllowClose: Boolean);
begin
  AllowClose := False;
end;

procedure TfrmHomePhotosBase.InitializeFrame;
var
  dsHomes: TDataSet;
  AItem: TdxTileControlItem;
  AFmtSettings: TFormatSettings;
begin
  GetLocaleFormatSettings(LOCALE_SYSTEM_DEFAULT, AFmtSettings);
  tcHomePhotos.BeginUpdate;
  try
    dsHomes := DMRealtorWorld.clHomesAndHomes;
    dsHomes.First;
    while not dsHomes.EOF do
    begin
      AItem := tcHomePhotos.CreateItem(True);
      AItem.Glyph.Image.LoadFromFieldValue(dsHomes.FieldByName('Photo').Value);
      AItem.Glyph.Mode := ifmStretch;
      AItem.Text2.Value := ' ' + dsHomes.FieldByName('Beds').AsString + ' Beds' + #10 + ' ' + dsHomes.FieldByName('Baths').AsString + ' Baths ';
      AItem.Text2.IndentHorz := 0;
      AItem.Text2.Font.Size := 13;
      AItem.Text2.IndentVert := 0;
      AItem.Text2.Transparent := False;
      AItem.Text3.Value := ' ' + FloatToStrF(dsHomes.FieldByName('Price').AsFloat, ffCurrency, 10, 0, AFmtSettings) + ' ';
      AItem.Text3.IndentHorz := 0;
      AItem.Text3.IndentVert := 0;
      AItem.Text3.Font.Size := 13;
      AItem.Text3.Transparent := False;
      AItem.Tag := dsHomes.FieldByName('ID').AsInteger;
      AItem.OnClick := OnItemClick;
      dsHomes.Next;
    end;
  finally
    tcHomePhotos.EndUpdate;
  end;
end;

procedure TfrmHomePhotosBase.OnItemClick(Sender: TdxTileControlItem);
begin
end;

procedure TfrmHomePhotosBase.SelectItem(APhotoID, AAgentID: Integer);
var
  I: Integer;
begin
  for I := 0 to tcHomePhotos.Items.Count - 1 do
    if tcHomePhotos.Items[I].Tag = APhotoID then
    begin
      tcHomePhotos.Items[I].MakeVisible;
      tcHomePhotos.Items[I].Click;
      Break;
    end;
end;

end.
