#!/usr/bin/env ruby -wKU
# 
# Peter has nine four-sided (pyramidal) dice, each with faces numbered 1, 2,
# 3, 4. Colin has six six-sided (cubic) dice, each with faces numbered 1, 2,
# 3, 4, 5, 6.
# 
# Peter and Colin roll their dice and compare totals: the highest total wins.
# The result is a draw if the totals are equal.
# 
# What is the probability that Pyramidal Pete beats Cubic Colin? Give your
# answer rounded to seven decimal places in the form 0.abcdefg
# 
# http://projecteuler.net/index.php?section=problems&id=205

class Dice
  attr_accessor :num_dice
  attr_accessor :num_sides
  
  def initialize(options)
    @num_dice = options[:num_dice] || 1
    @num_sides = options[:num_sides] || 6
  end
  
  def roll
    total = 0
    @num_dice.times do
      total += 1 + rand(@num_sides)
    end
    total
  end
end

peter = Dice.new :num_dice => 9, :num_sides => 4
colin = Dice.new :num_dice => 6, :num_sides => 6

peter_wins = 0
colin_wins = 0
total = 0

1_000_000_000.times do
  case peter.roll <=> colin.roll
  when -1
    colin_wins += 1
  when 1
    peter_wins += 1
  end
  total += 1
  
  # puts "\rThe score so far: #{peter_wins} <=> #{colin_wins}"
end
puts "\npeter won #{peter_wins} times"
puts "colin won #{colin_wins} times"
puts "-----------------------------"
puts "P_(peter) = #{1.0 * peter_wins / total}"
