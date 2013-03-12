# The Fibonacci sequence is defined by the recurrence relation:
# 
# Fn = Fn1 + Fn2, where F1 = 1 and F2 = 1.
# Hence the first 12 terms will be:
# 
# F1 = 1
# F2 = 1
# F3 = 2
# F4 = 3
# F5 = 5
# F6 = 8
# F7 = 13
# F8 = 21
# F9 = 34
# F10 = 55
# F11 = 89
# F12 = 144
# 
# The 12th term, F12, is the first term to contain three digits.
# 
# What is the first term in the Fibonacci sequence to contain 1000 digits?
#
# http://projecteuler.net/problem=25

class Fibonacci
  def initialize
    @fibs = [0, 1]
  end

  def compute(index)
    raise ArgumentError if index < 0
    @fibs[index] ||= compute(index - 2) + compute(index - 1)
  end
end

fib = Fibonacci.new
i = 0
until fib.compute(i).to_s.length == 1000
  i += 1
end

puts i
