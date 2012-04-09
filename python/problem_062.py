#!/usr/bin/python
# -*- coding: utf-8 -*-
# 
# The cube, 41063625 (345^(3)), can be permuted to produce two other cubes:
# 56623104 (384^(3)) and 66430125 (405^(3)). In fact, 41063625 is the smallest
# cube which has exactly three permutations of its digits which are also cube.
# 
# Find the smallest cube for which exactly five permutations of its digits are
# cube.
# 
# http://projecteuler.net/index.php?section=problems&id=62

from math import *
from euler import *

def is_cube(n):
    m = int(round(n**(1.0/3.0)))
    return (m * m * m == n)

def gen(n):
    x = 123
    while True:
        c = x ** 3
        ps = map(int, list(permutations(str(c))))
        candidates = filter(is_cube, ps)
        if len(candidates) == n:
            yield min(candidates)
        x += 1

print gen(3).next()