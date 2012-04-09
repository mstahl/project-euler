#!/usr/bin/env ruby -wKU
# 
# The first number n for which φ(n)=13! is 6227180929.
# Find the 150,000th such number.
# 
# Note: The number to find has been changed recently. Check out that you have
# computed the right number.

require 'pp'
require './Totient.rb'

totes = inverse_totient(13*12*11*10*9*8*7*6*5*4*3*2*1)

pp totes
p totes[150_000]
