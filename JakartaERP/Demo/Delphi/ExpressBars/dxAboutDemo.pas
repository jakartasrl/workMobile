unit dxAboutDemo;

{$I cxVer.inc}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, dxGDIPlusClasses, cxGraphics, cxClasses;

const
  dxURLCommon = 'http://go.devexpress.com/DevExpress_AboutWin_%s.aspx';

  dxURLDownloadTrial = 'http://go.devexpress.com/DevExpressDownload_VCLTrial.aspx';
  dxURLLearnMore = 'http://www.devexpress.com/Products/VCL/';
  dxURLSubscribe = 'http://www.devexpress.com/Subscriptions/VCL/info.xml';

type

  { TdxImageButton }

  TdxImageButton = class(TGraphicControl)
  private
    FImageCollection: TcxImageCollection;
    FImageIndexHot: Integer;
    FImageIndexNormal: Integer;
    FMouseInControl: Boolean;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure SetImageCollection(const Value: TcxImageCollection);
    procedure SetImageIndexNormal(const Value: Integer);
    procedure SetMouseInControl(const Value: Boolean);
  protected
    procedure AdjustSize; override;
    procedure Notification(AComponent: TComponent; AOperation: TOperation); override;
    procedure Paint; override;
    //
    property MouseInControl: Boolean read FMouseInControl write SetMouseInControl;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Initialize(AImageCollection: TcxImageCollection; AImageIndexNormal, AImageIndexHot: Integer);
    //
    property ImageCollection: TcxImageCollection read FImageCollection write SetImageCollection;
    property ImageIndexHot: Integer read FImageIndexHot write FImageIndexHot;
    property ImageIndexNormal: Integer read FImageIndexNormal write SetImageIndexNormal;
    property OnClick;
  end;

  { TdxAboutDemoForm }

  TdxAboutDemoForm = class(TForm)
    icImages: TcxImageCollection;
    icImagesItem1: TcxImageCollectionItem;
    icImagesItem2: TcxImageCollectionItem;
    icImagesItem3: TcxImageCollectionItem;
    icImagesItem4: TcxImageCollectionItem;
    icImagesItem5: TcxImageCollectionItem;
    icImagesItem6: TcxImageCollectionItem;
    icImagesItem7: TcxImageCollectionItem;
    icImagesItem8: TcxImageCollectionItem;
    imBackground: TImage;
    lbVersion: TLabel;
    pbChat: TPaintBox;
    pbHolderSubscribe: TPaintBox;
    pbHolderClose: TPaintBox;
    pbHolderDownloadTrial: TPaintBox;
    pbHolderLearnMore: TPaintBox;
    pbSupport: TPaintBox;
    procedure pbChatClick(Sender: TObject);
    procedure pbSupportClick(Sender: TObject);
  private
    procedure CloseClickHandler(Sender: TObject);
    procedure DownloadTrialClickHandler(Sender: TObject);
    procedure LearnMoreClickHandler(Sender: TObject);
    procedure SubscribeClickHandler(Sender: TObject);
  protected
    procedure CreateImageButton(AHolder: TControl; ABaseImageIndex: Integer; AEvent: TNotifyEvent);
    procedure CreateParams(var Params: TCreateParams); override;
    procedure Browse(const URL: string);
    // Messages
    procedure WMNCHitTest(var Message: TWMNCHitTest); message WM_NCHITTEST;
  public
    constructor Create(AOwner: TComponent); override;
  end;

procedure dxShowAboutForm;
implementation

uses
  dxCore, ShellAPI;

{$R *.dfm}

procedure dxShowAboutForm;
begin
  with TdxAboutDemoForm.Create(nil) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

{ TdxImageButton }

constructor TdxImageButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FImageIndexHot := -1;
  FImageIndexNormal := -1;
  Cursor := crHandPoint;
end;

destructor TdxImageButton.Destroy;
begin
  ImageCollection := nil;
  inherited Destroy;
end;

procedure TdxImageButton.AdjustSize;
begin
  if (ImageCollection <> nil) and (ImageIndexNormal >= 0) then
  begin
    SetBounds(Left, Top,
      ImageCollection.Items[ImageIndexNormal].Width,
      ImageCollection.Items[ImageIndexNormal].Height);
  end;
end;

procedure TdxImageButton.Initialize(AImageCollection: TcxImageCollection;
  AImageIndexNormal: Integer; AImageIndexHot: Integer);
begin
  ImageCollection := AImageCollection;
  ImageIndexHot := AImageIndexHot;
  ImageIndexNormal := AImageIndexNormal;
