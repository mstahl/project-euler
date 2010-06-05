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

def ackermann(n)
  upmod(14**8, n - 2, 2, n + 3) - 3
end

# def upmod(modulus, index, base, exponent)
#   x = base
#   index.times do
#     exponent.times do
#       x = powmod base, x, modulus
#     end
#   end
#   return x
# end

def upmod(modulus, index, base, exponent)
  if index == 1 then
    powmod(base, exponent, modulus)
  elsif exponent == 0 then
    1
  else
    upmod(modulus, index - 1, base, upmod(modulus, index, base, exponent - 1))
  end
end

# Shamelessly ripped off from here:
# http://en.wikipedia.org/wiki/Modular_exponentiation#Right-to-left_binary_method
def powmod(base, exponent, modulus)
  result = 1
  while exponent > 0 do
    if exponent & 1 then
      result = (result * base) % modulus
    end
    exponent >>= 1
    base = (base * base) % modulus
  end
  return result
end


if __FILE__ == $0 then
  # main
  # p ackermann(0, 0)
  # p ackermann(1, 1)
  # p ackermann(2, 2)
  # p ackermann(3, 4)
  # 
  # pp @ackermanns
  
  p upmod(100000000000, 2, 2, 4)    # => 65536
  p upmod(14**8, 3, 2, 20)
end