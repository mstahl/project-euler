# Problem 005
#
# 2520 is the smallest number that can be divided by each of the numbers from 1
# to 10 without any remainder.
#
# What is the smallest positive number that is evenly divisible by all of the
# numbers from 1 to 20?
#
# https://projecteuler.net/problem=5

lcm = 1
[2, 3, 5, 7, 11, 13, 17, 19].each do |prime|
  factor = prime
  while factor * prime < 20
    factor *= prime
  end
  lcm *= factor
end

p lcm
