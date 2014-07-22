unit jktFNMet0005;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFMet005 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Memo: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure mostrarError(texto :string);
  end;

var
  FMet005: TFMet005;

implementation

{$R *.DFM}

procedure TFMet005.Button1Click(Sender: TObject);
begin
   close;
end;

procedure TFMet005.mostrarError(texto: string);
begin
    memo.Text := texto;
    showmodal;
end;

procedure TFMet005.FormShow(Sender: TObject);
begin
  if (Button1.CanFocus)
     then Button1.SetFocus;
end;

end.
