def revcom(dna):
	rev=""
	lasti=len(dna)-1
	for i in range(len(dna)):
		if dna[lasti-i]=="A":
			rev+="T"
		if dna[lasti-i]=="T":
			rev+="A"
		if dna[lasti-i]=="G":
			rev+="C"
		if dna[lasti-i]=="C":
			rev+="G"
	print rev
		

revcom("ACGTGTCATCCCGACCGCTACAGCTATTTGCCGATAGCGACAAGTGAAGCCAGAAGCCCGTAGACGCTGAATTTTCGGCTTTTCTGTATCTTTTAACGCGTCTGGAAGGACGCGGAGGCCAAAATCGTTAGGCACGATAATATTGAATACCGGAAACAGTGGTGCAGGCATGGCCCCCGAAAAGGAGCAATCACTTGCCGAGATGCGGTAGACGGGGACATGCAGAGCGTTCCGTCAAGTCACCGGTCGCTACTGGATTCCAAACTTTACACACCTAAATTTGAGGGAAACGCTCTCCCTCACAACCCAGAGCTGAGAGCCCTGCGTATTCTCTCTGTAACCTTAAATTTGCGACCGCATCGACGCACCACGCCATTAGGTATCCGGCCCCTACATTGTTCATGACTTGGTCGAACAGGAGATTCCTTATTCAGCCGCCGCGACACTGAACCTTACCACATTAGACTCTGTACGTCTGTAGCGGCTAAAGAGTGCACTCCCATCTTCGTTGCGCGTCTCGGGAGGTGTTGGGGGGACCGAGTTGTCCCGTGCCGGAAACATAAGCGACTATAAGGCTTCGCTCGACCCTCCAGAAAGTCAGGGCAAACTCGGCACTAGCTCGGTACTCACCGTACGCATAGGGCTTTTCAGTCAGAACTGGTCCATACATAGTCCTAAAGGCTGATGAGTAGAAGCAGGAAGATAGGGAAAATCGTGGTTAATGAACATCCTAATCTATGCGACTGGCGTTTGACGGTGTGGGGTCTGCCGACGATCGTCGGCTACCTGGTCTAGGACACGTCTTTGCACCACAGTAAAAAGACGTGCTGATCATGAGAACTTACCAGGAAGTACGGGCGATAGTTACTAGAGAATCATCAGCCCCCACGAGCCGGATCCCGTGTACGCGATAATCGCTTTGGCGCAGACCTAGTACACCGGTC")
