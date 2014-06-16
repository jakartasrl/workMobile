unit FrameAnimationDemoMain;

{$I cxVer.inc}

interface

uses
{$IFDEF EXPRESSSKINS}
  {$I dxSkins.inc}
  dxSkinsForm,
{$ENDIF}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxCustomTileControl, cxClasses, dxTileControl, dxAnimation, cxGraphics, Menus,
  StdCtrls, cxGeometry, dxGDIPlusClasses, dxSkinsCore;

type
  TfmFrameAnimationMain = class(TForm)
    mmMain: TMainMenu;
    miFile: TMenuItem;
    miExit: TMenuItem;
    miOptions: TMenuItem;
    miHelp: TMenuItem;
    miScrollMode: TMenuItem;
    miCenterContent: TMenuItem;
    miCenterContentHorz: TMenuItem;
    miCenterContentVert: TMenuItem;
    pmItemAnimate: TPopupMenu;
    pmAnimationMode: TMenuItem;
    pmAnimateText: TMenuItem;
    pmAnimationInterval: TMenuItem;
    tcMain: TdxTileControl;
    dxTiledxTileControlGroup1: TdxTileControlGroup;
    dxTiledxTileControlGroup2: TdxTileControlGroup;
    tiHouses: TdxTileControlItem;
    tiInteriors: TdxTileControlItem;
    tiAgents: TdxTileControlItem;
    cxLookAndFeelController: TcxLookAndFeelController;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure miCenterContentClick(Sender: TObject);
    procedure miCenterContentHorzClick(Sender: TObject);
    procedure miCenterContentVertClick(Sender: TObject);
    procedure tcMainContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure pmAnimateTextClick(Sender: TObject);
    procedure pmItemAnimatePopup(Sender: TObject);
    procedure miExitClick(Sender: TObject);
  private
    SelectedItem: TdxTileControlItem;

    procedure AddLookAndFeelMenu;
    //
    procedure InitializeItemsAnimation;
    procedure PopulateAgents;
    procedure PopulateHousesAndInteriors;
    procedure PopulateItemsFrames;
    //
    procedure ChangeItemAnimationInterval(Sender: TObject);
    procedure ChangeItemAnimationMode(Sender: TObject);
    procedure ChangeScrollMode(Sender: TObject);
    procedure CheckCurrentAnimationInterval(Sender: TObject);
    procedure CheckCurrentAnimationMode(Sender: TObject);
    procedure CheckCurrentScrollMode(Sender: TObject);
    procedure DoShowAboutDemoForm(Sender: TObject);
    procedure Initialize_miHelp;
    procedure Initialize_miScrollMode;
    procedure Initialize_pmAnimationInterval;
    procedure Initialize_pmItemAnimate;
    function IsItemAnimationAvailable(AItem: TdxTileControlItem): Boolean;
    procedure SelectHelpUrl(Sender: TObject);
  public
    { public declaration }
  end;

var
  fmFrameAnimationMain: TfmFrameAnimationMain;

implementation

{$R *.dfm}

uses
  DemoUtils, ShellAPI, FrameAnimationDemoDM, AboutDemoForm;

const
  ItemAnimationInterval: array[0..5] of Integer = (0, 500, 1000, 1500, 2000, 3000);

procedure TfmFrameAnimationMain.FormCreate(Sender: TObject);
begin
  AddLookAndFeelMenu;
  Initialize_miScrollMode;
  Initialize_pmAnimationInterval;
  Initialize_pmItemAnimate;
  Initialize_miHelp;
end;

procedure TfmFrameAnimationMain.FormShow(Sender: TObject);
begin
  Caption := Application.Title;
  Application.Hint := Caption;
  PopulateItemsFrames;
end;

procedure TfmFrameAnimationMain.miCenterContentClick(Sender: TObject);
begin
  miCenterContentHorz.Checked := tcMain.OptionsView.CenterContentHorz;
  miCenterContentVert.Checked := tcMain.OptionsView.CenterContentVert;
end;

procedure TfmFrameAnimationMain.pmAnimateTextClick(Sender: TObject);
begin
  SelectedItem.OptionsAnimate.AnimateText := not SelectedItem.OptionsAnimate.AnimateText;
