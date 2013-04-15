#!/usr/bin/python
# 
# Euler.py
# 
# This module contains commonly useful functions when solving Project Euler 
# problems, which aren't included in the regular Python math module.
# 
# (c) 2011 max thom stahl <github.com/mstahl> <max@villainousindustries.com>

import itertools, math

## Numerical functions and classes that are handy

def is_palindrom(n):
    '''
    Returns true iff n is a palindrome.
    '''
    m = list(str(n))
    m.reverse()
    return int(''.join(m)) == n

def primes():
    '''
    primes() is a very simple prime number generator that uses the Sieve of 
    Eratosthenes to generate its primes lazily. Will upgrade soon to a more 
    modern prime wheel kind of algorithm.
    '''
    known_primes = [2]
    p = 2
    yield p
    p = 3
    
    while True:
        if not any(p % q == 0 for q in known_primes):
            known_primes.append(p)
            yield p
        p += 2

def prime_factors(n):
    '''
    Ported from my Haskell code. Makes use of the laziness of the above prime
    number generator to do its thing quickly.
    '''
    m = n
    ps = primes()
    p = ps.next()
    factors = []
    while p <= m:
        if m % p == 0:
            factors += [p]
            m /= p
        else:
            p = ps.next()
    return factors

#totient :: (Integral a, Integral t) => a -> t
#totient n | n < 2 = 1
#          | otherwise = let inner n = 1 - (1 % n)
#                        in ceiling ((fromIntegral n) * (product $ map (inner) (nub $ prime_factors n)))

def totient(n):
    '''
    Euler's Totient function (http://en.wikipedia.org/wiki/Euler's_totient_function)
    Also ported from my Haskell code.
    '''
    if n < 2:
        return 1
    else:
        ps = uniq(prime_factors(n))
        return int(math.ceil(n * prod(map(lambda x: 1 - (1.0 / x), ps))))

# Uncomment this if using Python <3.0, otherwise use math.factorial
#def factorial(n):
#    if n < 2:
#        return 1
#    else:
#        return n * factorial(n - 1)

def gcd(a, b):
    while b != 0:
        t = b
        b = a % b
        a = t
    return a

def fibonaccis():
    """Generating function for Fibonacci numbers."""
    f1 = 1
    yield f1
    f2 = 1
    yield f2
    
    while True:
        f3 = f1 + f2
        yield f3
        (f1, f2) = (f2, f3)

def digits(n):
    if n == 0:
        return []
    (q, r) = divmod(n, 10)
    return [r] + digits(q)

def is_palindrome(n):
    ds = digits(n)
    sd = digits(n)
    sd.reverse()
    return ds == sd

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

def permutations(l):
    if len(l) <=1:
        yield l
    else:
        for perm in permutations(l[1:]):
            for i in range(len(perm)+1):
                yield perm[:i] + l[0:1] + perm[i:]

# Combinatoric functions
def nCr(n, r):
    f = math.factorial
    return f(n)//(f(r) * f(n - r))

# Some handy functors
def foldl(f, i, l):
    if len(l) == 0:
        return i
    else:
        return f(l[0], foldl(f, i, l[1:]))

def foldl1(f, l):
    if len(l) == 1:
        return l[0]
    else:
        return f(l[0], foldl1(f, l[1:]))

def prod(l):
    p = 1
    for x in l:
        p *= x
    return p

# List functions
def uniq(l):
    '''
    Unique-ifies a list
    '''
    return list(set(l))

def partitions(n):
    '''
    Returns the number of partitions of a number n.
    '''
    def p(k, n):
        if k > n:
            return 0
        elif k == n:
            return 1
        else:
            return p(k + 1, n) + p(k, n - k)
    return p(1, n)

def list_partitions_of(n):
    '''
    Returns a list of the integer partitions of n.
    '''
    def p(k, n):
        if k > n:
            return []
        elif k == n:
            return [k]
        else:
            return p(k + 1, n) + p(k, n - k)
    return p(1, n)

