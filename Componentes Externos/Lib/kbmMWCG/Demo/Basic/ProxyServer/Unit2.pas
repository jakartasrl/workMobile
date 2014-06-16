unit Unit2;

// =========================================================================
// kbmMW - An advanced and extendable middleware framework.
// by Components4Developers (http://www.components4developers.com)
//
// Service generated by kbmMW service wizard.
//

interface

uses
  SysUtils, {$ifdef VER140}Variants,{$endif} Classes, Forms, kbmMWSecurity,
  kbmMWServer, kbmMWProxyService, kbmMWServiceUtils;

type
  TProxyService = class(TkbmMWProxyService)
  private
     { Private declarations }
  protected
     { Private declarations }
  public
     { Public declarations }
{$IFNDEF CPP}class{$ENDIF} function GetExtendable:boolean; override;
{$IFNDEF CPP}class{$ENDIF} function GetFlags:TkbmMWServiceFlags; override;
  end;

implementation

uses Unit1;

{$R *.DFM}


// Service definitions.
//---------------------

{$IFNDEF CPP}class{$ENDIF} function TProxyService.GetExtendable:boolean;
begin
     Result:=false;
end;

{$IFNDEF CPP}class{$ENDIF} function TProxyService.GetFlags:TkbmMWServiceFlags;
begin
     Result:=[];
end;


end.