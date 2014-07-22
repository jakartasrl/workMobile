unit dxDBGridTypes;

interface

uses
  Classes;

type

  TdxTreeListBands = class(TCollection)
  {
  private
    FTreeList: TCustomdxTreeListControl;
    function GetItem(Index: Integer): TdxTreeListBand;
    function GetVisibleCount: Integer;
    function GetVisibleItem(Index: Integer): TdxTreeListBand;
    procedure SetItem(Index: Integer; Value: TdxTreeListBand);
    procedure SetVisibleItem(Index: Integer; Value: TdxTreeListBand);
  protected
    function GetOwner: TPersistent; override;
    procedure RefreshFixedBands;
    procedure Update(Item: TCollectionItem); override;

  public
    constructor Create(ATreeList: TCustomdxTreeListControl; BandClass: TdxTreeListBandClass);
    function Add: TdxTreeListBand;
    procedure RestoreDefaults;
    function GetAbsoluteIndex(VisibleIndex: Integer): Integer;
    function GetVisibleIndex(AbsoluteIndex: Integer): Integer; // -1 if UnVisible

    property TreeList: TCustomdxTreeListControl read FTreeList;
    property Items[Index: Integer]: TdxTreeListBand read GetItem write SetItem; default;
    property VisibleCount: Integer read GetVisibleCount;
    property VisibleItems[Index: Integer]: TdxTreeListBand read GetVisibleItem write SetVisibleItem;
  }
  end;

implementation


end.
