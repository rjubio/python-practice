def count_nucle(stri):
	a=0
	c=0
	g=0
	t=0
	for i in range(len(stri)):
		if stri[i]=="A":
			a+=1
		if stri[i]=="C":
			c+=1
		if stri[i]=="T":
			t+=1
		if stri[i]=="G":
			g+=1
	print str(a)+ " " + str(c) + " " + str(g)+ " " +str(t)

count_nucle("GGAGCCGGTTAGTCGCAAGAGCTCCCAAGAATTGTACTCGTCACTATATCTTCACAAGATCCGCAGCTATAAGGATTAATTCTACACACTTCGTTTTCCAAGTGCATGTGGAAGCTATTAGCCAAGATGCGGTACTAGGAGCATGGAGGTCACAAGTGGCGCTAGTGAACAGTGGACGGTCCCCGCTCGACTAAATCCCAAATTACCGTACGTAATGTTACACAAGAAGTACGTTAACCGGAATGGCCTTGCAGTCGTCGGAAGCGTTTTACATCATATCAGCGTCTCTGCTTCATCTCGCTCACCTACCCTAACGAACTATGGACCGCAGCTGAAAGCGGTCATCGGACCCGTTCGTTCCAAGGCTTTTAGTGGCTTATTGTTTTTGGACTCATGGGCCAATCAAGTTACAAAGATTCGGGTCGAGTTGCACCTTGAGACGTCTGGAAGCACTCGAGTTAGGACTGCCTTGTATATTCGTACGAACCGCTGTTATGAGAGGTGAGAGCCATACCCAGATCTACGAGTTGGCCACAACCGATCTCGAGACCGTCAGCACGATTAGTTTGTTGCATTTTTGGCTCTGCCACTGATTTCTCCGTACACTATAGCACTAGGAACCGTGCTAACCTGATCGTAGGACCGGCTAGGTGCTGACAGCCTATGCTTGACCAGTACCGCCATGTCCCGGCCATTGCTGACTGATGTATACACTGTCTCTACGAAGCTAACTTGGACTACCGTGTTCTACCTGTCGGGGTAAATAGCATTAGTTTCTTTTAGTGCATTTGGGACTGGCAACGACTTTACCCGGGGCTGGGCCTGAAACCTCCAATAACTACGTTGACAATGACCGCTTTTCGTCTTGTTTTAACCTAGGGTTGGGGTCTGAG")
	
	
