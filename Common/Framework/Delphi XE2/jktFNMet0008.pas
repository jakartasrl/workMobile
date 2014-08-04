unit jktFNMet0008;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus;

type
  TFMet008 = class(TForm)
    PCabecera: TPanel;
    PCuerpo: TPanel;
    LMasInfo: TLabel;
    MemoDetalle: TMemo;
    Button1: TButton;
    Etiqueta: TLabel;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure LMasInfoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LMasInfoMouseEnter(Sender: TObject);
    procedure LMasInfoMouseLeave(Sender: TObject);
  private
    { Private declarations }
    fMensaje : String;
    fMensajeCuerpo : string;
    fMostrarDetalle : boolean;
    procedure setMensaje(Mensaje : String);
  public
    { Public declarations }
    function GetMensaje() : String;
    function getMensajeCuerpo() : String;
  end;

procedure mostrarMensError(Mensaje : String);
procedure mostrarMensErrorAbort(Mensaje : String);

var
  FMet008: TFMet008;

implementation

{$R *.DFM}

procedure TFMet008.LMasInfoMouseEnter(Sender: TObject);
begin
  LMasInfo.Font.Color := clBlue;
end;

procedure TFMet008.LMasInfoMouseLeave(Sender: TObject);
begin
  LMasInfo.Font.Color := clWindowText;
end;

procedure TFMet008.FormCreate(Sender: TObject);
begin
  PCuerpo.Visible := False;
 // PCabecera.Align := alClient;
end;

procedure TFMet008.LMasInfoClick(Sender: TObject);
begin
  PCuerpo.Visible := True;
  self.Height := 290;
end;

procedure mostrarMensError(Mensaje : String);
var
  FormError : TFMet008;
begin
  FormError := TFMet008.Create(Nil);
  FormError.setMensaje(Mensaje);
  FormError.Etiqueta.Caption := FormError.GetMensaje();
  FormError.MemoDetalle.Lines.Clear;
  FormError.MemoDetalle.Lines.Add(FormError.getMensajeCuerpo());
  FormError.ShowModal;
  FormError.Free;
end;

procedure mostrarMensErrorAbort(Mensaje : String);
begin
  mostrarMensError(Mensaje);
  // Abort raises a special "silent exception" (EAbort), which operates like any
  // other exception (escaping from an execution path), but does not display an
  // error message to the end user.
  Abort;
end;

procedure TFMet008.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TFMet008.setMensaje(Mensaje : String);
begin
  if (Pos('java.lang.NullPointerException',Mensaje)>0)
     then begin
          fMensaje := 'Mensaje de Error en el Servidor - (Error - 5) ';
          fMostrarDetalle := True;
          end
     else
  if (Pos('ExceptionDS',Mensaje)>0)
     then begin
          fMensaje := 'Mensaje de Error en el Servidor - (Error - 6) ';
          fMostrarDetalle := True;
          end
     else
  if (Pos('ObjectNotFoundException',Mensaje)>0)
     then begin
          fMensaje := 'Mensaje de Error en el Servidor - (Error - 7) ';
          fMostrarDetalle := True;
          end
      else
  if (Pos('ClassCastException',Mensaje)>0)
     then begin
          fMensaje := 'Mensaje de Error en el Servidor - (Error - 8) ';
          fMostrarDetalle := True;
          end
     else fMensaje := Mensaje;
  fMensajeCuerpo := Mensaje;
end;

procedure TFMet008.FormShow(Sender: TObject);
begin
  if (length(Etiqueta.Caption)>60) or (fMostrarDetalle)
     then LMasInfo.Visible := True
     else LMasInfo.Visible := False;
end;

function TFMet008.GetMensaje() : String;
begin
  result := fMensaje;
end;

function TFMet008.getMensajeCuerpo() : String;
begin
  result := fMensajeCuerpo;
end;

procedure TFMet008.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13
     then close;
end;

end.
