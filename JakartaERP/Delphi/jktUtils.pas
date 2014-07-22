unit jktUtils;

interface

uses
  System.IniFiles, Forms, System.SysUtils;

const
  DataPath = '..\..\Data\';

var
  ApplicationFile: TIniFile;

implementation


initialization
  ApplicationFile := TIniFile.Create( ChangeFileExt(Application.ExeName, '.ini') );

finalization
  ApplicationFile.Free;

end.
