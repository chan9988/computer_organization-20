#include <iostream>
#include <stdio.h>
#include <math.h>
#include <vector>

using namespace std;

struct cache_content
{
	bool v;
	unsigned int tag;
    // unsigned int	data[16];
};

const int K = 1024;

int log2(int n1)
{  
    // log(n) / log(2) is log2.
    //return log(n) / log(double(2));
	int m=0;
	while(n1>1){
		m++;
		n1/=2;
	}
	return m;
}


void simulate(int cache_size, int block_size, int m)
{
	unsigned int tag, index, x;
    int i,j;
    int m1=(int)log2(m);
	int offset_bit = (int)log2(block_size);
	int index_bit = (int)log2(cache_size / block_size);
	int line = cache_size >> (offset_bit);
    line/=m;
    vector<cache_content> a[line];
	
    //cout << "cache line: " << line << endl;
    FILE *fp = fopen("LU.txt", "r");  // read file
	double miss=0,accesses=0;
	while(fscanf(fp, "%x", &x) != EOF)
    {
		index = x >> offset_bit;
		tag = x >> (index_bit + offset_bit - m1);
        bool ch=false;
        for(i=0;i<a[index%line].size();i++){
            if(a[index%line][i].tag==tag&&a[index%line][i].v){    //hit
                cache_content ne1;
                ne1=a[index%line][i];
                accesses++;
                ch=true;
                for(j=i;j<a[index%line].size()-1;j++){
                    a[index%line][j]=a[index%line][j+1];
                }
                a[index%line][j]=ne1;
                break;
            }
        }
        if(ch==false){                  //miss
            accesses++;
            miss++;
            cache_content ne;
            ne.tag=tag;
            ne.v=true;
            if(a[index%line].size()<m){
                a[index%line].push_back(ne);
            }
            else if(a[index%line].size()==m){                       //LRU
                a[index%line].erase(a[index%line].begin());
                a[index%line].push_back(ne);
            }
        }
	}
	fclose(fp);
	cout << miss/accesses << endl;
}
	
int main()
{
	// Let us simulate 4KB cache with 16B blocks
    cout << "2-way set-associative, cache size: 4K, block size: 64B" << endl;
	simulate(4 * K, 64, 2);
    cout << "2-way set-associative, cache size: 16K, block size: 64B" << endl;
    simulate(16 * K, 64, 2);
    cout << "2-way set-associative, cache size: 64K, block size: 64B" << endl;
    simulate(64 * K, 64, 2);
    cout << "2-way set-associative, cache size: 256K, block size: 64B" << endl;
    simulate(256 * K, 64, 2);
    
    cout << endl;
    cout << "4-way set-associative, cache size: 4K, block size: 64B" << endl;
	simulate(4 * K, 64, 4);
    cout << "4-way set-associative, cache size: 16K, block size: 64B" << endl;
    simulate(16 * K, 64, 4);
    cout << "4-way set-associative, cache size: 64K, block size: 64B" << endl;
    simulate(64 * K, 64, 4);
    cout << "4-way set-associative, cache size: 256K, block size: 64B" << endl;
    simulate(256 * K, 64, 4);
    
    cout << endl;
    cout << "8-way set-associative, cache size: 4K, block size: 64B" << endl;
	simulate(4 * K, 64, 8);
    cout << "8-way set-associative, cache size: 16K, block size: 64B" << endl;
    simulate(16 * K, 64, 8);
    cout << "8-way set-associative, cache size: 64K, block size: 64B" << endl;
    simulate(64 * K, 64, 8);
    cout << "8-way set-associative, cache size: 256K, block size: 64B" << endl;
    simulate(256 * K, 64, 8);
    
    cout << endl;
    cout << "16-way set-associative, cache size: 4K, block size: 64B" << endl;
	simulate(4 * K, 64, 16);
    cout << "16-way set-associative, cache size: 16K, block size: 64B" << endl;
    simulate(16 * K, 64, 16);
    cout << "16-way set-associative, cache size: 64K, block size: 64B" << endl;
    simulate(64 * K, 64, 16);
    cout << "16-way set-associative, cache size: 256K, block size: 64B" << endl;
    simulate(256 * K, 64, 16);
    cout << endl;
    return 0;
}
