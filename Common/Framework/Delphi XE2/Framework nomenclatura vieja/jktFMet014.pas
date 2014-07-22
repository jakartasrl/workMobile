unit jktFMet014;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, kbmMemTable, kbmMemCSVStreamFormat, Db, jktCMet012,
  jktCMet008, ExtCtrls, cxGridDBTableView, cxGridLevel, cxGrid,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView;

type
  TFMet014 = class(TForm)
    GBImportCSV: TGroupBox;
    EPathArchivo: TEdit;
    SBImportarCSV: TSpeedButton;
    LTitFormato: TLabel;
    LFormato: TLabel;
    BImportar: TButton;
    PErrores: TPanel;
    GBErrores: TGroupBox;
    MTErrores: TjktMemTable;
    OPImportCSV: TOpenDialog;
    LSeparador: TLabel;
    ESeparador: TEdit;
    DSErrores: TDataSource;
    DBGErrores: TjktExpDBGrid;
    DBGErroresLevel1: TcxGridLevel;
    DBGErroresDBTableView1: TcxGridDBTableView;
    procedure BImportarClick(Sender: TObject);
    procedure SBImportarCSVClick(Sender: TObject);
  private
    { Private declarations }
    FAcepto : Boolean;
    procedure ValidarArchivo();
  public
    { Public declarations }
    property  Acepto : Boolean read FAcepto write FAcepto;
    procedure SetFormatoArchivo(aFormato : String);
    function  GetNombreArchivo() : String;
    function  GetSeparadorCampo() : Char;
    procedure Mostrar();
    procedure MostrarErrores(aDataSet : TjktMemTable);
  end;

var
  FMet014: TFMet014;

implementation

{$R *.DFM}

procedure TFMet014.Mostrar();
begin
  FAcepto               := False;
  PErrores.Visible      := False;
  EPathArchivo.Enabled  := True;
  SBImportarCSV.Enabled := True;
  Self.ShowModal();
end;


procedure TFMet014.MostrarErrores(aDataSet : TjktMemTable);
begin
  MTErrores.LoadFromDataSet(aDataSet, [mtcpoStructure]);
  //MTErrores.Open;
  FAcepto               := False;
  PErrores.Visible      := True;
  EPathArchivo.Enabled  := False;
  SBImportarCSV.Enabled := False;
  Self.ShowModal();
end;


procedure TFMet014.BImportarClick(Sender: TObject);
begin
  Self.ValidarArchivo();
  FAcepto := True;
  Self.Close();
end;


procedure TFMet014.SBImportarCSVClick(Sender: TObject);
begin
  if OPImportCSV.Execute
     then EPathArchivo.Text := OPImportCSV.FileName;
end;


procedure TFMet014.ValidarArchivo();
begin
  if EPathArchivo.Text = ''
     then raise Exception.Create('Debe Seleccionar un archivo valido.');
end;


procedure TFMet014.SetFormatoArchivo(aFormato : String);
begin
  LFormato.Caption := aFormato;
end;


function TFMet014.GetNombreArchivo() : String;
begin
  result := OPImportCSV.FileName;
end;


function TFMet014.GetSeparadorCampo() : Char;
begin
 result := Char(ESeparador.Text[1]);
end;


end.
