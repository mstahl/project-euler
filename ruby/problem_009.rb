



(3..1000).each do |c|
  (2..c).each do |b|
    (1..b).each do |a|
      next unless a < b and b < c and a + b + c == 1000
      if c * c == a * a + b * b then
        p [a, b, c]
        p a * b * c
        exit
      end
    end
  end
end
