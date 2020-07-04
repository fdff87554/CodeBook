### EOF
try:
    while True:
        m, n = map(int, input().split())
        print(m, n, end = '\n')
except EOFError:
    pass

### input output

fp = open("in.txt", "r")
fout = open("out.txt", "w")

for testData in fp.readlines():
	pass

#在這裡end的動作會把換行去掉
print("name: {}".format(1), end="", file=fout)

aa = input()
##input: ICEJJ RealYami
ICEJJ, RealYami = input.split()

##input: 3 5
num1, num2 = input.split()
# 做轉型

###初始化list
arr = [0 for i in range(10)]
###陣列元素轉型
arr = [int(x) for i in arr]

###numpy
import numpy as np

arr = np.zeros(shpape = (10, 20))
arr_2 = np.ones(shpape = (20))
arr.T#轉至矩陣

A * B#位置1對1相乘
A.dot(B)#矩陣A * 矩陣B

A + B #矩陣相加
np.array_equal(A, B)#兩矩陣是否一模一樣
np.sum(A) #A所有元素相加
np.sum(A, axis=0)#col 相加
np.sum(A, axis=1)#row 相加W
np.min(A, axis=0)
np.max(A, axis=1)

np.count_nonzero(A)#計算0的數量

###math
import math

math.ceil(x)#上高斯
math.floor(x)#下高斯
math.factorial(x)#接乘
math.fabs(x)#絕對值
math.fsum(arr)#跟sum一樣但更精確(小數點問題)
math.gcd(x, y)#bj4
math.exp(x)#e^x
math.log(x, base)
math.log2(x)#2為底
math.log10(x)#10為底
math.sqrt(x)
math,pow(x, y)#精確些(float型態)
math.sin(x)# cos tan asin acos atan atan2(弧度) sinh cosh tanh acosh asinh atanh
math.hypot(x, y)#歐幾里德範數
math.degrees(x)#x從弧度轉角度
math.radians(x)#x從角度轉弧度
math.gamma(x)#x的gamma函數
math.pi#常數
math.e#常數
math.inf

### ascii

ord(x)#char to asc
chr(x)#asc to char

x.encode().hex()#string to hex


### bin oct hex
x = "11"

int(x, 2)

x = "F"

int(x, 16)

### str

string.isdigit()
string.isalpha()
### reverse string
string = "abc"
string_reverse = string[::-1]