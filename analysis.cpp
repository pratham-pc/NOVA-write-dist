#include <bits/stdc++.h>

#define llu long long unsigned int

using namespace std;

int main(int argc, char **argv) {
	vector<string> files;
	files.push_back("webproxy");
	files.push_back("fileserver");
	files.push_back("varmail");
	int t;
	for (t = 0; t < 3; t++) {
		map<llu, llu> dp_write_dist;
		map<llu, llu> jp_write_dist;
		map<llu, llu> in_write_dist;
		map<llu, llu> all_writes_bin_dist;
		map<llu, llu> dp_writes_bin_dist;

		ifstream raw_write_dist;
		ofstream all_bins_dist_file;
		ofstream dp_bins_dist_file;
		all_bins_dist_file.open(files[t] + "_all_dist.dat");
		dp_bins_dist_file.open(files[t] + "_dp_dist.dat");

		llu page_addr, size, total_writes = 0; 
		llu jp_writes = 0, in_writes = 0, dp_writes = 0, i;

		//set the starting offset, which is 4GB
		llu starting_offset = (4 * 1024 * 1024);
		starting_offset *= 1024;

		raw_write_dist.open(files[t] + "_sorted.dat");

		if (!raw_write_dist) {
			cerr << "Unable to open file " << files[t] << "_trace.dat" << endl;
			exit(1);
		}

		//initialize maps
		for (i = 0; i < 128; i++) {
			all_writes_bin_dist[i] = 0;
			dp_writes_bin_dist[i] = 0;
		}

		while (raw_write_dist >> page_addr && raw_write_dist >> size) {
			llu page_no = (page_addr - starting_offset)/4096;
			llu j;
			// journal page
			if (page_no >= 48 && page_no <= 63) {
				jp_write_dist[page_no]++;
				all_writes_bin_dist[page_no/4096]++;
				jp_writes++;
				continue;
			}
			// if inode accessed
			if (size == 128) {
				in_write_dist[page_no]++;
				all_writes_bin_dist[page_no/4096]++;
				in_writes++;
				continue;
			}
			//data page write
			for (j = 0; j < size; j+=4096) {
				dp_write_dist[page_no + j/4096]++;
				all_writes_bin_dist[(page_no + j/4096)/4096]++;
				dp_writes_bin_dist[(page_no + j/4096)/4096]++;
				dp_writes++;
			}
		}
		total_writes = dp_writes + jp_writes + in_writes;
		for (auto it = all_writes_bin_dist.begin(); it != all_writes_bin_dist.end(); it++) {
			all_bins_dist_file << it->first << " " << it->second << endl;
		}
		for (auto it = dp_writes_bin_dist.begin(); it != dp_writes_bin_dist.end(); it++) {
			dp_bins_dist_file << it->first << " " << it->second << endl;
		}
		cout << "Total writes in testbench: " << files[t] << " is: " << total_writes << endl;
		raw_write_dist.close();
		dp_bins_dist_file.close();
		all_bins_dist_file.close();
	}
	return 0;
}
