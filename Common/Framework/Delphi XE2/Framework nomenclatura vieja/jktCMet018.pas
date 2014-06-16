unit jktCMet018;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxDBEdit;


type
  TjktdxButtonEdit = class(TcxDBButtonEdit)
  private
    { Private declarations }
    procedure jktOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  published
    { Published declarations }
  end;

procedure Register;

implementation

procedure TjktdxButtonEdit.jktOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_F1) and (Self.Properties.ReadOnly = False)
     then if Assigned(Properties.OnButtonClick)
             then Self.Properties.OnButtonClick(Self, 0);
end;

constructor TjktdxButtonEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  self.OnKeyDown := jktOnKeyDown;
end;

procedure Register;
begin
  RegisterComponents('Jakarta', [TjktdxButtonEdit]);
end;

end.
