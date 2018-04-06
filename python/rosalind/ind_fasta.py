import sys

def ident_seq(str, fasta):
	val=fasta[str]
	n=0
	for i in range(len(val)):
		if val[i] == "C" or val[i] == "G":
			n+=1
	m=float(n)
	print val
	return m/len(val)*100
	
	

fasta={}
name=""
f = open("input.txt","r")
for i in f:
#	i=i.strip()
	if i.startswith(">"):
		name=i[1:len(i)-1]
		if name not in fasta:	
			fasta[name]=[]
		sequence=""
		continue
	if i[len(i)-1] == "\n":
		sequence=sequence+i[:len(i)-1]
	fasta[name]=sequence
name=""
max=0
tmp=0
for i in fasta: 
	tmp=ident_seq(i,fasta)
	print i
	print tmp
	print len(fasta[i])
	if max<tmp:
		max=tmp
		name=i

print name
print max
		

