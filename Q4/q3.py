import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit




#exp
# with open(file="exp.txt",mode="r")as f:
#     g=f.readlines()
#     for i in range(0,len(g)):
#         g[i]=float(g[i])
        
# count, bin ,patches= plt.hist(g,np.linspace(min(g),max(g),100),density=True,color="white")
# x = (bin[:-1] + bin[1:]) / 2
# def fun(x,a,b):
#     return b*np.e**(-a*x)
# popt, pcov = curve_fit(fun, x,count)
# a,b=popt
# y2=fun(x,a,b)
# plt.scatter(x, count)
# plt.plot(x,y2,color="red")
# plt.suptitle(f"Fittig::y={b}e^(-{a}x)",fontsize=20)
# plt.title("Probablity distribution of 2e^(-2x)",fontsize=20)
# plt.xlabel("Bins",fontsize=20)
# plt.ylabel("counts",fontsize=20)

# gauss
with open(file="gaus.txt",mode="r")as f:
    g=f.readlines()
    for i in range(0,len(g)):
        g[i]=float(g[i])
n=100

count, bin ,patches= plt.hist(g,np.linspace(min(g),max(g),n),density=False)
x = (bin[:-1] + bin[1:]) / 2
def fun(x,a,s,c):
    return c*np.e**((-1/2)*((x-a)/s)**2)
popt, pcov = curve_fit(fun, x,count,p0=[0,2,1])
a,s,c=popt
y2=fun(x,a,s,c)
plt.scatter(x, count,label=f"{n} bins")
plt.plot(x,y2,color="red")
plt.suptitle(f"u={np.round(a,6)},sigma={np.round(s,6)}",fontsize=20)
plt.title("Probablity distribution of gausian function with sd=2",fontsize=20)
plt.legend()
plt.xlabel("Bins",fontsize=20)
plt.ylabel("counts",fontsize=20)

print(min(g),max(g))
# plt.show()