'''
# Program 01

## Declartion Variable Part ##
inStr, outStr = "", ""
count, i = 0, 0

## Main Code Part ##
inStr = input("문자열을 입력하세요 : ")
count = len(inStr)

for i in range(0, count) :
    outStr += inStr[count - (i + 1)]

print("내용을 거꾸로 출력 --> %s" % outStr)
'''

'''
# Code 08-03
ss = input("입력 문자열 ==> ")
print("출력 문자열 ==> ", end = '')

if ss.startswith('(') == False :
    print("(", end = '')

print(ss, end = '')

if ss.endswith(')') == False :
    print(")", end = '')
'''

'''
# Code 08-04
inStr = "  한글 Python 프로그래밍  "
outStr = ""

for i in range(0, len(inStr)) :
    if inStr[i] != ' ' :
        outStr += inStr[i]

print("원래 문자열 ==> " + '[' + inStr + ']')
print("공백 삭제 문자열 ==> " + '[' + outStr + ']')
'''

'''
# Code 08-06
ss = input("날짜(연/월/일)입력 ==> ")

ssList = ss.split('/')

print("입력한 날짜의 10년 후 ==> ", end = '')
print(str(int(ssList[0]) + 10) + "년", end = '')
print(ssList[1] + "월", end = '')
print(ssList[2] + "일")
'''

'''
# Program 02
import turtle
import random
from tkinter.simpledialog import *

## Declartion global variable part ##
inStr = ''
swidth, sheight = 300, 300
tX, tY, txtSize = [0] * 3

## Main code ##
turtle.title('거북이 글자쓰기')
turtle.shape('turtle')
turtle.setup(width = swidth + 50, height = sheight + 50)
turtle.screensize(swidth, sheight)
turtle.penup()

inStr = askstring('문자열 입력', '거북이 쓸 문자열을 입력')

for ch in inStr :
    tX = random.randrange(-swidth / 2, swidth / 2)
    tY = random.randrange(-sheight / 2, sheight / 2)
    r = random.random()
    g = random.random()
    b = random.random()
    txtSize = random.randrange(10, 50)

    turtle.goto(tX, tY)

    turtle.pencolor((r, g, b))
    turtle.write(ch, font=('맑은 고딕', txtSize, 'bold'))  # 글자 스타일 , 글자 크기, 볼드(굵게)

turtle.done()
'''


# 응용예제 01

## Declartion global variable part ##
inStr, outStr = "", ""
ch = ""
count, i = 0, 0

## Main code part ##
if __name__ == "__main__" :
    inStr = input("문자열을 입력하세요 : ")
    count = len(inStr)

    for i in range(0, count) :
        ch = inStr[i]
        if (ord(ch) >= ord("A") and ord(ch) <= ord("Z")) :
            newCh = ch.lower()
        elif (ord(ch) >= ord("a") and ord(ch) <= ord("z")) :
            newCh = ch.upper()
        else :
            newCh = ch

        outStr += newCh

    print("대소문자 변환 결과 --> %s" % outStr)