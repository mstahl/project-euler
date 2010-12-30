#!/usr/bin/env ruby -wKU
# 
# The prime factors of 13195 are 5, 7, 13 and 29.
# 
# What is the largest prime factor of the number 600851475143?
# 
# http://projecteuler.net/index.php?section=problems&id=3

require 'mathn'

ps = Prime.new
primes = []
while (p = ps.succ) < Math.sqrt(600851475143) do
  puts p.to_s
  primes << p
end
