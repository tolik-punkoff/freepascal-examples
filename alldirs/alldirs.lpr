program alldirs;
uses Classes, SysUtils, FileUtil;
var
   lstDirs:TStringList;
   i: Integer;
begin
     lstDirs := TStringList.Create;
     FindAllDirectories(lstDirs,'C:\Windows',true);
     i:=0;
     while i < lstDirs.Count do begin
       WriteLn(lstDirs[i]);
       inc(i);
     end;
     WriteLn ('Found: ',lstDirs.Count);
     WriteLn ('Press Enter');
     lstDirs.Free();
     ReadLn();
end.