end;

procedure TdxImageButton.Notification(AComponent: TComponent; AOperation: TOperation);
begin
  inherited Notification(AComponent, AOperation);
  if AOperation = opRemove then
  begin
    if AComponent = ImageCollection then
      ImageCollection := nil;
  end;
end;

procedure TdxImageButton.Paint;
var
  AImageIndex: Integer;
begin
  if ImageCollection <> nil then
  begin
    if MouseInControl and (ImageIndexHot >= 0) then
      AImageIndex := ImageIndexHot
    else
      AImageIndex := ImageIndexNormal;

    if (AImageIndex >= 0) and (AImageIndex < ImageCollection.Count) then
      ImageCollection.Items[AImageIndex].Draw(Canvas, ClientRect);
  end;
end;

procedure TdxImageButton.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  MouseInControl := True;
end;

procedure TdxImageButton.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  MouseInControl := False;
end;

procedure TdxImageButton.SetImageCollection(const Value: TcxImageCollection);
begin
  if Value <> FImageCollection then
  begin
    if FImageCollection <> nil then
    begin
      FImageCollection.RemoveFreeNotification(Self);
      FImageCollection := nil;
    end;
    if Value <> nil then
    begin
      FImageCollection := Value;
      FImageCollection.FreeNotification(Self);
    end;
    AdjustSize;
  end;
end;

procedure TdxImageButton.SetImageIndexNormal(const Value: Integer);
begin
  if FImageIndexNormal <> Value then
  begin
    FImageIndexNormal := Value;
    AdjustSize;
  end;
end;

procedure TdxImageButton.SetMouseInControl(const Value: Boolean);
begin
  if Value <> FMouseInControl then
  begin
    FMouseInControl := Value;
    Invalidate;
  end;
end;

{ TdxAboutDemoForm }

constructor TdxAboutDemoForm.Create(AOwner: TComponent);
var
  ARect: TRect;
begin
  inherited Create(AOwner);
  CreateImageButton(pbHolderLearnMore, 0, LearnMoreClickHandler);
  CreateImageButton(pbHolderDownloadTrial, 2, DownloadTrialClickHandler);
  CreateImageButton(pbHolderSubscribe, 4, SubscribeClickHandler);
  CreateImageButton(pbHolderClose, 6, CloseClickHandler);

  ARect := lbVersion.BoundsRect;
  lbVersion.Caption := dxGetBuildNumberAsString;
  lbVersion.Left := lbVersion.Left - (lbVersion.BoundsRect.Right - ARect.Right);
end;

procedure TdxAboutDemoForm.CreateImageButton(
  AHolder: TControl; ABaseImageIndex: Integer; AEvent: TNotifyEvent);
var
  AImageButton: TdxImageButton;
begin
  AImageButton := TdxImageButton.Create(Self);
  AImageButton.Parent := AHolder.Parent;
  AImageButton.Initialize(icImages, ABaseImageIndex, ABaseImageIndex + 1);
  AImageButton.BoundsRect := AHolder.BoundsRect;
  AImageButton.OnClick := AEvent;
end;

procedure TdxAboutDemoForm.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  if IsWinXPOrLater then
    Params.WindowClass.Style := Params.WindowClass.Style or CS_DROPSHADOW;
end;

procedure TdxAboutDemoForm.CloseClickHandler(Sender: TObject);
begin
  Close;
end;

procedure TdxAboutDemoForm.Browse(const URL: string);
begin
  ShellExecute(Handle, 'open', PChar(URL), nil, nil, SW_SHOW);
end;

procedure TdxAboutDemoForm.SubscribeClickHandler(Sender: TObject);
begin
  Browse(dxURLSubscribe);
end;

procedure TdxAboutDemoForm.DownloadTrialClickHandler(Sender: TObject);
begin
  Browse(dxURLDownloadTrial);
end;

procedure TdxAboutDemoForm.pbChatClick(Sender: TObject);
begin
  Browse(Format(dxURLCommon, ['Chat']));
end;

procedure TdxAboutDemoForm.pbSupportClick(Sender: TObject);
begin
  Browse(Format(dxURLCommon, ['SC']));
end;

procedure TdxAboutDemoForm.LearnMoreClickHandler(Sender: TObject);
begin
  Browse(dxURLLearnMore);
end;

procedure TdxAboutDemoForm.WMNCHitTest(var Message: TWMNCHitTest);
begin
  inherited;
  if ControlAtPos(ScreenToClient(SmallPointToPoint(Message.Pos)), False) = imBackground then
    Message.Result := HTCAPTION;
end;

end.
