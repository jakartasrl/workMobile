unit jktCNMet0009;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, cxControls, cxContainer,
  cxEdit, cxGroupBox, System.UITypes;

type
  TjktGroupBox = class(TcxGroupBox)
  private
    procedure SetEnabled(Value: Boolean); override;

  protected
    { Protected declarations }
  public
    constructor Create(AOwner: TComponent); override;

  published
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Jakarta', [TjktGroupBox]);
end;

{ TjktGroupBox }

constructor TjktGroupBox.Create(AOwner: TComponent);
begin
  inherited;

  // Seteo el texto en cursiva (fsItalic)...
  Self.Style.TextStyle := [TFontStyle(1)];
end;

procedure TjktGroupBox.SetEnabled(Value: Boolean);
var
  i: Integer;
begin
  inherited;

  for i := 0 to Self.ControlCount - 1 do
    Self.Controls[i].Enabled := Value;
end;

end.
