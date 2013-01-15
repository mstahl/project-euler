#!`which ruby`

module MillerRabin
  def self.is_prime?(n)
    return false if n == 1
    return true if n == 2
    return true if n == 3
    return false if n % 2 == 0

    s, d = find_sd(n - 1)

    a_values_for(n).each do |a|
      catch :loop do
        x = (a ** d) % n
        next if [1, n - 1].include?(x)

        (1..(s - 1)).each do |r|
          x = (x * x) % n
          return false if x == 1
          throw :loop if x == n - 1
        end
        return false
      end
      
    end

    return true
  end

  def self.find_sd(m)
    (0..(Math.log(m)/Math.log(2)).floor).to_a.reverse.each do |s|
      if m % (2 ** s) == 0 then
        return s, m / (2 ** s)
      end
    end
  end

  private

  def self.a_values_for(n)
    if n < 1_373_653
      [2, 3]
    elsif n < 9_080_191
      [31, 73]
    elsif n < 4_759_123_141
      [2, 7, 61]
    elsif n < 2_152_302_898_747
      [2, 3, 5, 7, 11]
    elsif n < 3_474_749_660_383
      [2, 3, 5, 7, 11, 13]
    elsif n < 341_550_071_728_321
      [2, 3, 5, 7, 11, 13, 17]
    else
      (2..[n - 1, (2 * Math.log(n)**2).floor].min).to_a
    end
  end
end