end;

procedure TfmFrameAnimationMain.pmItemAnimatePopup(Sender: TObject);
begin
  pmAnimationMode.Enabled := IsItemAnimationAvailable(SelectedItem);
  pmAnimateText.Enabled := pmAnimationMode.Enabled;
  pmAnimateText.Checked := pmAnimateText.Enabled and SelectedItem.OptionsAnimate.AnimateText;
end;

procedure TfmFrameAnimationMain.miCenterContentHorzClick(Sender: TObject);
begin
  tcMain.OptionsView.CenterContentHorz := not tcMain.OptionsView.CenterContentHorz;
end;

procedure TfmFrameAnimationMain.miCenterContentVertClick(Sender: TObject);
begin
  tcMain.OptionsView.CenterContentVert := not tcMain.OptionsView.CenterContentVert;
end;

procedure TfmFrameAnimationMain.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmFrameAnimationMain.tcMainContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  AItem: TdxTileControlItem;
begin
  tcMain.ActiveHitTest.Calculate(MousePos.X, MousePos.Y);
  MousePos := ClientToScreen(MousePos);
  AItem := tcMain.ActiveHitTest.Item;
  Handled := AItem <> nil;
  if Handled then
  begin
    SelectedItem := AItem;
    pmItemAnimate.Popup(MousePos.X, MousePos.Y)
  end
end;

//
procedure TfmFrameAnimationMain.AddLookAndFeelMenu;
begin
  mmMain.Items.Insert(mmMain.Items.IndexOf(miHelp), CreateLookAndFeelMenuItems(mmMain.Items));
end;

procedure TfmFrameAnimationMain.InitializeItemsAnimation;
var
  I : Integer;
  AModesCount: Integer;
begin
  Randomize;
  AModesCount := Integer(High(TdxDrawAnimationMode)) + 1;
  for I := 0 to tcMain.Items.Count - 1 do
  begin
    tcMain.Items[I].ActiveFrameIndex := 0;
    tcMain.Items[I].AnimationMode := TdxDrawAnimationMode(I mod AModesCount);
    tcMain.Items[I].AnimationInterval := ItemAnimationInterval[Random(High(ItemAnimationInterval) - 1) + 1];
    tcMain.Items[I].OptionsAnimate.AssignedValues := [];
    tcMain.Items[I].OptionsAnimate.AnimateText := not Odd(I);
  end;
end;

procedure TfmFrameAnimationMain.PopulateAgents;
var
  AFrame: TdxTileControlItemFrame;
  dsAgents: TDataSet;
begin
  dsAgents := DM.clHomesAndAgents;
  dsAgents.First;
  while not dsAgents.EOF do
  begin
    AFrame := tiAgents.Frames.Add;
    AFrame.Glyph.Image.LoadFromFieldValue(dsAgents.FieldByName('Photo').Value);
    AFrame.Glyph.Image.Scale(70, 100);
    AFrame.Glyph.Align := oaMiddleRight;
    AFrame.OptionsAnimate.AssignedValues := [];
    AFrame.Style.Font.Size := 13;
    AFrame.Text1.Value := dsAgents.FieldByName('FirstName').AsString + ' ' + dsAgents.FieldByName('LastName').AsString;
    AFrame.Text1.IndentHorz := 10;
    AFrame.Text1.IndentVert := 10;
    AFrame.Text2.Value := dsAgents.FieldByName('Phone').AsString;
    AFrame.Text2.Align := oaTopLeft;
    AFrame.Text2.IndentHorz := 10;
    AFrame.Text2.IndentVert := 30;
    dsAgents.Next;
  end;
  dsAgents.Close;
end;

