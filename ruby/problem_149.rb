#!/usr/bin/env ruby

require_relative 'lib/project_euler/grid.rb'

module ProjectEuler
  module Problem149

    class LaggedFibonacciGenerator
      def initialize
        @fibs = {}
      end

      def s(k)
        case k
        when (1..55)
          @fibs[k] ||= ((100003 - (200003 * k) + (300007 * k ** 3)) % 1000000) - 500000
        when (56..4000000)
          @fibs[k] ||= ((s(k - 24) + s(k - 55) + 1000000) % 1000000) - 500000
        else
          raise ArgumentError.new "Can't generate lagged fibonacci for #{k}!"
        end
        @fibs[k]
      end
    end

  end
end

module Enumerable
  def maximum_sum_subsequence
    max_ending_here = max_so_far = 0

    each do |x|
      max_ending_here = [0, max_ending_here + x].max
      max_so_far = [max_so_far, max_ending_here].max
    end

    max_so_far
  end
end

include ProjectEuler::Problem149

generator = LaggedFibonacciGenerator.new

grid = ProjectEuler::Grid.new(2000)
(1..4_000_000).each_with_index do |x, i|
  grid[i / 2000, i % 2000] = generator.s(x)
end

p [
  grid.all_rows.map(&:maximum_sum_subsequence).max,
  grid.all_columns.map(&:maximum_sum_subsequence).max,
  grid.all_diagonals.map(&:maximum_sum_subsequence).max,
  grid.all_antidiagonals.map(&:maximum_sum_subsequence).max
].max
