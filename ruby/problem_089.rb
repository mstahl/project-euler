#!/usr/bin/env ruby -wKU
# 
# The rules for writing Roman numerals allow for many ways of writing each
# number (see FAQ: Roman Numerals). However, there is always a "best" way of
# writing a particular number.
# 
# For example, the following represent all of the legitimate ways of writing
# the number sixteen:
# 
# IIIIIIIIIIIIIIII
# VIIIIIIIIIII
# VVIIIIII
# XIIIIII
# VVVI
# XVI
# 
# The last example being considered the most efficient, as it uses the least
# number of numerals.
# 
# The 11K text file, roman.txt (right click and 'Save Link/Target As...'),
# contains one thousand numbers written in valid, but not necessarily minimal,
# Roman numerals; that is, they are arranged in descending units and obey the
# subtractive pair rule (see FAQ for the definitive rules for this problem).
# 
# Find the number of characters saved by writing each of these in their
# minimal form.
# 
# Note: You can assume that all the Roman numerals in the file contain no more
# than four consecutive identical units.
# 
# http://projecteuler.net/index.php?section=problems&id=89

@decs = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
@romans = %w{M CM D CD C XC L XL X IX V IV I}

def dec_to_roman(decs, romans, n, sofar)
  unless decs.empty?
    if n < decs.first then
      dec_to_roman(decs[1..-1], romans[1..-1], n, sofar)
    else
      dec_to_roman(decs, romans, n - decs.first, sofar.push(romans.first))
    end
  else
    sofar.join
  end
end

def to_roman(n)
  dec_to_roman(@decs, @romans, n, [])
end

chars_saved = 0
IO.readlines('roman.txt') do |l|
  l.strip!
  

# Algorithm lifted from:
# http://code.activestate.com/recipes/415384-decimal-to-roman-numerals/