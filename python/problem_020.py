#!/usr/bin/python
# -*- coding: utf-8 -*-
# 
# n! means n × (n − 1) × ... × 3 × 2 × 1
# 
# Find the sum of the digits in the number 100!
# 
# http://projecteuler.net/index.php?section=problems&id=20

from euler import *

print int(sum(digits(factorial(100))))