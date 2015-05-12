# Include Euler::Factorization in fixnums or integer data types to enable
# #factors and #prime_factors methods.
module Euler
  module Factorization

    def factors
      (1..self/2).select {|f| self % f == 0}
    end

  end
end

class Fixnum
  include Euler::Factorization
end
