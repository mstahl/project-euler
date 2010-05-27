# A positive integer n is called squarefree, if no square of a prime divides
# n, thus 1, 2, 3, 5, 6, 7, 10, 11 are squarefree, but not 4, 8, 9, 12.
# 
# How many squarefree numbers are there below 2^(50)?
# 
# http://projecteuler.net/index.php?section=problems&id=193

require 'mathn'
require 'pp'

square_primes = []
ps = Prime.new
until (q = ps.succ) > (2 ** 25) do
  square_primes << q ** 2
end

pp square_primes