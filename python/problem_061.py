#!/usr/bin/python
# -*- coding: utf-8 -*-
# 
# Triangle, square, pentagonal, hexagonal, heptagonal, and octagonal numbers
# are all figurate (polygonal) numbers and are generated by the following
# formulae:
# 
# Triangle P_(3,n)=n(n+1)/2 1, 3, 6, 10, 15, ...
# Square P_(4,n)=n^(2) 1, 4, 9, 16, 25, ...
# Pentagonal P_(5,n)=n(3n−1)/2 1, 5, 12, 22, 35, ...
# Hexagonal P_(6,n)=n(2n−1) 1, 6, 15, 28, 45, ...
# Heptagonal P_(7,n)=n(5n−3)/2 1, 7, 18, 34, 55, ...
# Octagonal P_(8,n)=n(3n−2) 1, 8, 21, 40, 65, ...
# 
# The ordered set of three 4-digit numbers: 8128, 2882, 8281, has three
# interesting properties.
# 
#  1. The set is cyclic, in that the last two digits of each number is the
# first two digits of the next number (including the last number with the
# first).
# 
#  2. Each polygonal type: triangle (P_(3,127)=8128), square (P_(4,91)=8281),
# and pentagonal (P_(5,44)=2882), is represented by a different number in the
# set.
# 
#  3. This is the only set of 4-digit numbers with this property.
# 
# Find the sum of the only ordered set of six cyclic 4-digit numbers for which
# each polygonal type: triangle, square, pentagonal, hexagonal, heptagonal,
# and octagonal, is represented by a different number in the set.
# 
# http://projecteuler.net/index.php?section=problems&id=61

from euler import *

# triangles = [n * (n + 1) // 2     for n in range(1,1000)]
triangles = filter(lambda n: len(str(n)) == 4, [n * (n + 1) // 2     for n in range(1,1000)])
squares   = filter(lambda n: len(str(n)) == 4, [n ** 2               for n in range(1,1000)])
pentagons = filter(lambda n: len(str(n)) == 4, [n * (3 * n - 1) // 2 for n in range(1,1000)])
hexagons  = filter(lambda n: len(str(n)) == 4, [n * (2 * n - 1)      for n in range(1,1000)])
heptagons = filter(lambda n: len(str(n)) == 4, [n * (5 * n - 3) // 2 for n in range(1,1000)])
octagons  = filter(lambda n: len(str(n)) == 4, [n * (3 * n - 2)      for n in range(1,1000)])

# print(triangles)
# print(squares  )
# print(pentagons)
# print(hexagons )
# print(heptagons)
# print(octagons )

def all_perms(str):
    if len(str) <=1:
        yield str
    else:
        for perm in all_perms(str[1:]):
            for i in range(len(perm)+1):
                yield perm[:i] + str[0:1] + perm[i:]

# The goal here is to create a recursive function that will traverse the entire
# tree of possible solutions. The function will take two arguments, a prefix
# and a list of lists for it to test. When called on a list of the lists above,
# starting with `octagons`, and with an empty prefix, this function will filter
# the first of these lists for numbers that match the given prefix, and for
# each one of those, will call itself on that number and the rest of the list
# of lists. If the list of lists is empty, it returns all the numbers it's
# acquired so far.
def search(prefix, lst):
    if len(lst) == 0:
        return [prefix]
    # `nexts` are potential numbers to continue searching with. They must begin
    # with the same 2 digits the current prefix number ended with.
    nexts = filter(lambda n: prefix == None or n//100 == prefix % 100, lst[0])
    # Short-circuit in case this prefix isn't gonna work out.
    if len(nexts) == 0:
        return []
    results = map(lambda p: search(p, lst[1:]), nexts)
    # Return the prefix appended to the longest of the results
    results.sort(lambda b, a: cmp(len(a), len(b)))
    if prefix != None:
        return [prefix] + results[0]
    else:
        return results[0]

# print search(None, [octagons, heptagons, hexagons, pentagons, squares, triangles])
candidates = list(search(None, [octagons] + p) for p in all_perms([heptagons, hexagons, pentagons, squares, triangles]))
result = filter(lambda l: l[0] // 100 == l[-1] % 100, candidates)
print result[0]
print sum(result[0])
