uses math;
const
        tfi     =       'shortest.inp';
        tfo     =       'shortest.out';
        oo=100000000000;
var
        fo,fi   :       text;
        n,m,nh:longint;
        res:int64;
        head:array[1..20000]of longint;
        ke,nx,ts:array[1..100000]of longint;
        h,h1:array[1..4*20000]of longint;
        f:array[1..20000,1..2]of int64;
        vt:array[1..20000,1..2]of longint;
procedure nhap;
  var i,x,y:longint;
  begin
       assign(fi,tfi);reset(fi);
       assign(fo,tfo);rewrite(fo);
         read(fi,n,m);
         for i:=1 to m do
           begin
                read(fi,x,y,ts[i]);
                ke[i]:=y;
                nx[i]:=head[x];
                head[x]:=i;
           end;
  end;
procedure doi(var q,w:longint);var t:longint;begin t:=q;q:=w;w:=t end;
procedure up(i:longint);
  var j:longint;
  begin
        j:=i shr 1;
        if (i=1) or (f[h[i],h1[i]]>=f[h[j],h1[j]]) then exit;
        doi(h[i],h[j]);
        doi(h1[i],h1[j]);
        doi(vt[h[i],h1[i]],vt[h[j],h1[j]]);
        up(j);
  end;
procedure down(i:longint);
  var j:longint;
  begin
       j:=2*i;
       if j>nh then exit;
       if (j<nh) and (f[h[j],h1[j]]>f[h[j+1],h1[j+1]]) then inc(j);
       if f[h[i],h1[i]]>f[h[j],h1[j]] then
         begin
              doi(h[i],h[j]);
              doi(h1[i],h1[j]);
              doi(vt[h[i],h1[i]],vt[h[j],h1[j]]);
              down(j);
         end;
  end;
procedure push(x,y:longint);
  begin
        inc(nh);
        h[nh]:=x;
        h1[nh]:=y;
        vt[x,y]:=nh;
        up(nh);
  end;
procedure pop(var x,y:longint);
  begin
         x:=h[1];
         y:=h1[1];
         h[1]:=h[nh];
         h1[1]:=h1[nh];
         vt[h[1],h1[1]]:=1;
         dec(nh);
         down(1);
  end;
procedure xl;
  var t,k,i,j,u,v:longint;
      tg:int64;
  begin
        nh:=0;
        for i:=1 to n do
          begin
               f[i,1]:=oo;
               f[i,2]:=2*oo;
          end;
        f[1,1]:=0;
        push(1,1);
        repeat
               pop(u,t);
               j:=head[u];
               while j<>0 do
                 begin
                       v:=ke[j];
                       tg:=ts[j]+f[u,t];
                       if tg<f[v,1] then
                         begin
                               f[v,2]:=f[v,1];
                               f[v,1]:=tg;
                               if vt[v,1]=0 then push(v,1)
                                else up(vt[v,1]);
                               if vt[v,2]=0 then push(v,2)
                                else up(vt[v,2]);
                         end
                       else
                       if (f[v,1]<tg) and (tg<f[v,2]) then
                         begin
                               f[v,2]:=tg;
                               if vt[v,2]=0 then push(v,2)
                                else up(vt[v,2]);
                         end
                       else
                       if (tg>f[v,2]) then
                         begin
                         end;
                       j:=nx[j];
                 end;
               if nh=0then break;
        until false;
        if (f[n,2]=oo) or (f[n,2]=2*oo) then write(fo,-1) else write(fo,f[n,2]);
  end;
begin
      nhap;
      xl;
      close(fo);
      close(fi);
end.
