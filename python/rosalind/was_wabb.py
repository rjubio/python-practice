def was_wabb(n,k):
	if n == 1:
		return 1
	elif n == 2:
		return 1
	else:
		return was_wabb(n-1,k) + (k*was_wabb(n-2,k)) 

print was_wabb(5,3)
print was_wabb(32,3)
print was_wabb(6,3)
print was_wabb(35,4)
		
		
