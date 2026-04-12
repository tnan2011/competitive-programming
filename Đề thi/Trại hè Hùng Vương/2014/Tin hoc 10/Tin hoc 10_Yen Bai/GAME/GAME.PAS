CONST
        FI='GAME.INP';
        FO='GAME.OUT';
        Nmax=1000000+7;
Var
        N: Longint;
        Sum: Int64;
        A: Array[1..Nmax] of longint;
Procedure Doctep;
Var F: Text;
    i: Longint;
Begin
     Assign(F,fi);
     reset(F);
     Readln(F,N);
     For i:=1 to N do read(F,A[i]);
     Close(F);
End;
Function Max(x, y, z: int64):int64;
Var tam: int64;
Begin
     tam:=x;
     if tam<y then tam:= y;
     if tam<z then tam:= z;
     exit(tam);
End;
Procedure Xuli;
Var i: Longint;
    s1,s2,s3: Int64;
Begin
     if N=1 then Sum:= A[1]
     else
        if N=2 then Sum:=A[1]+A[2]
        else
           if N=3 then Sum := Max(A[1]+A[2],A[2]+A[3],A[3]+A[1])
           else
           Begin
                s1:= A[1];
                s2:= A[1] + A[2];
                s3:= Max(A[1]+A[2],A[2]+A[3],A[3]+A[1]);
                For i:=4 to N do
                  Begin
                        Sum:= Max(s3, s2+a[i], s1+a[i-1]+a[i]);
                        S1 := s2;
                        s2 := s3;
                        s3 := Sum;
                  End;
           End;
End;
Procedure Ghikq;
Var F: Text;
Begin
     Assign(F,fo);
     Rewrite(f);
     Write(f,Sum);
     Close(f);
End;
BEGIN
        DOCTEP;
        XULI;
        GHIKQ;
END.
