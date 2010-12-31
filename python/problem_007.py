#!/usr/bin/python
# 
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see 
# that the 6th prime is 13.
# 
# What is the 10001st prime number?
# 
# http://projecteuler.net/index.php?section=problems&id=7

def primes():
    known_primes = [2]
    p = 2
    yield p
    p = 3
    
    while True:
        if not any(p % q == 0 for q in known_primes):
            known_primes.append(p)
            yield p
        p += 2

ps = primes()

for i in range(10000):
    ps.next()
print ps.next()
