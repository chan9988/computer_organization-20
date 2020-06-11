#include <iostream>
#include <stdio.h>
#include <math.h>

using namespace std;

struct cache_content
{
	bool v;
	unsigned int tag;
    // unsigned int	data[16];
};

const int K = 1024;

int log2(int n)
{  
    // log(n) / log(2) is log2.
    //return log(n) / log(double(2));
	int m=0;
	while(n>1){
		m++;
		n/=2;
	}
	return m;
}


void simulate(int cache_size, int block_size)
{
	unsigned int tag, index, x;

	int offset_bit = (int)log2(block_size);
	int index_bit = (int)log2(cache_size / block_size);
	//cout << cache_size << " " << index_bit << " " << offset_bit << endl;
	int line = cache_size >> (offset_bit);
	//cout << line << endl;
	cache_content *cache = new cache_content[line];
	
    //cout << "cache line: " << line << endl;

	for(int j = 0; j < line; j++)
		cache[j].v = false;
	
    FILE *fp = fopen("LU.txt", "r");  // read file
	double miss=0,accesses=0;
	while(fscanf(fp, "%x", &x) != EOF)
    {
		//cout << hex << x << " ";
		index = (x >> offset_bit) & (line - 1);
		tag = x >> (index_bit + offset_bit);
		

		if(cache[index].v && cache[index].tag == tag){
			cache[index].v = true;    // hit
			accesses+=1;
		}
		else
        {
			cache[index].v = true;  // miss
			cache[index].tag = tag;
			accesses+=1;
			miss+=1;
		}
	}
	fclose(fp);
	cout << "miss rate: " << miss/accesses << endl;
	delete [] cache;
}
	
int main()
{
	// Let us simulate 4KB cache with 16B blocks
	cout << "cache size: 4KB , block size: 16B" << endl;
	simulate(4 * K, 16);
	cout << "cache size: 4KB , block size: 32B" << endl;
	simulate(4 * K, 32);
	cout << "cache size: 4KB , block size: 64B" << endl;
	simulate(4 * K, 64);
	cout << "cache size: 4KB , block size: 128B" << endl;
	simulate(4 * K, 128);
	cout << "cache size: 4KB , block size: 256B" << endl;
	simulate(4 * K, 256);
	cout << endl;
	cout << "cache size: 16KB , block size: 16B" << endl;
	simulate(16 * K, 16);
	cout << "cache size: 16KB , block size: 32B" << endl;
	simulate(16 * K, 32);
	cout << "cache size: 16KB , block size: 64B" << endl;
	simulate(16 * K, 64);
	cout << "cache size: 16KB , block size: 128B" << endl;
	simulate(16 * K, 128);
	cout << "cache size: 16KB , block size: 256B" << endl;
	simulate(16 * K, 256);
	cout << endl;
	cout << "cache size: 64KB , block size: 16B" << endl;
	simulate(64 * K, 16);
	cout << "cache size: 64KB , block size: 32B" << endl;
	simulate(64 * K, 32);
	cout << "cache size: 64KB , block size: 64B" << endl;
	simulate(64 * K, 64);
	cout << "cache size: 64KB , block size: 128B" << endl;
	simulate(64 * K, 128);
	cout << "cache size: 64KB , block size: 256B" << endl;
	simulate(64 * K, 256);
	cout << endl;
	cout << "cache size: 256KB , block size: 16B" << endl;
	simulate(256 * K, 16);
	cout << "cache size: 256KB , block size: 32B" << endl;
	simulate(256 * K, 32);
	cout << "cache size: 256KB , block size: 64B" << endl;
	simulate(256 * K, 64);
	cout << "cache size: 256KB , block size: 128B" << endl;
	simulate(256 * K, 128);
	cout << "cache size: 256KB , block size: 256B" << endl;
	simulate(256 * K, 256);
	cout << endl;
	
	return 0;
}
