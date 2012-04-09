#!/usr/bin/env ruby -wKU
# 
# It is well known that if the square root of a natural number is not an
# integer, then it is irrational. The decimal expansion of such square roots is
# infinite without any repeating pattern at all.
# 
# The square root of two is 1.41421356237309504880..., and the digital sum of
# the first one hundred decimal digits is 475.
# 
# For the first one hundred natural numbers, find the total of the digital sums
# of the first one hundred decimal digits for all the irrational square roots.
# 
# http://projecteuler.net/problem=80

def maximum_such_that
  n = 1
  while yield(n)
    n += 1
  end
  return n - 1
end

def sum_digits(n)
  n.to_s.split(//).map(&:to_i).inject(0) {|s, x| s + x}
end

def sqrt_digits(n, num_digits = 100)
  # puts "called sqrt_digits(#{n}, #{num_digits})"
  
  digits = n.to_s
  if digits.length.odd? then
    digits = "0" + digits
  end

  remainder = 0
  p = 0

  until p.to_s.length >= num_digits or (remainder == 0 and digits.length == 0)
    # puts "looping with digits = '#{digits}'"
    if digits.length == 0 then
      digits = "00"
    end
    
    c = 100 * remainder + digits[0..1].to_i
    # puts "c = #{c}"
    
    digits = digits[2..-1]

    x = maximum_such_that{|i| i * (20 * p + i) <= c}
    # puts "x = #{x}"
    y = x * (20 * p + x)
    # puts "y = #{y}"
    p = 10 * p + x
    # puts "p = #{p}"

    remainder = c - y
    # puts "remainder = #{remainder}"
  end
  
  # puts "returning #{p}"
  
  return p
end

p (1..100).reject{|x|
  (Math.sqrt(x)).floor ** 2 == x
}.map{|n|
  sqrt_digits(n, 1000)
}.map{|n|
  sum_digits(n)
}.inject(0) {|s, x| s + x}





