#!/usr/bin/python
# 
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# 
# Find the sum of all the primes below two million.
# 
# http://projecteuler.net/index.php?section=problems&id=10

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

p = primes()
ps = []
q = p.next()
while q < 2000000:
    print q
    ps.append(q)
    q = p.next()
print ps
