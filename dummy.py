import numpy as np
import matplotlib.pyplot as plt
with open(file="random.dat",mode="r")as f:
    y=f.readlines()
    for i in range(0,len(y)):
        y[i]=float(y[i])
l=len(y)

plt.scatter(np.linspace(1,l,l),y[:l],alpha=0.5,color="blue")

plt.ylabel("autoCorelation",fontsize=20)
plt.xlabel("C(ith)",fontsize=20)
plt.show()
