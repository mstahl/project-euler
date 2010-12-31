#!/usr/bin/python
# 
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we
# get 3, 5, 6 and 9. The sum of these multiples is 23.
# 
# Find the sum of all the multiples of 3 or 5 below 1000.
# 
# http://projecteuler.net/index.php?section=problems&id=1

def merge(a, b):
    """Merges two nondecreasing lists into one big nondecreasing list."""
    if len(a) == 0:
        return b
    elif len(b) == 0:
        return a
    elif a[0] < b[0]:
        return [a[0]] + merge(a[1:], b)
    elif a[0] > b[0]:
        return [b[0]] + merge(a, b[1:])
    else:
        return [a[0]] + merge(a[1:], b[1:])

# print merge([2,4,6,8], [1,3,5,7])
# print merge([1,3,5,7], [2,4,6,8])

threes = [3 * x for x in range(1, 1000//3 + 1)]
# print threes
fives  = [5 * x for x in range(1, 1000//5)]
# print fives

print sum(merge(threes, fives))
