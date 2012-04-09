#!/usr/bin/python
# 
# An implementation of the AKS primality test
# 
# (c) max thom stahl <github.com/mstahl>

import euler, math

def order(r, a):
    k = 1
    n = a
    while n % r != 1:
        n *= a
        k += 1
    return k

def prime(n):
    if n <= 1:
        return false
    
    for a in range(2, math.sqrt(n) + 1):
        for b in range(2, math.log(n, a)):
            if a ** b == n:
                return false
    
    r = 2
    while(order(r, n) <= math.log(n)/math.log(2)):
        r += 1
    
    if n <= r:
        return True
    
    for a in range(1, r + 1):
        g = gcd(a, n)
        if 1 < g and g < n:
            return False
    
    for a in range(1, math.floor(math.sqrt(totient(r)) * logBase(2, n)) + 1):
        pass

if __name__ == "__main__":
    pass
