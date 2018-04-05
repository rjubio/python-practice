def retf():
	i=1
	f=open('input.txt','r')
	for s in f:
		if i%2==0:
			print s
		i=i+1

print retf()
