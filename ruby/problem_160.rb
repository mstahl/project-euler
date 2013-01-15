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

def trim_zeroes(n)
  n.to_s.gsub(/0*\Z/, '').to_i
end

def f(n)
  q = 1
  (1..n).each do |k|
    q *= k
    q = trim_zeroes(q) % 100_000
  end
  q % 100_000
end

(1..1000).each do |i|
  puts "f(#{i}) = #{f(i)}"
end

