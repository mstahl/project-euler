#!/usr/bin/env ruby -wKU
# 
# A common security method used for online banking is to ask the user for
# three random characters from a passcode. For example, if the passcode was
# 531278, they may asked for the 2nd, 3rd, and 5th characters; the expected
# reply would be: 317.
# 
# The text file, keylog.txt (http://projecteuler.net/project/keylog.txt),
# contains fifty successful login attempts.
# 
# Given that the three characters are always asked for in order, analyse the
# file so as to determine the shortest possible secret passcode of unknown
# length.
# 
# http://projecteuler.net/index.php?section=problems&id=79

require 'set'
require 'pp'

attempts = [[3, 1, 9], [6, 8, 0], [1, 8, 0], [6, 9, 0], [1, 2, 9], [6, 2, 0],
            [7, 6, 2], [6, 8, 9], [7, 6, 2], [3, 1, 8], [3, 6, 8], [7, 1, 0],
            [7, 2, 0], [7, 1, 0], [6, 2, 9], [1, 6, 8], [1, 6, 0], [6, 8, 9],
            [7, 1, 6], [7, 3, 1], [7, 3, 6], [7, 2, 9], [3, 1, 6], [7, 2, 9],
            [7, 2, 9], [7, 1, 0], [7, 6, 9], [2, 9, 0], [7, 1, 9], [6, 8, 0],
            [3, 1, 8], [3, 8, 9], [1, 6, 2], [2, 8, 9], [1, 6, 2], [7, 1, 8],
            [7, 2, 9], [3, 1, 9], [7, 9, 0], [6, 8, 0], [8, 9, 0], [3, 6, 2],
            [3, 1, 9], [7, 6, 0], [3, 1, 6], [7, 2, 9], [3, 8, 0], [3, 1, 9],
            [7, 2, 8], [7, 1, 6]]

digits = Set.new(attempts.flatten).to_a
p digits.to_a

passwords = Array.new
digits.each do |d|
  passwords[d] = []
end

attempts.each do |attempt|
  unless passwords[attempt[1]].include? attempt[0]
    # puts "Adding #{attempt[0]} to #{passwords[attempt[1]].inspect}"
    passwords[attempt[1]] << attempt[0] 
  end
  unless passwords[attempt[2]].include? attempt[0]
    # puts "Adding #{attempt[0]} to #{passwords[attempt[2]].inspect}"
    passwords[attempt[2]] << attempt[0] 
  end
  unless passwords[attempt[2]].include? attempt[1]
    # puts "Adding #{attempt[1]} to #{passwords[attempt[2]].inspect}"
    passwords[attempt[2]] << attempt[1] 
  end
end
passwords.reject! {|a| a.nil?}.sort! do |a, b|
  b.length <=> a.length
end

p passwords[0]