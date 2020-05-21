import subprocess
import matplotlib.pyplot as plt
import numpy as np

def plot_dp_dist(dist, f):
    X = []
    Y = []
    for x in dist:
        j = len(x)
        for i in range(0, len(x)):
            if x[i] == ' ':
                j = i;
                break;
        X.append(int(x[:j]))
        Y.append(int(x[j+1:]))
    plt.bar(X, Y, color="#444444", label="No. of writes")
    plt.legend()
    plt.title(f + " test bench data page writes distribution")
    plt.xlabel("Bin number (where each bin contains 4096 page frams)")
    plt.ylabel("No. of writes")
    plt.savefig(f + '_dp_dist_plot.png')
    plt.close()

def plot_all_dist(dist, f):
    X = []
    Y = []
    for x in dist:
        j = len(x)
        for i in range(0, len(x)):
            if x[i] == ' ':
                j = i;
                break;
        X.append(int(x[:j]))
        Y.append(int(x[j+1:]))
    plt.bar(X, Y, color="#444444", label="No. of writes")
    plt.legend()
    plt.title(f + " test bench all writes distribution")
    plt.xlabel("Bin number (where each bin contains 4096 page frams)")
    plt.ylabel("No. of writes")
    plt.savefig(f + '_all_dist_plot.png')
    plt.close()

def main():
    subprocess.call(["g++", "analysis.cpp"])
    tmp = subprocess.call("./a.out")
    files = ["webproxy", "fileserver", "varmail"]
    for f in files:
        all_dist = open(f + "_all_dist.dat");
        dp_dist = open(f + "_dp_dist.dat");
        plot_all_dist(all_dist, f)
        plot_dp_dist(dp_dist, f)


if __name__ == "__main__":
    main()


# f = open("bex3.txt", "r")
# cnt = 0
# X = []
# Y = []
# for x in f:
#     j = 0
#     for i in range(0, len(x)):
#         if x[i] == ' ':
#             j = i
#             break
#     X.append(cnt)
#     Y.append(int(x[i+1:]))
#     cnt += 1
#     #print(x[i+1:])
# # print(X)
# # print(Y)
# # plt.hist(Y, bins=100)
# x = np.arange(len(X))
# fig, ax = plt.subplots()
# width = 0.35
# rects1 = ax.bar(x - width/2, Y, width, label='No. of Writes')
# fig.tight_layout()
# plt.show()
