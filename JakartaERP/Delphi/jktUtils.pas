unit jktUtils;

interface

uses
  System.IniFiles, Forms, System.SysUtils;

const
  DataPath = '..\..\Data\';

  CR   = #$0D; // retorno de carro
  LF   = #$0A; // salto de línea
  CRLF = CR + LF;

var
  ApplicationFile: TIniFile;

implementation


initialization
  ApplicationFile := TIniFile.Create( ChangeFileExt(Application.ExeName, '.ini') );

finalization
  ApplicationFile.Free;

end.
