# The following iterative sequence is defined for the set of positive integers:
# 
# n -> n/2 (n is even)
# 
# n -> 3n + 1 (n is odd)
# 
# Using the rule above and starting with 13, we generate the following sequence:
# 
# 13 -> 40 -> 20 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1
# 
# It can be seen that this sequence (starting at 13 and finishing at 1) contains
# 10 terms. Although it has not been proved yet (Collatz Problem), it is thought
# that all starting numbers finish at 1.
# 
# Which starting number, under one million, produces the longest chain?
# 
# NOTE: Once the chain starts the terms are allowed to go above one million.
#
# http://projecteuler.net/problem=14

class Collatz

  def initialize(range = (1..1_000_000))
    @chain_lengths = {1 => 1}
    @range = range
  end

  def collatz(n)
    return n / 2 if n.even?
    return 3 * n + 1 if n.odd?
  end

  def compute
    @range.inject(1) do |best, x|
      if chain_length(x) > chain_length(best)
        x
      else
        best
      end
    end
  end

  def chain_length(n)
    @chain_lengths[n] ||= 1 + chain_length(collatz n)
  end
end

puts Collatz.new(1..1_000_000).compute
