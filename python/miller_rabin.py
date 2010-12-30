#!/usr/bin/python

# Deterministic variant

#Input: n > 1, an odd integer to test for primality.
#Output: composite if n is composite, otherwise prime
#write n-1 as 2**s*d by factoring powers of 2 from n-1
#repeat for all :
#    
#    then return composite
#return prime

import math

def prime(n):
    if n == 2:
        return True
    elif n <= 1 or n % 2 == 0:
        return False
    
    s = 0
    while (n - 1) % (2 ** s) == 0:
        s += 1
    s -= 1  # Because Python doesn't have do/while loops
    d = (n - 1) / (2 ** s)
    
    for a in [2, 3, 5, 7, 11, 13, 17]:
        if a >= n - 2:
            continue
        x = (a**d) % n
        if x == 1 or x == n - 1:
            continue
        for r in range(1, s):
            x = (x**2) % n
            if x == 1:
                return False
            elif x == n - 1:
                break
        else:
            return False
    return True

# print len(filter(prime, range(2,10000)))
