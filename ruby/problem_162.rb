#!/usr/bin/env ruby -wKU
# 
# In the hexadecimal number system numbers are represented using 16 different
# digits:
# 
# 0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F
# 
# The hexadecimal number AF when written in the decimal number system equals
# 10x16+15=175.
# 
# In the 3-digit hexadecimal numbers 10A, 1A0, A10, and A01 the digits 0,1 and
# A are all present.
# 
# Like numbers written in base ten we write hexadecimal numbers without leading
# zeroes.
# 
# How many hexadecimal numbers containing at most sixteen hexadecimal digits
# exist with all of the digits 0,1, and A present at least once?
# 
# Give your answer as a hexadecimal number.
# 
# (A,B,C,D,E and F in upper case, without any leading or trailing code that
# marks the number as hexadecimal and without leading zeroes , e.g. 1A3F and
# not: 1a3f and not 0x1a3f and not $1A3F and not #1A3F and not 0000001A3F)
# 
# http://projecteuler.net/problem=162

def cardinality_n_digits(n)
  if n == 1 then
    15
  elsif n == 0 then
    1
  elsif n < 0 then
    raise "Nuh uh."
  else
    15 * (16 ** (n - 1))
  end
end

total = 0
(3..16).each do |num_digits|
  total += (cardinality_n_digits(num_digits - 3)) * (num_digits - 2) * (num_digits - 1) * (num_digits - 1)
end

p total.to_s(16)