#include <cstdio>
#include <vector>
#define X first
#define Y second
#define sz(a) ((int) (a).size())
using namespace std;
typedef pair<int, int> ii;
const int N=1e5+5;

vector<ii> E[N];
bool check[N];
int lmax=0, sum=0;

void dfs(int u){
	if(sum>lmax) lmax=sum;
	check[u]=true;
	for(int i=0; i<sz(E[u]); i++){
		ii v=E[u][i];
		if(!check[v.X]){
			sum+=v.Y;
			dfs(v.X);
			sum-=v.Y;
		}
	}
}

int main(){
	freopen("one.inp", "r", stdin);
	freopen("one.out", "w", stdout);
	int n, s, a, b, c;
	scanf("%d%d", &n, &s);
	s--;
	int ans=0;
	for(int i=1; i<n; i++){
		scanf("%d%d%d", &a, &b, &c);
		a--;
		b--;
		ans+=c;
		E[a].push_back(ii(b, c));
		E[b].push_back(ii(a, c));
	}
	dfs(s);
	printf("%d", 2*ans-lmax);
}
