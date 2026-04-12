#include<stdio.h>
#define MAX 10200
#include<string.h>
int f[MAX];
int a[MAX];
void maximize(int &a,int b){
  if(a<b) a=b;
}
main(){
  // freopen("test.inp","r",stdin);
   memset(f,0,sizeof f);
   int N,K;
   scanf("%d %d",&N,&K);
      for(int i=1;i<=N;i++)
        f[i]=-1000000000;
   for(int i=1;i<=N;i++)
     scanf("%d",&a[i]);
   for(int i=1;i<=N;i++){
       for(int j=1;j<=K;j++){
           if(i-j>=0)
           maximize(f[i],f[i-j]+a[i]);
       }
   }
   int ans=-1000000000;
   for(int i=0;i<=N;i++)
     maximize(ans,f[i]);
   printf("%d",ans);
}
