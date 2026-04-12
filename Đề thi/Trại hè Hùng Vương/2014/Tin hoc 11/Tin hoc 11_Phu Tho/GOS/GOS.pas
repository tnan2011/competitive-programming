const   fi = 'GOS.INP';
        fo = 'GOS.OUT';
        nmax = 1010;
        oo = 1000000007;

type    rect = record
                x1 , y1 , x2 , y2 : longint;
               end;

var     n : longint;
        a1 , b1 , a2 , b2 , q , d : array[1..nmax] of longint;
        mark : array[1..nmax] of boolean;
        c : array[1..nmax,1..nmax] of boolean;

procedure enter;
var     i : longint;
        tmp : rect;
  begin
        readln(n);
        for i := 1 to n do
           readln(a1[i] , b1[i] , a2[i] , b2[i]);
  end;

function cross(i , j : longint) : boolean;
var     dd , d1 , d2 : longint;
  begin
        dd := abs(a1[i] - a1[j]);
        d1 := abs(a1[i] - a2[i]);
        d2 := abs(a1[j] - a2[j]);

        if dd >= d1 + d2 then exit(false);

        dd := abs(b1[i] - b1[j]);
        d1 := abs(b1[i] - b2[i]);
        d2 := abs(b1[j] - b2[j]);

        if dd >= d1 + d2 then exit(false);

        exit(true);
  end;

procedure init;
var     i , j : longint;
  begin
        for i := 1 to n-1 do
           for j := i+1 to n do
                if cross(i , j) then
                   begin
                        c[i,j] := true;
                        c[j,i] := true;
                   end
                else
                   begin
                        c[i,j] := false;
                        c[j,i] := false;
                   end;
  end;

procedure process;
var     l , r , u , i : longint;
  begin
        l := 1;
        r := 1;
        q[1] := 1;
        fillchar(mark , nmax , true);

        for i := 1 to n do
           d[i] := oo;
        d[1] := 0;

        mark[1] := false;

        while l <= r do
           begin
                u := q[l];
                inc(l);
                if u = n then break;

                for i := 1 to n do
                   if c[u,i] and mark[i] then
                        begin
                           inc(r);
                           q[r] := i;
                           d[i] := d[u] + 1;
                           mark[i] := false;
                        end;
           end;

        if not mark[n] then writeln(d[n]) else writeln(-1);

  end;


begin
        assign(input,fi);
        reset(input);
        assign(output,fo);
        rewrite(output);

        enter;
        init;
        process;

        close(input);
        close(output);
end.
