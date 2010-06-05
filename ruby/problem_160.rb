#!/usr/bin/env ruby -wKU
# 
# For any N, let f(N) be the last five digits before the trailing zeroes in
# N!.
# 
# For example,
# 
#  9! = 362880 so f(9)=36288
#  10! = 3628800 so f(10)=36288
#  20! = 2432902008176640000 so f(20)=17664
# 
# Find f(1,000,000,000,000)
# 
# http://projecteuler.net/index.php?section=problems&id=160

def trim0s(n)
  if n < 10 then
    return n
  end
  
  while n % 10 == 0 do
    n /= 10
  end
  return n
end

result = 1
1_000_000_000_000.times do |i|
  # puts "#{i}: #{result}"
  result *= i + 1
  result = trim0s(result) % (10**5)
end

p result