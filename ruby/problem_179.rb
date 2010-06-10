#!/usr/bin/env ruby -wKU
# 
# Find the number of integers 1 < n < 10^(7), for which n and n + 1 have the
# same number of positive divisors. For example, 14 has the positive divisors
# 1, 2, 7, 14 while 15 has 1, 3, 5, 15.
# 
# http://projecteuler.net/index.php?section=problems&id=179

require 'pp'

max = 10 ** 7 - 1

sigmas = []
(2..(max/2)).each do |interval|
  (1..(max/interval)).each do |index|
    sigmas[index * interval] ||= 0
    sigmas[index * interval] += 1
  end
end

n = 0
sigmas.each_with_index do |s, i|
  if s == sigmas[i + 1] then
    n += 1
  end
end
p n