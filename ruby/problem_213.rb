#!/usr/bin/env ruby -wKU
# 
# A 30 x 30 grid of squares contains 900 fleas, initially one flea per square.
# 
# When a bell is rung, each flea jumps to an adjacent square at random (usually
# 4 possibilities, except for fleas on the edge of the grid or at the corners).
# 
# What is the expected number of unoccupied squares after 50 rings of the bell?
# Give your answer rounded to six decimal places.
# 
# http://projecteuler.net/problem=213

require "pp"

class FleaCircus
  attr_reader :grid
  
  def initialize(size = 30)
    @grid = [[1] * size] * size
  end
  
  def empty_spaces
    @grid.map{|row| row.select{|i| i == 0}.length}.inject(0) {|s, x| s + x}
  end
  
  def ring_bell
    new_grid = [[0] * @grid.length] * @grid.length
    
    @grid.each_with_index do |row, i|
      row.each_with_index do |num_flees, j|
        possible_directions = [:north, :south, :east, :west]
        
        if i == 0 then
          # Top row
          possible_directions.delete :north
        elsif i == @grid.length - 1
          # Bottom row
          possible_directions.delete :south
        end
        
        if j == 0 then
          # Leftmost column
          possible_directions.delete :west
        elsif j == row.length - 1
          # Rightmost column
          possible_directions.delete :east
        end
        
        num_flees.times do |shazbot|
          direction = possible_directions.sample
          
          case direction
          when :north
            new_grid[i - 1][j] += 1
          when :south
            new_grid[i + 1][j] += 1
          when :east
            new_grid[i][j + 1] += 1
          when :west
            new_grid[i][j - 1] += 1
          end
        end
      end
    end
    
    @grid = new_grid
  end
  
  def pretty_
    s = ''
    @grid[0].length.times do |i|
      s << "\t#{i}"
    end
    s << "\n"
    
    @grid.each_with_index do |row, i|
      s << "#{i}:\t"
      row.each do |j|
        s << "#{j}\t"
      end
      s << "\n"
    end
    s
  end
  
  
end

f = FleaCircus.new(3)
puts f.pretty_
puts("-" * 80)
1.times do
  f.ring_bell
end
puts f.pretty_



