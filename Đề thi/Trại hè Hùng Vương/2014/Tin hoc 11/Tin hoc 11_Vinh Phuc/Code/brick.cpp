#include <cstdio>
#include <cmath>
#include <iostream>
using namespace std;


int main(){
	freopen("brick.inp", "r", stdin);
	freopen("brick.out", "w", stdout);
	long long k;
	cin >> k;
	long long ans=0;
	for(long long i=2; i<=10000; i+=2){
		long long l=i+1, r=1000000000;
		int cnt=100;
		while(cnt--){
			long long m=(l+r+1)/2;
			if(m*m-(m-i)*(m-i)>k) r=m;
			else l=m;
		}
		if(l*l-(l-i)*(l-i)<=k) ans+=l-i;
	}
	cout << ans;
}
