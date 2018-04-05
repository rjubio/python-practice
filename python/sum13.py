def sum13(nums):
  n=0
  if len(nums)<1:
    return 0
  for i in range(len(nums)):
    if nums[i]!=13:
      n+=nums[i]
    if i!=0 and nums[i-1]==13:
      n=n-nums[i-1]
    print str(i) + " " + str(nums[i]) + " " +str(nums[i-1]) + " "  + str(n)
  return n
        
print sum13([13, 1, 2, 13, 2, 1, 13])
