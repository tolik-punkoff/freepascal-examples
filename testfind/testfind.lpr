program testfind;
uses Classes, SysUtils, FileUtil;
var
   lstFiles:TStringList;
   i: Integer;
begin
     lstFiles := TStringList.Create;
     FindAllFiles(lstFiles, 'C:\Temp\Test', '*.htm', true);
     i:=0;
     while i < lstFiles.Count do begin
       WriteLn(lstFiles[i]);
       inc(i);
     end;
     WriteLn ('Found: ',lstFiles.Count);
     WriteLn ('Press Enter');
     ReadLn();
     lstFiles.Free();
end.

