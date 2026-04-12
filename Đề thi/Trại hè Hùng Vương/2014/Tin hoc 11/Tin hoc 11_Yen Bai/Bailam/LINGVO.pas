uses    math;

const   fi='LINGVO.INP';
        fo='LINGVO.OUT';

var     a:array[-1..9] of ansistring;
        s:ARRAY[0..2001] of ansistring;
        n:longint;


procedure nhap;
var     ss:ansistring;
        i,j,z:longint;
begin
        readln(ss);
        readln(n);
        i:=1;
        z:=-1;
        a[z]:='a';
        while 2>1 do
                begin
                        if z=8 then
                                begin
                                        a[9]:=ss;
                                        break;
                                end
                          else if ss[i]=' ' then
                                begin
                                        inc(z);
                                        a[z]:=copy(ss,1,i-1);
                                        delete(ss,1,i);
                                        i:=0;
                                end;
                        inc(i);
                end;
end;


procedure xl;
var     s:ansistring;
        z,j,m,x,i:longint;
begin
        for i:=1 to n do
                begin
                        readln(s);
                        m:=-1;
                        for j:=1 to length(s) do
                                begin
                                        val(s[j],x);
                                        if a[x]>a[m] then m:=x;
                                end;
                        writeln(a[m]);
                end;
end;


begin
        assign(input,fi);       reset(input);
        assign(output,fo);      rewrite(output);
        nhap;
        xl;
        close(input);
        close(output);
end.

