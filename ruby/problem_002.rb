#!/usr/bin/env ruby -WKU
# 
# Each new term in the Fibonacci sequence is generated by adding the previous
# two terms. By starting with 1 and 2, the first 10 terms will be:
# 
# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
# 
# Find the sum of all the even-valued terms in the sequence which do not exceed
# four million.
# 
# http://projecteuler.net/index.php?section=problems&id=2

require 'generator'

fibonaccis = Generator.new do |g|
  f0 = 1
  f1 = 1
  
  while true do
    g.yield f0
    f2 = f0 + f1
    f0 = f1
    f1 = f2
  end
end

sum = 0
f = fibonaccis.next
while f < 4_000_000 do
  if f % 2 == 0 then
    sum += f
  end
  f = fibonaccis.next
end
p sum
