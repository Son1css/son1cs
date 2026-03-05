nums = [0,1,2,3,4,5,6,7,8,9]
gems = ['crystal', 'diamond', 'lars', 'steven']
for i,x in enumerate(nums):
    print(f"index: {i}, value: {x}")

for a, b in zip(nums, gems):
    print(a, b)