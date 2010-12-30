#!/usr/bin/python
#
# The prime factors of 13195 are 5, 7, 13 and 29.
# 
# What is the largest prime factor of the number 600851475143?
#
# http://projecteuler.net/index.php?section=problems&id=3

from miller_rabin import *

n = 600851475143
#n = 13195
#n = 100

# Prime wheel generator, because why the hell not?
def primes():
    known_primes = [2]
    p = 2
    yield p
    p = 3
    
    while True:
        if not any(p % q == 0 for q in known_primes):
            known_primes.append(p)
            print p
            yield p
        p += 2

ps = primes()
p = 0
while n > 1:
    p = ps.next()
#    print 'trying p = ' + str(p)
    while n % p == 0:
        n /= p
print p
