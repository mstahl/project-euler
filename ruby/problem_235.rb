#!/usr/bin/env ruby -wKU
# 
# Given is the arithmetic-geometric sequence u(k) = (900-3k)r^(k-1).
# Let s(n) = Σ_(k=1...n)u(k).
# 
# Find the value of r for which s(5000) = -600,000,000,000.
# 
# Give your answer rounded to 12 places behind the decimal point.
# 
# http://projecteuler.net/index.php?section=problems&id=235

n = 5_000
s, r, d = 0, 1, 0.1
while (s + 600_000_000_000).abs > 1
  # p (s + 600_000_000_000).abs
  s = (1..n).map{|k| (900.0 - 3.0 * k) * r ** (k - 1.0)}.reduce(:+)
  r += s > -600_000_000_000 ? d : -d
  d /= 2.0
end
puts "%.12f" % r
