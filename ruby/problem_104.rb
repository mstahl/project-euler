# The Fibonacci sequence is defined by the recurrence relation:
# 
# Fn = Fn1 + Fn2, where F1 = 1 and F2 = 1.
# 
# It turns out that F541, which contains 113 digits, is the first Fibonacci
# number for which the last nine digits are 1-9 pandigital (contain all the
# digits 1 to 9, but not necessarily in order). And F2749, which contains 575
# digits, is the first Fibonacci number for which the first nine digits are 1-9
# pandigital.
# 
# Given that Fk is the first Fibonacci number for which the first nine digits
# AND the last nine digits are 1-9 pandigital, find k.
#
# http://projecteuler.net/problem=104

class Fibonacci
  attr_accessor :i

  def initialize
    @fibonaccis = [0, 1]
  end

  def next
    @i ||= 0
    @i += 1
    @fibonaccis[@i] ||= @fibonaccis[@i - 2] + @fibonaccis[@i - 1]
  end
end

def pandigital?(str)
  (%w{1 2 3 4 5 6 7 8 9} - str.split(//)) == []
end

fibonacci = Fibonacci.new
f = 1
until pandigital?(f.to_s[0..9]) and pandigital?(f.to_s[-9..-1])
  f = fibonacci.next
  puts "f_#{fibonacci.i} = #{f}"
end
p f
p fibonacci.i
