Const
        oo=1000000007;
Var     n,m,k,l:longint;
        mu,f:array [1..4] of int64;
        res:int64;
        fi,fo:text;

Procedure Doc;
        Begin
                Read(fi,m,n,k);
        end;

Procedure Khoitao;
        Var i:longint;
        Begin
                For i:=1 to 4 do mu[i]:=1;
                For i:=1 to n do
                 Begin
                        mu[2]:=(mu[2]*2) mod oo;
                        mu[3]:=(mu[3]*3) mod oo;
                        mu[4]:=(mu[4]*4) mod oo;
                 end;
                f[1]:=1;
                f[2]:=((mu[2]-2*f[1]) mod oo+oo) mod oo;
                f[3]:=((mu[3]-3*f[2]-3*f[1]) mod oo+oo) mod oo;
                f[4]:=((mu[4]-4*f[3]-6*f[2]-4*f[1]) mod oo+oo) mod oo;
        end;

Procedure Lam;
        Var i,j:longint;
           tg,x,tg1:int64;
        Begin
                Khoitao;
                tg:=mu[4];
                For l:=1 to k-1 do
                 Begin
                        If l=1 then x:=4
                        else If l=2 then x:=6
                        else If l=3 then x:=4;
                        tg1:=f[l];
                        tg1:=(x*tg1) mod oo;
                        tg:=(tg-tg1+oo) mod oo;
                 end;
                res:=1;
                For i:=1 to m do res:=(res*tg) mod oo;
        end;

Procedure Inkq;
        Begin
                Write(fo,res);
        end;

        Begin
                Assign(fi,'Flower.inp');Reset(fi);
                Assign(fo,'Flower.out');Rewrite(fo);
                        Doc;
                        Lam;
                        Inkq;
                Close(fo);Close(fi);
        end.
