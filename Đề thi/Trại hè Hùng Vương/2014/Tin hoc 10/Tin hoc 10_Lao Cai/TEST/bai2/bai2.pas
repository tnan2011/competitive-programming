const
    fi='D:\room.inp';
    fo='D:\room.out';
type
   mang=array[0..16000] of longint;
   m2=array[0..16000] of longint;
   m3=array[0..16000] of word;
var a,b:mang;
c:m3;
dem,i,t: longint;
d:m2;
n: longint;
f: text;
procedure doc;
var i,j: longint;
begin
assign(f,fi);
reset(f);
readln(f,n);
for i:=1 to n do
  begin
     readln(f,a[i],b[i],c[i]);
     b[i]:=b[i]+a[i];
  end;
writeln;
close(f);
end;
procedure qsort(var b:mang);
procedure sort(x,y: longint);
var i,j,mid,tg,tg1,tg2: longint;
begin
  mid:=b[(x+y) div 2];
  i:=x;j:=y;
  repeat
     while b[i] < mid do inc(i);
     while b[j]> mid do dec(j);
     if i<=j then
     begin
     tg:=b[i];b[i]:=b[j];b[j]:=tg;
     tg1:=a[i];a[i]:=a[j];a[j]:=tg1;
    tg2:=c[i];c[i]:=c[j];c[j]:=tg2;
    inc(i) ;
    dec(j);
    end;
    until i>j;
    if j>x then sort(x,j);
    if i<y then sort(i,y);
    end;
    begin
      sort(1,n);
      end;
    function max(x,y:longint):longint;
    begin
    if x>y then max:=x else max:=y;end;
procedure xuli;
    var i,j: longint;
 begin
    for i:=0 to n do d[i]:=0;
    b[0]:=0;
    for i:=1to n do
    begin
      for j:=i-1 downto 0 do
      if a[i]>b[j] then
      begin
      d[i]:=max(d[i-1],d[j]+c[i]);
      break;
    end;
  end;
  end;
procedure ghi;
      var i,j: longint;
begin
      assign(f,fo);
      rewrite(f);
      write(f,d[n]);
      close(f);
       end;
begin
       doc;
       qsort(b);
       xuli;
       ghi;
       readln;
end.

