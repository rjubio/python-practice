def last2(str):
    last=str[len(str)-2:len(str)]
    n=0
    for i in range(len(str)-2):
        if (str[i:i+2] == last):
            n = n+1
    return n

print last2("hello")
