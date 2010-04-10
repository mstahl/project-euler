#!/usr/bin/env ruby -KU
# 
# 2^(15) = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
# 
# What is the sum of the digits of the number 2^(1000)?
# 
# http://projecteuler.net/index.php?section=problems&id=16

puts (2 ** 1000).to_s.split(//).map {|x| x.to_i}.inject(0) {|s, x| s + x}.to_s