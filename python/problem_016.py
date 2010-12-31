#!/usr/bin/python

def gendigits(n):
    while n > 0:
        (n, r) = divmod(n, 10)
        yield r

print(sum(gendigits(2**1000)))
