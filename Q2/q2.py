import numpy as np
import matplotlib.pyplot as plt
with open(file="data.txt",mode="r")as f:
    y=f.readlines()
    for i in range(0,len(y)):
        y[i]=float(y[i])
with open(file="correlation.txt",mode="r")as f:
    c=f.readlines()
    for i in range(0,len(c)):
        c[i]=float(c[i])
with open(file="correlation2.txt",mode="r")as f:
    c2=f.readlines()
    for i in range(0,len(c2)):
        c2[i]=float(c2[i])


1
# n=100
# count, bin ,patches= plt.hist(y,np.linspace(0,1,n),density=True,color="white",)
# x = (bin[:-1] + bin[1:]) / 2
# plt.scatter(x, count,label=True)

# plt.title(f"Probablity distribution of random number generator,{n} bins",fontsize=20)
# plt.xlabel("Bins",fontsize=20)
# plt.ylabel("Counts",fontsize=20)

# 2

# plt.scatter(y[:10000],y[1:10001])
# plt.title("scatter plot of 10000 random numbers",fontsize=20)
# plt.xlabel("xith random number",fontsize=20)
# plt.ylabel("x(i+1)th random number",fontsize=20)
# # 3

l=k=3000
# k=l=100000
plt.scatter(np.linspace(1,k,k),c[:k],alpha=0.5,color="red",label="1000000 numbers")
plt.scatter(np.linspace(1,l,l),c2[:l],alpha=0.5,color="blue",label="10000 numbers")
plt.title(f"Plot of autocorelation of first {k-1} numbers",fontsize=20)
plt.ylabel("autoCorelation",fontsize=20)
plt.xlabel("C(ith)",fontsize=20)
plt.legend()
# plt.ylim(-0.01,0.01)

plt.show()