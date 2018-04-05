def string_bits(str):
    new=""
    for x in range(0, len(str), 2):
        new=new+str[x]
    return new
