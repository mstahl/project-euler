#!/usr/bin/python

# Deterministic variant. Works for 1 < n < 341,550,071,728,321

import math

def prime(n):
    if n == 2:
        return True
    elif n <= 1 or n % 2 == 0:
        return False
    
    s = 0
    while (n - 1) % (2 ** s) == 0:
        s += 1
    s -= 1
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

