#!/usr/bin/env ruby -wKU
# 
# It can be verified that there are 23 positive integers less than 1000 that
# are divisible by at least four distinct primes less than 100.
# 
# Find how many positive integers less than 10^16 are divisible by at least
# four distinct primes less than 100.
# 
# http://projecteuler.net/index.php?section=problems&id=268

require 'pp'
require 'mathn'

limit = 1000

# First get a list of all the combinations of 4 primes below 100
bases = Prime.each(100).to_a.combination(4).to_a.map {|l| l.inject(1) {|s, x| s * x}}.sort

# Apply the Principle of Inclusion-Exclusion to the set of possible multiples
# of numbers in `bases`.
answer = 0
(1..bases.length).each do |cardinality|
  puts "Cardinality: #{cardinality}"
  bases.combination(cardinality).each do |set|
    answer += ((-1)**(cardinality + 1)).to_i * limit / set.inject {|s, x| s.gcd x}
  end
end

# (1..bases.length).each_with_index do |base, index|
#   puts "Base #{base}, index #{index}"
#   answer = answer + limit/base - limit/bases[0..index].inject {|s, x| s.gcd x}
# end

# By the associative property of unions

p answer