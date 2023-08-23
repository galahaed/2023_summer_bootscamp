# Chapter 04 응용 01
'''
## declartion global variable part ##
year = 0

## main code part ##
if __name__ == "__main__" :
    year = int(input("연도를 입력하세요 :"))

    if ((year % 4 == 0) and (year % 100 != 0)) or (year % 400 == 0) :
        print("%d년은 윤년입니다." %year)

    else :
        print("%d년은 윤년이 아닙니다.")
'''


# Chapter 04 응용 02

import turtle

## declartion global variable part ##
num = 0
swidth, sheight = 1000, 300
curX, curY = 0, 0

## main code part ##
if __name__ == "__main__":
    turtle.title('거북이로 2진수 표현하기')
    turtle.shape('turtle')
    turtle.setup(width = swidth + 50, height = sheight + 50)
    turtle.screensize(swidth, sheight)
    turtle.penup()
    turtle.left(90)

    num = int(input("숫자를 입력하세요: "))
    binary = bin(num)
    curX = swidth / 2
    curY = 0
    for i in range(len(binary) -2) :
        turtle.goto(curX, curY)
        if num & 1:
            turtle.color('red')
            turtle.turtlesize(2)

        else :
            turtle.color('blue')
            turtle.turtlesize(1)

        turtle.stamp()
        curX -= 50
        num = num >> 1

    turtle.done()