#!/usr/bin/env ruby -wKU
# 
# Consider quadratic Diophantine equations of the form:
# 
# x^(2) – Dy^(2) = 1
# 
# For example, when D=13, the minimal solution in x is 649^(2) – 13×180^(2) = 1.
# 
# It can be assumed that there are no solutions in positive integers when D is
# square.
# 
# By finding minimal solutions in x for D = {2, 3, 5, 6, 7}, we obtain the
# following:
# 
# 3^(2) – 2×2^(2) = 1
# 2^(2) – 3×1^(2) = 1
# 9^(2) – 5×4^(2) = 1
# 5^(2) – 6×2^(2) = 1
# 8^(2) – 7×3^(2) = 1
# 
# Hence, by considering minimal solutions in x for D ≤ 7, the largest x is
# obtained when D=5.
# 
# Find the value of D ≤ 1000 in minimal solutions of x for which the largest
# value of x is obtained.
# 
# http://projecteuler.net/index.php?section=problems&id=66

def is_square(n)
  m = Math.sqrt(n).floor
  m * m == n
end


def sqrt_convergents(n)
  if is_square(n) then
    return Math.sqrt(n).floor
  end
  
  ans = []
  n1 = 0
  d1 = 1
  begin
    next_n = ((Math.sqrt(n).floor + n1) / d1).floor
    ans << next_n
    
    n2 = d1
    d2 = n1 - d1 * next_n
    
    n3 = -d2
    d3 = (n - (d2 ** 2)) / n2
    
    n1, d1 = n3, d3
  end while d3 != 1
  ans << ans.first * 2
  return ans
end

if __FILE__ == $0 then
  p sqrt_convergents(7)
end