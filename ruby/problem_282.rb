#!/usr/bin/env ruby -wKU
# 
# For non-negative integers m, n, the Ackermann function A(m, n) is defined as follows:
# 
# A(m, n) | m == 0           = n + 1
#         | m > 0 and n == 0 = A(m - 1, 1)
#         | m > 0 and n > 0  = A(m - 1, A(m, n - 1))
# 
# For example A(1, 0) = 2, A(2, 2) = 7 and A(3, 4) = 125.
# 
# Find ∑_(0 ≤n ≤ 6) A(n, n) and give your answer mod 14^(8).
# 
# http://projecteuler.net/index.php?section=problems&id=282

require 'pp'

@ackermanns = Hash.new
def ackermann(m, n)
  if !@ackermanns["#{m},#{n}"].nil? then
    return @ackermanns["#{m},#{n}"]
  elsif m == 0 then
    @ackermanns["#{m},#{n}"] ||= (n + 1) % (14 ^ 8)
  elsif m > 0 and n == 0 then
    @ackermanns["#{m},#{n}"] ||= (ackermann(m - 1, 1)) % (14 ^ 8)
  else
    @ackermanns["#{m},#{n}"] ||= (ackermann(m - 1, ackermann(m, n - 1))) % (14 ^ 8)
  end
  return @ackermanns["#{m},#{n}"]
end

if __FILE__ == $0 then
  # main
  # p ackermann(0, 0)
  # p ackermann(1, 1)
  # p ackermann(2, 2)
  p ackermann(3, 4)
  
  pp @ackermanns
end