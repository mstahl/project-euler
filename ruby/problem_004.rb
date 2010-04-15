


class Fixnum
  def digits
    d = []
    n = self
    until n < 10 do
      d << n % 10
      n /= 10
    end
    d << n
    return d.reverse
  end
  
  def palindrome?
    d = self.digits
    d == d.reverse
  end
end

biggest = 0
(100..999).each do |a|
  (100..a).each do |b|
    product = a * b
    biggest = product if product > biggest and product.palindrome?
  end
end
p biggest
