#!/usr/bin/env ruby -wKU
# 
# Given is the arithmetic-geometric sequence u(k) = (900-3k)r^(k-1).
# Let s(n) = Σ_(k=1...n)u(k).
# 
# Find the value of r for which s(5000) = -600,000,000,000.
# 
# Give your answer rounded to 12 places behind the decimal point.
# 
# http://projecteuler.net/index.php?section=problems&id=235

def u(r, k)
  (900 - 3 * k) * r ** (k - 1)
end

def s(r, n)
  (1..n).map {|k| u(r, k)}.inject(0) {|a, b| a + b}
end

# p s(48.2474167337496, 5000)





# exit

range    = 5.0
genome   = range * rand - (range / 2)
variance = 0.25
n        = 5000
goal     = -600_000_000_000
last_f   = s(genome, n)
5000.times do |generation|
  puts "-----------------------------------"
  puts "processing generation #{generation}"
  # Mutate the genome, according to the variance, and put the result in `candidate`
  candidate = genome + (variance * rand - (variance / 2))
  puts "last fitness: #{last_f}"
  puts "candidate: #{candidate}"
  # Fitness is absolute value of the difference between the calculated value and the goal
  fitness = (s(candidate, n) - goal).abs
  puts "n: #{n}"
  puts "fitness: #{fitness}"
  puts "goal: #{goal}"
  # Lower fitness is better
  if fitness < last_f then
    # If the candidate's fitness is better than the last fitness, set its fitness as
    # `last_f` and set `genome` to the newly-mutated value
    last_f = fitness
    genome = candidate
  end
  puts "genome: #{genome}"
  
  # Print status
  # puts "Generation #{generation}: Genome<#{genome}> fitness = #{fitness}"
  
  # Loop around again
end