unit RealtorWorldDM;

interface

uses
  SysUtils, Classes, DB, ADODB, DBClient, Provider, Controls, Forms;

type
  TDMRealtorWorld = class(TDataModule)
    dsHomePhotos: TDataSource;
    dsHomesAndAgents: TDataSource;
    dsHouseSales: TDataSource;
    dsMortgage: TDataSource;
    dsHomesAndHomes: TDataSource;
    clMortgage: TClientDataSet;
    clMortgageDate1: TDateTimeField;
    clMortgageFRM30: TFloatField;
    clMortgageFRM15: TFloatField;
    clMortgageARM1: TFloatField;
    clHousesSales: TClientDataSet;
    clHomesAndHomes: TClientDataSet;
    clHomesAndAgents: TClientDataSet;
    clHomePhotos: TClientDataSet;
    clHomePhotosID: TIntegerField;
    clHomePhotosParentID: TIntegerField;
    clHomePhotosPhoto: TBlobField;
    clHomesAndAgentsID: TIntegerField;
    clHomesAndAgentsFirstName: TMemoField;
    clHomesAndAgentsLastName: TMemoField;
    clHomesAndAgentsPhone: TMemoField;
    clHomesAndAgentsEmail: TMemoField;
    clHomesAndAgentsPhoto: TBlobField;
    clHomesAndHomesID: TIntegerField;
    clHomesAndHomesAddress: TMemoField;
    clHomesAndHomesBeds: TSmallintField;
    clHomesAndHomesBaths: TSmallintField;
    clHomesAndHomesHouseSize: TFloatField;
    clHomesAndHomesLotSize: TFloatField;
    clHomesAndHomesPrice: TFloatField;
    clHomesAndHomesFeatures: TMemoField;
    clHomesAndHomesYearBuilt: TMemoField;
    clHomesAndHomesType: TIntegerField;
    clHomesAndHomesStatus: TIntegerField;
    clHomesAndHomesPhoto: TBlobField;
    clHousesSalesID: TIntegerField;
    clHousesSalesDate1: TDateTimeField;
    clHousesSalesCount1: TIntegerField;
    clHousesSalesRegion: TMemoField;
    clHousesSalesSeasonallyAdjusted: TMemoField;
    clHousesSalesType1: TMemoField;
    dspHomesAndHomes: TDataSetProvider;
    clHomesAndHomesAgentID: TIntegerField;
    dsHomesDetail: TDataSource;
    clHomesDetail: TClientDataSet;
    clHomesAndHomesYearID: TIntegerField;
    clHomesDetailID: TIntegerField;
    clHomesDetailAddress: TMemoField;
    clHomesDetailBeds: TSmallintField;
    clHomesDetailBaths: TSmallintField;
    clHomesDetailHouseSize: TFloatField;
    clHomesDetailLotSize: TFloatField;
    clHomesDetailPrice: TFloatField;
    clHomesDetailFeatures: TMemoField;
    clHomesDetailYearBuilt: TMemoField;
    clHomesDetailType: TIntegerField;
    clHomesDetailStatus: TIntegerField;
    clHomesDetailPhoto: TBlobField;
    clHomesDetailAgentID: TIntegerField;
    clHomesDetailYearID: TIntegerField;
    dsHouseSalsesChart: TDataSource;
    clHouseSalesChart: TClientDataSet;
    clHouseSalesChartDate: TDateField;
    clHouseSalesChartState: TStringField;
    clHouseSalesChartSeasonallyAdjusted: TStringField;
    clHouseSalesChartMidWest: TIntegerField;
    clHouseSalesChartNorthEast: TIntegerField;
    clHouseSalesChartSouth: TIntegerField;
    clHouseSalesChartWest: TIntegerField;
    clHouseSalesChartAll: TIntegerField;
    dsHouseRating: TDataSource;
    dsHousesSimular: TDataSource;
    clHousesSimular: TClientDataSet;
    IntegerField1: TIntegerField;
    clHousesSimularYear: TIntegerField;
    dsHousePrice: TDataSource;
    clHousePrice: TClientDataSet;
    IntegerField2: TIntegerField;
    clHousePriceDate: TDateField;
    clHousePricePrice: TFloatField;
    clHousesSimularProposals: TIntegerField;
    clHousesSimularSold: TIntegerField;
    clHouseRating: TClientDataSet;
    clHouseRatingHouseID: TIntegerField;
    clHouseRatingRegionName: TStringField;
    clHouseRatingValue: TIntegerField;
    dsResearchChart: TDataSource;
    clResearchChart: TClientDataSet;
    clResearchChartDate: TDateField;
    clResearchChartState: TStringField;
    clResearchChartSeasonallyAdjusted: TStringField;
    clResearchChartMidWest: TIntegerField;
    clResearchChartNorthEast: TIntegerField;
    clResearchChartSouth: TIntegerField;
    clResearchChartWest: TIntegerField;
    clResearchChartAll: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure clHomesAndHomesCalcFields(DataSet: TDataSet);
  private
    FDataPath: string;
  public
    property DataPath: string read FDataPath;
  end;

var
  DMRealtorWorld: TDMRealtorWorld;

implementation

uses DateUtils, Math, RealtorWorldDataPath;

{$R *.dfm}

procedure TDMRealtorWorld.DataModuleCreate(Sender: TObject);
begin
  FDataPath := ExtractFilePath(Application.ExeName) + GetDataPath;
  clHomePhotos.LoadFromFile(FDataPath + 'HomePhotos.cds');
  clHomesAndAgents.LoadFromFile(FDataPath + 'HomesAndAgents.cds');
  clHomesAndHomes.LoadFromFile(FDataPath + 'HomesAndHomes.cds');
  clHousesSales.LoadFromFile(FDataPath + 'HousesSales.cds');
  clMortgage.LoadFromFile(FDataPath + 'Mortgage.cds');
  clHomesDetail.Active := True;
  clHouseSalesChart.LoadFromFile(FDataPath + 'HouseSalesChart.cds');
  clHouseRating.LoadFromFile(FDataPath + 'HouseRating.cds');
  clHousesSimular.LoadFromFile(FDataPath + 'HouseSimular.cds');
  clHousePrice.LoadFromFile(FDataPath + 'HousePrice.cds');
  clResearchChart.LoadFromFile(FDataPath + 'HousesSalesResearch.cds');
end;

procedure TDMRealtorWorld.clHomesAndHomesCalcFields(DataSet: TDataSet);
begin
  clHomesAndHomesAgentID.Value := clHomesAndHomesID.Value mod 6 + 1;
  clHomesAndHomesYearID.Value := StrToInt(clHomesAndHomesYearBuilt.Value);
end;

end.


