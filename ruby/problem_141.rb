# A positive integer, n, is divided by d and the quotient and remainder are q
# and r respectively. In addition d, q, and r are consecutive positive integer
# terms in a geometric sequence, but not necessarily in that order.
# 
# For example, 58 divided by 6 has quotient 9 and remainder 4. It can also be
# seen that 4, 6, 9 are consecutive terms in a geometric sequence (common ratio
# 3/2).  We will call such numbers, n, progressive.
# 
# Some progressive numbers, such as 9 and 10404 = 1022, happen to also be
# perfect squares.  The sum of all progressive perfect squares below one
# hundred thousand is 124657.
# 
# Find the sum of all progressive perfect squares below one trillion (1012).
# 
# http://projecteuler.net/problem=141

require 'set'

class Fixnum
  def perfect_square?
    (Math.sqrt(self)) ** 2 == self
  end
end

limit = 10**12
progressive_squares = Set.new

(2..9999).each do |a|
  (1..(a-1)).each do |b|
    break if a**3 * b**2 + b**2 >= limit
    next if a.gcd(b) > 1

    (1..(10**12)).each do |c|
      n = a**3 * b * c**2 + c * b**2
      break if n >= limit

      progressive_squares << n if n.perfect_square?
    end
  end
end

p progressive_squares
p progressive_squares.reduce(:+)
