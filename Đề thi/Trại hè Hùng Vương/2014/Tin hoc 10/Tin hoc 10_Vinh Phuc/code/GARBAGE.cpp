#include<stdio.h>
#include<map>
#include<string.h>
#include<vector>
using namespace std;
#define ll long long
using namespace std;
typedef struct{
   int t[400];
   int len;
}bignum;
int max(int a,int b){
   if(a>b) return a;
   return b;
}
bignum f[7][120];
bignum unit;
bignum add(bignum A,bignum B){
    bignum C;
    memset(C.t,0,sizeof C.t);
    C.len=max(A.len,B.len);
    int carry=0;
    for(int i=1;i<=C.len;i++){
        C.t[i]=(A.t[i]+B.t[i]+carry)%10;
        carry=(A.t[i]+B.t[i]+carry)/10;
    }
    if(carry>0){
       C.len++;
       C.t[C.len]=1;
    }
    return C;
}
map<char,int> mp;
vector<int> v[8];
bignum cal(int n,int k){
   if(k==1) return unit;
   if(f[n][k].len!=-1) return f[n][k];
   bignum res=unit;
   for(int i=0;i<v[n].size();i++)
     res=add(res,cal(v[n][i],k-1));
   f[n][k]=res;
   return f[n][k];
}
void print(bignum A){
   for(int i=A.len;i>=1;i--)
      printf("%d",A.t[i]);
}
void input(){
   mp['N']=1;
   mp['S']=2;
   mp['W']=3;
   mp['E']=4;
   mp['U']=5;
   mp['D']=6;
   char task[120];
   for(int i=1;i<=6;i++){
        gets(task);
        int l=strlen(task);
        for(int j=0;j<l;j++) if(mp.find(task[j])!=mp.end())v[i].push_back(mp[task[j]]);
   }
   scanf("%s",&task);
   int C=mp[task[0]];
   int k;
   scanf("%d",&k);
   unit.len=1;
   unit.t[1]=1;
   for(int i=1;i<=6;i++)
     for(int j=1;j<=100;j++) f[i][j].len=-1;
   print(cal(C,k));
   //print(unit);
}
main(){
  // freopen("test.inp","r",stdin);
   input();
}
