const
     MODULO = 1000000007;

var
   i, bit, color, m, n, k, c : integer;
   res, s : int64;
   F : array[0..50,0..15] of integer;

begin
     read(m,n,k);
     F[0,0] := 1;
     for i:=1 to n do
         for bit:=0 to 15 do
             if F[i-1,bit] > 0 then
                  for color:=0 to 3 do
                       F[i, bit or (1 shl color)] := (F[i, bit or (1 shl color)] + F[i-1,bit]) mod MODULO;

     s := 0;
     for bit:=0 to 15 do
     begin
          c := 0;
          for i:=0 to 3 do
              if (bit and (1 shl i)) <> 0 then
                 inc(c);
          if c >= k then
             s := (s + F[n, bit]) mod MODULO;
     end;

     res := 1;
     for i:=1 to m do
         res := res * s MOD MODULO;

     writeln(res);
end.
