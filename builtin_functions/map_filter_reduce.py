from functools import reduce
nums = [0,1,2,3,4,5,6,7,8,9]

list1= list(map(lambda b: b**2, nums))
print(list1)

list2 = list(filter(lambda x: x%2==0, nums))
print(list2)

list3 = reduce(lambda x, y: x+y, nums )
print(list3)