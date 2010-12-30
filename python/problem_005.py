#!/usr/bin/python
# 
# 2520 is the smallest number that can be divided by each of the numbers from 1 
# to 10 without any remainder.
# 
# What is the smallest positive number that is evenly divisible by all of the 
# numbers from 1 to 20?
# 
# http://projecteuler.net/index.php?section=problems&id=5

# Start with 20, then increment by 20, since it'll have to be divisible by 20
candidate = 20

while any(candidate % i != 0 for i in range(1,21)):
    candidate += 20
#    print 'considering candidate ' + str(candidate)
print candidate
