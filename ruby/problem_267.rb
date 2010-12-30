#!/usr/bin/env ruby -wKU
# 
# You are given a unique investment opportunity.
# 
# Starting with £1 of capital, you can choose a fixed proportion, f, of your
# capital to bet on a fair coin toss repeatedly for 1000 tosses.
# 
# Your return is double your bet for heads and you lose your bet for tails.
# 
# For example, if f = 1/4, for the first toss you bet £0.25, and if heads
# comes up you win £0.5 and so then have £1.5. You then bet £0.375 and if the
# second toss is tails, you have £1.125.
# 
# Choosing f to maximize your chances of having at least £1,000,000,000 after
# 1,000 flips, what is the chance that you become a billionaire?
# 
# All computations are assumed to be exact (no rounding), but give your answer
# rounded to 12 digits behind the decimal point in the form 0.abcdefghijkl.
# 
# http://projecteuler.net/index.php?section=problems&id=267

require 'pp'

def fitness(f)
  capital = 1
  bet = 0
  1000.times do |i|
    bet = f * capital
    capital -= bet
    toss = rand(2)
    capital += 2 * toss * bet
    if capital == 0 then
      return 0
    end
  end
  return capital
end

# Some constants
POPULATION_SIZE = 1_000     # Size of the genome population
NUM_MUTATIONS = 100         # Number of mutations per generation
NUM_BEST = 10               # These many "best" genomes will be selected for breeding
NUM_GENERATIONS = 100_000   # Run the simulation for these many generations

# The actual genetic programming variables
population = ([0] * POPULATION_SIZE).map {|x| rand()}
NUM_GENERATIONS.times do |generation|
  fitnesses = population.map {|f| fitness(f)}.zip(population).sort
end

pp fitnesses