procedure TfmFrameAnimationMain.PopulateHousesAndInteriors;
var
  AFrame: TdxTileControlItemFrame;
  AText2, AText3: string;
  AParentID: Integer;
  dsHomes, dsHomesInterior: TDataSet;
  AFormatSettings: TFormatSettings;

  procedure SetTexts(AItem: TdxTileControlCustomItem);
  begin
    AItem.Style.Font.Size := 13;
    AItem.Text2.Value := AText2;
    AItem.Text2.IndentHorz := 0;
    AItem.Text2.IndentVert := 0;
    AItem.Text2.Transparent := False;
    AItem.Text2.Color := dxTileItemLightColor;
    AItem.Text3.Value := AText3;
    AItem.Text3.IndentHorz := 0;
    AItem.Text3.IndentVert := 0;
    AItem.Text3.Transparent := False;
    AItem.Text3.Color := dxTileItemLightColor;
  end;

begin
  GetLocaleFormatSettings(LOCALE_SYSTEM_DEFAULT, AFormatSettings);
  dsHomes := DM.clHomesAndHomes;
  dsHomesInterior := DM.clHomePhotos;
  dsHomes.First;
  while not dsHomes.EOF do
  begin
    AFrame := tiHouses.Frames.Add;
    AFrame.Glyph.Mode := ifmFill;
    AFrame.Glyph.Image.LoadFromFieldValue(dsHomes.FieldByName('Photo').Value);
    AFrame.OptionsAnimate.AssignedValues := [];
    AParentID := dsHomes.FieldByName('ID').AsInteger mod 7 + 1;
    AText2 := ' ' + dsHomes.FieldByName('Beds').AsString + ' Beds' + #10 + ' ' + dsHomes.FieldByName('Baths').AsString + ' Baths ';
    AText3 := ' ' + FloatToStrF(dsHomes.FieldByName('Price').AsFloat, ffCurrency, 10, 0, AFormatSettings)+ ' ';
    SetTexts(AFrame);

    dsHomesInterior.Locate('ParentID', AParentID, []);
    while not dsHomesInterior.EOF and
      (dsHomesInterior.FieldByName('ParentID').AsInteger = AParentID) do
    begin
      AFrame := tiInteriors.Frames.Add;
      AFrame.Glyph.Mode := ifmFill;
      AFrame.Glyph.Image.LoadFromFieldValue(dsHomesInterior.FieldByName('Photo').Value);
      AFrame.OptionsAnimate.AssignedValues := [];
      SetTexts(AFrame);
      dsHomesInterior.Next;
    end;
    dsHomes.Next;
  end;
  dsHomes.Close;
  dsHomesInterior.Close;
end;

procedure TfmFrameAnimationMain.PopulateItemsFrames;
begin
  PopulateHousesAndInteriors;
  PopulateAgents;
  InitializeItemsAnimation;
end;

//
procedure TfmFrameAnimationMain.ChangeItemAnimationInterval(Sender: TObject);
begin
  if SelectedItem <> nil then
    SelectedItem.AnimationInterval := TMenuItem(Sender).Tag;
end;

procedure TfmFrameAnimationMain.ChangeItemAnimationMode(Sender: TObject);
begin
  if SelectedItem <> nil then
    SelectedItem.AnimationMode := TdxDrawAnimationMode(TMenuItem(Sender).Tag);
end;

procedure TfmFrameAnimationMain.ChangeScrollMode(Sender: TObject);
begin
  tcMain.OptionsBehavior.ScrollMode := TdxTileControlScrollMode(TMenuItem(Sender).Tag);
end;

procedure TfmFrameAnimationMain.CheckCurrentAnimationInterval(Sender: TObject);
var
  I: Integer;
  AMenuItem: TMenuItem;
begin
  for I := 0 to TMenuItem(Sender).Count - 1 do
  begin
    AMenuItem := TMenuItem(Sender).Items[I];
    AMenuItem.Checked := AMenuItem.Tag = SelectedItem.AnimationInterval;
  end;
end;

procedure TfmFrameAnimationMain.CheckCurrentAnimationMode(Sender: TObject);
var
  I: Integer;
  AMenuItem: TMenuItem;
begin
  for I := 0 to TMenuItem(Sender).Count - 1 do
  begin
    AMenuItem := TMenuItem(Sender).Items[I];
    AMenuItem.Checked := AMenuItem.Tag = Integer(SelectedItem.AnimationMode);
  end;
end;

procedure TfmFrameAnimationMain.CheckCurrentScrollMode(Sender: TObject);
var
  I: Integer;
  AMenuItem: TMenuItem;
