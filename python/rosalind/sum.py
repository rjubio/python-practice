def sum(a,b):
	n=0
        for i in range(a,b+1):
            if i%2!=0:
		n+=i
	return n

print sum(4484,9054)
