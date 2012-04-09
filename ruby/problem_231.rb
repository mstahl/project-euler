#!/usr/bin/env ruby -wKU
# 
# The binomial coefficient ^(10)C_(3) = 120.
# 
# 120 = 2^3 * 3 * 5 = 2 * 2 * 2 * 3 * 5, and 2 + 2 + 2 + 3 + 5 = 14.
# 
# So the sum of the terms in the prime factorisation of ^(10)C_(3) is 14.
# 
# Find the sum of the terms in the prime factorisation of ^(20000000)C_(15000000).
# 
# http://projecteuler.net/problem=231

# Parameters for problem
n = 20000000
k = 15000000

# Pre-compute table of primes up to n
primes = (1..n).to_a
(0..primes.length).each do ||

# Pre-build prime factors table via sieve
prime_factors_table = []
