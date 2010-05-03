#!/usr/bin/env ruby -wKU
# n! means n × (n  − 1) × ... × 3 × 2 × 1
# 
# Find the sum of the digits in the number 100!
# 
# http://projecteuler.net/index.php?section=problems&id=20

def factorial(n)
  (1..n).inject(1) {|p, x| p * x}
end

puts factorial(100).to_s.split(//).map {|x| x.to_i}.inject(0) {|s, x| s + x}.to_s