
require 'pp'

def isqrt(n)
  return 1 if n == 1
  x0 = n
  x1 = n / 2

  until x1 == x0
    x0 = x1
    x1 = (x0 + n / x0) / 2
  end
  x0
end

def b(n)
  (1 + isqrt(2 * n**2 - 2 * n + 1)) / 2
end

def n(b)
  (1 + isqrt(8 * b**2 - 8 * b + 1)) / 2
end

def b_feasible?(b)
  b(n(b)) == b
end

def n_feasible?(n)
  n(b(n)) == n
end

# pp (1..200).map{|n| [n, b(n), n(b(n))]}
# exit

b = b(10**12)
until b_feasible?(b)
  puts "b = #{b}, n = #{n(b)}"
  b += 1
end
puts("-" * 80)
p b
