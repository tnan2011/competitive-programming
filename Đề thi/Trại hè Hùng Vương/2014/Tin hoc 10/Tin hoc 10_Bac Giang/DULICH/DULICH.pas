Uses    math;

Const
        fi      ='DULICH.INP';
        fO      ='DULICH.OUT';
        maxn    =101;
        maxc    =10001;
        maxd    =200000000;

Type
        arr     =array[0..maxn] of longint;
        arr1    =array[0..maxn,0..maxn] of longint;

Var
        n,m     :longint;
        a       :arr1;
        avail   :arr;
        d       :arr;
        cx      :arr;
        res     :longint;

Procedure nhap;
var
        i,u,v,c :longint;
begin
        assign(input,fi);
        reset(input);
        readln(n,m);
        fillchar(a,sizeof(a),0);
        for u:=1 to n do
          for v:=1 to n do a[u,v]:=maxc;
        for i:=1 to m do
          begin
              readln(u,v,c);
              if a[u,v] > c then a[u,v]:=c;
              a[v,u]:=a[u,v];
          end;
        close(input);
end;

Procedure ijk;
var
        u,v     :longint;
begin
        repeat
              u:=0;
              for v:=1 to n do
                if (avail[v]=0) and (cx[v]=0) and (d[v]<d[u]) then
                  u:=v;
              if u = 0 then break;
              cx[u]:=1;
              for v:=1 to n do
                if (cx[v]=0) and (a[u,v]<maxc) and (d[v] > d[u]+a[u,v]) then
                  d[v]:=d[u]+a[u,v];
        until u = 0;
end;

Procedure Check(u:longint);
var
        i,j     :longint;
begin
        for i:=1 to n do
          if (avail[i]=0) and (a[u,i] < maxc) then
            begin
                for j:=0 to n do
                  begin
                      d[j]:=maxd;
                      cx[j]:=0;
                  end;
                cx[u]:=1;
                d[i]:=a[u,i];
                ijk;
                for j:=1 to n do
                  if (cx[j]=1) and (j<>u) and (j<>i) and (a[j,u] < maxc) then
                    res:=min(res,d[j]+a[j,u]);
            end;
end;

Procedure Sol;
var
        i       :longint;
begin
        res:=high(longint);
        fillchar(avail,sizeof(avail),0);
        for i:=1 to n do
          begin
              avail[i]:=1;
              check(i);
          end;
        if res=high(longint) then res:=0;
end;

Procedure xuat;
begin
        assign(output,fo);
        rewrite(output);
        write(res);
        close(output);
end;

Begin
        nhap;
        Sol;
        xuat;
End.

