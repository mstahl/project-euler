#!/usr/bin/env ruby -wKU
# 
# Consider the number 50.
# 50^2 = 2500 = 2^2 * 5^4, so φ(2500) = 2 * 4 * 5^3 = 8 * 5^3 = 2^3 * 5^3. (1)
# So 2500 is a square and φ(2500) is a cube.
# 
# Find the sum of all numbers n, 1 < n < 10^10 such that φ(n^2) is a cube.
# 
# (1) φ denotes Euler's totient function.
# 
# http://projecteuler.net/index.php?section=problems&id=342

require 'pp'
require './Totient.rb'

class Fixnum
  def perfect_square?
    s = Math.sqrt(self)
    s * s == self
  end
end

solution = 0
# (2..(10.0**(10.0/3.0) - 1)).each do |k|
(2..100).each do |k|
  m = k ** 3
  puts "m = #{m}"
  ns = inverse_totient m
  
  # Delete any item that's larger than 1e10
  ns.reject! {|x| x >= 10**10}
  # Delete any item that's not a perfect square
  ns.reject! {|x| not x.perfect_square?}
  # Add these to solutions
  solution += ns.inject(0) {|s, x| s + x}
end
p solution

