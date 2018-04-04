def pos_neg(a,b,negative):
    if (a<0 and b>=0) and not negative:
        return True
    elif (a>=0 and b<0)  and not negative:
        return True    
    else:
        if (negative) and (a<0 and b<0):
            return True
        else:
            return False
