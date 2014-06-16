unit uDemo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  kbmMemSQL, StdCtrls, DB, kbmMemTable, Grids, DBGrids,
  kbmSQLMemTableAPI, ExtCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    mtTable1: TkbmMemTable;
    mtTable1fld1: TStringField;
    mtTable1fld2: TIntegerField;
    mtTable1fld3: TIntegerField;
    mtTable1fld4: TStringField;
    mtTable1fld5: TIntegerField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Memo1: TMemo;
    Panel1: TPanel;
    Button1: TButton;
    mSQL: TMemo;
    Panel2: TPanel;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    DBGrid2: TDBGrid;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Memo2: TMemo;
    dsTable1: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FSQL:TkbmMemSQL;

    procedure BuildSampleData(ATable:TkbmMemTable);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
   kbmSQLElements;

procedure TForm1.BuildSampleData(ATable:TkbmMemTable);
var
   i:integer;
begin
     ATable.Close;
     ATable.CreateTable;
     ATable.DisableControls;
     try
        ATable.Open;
        for i:=0 to 1000 do
        begin
             ATable.Append;
             ATable.FieldByName('fld1').AsString:='STR'+inttostr(i div 3);
             ATable.FieldByName('fld2').AsInteger:=i;
             ATable.FieldByName('fld3').AsInteger:=999-i;
             ATable.FieldByName('fld4').AsString:='STR'+inttostr(999-i);
             ATable.FieldByName('fld5').AsInteger:=Random(2)+5;;
             ATable.Post;
        end;
     finally
        ATable.EnableControls;
     end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
   i:integer;
   fld:TkbmSQLField;
   tbl:TkbmSQLTable;
   sel:TkbmSQLSelectOperation;
begin
     BuildSampleData(mtTable1);

     // Add tables that the SQL is supposed to access.
     FSQL.Tables.Clear;
     FSQL.Tables.Add('table1',mtTable1);

     // Execute the SQL.
     try
        FSQL.ExecSQL(mSQL.Text);
     finally
        // Dump our parse tree as we know it.
        with Memo2.Lines do
        begin
             Clear;
             Add('Operation');
             Add('----------');
             Add('');
             case FSQL.Parser.Operation.OpType of
                  sotSELECT: Add('SELECT');
                  sotDELETE: Add('DELETE');
                  sotINSERT: Add('INSERT');
                  sotUPDATE: Add('UPDATE');
             else
                  Add('Unknown');
             end;

             for i:=0 to FSQL.Parser.Operation.RefTables.Count-1 do
             begin
                  Add('Table '+Inttostr(i));
                  tbl:=FSQL.Parser.Operation.RefTables[i];
                  Add('  '+tbl.Name+' as '+tbl.Alias);
             end;

             for i:=0 to FSQL.Parser.Operation.RefFields.Count-1 do
             begin
                  Add('Included field '+Inttostr(i));
                  fld:=FSQL.Parser.Operation.RefFields[i];
                  Add('  '+fld.Name+' as '+fld.Alias);
             end;

             for i:=0 to FSQL.Parser.Operation.RefSearchFields.Count-1 do
             begin
                  Add('Searched field '+Inttostr(i));
                  fld:=FSQL.Parser.Operation.RefSearchFields[i];
                  Add('  '+fld.Name+' as '+fld.Alias);
             end;
        end;
     end;

     // Show the result.
     dsResult.DataSet:=FSQL;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
     FSQL:=TkbmMemSQL.Create(nil);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
     FSQL.Free;
end;

end.
 