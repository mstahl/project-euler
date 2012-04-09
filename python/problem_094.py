#!/usr/bin/python
# 
# It is easily proved that no equilateral triangle exists with integral length
# sides and integral area. However, the almost equilateral triangle 5-5-6 has
# an area of 12 square units.
# 
# We shall define an almost equilateral triangle to be a triangle for which two
# sides are equal and the third differs by no more than one unit.
# 
# Find the sum of the perimeters of all almost equilateral triangles with
# integral side lengths and area and whose perimeters do not exceed one billion
# (1,000,000,000).
# 
# http://projecteuler.net/index.php?section=problems&id=94

import math, euler

def heron(a, b, c):
    s = (a + b + c) / 2
    return math.sqrt(s * (s - a) * (s - b) * (s - c))

def triangles(maximum):
    ab = 2
    while True:
        c = ab - 1
        if 2 * ab + c > maximum:
            raise StopIteration
        yield (ab, ab, c)
        c = ab + 1
        if 2 * ab + c > maximum:
            raise StopIteration
        yield (ab, ab, c)
        ab += 1

def is_integral(n):
    return int(n) == n

def test(t):
    # if t[0] % 1e5 == 0:
    #     print "Testing %s" % str(t)
    return is_integral(heron(t[0], t[1], t[2]))
    # a, b = t[0], t[2]
    # return is_integral(math.sqrt(((a*a * b*b) / 4) - ((b*b*b*b) / 16)))

if __name__ == '__main__':
    print len(filter(test, triangles(1e6)))
