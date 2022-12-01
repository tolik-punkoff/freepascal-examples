program sorteng;
uses Classes;
var
  lstTest:TStringList;
  i:integer;

  function SortByDesc(List: TStringList; Index1, Index2: Integer): Integer;
  begin
    if List[Index1]<List[Index2] then
    begin
      Result := 1;
      Exit;
    end;
    if List[Index1]=List[Index2]
      then Result := 0
      else Result := -1;
  end;

function SortByAsc(List: TStringList; Index1, Index2: Integer): Integer;
begin
  if List[Index1]>List[Index2] then
  begin
    Result := 1;
    Exit;
  end;
  if List[Index1]=List[Index2]
    then Result := 0
    else Result := -1;
end;

function SortByLenAsc(List: TStringList; Index1, Index2: Integer): Integer;
begin
  if Length(List[Index1])>Length(List[Index2]) then
  begin
    Result := 1;
    Exit;
  end;
  if List[Index1]=List[Index2]
    then Result := 0
    else Result := -1;
end;

function SortByLenDesc(List: TStringList; Index1, Index2: Integer): Integer;
begin
  if Length(List[Index1])<Length(List[Index2]) then
  begin
    Result := 1;
    Exit;
  end;
  if List[Index1]=List[Index2]
    then Result := 0
    else Result := -1;
end;

begin
  lstTest:=TStringList.Create;
  lstTest.Add('dog');
  lstTest.Add('puppy');
  lstTest.Add('cat');
  lstTest.Add('kitten');
  lstTest.Add('parrot');
  lstTest.Add('hamster');
  lstTest.Add('chinchilla');
  lstTest.Add('guinea pig');
  lstTest.Add('mouse');
  lstTest.Add('rat');

  Writeln('Raw output:');
  i:=0;
  while i < lstTest.Count do begin
    WriteLn(lstTest[i]);
    inc(i);
  end;

  WriteLn();
  lstTest.Sort;
  WriteLn('Sort by ascending (default):');
  i:=0;
  while i < lstTest.Count do begin
    WriteLn(lstTest[i]);
    inc(i);
  end;

  Writeln(); WriteLn('Press Enter...'); ReadLn();

  WriteLn('Sort by descending (custom):');
  lstTest.CustomSort(@SortByDesc);
  i:=0;
  while i < lstTest.Count do begin
    WriteLn(lstTest[i]);
    inc(i);
  end;

  Writeln(); WriteLn('Press Enter...'); ReadLn();

  WriteLn('Sort by ascending (custom):');
  lstTest.CustomSort(@SortByAsc);
  i:=0;
  while i < lstTest.Count do begin
    WriteLn(lstTest[i]);
    inc(i);
  end;

  Writeln(); WriteLn('Press Enter...'); ReadLn();

  WriteLn('Sort by ascending (Length) (custom):');
  lstTest.CustomSort(@SortByLenAsc);
  i:=0;
  while i < lstTest.Count do begin
    WriteLn(lstTest[i]);
    inc(i);
  end;

  Writeln(); WriteLn('Press Enter...'); ReadLn();

  WriteLn('Sort by descending (Length) (custom):');
  lstTest.CustomSort(@SortByLenDesc);
  i:=0;
  while i < lstTest.Count do begin
    WriteLn(lstTest[i]);
    inc(i);
  end;

  Writeln(); WriteLn('Press Enter...'); ReadLn();

end.

