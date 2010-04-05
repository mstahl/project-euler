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

attempts = [[3, 1, 9], [6, 8, 0], [1, 8, 0], [6, 9, 0], [1, 2, 9], [6, 2, 0],
            [7, 6, 2], [6, 8, 9], [7, 6, 2], [3, 1, 8], [3, 6, 8], [7, 1, 0],
            [7, 2, 0], [7, 1, 0], [6, 2, 9], [1, 6, 8], [1, 6, 0], [6, 8, 9],
            [7, 1, 6], [7, 3, 1], [7, 3, 6], [7, 2, 9], [3, 1, 6], [7, 2, 9],
            [7, 2, 9], [7, 1, 0], [7, 6, 9], [2, 9, 0], [7, 1, 9], [6, 8, 0],
            [3, 1, 8], [3, 8, 9], [1, 6, 2], [2, 8, 9], [1, 6, 2], [7, 1, 8],
            [7, 2, 9], [3, 1, 9], [7, 9, 0], [6, 8, 0], [8, 9, 0], [3, 6, 2],
            [3, 1, 9], [7, 6, 0], [3, 1, 6], [7, 2, 9], [3, 8, 0], [3, 1, 9],
            [7, 2, 8], [7, 1, 6]]

alphabet = attempts.flatten.to_set

befores = Hash.new
(alphabet.to_a).each do |d|
  befores[d] = []
end

attempts.each do |a|
  befores[a[2]] << a[1]
  befores[a[2]] << a[0]
  befores[a[1]] << a[0]
end

befores.each do |k, v|
  v.uniq!
end

answer = befores.keys.sort  {|a, b|
  befores[a].length <=> befores[b].length
}

answer = answer.map {|l| l.to_s}.join

puts answer