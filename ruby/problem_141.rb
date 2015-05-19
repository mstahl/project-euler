# Investigating progressive numbers, n, which are also square
# 
# Problem 141
# 
# A positive integer, n, is divided by d and the quotient and remainder are q
# and r respectively. In addition d, q, and r are consecutive positive integer
# terms in a geometric sequence, but not necessarily in that order.
# 
# For example, 58 divided by 6 has quotient 9 and remainder 4. It can also be
# seen that 4, 6, 9 are consecutive terms in a geometric sequence (common ratio
# 3/2).  We will call such numbers, n, progressive.
# 
# Some progressive numbers, such as 9 and 10404 = 102^2, happen to also be
# perfect squares.  The sum of all progressive perfect squares below one
# hundred thousand is 124657.
# 
# Find the sum of all progressive perfect squares below one trillion (10^12).
#
# https://projecteuler.net/problem=141

require 'powerbar'

module ProjectEuler
  class Problem141
    def self.is_progressive(n)
      (2...Math.sqrt(n)).each do |d|
        q = n / d
        r = n % d

        a, b, c = [d, q, r].sort
        return true if 1.0*a/b == 1.0*b/c
      end
      return false
    end
  end
end

sum = 0
progress = PowerBar.new
(3..1_000_000).each do |i|
  n = i*i
  sum += n if ProjectEuler::Problem141.is_progressive(n)

  progress.show msg: 'Computing', done: i, total: 1_000_000
end
p.close
p sum
