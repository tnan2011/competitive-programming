{$MODE ObjFPC}
const
    iFn = 'bai3.inp';
    oFn = 'bai3.out';

    MAX_N = 10000;
    MAX_K = 100;

var
    F: Text;
    n, k: Integer;

    a: array[1..MAX_N] of Integer;
    t: array[0..1, 0..MAX_K-1] of Boolean;
    i, i1, i2, j, z: Integer;
BEGIN
    Assign(F, iFn); Reset(F);
    ReadLn(F, n, k);
    for i := 1 to n do
    begin
        Read(F, a[i]);
        a[i] := (a[i] mod k + k) mod k;
    end;
    Close(F);

    t[0, a[1]] := true;

    for i := 2 to n do
    begin
        i1 := i and 1;
        i2 := 1 - i2;

        FillChar(t[i2], k, 0);
        for j := k-1 downto 0 do
            if t[i1, j] then
            begin
                t[i2, (j - a[i]+ k) mod k] := true;
                t[i2, (j + a[i]) mod k] := true;
            end;
    end;

    Assign(F, oFn); Rewrite(F);
    Write(F, Ord(t[i2, 0]));
    Close(F);
END.
