#!`which ruby`

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

generator = LaggedFibonacciGenerator.new

grid = [[]] * 2000
(1..4000000).each_with_index do |k, i|
  