begin
  for I := 0 to TMenuItem(Sender).Count - 1 do
  begin
    AMenuItem := TMenuItem(Sender).Items[I];
    AMenuItem.Checked := AMenuItem.Tag = Integer(tcMain.OptionsBehavior.ScrollMode);
  end;
end;

procedure TfmFrameAnimationMain.DoShowAboutDemoForm(Sender: TObject);
begin
  ShowAboutDemoForm;
end;

function AddMenuItem(AParent: TMenuItem; ACaption: string; ATag: Integer;
  ARadioItem: Boolean; AOnClick: TNotifyEvent): TMenuItem;
begin
  Result := TMenuItem.Create(AParent);
  Result.Caption := ACaption;
  Result.RadioItem := ARadioItem;
  Result.GroupIndex := 0;
  Result.Tag := ATag;
  AParent.Add(Result);
  Result.OnClick := AOnClick;
end;

procedure TfmFrameAnimationMain.Initialize_miHelp;
var
  APage: TdxWebPageType;
  AParentItem: TMenuItem;
begin
  AParentItem := miHelp;
  for APage := Low(TdxWebPageType) to High(TdxWebPageType) do
    AddMenuItem(AParentItem, WebPageHelpMenuCaptions[APage], Integer(APage),
      False, SelectHelpUrl);
  AddMenuItem(AParentItem, '-', 0, False, nil);
  AddMenuItem(AParentItem, 'About', 0, False, DoShowAboutDemoForm);
end;

procedure TfmFrameAnimationMain.Initialize_miScrollMode;
const
  AScrollModeStr: array[TdxTileControlScrollMode] of string = ('Default', 'Scrollbars', 'Scroll Buttons');
var
  AMode: TdxTileControlScrollMode;
  AParentItem: TMenuItem;
begin
  AParentItem := miScrollMode;
  for AMode := Low(TdxTileControlScrollMode) to High(TdxTileControlScrollMode) do
    AddMenuItem(AParentItem, AScrollModeStr[AMode], Integer(AMode), True, ChangeScrollMode);
  AParentItem.OnClick := CheckCurrentScrollMode;
end;

procedure TfmFrameAnimationMain.Initialize_pmAnimationInterval;
var
  I: Integer;
  AParentItem: TMenuItem;
begin
  AParentItem := pmAnimationInterval;
  for I := Low(ItemAnimationInterval) to High(ItemAnimationInterval) do
    AddMenuItem(AParentItem, IntToStr(ItemAnimationInterval[I]), ItemAnimationInterval[I],
      True, ChangeItemAnimationInterval);
  AParentItem.OnClick := CheckCurrentAnimationInterval;
end;

procedure TfmFrameAnimationMain.Initialize_pmItemAnimate;
const
  AAnimationModeStr: array[TdxDrawAnimationMode] of string =
    ('Scrolling right to left', 'Scrolling bottom to top', 'Scrolling left to right',
    'Scrolling top to bottom', 'Fade', 'Segmented fade', 'Random segmented fade');
var
  AMode: TdxDrawAnimationMode;
  AParentItem: TMenuItem;
begin
  AParentItem := pmAnimationMode;
  for AMode := Low(TdxDrawAnimationMode) to High(TdxDrawAnimationMode) do
    AddMenuItem(AParentItem, AAnimationModeStr[AMode], Integer(AMode),
      True, ChangeItemAnimationMode);
  AParentItem.OnClick := CheckCurrentAnimationMode;
end;

function TfmFrameAnimationMain.IsItemAnimationAvailable(AItem: TdxTileControlItem): Boolean;
begin
  Result := (AItem.AnimationInterval > 0) and (AItem.Frames.Count > 1);
end;

procedure TfmFrameAnimationMain.SelectHelpUrl(Sender: TObject);
var
  AUrl: string;
begin
  AUrl := DXMainWebPage + WebPageRelativeUrlByType[TdxWebPageType(TMenuItem(Sender).Tag)];
  ShellExecute(0, 'OPEN', PChar(AUrl), nil, nil, SW_SHOW);
end;

end.
