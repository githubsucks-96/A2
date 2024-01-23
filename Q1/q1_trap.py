import matplotlib.pyplot as plt
import numpy as np
from scipy.optimize import curve_fit
y=[]
with open(file="trap_sin.txt",mode="r") as f:
# with open(file="trap.txt",mode="r") as f:
    y = f.readlines()
    for i in range(0, len(y)):
        y[i] = float(y[i])
x=[]
for i in range(0,len(y)):
    z=10**(i+2)
    x.append(z)


x=np.log(x)
y=np.log(y)

def fun(x,m,c):
    return m*x+c
popt, pcov = curve_fit(fun, x,y)
m,c=popt
x2=np.linspace(min(x),max(x),1000)
y2=fun(x2,m,c)
plt.scatter(x,y,label=f"y={m}*x+{c}")
plt.plot(x2,y2)
plt.xlabel("log(n)",fontsize="20")
plt.ylabel("log(error)",fontsize="20")
plt.legend(fontsize="20")
# plt.title("f(x)=4/(1+x^2)",fontsize="30")
plt.title("f(x)=sin(x)",fontsize="30")

plt.show()