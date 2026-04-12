Const fi='CHUSO.inp';
      fo='CHUSO.out';
Var   f:text;
      a0, a1:String;
      N,len,M:longint;
Procedure readfile;
Begin
     Assign(f,fi);
     reset(f);
     readln(f,a0);
     readln(f,N,M);
     close(f);
End;
Procedure Init_a1;
var i:integer;
     dao:string;
Begin
    dao:='';
    For i:=length(a0) downto 1 do dao :=dao+a0[i];
    a1:=a0+dao;
    writeln('a1=',a1);
    len:=length(a1);
End;
Procedure Find;
Var mu2:Longint;
     i:integer;
Begin
     Assign(f,fo);
     Rewrite(f);
     a1[0]:=a1[len];
     mu2:=1;
     For i:=1 to n do mu2:=mu2*2;
     WRITEln(length(a0)*mu2);
     If M> length(a0)*mu2 then write(f,-1)
     Else
     begin
        If M mod len=0 then write(f,a1[len])
        else
        write(f,a1[M mod len]);

     end;
     close(f);
ENd;
Begin
    Readfile;
    Init_a1;
    Find;
End.
