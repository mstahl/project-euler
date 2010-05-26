#!/usr/bin/env ruby
# 
# The sequence of triangle numbers is generated by adding the natural numbers.
# So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The
# first ten terms would be:
# 
# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
# 
# Let us list the factors of the first seven triangle numbers:
# 
#  1: 1
#  3: 1,3
#  6: 1,2,3,6
# 10: 1,2,5,10
# 15: 1,3,5,15
# 21: 1,3,7,21
# 28: 1,2,4,7,14,28
# 
# We can see that 28 is the first triangle number to have over five divisors.
# 
# What is the value of the first triangle number to have over five hundred
# divisors?

require 'mathn'
require 'pp'

# My haskell implementation:
# 
# num_divisors :: Integral t => t -> Int
# num_divisors n = 
#   let a_i = map (length) $ group $ prime_factors n
#   in product $ map ((+)1) a_i

class Array
  def span(&block)
    arr = []
    self.each_with_index do |x, i|
      if yield(x) then
        arr << x
      else
        return arr, self[i..-1]
      end
    end
    return arr, []
  end
  
  def groups
    arr = self.dup
    grps = []
    until arr.length <= 1 do
      p arr
      new_grp, arr = arr.span {|x| x == arr.first}
      p new_grp
      grps << new_grp
    end
    grps
  end
end

def prime_factors(n)
  pr = Prime.new
  factors = Hash.new
  pr.each do |q|
    if q > n then
      return factors
    else
      until n % q != 0 do
        factors[q] ||= 0
        factors[q] += 1
        n /= q
      end
    end
  end
end

def num_divisors(n)
  prime_factors(n).map {|k, v|
    v + 1
  }.inject(1) {|p, x|
    p * x
  }
end



p prime_factors(144)
p num_divisors(144)