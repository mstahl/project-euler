#!/usr/bin/env ruby -KU
# 
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# 
# Find the sum of all the primes below two million.
# 
# http://projecteuler.net/index.php?section=problems&id=10

require 'mathn'

primes = Prime.new

s = 0
q = primes.next
while q < 2_000_000 do
  s += q
  q = primes.next
end

p s