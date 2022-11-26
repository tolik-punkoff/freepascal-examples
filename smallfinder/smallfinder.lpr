program smallfinder;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, SysUtils, CustApp, FileUtil
  { you can add units after this };

type

  { TSmallfinder }

  TSmallfinder = class(TCustomApplication)
  protected
    procedure DoRun; override;
  public
    procedure WriteHelp; virtual;
  end;

{ TSmallfinder }

procedure TSmallfinder.DoRun;
var
   Mask, StartDir:string;
   IncludeSubdirs:boolean;
   i:LongInt;
   lstFiles:TStringList;
begin
  // check if no parameters - способ из документации нихуя не сработал
  if ParamCount=0 then begin
    WriteHelp;
    Terminate;
    Exit;
  end;

  // parse parameters
  //help
  if HasOption('h', '') then begin
    WriteHelp;
    Terminate;
    Exit;
  end;
  //mask
  if HasOption('m','') then begin
     Mask:=GetOptionValue('m','');
     if Mask = '' then begin
        WriteHelp;
        Terminate;
        Exit;
     end;
  end;
  //start directory
  StartDir:=GetOptionValue('d','');
  if StartDir='' then begin
     StartDir:=GetCurrentDir();
  end;
  //Include subdirs
  IncludeSubdirs:=HasOption('s','');

  WriteLn('Start directory: ',StartDir);
  lstFiles := TStringList.Create;
  FindAllFiles(lstFiles, StartDir, Mask, IncludeSubdirs);
  i:=0;
  while i < lstFiles.Count do begin
        WriteLn(lstFiles[i]);
        inc(i);
  end;
  lstFiles.Free();

  // stop program loop
  Terminate;
end;

procedure TSmallfinder.WriteHelp;
begin
  writeln('Usage: ',ExtractFileName(ExeName), ' <arguments>');
  WriteLn('-h - this help');
  WriteLn('-m <mask> - file mask for search. Parameter must be!');
  WriteLn('-d <directory> - start directory. If not, use current dir.');
  WriteLn('-s - include subdirs');
end;

var
  Application: TSmallfinder;
begin
  Application:=TSmallfinder.Create(nil);
  Application.Title:='smallfinder';
  Application.Run;
  Application.Free;
end.

