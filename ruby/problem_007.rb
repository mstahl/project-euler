#!/usr/bin/env ruby -KU
# 
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we
# can see that the 6^(th) prime is 13.
# 
# What is the 10001^(st) prime number?
# 
# http://projecteuler.net/index.php?section=problems&id=7

require 'mathn'

primes = Prime.new

10000.times do
  primes.next
end
p primes.next