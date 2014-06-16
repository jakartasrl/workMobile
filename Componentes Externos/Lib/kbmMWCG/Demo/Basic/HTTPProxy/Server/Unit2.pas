unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  kbmMWQueryService, Db, kbmMemTable, kbmMWCustomConnectionPool,
  kbmMWCustomDataset, kbmMWBDE, kbmMemCSVStreamFormat, kbmMWSecurity,
  kbmMWBinaryStreamFormat, kbmMWStreamFormat, kbmMWResolvers;

type
  TTestQuery = class(TkbmMWQueryService)
    SELECTED_EVENT: TkbmMWBDEQuery;
    kbmMWBinaryStreamFormat1: TkbmMWBinaryStreamFormat;
    kbmMWBDEResolver1: TkbmMWBDEResolver;
    ALL_EVENTS: TkbmMWBDEQuery;
    ClientSideQuery: TkbmMWBDEQuery;
    SPTEST: TkbmMWBDEStoredProc;
    procedure kbmMWBDEResolver1Delete(Sender: TkbmMWCustomResolver;
      var Skip, Abort: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TestQuery: TTestQuery;

implementation

uses Unit1;

{$R *.DFM}

// This is a sample customizable query service.
// New query services can be created by creating a new kbmMWQueryService file
// via File->New->kbmMW Service objects.
//
// Any TkbmMWQueryService based service _must_ include a kbmMWCustomStreamFormat
// component which decides the format the data is transferred to/from the server/client.
// After adding a stream format to the query service module, set the service module's
// TransportStreamFormat property to point to the stream format component.
// Further you need to add some TkbmMWCustomPooledQuery component which is the
// one actually doing the query. In this example, a TkbmMWBDEQuery is used.
// Set the query service modules Query property to point at your query component.
// If the client can return changes to a dataset and the changes must be resolved
// back to a database, you also need to add a resolver component and connect
// the query's Resolver property to it.
// In this example a TkbmMWBDEResolver is used.
// Finally you need to set the query service module to point to a central
// TkbmMWPooledSession component. This is usually placed on the main server form.
// The TkbmMWPooledSession component makes sure to distribute and sync requests
// from several service instances via a database connection pool.


procedure TTestQuery.kbmMWBDEResolver1Delete(
  Sender: TkbmMWCustomResolver; var Skip, Abort: Boolean);
begin
     // On the OnInsert, OnModify and OnDelete events you can add code
     // to for example put constraints on updates to the database.
     //
     // Setting the Skip to true will skip the update for the current record.
     // This will _not_ be reported back to the client which will believe
     // everything went fine. If you want to skip a record and notify the client
     // you can raise an exception.
     //
     // Setting Abort to true will abort the resolving process and report
     // to the client that the resolving was aborted.
     //
     // You can access the original values and new values for a record via
     // these properties on the Sender:
     // property FieldCount:integer
     // property OrigValues[i:integer]:Variant
     // property Values[i:integer]:Variant
     // property OrigValuesByName[Name:string]:Variant
     // property ValuesByName[Name:string]:Variant
     // property FieldNames[i:integer]:string
     // property Fields[i:integer]:TField
end;

end.
