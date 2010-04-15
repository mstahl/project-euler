





def divisible_by_all(n)
  (2..20).each do |d|
    if n % d != 0 then
      return false
    end
  end
  return true
end

n = 20
until divisible_by_all(n) do
  n += 1
end
p n
