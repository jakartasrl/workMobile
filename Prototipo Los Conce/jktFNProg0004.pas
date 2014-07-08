unit jktFNProg0004;

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
  dxSkinXmas2008Blue, dxSkinsdxBarPainter, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, cxTextEdit, cxMaskEdit, cxButtonEdit, cxLabel,
  cxGroupBox, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, jktCNMet0008, jktCNMet0030,
  jktCNMet0002, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, jktCNMet0001, dxBar, kbmMemTable, jktCNMet0012, cxMemo,
  kbmMemBinaryStreamFormat, cxDropDownEdit;

type
  TFNProg0004 = class(TfrmChild)
    jktExpDBGrid1DBTableView1: TcxGridDBTableView;
    jktExpDBGrid1Level1: TcxGridLevel;
    jktExpDBGrid1: TjktExpDBGrid;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxButtonEdit1: TcxButtonEdit;
    TPresupuesto: TjktMemTable;
    dsPresupuesto: TDataSource;
    TPresupuestoCodGrupo: TIntegerField;
    TPresupuestoDescGrupo: TStringField;
    TPresupuestoCodItem: TIntegerField;
    TPresupuestoDescItem: TStringField;
    TPresupuestoCantidad: TIntegerField;
    TPresupuestoUnidad: TStringField;
    TPresupuestoPrecio: TFloatField;
    TPresupuestoMoneda: TStringField;
    TPresupuestoFecha: TDateField;
    jktExpDBGrid1DBTableView1CodGrupo: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1DescGrupo: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1CodItem: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1DescItem: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1Cantidad: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1Unidad: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1Precio: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1Moneda: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1Fecha: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1Importe: TcxGridDBColumn;
    cxMemo1: TcxMemo;
    TPresupuestoTotal: TFloatField;
    cxLabel2: TcxLabel;
    kbmBSF: TkbmBinaryStreamFormat;
    procedure TPresupuestoAfterOpen(DataSet: TDataSet);
    procedure TPresupuestoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNProg0004: TFNProg0004;

implementation

{$R *.dfm}

procedure TFNProg0004.TPresupuestoAfterOpen(DataSet: TDataSet);
begin
  inherited;

 // TPresupuesto.LoadFromFileViaFormat('Presupuesto', kbmBSF);
  //dataset.Refresh;

   Dataset.Append;
   DataSet.FieldByName('CodGrupo').AsInteger := 1;
   DataSet.FieldByName('DescGrupo').AsString := '01-Materiales';
   DataSet.FieldByName('CodItem').AsInteger  := 1 ;
   DataSet.FieldByName('DescItem').AsString := 'Cobre';
   DataSet.FieldByName('Cantidad').AsInteger := 300;
   DataSet.FieldByName('Unidad').AsString := 'KG';
   DataSet.FieldByName('Precio').AsFloat := 324.5;
   DataSet.FieldByName('Moneda').AsString := 'PES';
   DataSet.FieldByName('Fecha').AsDateTime := strToDateTime('31/05/2013');

   dataset.Append;
   DataSet.FieldByName('CodGrupo').AsInteger := 1;
   DataSet.FieldByName('DescGrupo').AsString := '01-Materiales';
   DataSet.FieldByName('CodItem').AsInteger  := 2 ;
   DataSet.FieldByName('DescItem').AsString := 'Hierro';
   DataSet.FieldByName('Cantidad').AsInteger := 200;
   DataSet.FieldByName('Unidad').AsString := 'KG';
   DataSet.FieldByName('Precio').AsFloat := 5.5;
   DataSet.FieldByName('Moneda').AsString := 'PES';
   DataSet.FieldByName('Fecha').AsDateTime := strToDateTime('31/05/2013');




   dataset.Append;
   DataSet.FieldByName('CodGrupo').AsInteger := 2;
   DataSet.FieldByName('DescGrupo').AsString := '02-Mano de Obra';
   DataSet.FieldByName('CodItem').AsInteger  := 3 ;
   DataSet.FieldByName('DescItem').AsString := 'Oficial ';
   DataSet.FieldByName('Cantidad').AsInteger := 120;
   DataSet.FieldByName('Unidad').AsString := 'HS';
   DataSet.FieldByName('Precio').AsFloat := 24;
   DataSet.FieldByName('Moneda').AsString := 'PES';
   DataSet.FieldByName('Fecha').AsDateTime := strToDateTime('31/05/2013');

   dataset.Append;
   DataSet.FieldByName('CodGrupo').AsInteger := 2;
   DataSet.FieldByName('DescGrupo').AsString := '02-Mano de Obra';
   DataSet.FieldByName('CodItem').AsInteger  := 4 ;
   DataSet.FieldByName('DescItem').AsString := 'Medio Oficial ';
   DataSet.FieldByName('Cantidad').AsInteger := 45;
   DataSet.FieldByName('Unidad').AsString := 'HS';
   DataSet.FieldByName('Precio').AsFloat := 15;
   DataSet.FieldByName('Moneda').AsString := 'PES';
   DataSet.FieldByName('Fecha').AsDateTime := strToDateTime('31/05/2013');

   dataset.Append;
   DataSet.FieldByName('CodGrupo').AsInteger := 3;
   DataSet.FieldByName('DescGrupo').AsString := '03-Accesorios';
   DataSet.FieldByName('CodItem').AsInteger  := 5 ;
   DataSet.FieldByName('DescItem').AsString := 'Bujolls';
   DataSet.FieldByName('Cantidad').AsInteger := 1;
   DataSet.FieldByName('Unidad').AsString := 'UNI';
   DataSet.FieldByName('Precio').AsFloat := 8000;
   DataSet.FieldByName('Moneda').AsString := 'PES';
   DataSet.FieldByName('Fecha').AsDateTime := strToDateTime('31/05/2013');


   dataset.Append;
   DataSet.FieldByName('CodGrupo').AsInteger := 3;
   DataSet.FieldByName('DescGrupo').AsString := '03-Accesorios';
   DataSet.FieldByName('CodItem').AsInteger  := 6 ;
   DataSet.FieldByName('DescItem').AsString := 'Consola';
   DataSet.FieldByName('Cantidad').AsInteger := 1;
   DataSet.FieldByName('Unidad').AsString := 'UNI';
   DataSet.FieldByName('Precio').AsFloat := 2000;
   DataSet.FieldByName('Moneda').AsString := 'PES';
   DataSet.FieldByName('Fecha').AsDateTime := strToDateTime('31/05/2013');


   dataset.Append;
   DataSet.FieldByName('CodGrupo').AsInteger := 4;
   DataSet.FieldByName('DescGrupo').AsString := '04-Ajuste';
   DataSet.FieldByName('CodItem').AsInteger  := 7 ;
   DataSet.FieldByName('DescItem').AsString := 'Ajuste';
   DataSet.FieldByName('Cantidad').AsInteger := 1;
   DataSet.FieldByName('Unidad').AsString := 'UNI';
   DataSet.FieldByName('Precio').AsFloat := 0;
   DataSet.FieldByName('Moneda').AsString := 'PES';
   DataSet.FieldByName('Fecha').AsDateTime := strToDateTime('31/05/2013');


end;

procedure TFNProg0004.TPresupuestoCalcFields(DataSet: TDataSet);
begin
  inherited;

  DataSet.FieldByName('Total').AsFloat :=
    DataSet.FieldByName('Precio').AsFloat * DataSet.FieldByName('Cantidad').AsInteger;
end;

end.
