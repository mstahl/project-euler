#!/usr/bin/ruby1.9.1
# 
# Totient.rb
# 
# Module for computing fast Totient functions.

require 'mathn'

class Fixnum
  def divisors
    n = self
    
    (1..n).collect {|x| x if n % x == 0}.compact
  end
  
  def prime_factors
    n = self
    
    Prime.prime_division(n).map {|x| x[0]}.reject {|x| x == n}
  end
end

def totient(n)
  if n < 2 then
    1
  else
    (n * Prime.prime_division(n).map {|x| 1 - 1.0/x[0]}.inject(1) {|p, x| p * x}).floor
  end
end

@@inverse_totients = Hash.new
def inverse_totient(m)
  if m < 1 then
    return []
  elsif m == 1 then
    return [1, 2]
  end
  
  if m.odd? and m > 1 then
    return []
  end
  
  # Memoization test
  if @@inverse_totients[m] then
    return @@inverse_totients[m]
  end
  
  # puts "*** In inverse_totient(#{m})"
  
  # Let totient(n) = m, so that n is the inverse-totient of m.
  # Let n = p^d * u, where p is the smallest prime factor of n.
  available_primes = m.divisors.map {|x| x + 1}.reject {|x| !Prime.prime? x}.reverse
  returnable = []
  
  # puts "*** In inverse_totient(#{m}): primes: #{available_primes.inspect}"
  
  available_primes.each do |p|
    # puts "prime p = #{p}"
    (1..Math.log(m, p).ceil).each do |d|
      q = p ** d
      totq = totient q
      quotient,remainder = m.divmod(totq)
      
      # puts "In innermost loop. #{m}/#{totient(p ** d)}: q=#{quotient}, r=#{remainder}, p=#{p}, d=#{d}"
      
      if remainder != 0 then
        # puts "Skipping. q=#{quotient}, r=#{remainder}, p=#{p}, d=#{d}"
        next
      end
      
      u_values = []
      if totq == 1 then
        # puts "!!!!!! Condition caught in invtot(#{m}) with p=#{p}, d=#{d}, returnables=#{returnable.inspect}"
        u_values = returnable.reject {|x| x.even?}    # Don't use even numbers from first step
      else
        # puts "{"
        u_values = inverse_totient(quotient)
        # puts "   totient^(-1)(#{quotient}) = #{u_values.inspect}"
        # puts "}"
      end
      
      u_values.each do |u|
        # puts "u=#{u}"
        unless u.prime_factors.reject {|x| x > p}.length > 0
          # Only use values of u that have no prime factor less than or equal to p
          returnable << u * (p ** d)
          # puts "Added #{returnable[-1]}"
        else
          # puts "d'oh"
        end
      end
    end
  end
  @@inverse_totients[m] = returnable.uniq.sort #.reject {|x| totient(x) != m}
  return @@inverse_totients[m]
end

if __FILE__ == $0 then
  # p totient(576)
  # p totient(13)
  
  # p 576.divisors
  
  p inverse_totient(576)
  p inverse_totient(6)
  
  # p totient(9)
  
  # p 156852.prime_factors
  # p 2.prime_factors
end

