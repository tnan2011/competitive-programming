#include <cstdio>
#include <vector>
#include <iostream>
#define PB push_back
#define sz(a) ((int) (a).size())
using namespace std;

typedef vector<char> Int;

void add(Int a, Int b, Int &c){
	c.clear();
	if(sz(a) < sz(b)) swap(a, b);
	int r=0;
	for(int i=0; i<sz(b); i++){
		c.PB( (a[i]+b[i]+r)%10 );
		r=(a[i]+b[i]+r)/10;
	}
	for(int i=sz(b); i<sz(a); i++){
		c.PB( (a[i]+r)%10 );
		r=(a[i]+r)/10;
	}
	if(r) c.PB(1);
}

int main(){
	freopen("sum.inp", "r", stdin);
	freopen("sum.out", "w", stdout);
	int k;
	cin >> k;
	Int ans;
	ans.PB(0);
	string s;
	while(cin >> s){
		if(s.empty()) break;
		Int t;
		for(int j=sz(s)-1; j>=0; j--) t.push_back(s[j]-'0');
		while(t.back()==0){
			if(t.size()==1) break;
			t.pop_back();
		}
		add(ans, t, ans);
	}
	while(k--){
		cout << (int) ans.back();
		ans.pop_back();
	}
}
