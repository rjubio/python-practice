defarray_front9(nums):
    n=4
    if len(nums) < 4:
        n=len(nums)
    for i in range(0,n):
        if nums[i]==9:
            return True
    return False
