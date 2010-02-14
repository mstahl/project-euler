#!/usr/bin/env ruby -wKU

require 'pp'

def fact(n)
  if n < 2 then 1 else n * fact(n - 1) end
end

def choose(n, r)
  fact(n) / (fact(r) * fact(n - r))
end

over = 0
(1..100).each do |n|
  (1..100).each do |r|
    if choose(n, r) > 1000000 then
      over += 1
    end
  end
end
p over