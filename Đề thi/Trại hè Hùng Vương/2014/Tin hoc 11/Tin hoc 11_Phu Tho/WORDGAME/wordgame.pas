const           MAX             =100;
                fi              ='wordgame.inp';
                fo              ='wordgame.out';
                tx              :array[1..4]of longint = (0,1,0,-1);
                ty              :array[1..4]of longint = (1,0,-1,0);


var
                a               :array[0..MAX]of string;
                fx              :array[1..MAX,1..MAX,0..MAX]of int64;
                dx              :array[1..MAX,1..MAX,0..MAX]of longint;
                next            :array[0..MAX,'A'..'Z']of longint;
                m,n,NMOD        :longint;
                w               :string;

procedure docf;
var f   :text;
    i   :longint;
 begin
   assign(f,fi); reset(f);
   readln(f,m,n,NMOD);
   readln(f,w);
   for i:=1 to m do readln(f,a[i]);
   close(f);
 end;

procedure chuanbi;
var i,j :longint;
    ch  :char;
    s2  :string;
 begin
   for i:=0 to length(w)-1 do
   for ch:='A' to 'Z' do
 begin
      s2:=copy(w,1,i);
      s2:=s2+ch;
      while (s2<>'')and(copy(w,1,length(s2))<>s2) do delete(s2,1,1);
      next[i,ch]:=length(s2);
   end;
   for ch:='A' to 'Z' do next[length(w),ch]:=length(w);
 end;

function tinh(i,j,p:longint):int64;
var x,y,np :longint;
    sum    :int64;
 begin
    if dx[i,j,p]=1 then exit(fx[i,j,p]);
    dx[i,j,p]:=1;

    if (i=m) and (j=n) then begin
      fx[i,j,p]:=ord(p=length(w));
      exit(fx[i,j,p]);
    end;

    sum:=0;
    if j<n then sum:=sum + tinh(i,j+1,next[p,a[i,j+1]]);
    if i<m then sum:=sum + tinh(i+1,j,next[p,a[i+1,j]]);

    sum:=sum mod NMOD;
    fx[i,j,p]:=sum;
    exit(sum);

 end;

procedure ghikq;
var f   :text;
 begin
   assign(f,fo);
   rewrite(f);
   writeln(f,tinh(1,1,next[0,a[1,1]]));
   close(f);
 end;

BEGIN
   docf;
   chuanbi;

   ghikq;
END.
