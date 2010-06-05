#!/usr/bin/env ruby
# 
# Let S_(m) = (x_(1), x_(2), ... , x_(m)) be the m-tuple of positive real
# numbers with x_(1) + x_(2) + ... + x_(m) = m for which P_(m) = x_(1) *
# x_(2)^(2) * ... * x_(m)^(m) is maximised.
# 
# For example, it can be verified that [P_(10)] = 4112 ([ ] is the integer
# part function).
# 
# Find Σ[P_(m)] for 2 ≤ m ≤ 15.
# 
# http://projecteuler.net/index.php?section=problems&id=190

class Array
  def sum
    self.inject(0) {|a, b| a + b}
  end
  
  def product
    self.inject(1) {|a, b| a * b}
  end
end

def fitness(chr)
  chr.to_enum(:each_with_index).map {|x, i| x ** (i + 1)}.product
end

order = 10

chr = (1..order).map { order * rand }

fitness = 0

10_000.times do |i|
  chr2 = chr
  # Choose a random chromasome to mutate
  j = rand(chr2.length)
  chr2[j] += rand - 0.50
  # Reinitialize this one if it's too big or small
  if chr2[j] <= 0 or chr2[j] >= order then
    chr2[j] = order * rand
  end

p fitness([1,2,3])    # => 1 * 2^2 * 3^3 = 1 * 4 * 27 = 108