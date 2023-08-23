'''
# Code 09-05

## Declartion function part ##
def calc(v1, v2, op) :
    result = 0
    if op == '+' :
        result = v1 + v2
    elif op == '-' :
        result = v1 - v2
    elif op == '*' :
        result = v1 * v2
    elif op == '/' :
        result = v1 /v2

    return result

## Declartion global variable part ##
res = 0
var1, var2, oper = 0, 0, ""

## Main code part ##
oper = input("계산을 입력하세요(+, -, *, /) : ")
var1 = int(input("첫 번째 수를 입력하세요 : "))
var2 = int(input("두 번째 수를 입력하세요 : "))

res = calc(var1, var2, oper)

print("## 계산기 : %d %s %d = %d" % (var1, oper, var2, res))
'''

'''
# Code 09-07

## Declartion function part ##
def func1() :
    global a
    a = 10
    print("func1()에서 a값 %d" % a)

def func2() :
    print("func2()에서 a값 %d" % a)

## Declartion function variable part ##
a = 20 # Global variable

## Main code part ##
func1()
func2()
'''

'''
# Code 09-09

## Declartion function part ##
def multi(v1, v2) :
    retList = []
    res1 = v1 + v2
    res2 = v1 - v2
    retList.append(res1)
    retList.append(res2)
    return retList

## Declartion global variable part ##
myList = []
hap, sub = 0, 0

## Main code part ##
myList = multi(100, 200)
hap = myList[0]
sub = myList[1]
print("multi()에서 돌려준 값 ==> %d, %d" % (hap, sub))
'''

'''
# Program 01
import random

## Declartion function part ##
def getNumber():
    return random.randrange(1, 46)

## Declartion function part ##
lotto = []
num = 0

## Main code part ##
print("** 로또 추첨을 시작합니다. **\n")

while True :
    num = getNumber()

    if lotto.count(num) == 0 :
        lotto.append(num)

    if len(lotto) >= 6 :
        break

print("추첨된 로또 번호 ==> ", end = '')
lotto.sort()
for i in range(0, 6) :
    print("%d " % lotto[i], end = '')
'''

'''
# Program 02
import random
from tkinter.simpledialog import *

def getString() :
    retStr = ''
    retStr = askstring('문자열 입력', '거북이 쓸 문자열을 입력')
    return retStr

def getRGB() :
    r, g, b = 0, 0, 0
    r = random.random()
    g = random.random()
    b = random.random()
    return(r, g, b)

def getXYAS(sw, sh) :
    x, y, angle, size = 0, 0, 0, 0
    x = random.randrange(-sw / 2, sw / 2)
    y = random.randrange(-sh / 2, sh / 2)

    angle = random.randrange(0, 360)
    size = random.randrange(10, 50)
    return [x, y, angle, size]
'''

'''
# function lamda example

def hap(a, b) :
    res = a + b
    return res

print(hap(10, 20))


hap = lambda a, b : a + b
print(hap(10, 20))

'''


# 응용예제 02
from time import *
from datetime import *

## Declartion function part ##
def countDays(date1, date2) :
    retDays = 0
    year, month, day = date1.split('/')
    sDay = date(int(year), int(month), int(day))
    year, onth, day = date2.split('/')
    eDay = date(int(year), int(month), int(day))
    diffDays = eDay - sDay
    retDays = diffDays.days
    return retDays

def getDay(t) :
    weeks = ['월', '화', '수', '목', '금', '토', '일']
    return weeks[t.tm_wday]

## Declartion global variable part ##
startDate, curDate, tm = '', '', None

## Main code part ##
if __name__ == "__main__" :

    startDate = input('시작 날짜(연/월/일) -->')
    tm = localtime()
    curDate = str(tm.tm_year) + '/' + str(tm.tm_on) + '/' + str(tm.tm_mday)

    print(startDate, '부터 오늘(', curDate, ')까지는 ', countDays(startDate, curDate), '일이 지났습니다')
    print('그리고 오늘은', getDay(tm), '요일입니다.')