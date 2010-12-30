#!/usr/bin/env ruby -wKU
# 
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we
# get 3, 5, 6 and 9. The sum of these multiples is 23.
# 
# Find the sum of all the multiples of 3 or 5 below 1000.

threes = (1..(1000 / 3)).map {|t| 3 * t}.reject {|t| t % 5 == 0}
fives = (1..(1000 / 5 - 1)).map {|f| 5 * f}

p threes
p fives

answer = (threes + fives).inject(0) {|s, x| s + x}

puts answer.to_s
