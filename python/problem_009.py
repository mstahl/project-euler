#!/usr/bin/python
# 
# A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,
# 
# a^2 + b^2 = c^2
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
# 
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.
# 
# http://projecteuler.net/index.php?section=problems&id=9

def triplet():
    m = 2
    n = 1
    while m**2 + n**2 < 1000:
        n = 1
        while n < m:
            a = m**2 - n**2
            b = 2 * m * n
            c = m**2 + n**2
            if a + b + c == 1000:
                yield a * b * c
            n += 1
        m += 1

t = triplet()
print(t.next())
