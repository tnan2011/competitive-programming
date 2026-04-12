program LHSEQ;
uses    math;
const   fi='lhseq.inp';
        fo='lhseq.out';
        maxn=5*trunc(1e4)+5;
type    e=record
        v,p:longint;
        end;
        arr=array[1..maxn] of longint;
var     b,a,x:array[1..maxn] of e;
        n,t,tt,i:longint;
        f1,f2:arr;
        inp,oup:text;

function comp(a,b:e):boolean;
begin
        if a.v<b.v then exit(true);
        if a.v>b.v then exit(false);
        if a.p<b.p then exit(true);
        exit(false);
end;

function findMaxVal(key:longint):longint;
var     l,r,m,k:longint;
begin
        k:=0;l:=1;r:=n;
        while l<=r do begin
                m:=(l+r) shr 1;
                if a[m].v<=key then begin
                        k:=m;
                        l:=m+1;
                end
                else    r:=m-1;
        end;
        exit(k);
end;

function findMinVal(key:longint):longint;
var     l,r,m,k:longint;
begin
        k:=0;l:=1;r:=n;
        while l<=r do begin
                m:=(l+r) shr 1;
                if a[m].v>=key then begin
                        k:=m;
                        r:=m-1;
                end
                else    l:=m+1;
        end;
        exit(k);
end;

function findPos(l,r,key:longint):longint;
var     m,k:longint;
begin
        k:=0;
        while l<=r do begin
                m:=(l+r) shr 1;
                if a[m].p<=key then begin
                        k:=a[m].p;
                        l:=m+1;
                end
                else    r:=m-1;
        end;
        exit(k);
end;

procedure sort(l,r:longint);
var     i,j:longint;
        p,t:e;
begin
        if l>=r then exit;
        i:=l;j:=r;
        p:=a[random(r-l+1)+l];
        repeat
                while comp(a[i],p) do inc(i);
                while comp(p,a[j]) do dec(j);
                if i<=j then begin
                        if i<j then begin
                                t:=a[i];a[i]:=a[j];a[j]:=t;
                        end;
                        inc(i);dec(j);
                end;
        until i>j;
        sort(l,j);sort(i,r);
end;

procedure DP(var f:arr);
var     i,j,l,r:longint;
begin
        for i:=1 to n do begin
                f[i]:=1;
                l:=findminval(x[i].v-1);
                r:=findmaxval(x[i].v-1);
                if a[l].v<>x[i].v-1 then continue;
                j:=findpos(l,r,x[i].p-1);
                if j<>0 then
                f[i]:=max(f[i],f[j]+1);
        end;
end;

procedure reverse;
var     i:longint;
begin
        b:=x;
        for i:=1 to n do x[i]:=b[n-i+1];
        for i:=1 to n do x[i].p:=i;
        a:=x;sort(1,n);
end;

procedure Output;
var     i,res:longint;
begin
        res:=0;
        for i:=1 to n do
        res:=max(res,2*min(f1[i],f2[n-i+1])-1);
        if res<3 then res:=n+1;
        writeln(oup,n-res);
end;

begin
        assign(inp,fi);reset(inp);
        assign(oup,fo);rewrite(oup);
        readln(inp,t);
        for tt:=1 to t do begin
                readln(inp,n);
                for i:=1 to n do begin read(inp,a[i].v);a[i].p:=i;end;
                x:=a;
                Sort(1,n);
                DP(F1);
                Reverse;
                DP(F2);
                Output;
        end;
        close(inp);close(oup);
end.
