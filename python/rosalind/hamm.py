def hamm(str):
	n=0
	with open(str) as f:
		data1=f.readline()
		data2=f.readline()
		print data1
		print data2
		print len(data1)
		print len(data2)

		for i in range(len(data1)-1):
			if data1[i]!=data2[i]:
				n+=1
	return n

print hamm("input.txt")
