#include<stdio.h>
#define M 55
int f[M];
int g[M];
int cal(int n,int k){
    if(n<=1) return g[n];
    if(k<=f[n-2]) return cal(n-2,k);
    return cal(n-1,k-f[n-2])+g[n-2];
}
main(){
   f[0]=1;
   f[1]=1;
   g[0]=1;
   g[1]=0;
   for(int i=2;i<=45;i++)  f[i]=f[i-1]+f[i-2];
   for(int i=2;i<=45;i++) g[i]=g[i-1]+g[i-2];
   int n,k;
   int Test;
   scanf("%d",&Test);
   while(Test>0){
   scanf("%d %d",&n,&k);
   printf("%d\n",cal(n,k));
   Test--;
   }
}
