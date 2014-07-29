unit jktFNSeg0002;

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
  cxLookAndFeelPainters, cxContainer, cxEdit, cxLabel, cxTextEdit, cxDBEdit,
  cxGroupBox, cxCheckBox, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, jktCNMet0008, kbmMemTable, jktCNMet0012, dxBevel, jktCNMet0011;

type
  TFNSeg0002 = class(TfrmChild)
    cxGroupBox1: TcxGroupBox;
    txtCodigo: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxGroupBox3: TcxGroupBox;
    dbgUsuarioEmpresasDBTableView1: TcxGridDBTableView;
    dbgUsuarioEmpresasLevel1: TcxGridLevel;
    dbgUsuarioEmpresas: TjktExpDBGrid;
    TUsuarios: TjktMemTable;
    TUsuarioEmpresas: TjktMemTable;
    dsUsuarios: TDataSource;
    dsUsuarioEmpresas: TDataSource;
    TUsuariosoid_usuario: TIntegerField;
    TUsuariosCodigo: TStringField;
    TUsuariosApellido: TStringField;
    TUsuariosNombre: TStringField;
    TUsuariosPassword: TStringField;
    TUsuariosConfPassword: TStringField;
    TUsuariosEmail: TStringField;
    TUsuariosActivo: TBooleanField;
    TUsuariosSinVencimientoPwd: TBooleanField;
    cxDBCheckBox1: TcxDBCheckBox;
    cxDBTextEdit6: TcxDBTextEdit;
    cxLabel7: TcxLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    cxLabel6: TcxLabel;
    dxBevel1: TdxBevel;
    TUsuarioEmpresasoid_usu_emp: TIntegerField;
    TUsuarioEmpresasoid_empresa: TIntegerField;
    TUsuarioEmpresasoid_usuario: TIntegerField;
    TUsuarioEmpresasCodigo: TStringField;
    TUsuarioEmpresasRazonSocial: TStringField;
    TUsuarioEmpresasActivo: TBooleanField;
    TUsuarioEmpresasDefault: TBooleanField;
    dbgUsuarioEmpresasDBTableView1oid_usu_emp: TcxGridDBColumn;
    dbgUsuarioEmpresasDBTableView1oid_usuario: TcxGridDBColumn;
    dbgUsuarioEmpresasDBTableView1oid_empresa: TcxGridDBColumn;
    dbgUsuarioEmpresasDBTableView1Codigo: TcxGridDBColumn;
    dbgUsuarioEmpresasDBTableView1RazonSocial: TcxGridDBColumn;
    dbgUsuarioEmpresasDBTableView1Default: TcxGridDBColumn;
    dbgUsuarioEmpresasDBTableView1Activo: TcxGridDBColumn;
    procedure cxDBCheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNSeg0002: TFNSeg0002;

implementation

{$R *.dfm}

procedure TFNSeg0002.cxDBCheckBox1Click(Sender: TObject);
begin
  inherited;

{
  TUsuarioEmpresas.Close;
  TUsuarioEmpresas.Open;

  TEmpresas.First;
  while not TEmpresas.Eof do begin

    TUsuarioEmpresas.Append;
    TUsuarioEmpresas.FieldByName('oid_usu_emp').AsInteger := 0;
    TUsuarioEmpresas.FieldByName('oid_usuario').AsInteger := TUsuario;
    TUsuarioEmpresas.FieldByName('oid_empresa').AsInteger := TEmpresas.FieldByName('oid_empresa').Value;
    TUsuarioEmpresas.FieldByName('Codigo').AsString       := TEmpresas.FieldByName('Codigo').Value;
    TUsuarioEmpresas.FieldByName('RazonSocial').AsString  := TEmpresas.FieldByName('RazonSocial').Value;
    TUsuarioEmpresas.FieldByName('Default').AsBoolean     := False;
    TUsuarioEmpresas.FieldByName('Activo').AsBoolean      := TEmpresas.FieldByName('Activo').Value;
    TUsuarioEmpresas.Post;

    TEmpresas.Next;
  end;
}

end;

end.
