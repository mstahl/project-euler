#!/usr/bin/python
#
# http://projecteuler.net/index.php?section=problems&id=6

import math

def square_of_sum(n):
    return ((n*(n+1))//2)**2

def sum_of_squares(n):
    return ((n*(n+1)*(2*n + 1))//6)

n = 100
print abs(sum_of_squares(n) - square_of_sum(n))
