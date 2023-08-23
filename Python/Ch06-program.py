## Program 1 ##
'''
## declartion global variable part
i, k, guguLine = 0, 0, ""

## main code part ##
for i in range(2, 10) :
    guguLine += ("#  %d단  #" %i)

print(guguLine)

for i in range(1, 10) :
    guguLine = ""
    for k in range(2, 10) :
        guguLine = guguLine + str(" %2d X %2d = %2d " %(k, i, k * i))
    print(guguLine)
'''


## Program 2 ##

## declartion global variable part
i, k = 0, 0

## main code part ##
i = 0
while i < 9 :
    if i < 5:
        k = 0
        while k < 4 - i :
            print(' ', end = '')
            k += 1
        k = 0
        while k < (i * 2) + 1 :
            print('\u2605', end = '')
            k += 1

    else :
        while k < i - 4 :
            print(' ', end = '')
            k += 1
        k = 0
        while k < ((9 - i) * 2) - 1 :
            print('\u2605', end = '')
            k += 1
    print()
    i += 1
