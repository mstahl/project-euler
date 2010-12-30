#!/usr/bin/env ruby -wKU
# 
# Using all of the digits 1 through 9 and concatenating them freely to form
# decimal integers, different sets can be formed. Interestingly with the set
# {2,5,47,89,631}, all of the elements belonging to it are prime.
# 
# How many distinct sets containing each of the digits one through nine
# exactly once contain only prime elements?
# 
# http://projecteuler.net/index.php?section=problems&id=118

require 'rubygems'
require 'mathn'
require 'set'

require 'pp'

primes_list = []
primes_obj = Prime.new
p = primes_obj.succ
until p > 98765432 do
  primes_list << primes_obj.succ
end

pp primes_list