'''
# Code 07-01
a, b, c, d = 0, 0, 0, 0
hap = 0

a = int(input("1번째 숫자 : "))
b = int(input("2번째 숫자 : "))
c = int(input("3번째 숫자 : "))
d = int(input("4번째 숫자 : "))

hap = a + b + c + d

print("합계 ==> %d" % hap)
'''

'''
# Code 07-02
aa = [0, 0, 0, 0]
hap = 0

aa[0] = int(input("1번째 숫자 : "))
aa[1] = int(input("2번째 숫자 : "))
aa[2] = int(input("3번째 숫자 : "))
aa[3] = int(input("4번째 숫자 : "))

hap = aa[0] + aa[1] + aa[2] + aa[3]

print("합계 ==> %d" % hap)
'''

'''
# Code 07-03
aa = []
for _ in range(4) :
    aa.append(0)  # aa array 초기화
hap = 0

for i in range(0, 4) :
    aa[i] = int(input(str(i + 1) + "번째 숫자 : "))

hap = aa[0] + aa[1] + aa[2] + aa[3]

print("합계 ==> %d" % hap)
'''

'''
# Self Study 07-01
aa = []
for _ in range(10) :
    aa.append(0)

hap = 0
i = 0
while (i < 10) :  # 0 ~ 9까지 10개
    aa[i] = int(input(str(i + 1) + "번째 숫자 : "))
    hap += aa[i]
    i += 1

print("합계 ==> %d" % hap)
'''

'''
# Code 07-04
aa = []
bb = []
value = 0

for i in range(0, 100) :
    aa.append(value)
    value += 2

for i in range(0, 100) :
    bb.append(aa[99 - i])

print("bb[0]에는 %d이, bb[99]에는 %d이 입력됩니다." % (bb[0], bb[99]))
'''

'''
# Code 07-05
myList = [30, 10, 20]
print("현재 리스트 : %s" % myList)

myList.append(40)
print("append(40) 후의 리스트 : %s" % myList)

print("pop()으로 추출한 값 : %s" % myList.pop())
print("pop() 후의 리스트 : %s" % myList)

myList.sort()
print("sort() 후의 리스트 : %s" % myList)

myList.reverse()
print("reverse() 후의 리스트 : %s" % myList)

print("20값의 위치 : %d" % myList.index(20))

myList.remove(222)
print("remove(222) 후의 리스트 : %s" % myList)

myList.extend([77, 88, 77])
print("extend([77, 88, 77]) 후의 리스트 : %s" % myList)

print("77값의 개수 : %d" % myList.count(77))
'''

'''
# Code 07-06
list1 = []
list2 = []
value = 1
for i in range(0, 3) :
    for k in range(0, 4) :
        list1.append(value)
        value += 1
    list2.append(list1)
    list1 = []

for i in range(0, 3) :
    for k in range(0, 4) :
        print("%3d" % list2[i][k], end = " ")
    print("")
'''

'''
# Self Study 07-03
list1 = []
list2 = []
value = 0
for i in range(0, 4) :
    for k in range(0, 5) :
        list1.append(value)
        value += 3
    list2.append(list1)
    list1 = []

for i in range(0, 4) :
    for k in range(0, 5) :
        print("%3d" % list2[i][k], end = " ")
    print("")
'''

'''
# Code 07-09
import operator

trainDic, trainList = {}, []

trainDic = {'Thomas' : '토마스', 'Edward' : '에드워드', 'Henry' : '헨리'}
trainList = sorted(trainDic.items(), key = operator.itemgetter(0))

print(trainList)
'''

'''
# 응용예제 01
import random

## declartion global variable part ##
data = []
i, k = 0, 0

## main code part ##
if __name__ == "__main__" :
    for i in range(0, 10) :
        tmp = hex(random.randrange(0, 100000))
        data.append(tmp)

    print('정렬 전 데이터 : ', end = '')
    [print(num, end = ' ') for num in data]

    for i in range(0, len(data) - 1) :
        for k in range(i + 1, len(data)) :
            if int(data[i], 16) > int(data[k], 16) :
                tmp = data[i]
                data[i] = data[k]
                data[k] = tmp

    print('\n정렬 후 데이터 : ', end = '')
    [print(num, end = ' ') for num in data]
'''


# 응용 예제 02
import operator

## declartion global variable part ##
trainTupleList = [('Thomas', 5), ('Henry', 8), ('Edward', 9), ('Amealy', 5),
                  ('Thomas', 4), ('Henry', 7), ('Thomas', 3), ('Amealy', 8),
                  ('Pousy', 5), ('Godeun', 13)]
trainDic, trainList = {}, []
tmpTup = None
totalRank, currentRank = 1, 1

## main code part ##
if __name__ == "__main__" :
    for tmpTup in trainTupleList :
        tName = tmpTup[0]
        tWeight = tmpTup[1]
        if tName in trainDic :
            trainDic[tName] += tWeight
        else :
            trainDic[tName] = tWeight

    print('기차 수송량 목록 ==>', trainTupleList)
    print('--------------------')
    trainList = sorted(trainDic.items(), key = operator.itemgetter(1), reverse = True)

    print('기차\t총 수송량\t순위')
    print('--------------------')
    print(trainList[0][0], '\t', trainList[0][1], '\t', currentRank)
    for i in range(1, len(trainList)) :
        totalRank += 1
        if trainList[i][1] == trainList[i - 1][1] :
            pass
        else :
            currentRank = totalRank

        print(trainList[i][0], '\t', trainList[i][1], '\t', currentRank)