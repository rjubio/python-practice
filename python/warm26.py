def array_count9(nums):
    x=0
    if len(nums)<1:
        return 0
    for i in nums:
        if i == 9:
            x = x + 1
    return x

